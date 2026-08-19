#!/usr/bin/env python3
"""Cheaply probe RuStore and validate changed APKs for the patch pipeline."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
import urllib.request
from datetime import datetime, timezone
from pathlib import Path


PACKAGE_NAME = "ru.vk.store"
OFFICIAL_SIGNER_SHA256 = (
    "661f20828ef780de0b79bc59f26a30864316355f30e4f91cfa14a20791839914"
)
REQUIRED_PERMISSIONS = {
    "android.permission.QUERY_ALL_PACKAGES",
    "com.android.permission.GET_INSTALLED_APPS",
    "android.permission.REQUEST_INSTALL_PACKAGES",
    "android.permission.UPDATE_PACKAGES_WITHOUT_USER_ACTION",
    "android.permission.ENFORCE_UPDATE_OWNERSHIP",
    "android.permission.REQUEST_DELETE_PACKAGES",
    "android.permission.POST_NOTIFICATIONS",
    "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS",
}
FORBIDDEN_PERMISSIONS = {
    "android.permission.INSTALL_PACKAGES",
    "com.google.android.gms.permission.AD_ID",
    "android.permission.PACKAGE_USAGE_STATS",
    "android.permission.READ_CALL_LOG",
    "android.permission.READ_PHONE_NUMBERS",
    "android.provider.Telephony.SMS_RECEIVED",
    "android.permission.RECEIVE_BOOT_COMPLETED",
    "android.permission.CHANGE_WIFI_STATE",
    "android.permission.CHANGE_NETWORK_STATE",
    "com.google.android.c2dm.permission.RECEIVE",
    "android.permission.CALL_PHONE",
    "ru.sb.mobile.sid.BIND_PERSONALIZATION_SERVICE",
    "android.permission.ACCESS_FINE_LOCATION",
    "android.permission.ACCESS_COARSE_LOCATION",
    "android.permission.READ_BASIC_PHONE_STATE",
    "com.google.android.providers.gsf.permission.READ_GSERVICES",
    "com.android.vending.BILLING",
    "android.permission.USB_HOST",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
    "android.permission.WRITE_EXTERNAL_STORAGE",
    "com.huawei.appmarket.service.commondata.permission.GET_COMMON_DATA",
    "android.permission.BIND_VPN_SERVICE",
}
FORBIDDEN_MANIFEST_ANCHORS = {
    "android.intent.action.BOOT_COMPLETED",
    "android.net.VpnService",
    "ru.vk.store.feature.connect.session",
    "ru.mail.network",
    "ru.vk.store.feature.storeapp.install.referrer",
    "ru.rustore.sdk.pushclient.provider",
    "ru.rustore.sdk.metrics",
    "ru.mail.libverify",
    "ru.mail.verify",
    "sid.sdk.global.utils.sms",
    "io.appmetrica",
    "com.my.target",
    "com.vk.push",
    "com.vk.superapp.logs",
    "com.inappstory.sdk",
    "com.kavsdk",
    "kavsdk.",
    "com.google.android.datatransport",
}

DISABLED_COMPONENT_PREFIXES = {
    "com.google.android.datatransport",
    "com.inappstory.sdk",
    "com.kavsdk",
    "com.my.target",
    "com.vk.push",
    "com.vk.superapp.logs",
    "io.appmetrica",
    "ru.mail.libverify",
    "ru.mail.network",
    "ru.mail.verify",
    "ru.rustore.sdk.metrics",
    "ru.rustore.sdk.pushclient.provider",
    "ru.vk.store.feature.connect.session",
    "ru.vk.store.feature.storeapp.install.referrer",
    "sid.sdk.global.utils.sms",
}

INVALID_COMPONENT_PREFIXES = ("xav.", "xid.", "xo.", "xom.", "xu.")


def run(*command: str) -> str:
    result = subprocess.run(command, check=True, text=True, capture_output=True)
    return result.stdout + result.stderr


def write_json(path: Path, value: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def github_output(path: Path | None, values: dict[str, object]) -> None:
    if path is None:
        return
    with path.open("a", encoding="utf-8") as output:
        for key, value in values.items():
            if isinstance(value, bool):
                value = str(value).lower()
            output.write(f"{key}={value}\n")


def probe(args: argparse.Namespace) -> None:
    request = urllib.request.Request(
        args.url,
        method="HEAD",
        headers={"User-Agent": "rustore-privacy-patches/1.0"},
    )
    with urllib.request.urlopen(request, timeout=30) as response:
        metadata = {
            "url": response.geturl(),
            "content_length": int(response.headers.get("Content-Length", "0")),
            "etag": response.headers.get("ETag", ""),
            "last_modified": response.headers.get("Last-Modified", ""),
            "checked_at": datetime.now(timezone.utc).isoformat(),
        }

    state = json.loads(args.state.read_text(encoding="utf-8"))
    previous = state.get("http", {})
    compared_fields = ("content_length", "etag", "last_modified")
    changed = args.force or any(
        metadata[field] != previous.get(field) for field in compared_fields
    )
    write_json(args.metadata, metadata)
    github_output(
        args.github_output,
        {
            "changed": changed,
            "content_length": metadata["content_length"],
            "etag": metadata["etag"],
            "last_modified": metadata["last_modified"],
        },
    )
    print(json.dumps({"changed": changed, **metadata}, indent=2))


def inspect_apk(args: argparse.Namespace) -> None:
    badging = run(str(args.aapt), "dump", "badging", str(args.apk))
    package_match = re.search(
        r"^package: name='([^']+)' versionCode='([^']+)' versionName='([^']+)'",
        badging,
        re.MULTILINE,
    )
    if package_match is None:
        raise RuntimeError("aapt did not report APK package metadata")
    package_name, version_code, version_name = package_match.groups()
    if package_name != PACKAGE_NAME:
        raise RuntimeError(f"Unexpected package: {package_name}")

    signer_output = run(
        str(args.apksigner), "verify", "--print-certs", str(args.apk)
    )
    signer_match = re.search(
        r"Signer #1 certificate SHA-256 digest: ([0-9a-fA-F]+)", signer_output
    )
    if signer_match is None:
        raise RuntimeError("apksigner did not report a SHA-256 certificate digest")
    signer = signer_match.group(1).lower()
    if args.require_official_signer and signer != OFFICIAL_SIGNER_SHA256:
        raise RuntimeError(f"Unexpected RuStore signer: {signer}")

    digest = hashlib.sha256(args.apk.read_bytes()).hexdigest()
    inspection = {
        "package_name": package_name,
        "version_code": version_code,
        "version_name": version_name,
        "sha256": digest,
        "size": args.apk.stat().st_size,
        "signer_sha256": signer,
    }
    write_json(args.output, inspection)
    github_output(
        args.github_output,
        {"version_name": version_name, "version_code": version_code, "sha256": digest},
    )
    print(json.dumps(inspection, indent=2))


def manifest_components(manifest: str) -> tuple[list[dict[str, object]], set[int]]:
    component_tags = {"activity", "activity-alias", "service", "receiver", "provider"}
    lines = manifest.splitlines()
    components: list[dict[str, object]] = []
    class_name_lines: set[int] = set()

    for index, line in enumerate(lines):
        stripped = line.lstrip()
        element_match = re.match(r"E: ([\w-]+)(?:\s|$)", stripped)
        if element_match is None or element_match.group(1) not in component_tags:
            continue

        element_indent = len(line) - len(stripped)
        name: str | None = None
        enabled: bool | None = None
        for attribute_index in range(index + 1, len(lines)):
            attribute_line = lines[attribute_index]
            attribute_stripped = attribute_line.lstrip()
            if not attribute_stripped:
                continue
            attribute_indent = len(attribute_line) - len(attribute_stripped)
            if attribute_indent <= element_indent:
                break
            if attribute_indent != element_indent + 2 or not attribute_stripped.startswith("A:"):
                continue

            name_match = re.search(r":name\([^)]*\)=\"([^\"]+)\"", attribute_stripped)
            if name_match is not None:
                name = name_match.group(1)
                class_name_lines.add(attribute_index)
            enabled_match = re.search(
                r":enabled\([^)]*\)=(?:\(type [^)]+\))?"
                r"(true|false|0x[0-9a-fA-F]+)",
                attribute_stripped,
            )
            if enabled_match is not None:
                enabled = enabled_match.group(1).lower() not in {"false", "0x0"}

        if name is not None:
            components.append(
                {"tag": element_match.group(1), "name": name, "enabled": enabled}
            )

    return components, class_name_lines


def audit_patched(args: argparse.Namespace) -> None:
    badging = run(str(args.aapt), "dump", "badging", str(args.apk))
    permissions = set(re.findall(r"uses-permission: name='([^']+)'", badging))
    missing = sorted(REQUIRED_PERMISSIONS - permissions)
    forbidden = sorted(FORBIDDEN_PERMISSIONS & permissions)
    manifest = run(
        str(args.aapt), "dump", "xmltree", str(args.apk), "AndroidManifest.xml"
    )
    components, class_name_lines = manifest_components(manifest)
    invalid_component_names = sorted(
        component["name"]
        for component in components
        if str(component["name"]).startswith(INVALID_COMPONENT_PREFIXES)
    )
    enabled_disabled_components: dict[str, list[str]] = {}
    disabled_component_counts: dict[str, int] = {}
    for prefix in sorted(DISABLED_COMPONENT_PREFIXES):
        matches = [
            component
            for component in components
            if str(component["name"]).startswith(prefix)
        ]
        disabled_component_counts[prefix] = len(matches)
        active = sorted(
            str(component["name"])
            for component in matches
            if component["enabled"] is not False
        )
        if not matches or active:
            enabled_disabled_components[prefix] = active

    manifest_lines = manifest.splitlines()
    non_component_manifest = "\n".join(
        line for index, line in enumerate(manifest_lines) if index not in class_name_lines
    )
    forbidden_anchors = sorted(
        anchor
        for anchor in FORBIDDEN_MANIFEST_ANCHORS
        if anchor in non_component_manifest
    )
    if (
        missing
        or forbidden
        or forbidden_anchors
        or invalid_component_names
        or enabled_disabled_components
    ):
        raise RuntimeError(
            "Patched manifest audit failed; "
            f"missing={missing}, forbidden={forbidden}, "
            f"forbidden_anchors={forbidden_anchors}, "
            f"invalid_component_names={invalid_component_names}, "
            f"enabled_or_missing_disabled_components={enabled_disabled_components}"
        )
    print(
        json.dumps(
            {
                "required_permissions_present": sorted(REQUIRED_PERMISSIONS),
                "forbidden_permissions_absent": sorted(FORBIDDEN_PERMISSIONS),
                "forbidden_manifest_anchors_absent": sorted(
                    FORBIDDEN_MANIFEST_ANCHORS
                ),
                "disabled_component_counts": disabled_component_counts,
                "invalid_component_prefixes_absent": list(
                    INVALID_COMPONENT_PREFIXES
                ),
            },
            indent=2,
        )
    )


def promote(args: argparse.Namespace) -> None:
    metadata = json.loads(args.metadata.read_text(encoding="utf-8"))
    inspection = json.loads(args.inspection.read_text(encoding="utf-8"))
    state = json.loads(args.state.read_text(encoding="utf-8"))
    constants = args.constants.read_text(encoding="utf-8")

    current_match = re.search(r'const val AUDITED_VERSION = "([^"]+)"', constants)
    if current_match is None:
        raise RuntimeError("Could not find the audited version constant")

    old_current = current_match.group(1)
    new_current = inspection["version_name"]
    version_changed = old_current != new_current
    if version_changed:
        constants = constants.replace(
            f'const val AUDITED_VERSION = "{old_current}"',
            f'const val AUDITED_VERSION = "{new_current}"',
        )
        args.constants.write_text(constants, encoding="utf-8")

    state["http"] = {
        key: metadata[key]
        for key in ("url", "content_length", "etag", "last_modified")
    }
    state["apk"] = inspection
    state["audited_at"] = datetime.now(timezone.utc).isoformat()
    write_json(args.state, state)
    github_output(args.github_output, {"version_changed": version_changed})
    print(json.dumps({"version_changed": version_changed, **state}, indent=2))


def parser() -> argparse.ArgumentParser:
    root = argparse.ArgumentParser()
    commands = root.add_subparsers(dest="command", required=True)

    probe_parser = commands.add_parser("probe")
    probe_parser.add_argument("--url", required=True)
    probe_parser.add_argument("--state", type=Path, required=True)
    probe_parser.add_argument("--metadata", type=Path, required=True)
    probe_parser.add_argument("--github-output", type=Path)
    probe_parser.add_argument("--force", action="store_true")
    probe_parser.set_defaults(handler=probe)

    inspect_parser = commands.add_parser("inspect")
    inspect_parser.add_argument("--apk", type=Path, required=True)
    inspect_parser.add_argument("--aapt", type=Path, required=True)
    inspect_parser.add_argument("--apksigner", type=Path, required=True)
    inspect_parser.add_argument("--output", type=Path, required=True)
    inspect_parser.add_argument("--github-output", type=Path)
    inspect_parser.add_argument("--require-official-signer", action="store_true")
    inspect_parser.set_defaults(handler=inspect_apk)

    audit_parser = commands.add_parser("audit-patched")
    audit_parser.add_argument("--apk", type=Path, required=True)
    audit_parser.add_argument("--aapt", type=Path, required=True)
    audit_parser.set_defaults(handler=audit_patched)

    promote_parser = commands.add_parser("promote")
    promote_parser.add_argument("--metadata", type=Path, required=True)
    promote_parser.add_argument("--inspection", type=Path, required=True)
    promote_parser.add_argument("--state", type=Path, required=True)
    promote_parser.add_argument("--constants", type=Path, required=True)
    promote_parser.add_argument("--github-output", type=Path)
    promote_parser.set_defaults(handler=promote)
    return root


def main() -> int:
    args = parser().parse_args()
    try:
        args.handler(args)
    except Exception as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
