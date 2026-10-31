/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.common;

import android.graphics.Color;
import android.os.Build;
import android.view.*;
import android.widget.*;
import java.util.*;

/** Transparent navigation with a real bottom-edge layout, without painting a fake protection strip. */
@SuppressWarnings("deprecation")
final class NavigationWindow implements AutoCloseable {
    private final Window window;
    private final FrameDiagnostics frames;
    private final View decor;
    private int color,divider;
    private final int flags;
    private boolean contrast,applied;
    private LyricsViewport lyrics;
    private final Map<View,Padding> padding=new WeakHashMap<>();
    private final Map<Integer,String> idNames=new HashMap<>();
    private static final class Padding {final int[] base,last;Padding(View v){base=new int[]{v.getPaddingLeft(),v.getPaddingTop(),v.getPaddingRight(),v.getPaddingBottom()};last=base.clone();}}
    private final Map<ViewGroup,Boolean> clipping=new WeakHashMap<>();
    private boolean queued,closed;
    private final Runnable apply=this::apply;
    private final ViewTreeObserver.OnGlobalLayoutListener layout=this::update;
    private final ViewTreeObserver.OnWindowFocusChangeListener focus=focused->{if(focused)update();};
    NavigationWindow(Window w){window=w;frames=new FrameDiagnostics(w);decor=w.getDecorView();color=w.getNavigationBarColor();divider=Build.VERSION.SDK_INT>=28?w.getNavigationBarDividerColor():0;contrast=Build.VERSION.SDK_INT>=29&&w.isNavigationBarContrastEnforced();flags=decor.getSystemUiVisibility();}
    void start(){decor.getViewTreeObserver().addOnGlobalLayoutListener(layout);decor.getViewTreeObserver().addOnWindowFocusChangeListener(focus);update();}
    void update(){if(!closed&&!queued){queued=true;decor.post(apply);}}
    void lyricsViewport(View root){if(lyrics!=null&&lyrics.root==root){lyrics.refreshBackground();update();return;}if(lyrics!=null)lyrics.close();lyrics=new LyricsViewport(root,decor);
        for(var e:new java.util.ArrayList<>(padding.entrySet()))if(lyrics.contains(e.getKey())){View v=e.getKey();int[] p=e.getValue().base;v.setPadding(p[0],p[1],p[2],p[3]);padding.remove(v);if(v instanceof ViewGroup group&&clipping.containsKey(group)){group.setClipToPadding(clipping.remove(group));}}
        update();}
    private void apply(){
        frames.update();queued=false;if(closed||!decor.isAttachedToWindow())return;
        if(applied){if(window.getNavigationBarColor()!=Color.TRANSPARENT)color=window.getNavigationBarColor();if(Build.VERSION.SDK_INT>=28&&window.getNavigationBarDividerColor()!=0)divider=window.getNavigationBarDividerColor();if(Build.VERSION.SDK_INT>=29&&window.isNavigationBarContrastEnforced())contrast=true;}applied=true;
        // Layout only behind navigation, retaining the native status-bar arrangement.
        int current=decor.getSystemUiVisibility(),next=current|View.SYSTEM_UI_FLAG_LAYOUT_STABLE|View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;
        if(current!=next)decor.setSystemUiVisibility(next);
        if(window.getNavigationBarColor()!=Color.TRANSPARENT)window.setNavigationBarColor(Color.TRANSPARENT);
        if(Build.VERSION.SDK_INT>=28&&window.getNavigationBarDividerColor()!=0)window.setNavigationBarDividerColor(0);
        if(Build.VERSION.SDK_INT>=29&&window.isNavigationBarContrastEnforced())window.setNavigationBarContrastEnforced(false);
        WindowInsets insets=decor.getRootWindowInsets();if(insets==null)return;
        int left,right,bottom;
        if(Build.VERSION.SDK_INT>=30){android.graphics.Insets n=insets.getInsets(WindowInsets.Type.navigationBars());left=n.left;right=n.right;bottom=n.bottom;}
        else{left=Math.min(insets.getSystemWindowInsetLeft(),insets.getStableInsetLeft());right=Math.min(insets.getSystemWindowInsetRight(),insets.getStableInsetRight());bottom=Math.min(insets.getSystemWindowInsetBottom(),insets.getStableInsetBottom());}
        if(lyrics!=null)lyrics.update(bottom);FeatureDiagnostics.panel(lyrics!=null&&lyrics.root.isShown());
        // The owned renderer handles its safe inset. Avoid walking the hidden native
        // lyric collection and the whole player hierarchy on every panel layout.
        if(lyrics!=null&&lyrics.root.isShown()&&lyrics.root instanceof ViewGroup group){
            for(int i=0;i<group.getChildCount();i++)if(group.getChildAt(i) instanceof app.bdcrusher.ytmusic.lyrics.BetterLyricsPanelView panel){protect(panel,left,right,bottom);return;}
        }
        if(window.getAttributes().width==ViewGroup.LayoutParams.MATCH_PARENT&&window.getAttributes().height==ViewGroup.LayoutParams.MATCH_PARENT)protect(decor,left,right,bottom);
    }
    private void protect(View view,int left,int right,int bottom){
        String name=view.getClass().getName();String id="";if(view.getId()!=View.NO_ID){id=idNames.get(view.getId());if(id==null){try{id=view.getResources().getResourceEntryName(view.getId());}catch(Exception ignored){id="";}idNames.put(view.getId(),id);}}
        boolean scroll=view instanceof AbsListView||view instanceof ScrollView||view instanceof HorizontalScrollView||name.endsWith("RecyclerView");
        if(view instanceof app.bdcrusher.ytmusic.lyrics.BetterLyricsPanelView panel){
            int[] position=new int[2];view.getLocationInWindow(position);
            int overlap=Math.max(0,Math.min(bottom,position[1]+view.getHeight()-(decor.getHeight()-bottom)));
            panel.setNavigationInsets(left,right,overlap);return;
        }
        boolean controls="player_bottom_ui_container".equals(id)||name.equals("app.morphe.extension.music.patches.lyrics.ui.LyricsPanelView");
        if((scroll||controls)&&(lyrics==null||!lyrics.root.isShown()||!lyrics.contains(view))){
            Padding state=padding.computeIfAbsent(view,Padding::new);int[] current={view.getPaddingLeft(),view.getPaddingTop(),view.getPaddingRight(),view.getPaddingBottom()};for(int i=0;i<4;i++)if(current[i]!=state.last[i])state.base[i]=current[i];int[] old=state.base;
            // Native consumers may already include the system inset. Never add it twice.
            int l=Math.max(old[0],left),r=Math.max(old[2],right),b=Math.max(old[3],bottom);
            if(view.getPaddingLeft()!=l||view.getPaddingRight()!=r||view.getPaddingBottom()!=b)view.setPadding(l,old[1],r,b);
            state.last[0]=l;state.last[1]=old[1];state.last[2]=r;state.last[3]=b;
            if(scroll&&view instanceof ViewGroup group){clipping.putIfAbsent(group,group.getClipToPadding());if(group.getClipToPadding())group.setClipToPadding(false);}
            return;
        }
        if(view instanceof ViewGroup group)for(int i=0;i<group.getChildCount();i++)protect(group.getChildAt(i),left,right,bottom);
    }
    public void close(){
        if(closed)return;closed=true;frames.close();decor.removeCallbacks(apply);
        if(lyrics!=null){lyrics.close();lyrics=null;}
        if(decor.getViewTreeObserver().isAlive()){decor.getViewTreeObserver().removeOnGlobalLayoutListener(layout);decor.getViewTreeObserver().removeOnWindowFocusChangeListener(focus);}
        window.setNavigationBarColor(color);if(Build.VERSION.SDK_INT>=28)window.setNavigationBarDividerColor(divider);if(Build.VERSION.SDK_INT>=29)window.setNavigationBarContrastEnforced(contrast);
        decor.setSystemUiVisibility((decor.getSystemUiVisibility()&~(View.SYSTEM_UI_FLAG_LAYOUT_STABLE|View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION))|(flags&(View.SYSTEM_UI_FLAG_LAYOUT_STABLE|View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION)));
        for(var entry:padding.entrySet()){View v=entry.getKey();int[] p=entry.getValue().base;v.setPadding(p[0],p[1],p[2],p[3]);}padding.clear();
        for(var entry:clipping.entrySet())entry.getKey().setClipToPadding(entry.getValue());clipping.clear();
    }
}
