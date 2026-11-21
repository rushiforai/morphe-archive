#!/usr/bin/env python3
"""Stage Media3 local-only seek preview and per-source HTTP connection reuse on the exact v2.1.4 runtime.

Development only. Keep every existing patch class, native delta, resources,
settings and release asset intact except the explicitly audited bytecode.
"""
from __future__ import annotations
import argparse
import hashlib
from copy import copy
import os
import re
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
BASE = HERE.parent / "v2.1.5-dev.11"
ROOT = HERE.parents[2]
sys.path.insert(0, str(ROOT / "porting/revisions/v2.1.0-release"))
sys.path.insert(0, str(ROOT / ".github/scripts"))
from stage_verified import assemble, disassemble, run, require
from verify_android_mpp import validate_mpp

VERSION = "2.1.5-dev.17"
PREVIOUS = "2.1.4"
APPROVED_SHA256 = "58c9d990d36d9f05e58e29bcb4ad45da8a435a16c8f4a649d82d02a538995df4"
HELPERS = "nicoid/helpers.mpe"
EXTENSION = "extensions/extension.mpe"
MANIFEST = "META-INF/MANIFEST.MF"
OWNER = Path("e/e/a")
DIAGNOSTICS = OWNER / "Media3Diagnostics276.smali"
PLAYER = OWNER / "Media3VideoPlayer.smali"
PREVIEW_HOOK = "Media3Diagnostics276;->canPreviewLocalMedia(Ljava/lang/Object;)Z"
HTTP_SOURCE = OWNER / "VideoHttpSource.smali"
CREDENTIAL = OWNER / "VideoHttpSource$Credential.smali"
HTTP_TEMPLATE = "Le/e/a/VideoHttpSource;->CLIENT:Lokhttp3/OkHttpClient;"
SESSION_CLIENT = "Le/e/a/VideoHttpSource$Credential;->client:Lokhttp3/OkHttpClient;"
VERSION_OWNERS = {
    OWNER / "PatchVersion237.smali": ('"2.1.4"', '"2.1.5-dev.17"', 1),
    OWNER / "ModernShorts.smali": ('"v2.1.4 @chikuwadon"', '"v2.1.5-dev.17 @chikuwadon"', 2),
}


def android_tools():
    home = os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT")
    require(bool(home), "Android SDK is required")
    sdk = Path(home)
    def platform_key(path):
        found = re.fullmatch(r"android-(\d+)(?:-ext(\d+))?", path.parent.name)
        return (int(found.group(1)), int(found.group(2) or 0)) if found else (0, 0)
    jars = sorted((p for p in (sdk / "platforms").glob("android-*/android.jar")
                   if platform_key(p)[0]), key=platform_key)
    d8s = sorted((p for p in (sdk / "build-tools").glob("*/d8")),
                 key=lambda p: tuple(int(x) for x in re.findall(r"\d+", p.parent.name)))
    require(jars and d8s, "Android platform jar or d8 is missing")
    return jars[-1], d8s[-1]


def replace_literal(directory, entry, old, new, count):
    path = directory / entry
    data = path.read_text(encoding="utf-8")
    require(data.count(old) == count, "Unexpected version owner: " + str(entry))
    path.write_text(data.replace(old, new), encoding="utf-8")


def compile_diagnostic(temp, tools):
    android, d8 = android_tools()
    classes = temp / "java-classes"
    classes.mkdir()
    run("javac", "--release", "8", "-encoding", "UTF-8",
        "-cp", android, "-d", classes, BASE / "Media3Diagnostics276.java")
    generated = temp / "new-dex"
    generated.mkdir()
    run(d8, "--min-api", "28", "--lib", android, "--output", generated,
        *sorted(classes.rglob("*.class")))
    result = disassemble(generated / "classes.dex", temp / "new-smali", tools)
    expected = {
        OWNER / "Media3Diagnostics276.smali",
        OWNER / "Media3Diagnostics276$Probe.smali",
        OWNER / "Media3Diagnostics276$Attempt.smali",
    }
    # A tool-version-specific R8 annotation is not application code.
    annotation = Path("com/android/tools/r8/annotations/LambdaMethod.smali")
    require(set(result) in (expected, expected | {annotation}),
            "Unexpected diagnostic class set: " + str(set(result) ^ expected))
    return {p: data for p, data in result.items() if p in expected}


def compile_viewport_fix(temp, tools):
    android, d8 = android_tools()
    revisions = HERE.parent
    base = revisions / "v2.1.4-dev.1"
    comment = revisions / "v2.1.4-dev.3/java/e/e/a"
    owners = {"ScrollingComments267", "ScrollingTimeline267"}
    classes = temp / "comment-classes"
    classes.mkdir()
    sources = sorted((base / "stubs").rglob("*.java"))
    sources += [base / "java/e/e/a/CommentClock.java", comment / "CommentSource280.java"]
    sources += sorted((BASE / "comments").glob("*.java"))
    run("javac", "--release", "8", "-encoding", "UTF-8", "-cp", android,
        "-d", classes, *sources)
    run("java", "-cp", classes, "e.e.a.CommentViewportRegression")
    run("java", "-cp", classes, "e.e.a.CommentOverlapRegression")
    generated = temp / "comment-dex"
    generated.mkdir()
    run(d8, "--min-api", "28", "--lib", android, "--output", generated,
        *sorted(p for p in classes.rglob("*.class") if p.stem.split("$", 1)[0] in owners))
    result = disassemble(generated / "classes.dex", temp / "comment-smali", tools)
    scoped = {p: data for p, data in result.items()
              if p.parent == OWNER and p.stem.split("$", 1)[0] in owners}
    shared = Path("com/android/tools/r8/annotations/LambdaMethod.smali")
    require(set(result) - set(scoped) <= {shared}, "Unexpected comment helper")
    require({OWNER / (name + ".smali") for name in owners} <= set(scoped),
            "Missing viewport fix class")
    return scoped


def compile_frame_scheduler(temp, tools):
    android, d8 = android_tools()
    frame_classes = temp / "frame-classes"
    frame_classes.mkdir()
    run("javac", "--release", "8", "-encoding", "UTF-8",
        "-cp", android, "-d", frame_classes, BASE / "CommentFrames.java")
    test_classes = temp / "frame-tests"
    test_classes.mkdir()
    stub_files = sorted((BASE / "tests/stubs").rglob("*.java"))
    run("javac", "--release", "8", "-encoding", "UTF-8",
        "-d", test_classes, BASE / "CommentFrames.java",
        BASE / "tests/FrameScheduleRegression.java", *stub_files)
    run("java", "-cp", test_classes, "e.e.a.FrameScheduleRegression")
    frame_dex = temp / "frame-dex"
    frame_dex.mkdir()
    run(d8, "--min-api", "28", "--lib", android, "--output", frame_dex,
        *sorted(frame_classes.rglob("*.class")))
    compiled = disassemble(frame_dex / "classes.dex", temp / "frame-smali", tools)
    owner = OWNER / "CommentFrames.smali"
    annotation = Path("com/android/tools/r8/annotations/LambdaMethod.smali")
    require(set(compiled) in ({owner}, {owner, annotation}),
            "Unexpected FrameScheduler compiled classes: " + str(set(compiled)))
    return compiled[owner]


def compile_fps_summary(temp, tools):
    android, d8 = android_tools()
    classes = temp / "fps-summary-classes"
    classes.mkdir()
    run("javac", "--release", "8", "-encoding", "UTF-8",
        "-cp", android, "-d", classes, BASE / "CommentFpsSummary211.java")
    generated = temp / "fps-summary-dex"
    generated.mkdir()
    run(d8, "--min-api", "28", "--lib", android, "--output", generated,
        *sorted(classes.rglob("*.class")))
    result = disassemble(generated / "classes.dex", temp / "fps-summary-smali", tools)
    owner = OWNER / "CommentFpsSummary211.smali"
    annotation = Path("com/android/tools/r8/annotations/LambdaMethod.smali")
    require(set(result) in ({owner}, {owner, annotation}),
            "Unexpected FPS summary class set: " + str(set(result)))
    return result[owner]


def install_fps_summary(source):
    signature = ".method public static settings(Landroid/preference/PreferenceActivity;)V"
    require(source.count(signature) == 1, "Settings method is missing or ambiguous")
    start = source.index(signature)
    end = source.index(".end method", start)
    method = source[start:end]
    anchor = ("    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;"
              "->setSummary(Ljava/lang/CharSequence;)V")
    require(method.count(anchor) == 1, "Existing FPS summary call changed")
    hook = ("    invoke-static {v1, v2}, Le/e/a/CommentFpsSummary211;"
            "->set(Landroid/preference/ListPreference;Ljava/lang/CharSequence;)V")
    return source[:start] + method.replace(anchor, hook, 1) + source[end:]


def compile_bulk_bridge(temp, tools):
    android, d8 = android_tools()
    classes = temp / "bulk-classes"
    classes.mkdir()
    run("javac", "--release", "8", "-encoding", "UTF-8",
        "-cp", android, "-d", classes, HERE / "BulkVideoActions215.java", HERE / "LocalePatch215.java")
    compiled_dex = temp / "bulk-dex"
    compiled_dex.mkdir()
    run(d8, "--min-api", "28", "--lib", android, "--output", compiled_dex,
        *sorted(classes.rglob("*.class")))
    result = disassemble(compiled_dex / "classes.dex", temp / "bulk-smali", tools)
    scoped = {path: data for path, data in result.items()
              if path.parent == OWNER and (path.stem.startswith("BulkVideoActions215")
                                             or path.stem.startswith("LocalePatch215"))}
    annotation = Path("com/android/tools/r8/annotations/LambdaMethod.smali")
    require(set(result) - set(scoped) <= {annotation},
            "Unexpected batch-registration helper dependencies")
    require({OWNER / "BulkVideoActions215.smali", OWNER / "LocalePatch215.smali"} <= set(scoped),
            "Batch-registration or localized-label implementation is missing")
    return scoped


def insert_batch_hook(source, signature, code):
    require(source.count(signature) == 1, "Missing selection/menu hook: " + signature)
    start = source.index(signature)
    end = source.index(".end method", start)
    part = source[start:end]
    registers = re.search(r"(?m)^    \.(?:registers|locals) \d+$", part)
    require(registers is not None, "Cannot find method register declaration")
    require(code not in part, "Batch selection already hooked")
    part = part[:registers.end()] + "\n\n" + code + part[registers.end():]
    return source[:start] + part + source[end:]



def patch_playlist_delete_message(source):
    signature = ".method delete()V"
    require(source.count(signature) == 1, "Local playlist delete method missing")
    start = source.index(signature)
    end = source.index(".end method", start)
    part = source[start:end]
    original = "    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;"
    fixed = ("    invoke-static {p0, v1}, Le/e/a/BulkVideoActions215;"
             "->playlistDeleteMessage(Ljava/lang/Object;I)Ljava/lang/String;")
    require(part.count(original) == 1, "Local playlist deletion count contract changed")
    return source[:start] + part.replace(original, fixed, 1) + source[end:]



def patch_cache_tab_badge(smali):
    """Add a cache badge to the existing bottom tab strip, not the sort bar.

    Keep the original tab renderer, icon sizing, search/ranking badges,
    drag/reorder and accessibility behavior intact.
    """
    tab = OWNER / "MultiTabs227.smali"
    icon = OWNER / "MultiTabs227$TabBadge.smali"

    tab_source = (smali / tab).read_text(encoding="utf-8")
    badge_signature = ".method static badge(Le/e/a/SavedTabs227$Tab;)I\n    .registers 4"
    badge_hook = r'''
    const-string v0, "cache"
    iget-object v1, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :nicoid_not_cache_tab
    const/4 v0, 0x5
    return v0
    :nicoid_not_cache_tab
'''
    require(tab_source.count(badge_signature) == 1,
            "Native tab badge classification contract changed")
    tab_source = tab_source.replace(badge_signature,
                                    badge_signature + "\n" + badge_hook, 1)
    (smali / tab).write_text(tab_source, encoding="utf-8")

    icon_source = (smali / icon).read_text(encoding="utf-8")
    # The stable release's method labels differ across Smali revisions.
    # Intercept just the cache kind on method entry, keeping all native
    # search/ranking/creator/list badge drawing paths intact.
    icon_source = insert_batch_hook(
        icon_source, ".method public draw(Landroid/graphics/Canvas;)V",
        r'''    iget v0, p0, Le/e/a/MultiTabs227$TabBadge;->kind:I
    const/4 v1, 0x5
    if-ne v0, v1, :nicoid_native_tab_icon
    iget-object v0, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;
    move-result-object v1
    invoke-static {p1, v0, v1}, Le/e/a/BulkVideoActions215;->drawCacheTabBadge(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Rect;)V
    return-void
    :nicoid_native_tab_icon''')
    (smali / icon).write_text(icon_source, encoding="utf-8")



def add_bulk_ui_hooks(smali):
    native_menu = OWNER / "BulkSelection.smali"
    local_menu = OWNER / "LocalPlaylists.smali"
    page = OWNER / "LocalPlaylists$Page.smali"
    native = (smali / native_menu).read_text(encoding="utf-8")
    local = (smali / local_menu).read_text(encoding="utf-8")
    native = insert_batch_hook(
        native, ".method public static menu(Landroid/app/Activity;Landroid/view/Menu;)V",
        "    invoke-static {p0, p1}, Le/e/a/BulkVideoActions215;->menu(Landroid/app/Activity;Landroid/view/Menu;)V")
    for signature in (
        ".method public static modeChanged(Ljava/lang/Object;)V",
        ".method static refresh(Ljava/lang/Object;)V",
    ):
        native = insert_batch_hook(
            native, signature,
            "    invoke-static {p0}, Le/e/a/BulkVideoActions215;->onSelectionChanged(Ljava/lang/Object;)V")
    local = insert_batch_hook(
        local, ".method public static menuOrFeed(Landroid/app/Activity;Landroid/view/Menu;)Z",
        "    invoke-static {p0, p1}, Le/e/a/BulkVideoActions215;->localMenu(Landroid/app/Activity;Landroid/view/Menu;)V")
    (smali / native_menu).write_text(native, encoding="utf-8")
    (smali / local_menu).write_text(local, encoding="utf-8")
    (smali / page).write_text(
        patch_playlist_delete_message((smali / page).read_text(encoding="utf-8")),
        encoding="utf-8")
    patch_cache_tab_badge(smali)




def fix_stale_playlist_menu(smali):
    """Use the currently displayed page, not the stale PAGES map.

    Switching away from the playlist retains its Page object so that position,
    selection, and folders can be restored. That object must never become a
    signal that a different tab (e.g. NicoRepo) owns the overflow menu.
    """
    menu = OWNER / "LocalPlaylists.smali"
    source = (smali / menu).read_text(encoding="utf-8")
    source = insert_batch_hook(
        source, ".method public static options(Landroid/app/Activity;Landroid/view/Menu;)Z",
        """    invoke-static {p0}, Le/e/a/LocalePatch215;->isActivePlaylist(Landroid/app/Activity;)Z
    move-result v0
    if-nez v0, :nicoid_active_playlist_menu
    const/4 v0, 0x0
    return v0
    :nicoid_active_playlist_menu""")
    (smali / menu).write_text(source, encoding="utf-8")


def patch_locale_routes(smali):
    """Repair missing shared translations while preserving UiStrings' app-language logic."""
    ui = OWNER / "UiStrings.smali"
    chrome = OWNER / "TabChrome228.smali"
    shared_menu = OWNER / "TabRecovery244.smali"
    ui_source = (smali / ui).read_text(encoding="utf-8")
    ui_source = insert_batch_hook(
        ui_source, ".method private static lookup(Ljava/lang/String;)[Ljava/lang/String;",
        """    invoke-static {p0}, Le/e/a/LocalePatch215;->lookup(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :nicoid_existing_i18n
    return-object v0
    :nicoid_existing_i18n""")
    (smali / ui).write_text(ui_source, encoding="utf-8")

    chrome_source = (smali / chrome).read_text(encoding="utf-8")
    chrome_source = insert_batch_hook(
        chrome_source, ".method static bar(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/CharSequence;)V",
        r'''    const-string v0, "\u66f4\u65b0"
    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {p2, v0}, Le/e/a/LocalePatch215;->title(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;
    move-result-object p2''')
    (smali / chrome).write_text(chrome_source, encoding="utf-8")

    shared = (smali / shared_menu).read_text(encoding="utf-8")
    shared = insert_batch_hook(
        shared, ".method public static menu(Landroid/app/Activity;Landroid/view/Menu;)V",
        """    invoke-static {p1}, Le/e/a/LocalePatch215;->shouldSkipTabRefresh(Landroid/view/Menu;)Z
    move-result v0
    if-eqz v0, :nicoid_other_tab_refresh
    return-void
    :nicoid_other_tab_refresh""")
    (smali / shared_menu).write_text(shared, encoding="utf-8")


def limit_seek_preview(source):
    # The UI delegate retains the normal seek on release, including when preview is disabled.
    pattern = r"(?m)^\.method (?:[a-z]+ )*startScrubbing\(\)Z\n[\s\S]*?^\.end method$"
    matches = list(re.finditer(pattern, source))
    require(len(matches) == 1, "Unexpected startScrubbing method count")
    preview = matches[0].group()
    guards = list(re.finditer(
        r"(    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z\n\n"
        r"    if-nez v0, (:\w+)\n)", preview))
    require(len(guards) == 1 and PREVIEW_HOOK not in preview
            and preview.count("ExoPlayer;->setScrubbingModeEnabled(Z)V") == 1,
            "Unexpected scrub entry point")
    match = guards[0]
    branch = match.group(2)
    require(re.search(r"(?m)^    " + re.escape(branch) +
                      r"\n    const/4 (\w+), 0x0\n\n    return \1$", preview),
            "Scrub guard must return false without side effects")
    hook = (f"\n    invoke-static {{p0}}, Le/e/a/{PREVIEW_HOOK}\n"
            f"\n    move-result v0\n\n    if-eqz v0, {branch}\n")
    preview = preview[:match.end()] + hook + preview[match.end():]
    return source[:matches[0].start()] + preview + source[matches[0].end():]


def replace_once(source, old, new):
    require(source.count(old) == 1, "Unexpected HTTP source anchor: " + old)
    return source.replace(old, new, 1)


def isolate_http_client(source, credential):
    # Every setVideoUri creates a Credential. Playlist and segment requests
    # share that media source's pool, with a short idle lifetime after switching.
    global_load = "    sget-object v1, " + HTTP_TEMPLATE
    source = replace_once(
        source, global_load,
        "    iget-object v1, p0, Le/e/a/VideoHttpSource;->credential:Le/e/a/VideoHttpSource$Credential;\n"
        "    iget-object v1, v1, " + SESSION_CLIENT)
    require("->newSessionClient(" not in source, "Duplicate HTTP client factory")
    source += """
.method static newSessionClient()Lokhttp3/OkHttpClient;
    .registers 5

    new-instance v1, Lokhttp3/ConnectionPool;
    const/4 v2, 0x4
    const-wide/16 v3, 0x1e
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;
    invoke-direct {v1, v2, v3, v4, v0}, Lokhttp3/ConnectionPool;-><init>(IJLjava/util/concurrent/TimeUnit;)V

    sget-object v0, Le/e/a/VideoHttpSource;->CLIENT:Lokhttp3/OkHttpClient;
    invoke-virtual {v0}, Lokhttp3/OkHttpClient;->newBuilder()Lokhttp3/OkHttpClient$Builder;
    move-result-object v0
    invoke-virtual {v0, v1}, Lokhttp3/OkHttpClient$Builder;->connectionPool(Lokhttp3/ConnectionPool;)Lokhttp3/OkHttpClient$Builder;
    invoke-virtual {v0}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;
    move-result-object v0
    return-object v0
.end method
"""
    cookie = ".field final cookie:Ljava/lang/String;"
    credential = replace_once(credential, cookie, cookie + "\n\n.field final client:Lokhttp3/OkHttpClient;")
    assign_cookie = "    iput-object p1, p0, Le/e/a/VideoHttpSource$Credential;->cookie:Ljava/lang/String;"
    credential = replace_once(
        credential, assign_cookie,
        assign_cookie + "\n\n"
        "    invoke-static {}, Le/e/a/VideoHttpSource;->newSessionClient()Lokhttp3/OkHttpClient;\n"
        "    move-result-object p1\n"
        "    iput-object p1, p0, " + SESSION_CLIENT)
    return source, credential


def stage(compiled, approved, output, tools):
    require(compiled.resolve() != output.resolve(), "Do not overwrite Gradle input")
    validate_mpp(compiled, VERSION)
    require(hashlib.sha256(approved.read_bytes()).hexdigest() == APPROVED_SHA256,
            "Official v2.1.4 MPP SHA-256 mismatch")
    validate_mpp(approved, PREVIOUS)
    with TemporaryDirectory(prefix="nicoid-seek-freeze-") as temp_name, ZipFile(approved) as base:
        temp = Path(temp_name)
        original = temp / "stable.dex"
        original.write_bytes(base.read(HELPERS))
        stable = disassemble(original, temp / "stable-smali", tools)
        require(len(stable) >= 7400 and DIAGNOSTICS in stable,
                "Stable Media3 baseline is missing or incomplete")
        smali = temp / "stable-smali"
        for entry, (old, new, count) in VERSION_OWNERS.items():
            replace_literal(smali, entry, old, new, count)
        injected = compile_diagnostic(temp, tools)
        added = set(injected) - set(stable)
        require(added == {
            OWNER / "Media3Diagnostics276$Probe.smali",
            OWNER / "Media3Diagnostics276$Attempt.smali",
        }, "Unexpected or missing recovery helper")
        for path, contents in injected.items():
            (smali / path).write_bytes(contents)
        comment_fix = compile_viewport_fix(temp, tools)
        require(set(comment_fix) <= set(stable), "Comment viewport fix must replace existing classes")
        for path, contents in comment_fix.items():
            (smali / path).write_bytes(contents)
        frame_owner = OWNER / "CommentFrames.smali"
        require(frame_owner in stable, "Official v2.1.4 scheduler is missing")
        (smali / frame_owner).write_bytes(compile_frame_scheduler(temp, tools))
        fps_summary = OWNER / "CommentFpsSummary211.smali"
        require(fps_summary not in stable, "FPS summary helper already exists")
        (smali / fps_summary).write_bytes(compile_fps_summary(temp, tools))
        added.add(fps_summary)
        batch_classes = compile_bulk_bridge(temp, tools)
        require(set(batch_classes).isdisjoint(stable),
                "Bulk helper unexpectedly replaces stable app code")
        for path, contents in batch_classes.items():
            (smali / path).write_bytes(contents)
        added.update(batch_classes)
        add_bulk_ui_hooks(smali)
        fix_stale_playlist_menu(smali)
        patch_locale_routes(smali)
        review_owner = OWNER / "Review181.smali"
        review = smali / review_owner
        review.write_text(install_fps_summary(review.read_text(encoding="utf-8")), encoding="utf-8")
        # Preserve the existing setting key, value and default.
        descriptions = {
            "Scrolling comments wait briefly for space. Overlap is allowed in crowded scenes. Fixed comments can also overlap.":
                "Scrolling comments avoid overlapping. When crowded, some will be omitted after a short wait. Fetched comments remain in the list. Fixed comments may overlap.",
            "跑馬燈留言會短暫等待空位，擁擠時允許重疊。固定留言也可能重疊":
                "跑馬燈留言會避免互相重疊；擁擠時短暫等待後，部分留言可能不顯示。已取得的留言仍可在清單查看，固定留言可能重疊",
            "流れるコメントは空きを短時間待ち、混雑時は重なりを許容します。固定コメントも重なることがあります":
                "流れるコメント同士の重なりを抑えます。混雑時は短時間待機し、空きがなければ一部を表示しません。取得したコメントは一覧で確認できます",
        }
        summary = OWNER / "PlaybackDisplayOptions.smali"
        for old, new in descriptions.items():
            old_literal = '"' + old.encode("unicode_escape").decode("ascii") + '"'
            new_literal = '"' + new.encode("unicode_escape").decode("ascii") + '"'
            replace_literal(smali, summary, old_literal, new_literal, 1)
        player_file = smali / PLAYER
        player = limit_seek_preview(player_file.read_text(encoding="utf-8"))
        player_file.write_text(player, encoding="utf-8")
        require(player.count("VideoHttpSource$Credential;-><init>(Ljava/lang/String;)V") == 1,
                "Missing per-source HTTP credential")
        http_file, credential_file = smali / HTTP_SOURCE, smali / CREDENTIAL
        http, credential = isolate_http_client(http_file.read_text(encoding="utf-8"),
                                               credential_file.read_text(encoding="utf-8"))
        http_file.write_text(http, encoding="utf-8")
        credential_file.write_text(credential, encoding="utf-8")
        for hook in ("onEvents", "onPlayIntentChange", "onStart",
                     "onPause", "onHandoffPause", "onError"):
            require("Media3Diagnostics276;->" + hook in player,
                    "Required Media3 hook missing: " + hook)
        revised = temp / "revised.dex"
        assemble(smali, revised, tools)
        checked = disassemble(revised, temp / "checked", tools)
        require(checked.keys() == stable.keys() | added,
                "Unexpected helper classes or missing stable classes")
        changed = {p for p in stable if checked[p] != stable[p]}
        required = set(VERSION_OWNERS) | {DIAGNOSTICS, PLAYER, HTTP_SOURCE, CREDENTIAL,
                                        OWNER / "ScrollingComments267.smali",
                                        OWNER / "ScrollingTimeline267.smali",
                                        OWNER / "ScrollingTimeline267$Entry.smali",
                                        OWNER / "PlaybackDisplayOptions.smali",
                                         OWNER / "CommentFrames.smali", review_owner,
                                         OWNER / "BulkSelection.smali",
                                         OWNER / "LocalPlaylists.smali",
                                         OWNER / "LocalPlaylists$Page.smali",
                                         OWNER / "MultiTabs227.smali",
                                         OWNER / "MultiTabs227$TabBadge.smali",
                                         OWNER / "UiStrings.smali",
                                         OWNER / "TabChrome228.smali",
                                         OWNER / "TabRecovery244.smali"}
        require(required <= changed <= required | set(comment_fix),
                "Unintended helper code change: " + str(changed))
        bulk_source = checked[OWNER / "BulkSelection.smali"].decode()
        require("BulkVideoActions215;->menu" in bulk_source
                and "BulkVideoActions215;->onSelectionChanged" in bulk_source,
                "Native selection hooks are not installed")
        require("BulkVideoActions215;->playlistDeleteMessage" in
                checked[OWNER / "LocalPlaylists$Page.smali"].decode(),
                "Playlist confirmation text is not installed")
        require('"cache"' in checked[OWNER / "MultiTabs227.smali"].decode(),
                "Cache tab badge classifier missing")
        require("drawCacheTabBadge" in checked[OWNER / "MultiTabs227$TabBadge.smali"].decode(),
                "Cache tab icon renderer missing")
        bridge = checked[OWNER / "BulkVideoActions215.smali"].decode()
        require("deflist" in bridge and "isselect" in bridge
                and "nicoid_multi_select_sort" in bridge,
                "Batch registration bridge is missing registration or UI behavior")
        require("LocalePatch215;->isActivePlaylist" in
                checked[OWNER / "LocalPlaylists.smali"].decode(),
                "Inactive playlist must not override NicoRepo overflow menu")
        require("LocalePatch215;->lookup" in checked[OWNER / "UiStrings.smali"].decode()
                and "LocalePatch215;->title" in checked[OWNER / "TabChrome228.smali"].decode()
                and "LocalePatch215;->shouldSkipTabRefresh" in
                checked[OWNER / "TabRecovery244.smali"].decode(),
                "Localization and NicoRepo menu hooks are missing")
        require("Playback queue" in checked[OWNER / "LocalePatch215.smali"].decode()
                and "Deselect all" in checked[OWNER / "LocalePatch215.smali"].decode(),
                "Required missing translations were not staged")
        timeline_text = checked[OWNER / "ScrollingTimeline267.smali"].decode()
        require("skippedByOverlap" in timeline_text and
                "waitOrigin" in checked[OWNER / "ScrollingTimeline267$Entry.smali"].decode(),
                "Strict collision-only admission is missing")
        frame_source = checked[OWNER / "CommentFrames.smali"].decode()
        require("Choreographer;->postFrameCallback" in frame_source
                and "Choreographer;->removeFrameCallback" in frame_source
                and "Handler;->postAtTime" not in frame_source,
                "VSYNC scheduling was not installed")
        renderer = checked[OWNER / "ScrollingComments267.smali"].decode()
        require("Canvas;->drawText" in renderer
                and "Canvas;->drawBitmap" not in renderer and "rasterMode=" not in renderer,
                "Expected direct comment text rendering")
        require("CommentFpsSummary211;->set" in checked[review_owner].decode()
                and b'"%s"' in checked[fps_summary],
                "FPS summary prefix is missing")
        require("drawWholeAvgMs" in frame_source, "Whole draw timing is missing")
        require(checked[PLAYER].count(PREVIEW_HOOK.encode()) == 1,
                "Local seek preview guard missing or duplicated")
        require(checked[HTTP_SOURCE].count(SESSION_CLIENT.encode()) == 1
                and checked[CREDENTIAL].count(SESSION_CLIENT.encode()) == 1,
                "HTTP client is not bound to the current media source")
        diagnostic_text = checked[DIAGNOSTICS].decode()
        for signal in ("getPlaybackState", "getPlaybackSuppressionReason",
                       "getCurrentMediaItem"):
            require(signal in diagnostic_text, "Missing recovery runtime guard: " + signal)
        probe_text = checked[OWNER / "Media3Diagnostics276$Probe.smali"].decode()
        for signal in ('"stop"', '"prepare"'):
            require(signal in probe_text, "Recovery method missing: " + signal)
        extension = temp / "extension.dex"
        extension.write_bytes(base.read(EXTENSION))
        original_extension = disassemble(extension, temp / "extension-original", tools)
        banner = OWNER / "ModernShorts.smali"
        # Use the SHA-locked public v2.1.4 runtime, never the older
        # Gradle-generated extension jar: only the official release is
        # known to include the reviewed v2.1.4 Shorts and playback behavior.
        replace_literal(temp / "extension-original", banner,
                        '"v2.1.4 @chikuwadon"',
                        '"v2.1.5-dev.17 @chikuwadon"', 2)
        revised_ext = temp / "extension.dex.revised"
        assemble(temp / "extension-original", revised_ext, tools)
        ext_checked = disassemble(revised_ext, temp / "extension-checked", tools)
        require(ext_checked.keys() == original_extension.keys(),
                "Extension class set changed")
        # Version-only banner is the only extension modification.
        ext_before = disassemble(extension, temp / "extension-before", tools)
        require({p for p in ext_before if ext_before[p] != ext_checked[p]} == {banner},
                "Unexpected extension behavior change")
        manifest = base.read(MANIFEST)
        previous = ("Version: " + PREVIOUS + "\r\n").encode()
        require(manifest.count(previous) == 1, "Approved MPP manifest mismatch")
        new_manifest = manifest.replace(
            previous, ("Version: " + VERSION + "\r\n").encode())
        replacements = {HELPERS: revised.read_bytes(), EXTENSION: revised_ext.read_bytes(),
                        MANIFEST: new_manifest}
        output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(output, "w") as final:
            for entry in base.infolist():
                final.writestr(copy(entry), replacements.get(entry.filename, base.read(entry.filename)))
        with ZipFile(output) as final:
            require(final.namelist() == base.namelist() and final.testzip() is None,
                    "Output MPP layout or integrity failure")
            for entry in base.namelist():
                if entry not in replacements:
                    require(final.read(entry) == base.read(entry),
                            "Unintended MPP entry change: " + entry)
        print("PASS: retained Media3/overlap behavior and installed VSYNC comment pacing")
        print("PASS: preserved all approved v2.1.4 native hooks, resource bytes and playback helpers")
    validate_mpp(output, VERSION)
    print("PASS: valid Android MPP " + str(output))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("compiled", "approved", "output", "tools"):
        parser.add_argument("--" + name, required=True, type=Path)
    args = parser.parse_args()
    stage(args.compiled, args.approved, args.output, args.tools)


if __name__ == "__main__":
    main()
