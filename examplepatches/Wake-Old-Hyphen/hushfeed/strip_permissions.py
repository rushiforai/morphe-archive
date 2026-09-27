#!/usr/bin/env python3
import sys
import os
import re
import json

ALLOWLIST = {
    "android.permission.INTERNET",
    "android.permission.ACCESS_NETWORK_STATE",
    "android.permission.ACCESS_WIFI_STATE",
    "android.permission.WAKE_LOCK",
    "android.permission.FOREGROUND_SERVICE",
    "android.permission.FOREGROUND_SERVICE_DATA_SYNC",
    "android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK",
    "android.permission.MODIFY_AUDIO_SETTINGS",
    "android.permission.READ_EXTERNAL_STORAGE",
    "android.permission.WRITE_EXTERNAL_STORAGE",
}


def strip_permissions(decoded_path):
    manifest_path = os.path.join(decoded_path, "AndroidManifest.xml")
    if not os.path.exists(manifest_path):
        print(f"❌ ERROR: AndroidManifest.xml not found at {manifest_path}")
        sys.exit(1)

    with open(manifest_path, "r", encoding="utf-8") as f:
        content = f.read()

    removed_list = []
    perm_pattern = re.compile(
        r'<(?:uses-permission|uses-permission-sdk-23)\s+[^>]*android:name="([^"]+)"[^>]*/>',
        re.DOTALL
    )

    def replace_perm(match):
        perm_name = match.group(1)
        if perm_name not in ALLOWLIST:
            removed_list.append(perm_name)
            return ""
        return match.group(0)

    content = perm_pattern.sub(replace_perm, content)

    fgs_type_map = {
        "android.permission.CAMERA": "camera",
        "android.permission.RECORD_AUDIO": "microphone",
        "android.permission.ACCESS_FINE_LOCATION": "location",
        "android.permission.ACCESS_COARSE_LOCATION": "location",
        "android.permission.BODY_SENSORS": "health",
    }
    for perm, fgs_type in fgs_type_map.items():
        if perm not in ALLOWLIST:
            def strip_fgs(match, t=fgs_type):
                types = match.group(1).split("|")
                filtered = [x.strip() for x in types if x.strip() != t]
                if not filtered:
                    return ""
                return 'android:foregroundServiceType="' + "|".join(filtered) + '"'
            content = re.sub(
                rf'android:foregroundServiceType="([^"]*\b{fgs_type}\b[^"]*)"',
                strip_fgs,
                content
            )

    with open(manifest_path, "w", encoding="utf-8") as f:
        f.write(content)

    # Machine-readable report for the release-notes generator
    os.makedirs("build", exist_ok=True)
    with open("build/permissions_report.json", "w") as f:
        json.dump({"removed": sorted(removed_list), "kept": sorted(ALLOWLIST)}, f, indent=2)

    print(f"✅ Removed {len(removed_list)} permissions, kept {len(ALLOWLIST)}")
    print(f"✅ Wrote build/permissions_report.json")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 strip_permissions.py <path_to_decoded_apk>")
        sys.exit(1)
    strip_permissions(sys.argv[1])