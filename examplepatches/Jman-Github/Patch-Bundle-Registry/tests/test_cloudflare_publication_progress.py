import hashlib
import json
import threading
from pathlib import Path

import pytest
from test_cloudflare_catalog import MemoryCloud, archive, catalog, release

from scripts import cloudflare_catalog as cloud
from scripts import cloudflare_progress as logging
from scripts.cloudflare_storage import BlobCache


def events(capsys, key="cloudflare_progress"):
    return [
        event[key]
        for line in capsys.readouterr().out.splitlines()
        if line.startswith("{") and key in (event := json.loads(line))
    ]


def test_progress_reports_elapsed_counts_and_failure_without_a_deadline(monkeypatch, capsys):
    clock = [0]
    monkeypatch.setattr(logging.time, "perf_counter", lambda: clock[0])
    with pytest.raises(ValueError, match="interrupted"), logging.Progress("test", 5) as progress:
        clock[0] = 11
        progress.update(2)
        clock[0] = 100_000  # Reporting does not stop long operations.
        progress.update(4)
        raise ValueError("interrupted")
    output = events(capsys)
    assert [row["status"] for row in output] == ["started", "running", "running", "failed"]
    assert output[-1]["completed"] == 4
    assert output[-1]["total"] == 5
    assert output[-1]["elapsed_seconds"] == 100_000


def test_parallel_transfers_preserve_order_despite_out_of_order_completion(tmp_path, capsys):
    cache = BlobCache(tmp_path, None, None, workers=2)
    second = threading.Event()

    def action(index):
        if index == 0:
            assert second.wait(5)
        else:
            second.set()
        return index * 2

    assert cache.parallel(action, [0, 1], operation="ordered") == [0, 2]
    output = events(capsys)
    assert output[-1] == {
        **output[-1],
        "operation": "ordered",
        "status": "completed",
        "completed": 2,
        "total": 2,
    }


def test_parallel_transfer_failure_is_logged_and_propagated(tmp_path, capsys):
    cache = BlobCache(tmp_path, None, None)
    with pytest.raises(ValueError, match="corrupt"):
        cache.parallel(lambda _: (_ for _ in ()).throw(ValueError("corrupt")), [1])
    assert events(capsys)[-1]["status"] == "failed"


def test_known_snapshot_files_are_hashed_once_and_still_checked(tmp_path, monkeypatch):
    body = b'{"unchanged":true}'
    path = tmp_path / "snapshot.json"
    path.write_bytes(body)
    digest = hashlib.sha256(body).hexdigest()
    cache = BlobCache(tmp_path / "cache", None, lambda *args: pytest.fail("Unchanged upload"))
    reads = []
    read = Path.read_bytes

    def counted(target):
        if target == path:
            reads.append(target)
        return read(target)

    monkeypatch.setattr(Path, "read_bytes", counted)
    expected = {"snapshot.json": {"sha256": digest}}
    assert cache.upload_files({"snapshot.json": path}, {digest}, expected=expected) == {
        "snapshot.json": digest
    }
    assert len(reads) == 1
    path.write_bytes(b"corrupt")
    with pytest.raises(ValueError, match="Local catalog integrity"):
        cache.upload_files({"snapshot.json": path}, {digest}, expected=expected)


def test_larger_d1_batches_preserve_versions_and_expire_only_selected_keys(tmp_path, monkeypatch):
    memory = MemoryCloud(tmp_path)
    monkeypatch.setattr(cloud, "ROOT", tmp_path)
    rows = [("app", str(i), 1, "{}", "first") for i in range(2435)]
    memory.insert_rows(rows)
    assert memory.inserts == 3
    memory.insert_rows([(kind, key, 2, body, "second") for kind, key, _, body, _ in rows])
    assert memory.inserts == 6
    memory.expire_rows(3, [("app", str(i)) for i in range(2100)])
    assert memory.transfers().metrics["d1_expire_batches"] == 3
    assert memory.sql("SELECT COUNT(*) AS n FROM catalog_records WHERE to_seq IS NULL") == [
        {"n": 335}
    ]
    assert memory.sql(
        "SELECT COUNT(*) AS n FROM catalog_records WHERE from_seq=1 AND to_seq=2"
    ) == [{"n": 2435}]


def test_publication_records_phase_timings_and_verifies_before_activation(
    tmp_path, monkeypatch, capsys
):
    memory = MemoryCloud(tmp_path)
    monkeypatch.setattr(cloud, "ROOT", tmp_path)
    catalog(tmp_path)
    memory.publish()
    active = memory.active()
    timings = memory.publication_metrics["publication_phases"]
    assert {
        "upload_snapshot",
        "insert_d1_records",
        "verify_new_objects",
        "activate_generation",
    } <= {row["phase"] for row in timings}
    assert all(row["elapsed_seconds"] >= 0 for row in timings)
    capsys.readouterr()
    archive(tmp_path, [release(1, body="New generation")])
    get = memory.get

    def corrupt(key):
        if key.startswith("objects/"):
            return b"corrupt remote content"
        return get(key)

    # Cached old objects remain readable, but new objects must be fetched and verified.
    monkeypatch.setattr(memory, "get", corrupt)
    memory.transfers().get = corrupt
    with pytest.raises(ValueError, match="integrity"):
        memory.publish()
    assert memory.active() == active
    output = events(capsys)
    assert any(
        row["operation"] == "verify_new_objects" and row["status"] == "failed" for row in output
    )
    assert not any(row["operation"] == "activate_generation" for row in output)


def test_sparse_cleanup_skips_writes_for_unrelated_pages(tmp_path, monkeypatch):
    memory = MemoryCloud(tmp_path)
    monkeypatch.setattr(cloud, "ROOT", tmp_path)
    rows = [("app", str(i), 1, "{}", "first") for i in range(10_001)]
    memory.insert_rows(rows)
    memory.insert_rows([("app", "5000", 2, "{}", "pending")])
    statements = []
    sql = memory.sql

    def record(statement, params=()):
        statements.append(statement)
        return sql(statement, params)

    monkeypatch.setattr(memory, "sql", record)
    memory.cleanup_records("DELETE FROM catalog_records WHERE from_seq=?", [2])
    assert len(statements) == 3  # Two bounded scans and one matching-row delete.
    assert memory.transfers().metrics["d1_cleanup_batches"] == 1
    assert memory.sql("SELECT COUNT(*) AS n FROM catalog_records") == [{"n": 10_001}]
    statements.clear()
    memory.cleanup_records("DELETE FROM catalog_records WHERE from_seq=?", [99])
    assert len(statements) == 2
    assert all(statement.startswith("SELECT") for statement in statements)


def test_workflow_exposes_validation_and_publication_separately_without_step_time_limits():
    workflow = (cloud.ROOT / ".github/workflows/catalog-updater.yml").read_text(encoding="utf-8")
    job = workflow.split("  cloudflare:", 1)[1]
    assert job.index("Validate catalog snapshot") < job.index("Publish catalog atomically")
    assert "python -u scripts/validate_database.py" in job
    assert "python -u -m scripts.cloudflare_catalog publish" in job
    assert "timeout-minutes:" not in job


def test_retention_reports_progress_after_each_bucket_page(tmp_path, monkeypatch, capsys):
    memory = MemoryCloud(tmp_path)
    monkeypatch.setattr(cloud, "ROOT", tmp_path)
    catalog(tmp_path)
    memory.publish()
    capsys.readouterr()
    clock = [0]
    monkeypatch.setattr(logging.time, "perf_counter", lambda: clock[0])
    keys = list(memory.objects)
    pages = [keys[:2], keys[2:4], keys[4:]]

    class Paginator:
        def paginate(self, **kwargs):
            for page in pages:
                clock[0] += 11
                yield {"Contents": [{"Key": key} for key in page]}

    memory.s3.get_paginator = lambda name: Paginator()
    memory.prune(None, verify=False)
    running = [
        event for event in events(capsys)
        if event["operation"] == "r2_list_retention" and event["status"] == "running"
    ]
    assert [event["objects_scanned"] for event in running] == [2, 4, len(keys)]


def test_sparse_cleanup_bounds_database_work_per_select(tmp_path, monkeypatch):
    memory = MemoryCloud(tmp_path)
    monkeypatch.setattr(cloud, "ROOT", tmp_path)
    memory.database.executemany(
        "INSERT INTO catalog_records(kind,record_key,from_seq,data,content_hash)"
        " VALUES('app',?,1,'{}','hash')",
        [(str(index),) for index in range(100_001)],
    )
    memory.database.commit()
    sql = memory.sql
    reads = []

    def bounded(statement, params=()):
        if not statement.startswith("SELECT rowid"):
            return sql(statement, params)
        ticks = 0

        def budget():
            nonlocal ticks
            ticks += 1
            return ticks > 200

        # Bound SQLite work in this test, not production elapsed time.
        # An output LIMIT must not hide a scan of every nonmatching row.
        memory.database.set_progress_handler(budget, 1000)
        try:
            result = sql(statement, params)
        finally:
            memory.database.set_progress_handler(None, 0)
        reads.append(ticks)
        return result

    monkeypatch.setattr(memory, "sql", bounded)
    memory.cleanup_records("DELETE FROM catalog_records WHERE from_seq=?", [99])
    assert len(reads) > 1
    assert memory.transfers().metrics.get("d1_cleanup_batches", 0) == 0
    assert memory.sql("SELECT COUNT(*) AS n FROM catalog_records") == [{"n": 100_001}]
