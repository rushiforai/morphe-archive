package app.morphe.extension.boost;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Color;
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
import android.widget.Switch;
import android.widget.TextView;

/** Separate, theme-aware preference pages; other patch sources retain their own menus. */
public final class SurfaceSettingsActivity extends Activity {
    private LinearLayout group;
    private LinearLayout body;
    private TextView title;
    private int page,background,foreground,secondary,accent,outline;
    static SharedPreferences prefs(Context context){return PreferenceManager.getDefaultSharedPreferences(context);}
    static boolean enabled(Context context,String key){return prefs(context).getBoolean("shikify_"+key,true);}
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
        body.removeAllViews();group=null;
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
            slider("Blur strength","blur_amount",7,0,25," dp",false);
            slider("Glass tint","glass_tint",40,0,80,"%",false);
            note("Lower tint makes glass clearer. Colours follow Boost’s Material You theme.");
            section("Material 3");
            toggle("Side panel","Rounded boxes and wallpaper colours","side_panel");
            toggle("Empty screens","Tonal icon and button","empty_screens");
            if(Features.notices())toggle("Notices","Show toasts above the bottom bar","material_notices");
            if(Features.dialogs())toggle("Floating menus","Option menus float above the bottom edge","material_dialogs");
            if(Features.flairs())toggle("Inline flairs","Show flairs with the post details","flair_style");
            if(Features.search())toggle("Search page","Show feeds and subscriptions","search_page");
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
        note("Restart Boost for these to apply. HTTP/2 is chosen when you patch.");
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
    private void toggle(String name,String summary,String key){
        LinearLayout row=row(name,summary);
        Switch toggle=new Switch(this);
        toggle.setContentDescription(name);
        toggle.setChecked(enabled(this,key));
        int[][] states={new int[]{android.R.attr.state_checked},new int[]{}};
        toggle.setThumbTintList(new ColorStateList(states,new int[]{accent,secondary}));
        toggle.setTrackTintList(new ColorStateList(states,new int[]{(accent&0xffffff)|0x66000000,outline}));
        row.addView(toggle,new LinearLayout.LayoutParams(dp(56),dp(48)));
        toggle.setOnCheckedChangeListener((button,value)->prefs(this).edit().putBoolean("shikify_"+key,value).apply());
        row.setOnClickListener(v->toggle.setChecked(!toggle.isChecked()));
    }
    private void slider(String name,String key,int fallback,int min,int max,String suffix,boolean stringValue){
        int current=stringValue ? SurfaceAppearanceTweaks.number(prefs(this),"shikify_"+key,fallback,min,max):number(this,key,fallback,min,max);
        LinearLayout heading=row(name,null);
        TextView value=label(current+suffix,14,secondary);
        heading.addView(value);
        SeekBar seek=new SeekBar(this);
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
    }
}
