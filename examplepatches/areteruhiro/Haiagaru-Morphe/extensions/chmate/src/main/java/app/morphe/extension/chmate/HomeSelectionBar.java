package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;

/** Keeps ChMate's own selection controls and click handlers in the HOME pane. */
public final class HomeSelectionBar {
    static final String KEY="homeSelectionBarBottom";

    static void addSettings(LinearLayout panel, Activity activity) {
        try {
            if(!activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName.startsWith("0.8.10.242"))return;
        } catch(Exception unavailable){return;}
        Switch toggle=new Switch(activity);toggle.setText("HOMEの複数選択ボタンを下部に表示（242）");
        SharedPreferences prefs=SettingsProfiles.prefs(activity);
        toggle.setChecked(prefs.getBoolean(KEY,false));panel.addView(toggle);
        toggle.setOnCheckedChangeListener((view,on)->prefs.edit().putBoolean(KEY,on).apply());
        TextView help=new TextView(activity);help.setText("DAT落ちを選択・全て選択・全て解除・削除を下部へ移します。一覧の下端に操作バーの領域を確保します。");panel.addView(help);
    }

    public static void bind(Object fragment, View root) {
        if(root==null)return;
        try {
            Object binding=ResponseArchiveEntry.field(fragment,"n");
            View bar=(View)ResponseArchiveEntry.field(binding,"d");
            // This is the list's enclosing frame, including its empty-state message.
            ViewGroup content=(ViewGroup)root.findViewById(((View)ResponseArchiveEntry.field(binding,"e")).getId()).getParent();
            if(!(bar.getParent() instanceof ViewGroup)||bar.getParent()!=content.getParent())return;
            new Binding(root,bar,content).attach();
        } catch(ReflectiveOperationException|ClassCastException ignored) { }
    }

    private static final class Binding implements ViewTreeObserver.OnGlobalLayoutListener,
            View.OnAttachStateChangeListener, SharedPreferences.OnSharedPreferenceChangeListener {
        final View root,bar;final ViewGroup content,parent;final SharedPreferences prefs;
        final int left,top,right,bottom;final float translation,elevation;final boolean clip;
        Binding(View root,View bar,ViewGroup content){
            this.root=root;this.bar=bar;this.content=content;parent=(ViewGroup)bar.getParent();
            prefs=SettingsProfiles.prefs(root.getContext());left=content.getPaddingLeft();top=content.getPaddingTop();right=content.getPaddingRight();bottom=content.getPaddingBottom();
            translation=bar.getTranslationY();elevation=bar.getElevation();clip=content.getClipToPadding();
        }
        void attach(){root.addOnAttachStateChangeListener(this);root.getViewTreeObserver().addOnGlobalLayoutListener(this);prefs.registerOnSharedPreferenceChangeListener(this);root.post(this::update);}
        void update(){
            boolean active=prefs.getBoolean(KEY,false)&&bar.getVisibility()==View.VISIBLE;
            int height=active?bar.getHeight():0;
            float y=active?parent.getHeight()-parent.getPaddingBottom()-bar.getBottom():translation;
            if(bar.getTranslationY()!=y)bar.setTranslationY(y);
            bar.setElevation(active?Math.max(elevation,8*root.getResources().getDisplayMetrics().density):elevation);
            if(content.getPaddingBottom()!=bottom+height)content.setPadding(left,top,right,bottom+height);
            content.setClipToPadding(active||clip);
        }
        public void onGlobalLayout(){update();}
        public void onSharedPreferenceChanged(SharedPreferences preferences,String key){if(KEY.equals(key))root.post(this::update);}
        public void onViewAttachedToWindow(View view){}
        public void onViewDetachedFromWindow(View view){
            if(root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnGlobalLayoutListener(this);
            root.removeOnAttachStateChangeListener(this);prefs.unregisterOnSharedPreferenceChangeListener(this);
            bar.setTranslationY(translation);bar.setElevation(elevation);content.setPadding(left,top,right,bottom);content.setClipToPadding(clip);
        }
    }
    private HomeSelectionBar(){}
}
