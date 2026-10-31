"""Actual navigation/cover/settings code with simulated Android lifecycle and drawable boundaries."""
from pathlib import Path
import hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision38/native';w.mkdir(exist_ok=False)
s=json.loads((h/'Verification/revision34-native-stubs.json').read_text(encoding='utf-8'))
s['android/graphics/PixelFormat.java']='package android.graphics;public class PixelFormat{public static int TRANSPARENT=-3,OPAQUE=-1;}'
s['android/graphics/drawable/Drawable.java']='package android.graphics.drawable;public class Drawable{public int color,alpha=255;public Drawable(){}public Drawable(int c){color=c;}public int getAlpha(){return alpha;}public int getOpacity(){return alpha==0? -3:-1;}public Drawable mutate(){return this;}public void setTintList(android.content.res.ColorStateList t){color=t.getDefaultColor();}private final ConstantState state=new ConstantState(this);public ConstantState getConstantState(){return state;}public static class ConstantState{final Drawable source;ConstantState(Drawable d){source=d;}public Drawable newDrawable(android.content.res.Resources r){return new Drawable(source.color);}}}'
s['android/graphics/drawable/ColorDrawable.java']='package android.graphics.drawable;public class ColorDrawable extends Drawable{public ColorDrawable(int c){super(c);}public int getColor(){return color;}}'
s['android/graphics/drawable/GradientDrawable.java']='package android.graphics.drawable;public class GradientDrawable extends Drawable{public android.content.res.ColorStateList getColor(){return null;}public int[] getColors(){return null;}}'
s['android/content/res/ColorStateList.java']='package android.content.res;public class ColorStateList{final int c;public ColorStateList(int c){this.c=c;}public int getDefaultColor(){return c;}public int getColorForState(int[] s,int d){return c;}}'
s['android/view/View.java']=s['android/view/View.java'].replace('public int getId()', 'public android.graphics.drawable.Drawable background;public android.content.res.ColorStateList tint;public android.graphics.drawable.Drawable getBackground(){return background;}public void setBackground(android.graphics.drawable.Drawable d){background=d;}public android.content.res.ColorStateList getBackgroundTintList(){return tint;}public int[] getDrawableState(){return new int[0];}public int getId()')
extra='''
ViewGroup foreground=new ViewGroup();foreground.parent=window.decor;foreground.background=new android.graphics.drawable.ColorDrawable(0xff182626);ViewGroup transparent=new ViewGroup();transparent.parent=foreground;LyricsViewport themed=new LyricsViewport(transparent,window.decor);themed.refreshBackground();check(transparent.background!=foreground.background&&transparent.background.color==0xff182626,"transparent body inherits foreground sheet, not player color");var inherited=transparent.background;themed.refreshBackground();check(transparent.background==inherited,"unchanged native background does not allocate another drawable");foreground.tint=new android.content.res.ColorStateList(0xff384848);themed.refreshBackground();check(transparent.background.color==0xff384848,"sheet tint change updates actual body background");themed.close();check(transparent.background==null,"owned inherited background restored on close");transparent.background=new android.graphics.drawable.ColorDrawable(0xffabcdef);themed.refreshBackground();check(transparent.background.color==0xffabcdef,"native-owned opaque background preserved");themed.close();check(transparent.background.color==0xffabcdef,"native-owned background survives release");
'''
s['app/bdcrusher/ytmusic/common/NavCheck.java']=s['app/bdcrusher/ytmusic/common/NavCheck.java'].replace('java.nio.file.Files.writeString',extra+'java.nio.file.Files.writeString')
files=[]
for name,text in s.items():
 p=w/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf-8');files.append(p)
root=h/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic'
actual=[root/'common'/n for n in ['NavigationWindow.java','LyricsViewport.java','PersonalSettings.java']]+[root/'shaders/AnimatedCoverSurface.java'];files+=actual
java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=w/'classes';out.mkdir();env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(out),*map(str,files)],cwd=w,env=env,check=True)
results={}
for key,main in [('navigation','app.bdcrusher.ytmusic.common.NavCheck'),('cover','app.bdcrusher.ytmusic.shaders.CoverCheck')]:
 path=w/(key+'.json');subprocess.run([str(java/'java.exe'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',str(out),main,str(path)],cwd=w,env=env,check=True);results[key]=json.loads(path.read_text(encoding='utf-8'))
report={'passed':True,'checks':sum(x['checks'] for x in results.values()),'results':results,'androidBoundariesSimulated':True,'phoneVerified':False,'sourceSha256':{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual}}
(w/'verification.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8');print(json.dumps({'passed':True,'checks':report['checks']}))
