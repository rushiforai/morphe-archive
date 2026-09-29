#!/usr/bin/env python3
"""Watch APKMirror and archive downloaded F1 TV APKs for local compatibility work."""

from __future__ import annotations

import argparse
import hashlib
import html
from html.parser import HTMLParser
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import time
from datetime import datetime, timezone
from urllib.parse import urljoin, urlparse
from urllib.request import Request, urlopen
import zipfile


REPO_ROOT = Path(__file__).resolve().parents[2]
CONSTANTS_FILE = REPO_ROOT / "patches/src/main/kotlin/io/github/hiosdra/patches/F1TvConstants.kt"
ARCHIVE_DIR = REPO_ROOT / ".local/f1tv/archive"
INDEX_FILE = ARCHIVE_DIR / "index.json"
APK_PACKAGE = "com.formulaone.production"
APK_MIRROR_URL = "https://www.apkmirror.com/apk/formula-one-digital-media-limited/f1-tv/"
APK_MIRROR_HOST = "www.apkmirror.com"
VERSION_RE = re.compile(r"\d+(?:\.\d+)+")


class LinkParser(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self.links: list[tuple[str, str]] = []
        self._href: str | None = None
        self._text: list[str] = []

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        if tag == "a":
            values = dict(attrs)
            self._href = values.get("href") or ""
            self._text = []

    def handle_data(self, data: str) -> None:
        if self._href is not None:
            self._text.append(data)

    def handle_endtag(self, tag: str) -> None:
        if tag == "a" and self._href is not None:
            text = " ".join(" ".join(self._text).split())
            self.links.append((self._href, html.unescape(text)))
            self._href = None
            self._text = []


def run_text(command: list[str]) -> str:
    result = subprocess.run(command, check=True, capture_output=True, text=True)
    return result.stdout.strip()


def find_apkanalyzer() -> str:
    found = shutil.which("apkanalyzer")
    if found:
        return found
    sdk_roots = [os.environ.get("ANDROID_SDK_ROOT"), os.environ.get("ANDROID_HOME"), str(Path.home() / "Android/Sdk")]
    for sdk_root in filter(None, sdk_roots):
        candidate = Path(sdk_root) / "cmdline-tools/latest/bin/apkanalyzer"
        if candidate.is_file():
            return str(candidate)
    raise RuntimeError("apkanalyzer not found; install Android SDK command-line tools or set ANDROID_SDK_ROOT")


def find_apksigner() -> str | None:
    found = shutil.which("apksigner")
    if found:
        return found
    sdk_roots = [os.environ.get("ANDROID_SDK_ROOT"), os.environ.get("ANDROID_HOME"), str(Path.home() / "Android/Sdk")]
    candidates: list[Path] = []
    for sdk_root in filter(None, sdk_roots):
        candidates.extend((Path(sdk_root) / "build-tools").glob("*/apksigner"))
    return str(sorted(candidates, key=lambda path: path.parent.name, reverse=True)[0]) if candidates else None


def inspect_apk(apk_path: Path) -> dict[str, object]:
    apk_path = apk_path.expanduser().resolve()
    if not apk_path.is_file() or apk_path.suffix.lower() != ".apk":
        raise RuntimeError(f"APK file does not exist: {apk_path}")
    if not zipfile.is_zipfile(apk_path):
        raise RuntimeError(f"APK is incomplete or invalid: {apk_path}")

    analyzer = find_apkanalyzer()
    package = run_text([analyzer, "manifest", "application-id", str(apk_path)])
    if package != APK_PACKAGE:
        raise RuntimeError(f"Skipping package {package}; expected {APK_PACKAGE}")

    version_name = run_text([analyzer, "manifest", "version-name", str(apk_path)])
    if not re.fullmatch(r"\d+(?:\.\d+)+(?:-[A-Za-z0-9.-]+)?", version_name):
        raise RuntimeError(f"Unexpected F1 TV version name: {version_name!r}")
    version_code = int(run_text([analyzer, "manifest", "version-code", str(apk_path)]))
    signer_fingerprint = None
    signer = find_apksigner()
    if signer:
        signer_output = run_text([signer, "verify", "--print-certs", str(apk_path)])
        match = re.search(r"certificate SHA-256 digest:\s*([0-9a-fA-F:]+)", signer_output)
        if not match:
            raise RuntimeError("Could not read the APK signing certificate SHA-256 fingerprint")
        signer_fingerprint = match.group(1).replace(":", "").lower()

    digest = hashlib.sha256()
    with apk_path.open("rb") as source:
        for block in iter(lambda: source.read(1024 * 1024), b""):
            digest.update(block)

    return {
        "package": package,
        "versionName": version_name,
        "versionCode": version_code,
        "sha256": digest.hexdigest(),
        "signerSha256": signer_fingerprint,
        "sourcePath": str(apk_path),
    }


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as source:
        for block in iter(lambda: source.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def load_index() -> dict[str, object]:
    if not INDEX_FILE.exists():
        return {"package": APK_PACKAGE, "artifacts": []}
    return json.loads(INDEX_FILE.read_text(encoding="utf-8"))


def save_index(index: dict[str, object]) -> None:
    ARCHIVE_DIR.mkdir(parents=True, exist_ok=True)
    temporary = INDEX_FILE.with_suffix(".json.tmp")
    temporary.write_text(json.dumps(index, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(INDEX_FILE)


def archive_apk(apk_path: Path, state: str = "candidate") -> dict[str, object]:
    details = inspect_apk(apk_path)
    index = load_index()
    artifacts = index.setdefault("artifacts", [])
    assert isinstance(artifacts, list)

    for record in artifacts:
        if record.get("sha256") == details["sha256"]:
            if state != "candidate":
                record["state"] = state
                save_index(index)
            print(f"Already archived: {record['archivePath']} ({record['state']})")
            return record

    version_name = re.sub(r"[^A-Za-z0-9._-]", "_", str(details["versionName"]))
    basename = f"{details['versionCode']}-{version_name}"
    archive_path = ARCHIVE_DIR / f"{basename}.apk"
    if archive_path.exists():
        archive_path = ARCHIVE_DIR / f"{basename}-{str(details['sha256'])[:12]}.apk"
    ARCHIVE_DIR.mkdir(parents=True, exist_ok=True)
    shutil.copy2(Path(str(details["sourcePath"])), archive_path)
    if sha256_file(archive_path) != details["sha256"]:
        archive_path.unlink(missing_ok=True)
        raise RuntimeError("APK changed while it was being archived; wait for the download to finish and retry")

    record = {
        **details,
        "archivePath": str(archive_path.relative_to(REPO_ROOT)),
        "archivedAt": datetime.now(timezone.utc).isoformat(),
        "state": state,
    }
    artifacts.append(record)
    save_index(index)
    print(f"Archived F1 TV {details['versionName']} (versionCode {details['versionCode']})")
    print(f"  SHA-256: {details['sha256']}")
    print(f"  APK:     {record['archivePath']}")
    if details["signerSha256"]:
        print(f"  Signer:  {details['signerSha256']}")
    return record


def current_target() -> tuple[str, int]:
    contents = CONSTANTS_FILE.read_text(encoding="utf-8")
    name = re.search(r'internal const val F1_TV_VERSION = "([^"]+)"', contents)
    code = re.search(r"internal const val F1_TV_VERSION_CODE = (\d+)", contents)
    if not name or not code:
        raise RuntimeError(f"Could not read F1 TV target from {CONSTANTS_FILE}")
    return name.group(1), int(code.group(1))


def update_target(version_name: str, version_code: int) -> None:
    contents = CONSTANTS_FILE.read_text(encoding="utf-8")
    contents, name_count = re.subn(
        r'internal const val F1_TV_VERSION = "[^"]+"',
        f'internal const val F1_TV_VERSION = "{version_name}"',
        contents,
        count=1,
    )
    contents, code_count = re.subn(
        r"internal const val F1_TV_VERSION_CODE = \d+",
        f"internal const val F1_TV_VERSION_CODE = {version_code}",
        contents,
        count=1,
    )
    if name_count != 1 or code_count != 1:
        raise RuntimeError("Could not update exactly one F1 TV target version and versionCode")
    temporary = CONSTANTS_FILE.with_suffix(".kt.tmp")
    temporary.write_text(contents, encoding="utf-8")
    temporary.replace(CONSTANTS_FILE)


def latest_apkmirror_release() -> tuple[str, str]:
    request = Request(
        APK_MIRROR_URL,
        headers={"User-Agent": "Mozilla/5.0 (compatible; F1TVPatchUpdateCheck/1.0)"},
    )
    with urlopen(request, timeout=25) as response:
        if urlparse(response.geturl()).hostname != APK_MIRROR_HOST:
            raise RuntimeError("APKMirror check redirected away from the approved host")
        page = response.read(4 * 1024 * 1024).decode("utf-8", errors="replace")

    parser = LinkParser()
    parser.feed(page)
    for href, label in parser.links:
        absolute_url = urljoin(APK_MIRROR_URL, href)
        if urlparse(absolute_url).hostname != APK_MIRROR_HOST:
            continue
        version_match = re.search(r"(\d+\.\d+[^<>]*?-mobile)", label, re.IGNORECASE)
        if not version_match or not VERSION_RE.search(version_match.group(1)):
            continue
        return version_match.group(1).strip(), absolute_url
    raise RuntimeError("APKMirror page layout changed or no mobile release link was found")


def command_check(args: argparse.Namespace) -> None:
    latest_name, latest_url = latest_apkmirror_release()
    target_name, target_code = current_target()
    matches = latest_name == target_name
    print(f"APKMirror latest mobile APK: {latest_name}")
    print(f"Target in checkout:          {target_name} (versionCode {target_code})")
    print(f"APKMirror page:              {latest_url}")
    if matches:
        print("Target matches the newest APKMirror listing.")
    else:
        print("New APK available: download it from APKMirror, then run ingest/stage before patch testing.")

    summary_path = os.environ.get("GITHUB_STEP_SUMMARY")
    if summary_path:
        status = "✅ Patch target matches the latest listing" if matches else "⚠️ A newer APK is listed"
        summary = (
            "## F1 TV APK check\n\n"
            f"- **Result:** {status}\n"
            f"- **Latest APKMirror listing:** [{latest_name}]({latest_url})\n"
            f"- **Patch target:** {target_name} (versionCode {target_code})\n\n"
            "This check only reports availability. Downloading and validating a new APK, "
            "staging its target, and checking patches remain manual steps.\n"
        )
        with open(summary_path, "a", encoding="utf-8") as summary_file:
            summary_file.write(summary)

    if not matches and args.fail_on_update:
        if os.environ.get("GITHUB_ACTIONS") == "true":
            print("::error title=F1 TV APK update::A newer version is listed; see the step summary.")
        raise RuntimeError(f"New APKMirror version detected: {latest_name}; patch target is {target_name}")


def scan_downloads(download_dir: Path) -> None:
    for apk_path in sorted(download_dir.expanduser().glob("*.apk")):
        try:
            archive_apk(apk_path)
        except RuntimeError as error:
            if "expected com.formulaone.production" not in str(error):
                print(f"Not archived yet: {apk_path.name}: {error}", file=sys.stderr)
        except (OSError, subprocess.CalledProcessError, zipfile.BadZipFile) as error:
            print(f"Not archived yet: {apk_path.name}: {error}", file=sys.stderr)


def command_watch(args: argparse.Namespace) -> None:
    download_dir = args.downloads.expanduser()
    last_notified: str | None = None
    print(f"Watching APKMirror and {download_dir}; press Ctrl+C to stop.")
    while True:
        try:
            latest_name, latest_url = latest_apkmirror_release()
            target_name, _ = current_target()
            if latest_name != target_name and latest_name != last_notified:
                message = f"APKMirror lists {latest_name}; current patch target is {target_name}"
                print(f"NEW VERSION: {message}\n{latest_url}", flush=True)
                notify = shutil.which("notify-send")
                if notify:
                    subprocess.run([notify, "F1 TV APK update", message], check=False)
                last_notified = latest_name
        except Exception as error:  # Keep the watcher alive through network outages or page changes.
            print(f"APKMirror check failed: {error}", file=sys.stderr, flush=True)

        scan_downloads(download_dir)
        time.sleep(args.interval_seconds)


def command_ingest(args: argparse.Namespace) -> None:
    archive_apk(args.apk, state=args.state)


def command_stage(args: argparse.Namespace) -> None:
    record = archive_apk(args.apk)
    target_name, target_code = current_target()
    candidate_code = int(record["versionCode"])
    if candidate_code <= target_code:
        raise RuntimeError(
            f"Candidate versionCode {candidate_code} must be newer than current target {target_code}; "
            "use restore to select an archived rollback version"
        )

    known_signers = {
        item.get("signerSha256")
        for item in load_index()["artifacts"]
        if item.get("state") in {"current-target", "known-good", "rollback"}
    }
    signer = record.get("signerSha256")
    if known_signers and signer not in known_signers:
        raise RuntimeError("APK signing certificate changed; review it manually before changing the target")

    update_target(str(record["versionName"]), candidate_code)
    index = load_index()
    for item in index["artifacts"]:
        if int(item["versionCode"]) == target_code and item["state"] == "current-target":
            item["state"] = "rollback"
        if item["sha256"] == record["sha256"]:
            item["state"] = "staged-candidate"
            item["previousTarget"] = {"versionName": target_name, "versionCode": target_code}
    save_index(index)
    print(f"Staged target {record['versionName']} (versionCode {candidate_code}) in F1TvConstants.kt")
    print("Run the local patcher smoke check and device check before marking it known-good.")


def command_restore(args: argparse.Namespace) -> None:
    index = load_index()
    artifacts = index.get("artifacts", [])
    record = next((item for item in artifacts if int(item["versionCode"]) == args.version_code), None)
    if record is None:
        raise RuntimeError(f"versionCode {args.version_code} is not in the local APK archive")
    if record.get("state") not in {"current-target", "known-good", "rollback", "staged-candidate"}:
        raise RuntimeError("Refusing to restore an APK that has not been recorded as a supported rollback target")
    update_target(str(record["versionName"]), int(record["versionCode"]))
    for item in artifacts:
        if item["sha256"] == record["sha256"]:
            item["state"] = "current-target"
        elif item.get("state") == "current-target":
            item["state"] = "rollback"
    save_index(index)
    print(f"Restored target to {record['versionName']} (versionCode {record['versionCode']})")


def command_mark_good(args: argparse.Namespace) -> None:
    if not args.patches_applied or not args.device_checked:
        raise RuntimeError("Marking known-good requires --patches-applied and --device-checked")
    record = inspect_apk(args.apk)
    target_name, target_code = current_target()
    if record["versionName"] != target_name or record["versionCode"] != target_code:
        raise RuntimeError("APK does not match the current patch target")
    index = load_index()
    artifacts = index.get("artifacts", [])
    saved_record = next((item for item in artifacts if item.get("sha256") == record["sha256"]), None)
    if saved_record is None:
        raise RuntimeError("Archive the APK first with the ingest command")
    for item in artifacts:
        if item.get("state") == "current-target":
            item["state"] = "rollback"
    saved_record["state"] = "known-good"
    saved_record["patchesAppliedAt"] = datetime.now(timezone.utc).isoformat()
    saved_record["deviceCheckedAt"] = saved_record["patchesAppliedAt"]
    save_index(index)
    print(f"Marked {target_name} as known-good after patch and device checks.")


def command_list(_: argparse.Namespace) -> None:
    index = load_index()
    for item in index.get("artifacts", []):
        print(
            f"{item['versionCode']}  {item['versionName']}  {item['state']}  "
            f"sha256:{str(item['sha256'])[:16]}  {item['archivePath']}"
        )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest="command", required=True)

    check = commands.add_parser("check", help="Compare the target with APKMirror's latest mobile listing")
    check.add_argument(
        "--fail-on-update",
        action="store_true",
        help="Return a failure when APKMirror lists a newer version than the patch target",
    )
    check.set_defaults(func=command_check)

    watch = commands.add_parser("watch", help="Poll APKMirror and archive F1 APKs downloaded to a folder")
    watch.add_argument("--downloads", type=Path, default=Path.home() / "Downloads")
    watch.add_argument("--interval-seconds", type=int, default=86400)
    watch.set_defaults(func=command_watch)

    ingest = commands.add_parser("ingest", help="Verify and archive a downloaded F1 TV APK")
    ingest.add_argument("apk", type=Path)
    ingest.add_argument("--state", choices=["candidate", "known-good", "current-target", "rollback"], default="candidate")
    ingest.set_defaults(func=command_ingest)

    stage = commands.add_parser("stage", help="Archive an APK and set it as a local patch target for smoke testing")
    stage.add_argument("apk", type=Path)
    stage.set_defaults(func=command_stage)

    restore = commands.add_parser("restore", help="Restore the target from an archived APK")
    restore.add_argument("version_code", type=int)
    restore.set_defaults(func=command_restore)

    mark_good = commands.add_parser("mark-good", help="Record a patched APK after device verification")
    mark_good.add_argument("apk", type=Path)
    mark_good.add_argument("--patches-applied", action="store_true")
    mark_good.add_argument("--device-checked", action="store_true")
    mark_good.set_defaults(func=command_mark_good)

    listing = commands.add_parser("list", help="List archived APKs and their local status")
    listing.set_defaults(func=command_list)
    return parser


def main() -> int:
    args = build_parser().parse_args()
    try:
        args.func(args)
    except (RuntimeError, OSError, json.JSONDecodeError, subprocess.CalledProcessError) as error:
        print(f"Error: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
