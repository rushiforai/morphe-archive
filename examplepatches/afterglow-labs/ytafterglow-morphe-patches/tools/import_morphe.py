#!/usr/bin/env python3
"""Import the pinned Morphe YouTube source and runtime inputs, without networking.

Only patch export metadata and the declared integration adapters are changed.
Feature implementations stay in their original packages. Re-import deliberately
refuses to overwrite local integration edits unless --replace is supplied.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import shutil
import tarfile
import zipfile


ROOT = Path(__file__).resolve().parents[1]
DESTINATION = ROOT / "vendor/morphe"
INPUTS = {
    "patches": {
        "version": "2.0.0",
        "revision": "6cb8e6b6ee425eda8a854e026507286359f38a32",
        "sha256": "ef67488ca5a9c4b1461c7297ca085e0c0ebac849c1a19118951ec37850f11027",
        "url": "https://codeload.github.com/MorpheApp/morphe-patches/tar.gz/6cb8e6b6ee425eda8a854e026507286359f38a32",
    },
    "library": {
        "version": "2.1.0-dev.2",
        "revision": "42edb9710c2b63416e8eddd8096bb6a0adff75dd",
        "sha256": "de187bb7ff03f8c4e7a30f5fa0e44ae7c3ce11cc63a4e823a16e4cbd036bb1de",
        "url": "https://codeload.github.com/MorpheApp/morphe-patches-library/tar.gz/42edb9710c2b63416e8eddd8096bb6a0adff75dd",
    },
    "bundle": {
        "version": "2.0.0",
        "sha256": "f0f5cfd857950ed61a26a7b2eeeecf37d4d66bece2e8f94802280e189b69ed00",
        "url": "https://github.com/MorpheApp/morphe-patches/releases/download/v2.0.0/patches-2.0.0.mpp",
    },
}
PATCH_SOURCE_PREFIX = "patches/src/main/kotlin/"
LIBRARY_SOURCE_PREFIX = "patch-library/src/main/kotlin/"
PATCH_PACKAGES = tuple(
    f"app/morphe/patches/{part}/" for part in ("youtube", "shared", "all", "util")
)
BUILDER_CALL = re.compile(r"\b(?:bytecodePatch|resourcePatch|rawResourcePatch)\s*\(")
MODIFICATION_NOTICE = (
    "// Afterglow adaptation: original patch export names are suppressed; "
    "the Afterglow catalog owns selection.\n"
)


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def replace_once(source: str, original: str, replacement: str, label: str) -> str:
    if source.count(original) != 1:
        raise ValueError(f"upstream {label} changed")
    return source.replace(original, replacement, 1)


def verify_input(path: Path, kind: str) -> None:
    actual = digest(path.read_bytes())
    expected = INPUTS[kind]["sha256"]
    if actual != expected:
        raise ValueError(f"{kind} input hash mismatch: {actual}, expected {expected}")


def kotlin_code_mask(source: str) -> str:
    """Keep code positions while hiding comments and quoted string/char contents."""
    chars = list(source)
    index = 0
    while index < len(source):
        start = index
        if source.startswith("//", index):
            end = source.find("\n", index)
            index = len(source) if end < 0 else end
        elif source.startswith("/*", index):
            index += 2
            depth = 1
            while depth:
                if index >= len(source):
                    raise ValueError("unterminated Kotlin comment")
                if source.startswith("/*", index):
                    depth += 1
                    index += 2
                elif source.startswith("*/", index):
                    depth -= 1
                    index += 2
                else:
                    index += 1
        elif source.startswith('"""', index):
            end = source.find('"""', index + 3)
            if end < 0:
                raise ValueError("unterminated Kotlin raw string")
            index = end + 3
        elif source[index] in "\"'":
            quote = source[index]
            index += 1
            while index < len(source):
                if source[index] == "\\":
                    index += 2
                elif source[index] == quote:
                    index += 1
                    break
                else:
                    index += 1
        else:
            index += 1
            continue
        for offset in range(start, index):
            if chars[offset] != "\n":
                chars[offset] = " "
    return "".join(chars)


def suppress_patch_names(source: str) -> tuple[str, list[str]]:
    """Only replace the name argument of actual patch-builder calls.

    This also covers shared patch factories that forward a computed name. It
    never changes option names, preference keys, resource names or fingerprints.
    """
    mask = kotlin_code_mask(source)
    replacements: list[tuple[int, int, str]] = []
    for match in BUILDER_CALL.finditer(mask):
        start = match.end()
        stack = ["("]
        arguments: list[tuple[int, int]] = []
        for index in range(start, len(mask)):
            char = mask[index]
            if char in "([{":
                stack.append(char)
            elif char in ")]}":
                if not stack or stack.pop() != {")": "(", "]": "[", "}": "{"}[char]:
                    raise ValueError("unbalanced Kotlin patch builder")
                if not stack:
                    arguments.append((start, index))
                    break
            elif char == "," and len(stack) == 1:
                arguments.append((start, index))
                start = index + 1
        else:
            raise ValueError("unterminated Kotlin patch builder")
        for position, (start, end) in enumerate(arguments):
            code = mask[start:end]
            named = re.match(r"\s*name\s*=", code)
            if named:
                expression_start = start + named.end()
            elif position == 0 and source[start:end].strip() and "=" not in code:
                # The first positional argument is also the optional patch name.
                expression_start = start
            else:
                continue
            original = source[expression_start:end].strip()
            if original and original != "null":
                replacements.append((expression_start, end, original))
    for start, end, original in reversed(replacements):
        source = source[:start] + " null" + source[end:]
    if replacements:
        package = re.search(r"^package ", source, re.MULTILINE)
        if package is None:
            raise ValueError("Kotlin package declaration missing")
        source = source[:package.start()] + MODIFICATION_NOTICE + source[package.start():]
    return source, [original for _, _, original in replacements]


def source_members(path: Path):
    with tarfile.open(path, "r:gz") as archive:
        for member in archive:
            if not member.isfile():
                continue
            relative = PurePosixPath(member.name).parts[1:]
            if not relative or ".." in relative:
                continue
            stream = archive.extractfile(member)
            assert stream is not None
            yield "/".join(relative), stream.read()


def retained_resource(name: str) -> bool:
    if name.endswith("/") or name.endswith(".class") or name == "classes.dex":
        return False
    if name.startswith(("META-INF/", "custom-branding/", "change-header/")):
        return False
    if name.startswith("addresources/") and any(
        f"/{app}/" in name for app in ("music", "reddit")
    ):
        return False
    if name in ("extensions/music.mpe", "extensions/reddit.mpe"):
        return False
    return True


def import_inputs(patches: Path, library: Path, bundle: Path, replace: bool) -> None:
    for kind, path in (("patches", patches), ("library", library), ("bundle", bundle)):
        verify_input(path, kind)
    if DESTINATION.exists():
        if not replace:
            raise ValueError(f"{DESTINATION} exists; use --replace only after preserving local changes")
        shutil.rmtree(DESTINATION)
    DESTINATION.mkdir(parents=True)
    records = []

    def write(relative: str, data: bytes, origin: str, original: bytes | None = None,
              changes: list[str] | None = None) -> None:
        target = DESTINATION / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
        record = {"path": relative, "origin": origin, "sha256": digest(data)}
        if original is not None:
            record["original_sha256"] = digest(original)
        if changes:
            record["modifications"] = changes
        records.append(record)

    for kind, archive, prefix in (("patches", patches, PATCH_SOURCE_PREFIX),
                                  ("library", library, LIBRARY_SOURCE_PREFIX)):
        for relative, original in source_members(archive):
            if relative in ("LICENSE", "NOTICE"):
                write(f"licenses/{kind.upper()}_{relative}", original, f"{kind}:{relative}")
            elif kind == "patches" and relative.startswith("patches/stub/src/main/java/"):
                write("stubs/src/main/java/" + relative.removeprefix("patches/stub/src/main/java/"),
                      original, f"{kind}:{relative}")
            elif relative.startswith(prefix) and relative.endswith(".kt"):
                source_relative = relative.removeprefix(prefix)
                if kind == "patches" and not source_relative.startswith(PATCH_PACKAGES):
                    continue
                source, hidden = suppress_patch_names(original.decode())
                changes = ["Suppress patch export name: " + name for name in hidden]
                if source_relative == "app/morphe/patches/all/misc/resources/AddResourcesPatch.kt":
                    declaration = (
                        "val addResourcesPatch = resourcePatch(\n"
                        '    description = "Add resources such as strings or arrays to the app."\n'
                        ") {"
                    )
                    if source.count(declaration) != 1:
                        raise ValueError("upstream AddResources declaration changed")
                    source = source.replace("import app.morphe.patcher.patch.resourcePatch",
                        "import app.afterglow.patches.morphe.morpheSettingsBridgeResourcesPatch\n"
                        "import app.morphe.patcher.patch.resourcePatch", 1)
                    source = source.replace(declaration, declaration +
                        "\n    // Afterglow integration: finalise settings labels after resource generation.\n"
                        "    dependsOn(morpheSettingsBridgeResourcesPatch)\n", 1)
                    changes.append("Order Afterglow settings-resource finalizer after upstream resource generation")
                elif source_relative == "app/morphe/patches/youtube/layout/buttons/overlay/Fingerprints.kt":
                    start = source.index("internal object OverlayCastButtonVisibilityFingerprint : Fingerprint(")
                    end = source.index("\n)\n", start) + 3
                    block = source[start:end]
                    pattern = ('smali = "Landroid/view/View;->setVisibility(I)V",\n'
                               '            location = MatchAfterImmediately()')
                    if block.count(pattern) != 2:
                        raise ValueError("upstream Cast visibility fingerprint changed")
                    block = block.replace(pattern,
                        'smali = "Landroid/view/View;->setVisibility(I)V",\n'
                        "            // Afterglow's visibility observer adds two instructions here.\n"
                        "            location = MatchAfterWithin(3)")
                    source = source[:start] + block + source[end:]
                    changes.append("Allow the two Afterglow Cast observer instructions in the native call-site window")
                elif source_relative == "app/morphe/patches/youtube/layout/buttons/overlay/HidePlayerOverlayButtonsPatch.kt":
                    pattern = "            OverlayCastButtonVisibilityFingerprint.let {"
                    if source.count(pattern) != 1:
                        raise ValueError("upstream Cast visibility hook changed")
                    source = source.replace(pattern,
                        "            // Afterglow integration: keep one immutable match while editing both sites.\n"
                        "            OverlayCastButtonVisibilityFingerprint.match().let {", 1)
                    changes.append("Capture one Cast fingerprint match before modifying either native call site")
                elif source_relative in (
                    "app/morphe/patches/youtube/video/information/Fingerprints.kt",
                    "app/morphe/patches/youtube/shared/Fingerprints.kt",
                ):
                    enum = "PlayerStatus" if "/video/information/" in source_relative else "PlayerType"
                    anchor = (f"internal object {enum}EnumFingerprint : Fingerprint(\n"
                              "    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),\n")
                    source = replace_once(source, anchor, anchor +
                        "    // Afterglow mirrors this enum; only the native YouTube owner is a hook target.\n"
                        '    custom = { _, classDef -> !classDef.type.startsWith("Lapp/afterglow/extension/") },\n',
                        enum + " enum fingerprint")
                    changes.append(f"Exclude Afterglow extension enum copies from the native {enum} fingerprint")
                elif source_relative == "app/morphe/patches/youtube/misc/navigation/Fingerprints.kt":
                    source = replace_once(source,
                        "        // Don't match our extension code.\n"
                        '        !classDef.type.startsWith("Lapp/morphe/")',
                        "        // Don't match Morphe or Afterglow extension code.\n"
                        '        !classDef.type.startsWith("Lapp/morphe/") &&\n'
                        '                !classDef.type.startsWith("Lapp/afterglow/extension/")',
                        "native image enum extension exclusion")
                    changes.append("Exclude Afterglow toolbar constants from the native image enum fingerprint")
                elif source_relative == "app/morphe/patches/youtube/layout/buttons/navigation/Fingerprints.kt":
                    source = replace_once(source, "import app.morphe.patcher.Fingerprint",
                        "import app.afterglow.patches.tweaks.navigation.NAVIGATION_BAR_HOOKS\n"
                        "import app.morphe.patcher.Fingerprint", "navigation fingerprint imports")
                    source = replace_once(source, '''        methodCall(
            opcode = Opcode.INVOKE_INTERFACE,
            smali = "Landroid/view/MenuItem;->setShowAsAction(I)V"
        )''', '''        // Afterglow can already own this native setter boundary.
        anyInstruction(
            methodCall(
                opcode = Opcode.INVOKE_INTERFACE,
                smali = "Landroid/view/MenuItem;->setShowAsAction(I)V"
            ),
            methodCall(
                opcode = Opcode.INVOKE_STATIC,
                smali = "$NAVIGATION_BAR_HOOKS->classicSearchItem(Landroid/view/MenuItem;I)V"
            )
        )''', "classic search setter fingerprint")
                    source = replace_once(source, "        SET_VISIBILITY_METHOD_CALL, // microphone button.",
                        '''        // Preserve the microphone position when Afterglow has replaced its setter.
        anyInstruction(
            SET_VISIBILITY_METHOD_CALL,
            methodCall(
                opcode = Opcode.INVOKE_STATIC,
                smali = "$NAVIGATION_BAR_HOOKS->voiceSearchVisibility(Landroid/view/View;I)V"
            )
        ), // microphone button.''', "microphone setter fingerprint")
                    changes.append("Match either native search/microphone setters or the existing Afterglow boundary hooks")
                elif source_relative == "app/morphe/patches/youtube/layout/buttons/navigation/NavigationBarPatch.kt":
                    source = replace_once(source, "import app.morphe.patcher.Fingerprint",
                        "import app.afterglow.patches.tweaks.navigation.NAVIGATION_BAR_HOOKS\n"
                        "import app.afterglow.patches.tweaks.navigation.navigationBarHooksPatch\n"
                        "import app.morphe.patcher.Fingerprint", "navigation integration imports")
                    source = replace_once(source, "import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction",
                        "import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction\n"
                        "import app.morphe.patcher.methodCall", "navigation method-call import")
                    anchor = "    dependsOn(\n        sharedExtensionPatch,\n        settingsPatch,\n        navigationBarHookPatch,"
                    source = replace_once(source, anchor,
                        "    dependsOn(\n"
                        "        // Afterglow's owner gate stays OFF unless its named Navigation bar patch is selected.\n"
                        "        // Order both integrations deterministically without installing a second owner marker.\n"
                        "        navigationBarHooksPatch,\n        sharedExtensionPatch,\n"
                        "        settingsPatch,\n        navigationBarHookPatch,", "navigation dependency order")
                    source = replace_once(source, "        OldSearchButtonVisibilityFingerprint.let {", '''        // Keep the original Morphe policy and route only its final native setters through
        // Afterglow. Either hide setting wins; with both OFF the native value passes once.
        listOf(
            Triple("hideOldSearchButton", "Landroid/view/MenuItem;->setShowAsAction(I)V",
                "$NAVIGATION_BAR_HOOKS->classicSearchItem(Landroid/view/MenuItem;I)V"),
            Triple("hideMicrophoneButton", "Landroid/view/View;->setVisibility(I)V",
                "$NAVIGATION_BAR_HOOKS->voiceSearchVisibility(Landroid/view/View;I)V")
        ).forEach { (name, originalSetter, composedSetter) ->
            Fingerprint(
                definingClass = EXTENSION_CLASS,
                name = name,
                returnType = "V",
                parameters = listOf(originalSetter.substringBefore("->"), "I"),
                filters = listOf(methodCall(smali = originalSetter))
            ).match().let { match ->
                val index = match.instructionMatches.single().index
                match.method.apply {
                    replaceInstruction(index,
                        "invoke-static { ${fiveRegisters(index)} }, $composedSetter")
                }
            }
        }

        OldSearchButtonVisibilityFingerprint.match().let {''', "classic search policy composition")
                    source = replace_once(source, "        SearchButtonsVisibilityFingerprint.let {",
                        "        SearchButtonsVisibilityFingerprint.match().let {", "microphone match capture")
                    changes.append("Order upstream navigation after gated Afterglow hooks and compose original helper setters with both policies")
                elif source_relative == "app/morphe/patches/youtube/layout/seekbar/SeekbarColorPatch.kt":
                    source = replace_once(source,
                        "import app.morphe.patches.youtube.layout.theme.splashAnimationPatch\n",
                        "", "seekbar splash import")
                    source = replace_once(source,
                        "        // Owns the hook that loads the splash screen animation.\n"
                        "        splashAnimationPatch,",
                        "        // Afterglow retains its native startup animation; seekbar colors do not require branding.",
                        "seekbar splash dependency")
                    changes.append("Keep seekbar color hooks independent of excluded branded startup animation")
                write(f"{kind}/src/main/kotlin/{source_relative}", source.encode(),
                      f"{kind}:{relative}", original, changes)

    with zipfile.ZipFile(bundle) as archive:
        for name in sorted(archive.namelist()):
            if retained_resource(name):
                write("resources/" + name, archive.read(name), "bundle:" + name)
    provenance = {
        "schema_version": 1,
        "distribution": "Afterglow adaptation of Morphe; not an official Morphe release",
        "inputs": INPUTS,
        "source_scope": "YouTube, shared, all-app helpers, resource utilities, patches library",
        "omitted": ["Music and Reddit sources/runtime/locales", "custom-branding and change-header logo assets",
                    "upstream compiled JVM patch classes and host classes.dex"],
        "selection": "All upstream patch objects are unnamed. Afterglow wrappers select the original objects.",
        "files": sorted(records, key=lambda row: row["path"]),
    }
    (DESTINATION / "provenance.json").write_text(json.dumps(provenance, indent=2) + "\n")
    (DESTINATION / "README.md").write_text(
        "# Morphe source imported by Afterglow\n\n"
        "This is an Afterglow adaptation, not an official Morphe release. The feature implementations "
        "retain their original packages, source notices and runtime assets. Only named patch export "
        "metadata and the documented settings-resource, native enum, Cast, navigation and seekbar integration "
        "adapters are changed during import. "
        "Afterglow catalog wrappers control selection; original option objects and dependency objects "
        "remain shared. Additional integration changes are recorded by the repository diff.\n\n"
        "`provenance.json` records the exact upstream versions, complete source archive URLs, input "
        "hashes and each imported file hash. `licenses/` preserves the original license and NOTICE "
        "texts. Imported sources build offline through `tools/local_build.sh`; upstream extension DEX "
        "assets are unchanged. No upstream compiled JVM patch classes or host DEX are imported.\n\n"
        "To reproduce the initial import, supply the three pinned inputs to `tools/import_morphe.py "
        "--patches-source ARCHIVE --library-source ARCHIVE --bundle MPP`. The command verifies their "
        "SHA-256 hashes before writing. It refuses to overwrite an existing import without `--replace`.\n"
    )
    counts = {kind: sum(row["path"].startswith(kind + "/") for row in records)
              for kind in ("patches", "library", "stubs", "resources", "licenses")}
    print(json.dumps({"destination": str(DESTINATION), "files": counts,
                      "modified_sources": sum(bool(row.get("modifications")) for row in records)}, indent=2))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--patches-source", required=True, type=Path)
    parser.add_argument("--library-source", required=True, type=Path)
    parser.add_argument("--bundle", required=True, type=Path)
    parser.add_argument("--replace", action="store_true")
    args = parser.parse_args()
    import_inputs(args.patches_source, args.library_source, args.bundle, args.replace)


if __name__ == "__main__":
    main()
