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
import zipfile
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
    "android.permission.RECEIVE_BOOT_COMPLETED",
}
FORBIDDEN_PERMISSIONS = {
    "android.permission.INSTALL_PACKAGES",
    "com.google.android.gms.permission.AD_ID",
    "android.permission.PACKAGE_USAGE_STATS",
    "android.permission.READ_CALL_LOG",
    "android.permission.READ_PHONE_NUMBERS",
    "android.provider.Telephony.SMS_RECEIVED",
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
    "android.net.VpnService",
    "ru.vk.store.feature.connect.session",
    "ru.mail.network",
    "ru.vk.store.feature.storeapp.install.referrer",
    "ru.rustore.sdk.pushclient",
    "ru.vk.store.feature.push.client",
    "ru.rustore.sdk.metrics",
    "ru.ok.tracer",
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
    "ru.rustore.sdk.pushclient",
    "ru.vk.store.feature.push.client",
    "ru.vk.store.feature.connect.session",
    "ru.vk.store.feature.storeapp.install.referrer",
    "ru.ok.tracer",
    "sid.sdk.global.utils.sms",
}

DEVICE_IDENTIFIER_STUBS = {
    "z41.hj": "a()Ljava/lang/String;",
    "b40.c": "a(Landroid/content/Context;)Ljava/lang/String;",
}

INVALID_COMPONENT_PREFIXES = ("xav.", "xid.", "xo.", "xom.", "xu.")
WORK_MANAGER_RESCHEDULE_RECEIVER = (
    "androidx.work.impl.background.systemalarm.RescheduleReceiver"
)
BOOT_COMPLETED_ACTION = "android.intent.action.BOOT_COMPLETED"


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
        component_end = len(lines)
        for attribute_index in range(index + 1, len(lines)):
            attribute_line = lines[attribute_index]
            attribute_stripped = attribute_line.lstrip()
            if not attribute_stripped:
                continue
            attribute_indent = len(attribute_line) - len(attribute_stripped)
            if attribute_indent <= element_indent:
                component_end = attribute_index
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
                {
                    "tag": element_match.group(1),
                    "name": name,
                    "enabled": enabled,
                    "body": "\n".join(lines[index:component_end]),
                }
            )

    return components, class_name_lines


def apk_inventory(apk: Path, aapt: Path, apkanalyzer: Path) -> dict:
    with zipfile.ZipFile(apk) as archive:
        libraries = {
            name: hashlib.sha256(archive.read(name)).hexdigest()
            for name in sorted(archive.namelist())
            if re.fullmatch(r"lib/[^/]+/[^/]+\.so", name)
        }
    manifest = run(str(aapt), "dump", "xmltree", str(apk), "AndroidManifest.xml")
    components, _ = manifest_components(manifest)
    packages = readable_packages(
        run(str(apkanalyzer), "dex", "packages", "--defined-only", str(apk))
    )
    if not libraries or not components:
        raise RuntimeError("APK inventory is empty or incomplete")
    return {
        "apk_sha256": hashlib.sha256(apk.read_bytes()).hexdigest(),
        "native_libraries": libraries,
        "manifest_components": sorted(f"{c['tag']}:{c['name']}" for c in components),
        "readable_packages": packages,
    }


def readable_packages(output: str) -> list[str]:
    # Single-segment obfuscated packages churn on rebuilds. Keep all dotted packages.
    packages = sorted(set(re.findall(
        r"^P d\s+\d+\s+\d+\s+\d+\s+([\w$]+(?:\.[\w$]+)+)\s*$",
        output, re.MULTILINE,
    )))
    if not packages:
        raise RuntimeError("apkanalyzer did not report any readable DEX packages")
    return packages


def inventory_diff(baseline: dict, current: dict) -> dict:
    differences = {}
    for field in ("native_libraries", "manifest_components", "readable_packages"):
        before, after = set(baseline[field]), set(current[field])
        differences[field] = {
            "added": sorted(after - before), "removed": sorted(before - after),
        }
    differences["native_libraries"]["changed"] = sorted(
        name for name in baseline["native_libraries"].keys() & current["native_libraries"].keys()
        if baseline["native_libraries"][name] != current["native_libraries"][name]
    )
    differences["review_required"] = bool(
        differences["native_libraries"]["added"]
        or differences["native_libraries"]["removed"]
        or any(name.endswith("/libbridge_helper.so")
               for name in differences["native_libraries"]["changed"])
        or differences["manifest_components"]["added"]
        or differences["manifest_components"]["removed"]
        or differences["readable_packages"]["added"]
    )
    return differences


def audit_upstream(args: argparse.Namespace) -> None:
    baseline = json.loads(args.baseline.read_text(encoding="utf-8"))
    current = apk_inventory(args.apk, args.aapt, args.apkanalyzer)
    write_json(args.output, current)
    differences = inventory_diff(baseline, current)
    print(json.dumps(differences, indent=2))
    if differences["review_required"]:
        raise RuntimeError("Upstream inventory changed; review the candidate before updating the baseline")


def audit_patched(args: argparse.Namespace) -> None:
    ad_class = "com.google.android.gms.ads.identifier.AdvertisingIdClient"
    ad_code = run(
        str(args.apkanalyzer), "dex", "code", "--class", ad_class,
        "--method", f"getAdvertisingIdInfo(Landroid/content/Context;)L{ad_class.replace('.', '/')}$Info;",
        str(args.apk),
    )
    verify_google_ad_id_stub(ad_code)
    unit_stub = ["sget-object v0, Ltt0/e0;->a:Ltt0/e0;", "return-object v0"]
    telemetry_stubs = {
        "x41.i0": ("invoke()Ljava/lang/Object;", unit_stub),
        "x41.t0": ("a(Ljava/util/List;)V", ["return-void"]),
        "hn1.d": ("a(Lzt0/c;)Ljava/lang/Object;", unit_stub),
        "qn2.l": ("b(Lzt0/c;)Ljava/lang/Object;", unit_stub),
    }
    for class_name, (method, expected) in telemetry_stubs.items():
        code = run(str(args.apkanalyzer), "dex", "code", "--class", class_name,
                   "--method", method, str(args.apk))
        verify_instruction_prefix(code, expected, class_name)
    for class_name, method in DEVICE_IDENTIFIER_STUBS.items():
        code = run(str(args.apkanalyzer), "dex", "code", "--class", class_name,
                   "--method", method, str(args.apk))
        verify_device_identifier_stub(code, class_name)
    startup_code = run(str(args.apkanalyzer), "dex", "code", "--class", "ru.vk.store.App",
                       "--method", "onCreate()V", str(args.apk))
    verify_instruction_prefix(startup_code, push_service_cleanup_prefix(), "Push service cleanup")
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
    boot_action_lines = [
        line
        for line in manifest_lines
        if ":name(" in line and f'="{BOOT_COMPLETED_ACTION}"' in line
    ]
    work_manager_boot_receivers = [
        component
        for component in components
        if component["name"] == WORK_MANAGER_RESCHEDULE_RECEIVER
        and BOOT_COMPLETED_ACTION in str(component["body"])
    ]
    invalid_boot_reschedule = (
        len(boot_action_lines) != 1 or len(work_manager_boot_receivers) != 1
    )
    if (
        missing
        or forbidden
        or forbidden_anchors
        or invalid_component_names
        or enabled_disabled_components
        or invalid_boot_reschedule
    ):
        raise RuntimeError(
            "Patched manifest audit failed; "
            f"missing={missing}, forbidden={forbidden}, "
            f"forbidden_anchors={forbidden_anchors}, "
            f"invalid_component_names={invalid_component_names}, "
            f"enabled_or_missing_disabled_components={enabled_disabled_components}, "
            f"boot_action_count={len(boot_action_lines)}, "
            f"work_manager_boot_receiver_count={len(work_manager_boot_receivers)}"
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
                "work_manager_boot_rescheduler_preserved": True,
                "google_ad_id_lookup_stubbed": True,
                "direct_telemetry_stubbed": sorted(telemetry_stubs),
                "stable_device_identifiers_stubbed": sorted(DEVICE_IDENTIFIER_STUBS),
                "persisted_push_services_disabled_at_startup": True,
            },
            indent=2,
        )
    )


def verify_instruction_prefix(code: str, expected: list[str], name: str) -> None:
    code = re.sub(r"(?ms)^\s*\.annotation\b.*?^\s*\.end annotation\s*$", "", code)
    instructions = [
        line.strip() for line in code.splitlines()
        if line.strip() and not line.strip().startswith((".", ":", "#"))
    ]
    if instructions[:len(expected)] != expected:
        raise RuntimeError(f"{name} entry-point audit failed")


def verify_google_ad_id_stub(code: str) -> None:
    info = "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;"
    expected = [
        f"new-instance v0, {info}",
        'const-string v1, "00000000-0000-0000-0000-000000000000"',
        "const/4 v2, 0x1",
        f"invoke-direct {{v0, v1, v2}}, {info}-><init>(Ljava/lang/String;Z)V",
        "return-object v0",
    ]
    verify_instruction_prefix(code, expected, "Google advertising-ID lookup")


def verify_device_identifier_stub(code: str, name: str) -> None:
    expected = [
        'const-string v0, "00000000-0000-0000-0000-000000000000"',
        "return-object v0",
    ]
    verify_instruction_prefix(code, expected, name)


def push_service_cleanup_prefix() -> list[str]:
    expected = [
        "move-object/from16 v6, p0",
        "invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;",
        "move-result-object v0",
    ]
    for service in ("com.vk.push.authsdk.ipc.AuthService", "com.vk.push.pushsdk.ipc.PushService",
                    "com.vk.push.pushsdk.masterhost.MasterSelectionService"):
        expected.extend([
            "new-instance v1, Landroid/content/ComponentName;",
            f'const-string v2, "{service}"',
            "invoke-direct {v1, v6, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V",
            "const/4 v3, 0x2",
            "const/4 v4, 0x1",
            "invoke-virtual {v0, v1, v3, v4}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V",
        ])
    return expected


def promote(args: argparse.Namespace) -> None:
    metadata = json.loads(args.metadata.read_text(encoding="utf-8"))
    inspection = json.loads(args.inspection.read_text(encoding="utf-8"))
    state = json.loads(args.state.read_text(encoding="utf-8"))
    constants = args.constants.read_text(encoding="utf-8")
    inventory = json.loads(args.inventory.read_text(encoding="utf-8"))
    baseline = json.loads(args.baseline.read_text(encoding="utf-8"))
    if inventory["apk_sha256"] != inspection["sha256"]:
        raise RuntimeError("Inventory and inspection refer to different APKs")
    if inventory_diff(baseline, inventory)["review_required"]:
        raise RuntimeError("Cannot promote an APK with unreviewed inventory changes")

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

    upstream_parser = commands.add_parser("audit-upstream")
    upstream_parser.add_argument("--apk", type=Path, required=True)
    upstream_parser.add_argument("--aapt", type=Path, required=True)
    upstream_parser.add_argument("--apkanalyzer", type=Path, required=True)
    upstream_parser.add_argument("--baseline", type=Path, required=True)
    upstream_parser.add_argument("--output", type=Path, required=True)
    upstream_parser.set_defaults(handler=audit_upstream)

    audit_parser = commands.add_parser("audit-patched")
    audit_parser.add_argument("--apk", type=Path, required=True)
    audit_parser.add_argument("--aapt", type=Path, required=True)
    audit_parser.add_argument("--apkanalyzer", type=Path, required=True)
    audit_parser.set_defaults(handler=audit_patched)

    promote_parser = commands.add_parser("promote")
    promote_parser.add_argument("--metadata", type=Path, required=True)
    promote_parser.add_argument("--inspection", type=Path, required=True)
    promote_parser.add_argument("--state", type=Path, required=True)
    promote_parser.add_argument("--constants", type=Path, required=True)
    promote_parser.add_argument("--inventory", type=Path, required=True)
    promote_parser.add_argument("--baseline", type=Path, required=True)
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
