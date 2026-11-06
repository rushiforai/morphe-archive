#!/usr/bin/env python3
"""Build the combined Ayufa Patches JP bundle (one .mpp).

All four patch sets are kept in this repository as translated source
copies (the "clone upstream + translate only" model, v1.2.0+):

- sources/piko: a copy of upstream crimera/piko (branch ``x-lite``,
  stripped to the NewX patch set) with the Japanese strings applied
  in-tree: the Piko settings UI resources under
  addresources/values-ja-rJP/ and the NewX patch descriptions
  translated in the patch declarations (patch names stay upstream
  English: the patcher executes patches sorted by name, so names are
  never translated). The upstream base commit is recorded in
  sources/piko/UPSTREAM_BASE.md.
- sources/twitch: a translated source copy of ryykitty/twitch-patched.
- sources/line: a translated source copy of
  andrewliang25/morphe-patches. The copy keeps upstream's full tree,
  but only the LINE patch set is injected; the Facebook patch sources
  stay out of the bundle. The upstream base commit is recorded in
  sources/line/UPSTREAM_BASE.md.
- sources/kakao: a translated source copy of
  AmpleReVanced/revanced-patches. The copy keeps upstream's full
  tree, but only the KakaoTalk patch set is injected; the other apps'
  patches (DC Inside, SOOP, ...) stay out of the bundle. The
  upstream base commit is recorded in sources/kakao/UPSTREAM_BASE.md.

The build itself adds no patch machinery of its own:

1. Copy sources/piko into a temporary directory (it is the build
   host: a full Piko tree with the Morphe Gradle plugin).
2. Report the Japanese translation coverage of the Piko settings UI
   (untranslated keys fall back to English at runtime).
3. Inject the Twitch patch set from sources/twitch: patch sources,
   patch resources (reactnative/, hermes/), the extensions/twitch
   module and the shared/ivs-api compile-only sources it needs.
4. Inject the LINE patch set from sources/line: the LINE and shared
   patch sources and the extensions/extension module.
5. Inject the KakaoTalk patch set from sources/kakao: the KakaoTalk
   patch sources and the shared/all helpers they import, the patch
   resources (kakaotalk/, settings/, addresources), the
   extensions/kakaotalk module (with its nested stub project) and
   the shared-library preference sources it compiles against.
6. Rewrite the bundle metadata (name/description/source/author) in
   the temporary tree and set the bundle version.
7. Run ``./gradlew clean buildAndroid`` and copy out
   patches-<version>.mpp. A patches list is generated afterwards on a
   best-effort basis for verification/release metadata; the release
   workflow fails if the list is missing (v1.1.0 shipped without one).

Upstream repositories are only ever read (fetched / merged into the
source copies by the daily sync), never written. All build-time
adaptations happen inside the throwaway build tree.
"""

import argparse
import json
import os
import re
import shutil
import subprocess
import tempfile
import time
from dataclasses import dataclass, field
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent

# X side: translated source copy of crimera/piko@x-lite kept in this
# repository (see docs/UPSTREAM.md). Its patches/src tree doubles as
# the build host for the combined bundle.
PIKO_SOURCES = REPO_ROOT / "sources" / "piko"
PIKO_BASE_FILE = PIKO_SOURCES / "UPSTREAM_BASE.md"
XLITE_CONSTANTS = (
    "patches/src/main/kotlin/app/crimera/patches/newx/utils/Constants.kt"
)
ADDRESOURCES_DIR = "patches/src/main/resources/addresources"

# Twitch side: translated source copy of ryykitty/twitch-patched kept
# in this repository (see docs/UPSTREAM.md). Injected into the build
# tree hosted by the Piko copy.
TWITCH_SOURCES = REPO_ROOT / "sources" / "twitch"

# LINE side: translated source copy of andrewliang25/morphe-patches
# kept in this repository (see docs/UPSTREAM.md). Only its LINE patch
# set is injected into the build tree; the Facebook patches are not.
LINE_SOURCES = REPO_ROOT / "sources" / "line"

# KakaoTalk side: translated source copy of
# AmpleReVanced/revanced-patches kept in this repository (see
# docs/UPSTREAM.md). Only its KakaoTalk patch set is injected into
# the build tree; the other apps' patches are not.
KAKAO_SOURCES = REPO_ROOT / "sources" / "kakao"

# Combined bundle metadata written into the temporary tree's
# patches/build.gradle.kts about block (ends up in the .mpp MANIFEST).
BUNDLE_NAME = "Ayufa Patches JP"
BUNDLE_DESCRIPTION = (
    "X (NewX)・Twitch・LINE・KakaoTalk の Morphe パッチを1つにまとめた日本語化バンドル"
)
BUNDLE_SOURCE = "https://github.com/Ayufa/ayufa-patches-jp"
BUNDLE_AUTHOR = "Ayufa"
BUNDLE_CONTACT = ""
BUNDLE_WEBSITE = "https://github.com/Ayufa/ayufa-patches-jp"
BUNDLE_LICENSE = "GNU General Public License v3.0"


def piko_base_commit() -> str:
    """Upstream piko commit the sources/piko copy is based on."""
    match = re.search(
        r"^- commit:\s*([0-9a-f]{40})\s*$",
        PIKO_BASE_FILE.read_text(encoding="utf-8"),
        re.M,
    )
    if not match:
        raise ValueError(f"No base commit recorded in {PIKO_BASE_FILE}")
    return match.group(1)


def _string_keys(xml_text: str) -> set[str]:
    return set(re.findall(r'<string\s+name="([^"]+)"', xml_text))


def report_translation_coverage(piko_directory: Path) -> None:
    """Report untranslated Piko settings strings in the source copy.

    Missing keys are not an error: Android falls back to the default
    (English) resources, so new upstream strings stay visible in
    English until they are translated. They are reported here so a
    release log shows the translation coverage.
    """
    english_file = (
        piko_directory / ADDRESOURCES_DIR / "values" / "newx" / "strings.xml"
    )
    japanese_file = (
        piko_directory / ADDRESOURCES_DIR / "values-ja-rJP" / "newx" / "strings.xml"
    )
    if not japanese_file.is_file():
        print("No Japanese settings resources in sources/piko; building untranslated")
        return
    english_keys = _string_keys(english_file.read_text(encoding="utf-8"))
    japanese_keys = _string_keys(japanese_file.read_text(encoding="utf-8"))
    missing = sorted(english_keys - japanese_keys)
    if missing:
        print(
            f"  {len(missing)} untranslated string(s) fall back to English: "
            + ", ".join(missing)
        )
    else:
        print(f"  translation coverage: {len(japanese_keys)}/{len(english_keys)}")


def get_supported_versions(constants: str) -> frozenset[str]:
    """Return the X-Lite app versions supported by the Piko source copy."""
    versions = frozenset(
        re.findall(r'AppTarget\(version\s*=\s*"([^"]+)"\)', constants)
    )
    if not versions:
        raise ValueError("Could not find X-Lite compatible app versions in Piko")
    return versions


def _copy_tree(source: Path, destination: Path) -> None:
    if not source.is_dir():
        raise FileNotFoundError(f"Source tree is missing: {source}")
    shutil.copytree(source, destination, dirs_exist_ok=True)
    print(f"Copied tree: {source} -> {destination}")


def _strip_extension_dsl(build_file: Path) -> None:
    """Remove the Morphe plugin 2.0.0 ``extension { ... }`` block.

    The Twitch extension build file was written for app.morphe.patches
    plugin 2.0.0, where the .mpe output name is declared explicitly.
    The Piko build tree uses plugin 1.3.4, which derives the name from
    the module path instead (extensions/twitch -> extensions/twitch.mpe,
    the same value), and does not know the block. The block is flat
    (no nested braces), so a line-based removal is exact.
    """
    lines = build_file.read_text(encoding="utf-8").splitlines(keepends=True)
    kept: list[str] = []
    removed = 0
    index = 0
    while index < len(lines):
        if lines[index].strip() == "extension {":
            end = index + 1
            while end < len(lines) and lines[end].strip() != "}":
                end += 1
            if end >= len(lines):
                raise ValueError(f"Unterminated extension block in {build_file}")
            removed += 1
            index = end + 1
            # Swallow one following blank line to keep the file tidy.
            if index < len(lines) and lines[index].strip() == "":
                index += 1
            continue
        kept.append(lines[index])
        index += 1
    if removed != 1:
        raise ValueError(
            f"Expected exactly one extension block in {build_file}, removed {removed}"
        )
    build_file.write_text("".join(kept), encoding="utf-8")
    print(f"Adapted {build_file}: removed extension {{}} block")


# Packages of the injected extensions whose classes are referenced
# from patches by class-name strings and therefore need an explicit
# keep in the extension R8 step.
_PROGUARD_KEEPS = (
    "dev.twitchpatches",
    "app.andrewliang",
)


def _append_proguard_keep(piko_directory: Path) -> None:
    """Keep the injected extension classes in the extension R8 step.

    The Piko tree's extensions/proguard-rules.pro only keeps
    app.morphe.**, app.revanced.** and com.google.**. The Twitch
    extension lives in dev.twitchpatches.** and the LINE extension in
    app.andrewliang.**, so both need an explicit keep. Idempotent:
    each keep is appended only when its package is not mentioned yet.
    """
    rules = piko_directory / "extensions" / "proguard-rules.pro"
    text = rules.read_text(encoding="utf-8")
    for package in _PROGUARD_KEEPS:
        if package not in text:
            keep = f"-keep class {package}.** {{\n  *;\n}}\n"
            text = text.rstrip("\n") + "\n\n" + keep
    rules.write_text(text, encoding="utf-8")
    print(
        "Adapted extensions/proguard-rules.pro: keep "
        + " and ".join(f"{package}.**" for package in _PROGUARD_KEEPS)
    )


def _rewrite_about_block(piko_directory: Path) -> None:
    """Point the bundle metadata (MANIFEST) at the combined project.

    Replacements are scoped to the ``about { ... }`` block: the same
    file has other ``description =`` assignments in task registrations
    that must not be touched.
    """
    build_file = piko_directory / "patches" / "build.gradle.kts"
    lines = build_file.read_text(encoding="utf-8").splitlines(keepends=True)

    start = next(
        (i for i, line in enumerate(lines) if line.strip() == "about {"),
        None,
    )
    if start is None:
        raise ValueError("No about block in patches/build.gradle.kts")
    end = next(
        (
            i
            for i in range(start + 1, len(lines))
            if lines[i].rstrip() == "    }"
        ),
        None,
    )
    if end is None:
        raise ValueError("Unterminated about block in patches/build.gradle.kts")

    values = {
        "name": BUNDLE_NAME,
        "description": BUNDLE_DESCRIPTION,
        "source": BUNDLE_SOURCE,
        "author": BUNDLE_AUTHOR,
        "contact": BUNDLE_CONTACT,
        "website": BUNDLE_WEBSITE,
        "license": BUNDLE_LICENSE,
    }
    for key, value in values.items():
        pattern = re.compile(rf'^(\s*{key}\s*=\s*)"[^"]*"')
        replaced = 0
        for i in range(start + 1, end):
            lines[i], count = pattern.subn(
                rf'\g<1>"{value}"', lines[i], count=1
            )
            replaced += count
        if replaced != 1:
            raise ValueError(
                f"Expected exactly one about.{key} in patches/build.gradle.kts, "
                f"replaced {replaced}"
            )
    build_file.write_text("".join(lines), encoding="utf-8")
    print("Rewrote bundle about metadata for Ayufa Patches JP")


def prepare_build_tree(piko_directory: Path) -> None:
    """Copy the sources/piko tree into the throwaway build directory."""
    _copy_tree(PIKO_SOURCES, piko_directory)
    # The copy carries upstream's own stale patches-list.json; remove
    # it so only a list generated by this build can be picked up.
    stale_list = piko_directory / "patches-list.json"
    if stale_list.exists():
        stale_list.unlink()
        print("Removed stale patches-list.json from the build tree")


def inject_twitch_sources(piko_directory: Path) -> None:
    """Copy the Twitch patch set from sources/twitch into the build tree."""
    patches_main = TWITCH_SOURCES / "patches" / "src" / "main"
    _copy_tree(
        patches_main / "kotlin" / "dev",
        piko_directory / "patches" / "src" / "main" / "kotlin" / "dev",
    )
    for resource_dir in ("reactnative", "hermes"):
        _copy_tree(
            patches_main / "resources" / resource_dir,
            piko_directory / "patches" / "src" / "main" / "resources" / resource_dir,
        )
    _copy_tree(
        TWITCH_SOURCES / "extensions" / "twitch",
        piko_directory / "extensions" / "twitch",
    )
    _strip_extension_dsl(
        piko_directory / "extensions" / "twitch" / "build.gradle.kts"
    )
    _copy_tree(TWITCH_SOURCES / "shared", piko_directory / "shared")
    _append_proguard_keep(piko_directory)
    _rewrite_about_block(piko_directory)


def inject_line_sources(piko_directory: Path) -> None:
    """Copy the LINE patch set from sources/line into the build tree.

    Only the LINE patches enter the bundle. The source copy keeps
    upstream's full tree, but the Facebook patch sources and
    upstream's release tooling (patches/src/main/kotlin/util/, its
    own generatePatchesList) are not injected. The shared subtree
    carries the LINE compatibility definition and the resource-id
    resolver the LINE patches depend on; the LINE settings UI lives
    in the extensions/extension module.
    """
    patches_kotlin = LINE_SOURCES / "patches" / "src" / "main" / "kotlin"
    build_kotlin = piko_directory / "patches" / "src" / "main" / "kotlin"
    for subtree in ("line", "shared"):
        _copy_tree(
            patches_kotlin / "app" / "andrewliang" / "patches" / subtree,
            build_kotlin / "app" / "andrewliang" / "patches" / subtree,
        )
    _copy_tree(
        LINE_SOURCES / "extensions" / "extension",
        piko_directory / "extensions" / "extension",
    )
    _strip_extension_dsl(
        piko_directory / "extensions" / "extension" / "build.gradle.kts"
    )
    _rename_line_resource_ids(
        build_kotlin
        / "app"
        / "andrewliang"
        / "patches"
        / "shared"
        / "ResourceIds.kt"
    )
    _append_proguard_keep(piko_directory)


def _rename_line_resource_ids(build_file: Path) -> None:
    """Rename the LINE shared map so the patcher 2.0.0 context cannot shadow it.

    Upstream's shared/ResourceIds.kt keeps parsed resource ids in a
    file-private ``val resourceIds = mutableMapOf<String, Long>()`` and
    mutates it inside ``resourcePatch { execute { ... } }``. Upstream
    builds against morphe-patcher 1.7.0, whose resource patch context
    has no such member. The Piko build tree uses patcher 2.0.0, where
    ResourcePatchContext declares ``val resourceIds: ResourceIds``;
    inside the execute lambda that member shadows the file-private
    map, so ``clear()`` and the ``set`` operator stop resolving and
    compilation fails. Renaming the map in the build tree only (the
    sources/line copy stays byte-identical to upstream) removes the
    collision: exactly the declaration, the read in ``resourceId()``,
    the ``clear()`` and the assignment are renamed.
    """
    text = build_file.read_text(encoding="utf-8")
    renamed, count = re.subn(r"\bresourceIds\b", "lineResourceIds", text)
    if count != 4:
        raise ValueError(
            f"Expected 4 resourceIds occurrences in {build_file}, found {count}"
        )
    build_file.write_text(renamed, encoding="utf-8")
    print("Adapted ResourceIds.kt: renamed resourceIds map to lineResourceIds")


# Single patch-source files the KakaoTalk patches import from
# upstream's shared/ and all/ subtrees (import inventory taken from
# the KakaoTalk sources; see sources/kakao/UPSTREAM_BASE.md). All
# are nameless base patches / factories, except
# shared/misc/privacy/DisableSentryTelemetry.kt, which declares the
# named universal patch "Disable Sentry telemetry" that the
# KakaoTalk "Disable Sentry" patch depends on (it is part of
# upstream's own patches-list.json with no compatible packages).
_KAKAO_SHARED_FILES = (
    "shared/misc/packagename/ChangePackageNamePatch.kt",
    "shared/misc/string/ReplaceStringPatch.kt",
    "shared/misc/privacy/DisableSentryTelemetry.kt",
    "all/misc/build/BaseSpoofBuildInfoPatch.kt",
    "all/misc/versioncode/ChangeVersionCodePatch.kt",
    "all/misc/transformation/TransformInstructionsPatch.kt",
)

# Version-catalog entries the KakaoTalk extension module needs but
# the Piko build tree's gradle/libs.versions.toml does not carry.
# Versions and coordinates are upstream's own (sources/kakao/gradle/
# libs.versions.toml); annotation and appcompat already exist in the
# host catalog and are not repeated here.
_KAKAO_CATALOG_VERSIONS = (
    'exifinterface = "1.4.2"',
    'okhttp = "5.5.0"',
    'retrofit = "3.0.0"',
    'hiddenapibypass = "6.1"',
    'netty = "4.2.16.Final"',
)
_KAKAO_CATALOG_LIBRARIES = (
    'exifinterface = { module = "androidx.exifinterface:exifinterface", version.ref = "exifinterface" }',
    'okhttp = { module = "com.squareup.okhttp3:okhttp", version.ref = "okhttp" }',
    'retrofit = { module = "com.squareup.retrofit2:retrofit", version.ref = "retrofit" }',
    'hiddenapibypass = { module = "org.lsposed.hiddenapibypass:hiddenapibypass", version.ref = "hiddenapibypass" }',
    'netty-all = { module = "io.netty:netty-all", version.ref = "netty" }',
)


def _copy_file(source: Path, destination: Path) -> None:
    if not source.is_file():
        raise FileNotFoundError(f"Source file is missing: {source}")
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source, destination)
    print(f"Copied file: {source} -> {destination}")


def _add_kakao_catalog_aliases(piko_directory: Path) -> None:
    """Add the KakaoTalk extension's catalog aliases to the build tree.

    extensions/kakaotalk references libs.okhttp, libs.retrofit,
    libs.netty.all, libs.hiddenapibypass and libs.exifinterface,
    which the host catalog does not define. The aliases are inserted
    at the end of the [versions] and [libraries] sections of the
    build tree's catalog only; each insertion is skipped when the
    key already exists.
    """
    catalog = piko_directory / "gradle" / "libs.versions.toml"
    text = catalog.read_text(encoding="utf-8")

    def section_span(text: str, section: str) -> tuple[int, int]:
        marker = f"[{section}]"
        start = text.find(marker)
        if start == -1:
            raise ValueError(f"No [{section}] section in {catalog}")
        next_section = text.find("\n[", start + len(marker))
        return start, len(text) if next_section == -1 else next_section

    def missing_in_section(text: str, section: str, lines: tuple[str, ...]) -> list[str]:
        start, end = section_span(text, section)
        body = text[start:end]
        return [
            line
            for line in lines
            if not re.search(rf"^{re.escape(line.split(' =')[0])}\s*=", body, re.M)
        ]

    def append_to_section(text: str, section: str, lines: list[str]) -> str:
        _, end = section_span(text, section)
        addition = "".join(line + "\n" for line in lines)
        return text[:end] + "\n" + addition + text[end:]

    version_lines = missing_in_section(text, "versions", _KAKAO_CATALOG_VERSIONS)
    if version_lines:
        text = append_to_section(text, "versions", version_lines)
    library_lines = missing_in_section(text, "libraries", _KAKAO_CATALOG_LIBRARIES)
    if library_lines:
        text = append_to_section(text, "libraries", library_lines)
    catalog.write_text(text, encoding="utf-8")
    print(
        "Adapted gradle/libs.versions.toml: added KakaoTalk extension "
        f"aliases ({len(version_lines)} versions, {len(library_lines)} libraries)"
    )


def _adapt_kakao_extension_build(build_file: Path) -> None:
    """Adapt extensions/kakaotalk/build.gradle.kts to the host build.

    Two build-tree-only changes (the sources/kakao copy is untouched):

    - Declare the module namespace explicitly. Upstream's plugin
      2.0.0 derives it from the settings defaultNamespace
      ("app.revanced.extension") plus the module name; the host's
      plugin 1.3.4 extensions (newx, twitch, extension) all declare
      their namespace in the build file instead, so the same value
      upstream effectively uses is written out here.
    - Add compileOnly(libs.morphe.extensions.library). Upstream's
      shared library exposes the Morphe extensions library as `api`,
      so the KakaoTalk module compiled against
      app.morphe.extension.shared.* through it. The host's
      :extensions:shared:library carries it as `implementation`
      (not visible to consumers), and the host's own extension
      modules declare the same compileOnly line themselves
      (see extensions/newx in the Piko tree).
    """
    text = build_file.read_text(encoding="utf-8")
    if "namespace" not in text:
        anchor = "android {\n    compileSdk = 36\n"
        if text.count(anchor) != 1:
            raise ValueError(f"Unexpected android block in {build_file}")
        text = text.replace(
            anchor,
            "android {\n    namespace = \"app.revanced.extension.kakaotalk\"\n    compileSdk = 36\n",
            1,
        )
    dep_anchor = "    compileOnly(libs.netty.all)\n"
    if "libs.morphe.extensions.library" not in text:
        if text.count(dep_anchor) != 1:
            raise ValueError(f"Unexpected dependencies block in {build_file}")
        text = text.replace(
            dep_anchor,
            dep_anchor + "    compileOnly(libs.morphe.extensions.library)\n",
            1,
        )
    build_file.write_text(text, encoding="utf-8")
    print(f"Adapted {build_file}: namespace + morphe extensions library dep")


def _strip_kakao_locale_narrowing(resources_file: Path) -> None:
    """Drop the setAddResourceLocale call from KakaoTalk's Resources.kt.

    Upstream's kakaotalk/shared/Resources.kt narrows the global
    addresources locale list to the default locale and Korean via
    setAddResourceLocale, an internal of upstream's vendored
    AddResourcesPatch that the host Morphe library does not expose
    (CI: unresolved reference). The host library's addAppResources
    merges every bundled addresources locale folder by default —
    that is how the Piko set's values-ja-rJP strings ship — so
    removing the narrowing makes KakaoTalk merge the default,
    Korean and Japanese strings exactly like Piko. The build tree's
    copy loses only the call and its import; the sources/kakao copy
    stays byte-identical to upstream.
    """
    text = resources_file.read_text(encoding="utf-8")
    call = "    setAddResourceLocale(localesKakaoTalk)\n"
    import_line = (
        "import app.morphe.patches.all.misc.resources.setAddResourceLocale\n"
    )
    if text.count(call) != 1 or text.count(import_line) != 1:
        raise ValueError(f"Unexpected Resources.kt shape in {resources_file}")
    text = text.replace(import_line, "", 1).replace(call, "", 1)
    resources_file.write_text(text, encoding="utf-8")
    print("Adapted Resources.kt: removed setAddResourceLocale narrowing")


# Upstream vendors a small app.morphe library inside its patches
# module (the settings-preference DSL and resource helpers). The
# host's Morphe library does not ship those classes (the KakaoTalk
# patches fail with unresolved SwitchPreference without them), so
# the vendored sources are injected too — except these three:
# - patches/all/misc/resources/AddResourcesPatch.kt: the host
#   library already provides addAppResources/AppLocale publicly
#   (the Piko set compiles against them); only the file's
#   setAddResourceLocale is not public there, and the KakaoTalk
#   Resources.kt adaptation below removes that one call instead.
# - patches/util/resource/CheckStringResources.kt: a standalone
#   main() checker that also references the DC Inside locale list;
#   no patch source calls it.
# - util/PatchListGenerator.kt: a standalone build utility that no
#   patch source references.
_KAKAO_VENDORED_EXCLUDES = {
    "patches/all/misc/resources/AddResourcesPatch.kt",
    "patches/util/resource/CheckStringResources.kt",
    "util/PatchListGenerator.kt",
}


def _copy_kakao_vendored_library(piko_directory: Path) -> None:
    """Inject upstream's vendored app.morphe patches-module library.

    Copies file by file and refuses to overwrite a host file whose
    content differs, so a future host-side addition in the same
    package surfaces as an error instead of a silent replacement.
    """
    source_root = (
        KAKAO_SOURCES / "patches" / "src" / "main" / "kotlin" / "app" / "morphe"
    )
    target_root = (
        piko_directory / "patches" / "src" / "main" / "kotlin" / "app" / "morphe"
    )
    copied = 0
    for source in sorted(source_root.rglob("*.kt")):
        relative = source.relative_to(source_root).as_posix()
        if relative in _KAKAO_VENDORED_EXCLUDES:
            continue
        target = target_root / relative
        if target.exists():
            if target.read_bytes() != source.read_bytes():
                raise ValueError(
                    "Vendored library file would overwrite a different "
                    f"host file: app/morphe/{relative}"
                )
            continue
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source, target)
        copied += 1
    print(f"Injected {copied} vendored Morphe library files for KakaoTalk")


def _add_kakao_metadata_dependency(piko_directory: Path) -> None:
    """Add kotlin-metadata-jvm to the build tree's patches module.

    KakaoTalk's message-details code reads Kotlin metadata
    (kotlin.metadata.jvm.*); upstream declares
    implementation(kotlin("metadata-jvm")) in its
    patches/build.gradle.kts and the host's file does not.
    Build-tree only; the sources/piko copy is untouched.
    """
    build_file = piko_directory / "patches" / "build.gradle.kts"
    text = build_file.read_text(encoding="utf-8")
    if 'kotlin("metadata-jvm")' in text:
        print("KakaoTalk: kotlin metadata-jvm dependency already present")
        return
    anchor = "    implementation(libs.gson)\n"
    if text.count(anchor) != 1:
        raise ValueError(f"Unexpected dependencies block in {build_file}")
    text = text.replace(
        anchor, anchor + '    implementation(kotlin("metadata-jvm"))\n', 1
    )
    build_file.write_text(text, encoding="utf-8")
    print("Adapted patches/build.gradle.kts: added kotlin metadata-jvm")


def _rewrite_kakao_read_all_bytes(piko_directory: Path) -> None:
    """Replace InputStream.readAllBytes() in the KakaoTalk patches.

    The host's :patches module runs AnimalSniffer against the
    Android API 29 signature (gummy-bears), which does not contain
    InputStream.readAllBytes (Java 9+); upstream does not run that
    check, so its two call sites pass there but fail here. Kotlin's
    readBytes() extension is the API-safe equivalent — the Twitch
    set already uses it in this module and passes the check. The
    rewrite happens in the build tree only, and the replacement
    count is asserted so a new upstream call site surfaces as an
    error instead of a silent extra rewrite.
    """
    root = (
        piko_directory
        / "patches"
        / "src"
        / "main"
        / "kotlin"
        / "app"
        / "revanced"
        / "patches"
        / "kakaotalk"
    )
    replaced = 0
    for source in sorted(root.rglob("*.kt")):
        text = source.read_text(encoding="utf-8")
        count = text.count(".readAllBytes()")
        if count:
            source.write_text(
                text.replace(".readAllBytes()", ".readBytes()"), encoding="utf-8"
            )
            replaced += count
    if replaced != 2:
        raise ValueError(
            f"Expected 2 readAllBytes() call sites in KakaoTalk patches, "
            f"found {replaced}"
        )
    print("Adapted KakaoTalk patches: readAllBytes() -> readBytes() (2 sites)")


def inject_kakao_sources(piko_directory: Path) -> None:
    """Copy the KakaoTalk patch set from sources/kakao into the build tree.

    Only the KakaoTalk patches enter the bundle. The source copy
    keeps upstream's full tree, but the other apps' patch sources
    (dcinside/, soop/, chzzk/, flexcil/, navermap/,
    samsungkeyboard/, starnote/), the rest of shared/ and all/, and
    the other apps' addresources and extension modules are not
    injected. Upstream's vendored app.morphe patches-module library
    sources ARE injected (see _copy_kakao_vendored_library): the
    host library lacks the settings-preference DSL they provide.
    No proguard keep is needed: the host's
    extensions/proguard-rules.pro already keeps app.revanced.**,
    which covers app.revanced.extension.kakaotalk.**.
    """
    kakao_kotlin = KAKAO_SOURCES / "patches" / "src" / "main" / "kotlin" / "app" / "revanced"
    build_kotlin = piko_directory / "patches" / "src" / "main" / "kotlin" / "app" / "revanced"
    _copy_tree(kakao_kotlin / "patches" / "kakaotalk", build_kotlin / "patches" / "kakaotalk")
    _copy_tree(kakao_kotlin / "util", build_kotlin / "util")
    for relative in _KAKAO_SHARED_FILES:
        _copy_file(kakao_kotlin / "patches" / relative, build_kotlin / "patches" / relative)
    _copy_kakao_vendored_library(piko_directory)
    _add_kakao_metadata_dependency(piko_directory)
    _rewrite_kakao_read_all_bytes(piko_directory)
    _strip_kakao_locale_narrowing(build_kotlin / "patches" / "kakaotalk" / "shared" / "Resources.kt")

    kakao_resources = KAKAO_SOURCES / "patches" / "src" / "main" / "resources"
    build_resources = piko_directory / "patches" / "src" / "main" / "resources"
    _copy_tree(kakao_resources / "kakaotalk", build_resources / "kakaotalk")
    _copy_tree(kakao_resources / "settings", build_resources / "settings")
    # The settings resource root is shared with the DC Inside patch
    # set upstream; its two files are not referenced by any KakaoTalk
    # patch and stay out of the bundle.
    for dcinside_file in (
        "layout/morphe_dcinside_settings.xml",
        "xml/morphe_dcinside_settings_preferences.xml",
    ):
        stale = build_resources / "settings" / dcinside_file
        if stale.exists():
            stale.unlink()
            print(f"Removed non-KakaoTalk settings resource: {dcinside_file}")
    for values_dir in ("values", "values-ko-rKR", "values-ja-rJP"):
        _copy_tree(
            kakao_resources / "addresources" / values_dir / "kakaotalk",
            build_resources / "addresources" / values_dir / "kakaotalk",
        )

    _copy_tree(
        KAKAO_SOURCES / "extensions" / "kakaotalk",
        piko_directory / "extensions" / "kakaotalk",
    )
    _adapt_kakao_extension_build(
        piko_directory / "extensions" / "kakaotalk" / "build.gradle.kts"
    )
    # The KakaoTalk extension compiles against the Morphe preference
    # UI classes (app.morphe.extension.shared.settings.preference.*)
    # that upstream vendors as sources in its own shared library.
    # The host's :extensions:shared:library does not carry them, so
    # the same sources are added to the build tree's shared library,
    # where they are dexed into extensions/shared.mpe just like
    # upstream (and where the host's own PikoSharedPrefCategory
    # already lives in the same package).
    _copy_tree(
        KAKAO_SOURCES
        / "extensions"
        / "shared"
        / "library"
        / "src"
        / "main"
        / "java"
        / "app"
        / "morphe"
        / "extension"
        / "shared"
        / "settings"
        / "preference",
        piko_directory
        / "extensions"
        / "shared"
        / "library"
        / "src"
        / "main"
        / "java"
        / "app"
        / "morphe"
        / "extension"
        / "shared"
        / "settings"
        / "preference",
    )
    _add_kakao_catalog_aliases(piko_directory)


def set_project_version(piko_directory: Path, version: str) -> None:
    """Set the version only in the temporary Piko tree used for a build."""
    properties_path = piko_directory / "gradle.properties"
    lines = properties_path.read_text(encoding="utf-8").splitlines(keepends=True)
    version_indexes = [
        index
        for index, line in enumerate(lines)
        if re.match(r"^\s*version\s*=", line)
    ]
    if len(version_indexes) != 1:
        raise ValueError("Piko gradle.properties must contain exactly one version")

    lines[version_indexes[0]] = f"version = {version}\n"
    properties_path.write_text("".join(lines), encoding="utf-8")


def twitch_base_version() -> str:
    """Version of the upstream twitch-patched release the copy is based on."""
    changelog = TWITCH_SOURCES / "CHANGELOG.md"
    if changelog.is_file():
        match = re.search(
            r"\[(\d+\.\d+\.\d+)\]", changelog.read_text(encoding="utf-8")
        )
        if match:
            return match.group(1)
    return "unknown"


def line_base_version() -> str:
    """Version of the upstream morphe-patches release the copy is based on."""
    changelog = LINE_SOURCES / "CHANGELOG.md"
    if changelog.is_file():
        match = re.search(
            r"\[(\d+\.\d+\.\d+)\]", changelog.read_text(encoding="utf-8")
        )
        if match:
            return match.group(1)
    return "unknown"


def kakao_base_version() -> str:
    """Version of the upstream revanced-patches release the copy is based on."""
    changelog = KAKAO_SOURCES / "CHANGELOG.md"
    if changelog.is_file():
        match = re.search(
            r"\[(\d+\.\d+\.\d+)\]", changelog.read_text(encoding="utf-8")
        )
        if match:
            return match.group(1)
    return "unknown"


# The order of upstream crimera/piko-newx's published patches-list.json
# (v3.73.0). The Morphe Gradle plugin emits the generated list sorted
# by patch name instead; the generated X entries are reordered to
# match upstream's published list so the released asset reads the
# same. This is cosmetic only: the patcher sorts by name at runtime
# regardless of the list order. Keep in sync with EXPECTED_X_ORDER in
# scripts/verify_bundle.py.
UPSTREAM_X_LIST_ORDER = [
    "NewX: Remove ads",
    "NewX: Disable blur effects",
    "NewX: Restore Twitter branding",
    "NewX: Browse tweet object",
    "NewX: Open canonical URLs",
    "NewX: Clone",
    "NewX: Crash logs",
    "NewX: Custom font",
    "NewX: Custom sharing domain",
    "NewX: Permanent share links",
    "NewX: Remove share tracking parameters",
    "NewX: Customize drawer items",
    "NewX: Theme",
    "NewX: Feature switch overrides",
    "NewX: Enable quality-of-life feature flags",
    "NewX: Customize inline actions",
    "NewX: Inline download button",
    "NewX: Redirect downloads to chosen folder",
    "NewX: Log HLS audio renditions",
    "NewX: Customize media menu items",
    "NewX: Set default media tab",
    "NewX: Gallery profile Photos tab",
    "NewX: Customize navigation bar",
    "NewX: Hide post author actions",
    "NewX: Hide post reply bar",
    "NewX: Customize post menu items",
    "NewX: Set default profile post sorting",
    "NewX: Customize profile tabs",
    "NewX: Set default reply sorting",
    "NewX: Server error logging",
    "NewX: Disable video player scrolling",
    "NewX: Hide premium upsell",
    "NewX: Unlock color customization",
    "NewX: Unlock downloads",
    "NewX: Customize timeline tabs",
    "NewX: Disable automatic timeline refresh",
    "NewX: Filter For You by topic",
    "NewX: Hide AI-generated posts",
    "NewX: Hide Discover more",
    "NewX: Hide compose button",
    "NewX: Hide new posts pill",
    "NewX: Hide post dividers",
    "NewX: Hide Spaces bar",
    "NewX: Hide timeline tabs bar",
    "NewX: Hide who to follow",
    "NewX: Restore pinned home tab",
    "NewX: Restore timeline position",
    "NewX: Show poll results",
    "NewX: Show sensitive media",
    "NewX: Hide posts by verified account type",
    "NewX: Filter posts by keyword",
    "NewX: Translator",
]


def reorder_patches_list(patches_list: Path) -> None:
    """Reorder the X entries of a generated patches-list.json in place.

    Only the relative order among the X (com.twitter.android) entries
    changes; every other entry keeps its generated position.
    """

    def is_x_entry(entry: object) -> bool:
        if not isinstance(entry, dict):
            return False
        compat = entry.get("compatiblePackages") or []
        if isinstance(compat, dict):
            packages = list(compat.keys())
        else:
            packages = [
                item.get("packageName") for item in compat if isinstance(item, dict)
            ]
        return "com.twitter.android" in packages

    data = json.loads(patches_list.read_text(encoding="utf-8"))
    entries = data["patches"] if isinstance(data, dict) else data
    rank = {name: index for index, name in enumerate(UPSTREAM_X_LIST_ORDER)}
    x_sorted = sorted(
        (entry for entry in entries if is_x_entry(entry)),
        key=lambda entry: rank.get(entry["name"], len(rank)),
    )
    x_iter = iter(x_sorted)
    reordered = [next(x_iter) if is_x_entry(entry) else entry for entry in entries]
    if reordered == entries:
        return
    if isinstance(data, dict):
        data["patches"] = reordered
    else:
        data = reordered
    patches_list.write_text(
        json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8"
    )
    print("Reordered X patches in the patches list to upstream's published order")


@dataclass
class CombinedBuild:
    piko_commit: str
    supported_versions: frozenset[str]
    twitch_base: str
    line_base: str
    kakao_base: str
    patches_list: Path | None = field(default=None)


def build_combined(
    bundle_version: str, output: str | None = None
) -> CombinedBuild:
    if bundle_version.startswith("v"):
        raise ValueError("bundle_version must not include the leading v")
    if output is None:
        output = f"bins/patches-{bundle_version}.mpp"
    output_path = Path(output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    base_commit = piko_base_commit()
    supported_versions = get_supported_versions(
        (PIKO_SOURCES / XLITE_CONSTANTS).read_text(encoding="utf-8")
    )

    with tempfile.TemporaryDirectory(prefix="ayufa-patches-jp-") as temporary_directory:
        piko_directory = Path(temporary_directory) / "piko"

        prepare_build_tree(piko_directory)
        report_translation_coverage(piko_directory)
        inject_twitch_sources(piko_directory)
        inject_line_sources(piko_directory)
        inject_kakao_sources(piko_directory)
        set_project_version(piko_directory, bundle_version)

        subprocess.run(
            ["./gradlew", "clean", "buildAndroid"],
            cwd=piko_directory,
            env=os.environ.copy(),
            check=True,
        )

        artifacts_directory = piko_directory / "patches" / "build" / "libs"
        artifact = artifacts_directory / f"patches-{bundle_version}.mpp"
        if not artifact.is_file():
            raise FileNotFoundError(
                f"Build did not produce the expected artifact {artifact.name}"
            )
        shutil.copy2(artifact, output_path)
        print(f"Built combined bundle: {output_path}")

        # Best effort: generate the patches list for verification and
        # release metadata. The release workflow fails the release if
        # the list is missing, so a failure here cannot ship silently.
        patches_list: Path | None = None
        try:
            list_search_after = time.time()
            subprocess.run(
                ["./gradlew", ":patches:generatePatchesList"],
                cwd=piko_directory,
                env=os.environ.copy(),
                check=True,
            )
            candidates = [
                candidate
                for candidate in piko_directory.rglob("patches-list.json")
                if ".git" not in candidate.parts
                and candidate.stat().st_mtime >= list_search_after
            ]
            if candidates:
                generated = max(candidates, key=lambda c: c.stat().st_mtime)
                patches_list = output_path.parent / "patches-list.json"
                shutil.copy2(generated, patches_list)
                reorder_patches_list(patches_list)
                print(f"Generated patches list: {patches_list}")
            else:
                print("generatePatchesList produced no fresh patches-list.json")
        except subprocess.CalledProcessError as error:
            print(f"WARNING: generatePatchesList failed ({error}); continuing")

    return CombinedBuild(
        piko_commit=base_commit,
        supported_versions=supported_versions,
        twitch_base=twitch_base_version(),
        line_base=line_base_version(),
        kakao_base=kakao_base_version(),
        patches_list=patches_list,
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--version",
        required=True,
        help="Combined bundle version (semver, without the leading v)",
    )
    parser.add_argument(
        "--output",
        default=None,
        help="Output .mpp path (default: bins/patches-<version>.mpp)",
    )
    parser.add_argument(
        "--metadata",
        default=None,
        help="Where to write build metadata JSON (default: next to the output)",
    )
    args = parser.parse_args()

    result = build_combined(args.version, args.output)

    output_path = Path(args.output or f"bins/patches-{args.version}.mpp")
    metadata_path = (
        Path(args.metadata)
        if args.metadata
        else output_path.parent / "build-metadata.json"
    )
    metadata = {
        "version": args.version,
        "piko_commit": result.piko_commit,
        "piko_branch": "x-lite",
        "piko_source": "sources/piko (translated source copy)",
        "x_supported_versions": sorted(result.supported_versions),
        "twitch_base_version": result.twitch_base,
        "line_base_version": result.line_base,
        "kakao_base_version": result.kakao_base,
        "patches_list_generated": result.patches_list is not None,
    }
    metadata_path.write_text(
        json.dumps(metadata, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    print(json.dumps(metadata, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
