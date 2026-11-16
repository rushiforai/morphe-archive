"""Small JVM platform boundaries for production helper tests (no Android SDK/APK).

The handler clock is driven explicitly by each probe; it executes production callbacks.

Helpers that only read settings get the small Settings double below, whose `values` map a probe
fills directly. It follows the production rules: a key that isn't in `values` is unregistered, so
a switch reads as off and a choice as 0. tests/shared/test_settings.py runs the real Settings and
Registry instead (pass `extra={path: None}` to drop a double and compile the production class).
"""
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
PACKAGE = 'io/github/jordanwoodson/extension/shared/'
STUBS = {
    'android/os/Looper.java': '''package android.os; public class Looper {
        public static Looper getMainLooper(){return new Looper();} }''',
    'android/os/Handler.java': '''package android.os;
        import java.util.*;
        public class Handler {
          static long now, order;
          record Task(Runnable run,long at,long order){}
          static final List<Task> tasks=new ArrayList<>();
          public Handler(Looper l){}
          public boolean post(Runnable r){return postDelayed(r,0);}
          public boolean postDelayed(Runnable r,long delay){tasks.add(new Task(r,now+delay,order++));return true;}
          public void removeCallbacks(Runnable r){tasks.removeIf(t->t.run==r);}
          public static void advance(long millis){long end=now+millis;
            while(true){Task next=tasks.stream().filter(t->t.at<=end)
              .min(Comparator.comparingLong(Task::at).thenComparingLong(Task::order)).orElse(null);
              if(next==null)break; tasks.remove(next);now=next.at;next.run.run();}
            now=end;}
        }''',
    'android/content/Context.java': '''package android.content; public class Context {
        public static final int MODE_PRIVATE=0; public static final String ACCESSIBILITY_SERVICE="accessibility",AUDIO_SERVICE="audio";
        public Object getSystemService(String s){return null;} public <T>T getSystemService(Class<T> c){return null;}
        public Object getContentResolver(){return null;} public java.io.File getCacheDir(){return null;} public Context getApplicationContext(){return this;}
        public android.content.res.Resources getResources(){return new android.content.res.Resources();}
        public SharedPreferences getSharedPreferences(String s,int m){throw new AssertionError("unexpected Context");} }''',
    'android/content/SharedPreferences.java': '''package android.content; public interface SharedPreferences {
        String getString(String k,String d); Editor edit(); interface Editor {Editor putString(String k,String v);void apply();} }''',
    'android/content/ContextWrapper.java': '''package android.content; public class ContextWrapper extends Context {
        public Context getBaseContext(){return null;} }''',
    'android/app/Activity.java': '''package android.app; public class Activity extends android.content.ContextWrapper {
        public boolean isInPictureInPictureMode(){return false;} public android.view.Window getWindow(){return null;} }''',
    'android/content/res/Configuration.java': '''package android.content.res; public class Configuration {
        public static final int ORIENTATION_LANDSCAPE=2; public int orientation; }''',
    'android/content/res/Resources.java': '''package android.content.res; public class Resources {
        public Configuration getConfiguration(){return new Configuration();}
        public int getIdentifier(String n,String t,String p){return 0;} public String getResourcePackageName(int i){return "app";}
        public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();} }''',
    'android/util/DisplayMetrics.java': 'package android.util; public class DisplayMetrics {public float density=1;}',
    'android/graphics/Color.java': 'package android.graphics; public class Color {public static final int WHITE=-1;}',
    'android/graphics/Rect.java': '''package android.graphics; public class Rect {public int left,top,right,bottom;
        public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}
        public boolean contains(int x,int y){return x>=left&&x<right&&y>=top&&y<bottom;}
        public int height(){return bottom-top;} public int width(){return right-left;} }''',
    'android/graphics/drawable/GradientDrawable.java': '''package android.graphics.drawable;
        public class GradientDrawable {public void setColor(int c){} public void setCornerRadius(float r){} }''',
    'android/view/ViewParent.java': '''package android.view; public interface ViewParent {
        default void requestDisallowInterceptTouchEvent(boolean b){} }''',
    'android/view/View.java': '''package android.view; public class View implements ViewParent {
        public static final int VISIBLE=0,IMPORTANT_FOR_ACCESSIBILITY_NO=2;
        public android.content.Context getContext(){return new android.content.Context();}
        public android.content.res.Resources getResources(){return getContext().getResources();}
        public int getWidth(){return 0;} public int getHeight(){return 0;} public int getId(){return 0;}
        public int getVisibility(){return 0;} public void setVisibility(int i){} public boolean isShown(){return false;}
        public View getRootView(){return this;} public ViewParent getParent(){return null;}
        public void getLocationOnScreen(int[] xy){} public boolean performHapticFeedback(int i){return true;}
        public float getScaleX(){return 1;} public float getScaleY(){return 1;} public boolean canScrollVertically(int d){return false;}
        public void setContentDescription(String s){} public void setBackground(Object o){}
        public void setImportantForAccessibility(int i){} public void setPadding(int l,int t,int r,int b){}
        public interface OnLongClickListener {boolean onLongClick(View v);}
        public void setOnLongClickListener(OnLongClickListener l){}
        public interface OnAttachStateChangeListener {void onViewAttachedToWindow(View v);void onViewDetachedFromWindow(View v);}
        public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){}
        public interface OnLayoutChangeListener {void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int or,int ob);}
        public void addOnLayoutChangeListener(OnLayoutChangeListener l){} }''',
    'android/view/ViewGroup.java': '''package android.view; public class ViewGroup extends View {
        public static class LayoutParams {public static final int WRAP_CONTENT=-2;}
        public int getChildCount(){return 0;} public View getChildAt(int i){return null;}
        public void addView(View v,Object p){} public void removeView(View v){} }''',
    'android/view/SurfaceView.java': 'package android.view; public class SurfaceView extends View {}',
    'android/view/TextureView.java': 'package android.view; public class TextureView extends View {}',
    'android/view/Gravity.java': 'package android.view; public class Gravity {public static final int CENTER=17;}',
    'android/view/HapticFeedbackConstants.java': 'package android.view; public class HapticFeedbackConstants {public static final int LONG_PRESS=0;}',
    'android/view/MotionEvent.java': '''package android.view; public class MotionEvent {
        public static final int ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5,ACTION_POINTER_UP=6;
        public int getActionMasked(){return 0;} public int getPointerCount(){return 1;}
        public int getPointerId(int i){return 0;} public int findPointerIndex(int i){return 0;}
        public long getDownTime(){return 0;} public float getX(){return 0;} public float getY(){return 0;}
        public float getX(int i){return 0;} public float getY(int i){return 0;}
        public float getRawX(){return 0;} public float getRawY(){return 0;} }''',
    'android/view/ViewConfiguration.java': '''package android.view; public class ViewConfiguration {
        public static ViewConfiguration get(android.content.Context c){return new ViewConfiguration();}
        public int getScaledTouchSlop(){return 8;} }''',
    'android/view/Window.java': '''package android.view; public class Window {
        public WindowManager.LayoutParams getAttributes(){return new WindowManager.LayoutParams();}
        public void setAttributes(WindowManager.LayoutParams p){} public View getDecorView(){return null;} }''',
    'android/view/WindowManager.java': '''package android.view; public interface WindowManager {
        class LayoutParams {public static final float BRIGHTNESS_OVERRIDE_NONE=-1;public float screenBrightness=-1;} }''',
    'android/view/accessibility/AccessibilityManager.java': '''package android.view.accessibility;
        public class AccessibilityManager {public boolean isTouchExplorationEnabled(){return false;} }''',
    'android/widget/FrameLayout.java': '''package android.widget; public class FrameLayout extends android.view.ViewGroup {
        public static class LayoutParams extends android.view.ViewGroup.LayoutParams {public LayoutParams(int w,int h,int g){}} }''',
    'android/widget/ImageView.java': 'package android.widget; public class ImageView extends android.view.View {public void setImageResource(int i){} }',
    'android/widget/TextView.java': '''package android.widget; public class TextView extends android.view.View {
        public TextView(android.content.Context c){} public void setTextColor(int c){} public void setTextSize(int s){}
        public void setText(String s){} }''',
    'android/widget/Toast.java': '''package android.widget; public class Toast {public static final int LENGTH_SHORT=0;
        public static Toast makeText(android.content.Context c,String s,int i){return new Toast();} public void show(){} }''',
    'android/media/AudioManager.java': '''package android.media; public class AudioManager {
        public static final int STREAM_MUSIC=3,AUDIOFOCUS_LOSS_TRANSIENT=-2,AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK=-3,
          MODE_IN_CALL=2,MODE_IN_COMMUNICATION=3,MODE_RINGTONE=1;
        public int getStreamVolume(int i){return 0;} public int getStreamMaxVolume(int i){return 15;}
        public void setStreamVolume(int s,int v,int f){} public int getMode(){return 0;}
        public void dispatchMediaKeyEvent(android.view.KeyEvent e){} }''',
    'android/provider/Settings.java': '''package android.provider; public class Settings {
        public static class SettingNotFoundException extends Exception {}
        public static class System {public static final String SCREEN_BRIGHTNESS="brightness";
        public static int getInt(Object o,String k)throws SettingNotFoundException{return 128;}} }''',
    'android/os/SystemClock.java': 'package android.os; public class SystemClock {public static long uptimeMillis(){return 0;} public static long elapsedRealtime(){return 0;} }',
    'android/os/Build.java': '''package android.os; public class Build {
        public static class VERSION {public static final int SDK_INT=36;}
        public static class VERSION_CODES {public static final int S=31;} }''',
    'android/os/VibrationEffect.java': '''package android.os; public class VibrationEffect {
        public static final int DEFAULT_AMPLITUDE=-1;
        public static VibrationEffect createOneShot(long d,int a){return new VibrationEffect();} }''',
    'android/os/Vibrator.java': '''package android.os; public class Vibrator {
        public boolean hasVibrator(){return false;} public void vibrate(VibrationEffect e){} }''',
    'android/os/VibratorManager.java': '''package android.os; public class VibratorManager {
        public Vibrator getDefaultVibrator(){return null;} }''',
    'android/view/KeyEvent.java': '''package android.view; public class KeyEvent {
        public static final int ACTION_DOWN=0,ACTION_UP=1,KEYCODE_MEDIA_PAUSE=127;
        public KeyEvent(long a,long b,int c,int d,int e){} }''',
    'android/text/format/DateFormat.java': '''package android.text.format; public class DateFormat {
        public static boolean is24HourFormat(android.content.Context c){return true;} }''',
    PACKAGE + 'Logger.java': '''package io.github.jordanwoodson.extension.shared; public class Logger {
        public static void d(String s){} public static void i(String s){} public static void w(String s){}
        public static void w(String s,Throwable t){} public static void blocked(String s){} public static void refresh(){}
        public static boolean debug(){return false;} }''',
    PACKAGE + 'Network.java': '''package io.github.jordanwoodson.extension.shared; public class Network {
        public static boolean isMetered(android.content.Context c){return false;} }''',
    PACKAGE + 'settings/Settings.java': '''package io.github.jordanwoodson.extension.shared.settings;
        public class Settings {public static final java.util.Map<String,String> values=new java.util.HashMap<>();
        public static boolean isRegistered(String k){return values.containsKey(k);}
        public static boolean isEnabled(String k){return Boolean.parseBoolean(values.getOrDefault(k,"false"));}
        public static int getInt(String k){try{return Integer.parseInt(values.getOrDefault(k,"0"));}catch(NumberFormatException e){return 0;}}
        public static String getText(String k){return values.getOrDefault(k,"");}
        public static long changes(){return -1;}
        public static android.content.Context appContext(){return null;} }''',
}


def run(name, helpers, probe, args=(), extra=None):
    scratch = Path(os.environ.get('MORPHE_WORK', Path.home() / 'build/lurk-morphe-patches')) / name
    scratch.mkdir(parents=True, exist_ok=True)
    output = Path(tempfile.mkdtemp(prefix='jvm-', dir=scratch))
    try:
        sources = []
        for path, content in (STUBS | (extra or {}) | {name + '.java': probe}).items():
            if content is None:
                continue
            target = output / path
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(content)
            sources.append(str(target))
        sources += [str(ROOT / 'extensions/shared/src/main/java' / PACKAGE / helper) for helper in helpers]
        jdk = Path(os.environ['JAVA_HOME']) / 'bin' if os.environ.get('JAVA_HOME') else Path()
        subprocess.run([str(jdk / 'javac'), '-d', str(output / 'classes'), *sources], check=True)
        failures = []
        for arg in args or ('',):
            result = subprocess.run([str(jdk / 'java'), '-XX:-UsePerfData', '-Djava.io.tmpdir=' + str(output),
                                     '-cp', str(output / 'classes'), name, arg])
            if result.returncode:
                failures.append(arg)
        assert not failures, f'Failed production-helper scenarios: {failures}'
    finally:
        if sys.platform == 'darwin':
            print(f'Test files retained on macOS: {output}')
        else:
            shutil.rmtree(output)
