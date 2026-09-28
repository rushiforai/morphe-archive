#!/usr/bin/env python3
"""Check Messenger APK certificates and native compatibility without changing a phone."""

import argparse
import hashlib
import os
import re
import struct
import subprocess
import sys
import tempfile
import zlib
from dataclasses import dataclass
from pathlib import Path
from zipfile import ZIP_DEFLATED, ZIP_STORED, BadZipFile, ZipFile

STOCK_SHA256 = {
    346013387: "128ec75e836f24328d2b28777091c03b20abba0adc536e7ee911ee5fe52e70bc",
    346013440: "e7d3c64227a7d9a26adda4e89321a87a49c85ee9e9f28f2fa7ed7fa79ae15cf6",
}


@dataclass(frozen=True)
class Apk:
    package: str
    version_code: int
    version_name: str
    permissions: frozenset[str]
    signers: frozenset[str]


def run(command: list[str]) -> str:
    result = subprocess.run(
        command,
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        timeout=120,
        check=False,
    )
    if result.returncode:
        detail = (result.stderr or result.stdout).strip()[-2000:]
        raise ValueError(
            f"{Path(command[0]).name} failed ({result.returncode}): {detail}"
        )
    return result.stdout


def active_signers(output: str, sdk: int) -> frozenset[str]:
    """Select current APK signers for this API level, excluding the source stamp."""
    output = "\n".join(line.lstrip() for line in output.splitlines())
    counts = [
        line for line in output.splitlines() if line.startswith("Number of signers:")
    ]
    count = (
        re.fullmatch(r"Number of signers: (\d+)", counts[0])
        if len(counts) == 1
        else None
    )
    records = re.findall(
        r"^Signer .*certificate SHA-256 digest:.*$", output, re.MULTILINE
    )
    selected = []
    identities = set()
    numbers = set()
    for record in records:
        match = re.fullmatch(
            r"Signer (?:#(\d+)|\(minSdkVersion=(\d+), maxSdkVersion=(\d+)\)) "
            r"certificate SHA-256 digest: ([0-9a-fA-F]{64})",
            record,
        )
        if not match:
            raise ValueError("Unrecognized apksigner certificate output")
        number, lower, upper, digest = match.groups()
        identity = (number, lower, upper)
        if identity in identities or (lower is not None and int(lower) > int(upper)):
            raise ValueError("Ambiguous apksigner certificate output")
        identities.add(identity)
        if number is not None:
            numbers.add(int(number))
        if lower is None or int(lower) <= sdk <= int(upper):
            selected.append(digest.lower())
    if (
        not count
        or not selected
        or len(selected) != int(count[1])
        or len(set(selected)) != len(selected)
        or (numbers and numbers != set(range(1, len(selected) + 1)))
    ):
        raise ValueError(
            "Cannot establish the complete current signer set for this Android version"
        )
    return frozenset(selected)


def permission_owners(output: str) -> dict[str, str]:
    owners = {}
    permission = None
    for line in output.splitlines():
        if line.lstrip().startswith("+ permission:") and not re.fullmatch(
            r"\s*\+ permission:([\w.]+)\s*", line
        ):
            raise ValueError("Malformed device permission record")
        match = re.fullmatch(r"\s*\+ permission:([\w.]+)\s*", line)
        if match:
            if permission is not None:
                raise ValueError(f"Missing permission owner: {permission}")
            permission = match[1]
        elif line.lstrip().startswith("package:"):
            match = re.fullmatch(r"\s*package:([A-Za-z0-9_.]+)\s*", line)
            if not match or permission is None:
                raise ValueError("Malformed or unexpected permission owner record")
            if permission in owners:
                raise ValueError(f"Duplicate permission owner record: {permission}")
            owners[permission] = match[1]
            permission = None
    if permission is not None or "android.permission.INTERNET" not in owners:
        raise ValueError("Incomplete device permission inventory")
    return owners


def user_ids(output: str) -> list[int]:
    """Read user IDs without retaining or printing personal profile names."""
    lines = [line.strip() for line in output.splitlines() if line.strip()]
    if not lines or lines.pop(0) != "Users:":
        raise ValueError("Cannot read the Android user inventory")
    users = []
    for line in lines:
        match = re.fullmatch(r"UserInfo\{(\d+):.*:[0-9a-fA-F]+\}(?: running)?", line)
        if not match or int(match[1]) in users:
            raise ValueError("Incomplete or ambiguous Android user inventory")
        users.append(int(match[1]))
    if 0 not in users:
        raise ValueError("Incomplete Android user inventory")
    return users


def package_names(output: str) -> set[str]:
    packages = set()
    for line in output.splitlines():
        if not line.strip():
            continue
        match = re.fullmatch(r"package:([A-Za-z0-9_.]+)", line.strip())
        if not match or match[1] in packages:
            raise ValueError("Malformed or ambiguous installed package inventory")
        packages.add(match[1])
    if "android" not in packages:
        raise ValueError("Incomplete installed package inventory")
    return packages


def read_apk(path: Path, args: argparse.Namespace, sdk: int) -> Apk:
    aapt = str(args.build_tools / ("aapt2.exe" if os.name == "nt" else "aapt2"))
    badging = run([aapt, "dump", "badging", str(path)])
    records = [
        line.lstrip()
        for line in badging.splitlines()
        if line.lstrip().startswith("package:")
    ]
    match = (
        re.match(
            r"^package: name='([^']+)' versionCode='(\d+)' versionName='([^']*)'",
            records[0],
        )
        if len(records) == 1
        else None
    )
    if not match or not re.fullmatch(r"[A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)+", match[1]):
        raise ValueError("Cannot read APK package and version")
    permission_output = [
        line.lstrip()
        for line in run([aapt, "dump", "permissions", str(path)]).splitlines()
    ]
    if [line for line in permission_output if line.startswith("package:")] != [
        f"package: {match[1]}"
    ]:
        raise ValueError("Cannot establish the APK permission package")
    permissions = set()
    for line in permission_output:
        if not line.startswith("permission:"):
            continue
        declaration = re.fullmatch(r"permission: ([A-Za-z0-9_.]+)", line)
        if not declaration or declaration[1] in permissions:
            raise ValueError("Malformed or duplicate APK permission declaration")
        permissions.add(declaration[1])
    verified = run(
        [
            str(args.java),
            "-jar",
            str(args.build_tools / "lib" / "apksigner.jar"),
            "verify",
            "--verbose",
            "--print-certs",
            "--min-sdk-version",
            str(sdk),
            "--max-sdk-version",
            str(sdk),
            str(path),
        ]
    )
    return Apk(
        match[1],
        int(match[2]),
        match[3],
        frozenset(permissions),
        active_signers(verified, sdk),
    )


def conflicts(
    candidate: Apk, installed: dict[str, Apk], owners: dict[str, str]
) -> list[str]:
    problems = []
    previous = installed.get(candidate.package)
    if previous:
        if previous.signers != candidate.signers:
            problems.append(
                f"{candidate.package}: current signing certificates differ from the installed app. "
                "Keep its data intact. This check does not approve certificate rotation or replacement."
            )
        if previous.version_code > candidate.version_code:
            problems.append(
                f"Version downgrade: installed {previous.version_code}, candidate {candidate.version_code}."
            )
    for permission in sorted(candidate.permissions):
        owner = owners.get(permission)
        if owner and owner != candidate.package:
            if owner not in installed:
                raise ValueError(f"Cannot verify permission owner {owner}")
            if installed[owner].signers != candidate.signers:
                problems.append(
                    f"{permission}: owned by {owner} with different current signing certificates. "
                    "Use the same signing key for apps sharing this permission."
                )
    return problems


def native_extraction(output: str) -> bool:
    """Read only the application's flag, not an attribute on a child element."""
    lines = output.splitlines()
    applications = [
        index
        for index, line in enumerate(lines)
        if re.fullmatch(r"\s*E: application(?: \(line=\d+\))?", line)
    ]
    if len(applications) != 1:
        raise ValueError("Cannot read the manifest application element")
    index = applications[0]
    indent = len(lines[index]) - len(lines[index].lstrip())
    values = []
    for line in lines[index + 1 :]:
        depth = len(line) - len(line.lstrip())
        if line.strip() and depth <= indent:
            break
        if depth == indent + 2 and "extractNativeLibs" in line:
            match = re.fullmatch(
                r"\s*A: (?:http://schemas.android.com/apk/res/android:|android:)extractNativeLibs(?:\(0x[0-9a-fA-F]+\))?=(true|false|\(type 0x12\)0x(?:0+|f+))",
                line,
            )
            if not match:
                raise ValueError("Cannot read extractNativeLibs")
            values.append(
                match[1] == "true"
                or (
                    match[1].startswith("(type")
                    and int(match[1].rsplit("0x", 1)[1], 16) != 0
                )
            )
    if len(values) > 1:
        raise ValueError("Duplicate extractNativeLibs attributes")
    return values[0] if values else True


def native_libraries(
    path: Path, page_size: int, extract: bool
) -> tuple[dict[str, str], int, int]:
    """Validate packaged arm64 ELF segments and hash decompressed library bytes."""
    libraries = {}
    alignments = []
    compressed = 0
    with ZipFile(path) as archive, path.open("rb") as raw:
        for entry in archive.infolist():
            if not entry.filename.startswith("lib/") or not entry.filename.endswith(
                ".so"
            ):
                continue
            if not re.fullmatch(r"lib/arm64-v8a/[^/]+\.so", entry.filename):
                raise ValueError(
                    "The APK must contain only the supported arm64-v8a libraries"
                )
            if entry.filename in libraries or entry.flag_bits & 1:
                raise ValueError("Duplicate or encrypted native library entry")
            if entry.compress_type not in {ZIP_STORED, ZIP_DEFLATED}:
                raise ValueError("Unsupported native-library ZIP compression")
            if not extract:
                if entry.compress_type != ZIP_STORED:
                    raise ValueError(
                        "Compressed native libraries require extractNativeLibs=true"
                    )
                raw.seek(entry.header_offset)
                header = raw.read(30)
                if len(header) != 30 or header[:4] != b"PK\x03\x04":
                    raise ValueError("Cannot read the native-library ZIP header")
                name_size, extra_size = struct.unpack_from("<HH", header, 26)
                if (entry.header_offset + 30 + name_size + extra_size) % page_size:
                    raise ValueError(
                        f"Native-library ZIP data is not aligned to {page_size} bytes"
                    )
            compressed += entry.compress_type != ZIP_STORED
            with archive.open(entry) as source:
                header = source.read(64)
                if (
                    len(header) != 64
                    or header[:7] != b"\x7fELF\x02\x01\x01"
                    or struct.unpack_from("<HH", header, 16) != (3, 183)
                ):
                    raise ValueError(
                        "A packaged library is not a valid arm64 ELF shared object"
                    )
                offset = struct.unpack_from("<Q", header, 32)[0]
                size, count = struct.unpack_from("<HH", header, 54)
                if (
                    size != 56
                    or not count
                    or offset < 64
                    or offset + size * count > entry.file_size
                ):
                    raise ValueError("Invalid ELF program-header table")
                source.seek(offset)
                table = source.read(size * count)
                if len(table) != size * count:
                    raise ValueError("Truncated ELF program-header table")
                loads = 0
                for number in range(count):
                    (
                        kind,
                        _,
                        file_offset,
                        address,
                        _,
                        file_size,
                        memory_size,
                        alignment,
                    ) = struct.unpack_from("<IIQQQQQQ", table, number * size)
                    if kind != 1:
                        continue
                    loads += 1
                    if (
                        file_offset + file_size > entry.file_size
                        or file_size > memory_size
                    ):
                        raise ValueError("Invalid ELF load-segment bounds")
                    if (
                        alignment < page_size
                        or alignment & (alignment - 1)
                        or file_offset % page_size != address % page_size
                    ):
                        raise ValueError(
                            f"Native ELF load segments are not aligned to {page_size} bytes"
                        )
                    alignments.append(alignment)
                if not loads:
                    raise ValueError("Native library has no ELF load segments")
                source.seek(0)
                libraries[entry.filename] = hashlib.file_digest(
                    source, "sha256"
                ).hexdigest()
                if source.tell() != entry.file_size:
                    raise ValueError("Truncated native-library ZIP data")
    if not libraries:
        raise ValueError("The APK has no packaged arm64-v8a native libraries")
    return libraries, min(alignments), compressed


def check_native(
    args: argparse.Namespace, candidate: Apk, sdk: int, adb: list[str]
) -> None:
    abis = run(adb + ["shell", "getprop", "ro.product.cpu.abilist"]).strip().split(",")
    if not abis or any(not re.fullmatch(r"[A-Za-z0-9_-]+", abi) for abi in abis):
        raise ValueError("Cannot read the device ABI list")
    if "arm64-v8a" not in abis:
        raise ValueError("The selected Android device cannot run this arm64-v8a APK")
    page_size = int(run(adb + ["shell", "getconf", "PAGE_SIZE"]).strip())
    if page_size < 4096 or page_size > 65536 or page_size & (page_size - 1):
        raise ValueError("Cannot establish the device memory page size")
    aapt = str(args.build_tools / ("aapt2.exe" if os.name == "nt" else "aapt2"))
    extract = native_extraction(
        run([aapt, "dump", "xmltree", str(args.apk), "--file", "AndroidManifest.xml"])
    )
    libraries, alignment, compressed = native_libraries(args.apk, page_size, extract)
    print(
        f"Native APK ABI: arm64-v8a; device ABIs: {', '.join(abis)}; page size: {page_size} bytes"
    )
    print(
        f"Native libraries: {len(libraries)} ({compressed} compressed); minimum ELF alignment: {alignment} bytes"
    )
    baseline = getattr(args, "stock_apk", None)
    if baseline is None:
        print(
            "Native-library preservation not checked; provide --stock-apk for comparison."
        )
        return
    with baseline.open("rb") as source:
        digest = hashlib.file_digest(source, "sha256").hexdigest()
    if digest != STOCK_SHA256[candidate.version_code]:
        raise ValueError(
            "Stock baseline SHA-256 does not match the tested original for this build"
        )
    stock, _, _ = native_libraries(baseline, page_size, True)
    if libraries != stock:
        raise ValueError(
            "Native library names or decompressed bytes differ from the stock baseline"
        )
    print(
        "Native library names and decompressed bytes match the verified stock baseline."
    )


def check(args: argparse.Namespace) -> int:
    adb = [str(args.adb), "-s", args.serial]
    if run(adb + ["get-state"]).strip() != "device":
        raise ValueError("The selected phone is not connected and authorized")
    sdk = int(run(adb + ["shell", "getprop", "ro.build.version.sdk"]).strip())
    if sdk < 28:
        raise ValueError("This preview requires Android 9 (API 28) or newer")
    candidate = read_apk(args.apk, args, sdk)
    if (
        candidate.package != "com.facebook.orca"
        or candidate.version_name != "580.0.0.49.91"
        or candidate.version_code not in {346013387, 346013440}
    ):
        raise ValueError(
            "Use Messenger 580.0.0.49.91, version code 346013387 or 346013440"
        )
    if not candidate.permissions:
        raise ValueError("Messenger permission declarations are missing")
    with args.apk.open("rb") as source:
        digest = hashlib.file_digest(source, "sha256").hexdigest()
    print(
        f"Candidate: {candidate.package} {candidate.version_name} ({candidate.version_code})"
    )
    print(f"APK SHA-256: {digest}")
    print(f"Device API: {sdk}; installed package lookup: all Android users")
    print(f"Candidate certificate SHA-256: {', '.join(sorted(candidate.signers))}")
    check_native(args, candidate, sdk, adb)

    owners = permission_owners(run(adb + ["shell", "pm", "list", "permissions", "-f"]))
    packages = {}
    for user in user_ids(run(adb + ["shell", "pm", "list", "users"])):
        for package in package_names(
            run(adb + ["shell", "pm", "list", "packages", "--user", str(user)])
        ):
            packages.setdefault(package, user)
    required = {owners[name] for name in candidate.permissions if name in owners}
    required.update(packages.keys() & {candidate.package, "com.facebook.katana"})
    installed = {}
    with tempfile.TemporaryDirectory(prefix="hushmessenger-certificates-") as scratch:
        for index, package in enumerate(sorted(required)):
            if package not in packages:
                raise ValueError(f"Cannot locate installed permission owner {package}")
            paths = run(
                adb + ["shell", "pm", "path", "--user", str(packages[package]), package]
            ).splitlines()
            if any(
                not re.fullmatch(r"package:/[^\r\n]+\.apk", line) for line in paths
            ) or len(paths) != len(set(paths)):
                raise ValueError(f"Malformed APK path inventory for {package}")
            paths = [line.removeprefix("package:") for line in paths]
            base = [path for path in paths if path.endswith("/base.apk")]
            if not base and len(paths) == 1:
                base = paths
            if len(base) != 1:
                raise ValueError(f"Cannot locate one readable base APK for {package}")
            local = Path(scratch) / f"{index}.apk"
            run(adb + ["pull", base[0], str(local)])
            info = read_apk(local, args, sdk)
            if info.package != package:
                raise ValueError(
                    f"Installed APK identity changed while checking {package}"
                )
            installed[package] = info
            print(
                f"Installed {package} certificate SHA-256: {', '.join(sorted(info.signers))}"
            )
    problems = conflicts(candidate, installed, owners)
    if problems:
        for problem in problems:
            print(f"CONFLICT: {problem}")
        return 1
    print(
        "Certificate check passed. Installation, cross-app trust and Messenger runtime behavior remain unverified."
    )
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apk", type=Path, required=True)
    parser.add_argument(
        "--stock-apk",
        type=Path,
        help="Optional exact stock APK for native-library preservation checks",
    )
    parser.add_argument("--serial", required=True, help="Exact adb device serial")
    parser.add_argument(
        "--build-tools",
        type=Path,
        required=True,
        help="Android SDK Build Tools directory (tested with 36.1.0)",
    )
    parser.add_argument("--java", type=Path, default=Path("java"))
    parser.add_argument("--adb", type=Path, default=Path("adb"))
    args = parser.parse_args()
    try:
        return check(args)
    except subprocess.TimeoutExpired:
        print(
            "CHECK FAILED: A required tool exceeded the 120-second limit.",
            file=sys.stderr,
        )
        return 2
    except (OSError, ValueError, BadZipFile, zlib.error) as error:
        print(f"CHECK FAILED: {error}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
