#!/usr/bin/env python3
"""Exercise exact native avatar identity, URL resizing, and bounded image transfer."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "extensions/extension/src/main/java/app/afterglow/extension/menus"
STUBS = {'android/content/Context.java': 'package android.content;public class Context {public static final String '
                                 'CLIPBOARD_SERVICE="clipboard";public final ClipboardManager clipboard=new '
                                 'ClipboardManager();public Object getSystemService(String name){return '
                                 'clipboard;}public android.content.res.Resources.Theme getTheme(){return new '
                                 'android.content.res.Resources.Theme();}}',
 'android/content/ContextWrapper.java': 'package android.content;public class ContextWrapper extends Context {private '
                                        'final Context base;public ContextWrapper(Context c){base=c;}public Context '
                                        'getBaseContext(){return base;}}',
 'android/content/ClipData.java': 'package android.content;public class ClipData {public CharSequence text;public '
                                  'static ClipData newPlainText(CharSequence label,CharSequence text){ClipData c=new '
                                  'ClipData();c.text=text;return c;}}',
 'android/content/ClipboardManager.java': 'package android.content;public class ClipboardManager {public ClipData '
                                          'value;public void setPrimaryClip(ClipData clip){value=clip;}}',
 'android/content/res/Resources.java': 'package android.content.res;public class Resources {public static class Theme '
                                       '{}}',
 'android/os/Looper.java': 'package android.os;public class Looper {public static Looper getMainLooper(){return new '
                           'Looper();}}',
 'android/os/SystemClock.java': 'package android.os;public class SystemClock {public static long now;public static '
                                'long uptimeMillis(){return now;}}',
 'android/view/ViewConfiguration.java': 'package android.view;public class ViewConfiguration {public static '
                                        'ViewConfiguration get(android.content.Context context){return new '
                                        'ViewConfiguration();}public int getScaledTouchSlop(){return 16;}}',
 'android/widget/Toast.java': 'package android.widget;public class Toast {public static final int '
                              'LENGTH_SHORT=0;public static String last;public static Toast '
                              'makeText(android.content.Context context,CharSequence text,int '
                              'duration){last=text.toString();return new Toast();}public void show(){}}',
 'app/afterglow/extension/InstalledTweaks.java': 'package app.afterglow.extension;public class InstalledTweaks {public '
                                                 'static boolean installed=true;public static boolean has(String '
                                                 'owner){return installed&&owner.equals("long-press-tools");}}',
 'app/afterglow/extension/diagnostics/DebugLog.java': 'package app.afterglow.extension.diagnostics;public class '
                                                      'DebugLog {public static boolean enabled;public static final java.util.List<String> messages=new java.util.ArrayList<>();public static boolean shouldWrite(String tag){return enabled;}public static void write(String tag,String text){if(enabled)messages.add(text);}}',
 'app/afterglow/extension/menus/LongPressImageProvider.java': 'package app.afterglow.extension.menus;public class '
                                                              'LongPressImageProvider {public static '
                                                              'android.graphics.Bitmap saved,copied;public static void '
                                                              'save(android.app.Activity '
                                                              'activity,android.graphics.Bitmap '
                                                              'bitmap){saved=bitmap;}public static void '
                                                              'copy(android.app.Activity '
                                                              'activity,android.graphics.Bitmap '
                                                              'bitmap){copied=bitmap;}}',
 'android/app/Activity.java': 'package android.app;public class Activity extends android.content.Context {public '
                              'boolean finishing,destroyed;public final android.view.Window window=new '
                              'android.view.Window();public boolean isFinishing(){return finishing;}public boolean '
                              'isDestroyed(){return destroyed;}public android.view.Window getWindow(){return window;}}',
 'android/app/AlertDialog.java': 'package android.app;public class AlertDialog {public static int opens;public static '
                                 'AlertDialog last;public android.content.DialogInterface.OnClickListener '
                                 'listener;public String[] choices;public void show(){opens++;last=this;}public static '
                                 'class Builder {private final AlertDialog dialog=new AlertDialog();public '
                                 'Builder(Activity a){}public Builder setTitle(String s){return this;}public Builder '
                                 'setItems(String[] items,android.content.DialogInterface.OnClickListener '
                                 'l){dialog.choices=items;dialog.listener=l;return this;}public Builder '
                                 'setNegativeButton(String s,Object l){return this;}public AlertDialog create(){return '
                                 'dialog;}}}',
 'android/content/DialogInterface.java': 'package android.content;public interface DialogInterface {interface '
                                         'OnClickListener {void onClick(DialogInterface dialog,int which);}}',
 'android/graphics/Rect.java': 'package android.graphics;public class Rect {public int left,top,right,bottom;public '
                               'void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public void '
                               'offset(int x,int y){left+=x;right+=x;top+=y;bottom+=y;}public boolean contains(int '
                               'x,int y){return x>=left&&x<right&&y>=top&&y<bottom;}public int width(){return '
                               'right-left;}public int height(){return bottom-top;}}',
 'android/graphics/Bitmap.java': 'package android.graphics;public class Bitmap {public enum Config {ARGB_8888}public '
                                 'int width,height;public boolean recycled;public Bitmap copy(Config c,boolean '
                                 'mutable){Bitmap b=new Bitmap();b.width=width;b.height=height;return b;}public int '
                                 'getWidth(){return width;}public int getHeight(){return height;}public boolean '
                                 'isRecycled(){return recycled;}public void recycle(){recycled=true;}}',
 'android/graphics/BitmapFactory.java': 'package android.graphics;public class BitmapFactory {public static class '
                                        'Options {public boolean inJustDecodeBounds;public int '
                                        'outWidth,outHeight,inSampleSize;}public static Bitmap decodeByteArray(byte[] '
                                        'b,int o,int n,Options '
                                        'options){options.outWidth=100;options.outHeight=100;return '
                                        'options.inJustDecodeBounds?null:new Bitmap();}}',
 'android/graphics/drawable/Drawable.java': 'package android.graphics.drawable;public class Drawable {}',
 'android/os/Build.java': 'package android.os;public class Build {public static class VERSION {public static int '
                          'SDK_INT=36;}}',
 'android/os/Handler.java': 'package android.os;public class Handler {private static final '
                            'java.util.Map<Runnable,Long> pending=new java.util.LinkedHashMap<>();public '
                            'Handler(Looper l){}public boolean post(Runnable r){r.run();return true;}public boolean '
                            'postDelayed(Runnable r,long delay){pending.put(r,SystemClock.now+delay);return '
                            'true;}public void removeCallbacks(Runnable r){pending.remove(r);}public static void '
                            'advance(long ms){SystemClock.now+=ms;for(Runnable r:new '
                            'java.util.ArrayList<>(pending.keySet()))if(pending.containsKey(r)&&pending.get(r)<=SystemClock.now){pending.remove(r);r.run();}}}',
 'android/view/ViewParent.java': 'package android.view;public interface ViewParent {}',
 'android/view/Window.java': 'package android.view;public class Window {public View decor;public View '
                             'getDecorView(){return decor;}}',
 'android/view/View.java': 'package android.view;public class View implements ViewParent {'
                           'public interface OnAttachStateChangeListener {void onViewAttachedToWindow(View view);void onViewDetachedFromWindow(View view);}private final java.util.List<OnAttachStateChangeListener> attachListeners=new java.util.ArrayList<>();public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){attachListeners.add(l);}public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){attachListeners.remove(l);}public void detach(){attached=false;for(OnAttachStateChangeListener l:new java.util.ArrayList<>(attachListeners))l.onViewDetachedFromWindow(this);}public int attachListenerCount(){return attachListeners.size();}public static final int '
                           'VISIBLE=0;public final android.content.Context context;public ViewParent parent;public '
                           'boolean attached=true,shown=true,focus=true,enabled=true;public int '
                           'width=64,height=64,x=10,y=20,cancels;public android.graphics.Rect visible;public final '
                           'Object nativeListener=new Object();public View(android.content.Context '
                           'c){context=c;}public android.content.Context getContext(){return context;}public boolean '
                           'isAttachedToWindow(){return attached;}public boolean isShown(){return shown;}public '
                           'boolean isEnabled(){return enabled;}public boolean hasWindowFocus(){return focus;}public '
                           'ViewParent getParent(){return parent;}public View getRootView(){return parent instanceof '
                           'View?((View)parent).getRootView():this;}public int getWidth(){return width;}public int '
                           'getHeight(){return height;}public void getLocationOnScreen(int[] '
                           'out){out[0]=x;out[1]=y;}public boolean getLocalVisibleRect(android.graphics.Rect '
                           'out){if(!shown||width<=0||height<=0)return '
                           'false;if(visible==null)out.set(0,0,width,height);else '
                           'out.set(visible.left,visible.top,visible.right,visible.bottom);return '
                           'out.width()>0&&out.height()>0;}public boolean dispatchTouchEvent(MotionEvent '
                           'event){if(app.afterglow.extension.menus.AvatarPhotoActions.onTouch(this,event))return '
                           'true;if(event.getActionMasked()==MotionEvent.ACTION_CANCEL)cancels++;return false;}}',
 'android/view/ViewGroup.java': 'package android.view;public class ViewGroup extends View {public final '
                                'java.util.List<View> children=new java.util.ArrayList<>();public '
                                'ViewGroup(android.content.Context c){super(c);}public void addView(View '
                                'v){children.add(v);v.parent=this;}public int getChildCount(){return '
                                'children.size();}public View getChildAt(int i){return children.get(i);}}',
 'android/view/MotionEvent.java': 'package android.view;public class MotionEvent {public static final int '
                                  'ACTION_DOWN=0,ACTION_UP=1,ACTION_MOVE=2,ACTION_CANCEL=3,ACTION_POINTER_DOWN=5;public '
                                  'int action,pointers=1;public long down;public float x,y,rawX,rawY;public '
                                  'MotionEvent(long down,int a,float x,float '
                                  'y){this.down=down;action=a;this.x=rawX=x;this.y=rawY=y;}public int '
                                  'getActionMasked(){return action;}public long getDownTime(){return down;}public int '
                                  'getPointerCount(){return pointers;}public float getRawX(){return rawX;}public float '
                                  'getRawY(){return rawY;}public static MotionEvent obtain(long down,long now,int '
                                  'a,float x,float y,int meta){return new MotionEvent(down,a,x,y);}public void '
                                  'recycle(){}}',
 'android/widget/ImageView.java': 'package android.widget;public class ImageView extends android.view.View {public '
                                  'android.graphics.drawable.Drawable drawable=new '
                                  'android.graphics.drawable.Drawable();public ImageView(android.content.Context '
                                  'c){super(c);}public android.graphics.drawable.Drawable getDrawable(){return '
                                  'drawable;}}',
 'app/afterglow/extension/Afterglow.java': 'package app.afterglow.extension;public class Afterglow {public static '
                                           'android.app.Activity activity;public static android.app.Activity '
                                           'mainActivity(){return activity;}public static void error(String '
                                           'tag,Throwable error){throw new AssertionError(tag,error);}}',
 'app/afterglow/extension/settings/AfterglowPrefs.java': 'package app.afterglow.extension.settings;public class '
                                                         'AfterglowPrefs {public static boolean '
                                                         'avatar=true,post=true;public static boolean getBool(String '
                                                         'key){return '
                                                         'key.equals("saveProfilePhoto")?avatar:key.equals("postManager")&&post;}}',
 'app/afterglow/extension/navigation/MorpheFallbackAlbumCovers.java': 'package '
                                                                      'app.afterglow.extension.navigation;public class '
                                                                      'MorpheFallbackAlbumCovers {public static String '
                                                                      'overrideImageURL(String url){return url;}}'}
with tempfile.TemporaryDirectory(prefix="afterglow-avatar-") as output:
    files=[SOURCE/"AvatarPhotoPolicy.java", SOURCE/"AvatarPhotoSource.java", ROOT/"tools/jvm/AvatarPhotoTest.java"]
    subprocess.run(["javac", "-encoding", "UTF-8", "-d", output, *map(str, files)], check=True)
    subprocess.run(["java", "-cp", output, "AvatarPhotoTest"], check=True, timeout=30)
    stubs=[]
    for name, body in STUBS.items():
        path=Path(output)/"stubs"/name
        path.parent.mkdir(parents=True,exist_ok=True)
        path.write_text(body+"\n")
        stubs.append(path)
    files=stubs+[SOURCE/"AvatarPhotoActions.java", SOURCE/"LongPressPostImageActions.java",ROOT/"tools/jvm/LongPressPostImageTest.java",SOURCE.parent/"litho/LithoContext.java",ROOT/"tools/jvm/AvatarPhotoGestureTest.java"]
    subprocess.run(["javac", "-encoding", "UTF-8", "-cp", output, "-d", output, *map(str, files)], check=True)
    subprocess.run(["java", "-cp", output, "app.afterglow.extension.menus.AvatarPhotoGestureTest"], check=True, timeout=30)
    subprocess.run(["java", "-cp", output, "app.afterglow.extension.menus.LongPressPostImageTest"], check=True, timeout=30)
