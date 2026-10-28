#!/usr/bin/env python3
"""Run Twitch's production Fill screen helper (TwitchFillScreen) on the JVM against a small view-tree double.

Usage: python3 -I tests/twitch/verify_fill_screen.py
Requires a JDK (JAVA_HOME or PATH). Generated sources and classes go under $MORPHE_WORK (default
~/build/lurk-morphe-patches) and are removed on Linux.

The double is the native theatre in landscape on a 1600x720 screen with a 136 px display cutout: Twitch's
full-screen container padded by its insets listener (the cutout included), the theatre's content
(video_presenter_container), the player view delegate with its fitted video container and surface, and
views beside the video (the control overlay, a centered banner). Twitch's side is played by the probe: its
insets listener pads the container by whatever types TwitchFillScreen.insetTypes returns, and its sizing
calls TwitchFillScreen.measure on each layout of the player. Checked: the switch off, the claim (cutout
left out of the container's padding, the video scaled to cover the player, views reaching into the strip
padded and the rest left alone), the player next to the chat, portrait, picture-in-picture, a vertical and an
ultrawide video, the cutout on the right, the player leaving the window, a padding Twitch changed meanwhile,
Android 10's window cutout mode and the React Native player's resize mode. The hooks themselves are checked
in a patched APK (bin/verify-hooks) and on the emulator (docs/twitch.md, Fill screen).
"""
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

STUBS = {
    "android/content/Context.java": """
        package android.content;
        public class Context {
            public android.content.res.Resources resources = new android.content.res.Resources();
            public android.content.res.Resources getResources() { return resources; }
            public String getPackageName() { return "tv.twitch.android.app"; }
        }
    """,
    "android/content/ContextWrapper.java": """
        package android.content;
        public class ContextWrapper extends Context {
            private final Context base;
            public ContextWrapper(Context base) { this.base = base; }
            public Context getBaseContext() { return base; }
        }
    """,
    "android/content/res/Configuration.java": """
        package android.content.res;
        public class Configuration {
            public static final int ORIENTATION_PORTRAIT = 1, ORIENTATION_LANDSCAPE = 2;
            public int orientation = ORIENTATION_LANDSCAPE;
        }
    """,
    "android/content/res/Resources.java": """
        package android.content.res;
        public class Resources {
            public final Configuration configuration = new Configuration();
            public final java.util.Map<String, Integer> ids = new java.util.HashMap<>();
            public Configuration getConfiguration() { return configuration; }
            public int getIdentifier(String name, String type, String pkg) {
                return "id".equals(type) ? ids.getOrDefault(name, 0) : 0;
            }
        }
    """,
    "android/app/Activity.java": """
        package android.app;
        public class Activity extends android.content.ContextWrapper {
            public boolean pip;
            public final android.view.Window window = new android.view.Window();
            public Activity() { super(null); }
            public boolean isInPictureInPictureMode() { return pip; }
            public android.view.Window getWindow() { return window; }
        }
    """,
    "android/view/ViewParent.java": "package android.view; public interface ViewParent { ViewParent getParent(); }",
    "android/view/View.java": """
        package android.view;
        import java.util.*;
        public class View implements ViewParent {
            public static final int VISIBLE = 0, GONE = 8;
            public static final List<Runnable> POSTED = new ArrayList<>();
            public static void runPosted() { while (!POSTED.isEmpty()) POSTED.remove(0).run(); }
            public final android.content.Context context;
            public ViewParent parent;
            public int id, left, top, width, height, visibility = VISIBLE;
            public int paddingLeft, paddingTop, paddingRight, paddingBottom;
            public float scaleX = 1, scaleY = 1;
            public boolean attached = true;
            public WindowInsets rootInsets;
            public int insetRequests;
            final List<OnAttachStateChangeListener> attach = new ArrayList<>();
            public final List<OnLayoutChangeListener> layouts = new ArrayList<>();
            public View(android.content.Context context) { this.context = context; }
            public android.content.Context getContext() { return context; }
            public android.content.res.Resources getResources() { return context.getResources(); }
            public boolean isAttachedToWindow() { return attached; }
            public int getWidth() { return width; }
            public int getHeight() { return height; }
            public int getId() { return id; }
            public int getVisibility() { return visibility; }
            public ViewParent getParent() { return parent; }
            public View getRootView() { View v = this; while (v.parent instanceof View) v = (View) v.parent; return v; }
            public WindowInsets getRootWindowInsets() { return attached ? getRootView().rootInsets : null; }
            public boolean post(Runnable r) { POSTED.add(r); return true; }
            public void requestApplyInsets() { insetRequests++; }
            public void addOnAttachStateChangeListener(OnAttachStateChangeListener l) { attach.add(l); }
            public void detach() { attached = false; for (OnAttachStateChangeListener l : new ArrayList<>(attach)) l.onViewDetachedFromWindow(this); }
            public void addOnLayoutChangeListener(OnLayoutChangeListener l) { layouts.add(l); }
            public void removeOnLayoutChangeListener(OnLayoutChangeListener l) { layouts.remove(l); }
            public void laidOut() { for (OnLayoutChangeListener l : new ArrayList<>(layouts)) l.onLayoutChange(this, 0, 0, 0, 0, 0, 0, 0, 0); }
            public void getLocationInWindow(int[] xy) {
                int x = left, y = top;
                for (ViewParent p = parent; p instanceof View; p = ((View) p).parent) { x += ((View) p).left; y += ((View) p).top; }
                xy[0] = x; xy[1] = y;
            }
            public int getPaddingLeft() { return paddingLeft; }
            public int getPaddingTop() { return paddingTop; }
            public int getPaddingRight() { return paddingRight; }
            public int getPaddingBottom() { return paddingBottom; }
            public void setPadding(int l, int t, int r, int b) { paddingLeft = l; paddingTop = t; paddingRight = r; paddingBottom = b; }
            public float getScaleX() { return scaleX; }
            public float getScaleY() { return scaleY; }
            public void setScaleX(float s) { scaleX = s; }
            public void setScaleY(float s) { scaleY = s; }
            public interface OnAttachStateChangeListener { void onViewAttachedToWindow(View v); void onViewDetachedFromWindow(View v); }
            public interface OnLayoutChangeListener { void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or, int ob); }
        }
    """,
    "android/view/ViewGroup.java": """
        package android.view;
        import java.util.*;
        public class ViewGroup extends View {
            public final List<View> children = new ArrayList<>();
            public boolean clipChildren = true;
            public ViewGroup(android.content.Context context) { super(context); }
            public <T extends View> T add(T child) { children.add(child); child.parent = this; return child; }
            public int getChildCount() { return children.size(); }
            public View getChildAt(int i) { return children.get(i); }
            public boolean getClipChildren() { return clipChildren; }
            public void setClipChildren(boolean clip) { clipChildren = clip; }
        }
    """,
    "android/view/TextureView.java": """
        package android.view;
        public class TextureView extends View { public TextureView(android.content.Context c) { super(c); } }
    """,
    "android/view/SurfaceView.java": """
        package android.view;
        public class SurfaceView extends View { public SurfaceView(android.content.Context c) { super(c); } }
    """,
    "android/view/DisplayCutout.java": """
        package android.view;
        public class DisplayCutout {
            final int left, top, right, bottom;
            public DisplayCutout(int l, int t, int r, int b) { left = l; top = t; right = r; bottom = b; }
            public int getSafeInsetLeft() { return left; }
            public int getSafeInsetTop() { return top; }
            public int getSafeInsetRight() { return right; }
            public int getSafeInsetBottom() { return bottom; }
        }
    """,
    "android/view/WindowInsets.java": """
        package android.view;
        public class WindowInsets {
            public DisplayCutout cutout;
            public WindowInsets(DisplayCutout cutout) { this.cutout = cutout; }
            public DisplayCutout getDisplayCutout() { return cutout; }
        }
    """,
    "android/view/WindowManager.java": """
        package android.view;
        public interface WindowManager {
            class LayoutParams {
                public static final int LAYOUT_IN_DISPLAY_CUTOUT_MODE_DEFAULT = 0, LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES = 1,
                        LAYOUT_IN_DISPLAY_CUTOUT_MODE_NEVER = 2, LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS = 3;
                public int layoutInDisplayCutoutMode = LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
            }
        }
    """,
    "android/view/Window.java": """
        package android.view;
        public class Window {
            public WindowManager.LayoutParams attributes = new WindowManager.LayoutParams();
            public int sets;
            public WindowManager.LayoutParams getAttributes() { return attributes; }
            public void setAttributes(WindowManager.LayoutParams a) { attributes = a; sets++; }
        }
    """,
    "io/github/jordanwoodson/extension/shared/Logger.java": """
        package io.github.jordanwoodson.extension.shared;
        public class Logger { public static void d(String message) { } }
    """,
    "io/github/jordanwoodson/extension/shared/settings/Settings.java": """
        package io.github.jordanwoodson.extension.shared.settings;
        public class Settings {
            public static final java.util.Map<String, Boolean> values = new java.util.HashMap<>();
            public static boolean isEnabled(String key) { return values.getOrDefault(key, false); }
        }
    """,
}

PROBE = r"""
import android.app.Activity;
import android.view.*;
import io.github.jordanwoodson.extension.shared.settings.Settings;
import io.github.jordanwoodson.extension.shared.twitch.TwitchFillScreen;

public class FillScreenProbe {
    static int checks;
    static void check(boolean ok, String what) {
        checks++;
        if (!ok) throw new AssertionError(what);
    }

    static final int PRESENTER = 7, W = 1600, H = 720, CUT = 136, ALL = 0x28f;

    /** The theatre: Twitch's padded container, the theatre's content, the player, its video and views beside it. */
    static final class Theatre {
        final Activity activity = new Activity();
        final ViewGroup decor, container, presenter, root, pane, player, video;
        final TextureView surface;
        final View overlay, banner, details;
        int cutLeft = CUT, cutRight;
        float aspect = 16f / 9f;
        boolean chatBeside;

        Theatre() {
            activity.resources.ids.put("video_presenter_container", PRESENTER);
            decor = new ViewGroup(activity);
            container = decor.add(new ViewGroup(activity));
            presenter = container.add(new ViewGroup(activity));
            presenter.id = PRESENTER;
            root = presenter.add(new ViewGroup(activity));
            pane = root.add(new ViewGroup(activity));
            player = pane.add(new ViewGroup(activity));
            video = player.add(new ViewGroup(activity));
            surface = video.add(new TextureView(activity));
            overlay = root.add(new View(activity));
            banner = root.add(new View(activity));
            details = player.add(new View(activity));
            insets();
        }

        void insets() {
            decor.rootInsets = new WindowInsets(cutLeft + cutRight == 0 ? null : new DisplayCutout(cutLeft, 0, cutRight, 0));
        }

        /** Twitch's insets listener for the container: pads it by the types it's handed back. */
        void dispatchInsets() {
            container.insetRequests = 0;
            int types = TwitchFillScreen.insetTypes(container, ALL);
            boolean cutout = (types & 0x80) != 0;
            container.setPadding(cutout ? cutLeft : 0, 0, cutout ? cutRight : 0, 0);
        }

        /** Lays the theatre out the way Twitch does (the fitted video, the chat beside or not) and runs its sizing. */
        void layout() {
            boolean landscape = activity.resources.configuration.orientation == android.content.res.Configuration.ORIENTATION_LANDSCAPE;
            decor.width = container.width = landscape ? W : H;
            decor.height = container.height = landscape ? H : W;
            presenter.left = container.paddingLeft;
            presenter.width = root.width = container.width - container.paddingLeft - container.paddingRight;
            presenter.height = root.height = pane.height = player.height = container.height;
            pane.width = player.width = chatBeside ? Math.round(root.width * 0.7f) : root.width;
            if ((float) player.width / player.height > aspect) {
                video.height = player.height; video.width = Math.round(player.height * aspect);
            } else {
                video.width = player.width; video.height = Math.round(player.width / aspect);
            }
            video.left = (player.width - video.width) / 2;
            video.top = (player.height - video.height) / 2;
            surface.width = video.width; surface.height = video.height;
            overlay.width = player.width; overlay.height = 470;
            details.width = 300; details.height = 40; details.left = 0; details.top = 8;
            banner.width = 700; banner.height = 98; banner.left = (root.width - 700) / 2; banner.top = 580;
            int videoWidth = Math.round(1080 * aspect);
            TwitchFillScreen.measure(player, videoWidth, 1080);
            presenter.laidOut();
        }

        /** One round: layout, the posted work, and the insets dispatch Lurk asked for, until it settles. */
        void settle() {
            for (int i = 0; i < 4; i++) {
                layout();
                View.runPosted();
                if (container.insetRequests == 0) return;
                dispatchInsets();
            }
            throw new AssertionError("the theatre doesn't settle");
        }

        int[] at(View view) {
            int[] xy = new int[2];
            view.getLocationInWindow(xy);
            return xy;
        }
    }

    static void stock(Theatre t, String what) {
        check(t.container.paddingLeft == t.cutLeft && t.container.paddingRight == t.cutRight, what + ": container keeps the cutout padding");
        check(t.surface.scaleX == 1f && t.surface.scaleY == 1f, what + ": video not scaled");
        check(t.player.clipChildren, what + ": player clips its children");
        check(t.overlay.paddingLeft == 0 && t.overlay.paddingRight == 0, what + ": overlay padding as Twitch's");
        check(t.details.paddingLeft == 0, what + ": details padding as Twitch's");
        check(t.banner.paddingLeft == 0 && t.banner.paddingRight == 0, what + ": banner untouched");
    }

    static void filled(Theatre t, String what) {
        check(t.container.paddingLeft == 0 && t.container.paddingRight == 0, what + ": cutout left out of the container's padding");
        check(t.player.width == W, what + ": player covers the screen, cutout strip included");
        float scale = (float) t.player.width / t.video.width;
        check(Math.abs(t.surface.scaleX - scale) < 1e-4 && Math.abs(t.surface.scaleY - scale) < 1e-4,
            what + ": video scaled to cover the player, got " + t.surface.scaleX);
        check(t.video.width < t.player.width, what + ": the video container keeps Twitch's fitted size");
        check(!t.player.clipChildren, what + ": player lets the video container draw past its bounds");
        check(t.overlay.paddingLeft == t.cutLeft && t.overlay.paddingRight == t.cutRight, what + ": overlay kept clear of the cutout");
        check(t.details.paddingLeft == t.cutLeft, what + ": a view in the player kept clear of the cutout");
        check(t.banner.paddingLeft == 0 && t.banner.paddingRight == 0, what + ": a view clear of the strip left alone");
    }

    public static void main(String[] args) {
        Settings.values.put("fill_screen", false);

        // Switch off: Twitch's own padding, nothing scaled; the insets types pass through.
        Theatre off = new Theatre();
        off.dispatchInsets();
        off.settle();
        stock(off, "switch off");
        check(TwitchFillScreen.insetTypes(off.container, ALL) == ALL, "switch off: insets types unchanged");

        Settings.values.put("fill_screen", true);

        // Landscape, chat hidden: the whole screen.
        Theatre t = new Theatre();
        t.dispatchInsets();
        t.settle();
        filled(t, "landscape");
        check(t.activity.window.sets == 0, "Android 11+: the window's cutout mode (ALWAYS) is left alone");

        // Chat beside the player: Twitch's layout again.
        t.chatBeside = true;
        t.settle();
        stock(t, "chat beside");
        t.chatBeside = false;
        t.settle();
        filled(t, "chat hidden again");

        // Twitch pads a view itself meanwhile: its own value stays when Lurk lets go.
        t.overlay.setPadding(5, 0, 0, 0);
        t.settle();
        check(t.overlay.paddingLeft == 5 + CUT, "a padding Twitch set meanwhile is kept under the cutout's");
        t.overlay.setPadding(9, 0, 0, 0);
        t.activity.resources.configuration.orientation = android.content.res.Configuration.ORIENTATION_PORTRAIT;
        t.settle();
        check(t.overlay.paddingLeft == 9, "Twitch's newer padding isn't overwritten when Lurk lets go");
        check(t.surface.scaleX == 1f && t.player.clipChildren, "portrait: video back to Twitch's");
        check(t.container.paddingLeft == CUT, "portrait: container padded by Twitch again");
        t.overlay.setPadding(0, 0, 0, 0);
        t.activity.resources.configuration.orientation = android.content.res.Configuration.ORIENTATION_LANDSCAPE;
        t.settle();
        filled(t, "landscape again");

        // Picture-in-picture.
        t.activity.pip = true;
        t.settle();
        stock(t, "picture-in-picture");
        t.activity.pip = false;
        t.settle();
        filled(t, "out of picture-in-picture");

        // A vertical video keeps its bars and the cutout strip.
        t.aspect = 9f / 16f;
        t.settle();
        stock(t, "vertical video");

        // A video wider than the screen: the strip is used, nothing to crop.
        t.aspect = 2.4f;
        t.settle();
        check(t.container.paddingLeft == 0, "ultrawide: the cutout strip is used");
        check(t.surface.scaleX == 1f, "ultrawide: the video isn't cropped at its sides");
        t.aspect = 16f / 9f;
        t.settle();
        filled(t, "16:9 again");

        // The cutout on the right (the other landscape).
        t.cutLeft = 0;
        t.cutRight = CUT;
        t.insets();
        t.dispatchInsets();
        t.settle();
        check(t.container.paddingRight == 0, "cutout right: left out of the container's padding");
        check(t.overlay.paddingRight == CUT && t.overlay.paddingLeft == 0, "cutout right: overlay kept clear on the right");
        check(t.details.paddingLeft == 0, "cutout right: a view on the left isn't padded");

        // The player leaves the window (the theatre closes): everything back.
        t.player.detach();
        View.runPosted();
        check(t.container.insetRequests > 0, "detach: Twitch's padding asked for again");
        t.dispatchInsets();
        check(t.container.paddingRight == CUT, "detach: container padded by Twitch again");
        check(t.surface.scaleX == 1f && t.player.clipChildren, "detach: video back to Twitch's");
        check(t.overlay.paddingRight == 0, "detach: overlay padding back");

        // Outside the theatre (no video_presenter_container around the player): untouched.
        Theatre feed = new Theatre();
        feed.presenter.id = 0;
        feed.dispatchInsets();
        feed.settle();
        stock(feed, "outside the theatre");

        // Android 10: Twitch leaves the window's cutout mode at DEFAULT; Lurk asks for SHORT_EDGES while filling.
        Theatre q = new Theatre();
        q.activity.window.attributes.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_DEFAULT;
        q.dispatchInsets();
        q.settle();
        check(q.activity.window.attributes.layoutInDisplayCutoutMode == WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES,
            "Android 10: window into the cutout area");
        q.activity.resources.configuration.orientation = android.content.res.Configuration.ORIENTATION_PORTRAIT;
        q.settle();
        check(q.activity.window.attributes.layoutInDisplayCutoutMode == WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_DEFAULT,
            "Android 10: window's own cutout mode back");

        // React Native player: FIT becomes ZOOM for a player covering the screen in landscape.
        Theatre rn = new Theatre();
        rn.dispatchInsets();
        View rnSurface = rn.player.add(new TextureView(rn.activity));
        rn.presenter.id = 0;
        rn.layout();
        Mode zoom = (Mode) TwitchFillScreen.surfaceResizeMode(rnSurface, Mode.FIT, rn.player.width, rn.player.height, 16f / 9f);
        check(zoom == Mode.ZOOM, "React Native: FIT becomes ZOOM, got " + zoom);
        check(TwitchFillScreen.surfaceResizeMode(rnSurface, Mode.FIT, rn.player.width, rn.player.height, 9f / 16f) == Mode.FIT,
            "React Native: a vertical video keeps FIT");
        rn.activity.resources.configuration.orientation = android.content.res.Configuration.ORIENTATION_PORTRAIT;
        check(TwitchFillScreen.surfaceResizeMode(rnSurface, Mode.FIT, rn.player.width, rn.player.height, 16f / 9f) == Mode.FIT,
            "React Native: portrait keeps FIT");
        Settings.values.put("fill_screen", false);
        rn.activity.resources.configuration.orientation = android.content.res.Configuration.ORIENTATION_LANDSCAPE;
        check(TwitchFillScreen.surfaceResizeMode(rnSurface, Mode.FIT, rn.player.width, rn.player.height, 16f / 9f) == Mode.FIT,
            "React Native: switch off keeps FIT");

        System.out.println("PASS: " + checks + " Fill screen assertions");
    }

    public enum Mode { FIT, FILL, ZOOM }
}
"""


def java_tool(name):
    java_home = os.environ.get("JAVA_HOME")
    candidate = Path(java_home) / "bin" / name if java_home else None
    return str(candidate) if candidate and candidate.is_file() else shutil.which(name) or name


def run(output, repo):
    sources = []
    for name, content in STUBS.items():
        source = output / name
        source.parent.mkdir(parents=True, exist_ok=True)
        source.write_text(content, encoding="utf-8")
        sources.append(str(source))
    helper = repo / "extensions/shared/src/main/java/io/github/jordanwoodson/extension/shared/twitch/TwitchFillScreen.java"
    (output / "FillScreenProbe.java").write_text(PROBE, encoding="utf-8")
    classes = output / "classes"
    subprocess.run([java_tool("javac"), "-d", str(classes), *sources, str(helper), str(output / "FillScreenProbe.java")],
                   check=True)
    subprocess.run([java_tool("java"), "-XX:-UsePerfData", "-cp", str(classes), "FillScreenProbe"], check=True)


def main():
    repo = Path(__file__).resolve().parents[2]
    scratch = Path(os.environ.get("MORPHE_WORK", Path.home() / "build/lurk-morphe-patches")) / "twitch-tests"
    scratch.mkdir(parents=True, exist_ok=True)
    output = Path(tempfile.mkdtemp(prefix="fill-screen-", dir=scratch))
    try:
        run(output, repo)
    finally:
        if sys.platform == "darwin":
            print(f"Test files retained on macOS: {output}")
        else:
            shutil.rmtree(output)


if __name__ == "__main__":
    main()
