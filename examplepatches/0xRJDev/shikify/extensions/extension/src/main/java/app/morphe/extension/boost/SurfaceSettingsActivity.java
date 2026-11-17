package app.morphe.extension.boost;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.widget.SwitchCompat;
import java.lang.reflect.Method;

/** Separate, theme-aware preference pages; other patch sources retain their own menus. */
public final class SurfaceSettingsActivity extends Activity {
    /** Lets the Material 3 track keep its own width instead of SwitchCompat's old minimum. */
    private static final Method ENFORCE_SWITCH_WIDTH=enforceSwitchWidth();
    /** Material 3's opacity for disabled content. */
    private static final float DISABLED_SLIDER_ALPHA=0.38f;
    private LinearLayout group;
    private LinearLayout body;
    private TextView title;
    private SeekBar blurStrength,glassTint;
    private int page,background,foreground,secondary,accent,outline;
    /** One shared preferences instance; switches are read on every frame and row, so their values are cached too. */
    private static volatile SharedPreferences shared;
    private static final java.util.concurrent.ConcurrentHashMap<String,Boolean> SWITCHES=new java.util.concurrent.ConcurrentHashMap<>();
    // Held strongly: SharedPreferences keeps only weak references to its listeners.
    private static final SharedPreferences.OnSharedPreferenceChangeListener CHANGED=(preferences,key)->SWITCHES.clear();
    static SharedPreferences prefs(Context context){
        SharedPreferences preferences=shared;if(preferences!=null)return preferences;
        synchronized(SWITCHES){
            if(shared==null){
                Context app=context.getApplicationContext();
                SharedPreferences created=PreferenceManager.getDefaultSharedPreferences(app==null ? context:app);
                created.registerOnSharedPreferenceChangeListener(CHANGED);shared=created;
            }
            return shared;
        }
    }
    static boolean enabled(Context context,String key){return enabled(context,key,true);}
    static boolean enabled(Context context,String key,boolean fallback){
        String name=fallback ? key:"!"+key;
        Boolean known=SWITCHES.get(name);if(known!=null)return known;
        boolean value=prefs(context).getBoolean("shikify_"+key,fallback);
        SWITCHES.put(name,value);return value;
    }
    static int number(Context context,String key,int fallback,int min,int max){
        try{
            return Math.max(min,Math.min(max,prefs(context).getInt("shikify_"+key,fallback)));
        }catch(ClassCastException ignored){
            return fallback;
        }
    }
    private int dp(int value){return Math.round(value*getResources().getDisplayMetrics().density);}
    @Override public void onCreate(Bundle saved){
        Activity source=SurfaceAppearanceTweaks.settingsThemeOwner.get();
        if(source!=null)getTheme().setTo(source.getTheme());
        boolean dark=source!=null ? SurfaceAppearanceTweaks.dark(source):prefs(this).getBoolean("shikify_settings_dark",(getResources().getConfiguration().uiMode&48)==32);
        int theme=getResources().getIdentifier(dark ? "MaterialDarkTheme.Dynamic":"MaterialLightTheme.Dynamic","style",getPackageName());if(theme!=0)getTheme().applyStyle(theme,true);
        super.onCreate(saved);requestWindowFeature(Window.FEATURE_NO_TITLE);
        background=SurfaceAppearanceTweaks.role(this,false);foreground=SurfaceAppearanceTweaks.foreground(this,false);
        secondary=MaterialYouTweaks.color(this,"colorOnSurfaceVariant",android.R.attr.textColorSecondary);
        accent=MaterialYouTweaks.color(this,"colorPrimary",android.R.attr.colorAccent);
        outline=MaterialYouTweaks.color(this,"colorOutlineVariant",android.R.attr.textColorSecondary);
        LinearLayout root=new LinearLayout(this);root.setOrientation(LinearLayout.VERTICAL);root.setBackgroundColor(background);
        LinearLayout toolbar=new LinearLayout(this);
        toolbar.setGravity(Gravity.CENTER_VERTICAL);
        toolbar.setBackgroundColor(background);
        ImageButton back=new ImageButton(this);
        back.setContentDescription("Back");
        back.setImageResource(getResources().getIdentifier("ic_arrow_back_24dp","drawable",getPackageName()));
        back.setImageTintList(ColorStateList.valueOf(foreground));
        ripple(back);
        back.setOnClickListener(v->goBack());
        toolbar.addView(back,new LinearLayout.LayoutParams(dp(56),dp(56)));
        title=new TextView(this);
        title.setTextSize(22);
        title.setTextColor(foreground);
        toolbar.addView(title,new LinearLayout.LayoutParams(0,-2,1));
        root.addView(toolbar,new LinearLayout.LayoutParams(-1,dp(64)));
        ScrollView scroll=new ScrollView(this);
        scroll.setFillViewport(true);
        body=new LinearLayout(this);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(0,dp(8),0,dp(24));
        scroll.addView(body);
        root.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
        Window window=getWindow();window.setStatusBarColor(background);window.setNavigationBarColor(background);
        if(Build.VERSION.SDK_INT>=30){
            window.setDecorFitsSystemWindows(false);
            window.getDecorView().setSystemUiVisibility(dark ? 0:View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR|View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
            if(window.getInsetsController()!=null)window.getInsetsController().setSystemBarsAppearance(dark ? 0:24,24);
            root.setOnApplyWindowInsetsListener((view,insets)->{android.graphics.Insets bars=insets.getInsets(WindowInsets.Type.systemBars()|WindowInsets.Type.displayCutout());view.setPadding(bars.left,bars.top,bars.right,bars.bottom);return insets;});
        }
        else window.getDecorView().setSystemUiVisibility(dark ? 0:View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR|View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
        setContentView(root);root.requestApplyInsets();show(saved==null ? 0:saved.getInt("shikify_page",0));
        if(Build.VERSION.SDK_INT>=33)getOnBackInvokedDispatcher().registerOnBackInvokedCallback(0,this::goBack);
    }
    @Override protected void onSaveInstanceState(Bundle state){state.putInt("shikify_page",page);super.onSaveInstanceState(state);}
    @Override public void onBackPressed(){goBack();}
    private void goBack(){if(page!=0)show(0);else finish();}
    private void show(int value){
        page=Math.max(0,Math.min(5,value));
        if(body.getParent() instanceof ScrollView)((ScrollView)body.getParent()).scrollTo(0,0);
        body.removeAllViews();group=null;blurStrength=glassTint=null;
        String[] titles={"Shikify Settings","Glass & appearance","Comments & gestures","Media viewers","Performance","Loading"};
        title.setText(titles[page]);
        setTitle(titles[page]);
        if(page==0){
            destination("Glass & appearance","Blur strength, glass tint and colours","ic_color_lens_24dp",1);
            destination("Comments & gestures","Headers, thread position and swipe actions","ic_comment_24dp",2);
            destination("Media viewers","Stock playback and image controls","ic_photo_24dp",3);
            destination("Performance","Blur update interval","ic_settings_24dp",4);
            if(Features.parallelLoading() || Features.requestQueue() || Features.instantLogin() || Features.firstPage() || Features.onlineCheck())
                destination("Loading","Requests, login and first page","ic_refresh_24dp",5);
            note("Changes apply when you return to the relevant screen.");
        }
        if(page==1){
            section("Glass surfaces");
            toggle("Glass effects","Use frosted surfaces for floating controls","feed_pill_blur");
            toggle("Dialog blur","Blur the screen behind dialogs and menus","dialog_blur");
            if(Build.VERSION.SDK_INT>=31)toggle("Blurred header","Blur what scrolls under the top bar instead of a gradient","header_blur",false);
            if(Build.VERSION.SDK_INT>=31)toggle("Glass header buttons","Frosted glass circles behind the top bar's icons","header_glass_buttons",false);
            toggle("Subreddit colours","Tint the top bar with each community's colour. Off when the header is blurred","subreddit_colours");
            blurStrength=slider("Blur strength","blur_amount",7,0,25," dp",false);
            glassTint=slider("Glass tint","glass_tint",40,0,80,"%",false);
            updateGlassControls();
            note("Lower tint makes glass clearer. Colours follow Boost’s Material You theme.");
            section("Material 3");
            toggle("Side panel","Rounded boxes and wallpaper colours","side_panel");
            toggle("Empty screens","Tonal icon and button","empty_screens");
            if(Features.notices())toggle("Notices","Show toasts above the bottom bar","material_notices");
            if(Features.dialogs())toggle("Floating menus","Option menus float above the bottom edge","material_dialogs");
            if(Features.flairs())toggle("Inline flairs","Show flairs with the post details","flair_style");
            if(Features.flairs())toggle("Reddit flair colours","Use each community's own flair colours","flair_colours",true);
            if(Features.search())toggle("Search page","Show feeds and subscriptions","search_page");
            toggle("Subscriptions button","Show the subscriptions button in the bottom bar","nav_subscriptions",true);
        }
        if(page==2){
            section("Comments");
            toggle("Dynamic header","Show the subreddit and post title","dynamic_header");
            toggle("Remember thread position","Return to the comment you last viewed","remember_position");
            toggle("Touch feedback","Light ticks on tabs, votes and pull to refresh","touch_haptics");
            section("Swipe actions");
            toggle("Comment swipes","Upvote, downvote and reply","comment_swipes");
            toggle("Post swipes","Upvote, downvote, save and hide","post_swipes");
            toggle("Haptic feedback","Vibrate when the selected action changes","swipe_haptics");
            slider("Full swipe travel","swipe_travel",90,50,95,"% of screen",false);
            note("Increasing travel spreads the action stages farther apart.");
        }
        if(page==3){
            section("Stock media viewers");
            note("Media viewers use Boost’s black background, native playback and native gestures. Images and galleries keep a compact action pill. Video uses its original controls without a pill. Predictive Back is enabled through the navigation patch on supported Android versions.");
        }
        if(page==4){
            section("Glass updates");
            slider("Blur refresh interval","blur_interval",16,8,100," ms",false);
            note("16 ms balances smoothness and GPU work. 8 ms matches a 120 Hz screen exactly but costs twice as much. Larger values reduce work, but the glass trails the content.");
        }
        if(page==5)loading();
    }
    private void loading(){
        if(Features.parallelLoading() || Features.requestQueue() || Features.instantLogin() || Features.firstPage())section("Faster loading");
        if(Features.parallelLoading())toggle("Parallel loading","Load feeds and comments at the same time","parallel_loading");
        if(Features.requestQueue())toggle("No startup queue","Stop spacing requests a second apart","request_queue");
        if(Features.instantLogin())toggle("Instant login","Use a saved login that is still valid","instant_login");
        if(Features.firstPage())toggle("Smaller first page","Ask for 25 posts on the first page","first_page");
        if(Features.onlineCheck())section("Connection");
        if(Features.onlineCheck())toggle("Improved online check","Try requests when Android reports a block","online_check");
        note("HTTP/2 is chosen when you patch.");
    }
    private void confirmRestart(String message){
        int theme=getResources().getIdentifier("ThemeOverlay.Material3.MaterialAlertDialog","style",getPackageName());
        AlertDialog confirmation=new AlertDialog.Builder(this,theme)
            .setTitle("Restart Boost?")
            .setMessage(message)
            .setNegativeButton("Later",null)
            .setPositiveButton("Restart now",(dialog,which)->{
                Intent launch=getPackageManager().getLaunchIntentForPackage(getPackageName());
                if(launch==null || !prefs(this).edit().commit()){
                    Toast.makeText(this,"Could not restart Boost. Close and reopen the app.",Toast.LENGTH_LONG).show();
                    return;
                }
                Intent restart=Intent.makeRestartActivityTask(launch.getComponent());
                restart.setPackage(getPackageName());
                startActivity(restart);
                System.exit(0);
            })
            .show();
        GradientDrawable surface=new GradientDrawable();
        surface.setColor(MaterialYouTweaks.color(this,"colorSurfaceContainerHigh",android.R.attr.colorBackground));
        surface.setCornerRadius(getResources().getDimension(getResources().getIdentifier("m3_sys_shape_corner_value_extra_large","dimen",getPackageName())));
        int inset=getResources().getDimensionPixelSize(getResources().getIdentifier("mtrl_alert_dialog_background_inset_start","dimen",getPackageName()));
        confirmation.getWindow().setBackgroundDrawable(new InsetDrawable(surface,inset));
        dialogText(confirmation.findViewById(getResources().getIdentifier("alertTitle","id","android")),"TextAppearance.Material3.HeadlineSmall",foreground);
        dialogText(confirmation.findViewById(android.R.id.message),"TextAppearance.Material3.BodyMedium",secondary);
        for(int button:new int[]{DialogInterface.BUTTON_NEGATIVE,DialogInterface.BUTTON_POSITIVE}){
            TextView action=confirmation.getButton(button);
            dialogText(action,"TextAppearance.Material3.LabelLarge",accent);
            action.setAllCaps(false);
        }
        DialogTweaks.onShow(confirmation);
    }
    private void dialogText(TextView view,String appearance,int color){
        if(view==null)return;
        view.setTextAppearance(this,getResources().getIdentifier(appearance,"style",getPackageName()));
        view.setTextColor(color);
    }
    private void updateGlassControls(){
        boolean active=enabled(this,"feed_pill_blur");
        for(SeekBar slider:new SeekBar[]{blurStrength,glassTint}){
            if(slider!=null){
                slider.setEnabled(active);
                slider.setAlpha(active ? 1:DISABLED_SLIDER_ALPHA);
                ((View)slider.getTag()).setAlpha(active ? 1:DISABLED_SLIDER_ALPHA);
            }
        }
    }
    private TextView label(String text,int size,int color){TextView view=new TextView(this);view.setText(text);view.setTextSize(size);view.setTextColor(color);return view;}
    private void ripple(View view){
        android.util.TypedValue value=new android.util.TypedValue();
        getTheme().resolveAttribute(android.R.attr.selectableItemBackground,value,true);
        if(value.resourceId!=0)view.setBackgroundResource(value.resourceId);
    }
    private LinearLayout row(String name,String summary){
        LinearLayout row=new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(20),dp(16),dp(20),dp(16));
        row.setMinimumHeight(dp(72));
        LinearLayout labels=new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        labels.addView(label(name,17,foreground));
        if(summary!=null){
            TextView sub=label(summary,14,secondary);
            sub.setPadding(0,dp(4),0,0);
            labels.addView(sub);
        }
        row.addView(labels,new LinearLayout.LayoutParams(0,-2,1));
        ripple(row);
        box().addView(row,new LinearLayout.LayoutParams(-1,-2));
        return row;
    }
    private void destination(String name,String summary,String icon,int target){
        LinearLayout row=row(name,summary);
        ImageView image=new ImageView(this);
        image.setImageResource(getResources().getIdentifier(icon,"drawable",getPackageName()));
        image.setImageTintList(ColorStateList.valueOf(secondary));
        LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(dp(24),dp(24));
        params.rightMargin=dp(24);
        row.addView(image,0,params);
        row.addView(label("›",24,secondary));
        row.setOnClickListener(v->show(target));
    }
    /** The open rounded group; section titles and notes end it. */
    private LinearLayout box(){
        if(group==null){
            group=new LinearLayout(this);group.setOrientation(LinearLayout.VERTICAL);
            group.setBackground(SurfaceAppearanceTweaks.pillBackground(this,MaterialYouTweaks.color(this,"colorSurfaceContainerHigh",android.R.attr.colorBackground),24));
            group.setClipToOutline(true);
            LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-1,-2);
            params.leftMargin=params.rightMargin=dp(12);params.topMargin=dp(8);
            body.addView(group,params);
        }
        return group;
    }
    private void section(String value){group=null;TextView view=label(value,14,accent);view.setPadding(dp(28),dp(20),dp(28),dp(4));body.addView(view);}
    private void note(String value){group=null;TextView view=label(value,14,secondary);view.setPadding(dp(28),dp(16),dp(28),dp(12));body.addView(view);}
    private static Method enforceSwitchWidth(){
        try{
            Method method=SwitchCompat.class.getDeclaredMethod("setEnforceSwitchWidth",boolean.class);
            method.setAccessible(true);
            return method;
        }catch(NoSuchMethodException ignored){return null;}
    }
    private Drawable switchDrawable(String name){
        Drawable drawable=getDrawable(getResources().getIdentifier(name,"drawable",getPackageName())).mutate();
        drawable.setTintList(getColorStateList(getResources().getIdentifier(name+"_tint","color",getPackageName())));
        return drawable;
    }
    private void toggle(String name,String summary,String key){toggle(name,summary,key,true);}
    private void toggle(String name,String summary,String key,boolean fallback){
        LinearLayout row=row(name,summary);
        int layout=getResources().getIdentifier("preference_widget_switch_compat","layout",getPackageName());
        SwitchCompat toggle=(SwitchCompat)getLayoutInflater().inflate(layout,row,false);
        toggle.setThumbTintList(null);
        toggle.setThumbDrawable(switchDrawable("mtrl_switch_thumb"));
        Drawable track=switchDrawable("mtrl_switch_track");
        toggle.setTrackTintList(null);
        toggle.setTrackDrawable(new LayerDrawable(new Drawable[]{track,switchDrawable("mtrl_switch_track_decoration")}));
        toggle.setSwitchMinWidth(track.getIntrinsicWidth());
        if(ENFORCE_SWITCH_WIDTH!=null)try{ENFORCE_SWITCH_WIDTH.invoke(toggle,false);}catch(ReflectiveOperationException ignored){}
        toggle.setSplitTrack(false);
        toggle.setClickable(true);
        toggle.setFocusable(true);
        toggle.setContentDescription(name);
        toggle.setChecked(enabled(this,key,fallback));
        toggle.refreshDrawableState();
        row.addView(toggle);
        toggle.setOnCheckedChangeListener((button,value)->{
            prefs(this).edit().putBoolean("shikify_"+key,value).apply();
            if("feed_pill_blur".equals(key))updateGlassControls();
            if(page==5)confirmRestart("Restart Boost to apply loading changes.");
            else if("header_blur".equals(key) || "header_glass_buttons".equals(key))confirmRestart("Restart Boost to apply the new header style.");
        });
        row.setOnClickListener(v->toggle.performClick());
    }
    private SeekBar slider(String name,String key,int fallback,int min,int max,String suffix,boolean stringValue){
        int current=stringValue ? SurfaceAppearanceTweaks.number(prefs(this),"shikify_"+key,fallback,min,max):number(this,key,fallback,min,max);
        LinearLayout heading=row(name,null);
        TextView value=label(current+suffix,14,secondary);
        heading.addView(value);
        SeekBar seek=new SeekBar(this);
        seek.setTag(heading);
        seek.setMax(max-min);
        seek.setProgress(current-min);
        seek.setProgressTintList(ColorStateList.valueOf(accent));
        seek.setProgressBackgroundTintList(ColorStateList.valueOf(outline));
        seek.setThumbTintList(ColorStateList.valueOf(accent));
        seek.setContentDescription(name);
        seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onProgressChanged(SeekBar bar,int progress,boolean user){int selected=progress+min;value.setText(selected+suffix);if(user){SharedPreferences.Editor editor=prefs(SurfaceSettingsActivity.this).edit();if(stringValue)editor.putString("shikify_"+key,String.valueOf(selected));else editor.putInt("shikify_"+key,selected);editor.apply();}}public void onStartTrackingTouch(SeekBar bar){}public void onStopTrackingTouch(SeekBar bar){}});
        LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(-1,dp(48));
        params.leftMargin=params.rightMargin=dp(20);
        box().addView(seek,params);
        return seek;
    }
}
