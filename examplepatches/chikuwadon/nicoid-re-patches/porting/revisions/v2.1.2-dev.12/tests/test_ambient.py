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
'PixelFormat':'public static final int TRANSLUCENT=-3;',
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
public void clipRect(Rect r){} public float translatedX, paintedLeft, paintedRight; public void translate(float x,float y){translatedX=x;}
public boolean quickReject(float l,float t,float r,float b,EdgeType e){return reject;}
public void drawRect(float l,float t,float r,float b,Paint p){paintedLeft=l; paintedRight=r; blends.add(p.mode==null?"PLAIN":p.mode.mode.name());}'''
},
'android.graphics.drawable': {
'Drawable': 'public int getOpacity(){return -1;} public void draw(android.graphics.Canvas c){c.base++;} public void getOutline(android.graphics.Outline o){} public int invalidations; public void invalidateSelf(){invalidations++;} public Object callback; public void setCallback(Object c){callback=c;} public android.graphics.Rect getBounds(){return bounds;} public final android.graphics.Rect bounds=new android.graphics.Rect();',
'ColorDrawable':'extends Drawable | public int color; public ColorDrawable(int c){color=c;} public void setColor(int c){color=c;} public int getColor(){return color;}',
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
public Resources getResources(){return new Resources();} public View menu; public java.util.Map<Integer,View> ids=new java.util.HashMap<>();
public <T extends View> T findViewById(int id){return (T)ids.get(id);}
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
        Constructor<?> cardCtor=cardType.getDeclaredConstructor(View.class,panelType,Drawable.class,boolean.class,boolean.class);
        cardCtor.setAccessible(true);
        View view=new View();view.y=90;
        Canvas c=new Canvas();
        Drawable card=(Drawable)cardCtor.newInstance(view,panel,new ColorDrawable(0xff000000),true,false);
        card.getBounds().set(0,0,100,30);card.draw(c);
        check(c.layers==1&&c.depth==0&&c.base==1&&c.blends.equals(Arrays.asList("SRC_ATOP","DST_OVER")));
        c=new Canvas();view.y=205;card.draw(c);
        check(c.layers==0&&c.base==1&&c.blends.isEmpty());
        c=new Canvas();c.reject=true;view.y=90;card.draw(c);
        check(c.layers==0&&c.base==1&&c.blends.isEmpty());
        Drawable transparent=(Drawable)cardCtor.newInstance(view,panel,null,true,false);
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
        ViewGroup comments=new ViewGroup(); pager.addView(comments); comments.visible=false;
        ViewGroup actions=new ViewGroup(); menu.menu=actions; menu.addView(actions);
        View first=new View(); first.setBackground(new ColorDrawable(0xff111111)); actions.addView(first);
        Method bind=panelType.getDeclaredMethod("bind",ViewGroup.class);bind.setAccessible(true);bind.invoke(panel,pager);
        Method before=panelType.getDeclaredMethod("beforeDraw");before.setAccessible(true);before.invoke(panel);
        Drawable pagerGlow=pager.getBackground();
        check(pagerGlow!=null && e.e.a.AmbientCard217.original(pagerGlow)==null);
        check(menu.getBackground()==null);
        check(e.e.a.AmbientCard217.original(first.getBackground()).callback==first.getBackground());
        menu.visible=false; first.visible=false; related.visible=true;
        pager.tree.scroll.onScrollChanged();before.invoke(panel);
        related.visible=false; comments.visible=true;
        pager.tree.scroll.onScrollChanged();before.invoke(panel);
        check(comments.getBackground()==null && pager.getBackground()==pagerGlow);
        pagerGlow.getBounds().set(0,0,100,100);pager.y=100;
        c=new Canvas();pagerGlow.draw(c);check(c.blends.equals(Arrays.asList("PLAIN")));
        comments.visible=false;
        View replacement=new View(); replacement.setBackground(new ColorDrawable(0xff222222));
        actions.removeView(first);actions.addView(replacement);
        menu.visible=true; related.visible=false; replacement.x=20; replacement.y=90;
        pager.tree.layout.onGlobalLayout();before.invoke(panel);
        check(pager.getBackground()==pagerGlow);
        check(related.getBackground()==null && menu.getBackground()==null);
        Drawable row=replacement.getBackground();
        row.getBounds().set(0,0,100,30);c=new Canvas();row.draw(c);
        check(c.translatedX==-20 && c.blends.equals(Arrays.asList("SRC_ATOP")));
        int beforeMove=row.invalidations;
        replacement.x=0;
        pager.tree.scroll.onScrollChanged();before.invoke(panel);
        c=new Canvas();row.draw(c);
        check(row.invalidations>beforeMove && c.translatedX==0);
        // A theme write may be followed by a frame sample before pre-draw.
        replacement.setBackground(new ColorDrawable(0xff333333));
        Method invalidate=panelType.getDeclaredMethod("invalidateCards");
        invalidate.setAccessible(true);
        invalidate.invoke(panel);
        before.invoke(panel);
        row=replacement.getBackground();
        check(e.e.a.AmbientCard217.original(row)!=row);

        // A 4:3 or portrait video can have margins on both sides of the
        // player. The hue stops still use the video but paint both margins.
        Field viewportField=panelType.getDeclaredField("viewport");
        viewportField.setAccessible(true);
        Rect viewport=(Rect)viewportField.get(panel);
        viewport.set(0,100,100,200);
        picture.set(13,0,87,100);
        configure.invoke(panel,colors,false,100,150);
        View leftMargin=new View();leftMargin.y=100;
        Drawable leftCard=(Drawable)cardCtor.newInstance(leftMargin,panel,null,true,false);
        leftCard.getBounds().set(0,0,12,30);c=new Canvas();leftCard.draw(c);
        check(c.paintedLeft==0 && c.paintedRight==100 && c.blends.size()==1);
        View rightMargin=new View();rightMargin.x=88;rightMargin.y=100;
        Drawable rightCard=(Drawable)cardCtor.newInstance(rightMargin,panel,null,true,false);
        rightCard.getBounds().set(0,0,12,30);c=new Canvas();rightCard.draw(c);
        check(c.paintedLeft==0 && c.paintedRight==100 && c.blends.size()==1);

        // Create a fresh native menu outside the visible viewport with opaque
        // theme backgrounds, then return to it with no intervening layout event.
        ViewGroup recreated=new ViewGroup();
        ViewGroup menuContent=new ViewGroup();
        ViewGroup menuScroll=new ViewGroup();
        ViewGroup menuActions=new ViewGroup();
        recreated.ids.put(0x7f0800ce,menuContent);
        recreated.ids.put(0x7f0800d3,menuScroll);
        recreated.ids.put(0x7f0801d7,menuActions);
        recreated.addView(menuContent);menuContent.addView(menuScroll);menuScroll.addView(menuActions);
        View[] surfaces={recreated,menuContent,menuScroll,menuActions};
        ColorDrawable[] originalMenu=new ColorDrawable[surfaces.length];
        for(int i=0;i<surfaces.length;i++) {
            originalMenu[i]=new ColorDrawable(0xff222222);
            surfaces[i].setBackground(originalMenu[i]);
        }
        e.e.a.AmbientCard217.registerMenu(recreated);
        recreated.visible=false;
        pager.removeView(menu);pager.addView(recreated);
        before.invoke(panel);
        recreated.visible=true;
        for(int i=0;i<surfaces.length;i++){
            Drawable menuSurface=surfaces[i].getBackground();
            check(e.e.a.AmbientCard217.original(menuSurface)==originalMenu[i]);
            menuSurface.getBounds().set(0,0,100,100);
            c=new Canvas();menuSurface.draw(c);
            check(c.base==0 && c.blends.isEmpty());
            check(menuSurface.getOpacity()==PixelFormat.TRANSLUCENT);
        }
        e.e.a.AmbientCard217.themedColor(menuScroll, 0xff454545);
        Drawable scrollSurface=menuScroll.getBackground();
        c=new Canvas();scrollSurface.draw(c);
        check(c.base==0 && originalMenu[2].color==0xff454545);

        // MenuWatch is reattached after the ambient pre-draw listener.
        // Its theme callback must preserve the wrappers already installed.
        View menuButton=new View();menuButton.y=100;
        menuButton.setBackground(new ColorDrawable(0xff292b31));
        menuActions.addView(menuButton);
        pager.tree.layout.onGlobalLayout();before.invoke(panel);
        Drawable buttonSurface=menuButton.getBackground();
        Drawable themedRipple=new LayerDrawable(new Drawable[]{new ColorDrawable(0xff454545)});
        e.e.a.AmbientCard217.themedBackground(menuButton,themedRipple);
        check(menuButton.getBackground()==buttonSurface);
        check(e.e.a.AmbientCard217.original(buttonSurface)==themedRipple);
        buttonSurface.getBounds().set(0,0,100,30);
        c=new Canvas();buttonSurface.draw(c);
        check(c.blends.equals(Arrays.asList("SRC_ATOP")));
        e.e.a.AmbientCard217.themedColor(menuActions,0xff454545);
        Drawable actionsSurface=menuActions.getBackground();
        check(e.e.a.AmbientCard217.original(actionsSurface)==originalMenu[3]);
        c=new Canvas();actionsSurface.draw(c);
        check(c.base==0 && c.blends.isEmpty());
        View unwrapped = new View();
        e.e.a.AmbientCard217.themedBackground(unwrapped,themedRipple);
        check(unwrapped.getBackground()==themedRipple);

        Method unbind=panelType.getDeclaredMethod("unbind");unbind.setAccessible(true);
        unbind.invoke(panel);
        check(pager.getBackground()==null && replacement.getBackground() instanceof ColorDrawable);
        for(int i=0;i<surfaces.length;i++)check(surfaces[i].getBackground()==originalMenu[i]);
        check(menuButton.getBackground()==themedRipple);
        check(replacement.getBackground().callback==replacement);
        check(pager.tree.scroll==null && pager.tree.layout==null);
        System.out.println("PASS: rebuilt menu surfaces reveal the pager; comment pages and 4:3 margins retain glow");
    }
}''')
out=root/'classes'
out.mkdir(exist_ok=True)
subprocess.run(['javac','--release','8','-d',out,*root.rglob('*.java'),source],check=True)
subprocess.run(['java','-cp',out,'Verify'],check=True)
