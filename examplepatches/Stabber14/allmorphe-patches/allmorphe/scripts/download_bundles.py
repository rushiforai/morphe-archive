#!/usr/bin/env python3
"""Download every community .mpp bundle referenced by bundles.json.

Each Morphe community bundle repo publishes a patches-bundle.json whose
``download_url`` points at a compiled ``.mpp`` release asset. This script
fetches that metadata for every bundle and downloads the ``.mpp`` into a single
directory (``bundles/`` at the repo root by default) so users can point Morphe
at one folder. sources.txt is left untouched for auto-updating sources.
"""

import json
import os
import sys
import time
import urllib.request
import urllib.error
from concurrent.futures import ThreadPoolExecutor, as_completed

UA = "Mozilla/5.0 (AllMorphe downloader)"
MAX_WORKERS = 6
RETRIES = 3
TIMEOUT = 120


def repo_root():
    return os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


def raw_url(repo, source):
    if source == "gitlab":
        return f"https://gitlab.com/{repo}/-/raw/HEAD/patches-bundle.json"
    return f"https://raw.githubusercontent.com/{repo}/HEAD/patches-bundle.json"


def fetch_json(url):
    last = None
    for attempt in range(RETRIES):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": UA})
            with urllib.request.urlopen(req, timeout=TIMEOUT) as resp:
                return json.load(resp)
        except Exception as e:
            last = e
            time.sleep(1 + attempt)
    raise last


def download(url, dest):
    last = None
    for attempt in range(RETRIES):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": UA})
            with urllib.request.urlopen(req, timeout=TIMEOUT) as resp:
                tmp = dest + ".part"
                with open(tmp, "wb") as f:
                    while True:
                        chunk = resp.read(65536)
                        if not chunk:
                            break
                        f.write(chunk)
                os.replace(tmp, dest)
            return True
        except Exception as e:
            last = e
            try:
                if os.path.exists(dest + ".part"):
                    os.remove(dest + ".part")
            except OSError:
                pass
            time.sleep(2 + attempt * 2)
    return False


def safe_name(repo):
    return repo.replace("/", "__").replace("\\", "_") + ".mpp"


def process(bundle, out_dir):
    repo = bundle["repo"]
    source = bundle.get("source", "github")
    dest = os.path.join(out_dir, safe_name(repo))
    if os.path.exists(dest) and os.path.getsize(dest) > 0:
        return (repo, "skipped", dest)
    try:
        meta = fetch_json(raw_url(repo, source))
    except Exception as e:
        return (repo, f"meta-error: {e}", None)
    url = meta.get("download_url")
    if not url:
        return (repo, "no-download-url", None)
    ok = download(url, dest)
    if not ok:
        return (repo, "download-error", None)
    return (repo, "ok", dest)


def main():
    root = repo_root()
    bundles_path = os.path.join(root, "bundles.json")
    if not os.path.exists(bundles_path):
        bundles_path = os.path.join(root, "allmorphe", "bundles.json")
    with open(bundles_path) as f:
        data = json.load(f)
    bundles = data["bundles"]

    out_dir = os.path.join(root, "bundles")
    os.makedirs(out_dir, exist_ok=True)

    results = {"ok": 0, "skipped": 0, "failed": 0}
    failures = []
    total = len(bundles)
    done = 0

    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as ex:
        futs = {ex.submit(process, b, out_dir): b for b in bundles}
        for fut in as_completed(futs):
            repo, status, dest = fut.result()
            done += 1
            if status == "ok":
                results["ok"] += 1
            elif status == "skipped":
                results["skipped"] += 1
            else:
                results["failed"] += 1
                failures.append((repo, status))
            if done % 25 == 0 or done == total:
                print(f"[{done}/{total}] ok={results['ok']} skipped={results['skipped']} failed={results['failed']}", flush=True)

    # Write failure report
    report_path = os.path.join(root, "bundles_download_report.json")
    with open(report_path, "w") as f:
        json.dump({"results": results, "failures": failures}, f, indent=2)
    print(json.dumps(results, indent=2))
    if failures:
        print(f"Failures: {len(failures)}", flush=True)
        for repo, status in failures[:50]:
            print(f"  {repo}: {status}", flush=True)


if __name__ == "__main__":
    main()
