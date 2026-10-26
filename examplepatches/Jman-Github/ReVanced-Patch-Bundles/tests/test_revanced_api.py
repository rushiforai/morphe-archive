"""Official ReVanced discovery uses API history rather than Git attachments."""

import asyncio
import copy
import json

import httpx
import pytest

from scripts import discover_releases as discovery
from scripts.git_hosts import normalize_source
from scripts.release_archive import reconcile_archive, stable_id
from scripts.revanced_api import GIT_RELEASES_URL, HISTORY_URL, OFFICIAL_SOURCE, release_inventory

CANONICAL_SOURCE = normalize_source(OFFICIAL_SOURCE).lower()


def document():
    def release(version, prerelease, date):
        return {
            "version": version,
            "created_at": date,
            "description": f"Notes {version}",
            "download_url": f"https://api.revanced.app/v5/patches-{version}.rvp",
            "signature_download_url": f"https://api.revanced.app/v5/patches-{version}.rvp.asc",
            "prerelease": prerelease,
        }
    return [
        release("6.2.1", False, "2026-06-02T18:30:00Z"),
        release("6.3.0-dev.1", True, "2026-06-03T18:30:00Z"),
        release("6.2.0", False, "2026-05-01T18:30:00Z"),
    ]


@pytest.fixture
def state(tmp_path, monkeypatch):
    monkeypatch.setattr(discovery, "RELEASE_CACHE_FILE", tmp_path / "release_cache.json")
    monkeypatch.setattr(discovery, "RELEASE_CACHE", {})
    monkeypatch.setattr(discovery, "RELEASE_REQUESTS", {})
    monkeypatch.setattr(discovery, "RELEASE_COOLDOWNS", {})
    monkeypatch.setattr(discovery, "HTTP_SEMAPHORE", asyncio.Semaphore(6))
    monkeypatch.setenv("GH_PAT", "secret-github-token")
    return tmp_path


def test_channels_share_api_history_and_cache(state):
    requests = []

    def handler(request):
        requests.append(request)
        assert str(request.url) == HISTORY_URL
        assert "authorization" not in request.headers
        assert "private-token" not in request.headers
        if len(requests) == 2:
            assert request.headers["if-none-match"] == '"history"'
            return httpx.Response(304)
        return httpx.Response(200, json=document(), headers={"ETag": '"history"'})

    async def run():
        async with httpx.AsyncClient(transport=httpx.MockTransport(handler)) as client:
            selected = await asyncio.gather(
                discovery.get_latest_release(client, OFFICIAL_SOURCE, False),
                discovery.get_latest_release(client, OFFICIAL_SOURCE, True),
                discovery.get_latest_release(client, OFFICIAL_SOURCE, False, True),
            )
            assert [row[0] for row in selected] == [
                "v6.2.1", "v6.3.0-dev.1", "v6.3.0-dev.1",
            ]
            assert selected[0][2] == "Notes 6.2.1"
            assert selected[0][3][".rvp"] == document()[0]["download_url"]
            assert selected[0][4] == document()[0]["signature_download_url"]
            assert len(requests) == 1
            discovery.RELEASE_REQUESTS.clear()
            again = await discovery.get_latest_release(client, OFFICIAL_SOURCE, False)
            assert again == selected[0]

    asyncio.run(run())
    assert len(requests) == 2
    assert GIT_RELEASES_URL not in discovery.RELEASE_CACHE
    checkpoints = list((state / "release-pages").glob("*.json"))
    assert len(checkpoints) == 1
    assert HISTORY_URL in json.loads(checkpoints[0].read_text())


@pytest.mark.parametrize("mutation", [
    lambda data: data.append("not-a-dict"),
    lambda data: data.append(None),
    lambda data: data[0].update(version=""),
    lambda data: data[0].update(created_at=""),
    lambda data: data[0].update(prerelease="false"),
    lambda data: data[0].update(download_url="https://example.test/index.json"),
    lambda data: data[0].update(signature_download_url="http://insecure.test/patches.asc"),
    lambda data: data.append(copy.deepcopy(data[0])),
])
def test_invalid_api_inventory_is_not_cached(state, mutation):
    data = document()
    mutation(data)

    async def run():
        async with httpx.AsyncClient(
            transport=httpx.MockTransport(lambda request: httpx.Response(200, json=data))
        ) as client:
            with pytest.raises(ValueError):
                await discovery.get_latest_release(client, OFFICIAL_SOURCE, False)

    asyncio.run(run())
    assert not discovery.RELEASE_CACHE
    assert not (state / "release-pages").exists()


def test_release_inventory_supports_dict_and_omitted_signatures():
    single = {
        "version": "6.2.1",
        "created_at": "2026-06-02T18:30:00Z",
        "description": "Release notes",
        "download_url": "https://api.revanced.app/v5/patches.rvp",
    }
    inventory = release_inventory(single)
    assert len(inventory) == 1
    assert inventory[0]["tag_name"] == "v6.2.1"
    assert inventory[0]["prerelease"] is False
    assert len(inventory[0]["assets"]) == 1
    assert inventory[0]["assets"][0]["name"] == "patches.rvp"

    wrapped = {"releases": [single]}
    assert release_inventory(wrapped) == inventory

    # Dev tag without explicit prerelease field
    dev_single = copy.deepcopy(single)
    dev_single["version"] = "v6.3.0-dev.1"
    dev_inventory = release_inventory(dev_single)
    assert dev_inventory[0]["prerelease"] is True


def test_archive_keeps_git_release_identity_when_migrating_to_api(tmp_path):
    (tmp_path / "config").mkdir()
    inventory = {"revanced": {"patches": OFFICIAL_SOURCE}}
    rows = release_inventory(document())
    legacy = copy.deepcopy(rows[0])
    legacy["id"] = 789
    original = reconcile_archive(tmp_path, inventory, {CANONICAL_SOURCE: [legacy]})
    identity = stable_id(CANONICAL_SOURCE, "789")
    first_seen = original["releases"][identity]["first_seen_at"]

    archive = reconcile_archive(tmp_path, inventory, {CANONICAL_SOURCE: rows})
    assert len(archive["releases"]) == 3
    assert archive["releases"][identity]["availability"] == "available"
    assert archive["releases"][identity]["upstream_id"] == "789"
    assert archive["releases"][identity]["first_seen_at"] == first_seen
    assert archive["releases"][identity]["changelog"] == "Notes 6.2.1"
    assert archive["sources"][CANONICAL_SOURCE]["status"] == "complete"


def test_discovery_publishes_api_channels_and_full_history(state, monkeypatch):
    (state / "config").mkdir()
    inventory = {"revanced": {"patches": OFFICIAL_SOURCE}}
    cache = state / "internal/cache"
    monkeypatch.setattr(discovery, "PROJECT_ROOT", state)
    monkeypatch.setattr(discovery, "PATCH_BUNDLES_DIR", cache / "bundles")
    monkeypatch.setattr(discovery, "METADATA_PATH", cache / "bundle-run-metadata.json")
    monkeypatch.setattr(discovery, "_load_sources_sync", lambda: inventory)
    requests = []

    def handler(request):
        requests.append(str(request.url))
        assert str(request.url) == HISTORY_URL
        return httpx.Response(200, json=document())

    monkeypatch.setattr(
        discovery, "AsyncClient",
        lambda **kwargs: httpx.AsyncClient(transport=httpx.MockTransport(handler), **kwargs),
    )
    assert asyncio.run(discovery.main()) == 0
    assert requests == [HISTORY_URL]
    for channel, version in [
        ("stable", "v6.2.1"), ("dev", "v6.3.0-dev.1"), ("latest", "v6.3.0-dev.1"),
    ]:
        raw = json.loads(
            (cache / f"bundles/revanced-patch-bundles/revanced-{channel}-patches-bundle.json")
            .read_text()
        )
        assert raw["version"] == version
        assert raw["description"] == f"Notes {version[1:]}"
        assert raw["bundle_type"] == "ReVanced:v22"
        assert raw["download_url"].startswith("https://api.revanced.app/v5/patches-")
        assert raw["signature_download_url"].endswith(".asc")
    archive = json.loads((cache / "history/archive.json").read_text())
    assert len(archive["releases"]) == 3
    historical = json.loads((cache / "history/sources.json").read_text())
    assert len(historical) == 3
    assert json.loads((cache / "release-checks.json").read_text()) == {CANONICAL_SOURCE: True}


@pytest.mark.parametrize(("old_id", "current_id"), [(789, 999), (999, 789)])
def test_api_migration_keeps_current_identity_after_git_release_recreation(
    tmp_path, old_id, current_id,
):
    (tmp_path / "config").mkdir()
    inventory = {"revanced": {"patches": OFFICIAL_SOURCE}}
    row = release_inventory(document())[0]
    for upstream_id in (old_id, current_id):
        row["id"] = upstream_id
        reconcile_archive(tmp_path, inventory, {CANONICAL_SOURCE: [row]})
    del row["id"]

    archive = reconcile_archive(tmp_path, inventory, {CANONICAL_SOURCE: [row]})
    current = archive["releases"][stable_id(CANONICAL_SOURCE, str(current_id))]
    retired = archive["releases"][stable_id(CANONICAL_SOURCE, str(old_id))]
    assert current["availability"] == "available"
    assert retired["availability"] == "unavailable"
    # Subsequent API refreshes must keep the same public release link too.
    again = reconcile_archive(tmp_path, inventory, {CANONICAL_SOURCE: [row]})
    assert again["releases"][current["id"]]["availability"] == "available"
