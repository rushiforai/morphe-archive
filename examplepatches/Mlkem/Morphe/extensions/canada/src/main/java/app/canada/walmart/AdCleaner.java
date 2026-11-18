package app.canada.walmart;

import android.view.*;

/** Collapses entire ad containers/cards. Restores recycled organic cards. No network hooks. */
public final class AdCleaner {
    static final java.util.Map<View,Boolean> candidates=new java.util.WeakHashMap<>();
    static final int STATE=0x7e010040;
    static final class Hidden implements View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener {
        final View view;final int visibility,minHeight,minWidth;int height,width;boolean capturedLayout;ViewTreeObserver observer;
        Hidden(View v){view=v;visibility=v.getVisibility();minHeight=v.getMinimumHeight();minWidth=v.getMinimumWidth();ViewGroup.LayoutParams lp=v.getLayoutParams();capturedLayout=lp!=null;height=lp==null?-2:lp.height;width=lp==null?-1:lp.width;}
        boolean collapse(){boolean changed=false;if(view.getVisibility()!=View.GONE){view.setVisibility(View.GONE);changed=true;}if(view.getMinimumHeight()!=0){view.setMinimumHeight(0);changed=true;}if(view.getMinimumWidth()!=0){view.setMinimumWidth(0);changed=true;}ViewGroup.LayoutParams lp=view.getLayoutParams();if(lp!=null&&!capturedLayout){height=lp.height;width=lp.width;capturedLayout=true;}if(lp!=null&&(lp.height!=0||lp.width!=0)){lp.height=0;lp.width=0;view.setLayoutParams(lp);changed=true;}return changed;}
        void watch(){unwatch();observer=view.getViewTreeObserver();if(observer.isAlive())observer.addOnPreDrawListener(this);}
        void unwatch(){if(observer!=null&&observer.isAlive())observer.removeOnPreDrawListener(this);observer=null;}
        void restore(){unwatch();view.removeOnAttachStateChangeListener(this);ViewGroup.LayoutParams lp=view.getLayoutParams();if(lp!=null){lp.height=height;lp.width=width;view.setLayoutParams(lp);}view.setMinimumHeight(minHeight);view.setMinimumWidth(minWidth);view.setVisibility(visibility);view.setTag(STATE,null);}
        public boolean onPreDraw(){return !collapse();}
        public void onViewAttachedToWindow(View v){watch();collapse();}
        public void onViewDetachedFromWindow(View v){unwatch();}
    }
    static void hide(View v){if(v==null)return;Object saved=v.getTag(STATE);if(saved instanceof Hidden){((Hidden)saved).collapse();return;}Hidden h=new Hidden(v);v.setTag(STATE,h);v.addOnAttachStateChangeListener(h);if(v.isAttachedToWindow())h.watch();h.collapse();RuntimeStats.hit("Ads hidden");}
    static void restore(View v){Object state=v.getTag(STATE);if(state instanceof Hidden)((Hidden)state).restore();}
    static void apply(View v,boolean dedicated){if(ToolSettings.enabled(v.getContext(),dedicated?"hide_ads":"hide_sponsored"))hide(v);else restore(v);}
    static void refresh(){for(java.util.Map.Entry<View,Boolean> e:new java.util.ArrayList<>(candidates.entrySet()))if(e.getKey()!=null)try{apply(e.getKey(),e.getValue());}catch(Exception failure){RuntimeStats.error("Ad control",failure);}}
    public static void dedicated(View v){try{if(v==null)return;candidates.put(v,true);apply(v,true);}catch(Exception e){RuntimeStats.error("Ad container",e);}}
    public static void sponsored(View tile,Object section){
        try{RuntimeStats.hit("Sponsored cards checked");if(AdRules.sponsored(section)){candidates.put(tile,false);apply(tile,false);}else{candidates.remove(tile);restore(tile);}}
        catch(Exception e){RuntimeStats.error("Sponsored card",e);}
    }
}
