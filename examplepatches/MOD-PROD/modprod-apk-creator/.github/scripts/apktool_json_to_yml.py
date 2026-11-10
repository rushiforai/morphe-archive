#!/usr/bin/env python3
"""
Convertit apktool.json (format Apktool M, téléphone) en apktool.yml (format Apktool PC).

Les sources de base-app/apk-src restent au format Apktool M pour être éditées sur le téléphone ;
la compilation automatique (GitHub Actions) utilise Apktool PC, qui lit apktool.yml.

python3 apktool_json_to_yml.py <dossier-apk-src> <version-apktool>
"""

import json
import sys
from pathlib import Path


def q(value):
    """Valeur YAML simple, entre guillemets si nécessaire."""
    if value is None:
        return "null"
    if isinstance(value, bool):
        return "true" if value else "false"
    text = str(value)
    if text == "" or any(c in text for c in ":#{}[],&*?|<>=!%@`'\"") or text.strip() != text:
        return "'" + text.replace("'", "''") + "'"
    return text


def main():
    src = Path(sys.argv[1])
    version = sys.argv[2] if len(sys.argv) > 2 else "2.12.1"
    data = json.loads((src / "apktool.json").read_text(encoding="utf-8"))

    pkg = data.get("PackageInfo") or {}
    ver = data.get("VersionInfo") or {}
    sdk = data.get("sdkInfo") or {}
    fw = data.get("UsesFramework") or {}

    lines = [
        f"version: {version}",
        f"apkFileName: {q(data.get('apkFileName') or 'base.apk')}",
        f"isFrameworkApk: {q(bool(data.get('isFrameworkApk')))}",
        "usesFramework:",
        "  ids:",
        *[f"  - {i}" for i in (fw.get("ids") or [1])],
        f"  tag: {q(fw.get('tag'))}",
        "sdkInfo:",
        *[f"  {k}: {q(str(v))}" for k, v in sdk.items()],
        "packageInfo:",
        f"  forcedPackageId: {q(str(pkg.get('forcedPackageId') or '127'))}",
        f"  renameManifestPackage: {q(pkg.get('renameManifestPackage'))}",
        "versionInfo:",
        f"  versionCode: {q(str(ver.get('versionCode') or '1'))}",
        f"  versionName: {q(str(ver.get('versionName') or '1.0'))}",
        f"resourcesAreCompressed: {q(bool(data.get('compressionType')))}",
        f"sharedLibrary: {q(bool(data.get('sharedLibrary')))}",
        f"sparseResources: {q(bool(data.get('sparseResources')))}",
        "doNotCompress:",
        *[f"- {q(x)}" for x in (data.get("doNotCompress") or [])],
    ]

    unknown = data.get("unknownFiles") or {}
    if unknown:
        lines.append("unknownFiles:")
        lines += [f"  {q(k)}: {q(str(v))}" for k, v in sorted(unknown.items())]

    (src / "apktool.yml").write_text("\n".join(lines) + "\n", encoding="utf-8")
    print((src / "apktool.yml").read_text(encoding="utf-8"))


if __name__ == "__main__":
    main()
