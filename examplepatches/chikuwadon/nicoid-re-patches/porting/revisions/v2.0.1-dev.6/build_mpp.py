"""Build the private live development MPP on the exact v1.11.1 release."""
import argparse
import hashlib
import io
import json
import os
from pathlib import Path
import re
import subprocess
from tempfile import TemporaryDirectory
from zipfile import ZIP_DEFLATED, ZipFile

import sys
BASE_ROOT = Path(__file__).resolve().parent.parent / "v2.0.0-dev.1"
sys.path.insert(0, str(BASE_ROOT))
from patch_manifest import patch_manifest
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "v2.0.1-dev.3"))
from patch_203 import OVERRIDES, stage
PREVIOUS_ROOT = Path(__file__).resolve().parent.parent / "v2.0.1-dev.1"

ROOT = Path(__file__).resolve().parent
BASE_HASH = "8920e9cdc9fc49178be5bc78cdb990627f4e7a7be83fef782eece3e7c443bcce"
VERSION = "2.0.1-dev.6"


def run(*args):
    subprocess.run([str(arg) for arg in args], check=True)


def add_hook(source, signature, instruction):
    pattern = rf"(^{re.escape(signature)}\n\s*\.registers \d+\n)"
    updated, count = re.subn(pattern, lambda match: match[1] + "\n    " + instruction + "\n",
                             source, flags=re.MULTILINE)
    if count != 1:
        raise ValueError(f"Expected one method: {signature}")
    return updated


def build(args, work):
    tools = args.tools.resolve()
    android = tools / "android-all-16-robolectric-13921718.jar"
    smali = os.pathsep.join(str(tools / name) for name in ("assemble/*", "dexlib2.jar", "guava.jar"))
    smali_compile = os.pathsep.join(map(str, [*sorted((tools / "assemble").glob("*.jar")), tools / "dexlib2.jar", tools / "guava.jar"]))
    deps = json.loads((BASE_ROOT / "media-dependencies.lock.json").read_text())
    libs = [args.media / f"{dep['artifact']}-{dep['version']}.jar" for dep in deps]
    if not all(lib.is_file() for lib in libs):
        raise ValueError("Prepare the pinned Media3 graph with bootstrap_live.py")
    original = work / "base.dex"
    with ZipFile(args.base) as base:
        original.write_bytes(base.read("nicoid/helpers.mpe"))
        expected_input = dict(line.split()[::-1] for line in base.read("nicoid/input-hashes.txt").decode().splitlines())
    native_dex = work / "original.dex"
    sources = [(original, work / "helpers.jar")]
    network = work / "original.jar"
    if args.apk is not None:
        with ZipFile(args.apk) as apk:
            native = apk.read("classes.dex")
        if hashlib.sha256(native).hexdigest() != expected_input["classes.dex"]:
            raise ValueError("Use the original supported nicoid 6.49 APK")
        native_dex.write_bytes(native)
        sources.append((native_dex, network))
    elif not args.ci_without_apk or os.environ.get("GITHUB_ACTIONS") != "true" or not (
         os.environ.get("GITHUB_REF") == "refs/heads/dev" or (
         args.official_release and os.environ.get("GITHUB_REF") == "refs/heads/main"
         and os.environ.get("NICOID_OFFICIAL_RELEASE_APPROVED") in ("APPROVE","VERIFY"))):
        raise ValueError("The original nicoid 6.49 APK is required outside the guarded CI build")
    for source, target in sources:
        run("java", "-cp", str(args.media / "*"), "com.googlecode.dex2jar.tools.Dex2jarCmd",
            "-o", target, source)
    helpers = work / "helpers.jar"
    compile_only = [network] if args.apk is not None else args.compile_jar
    if not all(jar.is_file() for jar in compile_only):
        raise ValueError("Missing compiler classpath JAR")
    # Stage only changed Java sources; keep the released source snapshot intact.
    overrides = work / "source-overrides/e/e/a"
    stage(BASE_ROOT / "java/e/e/a", overrides)
    excluded = (OVERRIDES | {p.name for p in (ROOT / "java").rglob("*.java")}
                | {p.name for p in (ROOT.parent / "v2.0.1-dev.2/java").rglob("*.java")})
    classpath = os.pathsep.join(map(str, [android, helpers, *compile_only, *libs]))
    classes = work / "classes"
    run("java", "-jar", tools / "ecj.jar", "-8", "-proc:none", "-nowarn", "-cp", classpath,
        "-d", classes, *sorted(p for p in (BASE_ROOT / "java").rglob("*.java") if p.name not in excluded),
        *sorted((PREVIOUS_ROOT / "java").rglob("*.java")),
        *sorted((ROOT.parent / "v2.0.1-dev.2/java").rglob("*.java")),
        *sorted(p for p in (ROOT.parent / "v2.0.1-dev.4/java").rglob("*.java")
                if p.name != "SmoothTabRestore204.java"),
        *sorted((ROOT.parent / "v2.0.1-dev.5/java").rglob("*.java")),
        *sorted((ROOT / "java").rglob("*.java")),
        *sorted(overrides.rglob("*.java")),
        ROOT.parent / "v1.11.1/java/e/e/a/AmbientLight.java")
    live_jar = work / "live.jar"
    with ZipFile(live_jar, "w", ZIP_DEFLATED) as archive:
        for class_file in sorted(classes.rglob("*.class")):
            archive.write(class_file, class_file.relative_to(classes))
    dex = work / "live-dex"
    dex.mkdir()
    java_home = Path(os.path.realpath(subprocess.check_output(["which", "java"], text=True).strip())).parents[1]
    dex_cmd = ["java", "-cp", tools / "r8.jar", "com.android.tools.r8.D8", "--release", "--min-api", 28,
               "--lib", android, "--lib", java_home, "--classpath", helpers]
    for jar in compile_only:
        dex_cmd.extend(("--classpath", jar))
    run(*dex_cmd, "--output", dex, live_jar, *libs)
    live_dex = dex / "classes.dex"
    if list(dex.glob("*.dex")) != [live_dex]:
        raise ValueError("Expected a single live DEX")

    with ZipFile(args.base) as base:
        disassembled = work / "stable"
        run("java", "-cp", smali, "org.jf.baksmali.Main", "disassemble", original, "-o", disassembled)
        hooks = work / "hooks/e/e/a"
        hooks.mkdir(parents=True)
        replacements = {
            "ModernShorts$2": (".method public onActivityResumed(Landroid/app/Activity;)V",
                               "invoke-static/range {p1 .. p1}, Le/e/a/NicoliveEntry;->refreshMenu(Landroid/app/Activity;)V"),
            "Playback214": (".method public static begin(Ljava/lang/Object;Ljava/lang/String;)V",
                            "invoke-static {}, Le/e/a/NicoliveEntry;->beforeVideo()V"),
        }
        for name, (signature, instruction) in replacements.items():
            file = name + ".smali"
            source = (disassembled / "e/e/a" / file).read_text()
            (hooks / file).write_text(add_hook(source, signature, instruction))
        for name in ("PatchVersion237", "ModernShorts"):
            file = name + ".smali"
            source = (disassembled / "e/e/a" / file).read_text()
            updated, count = re.subn(r'(?<=["v])1\.11\.1(?=[" ])', VERSION, source)
            if not count:
                raise ValueError(f"Missing stable version in {name}")
            if name == "ModernShorts":
                updated = add_hook(updated, ".method public static finishMenu(Landroid/content/Context;Ljava/util/ArrayList;)V",
                                   "invoke-static/range {p0 .. p1}, Le/e/a/NicoliveEntry;->addMenu(Landroid/content/Context;Ljava/util/ArrayList;)V")
            (hooks / file).write_text(updated)
        settings = (disassembled / "e/e/a/SettingsTools.smali").read_text()
        anchor = "    invoke-static {p0, v1}, Le/e/a/HistoryLimit120;->settings(Landroid/app/Activity;Landroid/preference/PreferenceGroup;)V"
        if settings.count(anchor) != 1:
            raise ValueError("Missing settings insertion point")
        (hooks / "SettingsTools.smali").write_text(settings.replace(
            anchor, anchor + "\n\n    invoke-static {p0, v1}, Le/e/a/NicoliveEntry;->settings(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V"))
        # Include live playback diagnostics in the existing Debug > Share output.
        # Preserve the stable debug UI and save location.
        debug_file = "ModernDebug.smali"
        debug = (disassembled / "e/e/a" / debug_file).read_text()
        debug_anchor = ("    invoke-static {p0, v1}, Le/e/a/CrashDiagnostics;->append"
                        "(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;\n"
                        "\n    move-result-object v1")
        if debug.count(debug_anchor) != 1:
            raise ValueError("Missing ModernDebug.share crash-log append hook")
        debug = debug.replace(debug_anchor, debug_anchor +
            "\n\n    invoke-static {p0, v1}, Le/e/a/NicoliveDiagnostics;->append"
            "(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;"
            "\n\n    move-result-object v1")
        (hooks / debug_file).write_text(debug)

        # Preserve the native Back hook while replacing the old checkbox with a mode chooser.
        dev112_file = "Dev112.smali"
        dev112 = (disassembled / "e/e/a" / dev112_file).read_text()
        for signature, instruction, finish in (
            (".method public static exitSettings(Landroid/preference/PreferenceActivity;)V",
             "invoke-static {p0}, Le/e/a/ExitModeOptions;->install(Landroid/preference/PreferenceActivity;)V",
             "return-void"),
            (".method public static back(Landroid/app/Activity;)Z",
             "invoke-static {p0}, Le/e/a/ExitModeOptions;->normalBack(Landroid/app/Activity;)Z\n"
             "    move-result v0", "return v0"),
        ):
            replacement = signature + "\n    .registers 2\n\n    " + instruction + "\n    " + finish + "\n.end method"
            dev112, count = re.subn(re.escape(signature) + r".*?\.end method",
                                     lambda match: replacement, dev112, flags=re.DOTALL)
            if count != 1:
                raise ValueError("Missing exit method: " + signature)

        # Keep all of Dev112's native back/settings fixes while routing only
        # list restoration through the common, idempotent renderer.
        restore_pattern = (r"(?ms)^\.method[^\n]* restoreList"
                           r"\(Landroid/widget/ListView;II\)V\r?\n.*?^\.end method")
        restore_stub = (".method public static restoreList(Landroid/widget/ListView;II)V\n"
                        "    .registers 3\n"
                        "    invoke-static {p0, p1, p2}, Le/e/a/SmoothTabRestore204;->restoreList(Landroid/widget/ListView;II)V\n"
                        "    return-void\n.end method")
        dev112, count = re.subn(restore_pattern, lambda _: restore_stub, dev112)
        if count != 1:
            raise ValueError("Unexpected Dev112.restoreList method count")

        (hooks / dev112_file).write_text(dev112)

        # Clip thumbnail surfaces and native progress overlays together without touching image caches.
        details_source = (disassembled / "e/e/a/VideoDetails.smali").read_text()
        details_source = add_hook(
            details_source, ".method public static bind(Ljava/lang/Object;Landroid/view/View;)V",
            "invoke-static {p1}, Le/e/a/ThumbnailCorners;->applyDetails(Landroid/view/View;)V")
        (hooks / "VideoDetails.smali").write_text(details_source)

        # The playback mini bar may start with a Bitmap before an URL is loaded.
        mini_path = disassembled / "e/e/a/MiniChrome236.smali"
        mini_source = mini_path.read_text()
        mini_anchor = "invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V"
        if mini_source.count(mini_anchor) != 1:
            raise ValueError("Missing playback mini-thumbnail")
        mini_source = mini_source.replace(mini_anchor, mini_anchor +
            "\n\n    invoke-static {p2}, Le/e/a/ThumbnailCorners;->apply(Landroid/view/View;)V")
        (hooks / "MiniChrome236.smali").write_text(mini_source)

        # Clip only known thumbnail views; keep bitmap caches and sibling badges untouched.
        outline = "Le/e/a/ThumbnailCorners;->apply(Landroid/view/View;)V"
        outline_with_parent = "Le/e/a/ThumbnailCorners;->applyWithParent(Landroid/view/View;)V"
        native_outline = "Le/e/a/ThumbnailCorners;->applyNative(Landroid/view/View;)V"
        for name, signature in (
            ("VideoMarks119", ".method public static bind(Landroid/view/View;Ljava/lang/Object;)V"),
            ("PaidVideos", ".method public static bind(Landroid/view/View;Ljava/lang/Object;)V"),
            ("Dev116", ".method public static playlistThumbnail(Landroid/view/View;Landroid/widget/BaseAdapter;Lorg/json/JSONObject;)V"),
        ):
            file = name + ".smali"
            source = (disassembled / "e/e/a" / file).read_text()
            (hooks / file).write_text(add_hook(source, signature, f"invoke-static {{p0}}, {native_outline}"))
        image_loader = "Le/e/a/ShortImages;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/widget/TextView;)V"
        for name, prefix in (
            ("ModernShorts", r"invoke-static \{p0, p1, p2\}, "),
            ("VideoDetails", r"invoke-static \{v0, v4, v5\}, "),
            ("MiniChrome236", r"invoke-static \{p1, v0, v1\}, "),
        ):
            file = name + ".smali"
            path = hooks / file
            source = (path if path.exists() else disassembled / "e/e/a" / file).read_text()
            updated, count = re.subn(r"(" + prefix + r")" + re.escape(image_loader),
                                     lambda match: match[1] + image_loader.replace("ShortImages", "ThumbnailCorners"),
                                     source)
            if count != 1:
                raise ValueError(f"Missing thumbnail binding in {name}")
            path.write_text(updated)
        for name, anchor, register in (
            ("FollowFeed$Rows", "    iget-object v4, v2, Le/e/a/FollowFeedData$Item;->thumbnail:Ljava/lang/String;", "v3"),
            ("QueueUi120", "    invoke-virtual {v11, v12}, Landroid/widget/FrameLayout;->setClipToOutline(Z)V", "v11"),
        ):
            file = name + ".smali"
            source = (disassembled / "e/e/a" / file).read_text()
            if source.count(anchor) != 1:
                raise ValueError(f"Missing thumbnail frame in {name}")
            (hooks / file).write_text(source.replace(anchor, anchor + f"\n\n    invoke-static {{{register}}}, {outline if name == 'QueueUi120' else outline_with_parent}"))
        gesture_file = "GestureControls110.smali"
        gesture = (disassembled / "e/e/a" / gesture_file).read_text()
        actions = "    sput-object v0, Le/e/a/GestureControls110;->ACTIONS:[Ljava/lang/String;"
        if gesture.count(actions) != 1:
            raise ValueError("Missing gesture action array")
        gesture = gesture.replace(actions,
            "    invoke-static {v0}, Le/e/a/NicoliveEntry;->gestureActions([Ljava/lang/String;)[Ljava/lang/String;\n"
            "    move-result-object v0\n\n" + actions)
        for signature, handler, conditional_return in (
            (".method static name(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;",
             "gestureName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;", "return-object v0"),
            (".method static perform(Landroid/app/Activity;Ljava/lang/String;)V",
             "performGesture(Landroid/app/Activity;Ljava/lang/String;)Z", "return-void"),
        ):
            gesture = add_hook(gesture, signature,
                f"invoke-static {{p0, p1}}, Le/e/a/NicoliveEntry;->{handler}\n"
                f"    {'move-result-object' if conditional_return.startswith('return-object') else 'move-result'} v0\n"
                "    if-eqz v0, :nicoid_live_original_gesture\n"
                f"    {conditional_return}\n"
                "    :nicoid_live_original_gesture")
        reset_messages = {
            "Reset assignments, sensitivity and display. Keep gestures enabled or disabled as currently set.":
                "Restore default assignments, sensitivity, display and axis recognition. Keep the main gesture switch as set.",
            "割り当て・感度・表示を初期値に戻します。ジェスチャーの有効/無効は維持します。":
                "割り当て・感度・表示・上下/左右方向の認識を初期値に戻します。ジェスチャー全体の有効/無効は維持します。",
            "重設手勢、靈敏度與顯示，保留啟用狀態。":
                "重設手勢指派、靈敏度、顯示與方向辨識，保留手勢總開關。"
        }
        for old, new in reset_messages.items():
            old_string, new_string = (json.dumps(value, ensure_ascii=True) for value in (old, new))
            if gesture.count(old_string) != 1:
                raise ValueError("Missing gesture reset description")
            gesture = gesture.replace(old_string, new_string)
        gesture = add_hook(gesture,
            ".method public static touch(Landroid/app/Activity;Landroid/view/MotionEvent;)Z",
            "invoke-static/range {p0 .. p1}, Le/e/a/PlaylistGestureRouter;->touch(Landroid/app/Activity;Landroid/view/MotionEvent;)I\n"
            "    move-result v0\n"
            "    if-ltz v0, :nicoid_existing_list_gesture\n"
            "    return v0\n"
            "    :nicoid_existing_list_gesture")
        (hooks / gesture_file).write_text(gesture)
        axis_file = "Dev128.smali"
        axis = (disassembled / "e/e/a" / axis_file).read_text()
        axis = add_hook(axis, ".method public static allowClaim(Landroid/content/Context;Ljava/lang/String;)Z",
            "invoke-static {p0, p1}, Le/e/a/GestureAxisOptions;->allowHorizontalClaim(Landroid/content/Context;Ljava/lang/String;)Z\n"
            "    move-result v0\n"
            "    if-nez v0, :nicoid_check_vertical\n"
            "    return v0\n"
            "    :nicoid_check_vertical")
        for method, params, registers in (
            ("install", "Landroid/app/Activity;Landroid/widget/LinearLayout;", "p0, p1"),
            ("reset", "Landroid/content/Context;", "p0"),
        ):
            signature = f".method public static {method}({params})V"
            replacement = (f"{signature}\n    .registers {registers.count(',') + 1}\n"
                           f"    invoke-static {{{registers}}}, Le/e/a/GestureAxisOptions;->{method}({params})V\n"
                           "    return-void\n.end method")
            axis, count = re.subn(re.escape(signature) + r".*?\.end method", replacement, axis, flags=re.DOTALL)
            if count != 1:
                raise ValueError(f"Missing gesture direction method: {method}")
        (hooks / axis_file).write_text(axis)

        viewport_file = "FullscreenViewport209.smali"
        viewport = (disassembled / "e/e/a" / viewport_file).read_text()
        viewport = add_hook(viewport, ".method public static update(Landroid/view/View;Landroid/view/ViewGroup;Landroid/view/View;)V",
                            "invoke-static/range {p0 .. p0}, Le/e/a/NormalVideoInsets;->clear(Landroid/view/View;)V")
        (hooks / viewport_file).write_text(viewport)

        restore_file = "Dev115.smali"
        restore = (disassembled / "e/e/a" / restore_file).read_text()
        signature = ".method public static afterFullscreenRestore(Landroid/view/View;)V"
        replacement = (signature + "\n    .registers 1\n"
                       "    invoke-static {p0}, Le/e/a/NormalVideoInsets;->schedule(Landroid/view/View;)V\n"
                       "    return-void\n.end method")
        restore, count = re.subn(re.escape(signature) + r".*?\.end method", replacement, restore, flags=re.DOTALL)
        if count != 1:
            raise ValueError("Missing normal playback restore")
        (hooks / restore_file).write_text(restore)
        tab_host_file = "MultiTabs227$Host.smali"
        tab_host = (disassembled / "e/e/a" / tab_host_file).read_text()
        insert = "invoke-virtual {v1, v2, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V"
        if tab_host.count(insert) != 1:
            raise ValueError("Missing multiple tab bar insertion")
        tab_host = tab_host.replace(insert,
            "invoke-static {v1, v2, v5, v3}, Le/e/a/MultiTabPlacement;->insert(Landroid/widget/LinearLayout;Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V")
        cached_bar = "    invoke-virtual/range {p0 .. p0}, Le/e/a/MultiTabs227$Host;->refreshSelected()V"
        if tab_host.count(cached_bar) != 1:
            raise ValueError("Missing cached tab bar update")
        tab_host = tab_host.replace(cached_bar,
            "    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->parent:Landroid/widget/LinearLayout;\n"
            "    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;\n"
            "    invoke-static {v2, v3}, Le/e/a/MultiTabPlacement;->update(Landroid/widget/LinearLayout;Landroid/view/View;)V\n\n" + cached_bar)
        # The native listener previously clamped each partial page and made
        # the visible list jump repeatedly. Preserve the Host and replace only
        # its restoration method, retaining tab/chrome/navigation hooks.
        host_pattern = (r"(?ms)^\.method[^\n]* restoreScroll"
                        r"\(Ljava/lang/Object;Le/e/a/SavedTabs227\$Tab;\)V\r?\n.*?^\.end method")
        host_stub = (".method restoreScroll(Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V\n"
                     "    .registers 3\n"
                     "    invoke-static {p0, p1, p2}, Le/e/a/SmoothTabRestore204;->restore(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V\n"
                     "    return-void\n.end method")
        tab_host, count = re.subn(host_pattern, lambda _: host_stub, tab_host)
        if count != 1:
            raise ValueError("Unexpected MultiTabs227.Host.restoreScroll method count")
        # Restore the 3-argument reflection call. The same v12 register is
        # reused later as the LRU cache limit. Dev.5 changed its initial
        # assignment to 8 and unintentionally made reflection allocate
        # eight arguments, so new tabs could not be created.
        native_arity = "    const/4 v12, 0x3"
        array_use = "    new-array v15, v12"
        lru_anchor = (
            "    :goto_19a\n"
            "    iget-object v5, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;"
        )
        if tab_host.count(native_arity) != 1 or tab_host.count(array_use) != 2:
            raise ValueError("Unexpected three-argument reflection registers")
        if tab_host.count(lru_anchor) != 1:
            raise ValueError("Unexpected native tab LRU loop")
        if not (tab_host.index(native_arity) <
                tab_host.index(array_use) <
                tab_host.index(lru_anchor)):
            raise ValueError("Native reflection arity and LRU order changed")
        tab_host = tab_host.replace(lru_anchor,
            "    :goto_19a\n"
            "    const/16 v12, 0x8\n"
            "    iget-object v5, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;")

        # While restoration waits for the saved row, a quick tab switch must
        # not replace the persistent deep offset with the temporary first row.
        capture_match = re.search(r"(?ms)^\.method capture\(\)V\r?\n.*?^\.end method",
                                  tab_host)
        if not capture_match:
            raise ValueError("Missing native tab position capture")
        capture = capture_match.group()
        captured_list = ("    check-cast v1, Landroid/widget/ListView;\n\n"
                         "    invoke-virtual {v1}, Landroid/widget/ListView;->getFirstVisiblePosition()I")
        if capture.count(captured_list) != 1:
            raise ValueError("Missing native ListView capture")
        capture = capture.replace(captured_list,
            "    check-cast v1, Landroid/widget/ListView;\n\n"
            "    invoke-static {v1}, Le/e/a/SmoothTabRestore204;->restoring(Landroid/widget/ListView;)Z\n"
            "    move-result v2\n"
            "    if-nez v2, :nicoid_capture_keep_saved_scroll\n\n"
            "    invoke-virtual {v1}, Landroid/widget/ListView;->getFirstVisiblePosition()I")
        url_anchor = ("    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;\n\n"
                      "    const-string v2, \"d0\"")
        if capture.count(url_anchor) != 1:
            raise ValueError("Missing URL continuation after scroll capture")
        capture = capture.replace(url_anchor,
            "    :nicoid_capture_keep_saved_scroll\n" + url_anchor)
        tab_host = tab_host[:capture_match.start()] + capture + tab_host[capture_match.end():]
        (hooks / tab_host_file).write_text(tab_host)
        order_file = "Dev111.smali"
        order = (disassembled / "e/e/a" / order_file).read_text()
        desired = '    .local v9, "desired":[Ljava/lang/String;'
        if order.count(desired) != 1:
            raise ValueError("Missing general settings order")
        (hooks / order_file).write_text(order.replace(desired, desired +
            "\n    invoke-static {v2, v9}, Le/e/a/MultiTabPlacement;->settingsOrder(Landroid/preference/PreferenceGroup;[Ljava/lang/String;)[Ljava/lang/String;\n"
            "    move-result-object v9\n"))

        ink_file = "CommentInk192.smali"
        ink = (disassembled / "e/e/a" / ink_file).read_text()
        ink = add_hook(ink, ".method public static draw(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;IFI)V",
            "invoke-static/range {p0 .. p7}, Le/e/a/CommentOutlineOpacity;->drawPass(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;IFI)Z\n"
            "    move-result v0\n"
            "    if-eqz v0, :nicoid_legacy_ink\n"
            "    return-void\n"
            "    :nicoid_legacy_ink")
        (hooks / ink_file).write_text(ink)
        visuals_file = "CommentVisuals.smali"
        visuals = (disassembled / "e/e/a" / visuals_file).read_text()
        custom_draw = "invoke-virtual {v2, v4, v0, v12, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V"
        if visuals.count(custom_draw) != 2:
            raise ValueError("Missing custom comment outline and fill passes")
        (hooks / visuals_file).write_text(visuals.replace(custom_draw,
            "invoke-static {v2, v4, v0, v12, v1}, Le/e/a/CommentOutlineOpacity;->drawCustom(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;)V"))
        hook_dex = work / "hooks.dex"
        run("java", "-cp", smali, "org.jf.smali.Main", "assemble", work / "hooks", "-o", hook_dex)
        merged = work / "helpers.mpe"
        run("java", "-jar", tools / "ecj.jar", "-21", "-proc:none", "-cp", smali_compile, "-d", work, ROOT.parent / "v2.0.1-dev.3/MergeLiveDex.java")
        run("java", "-cp", str(work) + os.pathsep + smali, "MergeLiveDex",
            original, hook_dex, live_dex, merged)

        resources = io.BytesIO()
        with ZipFile(io.BytesIO(base.read("nicoid/resources.zip"))) as old, ZipFile(resources, "w", ZIP_DEFLATED) as new:
            for item in old.infolist():
                data = old.read(item)
                new.writestr(item, patch_manifest(data) if item.filename == "AndroidManifest.xml" else data)
        manifest = base.read("META-INF/MANIFEST.MF")
        if manifest.count(b"Version: 1.11.1\r\n") != 1:
            raise ValueError("Expected the stable patch version")
        overrides = {
            "META-INF/MANIFEST.MF": manifest.replace(b"Version: 1.11.1\r\n", f"Version: {VERSION}\r\n".encode()),
            "nicoid/helpers.mpe": merged.read_bytes(),
            "nicoid/resources.zip": resources.getvalue(),
        }
        with ZipFile(args.output, "w", ZIP_DEFLATED) as output:
            for item in base.infolist():
                output.writestr(item, overrides[item.filename] if item.filename in overrides else base.read(item))
            for license_file in sorted((BASE_ROOT / "licenses").glob("*.txt")):
                output.write(license_file, "META-INF/" + license_file.name)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for flag in ("base", "tools", "media", "output"):
        parser.add_argument("--" + flag, type=Path, required=True)
    parser.add_argument("--apk", type=Path)
    parser.add_argument("--official-release", action="store_true", help="Build verified v2.0.0 on approved main CI")
    parser.add_argument("--ci-without-apk", action="store_true",
                        help="GitHub v2.0.0-dev only: compile against pinned API JARs instead of private APK")
    parser.add_argument("--compile-jar", action="append", type=Path, default=[])
    
    args = parser.parse_args()
    global VERSION
    if args.official_release:
        parser.error("Only a development verification MPP may be produced")
    if args.base.resolve() == args.output.resolve():
        parser.error("Use a separate output path")
    if args.apk is None and (not args.ci_without_apk or len(args.compile_jar) < 2):
        parser.error("The original APK is required, except for the CI-only checked-source build")
    if args.apk is not None and args.ci_without_apk:
        parser.error("Select either an original APK or the CI-only build")
    if hashlib.sha256(args.base.read_bytes()).hexdigest() != BASE_HASH:
        parser.error("Expected the official v1.11.1 MPP")
    with TemporaryDirectory() as folder:
        build(args, Path(folder))
    print(args.output)


if __name__ == "__main__":
    main()
