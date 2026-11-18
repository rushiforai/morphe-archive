#!/usr/bin/env python3
"""Compare Android manifest identity fields between two clone APKs.

Inputs must be Android SDK 'aapt dump xmltree APK AndroidManifest.xml' text.
Conservatively checks all provider authorities, permission declarations and
usages, and OAuth/deep-link schemes and hosts. No APK secrets are inspected.
"""
from __future__ import annotations

import argparse
import re
from collections import Counter
from pathlib import Path

ELEMENT_RE = re.compile(r'^(\s*)E:\s+([^\s(]+)(?:\s|$)')
ATTRIBUTE_RE = re.compile(r'^\s*A:\s+([^\s(]+)(?:\([^)]*\))?="([^"]*)"')


def read_elements(path: Path) -> list[tuple[str, dict[str, str]]]:
    elements: list[tuple[str, dict[str, str]]] = []
    stack: list[tuple[int, dict[str, str]]] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        element = ELEMENT_RE.match(line)
        if element:
            indent, tag = element.groups()
            depth = len(indent)
            while stack and stack[-1][0] >= depth:
                stack.pop()
            attrs: dict[str, str] = {}
            elements.append((tag, attrs))
            stack.append((depth, attrs))
            continue
        attribute = ATTRIBUTE_RE.match(line)
        if attribute and stack:
            attr_name, value = attribute.groups()
            stack[-1][1][attr_name] = value
    if not elements:
        raise ValueError(f"Empty or unrecognized Android XML tree: {path}")
    return elements


def selected_values(elements: list[tuple[str, dict[str, str]]], tag: str, attr: str) -> list[str]:
    return sorted(a[attr] for t, a in elements if t == tag and attr in a)


def check_parity(ours: list[tuple[str, dict[str, str]]], upstream: list[tuple[str, dict[str, str]]]) -> dict[str, list[str]]:
    specs = {
        "provider_authorities": ("provider", "android:authorities"),
        "declared_permissions": ("permission", "android:name"),
        "permission_uses": ("uses-permission", "android:name"),
        "permission_uses_sdk23": ("uses-permission-sdk-23", "android:name"),
        "deeplink_schemes": ("data", "android:scheme"),
        "deeplink_hosts": ("data", "android:host"),
        "activity_task_affinity": ("activity", "android:taskAffinity"),
        "service_permissions": ("service", "android:permission"),
    }
    result: dict[str, list[str]] = {}
    for label, (tag, attr) in specs.items():
        local = selected_values(ours, tag, attr)
        original = selected_values(upstream, tag, attr)
        if local != original:
            raise ValueError(f"{label} parity mismatch: integrated={local} original={original}")
        result[label] = local

    authorities = result["provider_authorities"]
    if not authorities or not result["permission_uses"]:
        raise ValueError("Missing required provider/permission inventory")
    authority_parts = [item for value in authorities for item in value.split(";")]
    if len(authority_parts) != len(set(authority_parts)):
        raise ValueError("Duplicate provider authority in integrated clone")
    if not all(part.startswith("eu.faircode.email.morphe") for part in authority_parts):
        raise ValueError(f"Unexpected un-cloned provider authority: {authority_parts}")
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("integrated", type=Path)
    parser.add_argument("upstream", type=Path)
    args = parser.parse_args()
    result = check_parity(read_elements(args.integrated), read_elements(args.upstream))
    print("FAIREMAIL_CLONE_UPSTREAM_MANIFEST_PARITY_PASS",
          {label: len(values) for label, values in result.items()})


if __name__ == "__main__":
    main()
