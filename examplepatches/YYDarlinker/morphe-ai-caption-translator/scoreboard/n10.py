"""N10 startup timing mirror from the frozen device trace; no network calls."""
from __future__ import annotations

import json
import re

import n9
import run

RESULT = run.ROOT / "scoreboard/results/n10-startup.json"
TRACE_LINE = re.compile(r"^(\d+) \| ([A-Z_0-9]+) \| (.*)$")


def _history() -> list[dict]:
    lines = n9.DIAG.read_text(encoding="utf-8").splitlines()
    begin = lines.index("[Extended history: chronological; last 24h; up to 8 MiB per channel]")
    end = lines.index("[Extended quality evidence; captured only while debug enabled]")
    rows = []
    for number in range(begin + 1, end):
        match = TRACE_LINE.fullmatch(lines[number])
        if match:
            stamp, kind, detail = match.groups()
            rows.append({"at": int(stamp), "kind": kind, "line": number + 1,
                         **run.fields(detail)})
    return rows


def score() -> dict:
    run.ensure(run.sha256(n9.DIAG) == n9.DIAG_SHA256, "N10 diagnostic fingerprint changed")
    rows = _history()
    engine = next(row for row in rows if row["kind"] == "CAPTION_REBUILD_R2"
                  and row.get("session") == "1")
    anchor = next(row for row in rows if row["at"] >= engine["at"]
                  and row["kind"] == "REBUILD_PRESENTED" and row.get("mode") == "status"
                  and row.get("text") == "字幕准备中…")
    raw_source = next(row for row in rows if row["at"] > anchor["at"]
                      and row["kind"] == "SOURCE_OK")
    source = next(row for row in rows if row["at"] > anchor["at"]
                  and row["kind"] == "REBUILD_SOURCE_READY")
    first = next(row for row in rows if row["at"] > anchor["at"]
                 and row["kind"] == "REBUILD_PRESENTED" and row.get("mode") == "caption"
                 and row.get("text", "").strip())
    run.ensure(anchor["at"] < raw_source["at"] < source["at"] < first["at"],
               "N10 startup order changed")
    source_ready_ms = source["at"] - anchor["at"]
    first_content_ms = first["at"] - anchor["at"]
    return {
        "layer": "n10_frozen_startup_plus_policy_mirror",
        "input_sha256": {"diagnostics": n9.DIAG_SHA256},
        "anchor": {"kind": "first_preparing_status_presented", "at": anchor["at"],
                   "line": anchor["line"]},
        "frozen": {"source_ready_ms": source_ready_ms,
                   "first_content_ms": first_content_ms,
                   "source_ready_at": source["at"], "source_ready_line": source["line"],
                   "first_content_at": first["at"], "first_content_line": first["line"],
                   "first_content_id": first["id"]},
        "policy_mirror": {"source_ready_ms": source_ready_ms,
                          "raw_source_available_ms": raw_source["at"] - anchor["at"],
                          "raw_source_available_at": raw_source["at"],
                          "raw_source_available_line": raw_source["line"],
                          "first_content_ms": raw_source["at"] - anchor["at"],
                          "timing_kind": "earliest_raw_source_eligible_floor",
                          "device_presented_verified": False},
        "limits": [
            "Frozen elapsed times start at the first preparing-status PRESENTED record, not player load.",
            "The policy mirror's first_content_ms is an eligibility floor at raw source availability, not measured display latency.",
            "No new Android startup trace or API request was used."
        ],
    }


def main() -> None:
    result = score()
    RESULT.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"N10: source {result['frozen']['source_ready_ms']} ms; "
          f"first body {result['frozen']['first_content_ms']} ms; {RESULT}")


if __name__ == "__main__":
    main()
