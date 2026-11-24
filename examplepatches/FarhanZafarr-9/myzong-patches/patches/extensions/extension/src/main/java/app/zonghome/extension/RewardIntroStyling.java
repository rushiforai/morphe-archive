package app.zonghome.extension;

import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.WeakHashMap;

/** Visual-only treatment of identified reward, rules, history and introduction views. */
final class RewardIntroStyling {
    private static final WeakHashMap<View,Boolean> PREPARED=new WeakHashMap<>();
    private static final ColorStateList CELL_FILL=new ColorStateList(
        new int[][]{{-android.R.attr.state_enabled},{android.R.attr.state_selected},{android.R.attr.state_checked},{}},
        new int[]{CharcoalTheme.SURFACE,CharcoalTheme.ACCENT,CharcoalTheme.ACCENT,CharcoalTheme.RAISED});
    private static final ColorStateList CELL_TEXT=new ColorStateList(
        new int[][]{{-android.R.attr.state_enabled},{android.R.attr.state_selected},{android.R.attr.state_checked},{}},
        new int[]{CharcoalTheme.MUTED,CharcoalTheme.ON_ACCENT,CharcoalTheme.ON_ACCENT,CharcoalTheme.TEXT});
    private static final ColorStateList SURFACE=ColorStateList.valueOf(CharcoalTheme.SURFACE);
    private static final ColorStateList PRIMARY=new ColorStateList(new int[][]{{-android.R.attr.state_enabled},{}},new int[]{CharcoalTheme.RAISED,CharcoalTheme.ACCENT});
    private static final ColorStateList ON_PRIMARY=new ColorStateList(new int[][]{{-android.R.attr.state_enabled},{}},new int[]{CharcoalTheme.MUTED,CharcoalTheme.ON_ACCENT});
    private static final ColorStateList ICON_TEXT=ColorStateList.valueOf(CharcoalTheme.TEXT);
    private static final ColorStateList MUTED=ColorStateList.valueOf(CharcoalTheme.MUTED);
    private static int dp(View view,int value) {
        return Math.round(value*view.getResources().getDisplayMetrics().density);
    }
    private static final class Panel extends GradientDrawable {
        Panel(View view) { setColor(CharcoalTheme.SURFACE);setCornerRadius(dp(view,24)); }
    }
    private static void panel(View view) {
        if(NavigationStyle.shapes() && !(view.getBackground() instanceof Panel))view.setBackground(new Panel(view));
        if(view.getBackgroundTintList()!=SURFACE)view.setBackgroundTintList(SURFACE);
    }
    private static boolean introSibling(View view) {
        return view.getParent() instanceof View && ViewNames.find((View)view.getParent(),"btnLetsGo")!=null &&
            ViewNames.find((View)view.getParent(),"tv200Mb")!=null;
    }
    private static void text(View view,int color,int sp,boolean bold) {
        if(!(view instanceof TextView))return;
        TextView label=(TextView)view;
        clearInlineColors(label);
        if(label.getCurrentTextColor()!=color)label.setTextColor(color);
        if(!NavigationStyle.shapes())return;
        float px=TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP,sp,view.getResources().getDisplayMetrics());
        if(Math.abs(label.getTextSize()-px)>0.5f)label.setTextSize(TypedValue.COMPLEX_UNIT_SP,sp);
        if(bold && (label.getTypeface()==null || !label.getTypeface().isBold()))label.setTypeface(label.getTypeface(),Typeface.BOLD);
        if(sp<=14 && label.getLineSpacingExtra()!=dp(view,3))label.setLineSpacing(dp(view,3),1f);
    }
    private static void clearInlineColors(TextView view) {
        CharSequence value=view.getText();
        if(!(value instanceof android.text.Spanned))return;
        android.text.style.ForegroundColorSpan[] colors=((android.text.Spanned)value).getSpans(0,value.length(),android.text.style.ForegroundColorSpan.class);
        if(colors.length==0)return;
        android.text.Spannable text=value instanceof android.text.Spannable?(android.text.Spannable)value:new android.text.SpannableString(value);
        for(android.text.style.ForegroundColorSpan color:colors)text.removeSpan(color);
        if(text!=value)view.setText(text);
    }
    private static void action(View view) {
        if(view.getBackgroundTintList()!=PRIMARY)view.setBackgroundTintList(PRIMARY);
        if(view instanceof TextView && ((TextView)view).getTextColors()!=ON_PRIMARY)((TextView)view).setTextColor(ON_PRIMARY);
        if(!NavigationStyle.shapes())return;
        MaterialShapes.buttonRadius(view,dp(view,20));
        if(PREPARED.put(view,true)!=null)return;
        if(view instanceof TextView)((TextView)view).setAllCaps(false);
        int minimum=Math.round(dp(view,48)*Math.max(1f,view.getResources().getConfiguration().fontScale));
        view.setMinimumHeight(Math.max(minimum,view.getMinimumHeight()));
        ViewGroup.LayoutParams params=view.getLayoutParams();
        if(params!=null && params.height>=0 && params.height<minimum){params.height=minimum;view.setLayoutParams(params);}
    }
    static void apply(View view) {
        String name=ViewNames.name(view);
        if((name.startsWith("btn_item_") && name.length()==10 || name.startsWith("iv_item_") && name.length()==9) &&
            name.charAt(name.length()-1)>='1' && name.charAt(name.length()-1)<='8' && view instanceof TextView) {
            clearInlineColors((TextView)view);
            if(view.getBackgroundTintList()!=CELL_FILL)view.setBackgroundTintList(CELL_FILL);
            if(((TextView)view).getTextColors()!=CELL_TEXT)((TextView)view).setTextColor(CELL_TEXT);
            if(NavigationStyle.shapes())MaterialShapes.buttonRadius(view,dp(view,12));
            return; // Do not resize, reposition or change MotionLayout/game actions.
        }
        switch(name) {
            case "items_container":case "view_congrats":panel(view);break;
            case "topView":if(introSibling(view))panel(view);break;
            case "tvTitle":case "tvWelcome":
                if(introSibling(view))text(view,CharcoalTheme.TEXT,20,true);break;
            case "tv200Mb":if(introSibling(view))text(view,CharcoalTheme.ACCENT,28,true);break;
            case "tvGetFree":case "tvDescription":
                if(introSibling(view))text(view,CharcoalTheme.MUTED,14,false);break;
            case "tv_congrats_title":text(view,CharcoalTheme.TEXT,22,true);break;
            case "tv_congrats_subtitle":text(view,CharcoalTheme.MUTED,14,false);break;
            case "tv_game_rules_title_text":case "tv_game_history_title":text(view,CharcoalTheme.TEXT,16,true);break;
            case "tv_rules_sub_text":case "tv_game_history_sub_title":case "tv_tap_bubble":
                text(view,CharcoalTheme.MUTED,14,false);break;
            case "tvRule":text(view,CharcoalTheme.TEXT,14,false);break;
            case "tvAwardDate":text(view,CharcoalTheme.MUTED,12,false);break;
            case "tvAwardFree":case "tvAwardPaid":case "tvAwardPaid1":case "tvAwardPaid2":case "tvAwardPaid3":
                text(view,CharcoalTheme.TEXT,14,false);break;
            case "btnLetsGo":case "btn_item_shuffle":action(view);break;
            case "btn_home":
                if(view.getParent() instanceof View && ViewNames.find((View)view.getParent(),"tv_congrats_title")!=null)action(view);
                break;
            case "iv_top_arc":case "iv_bottom_arc":
                if(view instanceof ImageView && ((ImageView)view).getImageTintList()!=MUTED)((ImageView)view).setImageTintList(MUTED);
                if(view.getAlpha()!=0.2f)view.setAlpha(0.2f);break;
            case "imgCross":
                if(view instanceof ImageView && view.getParent() instanceof View &&
                    ViewNames.find((View)view.getParent(),"tv_congrats_title")!=null) {
                    ImageView close=(ImageView)view;
                    if(close.getImageTintList()!=ICON_TEXT)close.setImageTintList(ICON_TEXT);
                    if(close.getContentDescription()==null || close.getContentDescription().length()==0)
                        close.setContentDescription("Close reward notice");
                    if(NavigationStyle.shapes() && PREPARED.put(view,true)==null) {
                        ViewGroup.LayoutParams params=view.getLayoutParams();
                        if(params!=null) {
                            params.width=Math.max(params.width,dp(view,44));params.height=Math.max(params.height,dp(view,44));
                            view.setLayoutParams(params);
                        }
                        int padding=dp(view,12);view.setPadding(padding,padding,padding,padding);
                        close.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
                    }
                }
                break;
            case "imgOnBoarding":
                if(view instanceof ImageView && ((ImageView)view).getScaleType()!=ImageView.ScaleType.FIT_CENTER)
                    ((ImageView)view).setScaleType(ImageView.ScaleType.FIT_CENTER);
                if(view.getBackgroundTintList()!=null)view.setBackgroundTintList(null);
                if(!(view.getBackground() instanceof android.graphics.drawable.ColorDrawable) ||
                    ((android.graphics.drawable.ColorDrawable)view.getBackground()).getColor()!=CharcoalTheme.BG)
                    view.setBackgroundColor(CharcoalTheme.BG);
                break; // Preserve illustration/text embedded in the image rather than tinting it.
        }
    }
}
