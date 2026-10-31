"""Actual window coordinator across API, keyboard, theme and side-navigation state boundaries."""
from pathlib import Path
import hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision32-navigation-r1';w.mkdir(exist_ok=False)
stubs={
'android/os/Build.java':'package android.os;public class Build{public static class VERSION{public static int SDK_INT=36;}}',
'android/graphics/Color.java':'package android.graphics;public class Color{public static final int TRANSPARENT=0;}',
'android/graphics/Insets.java':'package android.graphics;public class Insets{public final int left,right,bottom;public Insets(int l,int r,int b){left=l;right=r;bottom=b;}}',
'android/content/res/Resources.java':'package android.content.res;public class Resources{public String getResourceEntryName(int id){return id==1?"player_bottom_ui_container":"other";}}',
'android/view/WindowInsets.java':'''package android.view;public class WindowInsets{public int left,right,bottom=48,keyboard;public static class Type{public static int navigationBars(){return 1;}}public android.graphics.Insets getInsets(int type){return new android.graphics.Insets(left,right,bottom);}public int getSystemWindowInsetLeft(){return left;}public int getSystemWindowInsetRight(){return right;}public int getSystemWindowInsetBottom(){return Math.max(keyboard,bottom);}public int getStableInsetLeft(){return left;}public int getStableInsetRight(){return right;}public int getStableInsetBottom(){return bottom;}}''',
'android/view/ViewTreeObserver.java':'''package android.view;public class ViewTreeObserver{public interface OnGlobalLayoutListener{void onGlobalLayout();}public interface OnWindowFocusChangeListener{void onWindowFocusChanged(boolean focus);}public void addOnGlobalLayoutListener(OnGlobalLayoutListener l){}public void removeOnGlobalLayoutListener(OnGlobalLayoutListener l){}public void addOnWindowFocusChangeListener(OnWindowFocusChangeListener l){}public void removeOnWindowFocusChangeListener(OnWindowFocusChangeListener l){}public boolean isAlive(){return true;}}''',
'android/view/View.java':'''package android.view;public class View{public static final int NO_ID=-1,SYSTEM_UI_FLAG_LAYOUT_STABLE=256,SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION=512;public int flags=24,id=-1,padWrites;public int[] padding={3,18,5,4};public WindowInsets insets=new WindowInsets();public int getId(){return id;}public android.content.res.Resources getResources(){return new android.content.res.Resources();}public int getPaddingLeft(){return padding[0];}public int getPaddingTop(){return padding[1];}public int getPaddingRight(){return padding[2];}public int getPaddingBottom(){return padding[3];}public void setPadding(int l,int t,int r,int b){padding=new int[]{l,t,r,b};padWrites++;}public boolean isAttachedToWindow(){return true;}public int getSystemUiVisibility(){return flags;}public void setSystemUiVisibility(int flags){this.flags=flags;}public ViewTreeObserver getViewTreeObserver(){return new ViewTreeObserver();}public void post(Runnable r){r.run();}public void removeCallbacks(Runnable r){}public WindowInsets getRootWindowInsets(){return insets;}}''',
'android/view/ViewGroup.java':'''package android.view;public class ViewGroup extends View{public static class LayoutParams{public static final int MATCH_PARENT=-1;public int width=-1,height=-1;}public final java.util.List<View> children=new java.util.ArrayList<>();public boolean clip=true;public int getChildCount(){return children.size();}public View getChildAt(int i){return children.get(i);}public boolean getClipToPadding(){return clip;}public void setClipToPadding(boolean b){clip=b;}}''',
'android/view/Window.java':'''package android.view;public class Window{public ViewGroup decor=new ViewGroup();public int color=0xff112233,divider=0xff223344,writes;public boolean contrast=true;public ViewGroup.LayoutParams attrs=new ViewGroup.LayoutParams();public View getDecorView(){return decor;}public int getNavigationBarColor(){return color;}public int getNavigationBarDividerColor(){return divider;}public boolean isNavigationBarContrastEnforced(){return contrast;}public void setNavigationBarColor(int c){color=c;writes++;}public void setNavigationBarDividerColor(int c){divider=c;writes++;}public void setNavigationBarContrastEnforced(boolean c){contrast=c;writes++;}public ViewGroup.LayoutParams getAttributes(){return attrs;}}''',
'android/widget/AbsListView.java':'package android.widget;public class AbsListView extends android.view.ViewGroup{}',
'android/widget/ScrollView.java':'package android.widget;public class ScrollView extends android.view.ViewGroup{}',
'android/widget/HorizontalScrollView.java':'package android.widget;public class HorizontalScrollView extends ScrollView{}',
'app/bdcrusher/ytmusic/common/NavCheck.java':r'''package app.bdcrusher.ytmusic.common;
import android.view.*;import android.widget.*;public class NavCheck{
 static int checks;static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS: "+why);}
 public static void main(String[] args)throws Exception{
  for(int api:new int[]{26,28,29,30,36}){
   android.os.Build.VERSION.SDK_INT=api;Window window=new Window();ScrollView list=new ScrollView();View controls=new View();controls.id=1;window.decor.children.add(list);window.decor.children.add(controls);int originalFlags=window.decor.flags;
   NavigationWindow owner=new NavigationWindow(window);owner.start();
   check(window.color==0&&(api<28||window.divider==0)&&(api<29||!window.contrast),"transparent native bar/divider/scrim on API"+api);
   check((window.decor.flags&originalFlags)==originalFlags&&(window.decor.flags&512)!=0,"bottom edge extends while native top/icon flags survive on API"+api);
   check(list.getPaddingBottom()==48&&controls.getPaddingBottom()==48&&!list.clip,"lists and player controls receive safe insets on API"+api);
   int writes=window.writes,paddingWrites=list.padWrites;for(int i=0;i<100;i++)owner.update();check(window.writes==writes&&list.padWrites==paddingWrites,"unchanged layout causes no repeated native writes on API"+api);
   window.decor.insets.keyboard=600;owner.update();check(list.getPaddingBottom()==48&&list.getPaddingTop()==18,"keyboard does not turn into navigation padding on API"+api);
   window.decor.insets.bottom=0;window.decor.insets.right=42;window.decor.insets.keyboard=0;owner.update();check(list.getPaddingBottom()==4&&list.getPaddingRight()==42,"landscape side navigation restores bottom and protects side on API"+api);
   list.setPadding(3,24,42,20);owner.update();check(list.getPaddingTop()==24&&list.getPaddingBottom()==20,"native padding/theme changes remain intact on API"+api);
   window.color=0xff556677;window.divider=0xffabcdef;window.contrast=true;window.decor.flags|=64;owner.update();check(window.color==0&&(window.decor.flags&64)!=0,"theme updates keep transparent navigation and native icon state on API"+api);
   owner.close();check(window.color==0xff556677&&list.getPaddingBottom()==20&&list.getPaddingTop()==24&&list.clip,"release restores latest native colors/padding/clipping on API"+api);
   check((window.decor.flags&64)!=0&&(window.decor.flags&768)==(originalFlags&768),"release removes only owned layout bits on API"+api);
  }
  Window dialog=new Window();dialog.attrs.width=300;dialog.attrs.height=400;ScrollView list=new ScrollView();dialog.decor.children.add(list);NavigationWindow owner=new NavigationWindow(dialog);owner.start();check(dialog.color==0&&list.getPaddingBottom()==4&&list.clip,"floating dialog geometry and padding are untouched");owner.close();
  java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),"{\"checks\":"+checks+",\"passed\":true,\"androidWindowStateSimulated\":true,\"samsungPhoneVerified\":false}");
 }
}'''
}
files=[]
for n,s in stubs.items():
 p=w/'stubs'/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s,encoding='utf-8');files.append(p)
actual=h/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/common/NavigationWindow.java';files.append(actual);java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=w/'classes';out.mkdir();env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(out),*map(str,files)],cwd=w,env=env,check=True)
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(h/'BuildCache/Home'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',str(out),'app.bdcrusher.ytmusic.common.NavCheck',str(w/'verification.json')],cwd=w,env=env,check=True)
d=json.loads((w/'verification.json').read_text(encoding='utf-8'));d['sourceSha256']=hashlib.sha256(actual.read_bytes()).hexdigest();(w/'verification.json').write_text(json.dumps(d,indent=2)+'\n',encoding='utf-8')
