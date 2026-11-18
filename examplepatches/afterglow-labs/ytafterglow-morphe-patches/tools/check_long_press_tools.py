#!/usr/bin/env python3
"""Check canonical URLs and the actual clipboard hook's ownership and live gates."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
JDK = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
EXT = ROOT / "extensions/extension/src/main/java/app/afterglow/extension"
STUBS = {
    "android/content/ClipData.java": """package android.content;
public final class ClipData {
 public final String text;
 private ClipData(String text) { this.text = text; }
 public static ClipData newPlainText(CharSequence label, CharSequence text) { return new ClipData(text.toString()); }
}
""",
    "android/content/ClipboardManager.java": """package android.content;
public final class ClipboardManager {
 public static String text = "existing clipboard";
 public static int writes;
 public static boolean fail;
 public void setPrimaryClip(ClipData clip) {
  if (fail) throw new IllegalStateException("test clipboard unavailable");
  writes++; text = clip.text;
 }
}
""",
    "android/content/Context.java": """package android.content;
public class Context {
 public static final String CLIPBOARD_SERVICE = "clipboard";
 public static boolean serviceAvailable = true;
 public Object getSystemService(String name) { return serviceAvailable ? new ClipboardManager() : null; }
}
""",
    "android/content/DialogInterface.java": """package android.content;
public interface DialogInterface {
 interface OnClickListener { void onClick(DialogInterface dialog, int which); }
 interface OnShowListener { void onShow(DialogInterface dialog); }
}
""",
    "android/R.java": """package android;
public final class R { public static final class id { public static final int message = 1; } }
""",
    "android/view/ViewParent.java": """package android.view;
public interface ViewParent {}
""",
    "android/view/View.java": """package android.view;
import android.content.Context;
public class View implements ViewParent {
 public interface OnLongClickListener { boolean onLongClick(View view); }
 public OnLongClickListener listener;
 public ViewParent parent;
 public boolean clickable, longClickable, attached = true, shown = true;
 public Context context = new Context();
 public boolean isClickable() { return clickable; }
 public boolean isLongClickable() { return longClickable; }
 public boolean isAttachedToWindow() { return attached; }
 public boolean isShown() { return shown; }
 public void setLongClickable(boolean value) { longClickable = value; }
 public void setOnLongClickListener(OnLongClickListener value) { listener = value; if (value != null) longClickable = true; }
 public Context getContext() { return context; }
 public ViewParent getParent() { return parent; }
 public boolean performLongClick() { return listener != null && listener.onLongClick(this); }
}
""",
    "android/view/MotionEvent.java": """package android.view;
public final class MotionEvent {
 public static final int ACTION_DOWN = 0, ACTION_UP = 1, ACTION_MOVE = 2;
 private final int action;
 public MotionEvent(int action) { this.action = action; }
 public int getActionMasked() { return action; }
}
""",
    "android/widget/TextView.java": """package android.widget;
public final class TextView extends android.view.View {
 public boolean selectable;
 public void setTextIsSelectable(boolean value) { selectable = value; }
}
""",
    "android/widget/Toast.java": """package android.widget;
import android.content.Context;
public final class Toast {
 public static final int LENGTH_SHORT = 0;
 public static int shown;
 public static Toast makeText(Context context, CharSequence text, int duration) { return new Toast(); }
 public void show() { shown++; }
}
""",
    "android/app/AlertDialog.java": """package android.app;
import android.content.Context;
import android.content.DialogInterface;
import android.widget.TextView;
public final class AlertDialog implements DialogInterface {
 public static AlertDialog last;
 public String title, message;
 public DialogInterface.OnClickListener positive, negative;
 public DialogInterface.OnShowListener onShow;
 public final TextView textView = new TextView();
 public void setOnShowListener(DialogInterface.OnShowListener value) { onShow = value; }
 @SuppressWarnings("unchecked") public <T extends android.view.View> T findViewById(int id) { return (T) textView; }
 public void show() { last = this; if (onShow != null) onShow.onShow(this); }
 public static final class Builder {
  private final AlertDialog dialog = new AlertDialog();
  public Builder(Context context) {}
  public Builder setTitle(String value) { dialog.title = value; return this; }
  public Builder setMessage(String value) { dialog.message = value; return this; }
  public Builder setPositiveButton(String text, DialogInterface.OnClickListener value) { dialog.positive = value; return this; }
  public Builder setNegativeButton(String text, DialogInterface.OnClickListener value) { dialog.negative = value; return this; }
  public AlertDialog create() { return dialog; }
 }
}
""",
    "app/afterglow/extension/Afterglow.java": """package app.afterglow.extension;
import android.content.Context;
public final class Afterglow {
 public static int errors;
 public static Context context = new Context();
 public static Context context() { return context; }
 public static void error(String where, Throwable error) { errors++; }
}
""",
    "app/afterglow/extension/InstalledTweaks.java": """package app.afterglow.extension;
public final class InstalledTweaks {
 public static boolean installed = true;
 public static boolean has(String id) {
  if (!"long-press-tools".equals(id)) throw new AssertionError("Incorrect owner: " + id);
  return installed;
 }
}
""",
    "app/afterglow/extension/settings/LiteMode.java": """package app.afterglow.extension.settings;
public final class LiteMode {
 public static boolean enabled, videoInfo;
 public static boolean effectiveBool(String key) {
  if ("copyWithTimestamp".equals(key)) return enabled;
  if ("copyVideoInfo".equals(key)) return videoInfo;
  throw new AssertionError("Incorrect key: " + key);
 }
}
""",
    "app/afterglow/extension/i18n/L10n.java": """package app.afterglow.extension.i18n;
public final class L10n { public static String get(String key, String fallback) { return fallback; } }
""",
    "app/afterglow/extension/video/VideoState.java": """package app.afterglow.extension.video;
public final class VideoState {
 public static boolean ad, shorts, foreground = true;
 public static String id = "rfscVS0vtbw";
 public static long time = 61999;
 public static boolean isAdPlaying() { return ad; }
 public static boolean isShortsPlayerInFront() { return shorts; }
 public static PlayerType playerType() { return new PlayerType(); }
 public static String videoId() { return id; }
 public static long videoTime() { return time; }
 public static final class PlayerType { public boolean isMaximizedOrFullscreen() { return foreground; } }
}
""",
}
with tempfile.TemporaryDirectory(prefix="afterglow-long-press-") as out:
    out = Path(out)
    sources = []
    for relative, text in STUBS.items():
        path = out / "src" / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text)
        sources.append(path)
    sources += [EXT / "menus/LongPressPolicy.java", EXT / "menus/LongPressTools.java", EXT / "menus/LongPressTextPolicy.java",
                EXT / "menus/LongPressTextHost.java", EXT / "menus/LongPressTextTools.java", EXT / "litho/LithoContext.java",
                ROOT / "tools/jvm/LongPressPolicyTest.java", ROOT / "tools/jvm/LongPressToolsTest.java",
                ROOT / "tools/jvm/LongPressTextPolicyTest.java", ROOT / "tools/jvm/LongPressTextToolsTest.java"]
    subprocess.run([str(JDK / "bin/javac"), "-encoding", "UTF-8", "-d", str(out)]
                   + list(map(str, sources)), check=True)
    for test in ["LongPressPolicyTest", "LongPressToolsTest", "LongPressTextPolicyTest", "LongPressTextToolsTest"]:
        subprocess.run([str(JDK / "bin/java"), "-cp", str(out), test], check=True)
