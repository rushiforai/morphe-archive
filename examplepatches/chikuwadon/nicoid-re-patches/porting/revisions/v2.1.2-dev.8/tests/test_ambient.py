"""Run the production ambient compositor against lightweight Canvas doubles."""
from pathlib import Path
import subprocess
from tempfile import TemporaryDirectory

source = Path(__file__).resolve().parents[1] / 'AmbientCard217.java'
workspace = TemporaryDirectory(prefix='nicoid-ambient-test-')
root = Path(workspace.name)
packages={
'android.graphics': {
'Rect': 'public int left,top,right,bottom; public void set(Rect r){set(r.left,r.top,r.right,r.bottom);} public void set(int l,int t,int r,int b){left=l;top=t;right=r;bottom=b;} public void offset(int x,int y){set(left+x,top+y,right+x,bottom+y);} public boolean isEmpty(){return right<=left||bottom<=top;}',
'Outline':'',
'Shader': 'public enum TileMode {CLAMP}',
'LinearGradient': 'extends Shader | public static int made; public LinearGradient(float x,float y,float x2,float y2,int[] colors,float[] p,TileMode t){made++;}',
'ComposeShader': 'extends Shader | public ComposeShader(Shader a,Shader b,PorterDuff.Mode m){}',
'PorterDuff':'public enum Mode {SRC_ATOP,DST_OVER,DST_IN}',
'PorterDuffXfermode':'public final PorterDuff.Mode mode; public PorterDuffXfermode(PorterDuff.Mode m){mode=m;}',
'Paint':'public PorterDuffXfermode mode; public void setXfermode(PorterDuffXfermode m){mode=m;} public void setShader(Shader s){} public void setAlpha(int a){}',
'Canvas':'''public enum EdgeType {AA} public boolean reject;
public int layers,depth,base;
public final java.util.List<String> blends=new java.util.ArrayList<>();
public int saveLayer(float l,float t,float r,float b,Paint p){layers++;return save();}
public int save(){return depth++;} public void restoreToCount(int i){depth=i;}
public void clipRect(Rect r){} public float translatedX; public void translate(float x,float y){translatedX=x;}
public boolean quickReject(float l,float t,float r,float b,EdgeType e){return reject;}
public void drawRect(float l,float t,float r,float b,Paint p){blends.add(p.mode==null?"PLAIN":p.mode.mode.name());}'''
},
'android.graphics.drawable': {
'Drawable': 'public void draw(android.graphics.Canvas c){c.base++;} public void getOutline(android.graphics.Outline o){} public int invalidations; public void invalidateSelf(){invalidations++;} public Object callback; public void setCallback(Object c){callback=c;} public android.graphics.Rect getBounds(){return bounds;} public final android.graphics.Rect bounds=new android.graphics.Rect();',
'ColorDrawable':'extends Drawable | public int color; public ColorDrawable(int c){color=c;} public void setColor(int c){color=c;}',
'LayerDrawable':'extends Drawable | private final Drawable[] layers; public LayerDrawable(Drawable[] d){layers=d;} public int getNumberOfLayers(){return layers.length;} public Drawable getDrawable(int i){return layers[i];} public void setDrawable(int i,Drawable d){layers[i]=d;} public void draw(android.graphics.Canvas c){for(Drawable d:layers)d.draw(c);}'
},
'android.view': {
'ViewParent': 'interface | ViewParent getParent();',
'ViewTreeObserver': '''public interface OnScrollChangedListener{void onScrollChanged();} public interface OnGlobalLayoutListener{void onGlobalLayout();} public interface OnPreDrawListener{boolean onPreDraw();}
public boolean isAlive(){return true;} public OnScrollChangedListener scroll; public void addOnScrollChangedListener(OnScrollChangedListener l){scroll=l;} public void removeOnScrollChangedListener(OnScrollChangedListener l){scroll=null;}
public OnGlobalLayoutListener layout; public void addOnGlobalLayoutListener(OnGlobalLayoutListener l){layout=l;} public void removeOnGlobalLayoutListener(OnGlobalLayoutListener l){layout=null;}
public void addOnPreDrawListener(OnPreDrawListener l){} public void removeOnPreDrawListener(OnPreDrawListener l){}''',
'View':'''public int x,y; public int getLeft(){return x;} public int getRight(){return x+getWidth();}
public void getLocationOnScreen(int[] p){p[0]=x;p[1]=y;} public boolean isShown(){return true;}
public boolean isAttachedToWindow(){return true;} public int getWidth(){return 100;}
public int getHeight(){return 100;} public Context getContext(){return new Context();}
public static class Context {public String getPackageName(){return "test";}}
public static class Resources {public int getIdentifier(String n,String t,String p){return n.equals("videomenulist")?1:0;}}
public Resources getResources(){return new Resources();} public View menu; public View findViewById(int id){return id==1?menu:null;}
public android.graphics.drawable.Drawable background; public android.graphics.drawable.Drawable getBackground(){return background;} public void setBackground(android.graphics.drawable.Drawable d){if(background!=null)background.setCallback(null);background=d;if(d!=null)d.setCallback(this);} public void setBackgroundColor(int c){background=new android.graphics.drawable.ColorDrawable(c);}
public int getPaddingLeft(){return 0;} public int getPaddingTop(){return 0;} public int getPaddingRight(){return 0;} public int getPaddingBottom(){return 0;}
public void setPadding(int l,int t,int r,int b){} public void invalidate(){} public ViewTreeObserver tree=new ViewTreeObserver(); public ViewTreeObserver getViewTreeObserver(){return tree;}
public boolean visible=true; public boolean getGlobalVisibleRect(android.graphics.Rect r){r.set(0,0,100,100);return visible;} public ViewParent parent; public ViewParent getParent(){return parent;}''',
'ViewGroup':'extends View implements ViewParent | public java.util.List<View> children=new java.util.ArrayList<>(); public void addView(View v){children.add(v);v.parent=this;} public void removeView(View v){children.remove(v);v.parent=null;} public int getChildCount(){return children.size();} public View getChildAt(int n){return children.get(n);}',
'SurfaceView':'extends View |','TextureView':'extends View |'
},
'android.preference':{'PreferenceManager':'public static PreferenceManager getDefaultSharedPreferences(Object c){return new PreferenceManager();} public boolean getBoolean(String n,boolean b){return b;}'},
'android.util':{'Log':'public static void w(String t,String m,Throwable e){throw new AssertionError(e);}'},
'android.webkit':{'WebView':'extends android.view.View |'},
'android.widget':{'AdapterView':'extends android.view.ViewGroup |','Button':'extends android.view.View |','EditText':'extends android.view.View |'}
}
for pkg,classes in packages.items():
    target=root.joinpath(*pkg.split('.'))
    target.mkdir(parents=True,exist_ok=True)
    for name, body in classes.items():
        declaration, sep, rest=body.partition(' |')
        kind='interface' if declaration.strip()=='interface' else 'class'
        inheritance=declaration.strip() if declaration.startswith('extends') else ''
        (target/(name+'.java')).write_text(f'package {pkg}; public {kind} {name} {inheritance} {{ {rest if sep else body} }}')
(root/'Verify.java').write_text('''
import java.lang.reflect.*;
import java.util.*;
import android.graphics.*;
import android.graphics.drawable.*;
import android.view.*;

public class Verify {
    static void check(boolean result){if(!result)throw new AssertionError();}
    public static void main(String[] args)throws Exception{
        Class<?> panelType=Class.forName("e.e.a.AmbientCard217$Panel");
        Constructor<?> make=panelType.getDeclaredConstructor(); make.setAccessible(true);
        Object panel=make.newInstance();
        Field field=panelType.getDeclaredField("picture");field.setAccessible(true);
        Rect picture=(Rect)field.get(panel);picture.set(0,0,100,100);
        Method configure=panelType.getDeclaredMethod("configure",int[].class,boolean.class,int.class,int.class);
        configure.setAccessible(true);
        int[] colors=new int[16];
        check((boolean)configure.invoke(panel,colors,false,100,190));
        for(int i=0;i<1000;i++)check(!(boolean)configure.invoke(panel,colors,false,100,210));
        check(LinearGradient.made==2);
        check((boolean)configure.invoke(panel,colors,false,100,150));
        check(LinearGradient.made==2);
        colors[5]=0x330011;
        check((boolean)configure.invoke(panel,colors,false,100,150));
        check(LinearGradient.made==4);
        Class<?> cardType=Class.forName("e.e.a.AmbientCard217$Card");
        Constructor<?> cardCtor=cardType.getDeclaredConstructor(View.class,panelType,Drawable.class,boolean.class);
        cardCtor.setAccessible(true);
        View view=new View();view.y=90;
        Canvas c=new Canvas();
        Drawable card=(Drawable)cardCtor.newInstance(view,panel,new ColorDrawable(0xff000000),true);
        card.getBounds().set(0,0,100,30);card.draw(c);
        check(c.layers==1&&c.depth==0&&c.base==1&&c.blends.equals(Arrays.asList("SRC_ATOP","DST_OVER")));
        c=new Canvas();view.y=205;card.draw(c);
        check(c.layers==0&&c.base==1&&c.blends.isEmpty());
        c=new Canvas();c.reject=true;view.y=90;card.draw(c);
        check(c.layers==0&&c.base==1&&c.blends.isEmpty());
        Drawable transparent=(Drawable)cardCtor.newInstance(view,panel,null,true);
        transparent.getBounds().set(0,0,100,30);c=new Canvas();transparent.draw(c);
        check(c.layers==0&&c.depth==0&&c.blends.equals(Arrays.asList("PLAIN")));
        check((boolean)configure.invoke(panel,colors,true,100,150));
        c=new Canvas();view.x=95;view.y=0;card.draw(c);
        check(c.layers==1&&c.depth==0);
        view.setBackground(card);
        e.e.a.AmbientCard217.themedColor(view, 0xff123456);
        check(view.getBackground() == card);
        check(((ColorDrawable)((LayerDrawable)card).getDrawable(0)).color == 0xff123456);
        check(e.e.a.AmbientCard217.original(card) == ((LayerDrawable)card).getDrawable(0));
        View plain=new View();
        e.e.a.AmbientCard217.themedColor(plain, 0xff222222);
        check(((ColorDrawable)plain.getBackground()).color == 0xff222222);
        // Swipe to Related and return to a relocated Menu with rebuilt rows.
        configure.invoke(panel,colors,false,100,150);
        ViewGroup pager=new ViewGroup();
        ViewGroup menu=new ViewGroup(); pager.addView(menu);
        ViewGroup related=new ViewGroup(); pager.addView(related);
        related.visible=false;
        ViewGroup actions=new ViewGroup(); menu.menu=actions; menu.addView(actions);
        View first=new View(); first.setBackground(new ColorDrawable(0xff111111)); actions.addView(first);
        Method bind=panelType.getDeclaredMethod("bind",ViewGroup.class);bind.setAccessible(true);bind.invoke(panel,pager);
        Method before=panelType.getDeclaredMethod("beforeDraw");before.setAccessible(true);before.invoke(panel);
        Drawable menuGlow=menu.getBackground();
        check(menuGlow!=null && e.e.a.AmbientCard217.original(menuGlow)==null);
        check(e.e.a.AmbientCard217.original(first.getBackground()).callback==first.getBackground());
        menu.visible=false; first.visible=false; related.visible=true;
        pager.tree.scroll.onScrollChanged();before.invoke(panel);
        View replacement=new View(); replacement.setBackground(new ColorDrawable(0xff222222));
        actions.removeView(first);actions.addView(replacement);
        menu.visible=true; related.visible=false; replacement.x=20; replacement.y=90;
        pager.tree.layout.onGlobalLayout();before.invoke(panel);
        check(menu.getBackground()==menuGlow);
        Drawable row=replacement.getBackground();
        row.getBounds().set(0,0,100,30);c=new Canvas();row.draw(c);
        check(c.translatedX==-20 && !c.blends.isEmpty());
        int beforeMove=row.invalidations;
        replacement.x=0;
        pager.tree.scroll.onScrollChanged();before.invoke(panel);
        c=new Canvas();row.draw(c);
        check(row.invalidations>beforeMove && c.translatedX==0);
        Method unbind=panelType.getDeclaredMethod("unbind");unbind.setAccessible(true);
        unbind.invoke(panel);
        check(menu.getBackground()==null && replacement.getBackground() instanceof ColorDrawable);
        check(replacement.getBackground().callback==replacement);
        check(pager.tree.scroll==null && pager.tree.layout==null);
        System.out.println("PASS: menu and related-page scroll, theme, drawable callbacks, and cleanup");
    }
}''')
out=root/'classes'
out.mkdir(exist_ok=True)
subprocess.run(['javac','--release','8','-d',out,*root.rglob('*.java'),source],check=True)
subprocess.run(['java','-cp',out,'Verify'],check=True)
