"""Check locally built release evidence before publishing a patch bundle."""

import argparse
import base64
import contextlib
import hashlib
import json
import os
import re
import shutil
import signal
import subprocess
import sys
import tempfile
import time
import zipfile
import zlib
from datetime import datetime, timezone
from pathlib import Path

if __package__:
    from .build_queue import gradle, time_limit
else:
    # Run as a script, or loaded by file path from the tests.
    if str(Path(__file__).resolve().parent) not in sys.path:
        sys.path.insert(0, str(Path(__file__).resolve().parent))
    from build_queue import gradle, time_limit

RELEASE_SIGNERS = Path("scripts/release_signers")
RELEASE_SIGNER = "SysAdminDoc"
SIGNATURE_NAMESPACE = "hushmessenger-release"
KEY_TYPES = ("ssh-ed25519", "ssh-rsa", "ecdsa-sha2-")
CATALOG_TIMEOUT = 600
STAGING_REMOVAL_DELAYS = (0.25, 0.5, 1.0, 2.0)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def read_json(path):
    def unique_pairs(pairs):
        result = {}
        for key, value in pairs:
            require(key not in result, f"Duplicate JSON key: {key}")
            result[key] = value
        return result

    return json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=unique_pairs)


def verify(root, bundle=None, evidence=None, release_tag=None, checksums=None):
    properties = dict(
        re.findall(
            r"^([A-Za-z][A-Za-z0-9.]*)=(.+)$",
            (root / "gradle.properties").read_text(encoding="utf-8"),
            re.MULTILINE,
        )
    )
    version = properties.get("version", "")
    require(
        re.fullmatch(r"\d+\.\d+\.\d+", version), "Missing or invalid project version"
    )
    filename = f"patches-{version}.mpp"
    bundle = bundle or root / "patches/build/libs" / filename
    evidence = evidence or root / "patches/build/reports/catalog-evidence.json"
    require(bundle.name == filename, "Bundle filename differs from project version")
    require(
        release_tag is None or release_tag == f"v{version}",
        "Release tag differs from project version",
    )
    digest = hashlib.sha256(bundle.read_bytes()).hexdigest()
    with zipfile.ZipFile(bundle) as archive:
        require(
            {"classes.dex", "extensions/messenger.mpe"}.issubset(archive.namelist()),
            "Incomplete Android bundle",
        )
        manifest = (
            archive.read("META-INF/MANIFEST.MF")
            .decode("utf-8")
            .replace("\r\n ", "")
            .replace("\n ", "")
        )
        attributes = dict(
            line.split(": ", 1) for line in manifest.splitlines() if ": " in line
        )
    require(
        attributes.get("Version") == version,
        "Bundle manifest version differs from source",
    )
    require(
        attributes.get("Timestamp") == properties.get("bundleTimestampMillis"),
        "Bundle timestamp differs from source",
    )

    index = read_json(root / "patches-bundle.json")
    require(index.get("version") == version, "Source index version differs from source")
    require(
        index.get("download_url")
        == f"https://github.com/SysAdminDoc/HushMessenger/releases/download/v{version}/{filename}",
        "Source download URL differs from release version or artifact name",
    )
    timestamp = index.get("created_at", "")
    require(
        re.fullmatch(r"\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d(?:\.\d{1,3})?", timestamp),
        "Source timestamp must be a local date-time without Z",
    )
    millis = round(
        datetime.fromisoformat(timestamp).replace(tzinfo=timezone.utc).timestamp()
        * 1000
    )
    require(
        str(millis) == properties.get("bundleTimestampMillis"),
        "Source and bundle timestamps differ",
    )

    public = read_json(root / "patches-list.json")
    fresh = read_json(evidence)
    require(
        fresh.get("bundle") == filename and fresh.get("sha256") == digest,
        "Catalog evidence is stale for this bundle; run :patches:checkPatchCatalog",
    )
    require(fresh.get("dexValidated") is True, "Missing structural DEX validation")
    require(
        json.dumps(public, sort_keys=True, allow_nan=False)
        == json.dumps(fresh.get("catalog"), sort_keys=True, allow_nan=False),
        "Public catalog differs from loaded bundle metadata",
    )
    require(public.get("version") == version, "Catalog version differs from source")
    entries = public.get("patches")
    require(
        isinstance(entries, list) and bool(entries),
        "Expected a nonempty patch catalog",
    )
    require(
        all(
            isinstance(entry, dict) and isinstance(entry.get("name"), str)
            for entry in entries
        ),
        "Invalid catalog patch entry",
    )
    require(
        len({entry["name"] for entry in entries}) == len(entries),
        "Duplicate catalog patch names",
    )

    readme = (root / "README.md").read_text(encoding="utf-8")
    badges = re.findall(r"shields\.io/badge/version-([^-/\s]+)-", readme)
    require(badges == [version], "README version badge differs from source")
    hashes = re.findall(
        r"^([a-f0-9]{64})\s+(patches-[\d.]+\.mpp)\s*$", readme, re.MULTILINE
    )
    require(
        hashes == [(digest, filename)],
        "README artifact checksum differs from built bundle",
    )
    # Only this repository's release links (absolute in any case, or relative) and
    # its own bundle names; another project's release or bundle is not ours to pin.
    release_links = re.compile(
        r"(?i)(?:SysAdminDoc/HushMessenger/|\.\./)releases/(?:tag|download)/v"
        r"(\d+\.\d+\.\d+)(?!\.?\d)"
        r"|(?<![\w.-])patches-(\d+\.\d+\.\d+)(?!\.?\d)"
    )
    for link in release_links.finditer(readme):
        advertised = link.group(1) or link.group(2)
        require(advertised == version, "README download link differs from source")
    headings = re.findall(
        r"^## (.+)$", (root / "CHANGELOG.md").read_text(encoding="utf-8"), re.MULTILINE
    )
    require(
        bool(headings) and headings[0].startswith(version + " ("),
        "First changelog entry must be the release version",
    )
    extension_build = (root / "extensions/messenger/build.gradle.kts").read_text(
        encoding="utf-8"
    )
    require(
        re.findall(r"versionName\s*=\s*([^\n]+)", extension_build)
        == ["project.version.toString()"],
        "Extension version name must follow the project",
    )
    if checksums is not None:
        require(
            checksums.read_text(encoding="utf-8").strip() == f"{digest}  {filename}",
            "Release checksum file differs from built bundle",
        )
    return (
        f"Release metadata passed: v{version}, {len(entries)} patches, SHA-256 {digest}"
    )


def tagged_public_feed(root, version):
    """Return patches-bundle.json exactly as committed at the public release tag."""
    try:
        result = subprocess.run(
            ["git", "cat-file", "blob", f"refs/tags/v{version}:patches-bundle.json"],
            cwd=root,
            capture_output=True,
            timeout=60,
            check=False,
        )
    except (OSError, subprocess.SubprocessError) as error:
        raise ValueError(
            f"Couldn't read the v{version} public feed with git: {error}"
        ) from error
    require(
        result.returncode == 0,
        f"Release tag v{version} or its patches-bundle.json is missing: "
        + result.stderr.decode("utf-8", "replace").strip(),
    )
    return result.stdout


def verify_development(root, bundle, evidence, held_index_sha256, checksums=None):
    """Check current source metadata while preserving an intentionally older feed."""
    require(
        re.fullmatch(r"[a-fA-F0-9]{64}", held_index_sha256 or ""),
        "A recorded held-index SHA-256 is required",
    )
    require(
        hashlib.sha256((root / "patches-bundle.json").read_bytes()).hexdigest()
        == held_index_sha256.lower(),
        "Held public metadata changed",
    )
    properties = dict(
        re.findall(
            r"^([A-Za-z][A-Za-z0-9.]*)=(.+)$",
            (root / "gradle.properties").read_text(encoding="utf-8"),
            re.MULTILINE,
        )
    )
    version = properties.get("version", "")
    require(re.fullmatch(r"\d+\.\d+\.\d+", version), "Invalid project version")
    require(
        bundle.name == f"patches-{version}.mpp", "Bundle filename differs from source"
    )
    digest = hashlib.sha256(bundle.read_bytes()).hexdigest()
    with zipfile.ZipFile(bundle) as archive:
        require(archive.testzip() is None, "Corrupt bundle entry")
        manifest = (
            archive.read("META-INF/MANIFEST.MF")
            .decode("utf-8")
            .replace("\r\n ", "")
            .replace("\n ", "")
        )
        attributes = dict(
            line.split(": ", 1) for line in manifest.splitlines() if ": " in line
        )
    require(attributes.get("Version") == version, "Bundle version differs from source")
    require(
        attributes.get("Timestamp") == properties.get("bundleTimestampMillis"),
        "Bundle timestamp differs from source",
    )
    fresh = read_json(evidence)
    catalog = read_json(root / "patches-list.json")
    require(
        fresh.get("bundle") == bundle.name and fresh.get("sha256") == digest,
        "Catalog evidence is stale for this bundle",
    )
    require(fresh.get("dexValidated") is True, "Missing structural DEX validation")
    require(
        json.dumps(catalog, sort_keys=True, allow_nan=False)
        == json.dumps(fresh.get("catalog"), sort_keys=True, allow_nan=False),
        "Development catalog differs from loaded bundle metadata",
    )
    require(catalog.get("version") == version, "Catalog version differs from source")
    entries = catalog.get("patches")
    require(
        isinstance(entries, list)
        and bool(entries)
        and all(
            isinstance(entry, dict) and isinstance(entry.get("name"), str)
            for entry in entries
        ),
        "Invalid development patch entries",
    )
    require(
        len({entry["name"] for entry in entries}) == len(entries),
        "Duplicate catalog patch names",
    )
    index = read_json(root / "patches-bundle.json")
    public_version = index.get("version", "")
    require(
        re.fullmatch(r"\d+\.\d+\.\d+", public_version), "Invalid held public version"
    )
    require(
        tuple(map(int, public_version.split(".")))
        < tuple(map(int, version.split("."))),
        "Held public version must be older than development",
    )
    require(
        index.get("download_url")
        == f"https://github.com/SysAdminDoc/HushMessenger/releases/download/v{public_version}/patches-{public_version}.mpp",
        "Invalid held download URL",
    )
    # The operator's hash only pins the file it was taken from; the tag pins what was published.
    # Git stores this text file with LF endings, so a CRLF checkout of the same feed matches.
    feed = (root / "patches-bundle.json").read_bytes()
    tagged = tagged_public_feed(root, public_version)
    require(
        feed == tagged or feed.replace(b"\r\n", b"\n") == tagged,
        f"Held public feed differs from patches-bundle.json at tag v{public_version}",
    )
    readme = (root / "README.md").read_text(encoding="utf-8")
    require(
        re.findall(r"shields\.io/badge/development-([^-/\s]+)-", readme) == [version],
        "README development badge differs from source",
    )
    headings = re.findall(
        r"^## (.+)$", (root / "CHANGELOG.md").read_text(encoding="utf-8"), re.MULTILINE
    )
    require(
        bool(headings) and headings[0] == "Unreleased",
        "Development changes need an Unreleased changelog entry",
    )
    extension = (root / "extensions/messenger/build.gradle.kts").read_text(
        encoding="utf-8"
    )
    require(
        re.findall(r"versionName\s*=\s*([^\n]+)", extension)
        == ["project.version.toString()"],
        "Extension version name must follow the project",
    )
    if checksums is not None:
        require(
            checksums.read_text(encoding="utf-8").strip() == f"{digest}  {bundle.name}",
            "Development checksum differs from frozen bundle",
        )
    return f"Development metadata passed: v{version}, {len(entries)} patches, held public v{public_version}, SHA-256 {digest}"


def stop_process_tree(process):
    """Kill a validation run together with the Gradle JVMs it started."""
    with contextlib.suppress(OSError, subprocess.SubprocessError):
        if sys.platform == "win32":
            subprocess.run(
                ["taskkill", "/T", "/F", "/PID", str(process.pid)],
                capture_output=True,
                timeout=60,
                check=False,
            )
        else:
            os.killpg(process.pid, signal.SIGKILL)
    process.kill()


def run_bounded(command, *, timeout, capture_output=False, **kwargs):
    """subprocess.run that stops the whole process tree when the limit passes.

    Through the build queue the direct child is PowerShell, which starts the real job.
    subprocess.run kills only that child and then waits on pipes the job still holds, so a
    hung job would hang the caller and keep running outside any queue slot.
    """
    if capture_output:
        kwargs["stdout"] = kwargs["stderr"] = subprocess.PIPE
    with subprocess.Popen(command, start_new_session=sys.platform != "win32", **kwargs) as process:
        try:
            stdout, stderr = process.communicate(timeout=timeout)
        except subprocess.TimeoutExpired:
            stop_process_tree(process)
            with contextlib.suppress(subprocess.TimeoutExpired):
                process.communicate(timeout=30)
            raise subprocess.TimeoutExpired(command, timeout) from None
        except BaseException:
            stop_process_tree(process)
            raise
    return subprocess.CompletedProcess(command, process.returncode, stdout, stderr)


def validate_catalog(root, bundle, evidence):
    """Run the same catalog/definition checks without invoking a bundle producer."""
    evidence.unlink(missing_ok=True)
    limit = time_limit(CATALOG_TIMEOUT, gradle_job=True)
    process = subprocess.Popen(
        gradle(
            root,
            [
                ":patches:checkFrozenPatchCatalog",
                f"-PvalidationBundle={bundle.resolve()}",
                f"-PvalidationEvidence={evidence.resolve()}",
                "--no-daemon",
                "--no-configuration-cache",
            ],
        ),
        cwd=root,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        encoding="utf-8",
        errors="replace",
        start_new_session=sys.platform != "win32",
    )
    try:
        stdout, stderr = process.communicate(timeout=limit)
    except subprocess.TimeoutExpired:
        # Killing only the wrapper leaves the Gradle JVM holding the output pipes.
        stop_process_tree(process)
        try:
            stdout, stderr = process.communicate(timeout=30)
        except subprocess.TimeoutExpired:
            stdout, stderr = "", "A leftover process still holds the output pipes."
        raise ValueError(
            f"Catalog/DEX validation timed out after {limit} s\n"
            + (stdout + stderr)[-4000:]
        ) from None
    require(
        process.returncode == 0,
        "Catalog/DEX validation failed\n" + (stdout + stderr)[-4000:],
    )


def mutable_output(root, path):
    relative = (
        path.resolve().relative_to(root.resolve())
        if path.resolve().is_relative_to(root.resolve())
        else None
    )
    return relative is not None and any(
        part.lower() in {"build", ".gradle"} for part in relative.parts
    )


def freeze_development(root, bundle, destination, held_index_sha256):
    require(
        not mutable_output(root, destination),
        "Freeze destination must be outside mutable Gradle outputs",
    )
    require(not destination.exists(), "Freeze destination already exists")
    original = bundle.read_bytes()
    digest = hashlib.sha256(original).hexdigest()
    destination.parent.mkdir(parents=True, exist_ok=True)
    staging = Path(tempfile.mkdtemp(prefix=".hush-freeze-", dir=destination.parent))
    try:
        frozen = staging / bundle.name
        frozen.write_bytes(original)
        evidence = staging / "catalog-evidence.json"
        validate_catalog(root, frozen, evidence)
        message = verify_development(root, frozen, evidence, held_index_sha256)
        require(
            hashlib.sha256(bundle.read_bytes()).hexdigest() == digest,
            "Producer bundle changed during validation",
        )
        require(
            hashlib.sha256(frozen.read_bytes()).hexdigest() == digest,
            "Validated snapshot changed",
        )
        (staging / "SHA256SUMS.txt").write_text(
            f"{digest}  {bundle.name}\n", encoding="utf-8", newline="\n"
        )
        staging.rename(destination)
    except Exception as error:
        if not remove_staging(staging):
            raise ValueError(f"{error}\nLeftover staging folder: {staging}") from error
        raise
    except BaseException:
        remove_staging(staging)
        raise
    return message + f"\nFrozen bundle: {destination / bundle.name}"


def remove_staging(path):
    """Delete a freeze staging folder, allowing Windows time to release files a JVM held."""
    for delay in (*STAGING_REMOVAL_DELAYS, None):
        try:
            shutil.rmtree(path)
            return True
        except FileNotFoundError:
            return True
        except PermissionError:
            if delay is None:
                return False
            time.sleep(delay)


def signer_fingerprints(path):
    """SHA256 fingerprints, as ssh-keygen -l prints them, of the keys an allowed_signers file lists."""
    prints = []
    for line in path.read_text(encoding="utf-8").splitlines():
        fields = line.split()
        if not fields or fields[0].startswith("#"):
            continue
        at = next(i for i, f in enumerate(fields) if f.startswith(KEY_TYPES))
        digest = hashlib.sha256(base64.b64decode(fields[at + 1])).digest()
        prints.append("SHA256:" + base64.b64encode(digest).decode().rstrip("="))
    return prints


def verify_signature(root, checksums):
    """Check <checksums>.sig with ssh-keygen against the committed release_signers file."""
    signature = checksums.with_name(checksums.name + ".sig")
    require(signature.is_file(), f"Missing signature file {signature.name}")
    ssh_keygen = shutil.which("ssh-keygen")
    require(
        ssh_keygen is not None,
        "ssh-keygen (OpenSSH 8.1 or newer) is needed to check the signature",
    )
    with checksums.open("rb") as data:
        result = subprocess.run(
            [
                ssh_keygen,
                "-Y",
                "verify",
                "-f",
                str(root / RELEASE_SIGNERS),
                "-I",
                RELEASE_SIGNER,
                "-n",
                SIGNATURE_NAMESPACE,
                "-s",
                str(signature),
            ],
            stdin=data,
            capture_output=True,
            timeout=60,
            check=False,
        )
    output = (result.stdout + result.stderr).decode("utf-8", "replace").strip()
    require(
        result.returncode == 0,
        f"{checksums.name} isn't signed by the key in {RELEASE_SIGNERS.as_posix()}: {output}",
    )
    return output


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--root", type=Path, default=Path(__file__).resolve().parents[1]
    )
    parser.add_argument("--bundle", type=Path)
    parser.add_argument("--evidence", type=Path)
    parser.add_argument("--release-tag")
    parser.add_argument("--checksums", type=Path)
    parser.add_argument(
        "--development",
        action="store_true",
        help="validate development while keeping the public feed held",
    )
    parser.add_argument(
        "--held-index-sha256", help="recorded SHA-256 of the unchanged public feed"
    )
    parser.add_argument(
        "--freeze",
        type=Path,
        help="new directory for the validated bundle, catalog evidence and checksum",
    )
    parser.add_argument(
        "--bundle-sha256",
        help="expected frozen bundle hash when rechecking development",
    )
    parser.add_argument(
        "--verify-signature",
        action="store_true",
        help="also check <checksums>.sig against scripts/release_signers",
    )
    args = parser.parse_args(argv)
    args.root = args.root.resolve()
    if args.verify_signature and args.checksums is None:
        parser.error("--verify-signature needs --checksums")
    if args.development:
        if args.evidence:
            parser.error(
                "development validation reloads the bundle instead of accepting supplied evidence"
            )
        if not args.held_index_sha256 or args.release_tag:
            parser.error(
                "--development needs --held-index-sha256 and cannot propose a release tag"
            )
        if not args.freeze and (args.bundle is None or args.bundle_sha256 is None):
            parser.error("development rechecks need --bundle and --bundle-sha256")
        if args.freeze and (
            args.checksums or args.bundle_sha256 or args.verify_signature
        ):
            parser.error("freeze first, then sign and recheck the frozen checksum")
    elif args.freeze or args.held_index_sha256 or args.bundle_sha256:
        parser.error("development options need --development")
    try:
        if args.development:
            bundle = args.bundle
            if bundle is None:
                version = re.search(
                    r"^version=(.+)$",
                    (args.root / "gradle.properties").read_text(encoding="utf-8"),
                    re.MULTILINE,
                )
                require(version is not None, "Missing project version")
                bundle = args.root / "patches/build/libs" / f"patches-{version[1]}.mpp"
            if args.freeze:
                print(
                    freeze_development(
                        args.root, bundle, args.freeze, args.held_index_sha256
                    )
                )
            else:
                require(
                    not mutable_output(args.root, bundle),
                    "Recheck requires a frozen bundle outside Gradle outputs",
                )
                require(
                    hashlib.sha256(bundle.read_bytes()).hexdigest()
                    == args.bundle_sha256,
                    "Frozen bundle checksum changed",
                )
                with tempfile.TemporaryDirectory(prefix="hush-catalog-") as temporary:
                    evidence = Path(temporary) / "catalog-evidence.json"
                    validate_catalog(args.root, bundle, evidence)
                    print(
                        verify_development(
                            args.root,
                            bundle,
                            evidence,
                            args.held_index_sha256,
                            args.checksums,
                        )
                    )
                require(
                    hashlib.sha256(bundle.read_bytes()).hexdigest()
                    == args.bundle_sha256,
                    "Frozen bundle changed during validation",
                )
            if args.verify_signature:
                print(verify_signature(args.root, args.checksums))
                require(
                    hashlib.sha256(bundle.read_bytes()).hexdigest()
                    == args.bundle_sha256,
                    "Frozen bundle changed during signature verification",
                )
            require(
                hashlib.sha256(
                    (args.root / "patches-bundle.json").read_bytes()
                ).hexdigest()
                == args.held_index_sha256.lower(),
                "Held public metadata changed during validation",
            )
            return 0
        print(
            verify(
                args.root, args.bundle, args.evidence, args.release_tag, args.checksums
            )
        )
        if args.verify_signature:
            print(verify_signature(args.root, args.checksums))
        return 0
    except (
        OSError,
        ValueError,
        TypeError,
        AttributeError,
        KeyError,
        zipfile.BadZipFile,
        zlib.error,
        subprocess.SubprocessError,
    ) as error:
        print(f"CHECK FAILED: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
