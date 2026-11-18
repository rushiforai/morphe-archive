package app.canada.walmart;

import android.content.*;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;

/** Checklist-only display changes. Native item selection and list data stay authoritative. */
public final class ShoppingMode {
    private static final int SCREEN=0x7e010021,ROW=0x7e010022;
    private static SharedPreferences prefs(View v){return v.getContext().getSharedPreferences("morphe_canada_shopping_v1",Context.MODE_PRIVATE);}
    private static void constraint(Object params,String field,int value)throws Exception {
        Field f=params.getClass().getField(field);f.setInt(params,value);
    }
    private static final class Session {
        final View root;final ViewGroup recycler;final LinearLayout bar;
        boolean enabled,showCollected;final boolean oldKeepAwake;
        Session(View root,ViewGroup recycler,LinearLayout bar){this.root=root;this.recycler=recycler;this.bar=bar;oldKeepAwake=root.getKeepScreenOn();}
        void refresh() {
            root.setKeepScreenOn(enabled||oldKeepAwake);
            for(int i=0;i<recycler.getChildCount();i++) {
                View row=recycler.getChildAt(i);Object saved=row.getTag(ROW);
                if(saved instanceof RowState)((RowState)saved).apply(enabled,!showCollected);
            }
        }
    }
    private static final class RowState {
        final View row,checkbox;final int height,minHeight,visibility,checkWidth,checkHeight;final float scaleX,scaleY;
        RowState(View row,View box){this.row=row;checkbox=box;height=row.getLayoutParams().height;minHeight=row.getMinimumHeight();visibility=row.getVisibility();checkWidth=box.getMinimumWidth();checkHeight=box.getMinimumHeight();scaleX=box.getScaleX();scaleY=box.getScaleY();}
        void restore() {
            ViewGroup.LayoutParams lp=row.getLayoutParams();if(lp.height!=height){lp.height=height;row.setLayoutParams(lp);}
            row.setMinimumHeight(minHeight);row.setVisibility(visibility);
            checkbox.setMinimumWidth(checkWidth);checkbox.setMinimumHeight(checkHeight);checkbox.setScaleX(scaleX);checkbox.setScaleY(scaleY);
        }
        void apply(boolean enabled,boolean hide) {
            restore();if(!enabled)return;
            checkbox.setMinimumWidth(Math.max(checkWidth,ListEnhancements.dp(row,48)));
            checkbox.setMinimumHeight(Math.max(checkHeight,ListEnhancements.dp(row,48)));
            checkbox.setScaleX(scaleX*1.15f);checkbox.setScaleY(scaleY*1.15f);
            if(hide && checkbox instanceof Checkable && ((Checkable)checkbox).isChecked()) {
                ViewGroup.LayoutParams lp=row.getLayoutParams();lp.height=0;row.setMinimumHeight(0);row.setLayoutParams(lp);row.setVisibility(View.GONE);
            }
        }
    }
    private static Session session(View v) {
        while(v!=null){Object tag=v.getTag(SCREEN);if(tag instanceof Session)return(Session)tag;v=v.getParent() instanceof View?(View)v.getParent():null;}return null;
    }
    static void refreshSettings(View v) {
        Object saved=v.getTag(SCREEN);
        if(saved instanceof Session){Session s=(Session)saved;s.enabled=prefs(v).getBoolean("enabled",true);s.showCollected=prefs(v).getBoolean("show_collected",false);
            for(int i=0;i<s.bar.getChildCount();i++){View child=s.bar.getChildAt(i);if(child instanceof Switch){Switch sw=(Switch)child;String title=sw.getText().toString();if(title.startsWith("Shopping mode")||title.startsWith("Mode magasin"))sw.setChecked(s.enabled);else if(title.startsWith("Show collected")||title.startsWith("Afficher")){sw.setChecked(s.showCollected);sw.setEnabled(s.enabled);}}}s.refresh();
        }
        if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++)refreshSettings(((ViewGroup)v).getChildAt(i));
    }
    static View itemView(Object holder)throws Exception {
        for(Class<?> c=holder.getClass();c!=null;c=c.getSuperclass())for(Field f:c.getDeclaredFields())
            if(f.getType()==View.class){f.setAccessible(true);Object value=f.get(holder);if(value instanceof View)return(View)value;}
        return null;
    }
    public static void beforeBind(Object holder) {
        try {View row=itemView(holder);if(row!=null && row.getTag(ROW) instanceof RowState)((RowState)row.getTag(ROW)).restore();}
        catch(Exception e){android.util.Log.w("WalmartCanadaMorphe","Row reset unavailable",e);}
    }
    public static void afterBind(Object holder) {
        try {
            View row=itemView(holder);if(row==null)return;
            View box=ListEnhancements.id(row,"lists_item_detail_checkbox");if(!(box instanceof Checkable))return;
            RowState state=row.getTag(ROW) instanceof RowState?(RowState)row.getTag(ROW):new RowState(row,box);
            row.setTag(ROW,state);
            // Apply after RecyclerView finishes its current bind/layout pass.
            row.post(()->{Session s=session(row);if(s!=null)state.apply(s.enabled,!s.showCollected);});
        }catch(Exception e){android.util.Log.w("WalmartCanadaMorphe","Shopping row unavailable",e);}
    }
    public static void selected(final View tile) {
        tile.post(()->{Session s=session(tile);if(s!=null)s.refresh();});
    }
    public static void install(final View root) {
        if(root==null || root.getTag(SCREEN)!=null)return;
        root.post(()->{
            try {
                View list=ListEnhancements.id(root,"list_detail_recycler_view");
                if(!(list instanceof ViewGroup))return;
                LinearLayout bar=ChecklistBar.get(root);if(bar==null||root.getTag(SCREEN)!=null)return;
                Switch mode=new Switch(root.getContext()),show=new Switch(root.getContext());
                boolean fr=ListEnhancements.french(root);
                mode.setText(fr?"Mode magasin · écran allumé":"Shopping mode · keep screen awake");
                show.setText(fr?"Afficher les articles cochés":"Show collected items");
                for(Switch sw:new Switch[]{mode,show}){sw.setTextSize(15);sw.setMinimumHeight(ListEnhancements.dp(root,48));bar.addView(sw,new LinearLayout.LayoutParams(-1,-2));}
                Session s=new Session(root,(ViewGroup)list,bar);
                s.enabled=prefs(root).getBoolean("enabled",true);s.showCollected=prefs(root).getBoolean("show_collected",false);
                mode.setChecked(s.enabled);show.setChecked(s.showCollected);show.setEnabled(s.enabled);
                mode.setOnCheckedChangeListener((b,on)->{s.enabled=on;show.setEnabled(on);prefs(root).edit().putBoolean("enabled",on).apply();s.refresh();});
                show.setOnCheckedChangeListener((b,on)->{s.showCollected=on;prefs(root).edit().putBoolean("show_collected",on).apply();s.refresh();});
                root.setTag(SCREEN,s);RuntimeStats.hit("Shopping controls shown");
                root.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
                    public void onViewAttachedToWindow(View v){s.refresh();}
                    public void onViewDetachedFromWindow(View v){v.setKeepScreenOn(s.oldKeepAwake);for(int i=0;i<s.recycler.getChildCount();i++){Object state=s.recycler.getChildAt(i).getTag(ROW);if(state instanceof RowState)((RowState)state).restore();}}
                });
                s.refresh();
            }catch(Exception e){android.util.Log.w("WalmartCanadaMorphe","Shopping controls unavailable",e);}
        });
    }
}
