package app.yydarlinker.deepseekcaptions;
import android.app.Activity;
import android.graphics.Rect;
import android.view.*;
import java.lang.ref.WeakReference;
import java.util.*;
/** Bounded visible-view discovery. Never treats an arbitrary full Activity as a video. */
final class CaptionSurface {
    private static final String[] SHORTS={"reel_player_overlay_root","reel_watch_player","shorts_player_view_container","reel_player_page_container","reel_watch_fragment_root"};
    private static WeakReference<Activity> activity=new WeakReference<>(null);
    private static WeakReference<View> shorts=new WeakReference<>(null),nativeView=new WeakReference<>(null);
    static void activity(Activity value){activity=new WeakReference<>(value);shorts=new WeakReference<>(null);nativeView=new WeakReference<>(null);}
    static boolean isShorts(){View v=shorts.get();return visible(v);}
    static View refresh(){
        Activity a=activity.get();if(a==null || a.getWindow()==null)return null;
        View root=a.getWindow().getDecorView();Set<Integer> ids=new HashSet<>();
        for(String s:SHORTS){int id=a.getResources().getIdentifier(s,"id",a.getPackageName());if(id!=0)ids.add(id);}
        return discover(root,ids);
    }
    static View discover(View root,Set<Integer> ids){
        View best=null;int area=0;ArrayDeque<View> queue=new ArrayDeque<>();queue.add(root);int scanned=0;
        while(!queue.isEmpty() && scanned++<2200){View v=queue.remove();
            if(v.getTag()!=null && v.getTag().toString().startsWith("yydarlinker.deepseek.caption"))continue;
            if(ids.contains(v.getId()) && visible(v)){Rect r=new Rect();v.getGlobalVisibleRect(r);int n=r.width()*r.height();if(n>area){area=n;best=v;}}
            if(v instanceof ViewGroup && v.getVisibility()==View.VISIBLE){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++)queue.add(g.getChildAt(i));}
        }
        shorts=new WeakReference<>(best);return best;
    }
    private static boolean visible(View v){if(v==null || !v.isAttachedToWindow() || !v.isShown())return false;Rect r=new Rect();return v.getGlobalVisibleRect(r)&&r.width()>80&&r.height()>80;}
    static Rect bounds(View host){View v=shorts.get();if(!visible(v))return null;Rect r=new Rect(),h=new Rect();
        if(!v.getGlobalVisibleRect(r)||!host.getGlobalVisibleRect(h)||!r.intersect(h))return null;r.offset(-h.left,-h.top);return r;}
    /** Search only a verified player subtree; never mistake unrelated Activity content for video. */
    static Rect renderedBounds(View player,View host){
        if(player==null||host==null)return null;
        Rect hostRect=new Rect();if(!host.getGlobalVisibleRect(hostRect))return null;
        ArrayDeque<View> queue=new ArrayDeque<>();queue.add(player);Rect best=null;long area=0;int count=0;
        while(!queue.isEmpty()&&count++<1200){View v=queue.remove();
            if(!v.isShown()||v.getAlpha()<=.01f)continue;
            if(v instanceof SurfaceView||v instanceof TextureView){Rect r=new Rect();
                if(v.getGlobalVisibleRect(r)&&r.intersect(hostRect)&&r.width()>80&&r.height()>80){
                    long n=(long)r.width()*r.height();if(n>area){area=n;best=r;}}
            }
            if(v instanceof ViewGroup){ViewGroup g=(ViewGroup)v;for(int i=0;i<g.getChildCount();i++)queue.add(g.getChildAt(i));}
        }
        if(best!=null)best.offset(-hostRect.left,-hostRect.top);return best;
    }
    static void nativeRenderer(View v){if(v!=null)nativeView=new WeakReference<>(v);}
    static Float nativeCenter(View host,Rect video){View v=nativeView.get();if(v==null||!v.isAttachedToWindow())return null;
        Rect r=new Rect(),h=new Rect();if(!v.getGlobalVisibleRect(r)||!host.getGlobalVisibleRect(h))return null;r.offset(-h.left,-h.top);
        if(r.height()<=0||r.height()>video.height()*.4f||!Rect.intersects(r,video))return null;
        return (r.exactCenterY()-video.top)/video.height();}
}
