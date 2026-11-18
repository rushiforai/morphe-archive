#!/usr/bin/env python3
"""Obtain publisher-signed Pizza/Coffee input, or report the browser handoff URL.

The browser fallback is intentionally performed through the agent's supported
browser tool. It never exports cookies or attempts to solve a CAPTCHA.
"""
from __future__ import annotations

import argparse
import hashlib
import io
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import urllib.error
import urllib.parse
import urllib.request
import zipfile
from datetime import datetime, timezone
from html.parser import HTMLParser
from pathlib import Path

ORIGIN = "https://www.apkmirror.com"
APPS = {
    "pizza": {"slug": "good-pizza-great-pizza", "name": "Good Pizza, Great Pizza",
              "package": "com.tapblaze.pizzabusiness", "library": "libcocos2dcpp.so",
              "certificate": "0eb1a98d45c137dc00fb01d89cf6d08cc228d56907a2b00700f7d55cda62d6f7"},
    "coffee": {"slug": "good-coffee-great-coffee", "name": "Good Coffee, Great Coffee",
               "package": "com.tapblaze.coffeebusiness", "library": "libil2cpp.so",
               "certificate": "bab9079ab6c5f2e6d636cf2fe5d40526df4f7d47b64eda713f58a6b70b4d3989"},
}


class DownloadError(Exception):
    """Actionable failure suitable for JSON output."""


class BrowserRequired(DownloadError):
    def __init__(self, url: str, reason: str):
        super().__init__(reason)
        self.url = url


class Links(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.links: list[tuple[str, str]] = []
        self.href: str | None = None
        self.text: list[str] = []

    def handle_starttag(self, tag, attrs):
        if tag == "a":
            self.href = dict(attrs).get("href")
            self.text = []

    def handle_data(self, data):
        if self.href is not None:
            self.text.append(data)

    def handle_endtag(self, tag):
        if tag == "a" and self.href is not None:
            self.links.append((self.href, " ".join("".join(self.text).split())))
            self.href = None


def links(html: str) -> list[tuple[str, str]]:
    parser = Links()
    parser.feed(html)
    return parser.links


def latest_release(html: str, app: str) -> tuple[str, str]:
    config = APPS[app]
    prefix = f"/apk/tapblaze/{config['slug']}/{config['slug']}-"
    found = {}
    for href, text in links(html):
        path = urllib.parse.urlparse(urllib.parse.urljoin(ORIGIN, href)).path
        if path.startswith(prefix) and path.endswith("-release/"):
            match = re.fullmatch(re.escape(config["name"]) + r"\s+(\d+(?:\.\d+)+)", text)
            if match:
                version = match[1]
                found[tuple(map(int, version.split(".")))] = (version, ORIGIN + path)
    if not found:
        raise DownloadError("No stable release links found. Use the live APKMirror app page in the browser; search-engine caches may be stale.")
    return found[max(found)]


def page_download_link(html: str, page_url: str) -> str:
    candidates = []
    for href, text in links(html):
        url = urllib.parse.urljoin(page_url, href)
        parsed = urllib.parse.urlparse(url)
        if parsed.hostname != "www.apkmirror.com":
            continue
        if parsed.path.endswith("/download.php") and text.lower() == "here":
            candidates.append((3, url))
        elif "/download/" in parsed.path and text.startswith("Download APK Bundle"):
            candidates.append((2, url))
        elif "/download/" in parsed.path and text.startswith("Download APK"):
            candidates.append((1, url))
    if not candidates:
        raise DownloadError("No APKMirror download control found. Open the variant page in the browser and inspect the current download link.")
    best = max(score for score, _ in candidates)
    urls = {url for score, url in candidates if score == best}
    if len(urls) != 1:
        raise DownloadError("Multiple download controls found. Select the complete ARM64 bundle/standalone variant in the browser.")
    return urls.pop()


def get(url: str, referer: str | None = None):
    headers = {"User-Agent": "Mozilla/5.0", "Accept": "*/*"}
    if referer:
        headers["Referer"] = referer
    try:
        return urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=45)
    except urllib.error.HTTPError as error:
        if error.code in (403, 429):
            raise BrowserRequired(url, f"APKMirror returned HTTP {error.code}; use the normal browser download flow documented in docs/apkmirror-download.md.") from error
        raise DownloadError(f"Download request returned HTTP {error.code}. Check the live release page and retry later.") from error


def text_page(url: str, referer: str | None = None) -> str:
    with get(url, referer) as response:
        body = response.read(4 * 1024 * 1024)
    if b"Just a moment" in body[:2000] or b"cf-chl-" in body:
        raise BrowserRequired(url, "APKMirror requires a normal browser session; use docs/apkmirror-download.md.")
    return body.decode("utf-8", errors="replace")


def inspect_archive(path: Path, app: str) -> dict:
    """Check ZIP integrity plus the assets/native payload required by these games."""
    if not zipfile.is_zipfile(path):
        raise DownloadError("Downloaded file is not a ZIP/APK (possibly an HTML challenge). Download through the browser, then use --adopt.")
    assets = 0
    native = set()
    apk_names = []
    inventory = None
    with zipfile.ZipFile(path) as archive:
        bad = archive.testzip()
        if bad:
            raise DownloadError(f"Corrupt ZIP entry {bad!r}. Download a fresh complete file.")
        names = archive.namelist()
        standalone = "AndroidManifest.xml" in names
        if standalone:
            entries = names
            apk_names.append(path.name)
            assets += sum(n.startswith("assets/") and not n.endswith("/") for n in entries)
            native.update(n for n in entries if n.startswith("lib/") and n.endswith(".so"))
        else:
            apk_names = [n for n in names if n.endswith(".apk")]
            if "manifest.json" in names:
                try:
                    declarations = json.loads(archive.read("manifest.json"))["split_apks"]
                    declared = {entry["file"] for entry in declarations}
                except (KeyError, TypeError, ValueError) as error:
                    raise DownloadError("XAPK manifest has no usable split_apks inventory. Obtain a complete original archive.") from error
                inventory = "XAPK manifest.json split_apks"
            elif "META-INF/MANIFEST.MF" in names:
                # APKMirror v5 info.json has no split list; its JAR manifest does.
                text = archive.read("META-INF/MANIFEST.MF").decode("utf-8")
                text = text.replace("\r\r\n", "\n").replace("\r\n", "\n").replace("\r", "\n")
                text = text.replace("\n ", "")  # Standard JAR continuation lines.
                declared = {name for name in re.findall(r"^Name: (.+)$", text, re.M) if name.endswith(".apk")}
                inventory = "APKM META-INF/MANIFEST.MF"
            else:
                raise DownloadError("Container has no declared APK inventory, so completeness cannot be established. Obtain an original APKM/XAPK with its metadata.")
            if not declared or any(not isinstance(name, str) or not name.endswith(".apk") for name in declared):
                raise DownloadError("Container's declared APK inventory is empty or invalid. Obtain a complete original archive.")
            missing = declared - set(apk_names)
            if missing:
                raise DownloadError("Container is missing declared APK entries: " + ", ".join(sorted(missing)) + ". Download the complete original archive.")
            undeclared = set(apk_names) - declared
            if undeclared:
                raise DownloadError("Container has undeclared APK entries: " + ", ".join(sorted(undeclared)) + ". Obtain an unmodified original archive.")
            for name in apk_names:
                with zipfile.ZipFile(io.BytesIO(archive.read(name))) as apk:
                    bad = apk.testzip()
                    if bad:
                        raise DownloadError(f"Corrupt inner APK {name!r}. Download a fresh complete bundle.")
                    entries = apk.namelist()
                    assets += sum(n.startswith("assets/") and not n.endswith("/") for n in entries)
                    native.update(n for n in entries if n.startswith("lib/") and n.endswith(".so"))
    required = "lib/arm64-v8a/" + APPS[app]["library"]
    if required not in native or assets == 0:
        raise DownloadError("Input lacks complete game assets/ARM64 native payload. Select the complete bundle or full standalone APK, not the small base APK.")
    container = "APK" if standalone else ("APKM" if "info.json" in names else "XAPK" if "manifest.json" in names else "BUNDLE")
    return {"format": container, "apk_entries": apk_names,
            "asset_files": assets, "native_libraries": len(native), "zip_integrity": "PASS",
            "declared_apk_inventory": inventory or "standalone APK; no container splits"}


def android_tools(explicit: Path | None) -> Path:
    sdk = explicit or Path(os.environ.get("ANDROID_HOME", os.environ.get("ANDROID_SDK_ROOT", str(Path.home() / "AppData/Local/Android/Sdk"))))
    paths = list((sdk / "build-tools").glob("*/aapt2.exe")) if os.name == "nt" else list((sdk / "build-tools").glob("*/aapt2"))
    if not paths:
        raise DownloadError("Android build-tools not found. Pass --sdk SDK_ROOT or install Android SDK Build Tools before trusting the input.")
    return max(paths, key=lambda p: tuple(int(v) for v in p.parent.name.split(".") if v.isdigit())).parent


def verify_identity(path: Path, app: str, sdk: Path | None, archive_report: dict) -> dict:
    tools = android_tools(sdk)
    aapt = tools / ("aapt2.exe" if os.name == "nt" else "aapt2")
    signer = tools / ("apksigner.bat" if os.name == "nt" else "apksigner")
    with tempfile.TemporaryDirectory(prefix="morphe-apk-intake-") as folder:
        if archive_report["format"] == "APK":
            apks = [path]
        else:
            apks = []
            with zipfile.ZipFile(path) as archive:
                for index, name in enumerate(archive_report["apk_entries"]):
                    target = Path(folder) / f"split-{index}.apk"
                    target.write_bytes(archive.read(name))
                    apks.append(target)
        identity = None
        version_codes = set()
        for apk in apks:
            result = subprocess.run([str(signer), "verify", "--print-certs", str(apk)], capture_output=True, text=True, encoding="utf-8", errors="replace")
            if result.returncode:
                raise DownloadError(f"APK signature verification failed for {apk.name}. Obtain the original publisher-signed input.")
            certificates = re.findall(r"^Signer #\d+ certificate SHA-256 digest: ([0-9a-f]+)$", result.stdout, re.M)
            if certificates != [APPS[app]["certificate"]]:
                raise DownloadError(f"Unexpected publisher certificate for {apk.name}. Do not patch/install it; obtain a TapBlaze-signed original.")
            badging = subprocess.run([str(aapt), "dump", "badging", str(apk)], capture_output=True, text=True, encoding="utf-8", errors="replace")
            match = re.search(r"package: name='([^']+)' versionCode='([^']+)' versionName='([^']+)'([^\n]*)", badging.stdout)
            if badging.returncode or not match or match[1] != APPS[app]["package"]:
                raise DownloadError(f"Unexpected/missing APK identity for {apk.name}. Check the selected package and bundle.")
            version_codes.add(int(match[2]))
            if not re.search(r"\bsplit=", match[4]):
                current = {"package": match[1], "version_code": int(match[2]), "version": match[3]}
                if identity and identity != current:
                    raise DownloadError("Bundle contains conflicting base identities. Obtain an unmodified complete input.")
                identity = current
        if identity is None:
            raise DownloadError("No base APK found. Obtain a complete APKM/XAPK.")
        if version_codes != {identity["version_code"]}:
            raise DownloadError("Bundle mixes APK version codes. Obtain a complete archive from one release.")
    return {**identity, "publisher_certificate_sha256": APPS[app]["certificate"], "all_apk_signatures": "PASS"}


def download(app: str, output: Path) -> tuple[Path, str, str]:
    listing = f"{ORIGIN}/apk/tapblaze/{APPS[app]['slug']}/"
    version, release = latest_release(text_page(listing), app)
    html = text_page(release, listing)
    variants = sorted({urllib.parse.urljoin(release, href) for href, _ in links(html)
                       if href.endswith("-android-apk-download/") and f"/{APPS[app]['slug']}-" in href})
    if len(variants) != 1:
        raise BrowserRequired(release, "Select the full ARM64 bundle/standalone APK from the live variants in the browser; no ambiguous automatic selection was made.")
    variant = variants[0]
    request_page = page_download_link(text_page(variant, release), variant)
    final = page_download_link(text_page(request_page, variant), request_page)
    with get(final, request_page) as response:
        basename = f"{app}-{version}-original"
        if list(output.glob(basename + ".*")):
            raise DownloadError(f"Output for {basename} already exists. Verify it using --adopt or choose another --output-dir.")
        partial = output / (basename + ".download.part")
        with partial.open("xb") as stream:
            shutil.copyfileobj(response, stream, length=1024 * 1024)
        # Leave failed .part files for diagnosis; never present HTML as final APK.
        if not zipfile.is_zipfile(partial):
            raise BrowserRequired(variant, "Download returned an HTML/error response. Use the normal browser flow and --adopt the completed download.")
        with zipfile.ZipFile(partial) as archive:
            names = archive.namelist()
            suffix = ".apk" if "AndroidManifest.xml" in names else ".apkm" if "info.json" in names else ".xapk" if "manifest.json" in names else ".zip"
        path = output / (basename + suffix)
        partial.rename(path)
    return path, release, variant


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, epilog="Examples: %(prog)s pizza --output-dir E:/Pizza/intake\n%(prog)s pizza --output-dir E:/Pizza/intake --adopt C:/Users/me/Downloads/pizza.apk --release-url https://www.apkmirror.com/...", formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("app", choices=APPS)
    parser.add_argument("--output-dir", required=True, type=Path, help="Private intake directory; originals and provenance must stay out of Git.")
    parser.add_argument("--adopt", type=Path, help="Validate an already completed normal browser download without downloading again.")
    parser.add_argument("--release-url", help="Canonical APKMirror release URL for a browser download (required with --adopt).")
    parser.add_argument("--sdk", type=Path, help="Android SDK root containing aapt2 and apksigner; defaults to local SDK/env.")
    args = parser.parse_args()
    if args.adopt and not args.release_url:
        parser.error("--adopt requires --release-url so the original's provenance is retained")
    try:
        args.output_dir.mkdir(parents=True, exist_ok=True)
        if args.adopt:
            path, release, variant = args.adopt.resolve(), args.release_url, None
        else:
            path, release, variant = download(args.app, args.output_dir)
        archive = inspect_archive(path, args.app)
        identity = verify_identity(path, args.app, args.sdk, archive)
        with path.open("rb") as stream:
            digest = hashlib.file_digest(stream, "sha256").hexdigest()
        report = {"status": "PASS", "verified_at": datetime.now(timezone.utc).isoformat(),
                  "path": str(path), "bytes": path.stat().st_size, "sha256": digest,
                  "release_url": release, "variant_url": variant,
                  "transport": "agent normal browser download" if args.adopt else "HTTP", **identity, **archive}
        record = args.output_dir / f"{args.app}-{identity['version']}-provenance.json"
        record.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
        print(json.dumps({**report, "provenance": str(record)}))
        return 0
    except BrowserRequired as error:
        print(json.dumps({"status": "BROWSER_REQUIRED", "url": error.url, "message": str(error), "procedure": "docs/apkmirror-download.md"}))
        return 3
    except (DownloadError, OSError, urllib.error.URLError, zipfile.BadZipFile) as error:
        print(json.dumps({"status": "ERROR", "message": str(error)}))
        return 1


if __name__ == "__main__":
    sys.exit(main())
