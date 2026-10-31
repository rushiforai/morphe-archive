"""Exercise actual bar-helper Java with explicit Android state/drawing simulations."""
from pathlib import Path
import hashlib,json,os,subprocess
home=Path(__file__).resolve().parents[1];work=home/'Verification/revision27-bars-final';assert not work.exists();work.mkdir()
stubs={
'android/os/Build.java':'''package android.os;public class Build{public static class VERSION{public static int SDK_INT=36;}}''',
'android/graphics/Rect.java':'''package android.graphics;public class Rect{public int left,top,right,bottom;public Rect(){}public Rect(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;}public boolean isEmpty(){return right<=left||bottom<=top;}public int centerX(){return (left+right)/2;}}''',
'android/graphics/Color.java':'''package android.graphics;public class Color{public static int TRANSPARENT=0;public static int alpha(int c){return c>>>24;}public static int red(int c){return c>>16&255;}public static int green(int c){return c>>8&255;}public static int blue(int c){return c&255;}}''',
'android/graphics/Insets.java':'''package android.graphics;public class Insets{public int left,right,bottom;public Insets(int l,int r,int b){left=l;right=r;bottom=b;}}''',
'android/graphics/Bitmap.java':'''package android.graphics;public class Bitmap{public int pixel;public static int allocations;public static class Config{public static Config ARGB_8888=new Config();}public static Bitmap createBitmap(int w,int h,Config c){allocations++;return new Bitmap();}public int getPixel(int x,int y){return pixel;}public void recycle(){}public void eraseColor(int c){pixel=c;}}''',
'android/graphics/Canvas.java':'''package android.graphics;public class Canvas{public Bitmap bitmap;public Canvas(Bitmap b){bitmap=b;}public void translate(float x,float y){}public int save(){return 1;}public void restoreToCount(int n){}public void drawColor(int color){bitmap.pixel=color;}}''',
'android/graphics/drawable/Drawable.java':'''package android.graphics.drawable;public class Drawable{protected android.graphics.Rect bounds=new android.graphics.Rect(0,0,400,952);public android.graphics.Rect getBounds(){return bounds;}public void setBounds(android.graphics.Rect b){bounds=b;}public void draw(android.graphics.Canvas c){}}''',
'android/graphics/drawable/ColorDrawable.java':'''package android.graphics.drawable;public class ColorDrawable extends Drawable{public int color;public ColorDrawable(){}public ColorDrawable(int c){color=c;}public int getColor(){return color;}public void setColor(int c){color=c;}public void draw(android.graphics.Canvas canvas){canvas.drawColor(color);}}''',
'android/view/WindowInsets.java':'''package android.view;public class WindowInsets{public android.graphics.Insets nav=new android.graphics.Insets(0,0,48);public static class Type{public static int navigationBars(){return 1;}}public android.graphics.Insets getInsets(int type){return nav;}public int getSystemWindowInsetBottom(){return nav.bottom;}public int getStableInsetBottom(){return nav.bottom;}public int getSystemWindowInsetLeft(){return nav.left;}public int getStableInsetLeft(){return nav.left;}public int getSystemWindowInsetRight(){return nav.right;}public int getStableInsetRight(){return nav.right;}}''',
'android/view/WindowInsetsController.java':'''package android.view;public class WindowInsetsController{public static int APPEARANCE_LIGHT_NAVIGATION_BARS=16;public int appearance=32;public int getSystemBarsAppearance(){return appearance;}public void setSystemBarsAppearance(int value,int mask){appearance=appearance&~mask|value&mask;}}''',
'android/view/ViewOverlay.java':'''package android.view;public class ViewOverlay{public java.util.ArrayList<android.graphics.drawable.Drawable> drawables=new java.util.ArrayList<>();public void add(android.graphics.drawable.Drawable d){drawables.add(d);}public void remove(android.graphics.drawable.Drawable d){drawables.remove(d);}}''',
'android/view/View.java':'''package android.view;public class View{public static int SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR=16;public Object parent;public boolean shown=true,focus=true;public int flags=64,width=400,height=1000;public android.graphics.drawable.Drawable background;public ViewOverlay overlay=new ViewOverlay();public WindowInsets insets=new WindowInsets();public Object getParent(){return parent;}public boolean isShown(){return shown;}public boolean hasWindowFocus(){return focus;}public android.graphics.drawable.Drawable getBackground(){return background;}public ViewOverlay getOverlay(){return overlay;}public WindowInsets getRootWindowInsets(){return insets;}public int getWidth(){return width;}public int getHeight(){return height;}public int getSystemUiVisibility(){return flags;}public void setSystemUiVisibility(int v){flags=v;}}''',
'android/view/Window.java':'''package android.view;public class Window{public int writes;public View decor=new View();public WindowInsetsController controller=new WindowInsetsController();public int color=0xff200b05,divider=0xff123456;public boolean contrast=true,ignoreColor;public View getDecorView(){return decor;}public int getNavigationBarColor(){return color;}public void setNavigationBarColor(int c){writes++;if(!ignoreColor)color=c;}public int getNavigationBarDividerColor(){return divider;}public void setNavigationBarDividerColor(int c){writes++;divider=c;}public boolean isNavigationBarContrastEnforced(){return contrast;}public void setNavigationBarContrastEnforced(boolean b){writes++;contrast=b;}public WindowInsetsController getInsetsController(){return controller;}}''',
'android/app/Activity.java':'''package android.app;public class Activity{public android.view.Window window=new android.view.Window();public boolean isFinishing(){return false;}public boolean isDestroyed(){return false;}public android.view.Window getWindow(){return window;}}''',
'app/morphe/extension/shared/Utils.java':'''package app.morphe.extension.shared;public class Utils{public static android.app.Activity activity=new android.app.Activity();public static android.app.Activity getActivity(){return activity;}}''',
'app/bdcrusher/ytmusic/lyrics/BarsCheck.java':r'''
package app.bdcrusher.ytmusic.lyrics;
import android.view.*;import android.app.Activity;import android.graphics.*;import android.graphics.drawable.*;import app.morphe.extension.shared.Utils;
public class BarsCheck{
 static int checks;static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS: "+why);}
 static ColorDrawable protection(Window w){return (ColorDrawable)w.decor.overlay.drawables.get(0);}
 public static void main(String[] args)throws Exception{
  Window w=Utils.activity.window;View body=new View(),view=new View();view.parent=body;body.background=new ColorDrawable(0xff410e0b);
  int original=w.color,appearance=w.controller.appearance;
  LyricsSystemBars.sync(view,true);check(w.color==0xff410e0b&&protection(w).color==0xff410e0b,"navigation background follows drawn Lyrics panel, not song color");
  int writes=w.writes,allocations=Bitmap.allocations;for(int n=0;n<100;n++)LyricsSystemBars.sync(view,true);check(w.writes==writes,"steady native follow performs no redundant navigation window writes");check(Bitmap.allocations==allocations,"steady native follow reuses its one-pixel sampler without bitmap allocation");
  Rect r=protection(w).getBounds();check(r.left==0&&r.top==952&&r.right==400&&r.bottom==1000,"protection covers only bottom navigation inset");
  check(!w.contrast&&w.divider==0,"three-button scrim and divider cannot darken panel color");
  check(w.controller.appearance==appearance,"dark panel retains white navigation icons and unrelated appearance bits");
  body.background=new ColorDrawable(0xfffafafa);LyricsSystemBars.sync(view,true);check((w.controller.appearance&16)!=0&&protection(w).color==0xfffafafa,"light panel gets matching background and dark navigation icons");
  w.controller.appearance|=64;LyricsSystemBars.release(view);check(w.color==original&&w.contrast&&w.divider==0xff123456,"close restores prior native navigation styling");
  check(w.decor.overlay.drawables.isEmpty()&&w.controller.appearance==(appearance|64),"close removes protection and preserves unrelated new window flags");
  body.background=new ColorDrawable(0xff410e0b);w.ignoreColor=true;w.color=0;LyricsSystemBars.sync(view,true);
  check(w.color==0&&protection(w).color==0xff410e0b,"edge-to-edge still matches panel when platform ignores navigation color setter");
  LyricsSystemBars.release(view);check(w.decor.overlay.drawables.isEmpty()&&w.color==0,"edge-to-edge close reveals native background without forcing old song color");w.ignoreColor=false;
  w.decor.insets.nav=new Insets(0,60,0);LyricsSystemBars.sync(view,true);r=protection(w).getBounds();check(r.left==340&&r.top==0&&r.right==400&&r.bottom==1000,"landscape side navigation uses side inset only");LyricsSystemBars.release(view);
  w.decor.insets.nav=new Insets(0,0,24);LyricsSystemBars.sync(view,true);check(protection(w).getBounds().top==976,"gesture-navigation protection uses its smaller actual inset");LyricsSystemBars.release(view);
  w.decor.insets.nav=new Insets(0,0,0);LyricsSystemBars.sync(view,true);check(w.decor.overlay.drawables.isEmpty(),"hidden system navigation adds no drawing");w.decor.insets.nav=new Insets(0,0,48);
  w.decor.focus=false;LyricsSystemBars.sync(view,true);check(w.decor.overlay.drawables.isEmpty(),"another window or settings dialog keeps native system-bar ownership");w.decor.focus=true;
  body.background=null;body.parent=new View();((View)body.parent).background=new ColorDrawable(0xff204040);LyricsSystemBars.sync(view,true);check(protection(w).color==0xff204040,"transparent content inherits native panel ancestor background");LyricsSystemBars.release(view);
  ((View)body.parent).background=null;LyricsSystemBars.sync(view,true);check(w.decor.overlay.drawables.isEmpty(),"unknown panel background does not fall back to song/global theme");
  body.background=new Drawable(){public void draw(Canvas canvas){canvas.drawColor(0xff123456);}};LyricsSystemBars.sync(view,true);check(protection(w).color==0xff123456,"custom native background is drawn rather than reading a raw untinted color");
  LyricsSystemBars.release(view);body.background=new ColorDrawable(0xff410e0b);LyricsSystemBars.sync(view,true);w.color=0xff335577;LyricsSystemBars.sync(view,true);LyricsSystemBars.release(view);check(w.color==0xff335577,"new native player theme update is preserved on close");
  android.os.Build.VERSION.SDK_INT=26;w.decor.flags=64;LyricsSystemBars.sync(view,true);check(w.color==0xff410e0b&&w.decor.flags==64,"API26 uses guarded legacy navigation APIs");LyricsSystemBars.release(view);check(w.decor.flags==64,"legacy close preserves unrelated system UI flags");
  android.os.Build.VERSION.SDK_INT=36;LyricsSystemBars.sync(view,true);View replacement=new View();replacement.parent=body;LyricsSystemBars.sync(replacement,true);LyricsSystemBars.release(view);check(w.decor.overlay.drawables.size()==1,"old renderer detachment cannot remove replacement renderer's protection");LyricsSystemBars.release(replacement);check(w.decor.overlay.drawables.isEmpty(),"replacement renderer releases its own navigation protection");
  Activity player=Utils.activity;Utils.activity=new Activity();Utils.activity.window.decor.token=new Object();LyricsSystemBars.sync(view,true);check(Utils.activity.window.decor.overlay.drawables.isEmpty(),"old Lyrics view cannot recolor a newly focused settings/activity window");Utils.activity=player;
  body.background=null;w.color=0xff234567;w.contrast=true;w.divider=0xff123456;int originalTransparent=w.color;int a=w.controller.appearance;
  LyricsSystemBars.sync(view,true,true);check(w.color==0&&w.decor.overlay.drawables.isEmpty(),"transparent navigation has zero alpha and no solid protection even without known panel color");
  check(!w.contrast&&w.divider==0&&w.controller.appearance==a,"transparent navigation removes contrast scrim while retaining native icon appearance");
  int tWrites=w.writes;for(int n=0;n<100;n++)LyricsSystemBars.sync(view,true,true);check(w.writes==tWrites,"transparent mode avoids repeated native writes");
  body.background=new ColorDrawable(0xfffafafa);LyricsSystemBars.sync(view,true,false);check(protection(w).color==0xfffafafa,"transparent mode can switch to panel matching");
  LyricsSystemBars.sync(view,true,true);check(w.color==0&&w.decor.overlay.drawables.isEmpty()&&w.controller.appearance==a,"switching back removes protection and restores native icon style");
  LyricsSystemBars.release(view);check(w.color==originalTransparent&&w.contrast&&w.divider==0xff123456,"transparent close restores exact prior native bar state");
  android.os.Build.VERSION.SDK_INT=26;LyricsSystemBars.sync(view,true,true);check(w.color==0&&w.decor.overlay.drawables.isEmpty(),"API26 transparent mode uses guarded APIs and no overlay");LyricsSystemBars.release(view);
  java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),"{\"passed\":true,\"checks\":"+checks+",\"androidStateAndDrawingSimulated\":true,\"phoneVerified\":false}");
 }
}
'''}
stubs['android/view/View.java']=stubs['android/view/View.java'].replace('public static int SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR=16;', 'public static int SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR=16;public static final Object commonToken=new Object();public Object token=commonToken;public Object getWindowToken(){return token;}')
files=[]
for name,content in stubs.items():
    p=work/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf-8');files.append(p)
src=home/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/lyrics/LyricsSystemBars.java';files.append(src)
classes=work/'classes';classes.mkdir();java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin')
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(home/'BuildCache/Temp'),TEMP=str(home/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(classes),*map(str,files)],env=env,cwd=work,check=True)
report=work/'verification.json'
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(home/'BuildCache/Home'),'-Djava.io.tmpdir='+str(home/'BuildCache/Temp'),'-cp',str(classes),'app.bdcrusher.ytmusic.lyrics.BarsCheck',str(report)],env=env,cwd=work,check=True)
d=json.loads(report.read_text(encoding='utf-8'));d['actualSourceSha256']=hashlib.sha256(src.read_bytes()).hexdigest();report.write_text(json.dumps(d,indent=2)+'\n',encoding='utf-8')

