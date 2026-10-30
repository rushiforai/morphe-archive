package local.maps.cluster;

import android.view.*;
import android.util.Log;
import android.graphics.RectF;
import java.util.WeakHashMap;

/** Applies live preferences to the current cluster views, including recreated cards. */
final class CardPlacement {
    private static final WeakHashMap<View,Boolean> roots=new WeakHashMap<>();
    private static int cardId,footerId,brandingId;
    private static ClusterSettings.State reported;
    static void attachRoot(View root){
        if(roots.containsKey(root))return;roots.put(root,Boolean.TRUE);
        cardId=MapsResources.id(root.getResources(),"turn_card_container","id");
        footerId=MapsResources.id(root.getResources(),"cluster_trip_info_container","id");
        brandingId=MapsResources.id(root.getResources(),"auxiliary_branding_container","id");
        root.getViewTreeObserver().addOnPreDrawListener(()->{apply(root);return true;});
    }
    static void refresh(){for(View root:roots.keySet())if(root!=null){apply(root);root.postInvalidate();}ClusterHost.recordClusterViewport();}
    static void install(View content){content.post(CardPlacement::refresh);}
    private static void transform(View v,float scale,float x,float y){
        v.setPivotX(0);v.setPivotY(0);
        if(Math.abs(v.getScaleX()-scale)>.001f)v.setScaleX(scale);
        if(Math.abs(v.getScaleY()-scale)>.001f)v.setScaleY(scale);
        if(Math.abs(v.getTranslationX()-x)>.5f)v.setTranslationX(x);
        if(Math.abs(v.getTranslationY()-y)>.5f)v.setTranslationY(y);
        for(ViewParent p=v.getParent();p instanceof ViewGroup;p=p.getParent()){
            if(ClusterHost.clipBoundary(p))break;
            ((ViewGroup)p).setClipChildren(false);((ViewGroup)p).setClipToPadding(false);
        }
    }
    private static void apply(View root){
        ClusterSettings.State s=ClusterSettings.state();if(s==null||cardId==0||footerId==0)return;
        visit(root,root,s,0);
    }
    private static void visit(View view,View root,ClusterSettings.State s,int depth){
        if(depth>30)return;
        if(view.getId()==cardId){place(view,root,s);return;}
        if(brandingId!=0&&view.getId()==brandingId){placeLogo(view,root,s);return;}
        if(view instanceof ViewGroup){ViewGroup g=(ViewGroup)view;for(int i=0;i<g.getChildCount();i++)visit(g.getChildAt(i),root,s,depth+1);}
    }
    /** The Google Maps logo stays visible; it can move to the top right where it does not cover cluster readouts. */
    private static void placeLogo(View logo,View root,ClusterSettings.State s){
        if(logo.getWidth()==0||root.getWidth()==0){transform(logo,1,0,0);return;}
        int[] xy=new int[2],rxy=new int[2];logo.getLocationOnScreen(xy);root.getLocationOnScreen(rxy);
        float baseX=xy[0]-logo.getTranslationX(),baseY=xy[1]-logo.getTranslationY(),pad=root.getWidth()*.01f;
        float scale=1;
        if(ClusterHost.profileGeometry(root)&&logo.getHeight()>0)scale=Math.min(1,Math.min((root.getWidth()-2*pad)/logo.getWidth(),(root.getHeight()-2*pad)/logo.getHeight()));
        float x=s.logoPosition==ClusterSettings.LOGO_TOP_RIGHT?rxy[0]+root.getWidth()-logo.getWidth()*scale-pad:rxy[0]+pad;
        float y=s.logoPosition==ClusterSettings.LOGO_TOP_RIGHT?rxy[1]+pad:rxy[1]+root.getHeight()-logo.getHeight()*scale-pad;
        transform(logo,scale,x-baseX,y-baseY);
    }
    private static void place(View card,View root,ClusterSettings.State s){
        if(card.getVisibility()==View.GONE)return;
        View footer=null;
        if(card.getParent() instanceof ViewGroup){
            ViewGroup g=(ViewGroup)card.getParent();
            for(int i=0;i<g.getChildCount();i++)if(g.getChildAt(i).getId()==footerId){footer=g.getChildAt(i);break;}
        }
        card.setVisibility(s.visible?View.VISIBLE:View.INVISIBLE);
        if(footer!=null&&footer.getVisibility()!=View.GONE)footer.setVisibility(s.visible?View.VISIBLE:View.INVISIBLE);
        if(!s.visible){transform(card,1,0,0);if(footer!=null)transform(footer,1,0,0);}
        else if(card.getWidth()>0&&root.getWidth()>0){
            int[] xy=new int[2],rxy=new int[2],fxy=new int[2];
            card.getLocationOnScreen(xy);root.getLocationOnScreen(rxy);
            float baseX=xy[0]-card.getTranslationX(),baseY=xy[1]-card.getTranslationY();
            float scale=s.size/100f,margin=root.getWidth()*s.margin/100f;
            boolean bounded=ClusterHost.profileGeometry(root);
            float x=rxy[0]+(s.side==0?margin:root.getWidth()-margin-card.getWidth()*scale);
            x=Math.max(rxy[0],Math.min(x,rxy[0]+root.getWidth()-card.getWidth()*scale));
            float footerBaseY=baseY;
            boolean footerLaidOut=footer!=null&&footer.getVisibility()!=View.GONE&&footer.getHeight()>0;
            if(footerLaidOut){footer.getLocationOnScreen(fxy);footerBaseY=fxy[1]-footer.getTranslationY();}
            // The native status CardView can extend above/below its parent. Reserve
            // its visible bounds, not only the parent height, before scaling both panels.
            RectF footerBounds=footerLaidOut?visibleBounds(footer):new RectF();
            float footerOffset=CardStackGeometry.footerOffset(card.getHeight(),footerBaseY-baseY,footerBounds.top);
            float total=Math.max(card.getHeight(),footerLaidOut?footerOffset+footerBounds.bottom:0)*scale;
            float y=baseY+root.getHeight()*s.vertical/100f;
            y=Math.max(rxy[1],Math.min(y,rxy[1]+root.getHeight()-total));
            if(bounded){
                RectF cardBounds=visibleBounds(card);
                float left=Math.min(cardBounds.left,footerLaidOut?footerBounds.left:cardBounds.left);
                float right=Math.max(cardBounds.right,footerLaidOut?footerBounds.right:cardBounds.right);
                float top=Math.min(cardBounds.top,footerLaidOut?footerOffset+footerBounds.top:cardBounds.top);
                float bottom=Math.max(cardBounds.bottom,footerLaidOut?footerOffset+footerBounds.bottom:cardBounds.bottom);
                scale=Math.min(scale,Math.min((root.getWidth()-2*margin)/Math.max(1,right-left),root.getHeight()/Math.max(1,bottom-top)));
                float groupX=rxy[0]+(s.side==0?margin:root.getWidth()-margin-(right-left)*scale);
                x=groupX-left*scale;
                y=Math.max(rxy[1]-top*scale,Math.min(baseY+root.getHeight()*s.vertical/100f,rxy[1]+root.getHeight()-bottom*scale));
            }
            transform(card,scale,x-baseX,y-baseY);
            if(footer!=null){footer.getLocationOnScreen(fxy);
                float fx=fxy[0]-footer.getTranslationX(),fy=fxy[1]-footer.getTranslationY();
                transform(footer,scale,x-fx,y+footerOffset*scale-fy);
            }
        }
        if(reported!=s&&footer!=null){
            reported=s;int[] xy=new int[2];card.getLocationOnScreen(xy);
            Log.i("MapsClusterTest","card settings applied: visible="+s.visible+" footer="+s.visible+" size="+s.size+" side="+s.side+" xy="+xy[0]+","+xy[1]+" scale="+card.getScaleX());
        }
    }
    private static RectF visibleBounds(View view){
        RectF bounds=new RectF(0,0,view.getWidth(),view.getHeight());
        if(view instanceof ViewGroup){
            ViewGroup group=(ViewGroup)view;
            for(int i=0;i<group.getChildCount();i++){
                View child=group.getChildAt(i);
                if(child.getVisibility()!=View.VISIBLE||child.getWidth()<=0||child.getHeight()<=0)continue;
                RectF content=visibleBounds(child);
                child.getMatrix().mapRect(content);content.offset(child.getLeft(),child.getTop());
                bounds.union(content);
            }
        }
        return bounds;
    }
}
