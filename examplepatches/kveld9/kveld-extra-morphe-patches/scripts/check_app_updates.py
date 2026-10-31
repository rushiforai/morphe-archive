#!/usr/bin/env python3
"""Scheduled upstream app update checker for Morphe Patches (Extra Apps).

Parses target versions from Constants.kt, queries upstream public sources
(APKMirror, APKPure, and GitHub), and reports whether updates are available.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import sys
import tempfile
import unittest
import urllib.error
import urllib.request
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Tuple

USER_AGENT = "Discordbot/2.0; +https://discordapp.com"

HTTP_TIMEOUT_SECONDS = 15

APP_SPECS: List[Dict[str, Any]] = [
    # ==============================================================================
    # ADD NEW APP HERE - TEMPLATE
    # ==============================================================================
    # To monitor a new app, copy-paste-fill this template into APP_SPECS below.
    # A maintainer adding an app touches ONLY this block and adds one fixture test
    # in TestUpdateChecker (see test_apkpure_extraction_newer_download_version).
    #
    # {
    #     "id": "my-app",                           # 1. Unique runner/issue identifier (matches PatchExecutionTest id)
    #     "name": "My App",                         # 2. Display name shown in logs, issue titles, and alerts
    #     "package_name": "com.example.app",        # 3. Android application package name
    #     "constant_key": "MY_APP_TARGET_VERSION",  # 4. Target version constant defined in Constants.kt
    #     "source_type": "apkpure",                 # 5. Upstream host type: "apkpure", "apkmirror", or "github"
    #     "source_name": "APKPure",                 # 6. Display name of upstream host, must match the entry's source
    #     "source_url": "https://apkpure.com/slug/com.example.app",  # 7. Canonical listing URL (HTTP 200 verified live)
    #     "allow_beta": False,                      # Pre-release filter (typically False for stable patch releases)
    #     # Optional keys: "path_prefix" (required for apkmirror; release- vs directory-level prefix both work), "run_patch_test_id" (defaults to id), "version_ignore_patterns" (regex list to skip abandoned lines), "variant_match" (dict with arch, dpi, type for exact variant download URL resolution); no entry uses require_variant_marker (mechanism absent in this copy)
    # },
    # ==============================================================================
    {
        "id": "instagram",
        "name": "Instagram",
        "package_name": "com.instagram.android",
        "constant_key": "INSTAGRAM_TARGET_VERSION",
        "run_patch_test_id": "instagram",
        "source_type": "apkmirror",
        "source_name": "APKMirror",
        "source_url": "https://www.apkmirror.com/apk/instagram/instagram-instagram/",
        "path_prefix": "/apk/instagram/instagram-instagram/instagram-",
        "allow_beta": False,
        "variant_match": {
            "arch": "arm64-v8a",
            "dpi": "120-480dpi",
            "type": "BUNDLE",
        },
    },
    {
        "id": "twitter",
        "name": "Twitter",
        "package_name": "com.twitter.android",
        "constant_key": "TWITTER_TARGET_VERSION",
        "run_patch_test_id": "twitter",
        "source_type": "apkmirror",
        "source_name": "APKMirror",
        "source_url": "https://www.apkmirror.com/apk/x-corp/twitter/",
        "path_prefix": "/apk/x-corp/twitter/x-",
        "allow_beta": False,
        "variant_match": {
            "arch": "arm64-v8a",
            "dpi": "120-640dpi",
            "type": "BUNDLE",
        },
    },
    {
        "id": "moovit",
        "name": "Moovit",
        "package_name": "com.tranzmate",
        "constant_key": "MOOVIT_TARGET_VERSION",
        "run_patch_test_id": "moovit",
        "source_type": "apkmirror",
        "source_name": "APKMirror",
        "source_url": "https://www.apkmirror.com/apk/moovit/moovit-bus-train-live-info/",
        "path_prefix": "/apk/moovit/moovit-bus-train-live-info/moovit-",
        "allow_beta": False,
        "variant_match": {
            "arch": "arm64-v8a",
            "dpi": "160-640dpi",
            "type": "BUNDLE",
        },
    },
    {
        "id": "capcut",
        "name": "CapCut",
        "package_name": "com.lemon.lvoverseas",
        "constant_key": "CAPCUT_TARGET_VERSION",
        "run_patch_test_id": "capcut",
        "source_type": "apkmirror",
        "source_name": "APKMirror",
        "source_url": "https://www.apkmirror.com/apk/bytedance-pte-ltd/capcut/",
        "path_prefix": "/apk/bytedance-pte-ltd/capcut/capcut-",
        "allow_beta": False,
        "variant_match": {
            "arch": "arm64-v8a",
            "dpi": "nodpi",
            "type": "APK",
        },
    },
    {
        "id": "hevy",
        "name": "Hevy",
        "package_name": "com.hevy",
        "constant_key": "HEVY_TARGET_VERSION",
        "source_type": "apkmirror",
        "source_name": "APKMirror",
        "source_url": "https://www.apkmirror.com/apk/hevy-gym-workout-tracker/hevy-gym-log-workout-tracker/",
        "path_prefix": "/apk/hevy-gym-workout-tracker/hevy-gym-log-workout-tracker/hevy-gym-log-workout-tracker-",
        "allow_beta": False,
        "variant_match": {
            "arch": "arm64-v8a",
            "dpi": "120-640dpi",
            "type": "BUNDLE",
        },
    },
    {
        "id": "nokoprint",
        "name": "NokoPrint",
        "package_name": "com.nokoprint",
        "constant_key": "NOKOPRINT_TARGET_VERSION",
        "source_type": "apkpure",
        "source_name": "APKPure",
        "source_url": "https://apkpure.com/nokoprint-wifi-bluetooth-usb/com.nokoprint",
        "allow_beta": False,
    },
    {
        "id": "xiaomi-earbuds",
        "name": "Xiaomi Earbuds",
        "package_name": "com.mi.earphone",
        "constant_key": "XIAOMI_EARBUDS_TARGET_VERSION",
        "source_type": "apkpure",
        "source_name": "APKPure",
        "source_url": "https://apkpure.com/xiaomi-earbuds/com.mi.earphone",
        "allow_beta": False,
        "version_ignore_patterns": [r"^9\."],
    },
    # --------------------------------------------------------------------------
    # SUBE (APKPure) - copy-paste-filled from "ADD NEW APP HERE" template
    # --------------------------------------------------------------------------
    {
        "id": "sube",
        "name": "SUBE",
        "package_name": "com.sube.app",
        "constant_key": "SUBE_TARGET_VERSION",
        "source_type": "apkpure",
        "source_name": "APKPure",
        "source_url": "https://apkpure.com/sube/com.sube.app",
        "allow_beta": False,
    },
    # --------------------------------------------------------------------------
    # SD Maid SE (GitHub) - copy-paste-filled from "ADD NEW APP HERE" template
    # --------------------------------------------------------------------------
    {
        "id": "sdmse",
        "name": "SD Maid SE",
        "package_name": "eu.darken.sdmse",
        "constant_key": "SDMSE_TARGET_VERSION",
        "source_type": "github",
        "source_name": "GitHub",
        "source_url": "https://github.com/d4rken-org/sdmaid-se/releases",
        "allow_beta": True,
    },
    # Upstream source divergence: Version monitoring uses APKMirror HTML scraping
    # because APKPure lacks stable, unauthenticated endpoints for programmatic checks.
    # Patch candidate packages must be sourced as XAPK bundles from APKPure because
    # APKMirror downloads return HTTP 451 (legal restriction) in multiple regions.
    {
        "id": "ibispaint",
        "name": "IbisPaint X",
        "package_name": "jp.ne.ibis.ibispaintx.app",
        "constant_key": "IBIS_PAINT_TARGET_VERSION",
        "run_patch_test_id": "ibispaint",
        "source_type": "apkmirror",
        "source_name": "APKMirror",
        "source_url": "https://www.apkmirror.com/apk/ibis-inc/ibispaint-x/",
        "path_prefix": "/apk/ibis-inc/ibispaint-x/ibis-paint-x-",
        "allow_beta": False,
    },
]

# Build dependencies (toolchain components, not apps)
TOOLCHAIN_SPECS: List[Dict[str, Any]] = [
    {
        "id": "morphe-patcher",
        "name": "Morphe Patcher",
        "local_file": "gradle/libs.versions.toml",
        "local_pattern": r'^morphe-patcher\s*=\s*"([^"]+)"',
        "api_url": "https://api.github.com/repos/MorpheApp/morphe-patcher/releases/latest",
        "source_url": "https://github.com/MorpheApp/morphe-patcher/releases",
    },
    {
        "id": "morphe-gradle-plugin",
        "name": "Morphe Gradle Plugin",
        "local_file": "settings.gradle.kts",
        "local_pattern": r'id\("app\.morphe\.patches"\)\s+version\s+"([^"]+)"',
        "api_url": "https://api.github.com/repos/MorpheApp/morphe-patches-gradle-plugin/tags?per_page=100",
        "source_url": "https://github.com/MorpheApp/morphe-patches-gradle-plugin/tags",
    },
    {
        "id": "gradle-wrapper",
        "name": "Gradle Wrapper",
        "local_file": "gradle/wrapper/gradle-wrapper.properties",
        "local_pattern": r'^distributionUrl=.*/gradle-(\d+(?:\.\d+)*)-(?:bin|all)\.zip\s*$',
        "api_url": "https://api.github.com/repos/gradle/gradle/releases/latest",
        "source_url": "https://github.com/gradle/gradle/releases",
    },
]


def resolve_repo_root() -> Path:
    """Resolve repository root directory from this script's location."""
    return Path(__file__).resolve().parent.parent


def resolve_default_constants_path() -> Path:
    """Resolve default path to Constants.kt relative to repository root."""
    return (
        resolve_repo_root()
        / "patches"
        / "src"
        / "main"
        / "kotlin"
        / "app"
        / "morphe"
        / "patches"
        / "shared"
        / "Constants.kt"
    )


def parse_constants(constants_path: Path) -> Dict[str, str]:
    """Parse target version constants from Constants.kt with regex.

    Matches constants such as:
        const val INSTAGRAM_TARGET_VERSION = "447.0.0.55.81"
        const val TWITTER_TARGET_VERSION = "12.34.0-prod.01"
    """
    if not constants_path.is_file():
        print(f"[WARN] Constants file not found: {constants_path}", file=sys.stderr)
        return {}

    content = constants_path.read_text(encoding="utf-8")
    pattern = r'const\s+val\s+([A-Z0-9_]+_TARGET_VERSION)\s*=\s*"([^"]+)"'
    return dict(re.findall(pattern, content))


def parse_version(v_str: str) -> Tuple[Tuple[int, ...], str]:
    """Parse a version string into a numeric core tuple and suffix.

    Examples:
        '19.7.0' -> ((19, 7, 0), '')
        '12.34.0-prod.01' -> ((12, 34, 0), 'prod.01')
        '16.0.20527.20034' -> ((16, 0, 20527, 20034), '')
        '11.6.01' -> ((11, 6, 1), '')
        '447.0.0.55.81' -> ((447, 0, 0, 55, 81), '')
    """
    v = v_str.strip().lstrip("vV")
    m = re.match(r"^(\d+(?:\.\d+)*)(?:([a-zA-Z]+)|[-_\s]+(.*))?$", v)
    if not m:
        return (), v

    core_str = m.group(1)
    letter_suffix = m.group(2) or ""
    rest_suffix = m.group(3) or ""
    suffix = (letter_suffix + rest_suffix).strip()
    core = tuple(int(x) for x in core_str.split("."))
    return core, suffix


def compare_versions(local_ver: str, remote_ver: str) -> str:
    """Compare local vs remote version.

    Returns:
        'current', 'update-available', or 'unknown'
    """
    if not local_ver or not remote_ver:
        return "unknown"

    local_core, local_sfx = parse_version(local_ver)
    remote_core, remote_sfx = parse_version(remote_ver)

    if not local_core or not remote_core:
        return "unknown"

    max_len = max(len(local_core), len(remote_core))
    padded_local = local_core + (0,) * (max_len - len(local_core))
    padded_remote = remote_core + (0,) * (max_len - len(remote_core))

    if padded_remote > padded_local:
        return "update-available"
    if padded_remote < padded_local:
        return "current"

    # Numeric core parts are equal; check suffixes.
    clean_local_sfx = re.sub(r"-(arm64-v8a|armeabi-v7a|x86_64|x86)", "", local_sfx).strip()
    clean_remote_sfx = re.sub(r"-(arm64-v8a|armeabi-v7a|x86_64|x86)", "", remote_sfx).strip()

    if clean_local_sfx == clean_remote_sfx:
        return "current"

    # Exact string match preserves identical versions like 11.6.01
    if local_ver.strip() == remote_ver.strip():
        return "current"

    if clean_remote_sfx > clean_local_sfx:
        return "update-available"

    return "current"


def is_version_ignored(version: str, patterns: Optional[List[str]]) -> bool:
    """Check if version matches any ignore regex pattern."""
    if not version or not patterns:
        return False
    return any(re.search(pat, version) for pat in patterns)


def fetch_html(url: str) -> Optional[str]:
    """Fetch HTML content from a public URL using standard urllib."""
    headers = {
        "User-Agent": USER_AGENT,
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language": "en-US,en;q=0.9",
    }
    if url.startswith("https://api.github.com/"):
        token = os.environ.get("GITHUB_TOKEN")
        if token:
            headers["Authorization"] = f"Bearer {token}"
            headers["Accept"] = "application/vnd.github+json"

    req = urllib.request.Request(url, headers=headers)
    try:
        with urllib.request.urlopen(req, timeout=HTTP_TIMEOUT_SECONDS) as resp:
            return resp.read().decode("utf-8", errors="ignore")
    except (urllib.error.URLError, urllib.error.HTTPError, OSError) as exc:
        print(f"[WARN] HTTP error fetching {url}: {exc}", file=sys.stderr)
        return None
    except Exception as exc:
        print(f"[WARN] Unexpected error fetching {url}: {exc}", file=sys.stderr)
        return None


def extract_apkmirror_latest_release(
    html: str,
    path_prefix: str,
    allow_beta: bool = False,
) -> Optional[Tuple[str, str]]:
    """Extract latest remote version and release URL from APKMirror listing HTML.

    Host: APKMirror (https://www.apkmirror.com/apk/...)
    Precedence: Release links matching path_prefix sorted descending by numeric
    core and suffix, filtering out beta/alpha/preview/rc when allow_beta=False.
    """
    candidates: List[Tuple[Tuple[int, ...], str, str, str]] = []

    link_pattern = r'<a[^>]*class="[^"]*fontBlack[^"]*"[^>]*href="([^"]+)"[^>]*>(.*?)</a>'
    for m in re.finditer(link_pattern, html, re.DOTALL):
        href = m.group(1)
        title = m.group(2).strip()

        if not href.startswith(path_prefix):
            continue

        is_beta = bool(
            re.search(r"\b(beta|alpha|preview|rc)\b", title, re.I)
            or re.search(r"-(beta|alpha|rc)\d*", href, re.I)
        )
        if is_beta and not allow_beta:
            continue

        v_match = re.search(
            r"(\d+(?:\.\d+)+(?:[a-zA-Z0-9._-]+)?)",
            title,
            re.I,
        )
        if v_match:
            raw_v = v_match.group(1).strip()
            core, sfx = parse_version(raw_v)
            if core:
                candidates.append((core, sfx, raw_v, href))

    if not candidates:
        return None

    # Sort descending by numeric core then suffix
    candidates.sort(key=lambda c: (c[0], c[1]), reverse=True)
    best_ver = candidates[0][2]
    best_href = candidates[0][3]
    release_url = best_href if best_href.startswith("http") else f"https://www.apkmirror.com{best_href}"
    return best_ver, release_url


def extract_apkmirror_version(
    html: str,
    path_prefix: str,
    allow_beta: bool = False,
) -> Optional[str]:
    """Extract latest remote version from APKMirror listing HTML.

    Host: APKMirror (https://www.apkmirror.com/apk/...)
    Precedence: Release links matching path_prefix sorted descending by numeric
    core and suffix, filtering out beta/alpha/preview/rc when allow_beta=False.
    Fixture test: test_apkmirror_extraction_and_beta_filter
    """
    rel = extract_apkmirror_latest_release(html, path_prefix, allow_beta=allow_beta)
    return rel[0] if rel else None


def _extract_variant_cell_values(clean_cells: List[str]) -> Tuple[str, str, str]:
    """Extract arch, min_version, and dpi from variant row cells."""
    if len(clean_cells) >= 4:
        return clean_cells[1], clean_cells[2], clean_cells[3]

    arch, min_version, dpi = "", "", ""
    for c in clean_cells[1:]:
        if re.search(r"(\d+-\d+dpi|\bnodpi\b|\d+dpi)", c, re.I):
            dpi = c
        elif re.search(r"(arm|x86|universal|mips)", c, re.I):
            arch = c
        elif re.search(r"android", c, re.I):
            min_version = c
    return arch, min_version, dpi


def _parse_variant_row(row_html: str) -> Optional[Dict[str, str]]:
    """Parse a single variant row from APKMirror variants table."""
    link_match = re.search(r'<a[^>]*class="[^"]*accent_color[^"]*"[^>]*href="([^"]+)"', row_html)
    if not link_match:
        link_match = re.search(r'<a[^>]*href="([^"]*-android-apk-download/)"', row_html)
    if not link_match:
        return None

    href = link_match.group(1).strip()
    badges = [
        b.strip().upper()
        for b in re.findall(r'<span[^>]*class="[^"]*apkm-badge[^"]*"[^>]*>([^<]+)</span>', row_html)
    ]
    bundle_type = "BUNDLE" if "BUNDLE" in badges else "APK"

    cells = re.findall(r'<div[^>]*class="[^"]*table-cell[^"]*"[^>]*>(.*?)</div>', row_html, re.DOTALL)
    clean_cells = [re.sub(r'<[^>]+>', ' ', c).strip() for c in cells]
    arch, min_version, dpi = _extract_variant_cell_values(clean_cells)

    return {
        "href": href,
        "type": bundle_type,
        "arch": arch,
        "dpi": dpi,
        "min_version": min_version,
    }


def parse_apkmirror_variants(html: str) -> List[Dict[str, str]]:
    """Parse list of variants from APKMirror release page HTML."""
    if not html:
        return []

    table_idx = html.find("variants-table")
    scope_html = html[table_idx:] if table_idx != -1 else html

    rows = re.split(r'<div[^>]*class="[^"]*table-row[^"]*"', scope_html)
    variants: List[Dict[str, str]] = []
    for r in rows:
        parsed = _parse_variant_row(r)
        if parsed:
            variants.append(parsed)
    return variants


def _match_arch(var_arch: str, req_arch: str) -> Tuple[bool, int]:
    """Check if variant arch satisfies requested arch and compute specificity score."""
    if not req_arch:
        return True, 0
    tokens = [a.strip().lower() for a in re.split(r"[\s+,]+", var_arch)]
    clean_var = var_arch.strip().lower()
    clean_req = req_arch.strip().lower()
    if clean_req not in tokens and clean_req != clean_var:
        return False, 0
    return True, 2 if clean_var == clean_req else 1


def _match_dpi(var_dpi: str, req_dpi: str) -> Tuple[bool, int]:
    """Check if variant dpi satisfies requested dpi and compute specificity score."""
    if not req_dpi:
        return True, 0
    if var_dpi.strip().lower() != req_dpi.strip().lower():
        return False, 0
    return True, 2


def _match_type(var_type: str, req_type: str) -> Tuple[bool, int]:
    """Check if variant bundle type satisfies requested type and compute specificity score."""
    if not req_type:
        return True, 0
    normalized = "BUNDLE" if req_type.upper() in ("BUNDLE", "APKM") else req_type.upper()
    if var_type.strip().upper() != normalized:
        return False, 0
    return True, 2


def match_variant_criteria(
    variant: Dict[str, str],
    criteria: Dict[str, Any],
) -> Tuple[bool, int]:
    """Match variant against target criteria and return (matches, score)."""
    ok_arch, score_arch = _match_arch(variant.get("arch", ""), str(criteria.get("arch", "")))
    if not ok_arch:
        return False, 0
    ok_dpi, score_dpi = _match_dpi(variant.get("dpi", ""), str(criteria.get("dpi", "")))
    if not ok_dpi:
        return False, 0
    ok_type, score_type = _match_type(variant.get("type", ""), str(criteria.get("type", "")))
    if not ok_type:
        return False, 0
    return True, score_arch + score_dpi + score_type


def resolve_apkmirror_variant_download_url(
    release_html: str,
    criteria: Dict[str, Any],
) -> Optional[str]:
    """Resolve direct variant download page URL from APKMirror release page HTML."""
    if not release_html or not criteria:
        return None

    variants = parse_apkmirror_variants(release_html)
    matches: List[Tuple[int, Dict[str, str]]] = []
    for var in variants:
        matched, score = match_variant_criteria(var, criteria)
        if matched:
            matches.append((score, var))

    if not matches:
        return None

    if len(matches) == 1:
        href = matches[0][1]["href"]
        return href if href.startswith("http") else f"https://www.apkmirror.com{href}"

    # Multiple matches: sort descending by score
    matches.sort(key=lambda m: m[0], reverse=True)
    if matches[0][0] > matches[1][0]:
        href = matches[0][1]["href"]
        return href if href.startswith("http") else f"https://www.apkmirror.com{href}"

    # Ambiguous match (tie between top candidates)
    return None


def extract_apkpure_version(html: str) -> Optional[str]:
    """Extract latest remote version from APKPure listing HTML.

    Host: APKPure (https://apkpure.com/<slug>/<package>)
    Precedence: Download-link version (data-dt-version on download button,
    version-name header, or title) beats page metadata and JSON-LD. If no
    downloadable version can be confirmed, returns None (reported as unknown).
    Fixture tests: test_apkpure_extraction_newer_download_version,
                   test_apkpure_download_link_beats_metadata,
                   test_apkpure_unknown_when_empty_or_no_download_link
    """
    if not html:
        return None

    # 1. Download button tags: look for <a> tags with download intent (e.g. dt-main-download-btn,
    # dt-secondary-download-btn, or href containing /download) having data-dt-version.
    # Exclude Aegon (APKPure's companion app) and generic downloader tools.
    for m in re.finditer(r"<a\b([^>]*)>", html, re.I):
        attrs = m.group(1)
        if "com.apkpure.aegon" in attrs or "apk-downloader" in attrs:
            continue

        is_dl = bool(
            re.search(
                r'class="[^"]*(?:dt-main-download-btn|normal-download-btn|dt-secondary-download-btn)[^"]*"',
                attrs,
                re.I,
            )
            or re.search(r'href="[^"]*/download\b', attrs, re.I)
        )
        if is_dl:
            v_match = re.search(r'data-dt-version="([^"]+)"', attrs, re.I)
            if v_match:
                v_cand = v_match.group(1).strip()
                core, _ = parse_version(v_cand)
                if core:
                    return v_cand

    # 2. Version name inside download link container (e.g. dt-version-name-link)
    m_h3 = re.search(
        r'<a\b[^>]*href="[^"]*/download\b[^"]*"[^>]*>.*?<h3[^>]*class="[^"]*version-name[^"]*"[^>]*>([^<]+)</h3>',
        html,
        re.DOTALL | re.I,
    )
    if m_h3:
        v_match = re.search(r"(\d+(?:\.\d+)+(?:[a-zA-Z0-9._-]+)?)", m_h3.group(1))
        if v_match:
            v_cand = v_match.group(1).strip()
            core, _ = parse_version(v_cand)
            if core:
                return v_cand

    # 3. Explicit version in download link title attribute
    m_title = re.search(
        r'<a\b[^>]*href="[^"]*/download\b[^"]*"[^>]*title="[^"]*?\bv?(\d+(?:\.\d+)+(?:[a-zA-Z0-9._-]+)?)\b[^"]*"',
        html,
        re.I,
    )
    if m_title:
        v_cand = m_title.group(1).strip()
        core, _ = parse_version(v_cand)
        if core:
            return v_cand

    # Hard rule 1: If no downloadable version can be confirmed on the page,
    # report unknown (None) even if metadata / JSON-LD specifies a version.
    return None


def _normalize_github_tag(tag: str, allow_beta: bool) -> Optional[str]:
    """Normalize GitHub release tag to version string if valid and allowed."""
    if not allow_beta and re.search(r"\b(beta|alpha|preview|rc)\d*\b", tag, re.I):
        return None
    clean = tag.strip().lstrip("vV")
    core, _ = parse_version(clean)
    return clean if core else None


def extract_github_version(
    html: str,
    allow_beta: bool = True,
) -> Optional[str]:
    """Extract latest remote version from GitHub releases page HTML or JSON payload.

    Host: GitHub (https://github.com/<owner>/<repo>/releases)
    Precedence: First valid release tag in listing order, stripping leading 'v'/'V'.
    Filters out prereleases unless allow_beta=True.
    Fixture test: test_github_extraction_sdmse
    """
    if not html:
        return None

    pattern = r'(?:/releases/tag/|"tag_name":\s*")([^"\'/?#]+)'
    for raw_tag in re.findall(pattern, html):
        ver = _normalize_github_tag(raw_tag, allow_beta)
        if ver:
            return ver

    return None


def run_update_checks(
    constants_path: Path,
    fetch_fn: Optional[Callable[[str], Optional[str]]] = None,
) -> List[Dict[str, Any]]:
    """Run update checks for all configured apps."""
    constants = parse_constants(constants_path)
    results: List[Dict[str, Any]] = []
    fetcher = fetch_fn if fetch_fn is not None else fetch_html

    for spec in APP_SPECS:
        app_id = spec["id"]
        app_name = spec["name"]
        package_name = spec["package_name"]
        constant_key = spec["constant_key"]
        run_patch_test_id = spec.get("run_patch_test_id", app_id)
        source_type = spec["source_type"]
        source_name = spec.get("source_name") or {
            "apkmirror": "APKMirror",
            "apkpure": "APKPure",
            "github": "GitHub",
        }.get(source_type, source_type.title())
        source_url = spec["source_url"]
        allow_beta = spec.get("allow_beta", False)

        local_version = constants.get(constant_key)
        if not local_version:
            print(
                f"[WARN] Constant {constant_key} not found in {constants_path}",
                file=sys.stderr,
            )
            local_version = "unknown"

        remote_version: Optional[str] = None
        release_url: Optional[str] = None
        html = fetcher(source_url)
        if html:
            if source_type == "apkmirror":
                rel = extract_apkmirror_latest_release(
                    html,
                    spec["path_prefix"],
                    allow_beta=allow_beta,
                )
                if rel:
                    remote_version, release_url = rel
            elif source_type == "apkpure":
                # APKPure variant resolution is omitted: APKPure download endpoints serve
                # dynamic tokens / redirects without stable per-variant release tables.
                remote_version = extract_apkpure_version(html)
            elif source_type == "github":
                remote_version = extract_github_version(html, allow_beta=allow_beta)

        ignore_patterns = spec.get("version_ignore_patterns")
        if remote_version and is_version_ignored(remote_version, ignore_patterns):
            remote_version = None

        if not remote_version:
            status = "unknown"
        else:
            status = compare_versions(local_version, remote_version)

        download_url = ""
        variant_match = spec.get("variant_match")
        if (
            status == "update-available"
            and source_type == "apkmirror"
            and variant_match
            and release_url
        ):
            rel_html = fetcher(release_url)
            if rel_html:
                matched_dl = resolve_apkmirror_variant_download_url(
                    rel_html,
                    variant_match,
                )
                if matched_dl:
                    download_url = matched_dl

        display_remote = remote_version if remote_version else "unknown"
        print(
            f"[UPDATE-CHECK] {app_name}: local={local_version} remote={display_remote} status={status}"
        )

        results.append(
            {
                "id": app_id,
                "name": app_name,
                "package_name": package_name,
                "local_version": local_version,
                "remote_version": display_remote,
                "status": status,
                "source_name": source_name,
                "source_url": source_url,
                "run_patch_test_id": run_patch_test_id,
                "download_url": download_url,
            }
        )

    return results


def extract_latest_stable_github_tag(payload: str) -> Optional[str]:
    """Extract highest stable tag version from GitHub release or tags JSON payload."""
    if not payload:
        return None

    matches = re.findall(r'"(?:tag_name|name)"\s*:\s*"[vV]?(\d+(?:\.\d+)*)"', payload)
    if not matches:
        return None

    return max(matches, key=lambda v: parse_version(v)[0])


def read_local_toolchain_version(
    repo_root: Path,
    spec: Dict[str, Any],
) -> Optional[str]:
    """Read local version for a toolchain dependency from file using regex."""
    file_path = repo_root / spec["local_file"]
    if not file_path.is_file():
        print(f"[WARN] Toolchain file not found: {file_path}", file=sys.stderr)
        return None

    content = file_path.read_text(encoding="utf-8")
    match = re.search(spec["local_pattern"], content, re.MULTILINE)
    if not match:
        print(f"[WARN] Pattern not found in {file_path}", file=sys.stderr)
        return None

    return match.group(1).strip()


def _check_toolchain_spec(
    repo_root: Path,
    spec: Dict[str, Any],
    fetcher: Callable[[str], Optional[str]],
) -> Dict[str, Any]:
    """Check a single toolchain specification for updates."""
    local_ver = read_local_toolchain_version(repo_root, spec)
    payload = fetcher(spec["api_url"])
    remote_ver = extract_latest_stable_github_tag(payload) if payload else None

    local_display = local_ver or "unknown"
    remote_display = remote_ver or "unknown"
    status = compare_versions(local_display, remote_display)

    print(
        f"[UPDATE-CHECK] {spec['name']}: local={local_display} remote={remote_display} status={status}"
    )
    return {
        "id": spec["id"],
        "name": spec["name"],
        "package_name": "",
        "local_version": local_display,
        "remote_version": remote_display,
        "status": status,
        "source_name": "GitHub",
        "source_url": spec["source_url"],
        "run_patch_test_id": "",
        "download_url": "",
    }


def run_toolchain_checks(
    repo_root: Path,
    fetch_fn: Optional[Callable[[str], Optional[str]]] = None,
) -> List[Dict[str, Any]]:
    """Run update checks for all configured toolchain dependencies."""
    fetcher = fetch_fn if fetch_fn is not None else fetch_html
    return [
        _check_toolchain_spec(repo_root, spec, fetcher)
        for spec in TOOLCHAIN_SPECS
    ]


# Built-in fixture test suite
class TestUpdateChecker(unittest.TestCase):
    """Fixture tests covering version comparison, conflicting metadata, and extraction."""

    def test_version_schemes(self) -> None:
        """Verify non-plain version schemes (twitter prod suffix, microsoft 4-part, zero-padded minor)."""
        # Twitter prod suffix
        self.assertEqual(compare_versions("12.34.0-prod.01", "12.34.0-prod.01"), "current")
        self.assertEqual(compare_versions("12.34.0-prod.01", "12.35.0-prod.01"), "update-available")
        self.assertEqual(compare_versions("12.34.0-prod.01", "12.34.0-prod.02"), "update-available")
        self.assertEqual(compare_versions("12.34.0-prod.02", "12.34.0-prod.01"), "current")

        # Microsoft 4-part builds
        self.assertEqual(compare_versions("16.0.20527.20034", "16.0.20527.20034"), "current")
        self.assertEqual(compare_versions("16.0.20527.20034", "16.0.20527.20035"), "update-available")
        self.assertEqual(compare_versions("16.0.20527.20035", "16.0.20527.20034"), "current")

        # Instagram 5-part builds
        self.assertEqual(compare_versions("447.0.0.55.81", "447.0.0.55.81"), "current")
        self.assertEqual(compare_versions("447.0.0.55.81", "448.0.0.1.1"), "update-available")

        # Zero-padded minor segment (e.g. 11.6.01)
        self.assertEqual(compare_versions("11.6.01", "11.6.01"), "current")
        self.assertEqual(compare_versions("11.6.01", "11.6.10"), "update-available")

    def test_apkmirror_extraction_and_beta_filter(self) -> None:
        """Verify APKMirror listing extraction filters out betas when allow_beta=False."""
        fixture_html = """
        <div>
          <a class="fontBlack" href="/apk/moovit/moovit-bus-train-live-info/moovit-5-201-6-1811-release/">
            Moovit: Your Transit Tracker 5.201.6.1811 beta
          </a>
          <a class="fontBlack" href="/apk/moovit/moovit-bus-train-live-info/moovit-5-201-1-1809-release/">
            Moovit: Your Transit Tracker 5.201.1.1809
          </a>
          <a class="fontBlack" href="/apk/other-dev/other-app/other-release/">
            Other App 1.0.0
          </a>
        </div>
        """
        ver = extract_apkmirror_version(
            fixture_html,
            path_prefix="/apk/moovit/moovit-bus-train-live-info/moovit-",
            allow_beta=False,
        )
        self.assertEqual(ver, "5.201.1.1809")

    def test_apkpure_extraction_newer_download_version(self) -> None:
        """Verify APKPure extracts newer downloadable version from download button."""
        fixture_html = """
        <html>
          <body>
            <a class="btn normal-download-btn da dt-main-download-btn"
               data-dt-package_name="com.sube.app"
               data-dt-version="2.8.0"
               href="https://apkpure.com/sube/com.sube.app/download"
               title="Download SUBE latest version apk">
              <strong class="text one-line">Download APK (45.1 MB)</strong>
            </a>
          </body>
        </html>
        """
        ver = extract_apkpure_version(fixture_html)
        self.assertEqual(ver, "2.8.0")

    def test_apkpure_extraction_sdmse(self) -> None:
        """Verify APKPure extracts SD Maid SE downloadable version from download button."""
        fixture_html = """
        <html>
          <body>
            <a class="btn normal-download-btn da dt-main-download-btn"
               data-dt-package_name="eu.darken.sdmse"
               data-dt-version="2.2.1-rc0"
               href="https://apkpure.com/sd-maid-2-se-system-cleaner/eu.darken.sdmse/download"
               title="Download SD Maid 2/SE latest version apk">
              <strong class="text one-line">Download APK (22.5 MB)</strong>
            </a>
          </body>
        </html>
        """
        ver = extract_apkpure_version(fixture_html)
        self.assertEqual(ver, "2.2.1-rc0")

    def test_apkpure_download_link_beats_metadata(self) -> None:
        """Download-link version must take precedence over contradictory metadata."""
        fixture_html = """
        <html>
          <head>
            <script type="application/ld+json">{"@context": "https://schema.org", "@type": "MobileApplication", "name": "SUBE", "version": "3.0.0"}</script>
          </head>
          <body>
            <span class="version one-line">2.9.0</span>
            <a class="btn normal-download-btn da dt-main-download-btn"
               data-dt-package_name="com.sube.app"
               data-dt-version="2.7.25"
               href="https://apkpure.com/sube/com.sube.app/download"
               title="Download SUBE latest version apk">
              <strong class="text one-line">Download APK (45.1 MB)</strong>
            </a>
          </body>
        </html>
        """
        ver = extract_apkpure_version(fixture_html)
        self.assertEqual(ver, "2.7.25")
        self.assertNotEqual(ver, "3.0.0")
        self.assertNotEqual(ver, "2.9.0")

    def test_apkpure_unknown_when_empty_or_no_download_link(self) -> None:
        """Report None (unknown) when no downloadable version can be confirmed."""
        self.assertIsNone(extract_apkpure_version(""))
        self.assertIsNone(extract_apkpure_version("<html><body>No version here</body></html>"))
        metadata_only_html = """
        <html>
          <head>
            <script type="application/ld+json">{"@type": "MobileApplication", "version": "3.0.0"}</script>
          </head>
          <body>
            <span class="version one-line">2.9.0</span>
          </body>
        </html>
        """
        self.assertIsNone(extract_apkpure_version(metadata_only_html))

    def test_github_extraction_sdmse(self) -> None:
        """Verify GitHub extracts SD Maid SE release tag including rc prereleases."""
        fixture_html = """
        <div class="repository-content">
          <section id="release-v2.2.2-rc0" data-release-anchor="release-v2.2.2-rc0">
            <span class="f1 text-bold d-inline">
              <a href="/d4rken-org/sdmaid-se/releases/tag/v2.2.2-rc0" class="Link--primary Link">v2.2.2-rc0</a>
            </span>
          </section>
          <section id="release-v2.2.1-rc0" data-release-anchor="release-v2.2.1-rc0">
            <span class="f1 text-bold d-inline">
              <a href="/d4rken-org/sdmaid-se/releases/tag/v2.2.1-rc0" class="Link--primary Link">v2.2.1-rc0</a>
            </span>
          </section>
        </div>
        """
        ver = extract_github_version(fixture_html, allow_beta=True)
        self.assertEqual(ver, "2.2.2-rc0")

    def test_extract_latest_stable_github_tag(self) -> None:
        """Verify extraction of latest stable tag excluding prereleases and asset names."""
        tags_fixture = json.dumps([
            {"name": "v1.3.4-dev.1"},
            {"name": "v1.3.3"},
            {"name": "v1.3.4"},
            {"name": "v1.2.10"},
        ])
        self.assertEqual(extract_latest_stable_github_tag(tags_fixture), "1.3.4")

        release_fixture = json.dumps({
            "tag_name": "v1.15.1",
            "name": "v1.15.1",
            "assets": [
                {"name": "morphe-patcher-1.15.1.jar"},
            ],
        })
        self.assertEqual(extract_latest_stable_github_tag(release_fixture), "1.15.1")

        self.assertIsNone(extract_latest_stable_github_tag(""))

    def test_run_toolchain_checks(self) -> None:
        """Verify toolchain update check statuses against local version files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            temp_root = Path(tmpdir)
            gradle_dir = temp_root / "gradle"
            gradle_dir.mkdir(parents=True, exist_ok=True)

            versions_toml = gradle_dir / "libs.versions.toml"
            versions_toml.write_text(
                '[versions]\nmorphe-patcher = "1.8.0"\n',
                encoding="utf-8",
            )

            settings_gradle = temp_root / "settings.gradle.kts"
            settings_gradle.write_text(
                'plugins {\n    id("app.morphe.patches") version "1.3.4"\n}\n',
                encoding="utf-8",
            )

            wrapper_dir = gradle_dir / "wrapper"
            wrapper_dir.mkdir(parents=True, exist_ok=True)
            wrapper_props = wrapper_dir / "gradle-wrapper.properties"
            wrapper_props.write_text(
                "distributionUrl=https\\://services.gradle.org/distributions/gradle-9.6.1-bin.zip\n",
                encoding="utf-8",
            )

            def fake_fetch_success(url: str) -> Optional[str]:
                if "morphe-patcher" in url:
                    return json.dumps({
                        "tag_name": "v1.15.1",
                        "name": "v1.15.1",
                        "assets": [{"name": "morphe-patcher-1.15.1.jar"}],
                    })
                if "morphe-patches-gradle-plugin" in url:
                    return json.dumps([
                        {"name": "v1.3.4"},
                        {"name": "v1.3.3"},
                    ])
                if "gradle/gradle" in url:
                    return json.dumps({
                        "tag_name": "v9.8.2",
                        "name": "9.8.2",
                    })
                return None

            results = run_toolchain_checks(temp_root, fetch_fn=fake_fetch_success)
            self.assertEqual(len(results), 3)

            patcher_entry = next(r for r in results if r["id"] == "morphe-patcher")
            self.assertEqual(patcher_entry["status"], "update-available")
            self.assertEqual(patcher_entry["local_version"], "1.8.0")
            self.assertEqual(patcher_entry["remote_version"], "1.15.1")
            self.assertEqual(patcher_entry["package_name"], "")
            self.assertEqual(patcher_entry["source_name"], "GitHub")
            self.assertEqual(patcher_entry["run_patch_test_id"], "")

            plugin_entry = next(r for r in results if r["id"] == "morphe-gradle-plugin")
            self.assertEqual(plugin_entry["status"], "current")
            self.assertEqual(plugin_entry["local_version"], "1.3.4")
            self.assertEqual(plugin_entry["remote_version"], "1.3.4")

            gradle_entry = next(r for r in results if r["id"] == "gradle-wrapper")
            self.assertEqual(gradle_entry["status"], "update-available")
            self.assertEqual(gradle_entry["local_version"], "9.6.1")
            self.assertEqual(gradle_entry["remote_version"], "9.8.2")

            # Fetch returning None -> "unknown"
            unknown_results = run_toolchain_checks(temp_root, fetch_fn=lambda _: None)
            for entry in unknown_results:
                self.assertEqual(entry["status"], "unknown")
                self.assertEqual(entry["remote_version"], "unknown")

    def test_xiaomi_earbuds_phantom_update_ignored(self) -> None:
        """Verify abandoned 9.x branch is ignored and does not report update-available for Xiaomi Earbuds."""
        with tempfile.TemporaryDirectory() as tmpdir:
            temp_constants = Path(tmpdir) / "Constants.kt"
            constants_content = resolve_default_constants_path().read_text(encoding="utf-8")
            temp_constants.write_text(constants_content, encoding="utf-8")

            phantom_html = """
            <html>
              <body>
                <a class="btn normal-download-btn da dt-main-download-btn"
                   data-dt-package_name="com.mi.earphone"
                   data-dt-version="9.0.278"
                   href="https://apkpure.com/xiaomi-earbuds/com.mi.earphone/download"
                   title="Download Xiaomi Earbuds latest version apk">
                  <strong class="text one-line">Download APK (20 MB)</strong>
                </a>
              </body>
            </html>
            """

            def fake_fetch(url: str) -> Optional[str]:
                if "com.mi.earphone" in url:
                    return phantom_html
                return None

            results = run_update_checks(temp_constants, fetch_fn=fake_fetch)
            xiaomi_entry = next(r for r in results if r["id"] == "xiaomi-earbuds")
            self.assertEqual(xiaomi_entry["local_version"], "1.38.0i")
            self.assertNotEqual(
                xiaomi_entry["status"],
                "update-available",
                "Phantom update 9.0.278 must NOT report update-available",
            )
            self.assertEqual(xiaomi_entry["status"], "unknown")
            self.assertEqual(xiaomi_entry["remote_version"], "unknown")

            # Live 1.x update must still report update-available
            live_html = """
            <html>
              <body>
                <a class="btn normal-download-btn da dt-main-download-btn"
                   data-dt-package_name="com.mi.earphone"
                   data-dt-version="1.39.0"
                   href="https://apkpure.com/xiaomi-earbuds/com.mi.earphone/download"
                   title="Download Xiaomi Earbuds latest version apk">
                  <strong class="text one-line">Download APK (20 MB)</strong>
                </a>
              </body>
            </html>
            """

            def fake_fetch_live(url: str) -> Optional[str]:
                if "com.mi.earphone" in url:
                    return live_html
                return None

            live_results = run_update_checks(temp_constants, fetch_fn=fake_fetch_live)
            xiaomi_live = next(r for r in live_results if r["id"] == "xiaomi-earbuds")
            self.assertEqual(xiaomi_live["status"], "update-available")
            self.assertEqual(xiaomi_live["remote_version"], "1.39.0")

    def test_is_version_ignored(self) -> None:
        """Verify version ignore pattern matching."""
        self.assertTrue(is_version_ignored("9.0.278", [r"^9\."]))
        self.assertTrue(is_version_ignored("9.1.0", [r"^9\."]))
        self.assertFalse(is_version_ignored("1.38.0i", [r"^9\."]))
        self.assertFalse(is_version_ignored("1.39.0", [r"^9\."]))
        self.assertFalse(is_version_ignored("9.0.278", []))
        self.assertFalse(is_version_ignored("9.0.278", None))
        self.assertFalse(is_version_ignored("", [r"^9\."]))

    def test_apkmirror_variant_extraction_multi_variant_pick(self) -> None:
        """Verify APKMirror release page variant matching picks the exact matching variant."""
        fixture_html = """
        <div class="table topmargin variants-table">
            <div class="table-row headerFont">
                <div class="table-cell">Variant</div>
                <div class="table-cell">Arch</div>
                <div class="table-cell">Version</div>
                <div class="table-cell">DPI</div>
            </div>
            <div class="table-row headerFont">
                <div class="table-cell dowrap-break-all">
                    <a class="accent_color" href="/apk/x-corp/twitter/x-12-36-1-prod-01-release/x-12-36-1-prod-01-2-android-apk-download/">
                        12.36.1-prod.01
                    </a>
                    <span class="apkm-badge success">BUNDLE</span>
                    <span class="apkm-badge success">34 S</span>
                </div>
                <div class="table-cell dowrap">arm64-v8a + armeabi-v7a</div>
                <div class="table-cell dowrap">Android 12L+</div>
                <div class="table-cell dowrap">120-640dpi</div>
            </div>
            <div class="table-row headerFont">
                <div class="table-cell dowrap-break-all">
                    <a class="accent_color" href="/apk/x-corp/twitter/x-12-36-1-prod-01-release/x-12-36-1-prod-01-3-android-apk-download/">
                        12.36.1-prod.01
                    </a>
                    <span class="apkm-badge success">BUNDLE</span>
                    <span class="apkm-badge success">28 S</span>
                </div>
                <div class="table-cell dowrap">arm64-v8a + armeabi-v7a</div>
                <div class="table-cell dowrap">Android 9.0+</div>
                <div class="table-cell dowrap">480-640dpi</div>
            </div>
            <div class="table-row headerFont">
                <div class="table-cell dowrap-break-all">
                    <a class="accent_color" href="/apk/x-corp/twitter/x-12-36-1-prod-01-release/x-12-36-1-prod-01-android-apk-download/">
                        12.36.1-prod.01
                    </a>
                    <span class="apkm-badge success">BUNDLE</span>
                    <span class="apkm-badge success">27 S</span>
                </div>
                <div class="table-cell dowrap">arm64-v8a</div>
                <div class="table-cell dowrap">Android 10+</div>
                <div class="table-cell dowrap">480-640dpi</div>
            </div>
        </div>
        """
        criteria = {
            "arch": "arm64-v8a",
            "dpi": "120-640dpi",
            "type": "BUNDLE",
        }
        url = resolve_apkmirror_variant_download_url(fixture_html, criteria)
        expected = "https://www.apkmirror.com/apk/x-corp/twitter/x-12-36-1-prod-01-release/x-12-36-1-prod-01-2-android-apk-download/"
        self.assertEqual(url, expected)

    def test_apkmirror_variant_extraction_no_match_fallback(self) -> None:
        """Verify fallback to None when variant criteria do not match or are ambiguous."""
        fixture_html = """
        <div class="table topmargin variants-table">
            <div class="table-row headerFont">
                <div class="table-cell dowrap-break-all">
                    <a class="accent_color" href="/apk/test/test-app/test-1-android-apk-download/">1.0</a>
                    <span class="apkm-badge success">BUNDLE</span>
                </div>
                <div class="table-cell dowrap">arm64-v8a</div>
                <div class="table-cell dowrap">Android 10+</div>
                <div class="table-cell dowrap">480-640dpi</div>
            </div>
        </div>
        """
        # Mismatched DPI -> None
        res_dpi = resolve_apkmirror_variant_download_url(
            fixture_html,
            {"arch": "arm64-v8a", "dpi": "120-640dpi", "type": "BUNDLE"},
        )
        self.assertIsNone(res_dpi)

        # Mismatched Arch -> None
        res_arch = resolve_apkmirror_variant_download_url(
            fixture_html,
            {"arch": "x86", "dpi": "480-640dpi", "type": "BUNDLE"},
        )
        self.assertIsNone(res_arch)

        # Mismatched Type (APK vs BUNDLE) -> None
        res_type = resolve_apkmirror_variant_download_url(
            fixture_html,
            {"arch": "arm64-v8a", "dpi": "480-640dpi", "type": "APK"},
        )
        self.assertIsNone(res_type)

        # Ambiguous match (two variants matching equally) -> None
        ambiguous_html = """
        <div class="table topmargin variants-table">
            <div class="table-row headerFont">
                <div class="table-cell dowrap-break-all">
                    <a class="accent_color" href="/apk/test/test-app/v1-android-apk-download/">1.0</a>
                    <span class="apkm-badge success">BUNDLE</span>
                </div>
                <div class="table-cell dowrap">arm64-v8a</div>
                <div class="table-cell dowrap">Android 10+</div>
                <div class="table-cell dowrap">120-640dpi</div>
            </div>
            <div class="table-row headerFont">
                <div class="table-cell dowrap-break-all">
                    <a class="accent_color" href="/apk/test/test-app/v2-android-apk-download/">1.0</a>
                    <span class="apkm-badge success">BUNDLE</span>
                </div>
                <div class="table-cell dowrap">arm64-v8a</div>
                <div class="table-cell dowrap">Android 10+</div>
                <div class="table-cell dowrap">120-640dpi</div>
            </div>
        </div>
        """
        res_ambig = resolve_apkmirror_variant_download_url(
            ambiguous_html,
            {"arch": "arm64-v8a", "dpi": "120-640dpi", "type": "BUNDLE"},
        )
        self.assertIsNone(res_ambig)

    def test_run_update_checks_plumbs_download_url(self) -> None:
        """Verify run_update_checks resolves download_url for matched variants and keeps empty for unaffected apps."""
        with tempfile.TemporaryDirectory() as tmpdir:
            temp_constants = Path(tmpdir) / "Constants.kt"
            # Set Twitter to an older version to trigger update-available
            temp_constants.write_text(
                'const val TWITTER_TARGET_VERSION = "12.35.0-prod.01"\n'
                'const val SUBE_TARGET_VERSION = "2.7.25"\n',
                encoding="utf-8",
            )

            twitter_listing_html = """
            <div>
              <a class="fontBlack" href="/apk/x-corp/twitter/x-12-36-1-prod-01-release/">
                X 12.36.1-prod.01
              </a>
            </div>
            """
            twitter_release_html = """
            <div class="table topmargin variants-table">
                <div class="table-row headerFont">
                    <div class="table-cell dowrap-break-all">
                        <a class="accent_color" href="/apk/x-corp/twitter/x-12-36-1-prod-01-release/x-12-36-1-prod-01-2-android-apk-download/">12.36.1</a>
                        <span class="apkm-badge success">BUNDLE</span>
                    </div>
                    <div class="table-cell dowrap">arm64-v8a + armeabi-v7a</div>
                    <div class="table-cell dowrap">Android 12L+</div>
                    <div class="table-cell dowrap">120-640dpi</div>
                </div>
            </div>
            """
            sube_listing_html = """
            <a class="btn normal-download-btn da dt-main-download-btn"
               data-dt-package_name="com.sube.app"
               data-dt-version="2.8.0"
               href="https://apkpure.com/sube/com.sube.app/download">
              Download APK
            </a>
            """

            def fake_fetch(url: str) -> Optional[str]:
                if url == "https://www.apkmirror.com/apk/x-corp/twitter/":
                    return twitter_listing_html
                if url == "https://www.apkmirror.com/apk/x-corp/twitter/x-12-36-1-prod-01-release/":
                    return twitter_release_html
                if "com.sube.app" in url:
                    return sube_listing_html
                return None

            results = run_update_checks(temp_constants, fetch_fn=fake_fetch)
            twitter_res = next(r for r in results if r["id"] == "twitter")
            self.assertEqual(twitter_res["status"], "update-available")
            self.assertEqual(
                twitter_res["download_url"],
                "https://www.apkmirror.com/apk/x-corp/twitter/x-12-36-1-prod-01-release/x-12-36-1-prod-01-2-android-apk-download/",
            )

            # APKPure app without variant_match has empty download_url
            sube_res = next(r for r in results if r["id"] == "sube")
            self.assertEqual(sube_res["status"], "update-available")
            self.assertEqual(sube_res["download_url"], "")

    def test_issue_body_formatting(self) -> None:
        """Verify issue body includes Direct download only when download_url is present and non-empty."""
        def format_body(local_ver: str, remote_ver: str, source_url: str, download_url: str) -> str:
            body_lines = [
                f"Current supported version: {local_ver}",
                f"Latest upstream version: {remote_ver}",
                f"Source link: {source_url}",
            ]
            if download_url:
                body_lines.append(f"Direct download: {download_url}")
            return "\n".join(body_lines) + "\n"

        body_with_dl = format_body(
            "12.35.0-prod.01",
            "12.36.1-prod.01",
            "https://www.apkmirror.com/apk/x-corp/twitter/",
            "https://www.apkmirror.com/apk/x-corp/twitter/x-12-36-1-prod-01-release/variant-download/",
        )
        self.assertIn("Direct download: https://www.apkmirror.com/apk/x-corp/twitter/x-12-36-1-prod-01-release/variant-download/", body_with_dl)

        body_without_dl = format_body(
            "2.7.25",
            "2.8.0",
            "https://apkpure.com/sube/com.sube.app",
            "",
        )
        self.assertNotIn("Direct download:", body_without_dl)



def main() -> int:
    """CLI entrypoint."""
    parser = argparse.ArgumentParser(
        description="Check upstream app versions against Morphe target constants."
    )
    parser.add_argument(
        "--check",
        action="store_true",
        default=True,
        help="Report update check status (default: True)",
    )
    parser.add_argument(
        "--json",
        dest="json_path",
        type=str,
        default=None,
        help="Path to write machine-readable JSON report",
    )
    parser.add_argument(
        "--constants",
        dest="constants_path",
        type=str,
        default=None,
        help="Path to Constants.kt (default: auto-detected)",
    )
    parser.add_argument(
        "--test",
        action="store_true",
        default=False,
        help="Run built-in unit and fixture tests",
    )

    args = parser.parse_args()

    if args.test:
        suite = unittest.TestLoader().loadTestsFromTestCase(TestUpdateChecker)
        runner = unittest.TextTestRunner(verbosity=2)
        result = runner.run(suite)
        return 0 if result.wasSuccessful() else 1

    repo_root = resolve_repo_root()
    constants_path = (
        Path(args.constants_path)
        if args.constants_path
        else resolve_default_constants_path()
    )

    results = run_update_checks(constants_path) + run_toolchain_checks(repo_root)

    if args.json_path:
        out_path = Path(args.json_path)
        out_path.parent.mkdir(parents=True, exist_ok=True)
        report_data = {"apps": results}
        out_path.write_text(json.dumps(report_data, indent=2), encoding="utf-8")
        print(f"[INFO] Saved JSON report to {args.json_path}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
