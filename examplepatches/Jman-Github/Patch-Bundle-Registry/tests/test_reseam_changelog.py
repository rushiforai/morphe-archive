"""Reseam patches.json release descriptions are optional, bounded archive enrichment."""

import asyncio
import json

import httpx

from scripts import reseam_changelog as reseam
from scripts.release_archive import reconcile_archive, stable_id
from scripts.release_history import save_history

SOURCE = "https://git.reseam.app/reseam/patches"
ASSET = "https://git.reseam.app/reseam/patches/releases/download/v0.34.0/patches.json"


def release(tag="v0.34.0", *, body="", asset=ASSET, metadata=True):
    assets = [{
        "name": "reseam-patches.reseam",
        "browser_download_url": f"https://git.reseam.app/reseam/patches/releases/download/{tag}/reseam-patches.reseam",
    }]
    if metadata:
        assets.append({"name": "patches.json", "browser_download_url": asset})
    return {
        "id": 123,
        "tag_name": tag,
        "body": body,
        "published_at": "2026-10-14T17:54:23Z",
        "assets": assets,
    }


def document(version="0.34.0", text="- feat: release-specific notes"):
    return {
        "bundle": {"name": "reseam-patches"},
        "releases": [
            {"version": "0.33.0", "description": "Wrong release", "patches": []},
            {"version": version, "description": text, "patches": [{"id": "patch"}]},
        ],
    }


def configure(tmp_path):
    path = tmp_path / "config/git-hosts.json"
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps({"git.reseam.app": "gitea"}))
    return {"reseam": {"patches": SOURCE}}


def run(client, root, releases):
    return asyncio.run(reseam.enrich_reseam_releases(client, root, releases))


def test_metadata_asset_must_be_the_unique_same_host_release_attachment():
    assert reseam.reseam_metadata_asset(SOURCE, release()) == ASSET
    assert reseam.reseam_metadata_asset(SOURCE, release(metadata=False)) is None
    assert reseam.reseam_metadata_asset(
        SOURCE, release(asset="https://evil.example/releases/download/v0.34.0/patches.json")
    ) is None
    assert reseam.reseam_metadata_asset(
        SOURCE, release(asset="http://git.reseam.app/patches.json")
    ) is None
    assert reseam.reseam_metadata_asset(
        SOURCE,
        release(asset="https://git.reseam.app/other/releases/download/v0.34.0/patches.json"),
    ) is None
    duplicate = release()
    duplicate["assets"].append(duplicate["assets"][-1])
    assert reseam.reseam_metadata_asset(SOURCE, duplicate) is None
    other_bundle = release()
    other_bundle["assets"][0]["name"] = "patch.jar"
    other_bundle["assets"][0]["browser_download_url"] = "https://git.reseam.app/patch.jar"
    assert reseam.reseam_metadata_asset(SOURCE, other_bundle) is None


def test_changelog_matching_rejects_other_versions_bad_format_and_oversized_notes():
    assert reseam.reseam_release_notes(document(), "v0.34.0") == "- feat: release-specific notes"
    assert reseam.reseam_release_notes(document(), "v0.32.0") is None
    assert reseam.reseam_release_notes(document("0.34.0", ""), "v0.34.0") is None
    assert reseam.reseam_release_notes({"patches": []}, "v0.34.0") is None
    assert reseam.reseam_release_notes(
        document(text="x" * (reseam.MAX_RESEAM_NOTES_BYTES + 1)), "v0.34.0"
    ) is None
    repeated = document()
    repeated["releases"].append(repeated["releases"][-1])
    assert reseam.reseam_release_notes(repeated, "v0.34.0") is None


def test_archive_reuses_unchanged_asset_and_prefers_native_notes(tmp_path, monkeypatch):
    inventory = configure(tmp_path)
    monkeypatch.setenv("GIT_HOST_TOKENS", '{"git.reseam.app":"secret"}')
    requests = []

    def handler(request):
        requests.append(request)
        assert request.headers["Authorization"] == "Bearer secret"
        assert str(request.url) == ASSET
        return httpx.Response(200, json=document())

    async def enrich(releases):
        async with httpx.AsyncClient(transport=httpx.MockTransport(handler)) as client:
            await reseam.enrich_reseam_releases(client, tmp_path, releases)

    first = {SOURCE: [release()]}
    asyncio.run(enrich(first))
    archived = reconcile_archive(tmp_path, inventory, first)
    identity = stable_id(SOURCE, "123")
    assert archived["releases"][identity]["changelog"] == "- feat: release-specific notes"
    assert archived["releases"][identity]["release_notes"] == "- feat: release-specific notes"
    assert archived["releases"][identity]["reseam_metadata_url"] == ASSET
    assert len(requests) == 1

    # A fresh discovery process reuses the committed archive without downloading.
    second = {SOURCE: [release()]}
    asyncio.run(enrich(second))
    again = reconcile_archive(tmp_path, inventory, second)
    assert len(requests) == 1
    assert again["releases"][identity]["changelog"] == "- feat: release-specific notes"

    upstream = {SOURCE: [release(body="Publisher's release notes")]}
    asyncio.run(enrich(upstream))
    preferred = reconcile_archive(tmp_path, inventory, upstream)
    assert preferred["releases"][identity]["changelog"] == "- feat: release-specific notes"
    assert len(requests) == 1
    assert preferred["releases"][identity]["reseam_metadata_description"] == (
        "- feat: release-specific notes"
    )


def test_replaced_asset_same_url_refreshes_changelog(tmp_path):
    inventory = configure(tmp_path)
    calls = []

    def handler(request):
        calls.append(str(request.url))
        return httpx.Response(200, json=document(text=f"Updated #{len(calls)}"))

    async def enrich(releases):
        async with httpx.AsyncClient(transport=httpx.MockTransport(handler)) as client:
            await reseam.enrich_reseam_releases(client, tmp_path, releases)

    old = release()
    old["assets"][-1]["uuid"] = "original"
    first = {SOURCE: [old]}
    asyncio.run(enrich(first))
    reconcile_archive(tmp_path, inventory, first)

    replacement = release()
    replacement["assets"][-1]["uuid"] = "replacement"
    second = {SOURCE: [replacement]}
    asyncio.run(enrich(second))
    result = reconcile_archive(tmp_path, inventory, second)
    assert len(calls) == 2
    assert result["releases"][stable_id(SOURCE, "123")]["changelog"] == "Updated #2"


def test_invalid_success_response_is_retried_after_upstream_recovers(tmp_path):
    inventory = configure(tmp_path)
    calls = []

    def handler(request):
        calls.append(str(request.url))
        if len(calls) == 1:
            # Some proxies return a 200 HTML/error page during an outage.
            return httpx.Response(200, content=b"<html>Upstream unavailable</html>")
        return httpx.Response(200, json=document(text="Recovered notes"))

    async def enrich(records):
        async with httpx.AsyncClient(transport=httpx.MockTransport(handler)) as client:
            await reseam.enrich_reseam_releases(client, tmp_path, records)

    first = {SOURCE: [release(body="Publisher notes")]}
    asyncio.run(enrich(first))
    archived = reconcile_archive(tmp_path, inventory, first)
    identity = stable_id(SOURCE, "123")
    assert archived["releases"][identity]["changelog"] == "Publisher notes"
    assert not archived["releases"][identity].get("reseam_metadata_checked")
    assert archived["releases"][identity]["reseam_metadata_attempted_at"]

    # An unchanged failed response is retried after its cooldown expires.
    archive_file = tmp_path / "internal/cache/history/archive.json"
    archived["releases"][identity]["reseam_metadata_attempted_at"] = (
        "2020-01-01T00:00:00+00:00"
    )
    archive_file.write_text(json.dumps(archived), encoding="utf-8")
    second = {SOURCE: [release(body="Publisher notes")]}
    asyncio.run(enrich(second))
    archived = reconcile_archive(tmp_path, inventory, second)
    assert calls == [ASSET, ASSET]
    assert archived["releases"][identity]["changelog"] == "Recovered notes"
    assert archived["releases"][identity]["reseam_metadata_checked"] is True


def test_failed_metadata_does_not_starve_historical_release_backfill(tmp_path):
    inventory = configure(tmp_path)
    calls = []

    def handler(request):
        calls.append(str(request.url))
        return httpx.Response(200, content=b"Invalid JSON")

    releases = []
    for index in range(reseam.MAX_RESEAM_DOWNLOADS_PER_RUN + 2):
        tag = f"v0.{index}.0"
        item = release(tag, asset=ASSET.replace("v0.34.0", tag))
        item["id"] = index
        item["published_at"] = f"2026-10-{index + 1:02d}T00:00:00Z"
        releases.append(item)

    async def enrich(records):
        async with httpx.AsyncClient(transport=httpx.MockTransport(handler)) as client:
            await reseam.enrich_reseam_releases(client, tmp_path, records)

    first = {SOURCE: releases}
    asyncio.run(enrich(first))
    first_archive = reconcile_archive(tmp_path, inventory, first)
    assert len(calls) == reseam.MAX_RESEAM_DOWNLOADS_PER_RUN

    second = {SOURCE: [dict(item) for item in releases]}
    asyncio.run(enrich(second))
    second_archive = reconcile_archive(tmp_path, inventory, second)
    assert len(calls) == len(releases)
    assert len(set(calls)) == len(releases)
    # A cached release page may carry old enrichment. Its retry time must not
    # slide forward each refresh, or the failed version is never retried.
    first_identity = stable_id(SOURCE, str(releases[-1]["id"]))
    assert second_archive["releases"][first_identity]["reseam_metadata_attempted_at"] == (
        first_archive["releases"][first_identity]["reseam_metadata_attempted_at"]
    )


def test_selected_stable_release_is_fetched_before_newer_unselected_history(tmp_path):
    configure(tmp_path)
    calls = []

    def handler(request):
        tag = str(request.url).split("/")[-2]
        calls.append(tag)
        return httpx.Response(200, json=document(tag.removeprefix("v"), "Notes " + tag))

    releases = []
    for index in range(30):
        tag = f"v0.{index}.0"
        item = release(tag, asset=ASSET.replace("v0.34.0", tag))
        item["id"] = index
        item["published_at"] = f"2026-10-{index + 1:02d}T00:00:00Z"
        releases.append(item)
    records = {SOURCE: releases}

    async def enrich():
        async with httpx.AsyncClient(transport=httpx.MockTransport(handler)) as client:
            await reseam.enrich_reseam_releases(
                client, tmp_path, records, prioritized={(SOURCE, "v0.1.0")}
            )

    asyncio.run(enrich())
    assert len(calls) == reseam.MAX_RESEAM_DOWNLOADS_PER_RUN
    assert calls[0] == "v0.1.0"
    assert releases[1]["_reseam_notes"]["description"] == "Notes v0.1.0"


def test_bad_redirect_and_oversized_payload_do_not_publish_untrusted_notes(tmp_path):
    configure(tmp_path)

    async def check(handler):
        async with httpx.AsyncClient(transport=httpx.MockTransport(handler)) as client:
            return await reseam.fetch_reseam_release_notes(
                client, SOURCE, ASSET, "v0.34.0", tmp_path
            )

    assert asyncio.run(check(
        lambda _: httpx.Response(302, headers={"Location": "https://evil.example/patches.json"})
    )) is None
    assert asyncio.run(check(
        lambda _: httpx.Response(200, headers={"Content-Length": "99999999"}, content=b"{}")
    )) is None
    assert asyncio.run(check(
        lambda _: httpx.Response(200, content=b"x" * (reseam.MAX_RESEAM_JSON_BYTES + 1))
    )) is None


def test_historical_downloads_are_bounded_and_changelogs_do_not_leak_versions(tmp_path):
    configure(tmp_path)
    calls = []

    def handler(request):
        calls.append(request)
        tag = str(request.url).split("/")[-2]
        return httpx.Response(200, json=document(tag.removeprefix("v"), "Notes " + tag))

    releases = []
    for index in range(30):
        tag = f"v0.{index}.0"
        item = release(tag, asset=ASSET.replace("v0.34.0", tag))
        item["id"] = index
        item["published_at"] = f"2026-10-{index % 28 + 1:02d}T00:00:00Z"
        releases.append(item)
    records = {SOURCE: releases}

    async def enrich():
        async with httpx.AsyncClient(transport=httpx.MockTransport(handler)) as client:
            await reseam.enrich_reseam_releases(client, tmp_path, records)

    asyncio.run(enrich())
    assert len(calls) == reseam.MAX_RESEAM_DOWNLOADS_PER_RUN
    assert sum("_reseam_notes" in item for item in releases) == reseam.MAX_RESEAM_DOWNLOADS_PER_RUN
    saved = reconcile_archive(tmp_path, {"reseam": {"patches": SOURCE}}, records)
    for item in releases:
        archive = saved["releases"][stable_id(SOURCE, str(item["id"]))]
        expected = item.get("_reseam_notes", {}).get("description")
        assert archive["changelog"] == (expected or "")


def test_discovery_writes_selected_reseam_notes_for_the_catalog(tmp_path, monkeypatch):
    from scripts import discover_releases as discovery

    inventory = configure(tmp_path)
    # Exercise optional Git-asset enrichment on a third-party source; the
    # official patches repository now uses its API descriptions directly.
    third_party = "https://git.reseam.app/community/patches"
    inventory["reseam"]["patches"] = third_party
    (tmp_path / "config/sources.json").write_text(json.dumps(inventory))
    monkeypatch.setattr(discovery, "PROJECT_ROOT", tmp_path)
    cache = tmp_path / "internal/cache"
    monkeypatch.setattr(discovery, "PATCH_BUNDLES_DIR", cache / "bundles")
    monkeypatch.setattr(discovery, "METADATA_PATH", cache / "bundle-run-metadata.json")
    monkeypatch.setattr(discovery, "RELEASE_CACHE_FILE", cache / "release_cache.json")
    monkeypatch.setattr(discovery, "RELEASE_CACHE", {})
    monkeypatch.setattr(discovery, "RELEASE_REQUESTS", {})
    monkeypatch.setattr(discovery, "RELEASE_COOLDOWNS", {})
    monkeypatch.setattr(discovery, "HTTP_SEMAPHORE", asyncio.Semaphore(6))
    monkeypatch.setattr(discovery, "_load_sources_sync", lambda: inventory)
    calls = []
    third_party_asset = ASSET.replace(SOURCE, third_party)

    def handler(request):
        calls.append(str(request.url))
        if str(request.url) == third_party_asset:
            return httpx.Response(200, json=document())
        if request.url.path.endswith("/releases"):
            row = release(asset=third_party_asset)
            row["assets"][0]["browser_download_url"] = (
                row["assets"][0]["browser_download_url"].replace(SOURCE, third_party)
            )
            return httpx.Response(200, json=[row])
        raise AssertionError(f"Unexpected request: {request.url}")

    monkeypatch.setattr(
        discovery,
        "AsyncClient",
        lambda **kwargs: httpx.AsyncClient(transport=httpx.MockTransport(handler), **kwargs),
    )
    assert asyncio.run(discovery.main()) == 0
    raw = json.loads(
        (cache / "bundles/reseam-patch-bundles/reseam-stable-patches-bundle.json")
        .read_text()
    )
    assert raw["description"] == "- feat: release-specific notes"
    archived = json.loads((cache / "history/archive.json").read_text())
    assert archived["releases"][stable_id(third_party, "123")]["changelog"] == raw["description"]
    assert calls.count(third_party_asset) == 1
    historical = json.loads((cache / "history/sources.json").read_text())
    for settings in historical.values():
        historical_raw = json.loads((tmp_path / settings["cache_path"]).read_text())
        assert historical_raw["description"] == raw["description"]


def test_github_release_cdn_redirect_preserves_notes_without_forwarding_credentials(
    tmp_path, monkeypatch
):
    monkeypatch.setenv("GIT_HOST_TOKENS", '{"github.com":"private-token"}')
    source = "https://github.com/example/patches"
    asset = source + "/releases/download/v0.34.0/patches.json"
    cdn = "https://release-assets.githubusercontent.com/example/patches.json?signature=test"
    calls = []

    def handler(request):
        calls.append(request)
        if str(request.url) == asset:
            assert request.headers.get("Authorization") == "Bearer private-token"
            return httpx.Response(302, headers={"Location": cdn})
        assert str(request.url) == cdn
        assert "Authorization" not in request.headers
        return httpx.Response(200, json=document(text="CDN release notes"))

    async def check():
        async with httpx.AsyncClient(transport=httpx.MockTransport(handler)) as client:
            return await reseam.fetch_reseam_release_notes(
                client, source, asset, "v0.34.0", tmp_path
            )

    assert asyncio.run(check()) == "CDN release notes"
    assert len(calls) == 2


def test_historical_inputs_keep_native_notes_on_cached_refresh(tmp_path):
    inventory = configure(tmp_path)
    current = release()
    old_tag = "v0.29.0"
    historical = release(old_tag, asset=ASSET.replace("v0.34.0", old_tag))
    historical["id"] = 29
    historical["published_at"] = "2026-10-12T19:15:07Z"
    records = {SOURCE: [current, historical]}
    calls = []

    def handler(request):
        calls.append(str(request.url))
        tag = request.url.path.split("/")[-2]
        return httpx.Response(200, json=document(tag.removeprefix("v"), "Notes " + tag))

    async def enrich():
        async with httpx.AsyncClient(transport=httpx.MockTransport(handler)) as client:
            await reseam.enrich_reseam_releases(client, tmp_path, records)

    asyncio.run(enrich())
    reconcile_archive(tmp_path, inventory, records)
    registry = save_history(tmp_path, inventory, records)
    assert len(registry) == 2
    for settings in registry.values():
        raw = json.loads((tmp_path / settings["cache_path"]).read_text())
        assert raw["description"] == "Notes " + raw["version"]

    # Fresh API pages reuse the archived notes without extra asset downloads.
    records = {SOURCE: [release(), release(old_tag, asset=ASSET.replace("v0.34.0", old_tag))]}
    records[SOURCE][1]["id"] = 29
    asyncio.run(enrich())
    registry = save_history(tmp_path, inventory, records)
    assert len(calls) == 2
    for settings in registry.values():
        raw = json.loads((tmp_path / settings["cache_path"]).read_text())
        assert raw["description"] == "Notes " + raw["version"]

    # The website reads bundle descriptions, not the separate release archive.
    from test_generate_database import fixture, snapshot

    from scripts.generate_database import build_database

    fixture(tmp_path)
    (tmp_path / "config/sources.json").write_text(json.dumps(inventory))
    path, bundles = snapshot(tmp_path, build_database(tmp_path, restore=False))
    assert len(bundles) == 2
    for bundle in bundles:
        detail = json.loads((path / bundle["detail_file"]).read_text())
        assert detail["description"] == "Notes " + bundle["version"]
