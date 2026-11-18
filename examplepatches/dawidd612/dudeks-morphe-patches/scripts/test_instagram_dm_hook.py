#!/usr/bin/env python3
"""Host-side behavior tests of the production hook, with tiny Android/Piko fakes.

Requires a JDK, not Android SDK, network access or an Instagram account.
This tests decisions/settings integration, not Android rendering or ART verification.
"""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCES = {
    "android/os/SystemClock.java": """
package android.os;
public class SystemClock {
    public static long now;
    public static long uptimeMillis() { return now; }
}
""",
    "android/view/ViewTreeObserver.java": """
package android.view;
public class ViewTreeObserver {
    public interface OnPreDrawListener { boolean onPreDraw(); }
    public java.util.List<OnPreDrawListener> listeners = new java.util.ArrayList<>();
    public void addOnPreDrawListener(OnPreDrawListener l) { listeners.add(l); }
    public void removeOnPreDrawListener(OnPreDrawListener l) { listeners.remove(l); }
    public boolean isAlive() { return true; }
    public void draw() { for (OnPreDrawListener l : new java.util.ArrayList<>(listeners)) l.onPreDraw(); }
}
""",
    "android/view/View.java": """
package android.view;
public class View {
    public interface OnAttachStateChangeListener {
        void onViewAttachedToWindow(View v); void onViewDetachedFromWindow(View v);
    }
    public int top, height, width, paddingTop, paddingBottom, screenOffset;
    public Object parent;
    public float translationY;
    public float getTranslationY() { return translationY; }
    public boolean attached = true, focus = true, acceptsPosts = true;
    public java.util.List<Runnable> callbacks = new java.util.ArrayList<>();
    public ViewTreeObserver observer = new ViewTreeObserver();
    public java.util.List<OnAttachStateChangeListener> attach = new java.util.ArrayList<>();
    public int getTop() { return top; } public int getBottom() { return top + height; }
    public int getHeight() { return height; } public int getWidth() { return width; }
    public int getPaddingTop() { return paddingTop; } public int getPaddingBottom() { return paddingBottom; }
    public Object getParent() { return parent; }
    public void getLocationOnScreen(int[] xy) { xy[0] = 0; xy[1] = top + screenOffset; }
    public boolean postDelayed(Runnable r, long delay) {
        if (!acceptsPosts) return false;
        callbacks.add(r); return true;
    }
    public boolean removeCallbacks(Runnable r) { return callbacks.remove(r); }
    public void expire() {
        android.os.SystemClock.now += 1001;
        for (Runnable r : new java.util.ArrayList<>(callbacks)) r.run();
    }
    public boolean isAttachedToWindow() { return attached; } public boolean hasWindowFocus() { return focus; }
    public ViewTreeObserver getViewTreeObserver() { return observer; }
    public void addOnAttachStateChangeListener(OnAttachStateChangeListener l) { attach.add(l); }
    public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l) { attach.remove(l); }
    public void detach() {
        attached = false;
        for (OnAttachStateChangeListener l : new java.util.ArrayList<>(attach)) l.onViewDetachedFromWindow(this);
    }
}
""",
    "androidx/recyclerview/widget/RecyclerView.java": """
package androidx.recyclerview.widget;
import android.view.View;
public class RecyclerView extends View {
    public int state, scrollCalls, scrollLimit = Integer.MAX_VALUE;
    public java.util.List<View> children = new java.util.ArrayList<>();
    public int getScrollState() { return state; }
    public int getChildCount() { return children.size(); }
    public View getChildAt(int i) { return children.get(i); }
    public void scrollBy(int x, int y) {
        scrollCalls++; y = Math.max(-scrollLimit, Math.min(scrollLimit, y));
        for (View child : children) child.top -= y;
    }
}
""",
    "app/morphe/extension/instagram/utils/IgStr.java": """
package app.morphe.extension.instagram.utils;
public class IgStr {
    public static boolean polish;
    public static String str(String key) {
        if (key.endsWith("_title")) return polish ?
            "Zachowuj pozycję przewijania podczas odpowiadania" : "Keep scroll position when replying";
        return polish ? "Pozostań w bieżącym miejscu rozmowy po odpowiedzi na starszą wiadomość." :
            "Stay at the current position in a conversation after replying to an older message.";
    }
}
""",

    "android/preference/Preference.java": """
package android.preference;
public class Preference { public String key, title, summary; }
""",
    "android/preference/PreferenceScreen.java": """
package android.preference;
public class PreferenceScreen {
    public Preference preference;
    public int additions;
    public Preference findPreference(String key) {
        return preference != null && key.equals(preference.key) ? preference : null;
    }
    public boolean addPreference(Preference p) { preference = p; additions++; return true; }
}
""",
    "app/morphe/extension/crimera/settings/BooleanSetting.java": """
package app.morphe.extension.crimera.settings;
public class BooleanSetting {
    public final String key;
    public final Boolean defaultValue;
    public BooleanSetting(String key, Boolean value) { this.key = key; defaultValue = value; }
}
""",
    "app/morphe/extension/crimera/sharedPreference/SharedPref.java": """
package app.morphe.extension.crimera.sharedPreference;
import app.morphe.extension.crimera.settings.BooleanSetting;
public class SharedPref {
    public static Boolean value;
    public static boolean unavailable;
    public static Boolean getBooleanPref(BooleanSetting setting) {
        if (unavailable) throw new IllegalStateException("preferences unavailable");
        return value == null ? setting.defaultValue : value;
    }
}
""",
    "app/morphe/extension/instagram/settings/preference/Helper.java": """
package app.morphe.extension.instagram.settings.preference;
import android.preference.Preference;
import app.morphe.extension.crimera.settings.BooleanSetting;
public class Helper {
    public Preference switchPreference(String title, String summary, BooleanSetting setting) {
        Preference p = new Preference();
        p.key = setting.key; p.title = title; p.summary = summary; return p;
    }
}
""",
    "HookTest.java": """
import android.preference.PreferenceScreen;
import app.morphe.extension.crimera.sharedPreference.SharedPref;
import app.morphe.extension.instagram.settings.preference.Helper;
import pl.dudek.extension.instagram.KeepDmScrollPosition;
public class HookTest {
    static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
    static androidx.recyclerview.widget.RecyclerView list() {
        androidx.recyclerview.widget.RecyclerView list = new androidx.recyclerview.widget.RecyclerView();
        list.height = 800; list.width = 400;
        android.view.View a = new android.view.View(); a.top = -40; a.height = 300; a.parent = list;
        android.view.View b = new android.view.View(); b.top = 260; b.height = 300; b.parent = list;
        list.children.add(a); list.children.add(b);
        return list;
    }
    static void resize(androidx.recyclerview.widget.RecyclerView v, int delta) {
        v.height += delta;
        for (android.view.View child : v.children) child.top += delta;
        v.observer.draw();
    }
    static void released(androidx.recyclerview.widget.RecyclerView v) {
        check(v.attach.isEmpty() && v.observer.listeners.isEmpty() && v.callbacks.isEmpty(), "listeners/timer released");
    }
    static void layoutTests() {
        KeepDmScrollPosition.preserveReplyLayout(null);
        KeepDmScrollPosition.preserveReplyLayout(new android.view.View());
        androidx.recyclerview.widget.RecyclerView scoped = list();
        java.lang.ref.WeakReference<android.view.View> reference = new java.lang.ref.WeakReference<>(scoped);
        check(!KeepDmScrollPosition.shouldSkipReplyLayoutScroll(reference), "no active reply, native nudge allowed");
        KeepDmScrollPosition.preserveReplyLayout(scoped);
        check(KeepDmScrollPosition.shouldSkipReplyLayoutScroll(reference), "reply-only native nudge guard");
        check(!KeepDmScrollPosition.shouldSkipReplyLayoutScroll(null), "missing reference");
        check(!KeepDmScrollPosition.shouldSkipReplyLayoutScroll(new java.lang.ref.WeakReference<>(null)), "cleared list");
        check(!KeepDmScrollPosition.shouldSkipReplyLayoutScroll(new java.lang.ref.WeakReference<>(list())), "other thread unaffected");
        scoped.state = 1;
        check(!KeepDmScrollPosition.shouldSkipReplyLayoutScroll(reference), "manual scroll cancels native guard");
        released(scoped);
        scoped.state = 0;
        check(!KeepDmScrollPosition.shouldSkipReplyLayoutScroll(reference), "native guard does not resume");
        KeepDmScrollPosition.preserveReplyLayout(scoped);
        androidx.recyclerview.widget.RecyclerView next = list();
        KeepDmScrollPosition.preserveReplyLayout(next);
        released(scoped);
        check(!KeepDmScrollPosition.shouldSkipReplyLayoutScroll(reference), "new conversation retires old state");
        next.expire(); released(next);
        for (boolean atLatest : new boolean[] {false, true}) {
            scoped = list(); KeepDmScrollPosition.preserveReplyLayout(scoped);
            check(!KeepDmScrollPosition.shouldKeepPosition(atLatest ? new Object() : null, atLatest),
                    "normal subsequent send keeps stock behavior");
            released(scoped);
            check(!KeepDmScrollPosition.shouldSkipReplyLayoutScroll(new java.lang.ref.WeakReference<>(scoped)),
                    "normal subsequent send clears native viewport guard");
        }

        // Regression: composer cleanup may happen after several unchanged draws.
        androidx.recyclerview.widget.RecyclerView v = list();
        KeepDmScrollPosition.preserveReplyLayout(v);
        for (int i = 0; i < 3; i++) { android.os.SystemClock.now += 16; v.observer.draw(); }
        resize(v, 48);
        check(v.children.get(0).top == -40, "delayed reply resize preserves the Reel offset");
        v.expire(); released(v);

        // ItemAnimator can initially mask the layout shift with a translation,
        // then settle it over subsequent frames. Preserve what is actually drawn.
        v = list(); KeepDmScrollPosition.preserveReplyLayout(v);
        v.height += 48;
        for (android.view.View child : v.children) { child.top += 48; child.translationY = -48; }
        v.observer.draw();
        check(v.children.get(0).top + v.children.get(0).translationY == -40,
                "resize animation must not introduce a reverse hop");
        for (float translation : new float[] {-36.5f, -24.25f, -12f, 0f}) {
            for (android.view.View child : v.children) child.translationY = translation;
            v.observer.draw();
            check(Math.abs(v.children.get(0).top + translation + 40) <= 0.5f,
                    "animated visual anchor: " + translation);
        }
        v.expire(); released(v);
        // A secondary row can use a different animation; only the primary visual
        // anchor is restored, with the second row corroborating layout movement.
        v = list(); KeepDmScrollPosition.preserveReplyLayout(v);
        v.height += 48;
        for (android.view.View child : v.children) child.top += 48;
        v.children.get(0).translationY = -48; v.observer.draw();
        v.children.get(0).translationY = -24; v.observer.draw();
        check(v.children.get(0).top - 24 == -40, "independent secondary animation");
        v.children.get(0).translationY = 0; v.observer.draw();
        check(v.children.get(0).top == -40, "primary anchor after unequal animations");
        v.expire(); released(v);
        v = list(); KeepDmScrollPosition.preserveReplyLayout(v);
        for (android.view.View child : v.children) child.translationY = -12;
        v.observer.draw();
        check(v.scrollCalls == 0, "unrelated item animation must not be compensated");
        released(v);

        for (int delta : new int[] {48, -48, 1, 0}) {
            v = list();
            KeepDmScrollPosition.preserveReplyLayout(v);
            resize(v, delta);
            check(v.children.get(0).top == -40, "pixel offset restored: " + delta);
            check(v.scrollCalls == (delta == 0 ? 0 : 1), "one correction per resize");
            resize(v, 12); resize(v, 12); resize(v, 24);
            check(v.children.get(0).top == -40, "animated resize preserves the original anchor");
            v.expire(); released(v);
            resize(v, 30);
            check(v.children.get(0).top == -10, "layouts after timeout untouched");
        }
        v = list(); v.paddingBottom = 48;
        KeepDmScrollPosition.preserveReplyLayout(v);
        v.paddingBottom = 0;
        for (android.view.View child : v.children) child.top += 48;
        v.observer.draw();
        check(v.children.get(0).top == -40, "bottom inset removal without a height change");
        v.expire(); released(v);

        v = list(); KeepDmScrollPosition.preserveReplyLayout(v);
        v.screenOffset = 48; v.observer.draw();
        check(v.children.get(0).top + v.screenOffset == -40, "screen coordinate anchor");
        v.expire(); released(v);

        v = list(); KeepDmScrollPosition.preserveReplyLayout(v);
        v.height += 48; v.observer.draw();
        check(v.scrollCalls == 0, "do not duplicate native top anchoring");
        resize(v, 24);
        check(v.children.get(0).top == -40, "later bottom-anchored resize");
        v.expire(); released(v);

        for (int scenario = 0; scenario < 10; scenario++) {
            v = list(); KeepDmScrollPosition.preserveReplyLayout(v);
            v.height += 48; for (android.view.View child : v.children) child.top += 48;
            switch (scenario) {
                case 0: v.state = 1; break;
                case 1: v.state = 2; break;
                case 2: v.children.get(0).parent = null; break;
                case 3: v.children.get(1).top += 12; break;
                case 4: v.width++; break;
                case 5: v.focus = false; break;
                case 6: v.detach(); break;
                case 7: v.height -= 48; break; // explicit scrolling, no viewport resize
                case 8: v.children.get(0).height++; break; // media item resize/rebind
                case 9: android.os.SystemClock.now += 1001; break; // timer delivery delayed
            }
            v.observer.draw();
            check(v.scrollCalls == 0, "excluded movement " + scenario);
            released(v);
            v.state = 0; resize(v, 10);
            check(v.scrollCalls == 0, "cancelled tracking never resumes");
        }
        v = list(); v.children.remove(1);
        KeepDmScrollPosition.preserveReplyLayout(v);
        resize(v, 48);
        check(v.children.get(0).top == -40, "single large Reel");
        v.expire(); released(v);

        v = list(); v.scrollLimit = 12; KeepDmScrollPosition.preserveReplyLayout(v);
        resize(v, 48); released(v);
        resize(v, 12);
        check(v.scrollCalls == 1, "never chase a clamped native scroll");
        v = list(); KeepDmScrollPosition.preserveReplyLayout(v); v.expire(); released(v);
        v = list(); v.state = 1; KeepDmScrollPosition.preserveReplyLayout(v); released(v);
        v = list(); v.attached = false; KeepDmScrollPosition.preserveReplyLayout(v); released(v);
        v = list(); v.acceptsPosts = false; KeepDmScrollPosition.preserveReplyLayout(v); released(v);
        v = list(); KeepDmScrollPosition.preserveReplyLayout(v);
        KeepDmScrollPosition.preserveReplyLayout(v); resize(v, 48);
        check(v.scrollCalls == 1, "rapid consecutive replies must not double compensate");
        v.expire(); released(v);
    }
    public static void main(String[] args) {
        Object reply = new Object();
        check(KeepDmScrollPosition.shouldKeepPosition(reply, false), "default must be on");
        for (boolean enabled : new boolean[] {false, true}) {
            SharedPref.value = enabled;
            check(!KeepDmScrollPosition.shouldKeepPosition(null, false), "plain message in history");
            check(!KeepDmScrollPosition.shouldKeepPosition(null, true), "plain message at latest");
            check(!KeepDmScrollPosition.shouldKeepPosition(reply, true), "reply at latest");
            check(KeepDmScrollPosition.shouldKeepPosition(reply, false) == enabled, "old reply toggle");
        }
        SharedPref.unavailable = true;
        check(!KeepDmScrollPosition.shouldKeepPosition(reply, false), "preference failure fallback");
        PreferenceScreen screen = new PreferenceScreen();
        Helper helper = new Helper();
        KeepDmScrollPosition.addPreference(null, helper);
        KeepDmScrollPosition.addPreference(screen, null);
        check(screen.additions == 0, "null settings input");
        KeepDmScrollPosition.addPreference(screen, helper);
        KeepDmScrollPosition.addPreference(screen, helper);
        check(screen.additions == 1, "duplicate preference");
        check(screen.preference.key.equals("dudeks_keep_dm_scroll_position"), "preference key");
        check(screen.preference.title.equals("Keep scroll position when replying"), "preference title");
        app.morphe.extension.instagram.utils.IgStr.polish = true;
        PreferenceScreen polish = new PreferenceScreen();
        KeepDmScrollPosition.addPreference(polish, helper);
        check(polish.preference.title.equals("Zachowuj pozycję przewijania podczas odpowiadania"), "Polish title");
        check(polish.preference.summary.startsWith("Pozostań"), "Polish summary");
        layoutTests();
        System.out.println("PASS: default on, send decisions, preferences, localization and delayed, animated and inset resize anchoring");
    }
}
""",
}

with tempfile.TemporaryDirectory(prefix="dudeks-instagram-hook-") as temp:
    folder = Path(temp)
    files = []
    for name, source in SOURCES.items():
        path = folder / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(source)
        files.append(str(path))
    production = ROOT / "extensions/instagram/src/main/java/pl/dudek/extension/instagram/KeepDmScrollPosition.java"
    subprocess.run(["javac", "-d", str(folder), *files, str(production)], check=True)
    subprocess.run(["java", "-cp", str(folder), "HookTest"], check=True)
