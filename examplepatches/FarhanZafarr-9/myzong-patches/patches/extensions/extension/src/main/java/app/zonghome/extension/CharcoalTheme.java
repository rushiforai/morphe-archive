package app.zonghome.extension;

import android.app.Activity;
import android.app.Dialog;
import android.app.Application;
import android.content.res.ColorStateList;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageView;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.widget.ProgressBar;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Native-screen touch-ups. No image inversion, credential handling or network access. */
public final class CharcoalTheme {
    private CharcoalTheme() {}
    public static final int BG=0xff141414, SURFACE=0xff242424, RAISED=0xff303030;
    public static final int TRACK=0xff444444;
    public static final int TEXT=0xffe8e8e8, MUTED=0xffb7b7b7, ACCENT=0xffacd58e, ON_ACCENT=0xff161616;
    private static boolean installed;
    private static final WeakHashMap<View, State> ROOTS=new WeakHashMap<>();

    /** Filled in at patch time. Older Android versions always use the fixed accent. */
    public static boolean useSystemAccent() { return true; }

    public static void install(Application application) {
        if(installed || application==null)return;
        installed=true;
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(Activity a,Bundle saved){ attach(a); }
            @Override public void onActivityResumed(Activity a){ attach(a); }
            @Override public void onActivityDestroyed(Activity a){
                View root=a.getWindow().getDecorView();State state=ROOTS.remove(root);
                if(state!=null)state.detach();
            }
            @Override public void onActivityStarted(Activity a){}
            @Override public void onActivityPaused(Activity a){}
            @Override public void onActivityStopped(Activity a){}
            @Override public void onActivitySaveInstanceState(Activity a,Bundle b){}
        });
    }

    public static void onDialogShown(Object candidate) {
        if(!(candidate instanceof Dialog))return;
        Dialog dialog=(Dialog)candidate;
        PromotionControls.onDialogShown(dialog);
        if(NavigationStyle.shapes() && dialog.getWindow()!=null) MaterialShapes.dialog(dialog.getWindow().getDecorView());
        if(!installed)return;
        Window window=dialog.getWindow();
        if(window==null || !dialog.isShowing())return;
        View root=window.getDecorView();
        State state=ROOTS.get(root);
        if(state==null) {
            state=new State(root);ROOTS.put(root,state);root.addOnAttachStateChangeListener(state);
            if(root.isAttachedToWindow())state.onViewAttachedToWindow(root);
        }
        state.refreshAccent(root);state.onPreDraw();
    }
    public static int tabIndicatorColor(View view, int original) {
        if(!installed)return original;
        if(useSystemAccent() && Build.VERSION.SDK_INT>=31) {
            int id=view.getResources().getIdentifier("system_accent1_200","color","android");
            if(id!=0)return view.getResources().getColor(id,view.getContext().getTheme());
        }
        return ACCENT;
    }
    public static void refreshValidityControls() {
        if(!installed)return;
        ChipStyling.refreshVisiblePages();
        for(State state:ROOTS.values()) {
            View root=state.root.get();
            if(root==null)continue;
            for(String name:new String[]{"view_validity","btn_monthly","btn_weekly","btn_daily","tabsBundleMain"}) {
                View view=ViewNames.find(root,name);
                if(view!=null && view.getVisibility()==View.VISIBLE) {
                    state.polishComponents(view);
                    if(NavigationStyle.shapes())MaterialShapes.apply(view);
                }
            }
        }
    }
    public static void onBoundView(View view) {
        if (!installed) return;
        android.content.Context context = view.getContext();
        while (context instanceof android.content.ContextWrapper && !(context instanceof Activity)) {
            android.content.Context next = ((android.content.ContextWrapper)context).getBaseContext();
            if (next == context) break;
            context = next;
        }
        State state = context instanceof Activity ? ROOTS.get(((Activity)context).getWindow().getDecorView()) : null;
        if (state == null) { state = new State(view); state.refreshAccent(view); }
        state.walk(view, false);
    }
    private static void attach(Activity a) {
        if(!a.getClass().getName().startsWith("com.zong.customercare."))return;
        Window window=a.getWindow();View root=window.getDecorView();
        window.setBackgroundDrawable(new ColorDrawable(BG));
        window.setStatusBarColor(BG);window.setNavigationBarColor(BG);
        int flags=root.getSystemUiVisibility() & ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
        if(Build.VERSION.SDK_INT>=26)flags &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
        root.setSystemUiVisibility(flags);
        State state=ROOTS.get(root);
        if(state==null){
            state=new State(root);ROOTS.put(root,state);root.addOnAttachStateChangeListener(state);
            if(root.isAttachedToWindow())state.onViewAttachedToWindow(root);
        }
        state.refreshAccent(root);
    }

    private static boolean neutral(int color){
        int r=(color>>>16)&255,g=(color>>>8)&255,b=color&255;
        return Math.max(r,Math.max(g,b))-Math.min(r,Math.min(g,b))<18;
    }
    private static boolean light(int color){return neutral(color) && ((color>>>24)&255)>200 && (color&255)>=215;}

    private static final class State implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener {
        final WeakReference<View> root;
        final java.util.HashMap<Class<?>,java.lang.reflect.Method[]> shapeAccessors=new java.util.HashMap<>();
        ViewTreeObserver observer;
        int accent=ACCENT,previousAccent=ACCENT;
        long lastBundlePass;
        final java.util.WeakHashMap<View,Integer> tabIndicators=new java.util.WeakHashMap<>();
        ColorStateList accentTint=ColorStateList.valueOf(ACCENT);
        ColorStateList actionTint=new ColorStateList(new int[][]{{-android.R.attr.state_enabled},{}},new int[]{RAISED,ACCENT});
        final ColorStateList filledText=new ColorStateList(new int[][]{{-android.R.attr.state_enabled},{}},new int[]{MUTED,ON_ACCENT});
        ColorStateList filterChoiceTint=new ColorStateList(
            new int[][]{{-android.R.attr.state_enabled},{android.R.attr.state_checked},{android.R.attr.state_selected},{}},
            new int[]{SURFACE,TRACK,TRACK,RAISED});
        ColorStateList filterChoiceText=new ColorStateList(
            new int[][]{{-android.R.attr.state_enabled},{android.R.attr.state_checked},{android.R.attr.state_selected},{}},
            new int[]{MUTED,ACCENT,ACCENT,TEXT});
        final ColorStateList secondaryText=new ColorStateList(new int[][]{{-android.R.attr.state_enabled},{}},new int[]{MUTED,TEXT});
        ColorStateList navTint=new ColorStateList(new int[][]{{android.R.attr.state_checked},{}},new int[]{ACCENT,MUTED});
        final ColorStateList neutralChipTint=new ColorStateList(
            new int[][]{{android.R.attr.state_selected},{}},new int[]{TRACK,RAISED});
        State(View v){root=new WeakReference<>(v);}
        void refreshAccent(View view){
            int next=ACCENT;
            if(useSystemAccent() && Build.VERSION.SDK_INT>=31){
                int id=view.getResources().getIdentifier("system_accent1_200","color","android");
                if(id!=0){
                    try { next=view.getResources().getColor(id,view.getContext().getTheme()); }
                    catch(android.content.res.Resources.NotFoundException ignored){}
                }
            }
            previousAccent=accent;accent=next;
            filterChoiceText=new ColorStateList(
                new int[][]{{-android.R.attr.state_enabled},{android.R.attr.state_checked},{android.R.attr.state_selected},{}},
                new int[]{MUTED,accent,accent,TEXT});
            accentTint=ColorStateList.valueOf(accent);
            actionTint=new ColorStateList(new int[][]{{-android.R.attr.state_enabled},{}},new int[]{RAISED,accent});
            navTint=new ColorStateList(new int[][]{{android.R.attr.state_checked},{}},new int[]{accent,MUTED});
        }
        @Override public boolean onPreDraw(){
            View view=root.get();
            if(view!=null){
                View bundles=ViewNames.find(view,"cardViewBundleMain")==null?null:ViewNames.find(view,"viewPager2");
                long now=android.os.SystemClock.uptimeMillis();
                if(bundles!=null && bundles.isShown() && lastBundlePass!=0 && now-lastBundlePass<200)return true;
                walk(view,true);previousAccent=accent;lastBundlePass=now;
            }
            return true;
        }
        private void walk(View v,boolean decor){
            if(v.getVisibility()!=View.VISIBLE)return;
            Drawable background=v.getBackground();
            if(background instanceof ColorDrawable && light(((ColorDrawable)background).getColor()))
                v.setBackgroundColor(decor?BG:SURFACE);
            if(Build.VERSION.SDK_INT>=24 && background instanceof GradientDrawable && !entryName(v).equals("btnFavourite") && !ChipStyling.ownsBackground(background)){
                ColorStateList color=((GradientDrawable)background).getColor();
                if(color!=null && light(color.getDefaultColor()))((GradientDrawable)background).setColor(SURFACE);
            }
            if(background!=null && !(background instanceof ColorDrawable) && !(background instanceof GradientDrawable)) darkShape(background);
            if(v instanceof TextView && !insideRewardAction(v)){
                TextView text=(TextView)v;int color=text.getCurrentTextColor();
                ColorStateList tint=v.getBackgroundTintList();
                boolean filled=v instanceof Button && tint!=null &&
                        (tint.getDefaultColor()==ACCENT || tint.getDefaultColor()==previousAccent || tint.getDefaultColor()==accent);
                if(filled){
                    if(tint.getDefaultColor()!=accent)v.setBackgroundTintList(accentTint);
                    int desired=v.isEnabled()?ON_ACCENT:MUTED;
                    if(text.getCurrentTextColor()!=desired)text.setTextColor(filledText);
                }else if(!text.getTextColors().isStateful() && (color==ACCENT || color==previousAccent)){
                    if(color!=accent)text.setTextColor(accent);
                }else if(!text.getTextColors().isStateful() && neutral(color) && (color&255)<210){
                    int desired=((color&255)<100)?TEXT:MUTED;
                    if(color!=desired)text.setTextColor(desired);
                }
            }
            if(v instanceof ProgressBar){
                ProgressBar bar=(ProgressBar)v;
                ColorStateList tint=bar.getProgressTintList();
                if(tint==null || tint.getDefaultColor()==ACCENT || tint.getDefaultColor()==previousAccent){
                    if(tint==null || tint.getDefaultColor()!=accent)bar.setProgressTintList(accentTint);
                }
            }
            if(v.getId()!=View.NO_ID){
                String name=entryName(v);
                if("bottomNav".equals(name)){
                    setTint(v,"setItemTextColor",navTint);setTint(v,"setItemIconTintList",navTint);
                }
                if("layoutToolbar".equals(name) || "myActionBar".equals(name)) {
                    solidBackground(v,SURFACE);
                }
                if("containerStatus".equals(name)) {
                    solidBackground(v,BG);
                    if(v.getParent() instanceof View)solidBackground((View)v.getParent(),BG);
                }
                if("topItems".equals(name) || "mView".equals(name) || "ivHeaderImages".equals(name)) {
                    solidBackground(v,BG);
                    if(v instanceof ImageView && ((ImageView)v).getDrawable()!=null)
                        ((ImageView)v).setImageDrawable(null);
                }
                if("search_src_text".equals(name) && v instanceof TextView) {
                    TextView search=(TextView)v;
                    if(search.getCurrentTextColor()!=TEXT)search.setTextColor(TEXT);
                    if(search.getCurrentHintTextColor()!=MUTED)search.setHintTextColor(MUTED);
                }
                if("progressBackground".equals(name) || "progressBackgroundVoice".equals(name) ||
                        "progressBackgroundSms".equals(name) || "progress_background".equals(name) ||
                        "progress_background_green".equals(name)){
                    ColorStateList tint=v.getBackgroundTintList();
                    if(tint==null || tint.getDefaultColor()!=TRACK)v.setBackgroundTintList(ColorStateList.valueOf(TRACK));
                }
            }
            if(v instanceof ViewGroup){ViewGroup group=(ViewGroup)v;for(int i=0;i<group.getChildCount();i++)walk(group.getChildAt(i),false);}
            polishComponents(v);
        }
        private void darkShape(Drawable drawable) {
            Class<?> type=drawable.getClass();
            java.lang.reflect.Method[] access=shapeAccessors.get(type);
            if(access==null) {
                try {
                    access=new java.lang.reflect.Method[]{type.getMethod("getFillColor"),type.getMethod("setFillColor",ColorStateList.class)};
                }catch(NoSuchMethodException | SecurityException ignored){access=new java.lang.reflect.Method[0];}
                shapeAccessors.put(type,access);
            }
            if(access.length!=2)return;
            try {
                Object fill=access[0].invoke(drawable);
                if(fill instanceof ColorStateList && light(((ColorStateList)fill).getDefaultColor()))
                    access[1].invoke(drawable,ColorStateList.valueOf(SURFACE));
            }catch(ReflectiveOperationException | SecurityException ignored){}
        }        private boolean insideRewardAction(View view) {
            android.view.ViewParent parent=view.getParent();
            while(parent instanceof View) {
                if("cardPlay".equals(entryName((View)parent)))return true;
                parent=parent.getParent();
            }
            return false;
        }
        private String entryName(View view) { return ViewNames.name(view); }
        private static int dp(View view,float value) {
            return Math.round(value*view.getResources().getDisplayMetrics().density);
        }
        private void readableText(TextView text,int color) {
            if(text.getCurrentTextColor()!=color)text.setTextColor(color);
            // Server-provided HTML on these specific labels may override TextView textColor.
            CharSequence original=text.getText();
            if(original instanceof Spanned) {
                ForegroundColorSpan[] spans=((Spanned)original).getSpans(0,original.length(),ForegroundColorSpan.class);
                if(spans.length>0) {
                    Spannable editable=original instanceof Spannable?(Spannable)original:new SpannableString(original);
                    for(ForegroundColorSpan span:spans)editable.removeSpan(span);
                    if(editable!=original)text.setText(editable);
                }
            }
        }
        private void backgroundTint(View view,ColorStateList tint) {
            ColorStateList old=view.getBackgroundTintList();
            if(old!=tint)
                view.setBackgroundTintList(tint);
        }
        private void actionButton(View view) {
            if(!(view instanceof TextView))return;
            backgroundTint(view,actionTint);
            TextView text=(TextView)view;
            Drawable actual=view.getBackground();
            if(actual!=null)actual.mutate().setTintList(actionTint);
            if(text.getTextColors()!=filledText)text.setTextColor(filledText);
        }
        private void compactAvailableLoan(View view) {
            float scale=Math.max(1f,view.getResources().getConfiguration().fontScale);
            int low=dp(view,56*scale),high=dp(view,76*scale),wanted=low;
            if(view instanceof ViewGroup) {
                ViewGroup group=(ViewGroup)view;
                int pad=dp(view,6);
                for(int i=0;i<group.getChildCount();i++) {
                    View child=group.getChildAt(i);
                    if(child instanceof ViewGroup) {
                        if(child.getPaddingTop()!=pad || child.getPaddingBottom()!=pad)
                            child.setPadding(child.getPaddingLeft(),pad,child.getPaddingRight(),pad);
                        wanted=Math.max(wanted,child.getMeasuredHeight()+view.getPaddingTop()+view.getPaddingBottom());
                    }
                }
            }
            wanted=Math.min(high,wanted);
            if(view.getMinimumHeight()!=low)view.setMinimumHeight(low);
            ViewGroup.LayoutParams lp=view.getLayoutParams();
            if(lp!=null && lp.height!=wanted){lp.height=wanted;view.setLayoutParams(lp);}
        }
        private void growLoanCard(View view) {
            if("cardLoanAvailable".equals(entryName(view))){compactAvailableLoan(view);return;}
            float fontScale=Math.max(1f,view.getResources().getConfiguration().fontScale);
            int minimum=dp(view,80*fontScale);
            if(view.getMinimumHeight()<minimum)view.setMinimumHeight(minimum);
            ViewGroup.LayoutParams lp=view.getLayoutParams();
            if(lp!=null && lp.height!=ViewGroup.LayoutParams.WRAP_CONTENT) {
                lp.height=ViewGroup.LayoutParams.WRAP_CONTENT;view.setLayoutParams(lp);
            }
            if(view instanceof ViewGroup) {
                ViewGroup group=(ViewGroup)view;
                int padding=dp(view,10);
                // The actual vertical content is wrap_content; retain match-parent disabled overlays.
                for(int i=0;i<group.getChildCount();i++) {
                    View child=group.getChildAt(i);
                    if(child instanceof ViewGroup && child.getPaddingTop()<padding)
                        child.setPadding(child.getPaddingLeft(),padding,child.getPaddingRight(),padding);
                }
            }
        }
        private void chip(TextView view) { ChipStyling.style(view); }
        private void tintCard(View view,int color) {
            try {
                Object current=view.getClass().getMethod("getCardBackgroundColor").invoke(view);
                if(!(current instanceof ColorStateList) || ((ColorStateList)current).getDefaultColor()!=color)
                    view.getClass().getMethod("setCardBackgroundColor",int.class).invoke(view,color);
            }catch(ReflectiveOperationException | SecurityException ignored){backgroundTint(view,ColorStateList.valueOf(color));}
        }
        private void childText(View view,int color) {
            if(view instanceof TextView)readableText((TextView)view,color);
            if(view instanceof ViewGroup) {
                ViewGroup group=(ViewGroup)view;
                for(int i=0;i<group.getChildCount();i++)childText(group.getChildAt(i),color);
            }
        }
        private boolean inBundleFilter(View view) {
            View current=view;
            while(current!=null) {
                String name=entryName(current);
                if(name.equals("rvFilters") || name.equals("rvRanges"))return true;
                if(name.equals("bottomSheet")) {
                    int id=current.getResources().getIdentifier("rvFilters","id","com.zong.customercare");
                    return id!=0 && current.findViewById(id)!=null;
                }
                current=current.getParent() instanceof View?(View)current.getParent():null;
            }
            return false;
        }
        private void filterChoice(TextView view) {
            ColorStateList old=view.getBackgroundTintList();
            if(old!=filterChoiceTint) {
                if(old!=null) {
                    int color=old.getDefaultColor();
                    view.setSelected(color==accent || color==ACCENT || color==0xffe40077 || color==0xffed0181);
                }
                view.setBackgroundTintList(filterChoiceTint);
            }
            if(view.getTextColors()!=filterChoiceText)view.setTextColor(filterChoiceText);
            try {
                ColorStateList stroke = new ColorStateList(
                    new int[][]{{android.R.attr.state_checked},{android.R.attr.state_selected},{}},
                    new int[]{accent,accent,TRACK});
                Object current = view.getClass().getMethod("getStrokeColor").invoke(view);
                if (!(current instanceof ColorStateList) || ((ColorStateList)current).getDefaultColor()!=TRACK ||
                        ((ColorStateList)current).getColorForState(new int[]{android.R.attr.state_selected},TRACK)!=accent)
                    view.getClass().getMethod("setStrokeColor",ColorStateList.class).invoke(view,stroke);
            } catch (ReflectiveOperationException ignored) { }
        }        private static final class BundleSurface extends GradientDrawable {
            BundleSurface(View view, boolean rounded) {
                setColor(SURFACE);
                setStroke(Math.max(1,dp(view,0.5f)),TRACK);
                setCornerRadius(rounded?dp(view,10):0);
            }
        }
        private void bundleSurface(View view, boolean rounded) {
            // Adapter rebinds may restore a light drawable/tint. Repair before every draw.
            if(view.getBackgroundTintList()!=null)view.setBackgroundTintList(null);
            if(!(view.getBackground() instanceof BundleSurface))
                view.setBackground(new BundleSurface(view,rounded));
            if(rounded && !view.getClipToOutline())view.setClipToOutline(true);
        }
        private void polishComponents(View view) {
            String name=entryName(view);
            if(name.equals("llResources") || name.equals("ll_resources") || name.equals("rootBundleInfoItem")) {
                if(NavigationStyle.shapes()) {
                    if(name.equals("llResources")) MaterialShapes.styleResourceGrid(view);
                    else MaterialShapes.styleStandaloneCell(view);
                } else bundleSurface(view,true);
            }
            if(!NavigationStyle.shapes() && (name.length()==5 && name.startsWith("info") && name.charAt(4)>='1' && name.charAt(4)<='8') && view.getParent() instanceof View &&
                    ((View)view.getParent()).getParent() instanceof View &&
                    entryName((View)((View)view.getParent()).getParent()).equals("llResources"))
                bundleSurface(view,false);
            if(name.equals("cvSearch"))tintCard(view,SURFACE);
            if(name.equals("tvFlagName") && view instanceof TextView)readableText((TextView)view,TEXT);
            if(name.equals("ivImage") && view instanceof ImageView) {
                View parent=view;
                while(parent!=null && !entryName(parent).equals("rvDynamicSearch"))
                    parent=parent.getParent() instanceof View?(View)parent.getParent():null;
                if(parent!=null) {
                    ImageView icon=(ImageView)view;
                    if(icon.getImageTintList()!=accentTint)icon.setImageTintList(accentTint);
                }
            }
            if(view instanceof TextView) {
                TextView text=(TextView)view;
                if(name.equals("tvMobileNumber") || name.equals("rechargeBundle") ||
                   name.equals("lblMobileNumber") || name.equals("lblEnterRechargeAmount") ||
                   name.equals("tvPaymentMethodsLabel") || name.equals("tvCaptchaLabel") ||
                   name.equals("tvWalletNumber") || name.equals("tvPaymentType") || name.equals("currency"))
                    readableText(text,TEXT);
                if(name.equals("etAmount") || name.equals("etMobileNumber") || name.equals("etWalletNumber")) {
                    readableText(text,TEXT);
                    if(text.getCurrentHintTextColor()!=MUTED)text.setHintTextColor(MUTED);
                }
                if(name.equals("tvBalanceExpiry") || name.equals("tvTariff") || name.equals("tvAmountLimit"))
                    readableText(text,MUTED);
                if(name.equals("tvBalance"))readableText(text,accent);
                if(name.equals("btnLoan") || name.equals("btnPayLoan"))actionButton(view);
                if(name.equals("btn_monthly") || name.equals("btn_weekly") || name.equals("btn_daily"))chip(text);
                if(((name.startsWith("btn_item_") && name.length()==10 || name.startsWith("iv_item_") && name.length()==9) && name.charAt(name.length()-1)>='1' && name.charAt(name.length()-1)<='8')) {
                    backgroundTint(view,ColorStateList.valueOf(RAISED));readableText(text,view.isEnabled()?TEXT:MUTED);
                    // Keep existing state, shape, animation, dimensions and click handling.
                }
                if(name.equals("btn_item_shuffle"))actionButton(view);
            }
            if(name.equals("cardLoanAvailable") || name.equals("cardLoanReturn"))growLoanCard(view);
            if(name.equals("cardDoubleLoan") || name.equals("cardSingleLoan")) {
                ViewGroup.LayoutParams lp=view.getLayoutParams();
                if(lp!=null && lp.height>0){lp.height=ViewGroup.LayoutParams.WRAP_CONTENT;view.setLayoutParams(lp);}
            }
            if(name.equals("disableDoubleView") || name.equals("disableSingleView")) {
                ViewGroup.LayoutParams lp=view.getLayoutParams();
                if(lp!=null && lp.height!=ViewGroup.LayoutParams.MATCH_PARENT) {
                    lp.height=ViewGroup.LayoutParams.MATCH_PARENT;view.setLayoutParams(lp);
                }
            }
            if(name.equals("view_validity")) {
                solidBackground(view,0x00000000);
                int minimum=dp(view,40*Math.max(1f,view.getResources().getConfiguration().fontScale));
                if(view.getMinimumHeight()<minimum)view.setMinimumHeight(minimum);
                ViewGroup.LayoutParams lp=view.getLayoutParams();
                // 0dp constrained children need an explicitly sized parent row.
                if(lp!=null && lp.height!=minimum){lp.height=minimum;view.setLayoutParams(lp);}
            }
            if(name.equals("items_container") || name.equals("tv_mode_title"))
                backgroundTint(view,ColorStateList.valueOf(SURFACE));
            if(name.equals("iv_top_arc") || name.equals("iv_bottom_arc")) {
                if(view instanceof ImageView) {
                    ImageView image=(ImageView)view;ColorStateList old=image.getImageTintList();
                    if(old==null || old.getDefaultColor()!=SURFACE)image.setImageTintList(ColorStateList.valueOf(SURFACE));
                }
            }
            if(name.equals("cardContent") || name.equals("cardLogo"))tintCard(view,SURFACE);
            if(name.equals("cardPlay")){tintCard(view,accent);childText(view,ON_ACCENT);}
            if(name.equals("iv_game_rules") || name.equals("iv_game_history")) {
                backgroundTint(view,ColorStateList.valueOf(RAISED));
                if(view instanceof ImageView) {
                    ImageView image=(ImageView)view;ColorStateList old=image.getImageTintList();
                    if(old==null || old.getDefaultColor()!=TEXT)image.setImageTintList(ColorStateList.valueOf(TEXT));
                }
            }
            if(view instanceof TextView && inBundleFilter(view)) {
                TextView text=(TextView)view;
                if(name.equals("btn") || name.equals("btnFilterItem"))filterChoice(text);
                if(name.equals("btnApply"))actionButton(view);
                if(name.equals("btnClearAll") || name.equals("btnCancel")) {
                    backgroundTint(view,ColorStateList.valueOf(RAISED));
                    if(text.getTextColors()!=secondaryText)text.setTextColor(secondaryText);
                }
            }
            if(name.equals("lblVersion") && view instanceof TextView)readableText((TextView)view,MUTED);
            if(name.equals("view_bg") && view instanceof ImageView && view.getParent() instanceof View) {
                View parent=(View)view.getParent();
                int game=parent.getResources().getIdentifier("game1","id","com.zong.customercare");
                if(game!=0 && parent.findViewById(game)!=null) {
                    ImageView image=(ImageView)view;
                    if(!(image.getDrawable() instanceof PaidRewardBackdrop)) {
                        int labelId=view.getResources().getIdentifier("paid_mode","string","com.zong.customercare");
                        String label=labelId!=0?view.getResources().getString(labelId):"Paid Mode";
                        image.setScaleType(ImageView.ScaleType.FIT_XY);
                        image.setImageDrawable(new PaidRewardBackdrop(label));
                    }
                }
            }
            if(name.equals("loader_gif") && view instanceof ImageView) {
                ImageView image=(ImageView)view;Drawable previous=image.getDrawable();
                CrispLoadingDrawable loader;
                if(previous instanceof CrispLoadingDrawable)loader=(CrispLoadingDrawable)previous;
                else {
                    if(previous instanceof android.graphics.drawable.Animatable) {
                        try {((android.graphics.drawable.Animatable)previous).stop();}
                        catch(IllegalStateException alreadyDisposed){}
                    }
                    loader=new CrispLoadingDrawable(view.getResources().getDisplayMetrics().density,accent,TEXT);
                    image.setScaleType(ImageView.ScaleType.CENTER_INSIDE);image.setImageDrawable(loader);
                }
                loader.colors(accent,TEXT);
                if(view.isShown())loader.start();else loader.stop();
            }
            if(name.equals("tvFilterBy") && view instanceof TextView) {
                TextView text=(TextView)view;readableText(text,TEXT);
                for(Drawable icon:text.getCompoundDrawablesRelative())if(icon!=null) {
                    icon.mutate().setTint(TEXT);
                }
            }
            if(name.equals("nav_view")) {
                solidBackground(view,SURFACE);
                ColorStateList labels=new ColorStateList(new int[][]{{android.R.attr.state_checked},{}},new int[]{accent,TEXT});
                setTint(view,"setItemTextColor",labels);setTint(view,"setItemIconTintList",navTint);
                try {
                    Object header=view.getClass().getMethod("getHeaderView",int.class).invoke(view,0);
                    if(header instanceof View)solidBackground((View)header,SURFACE);
                }catch(ReflectiveOperationException | SecurityException ignored){}
            }
            if((name.equals("tvUserName") || name.equals("tvUserNumber")) && view instanceof TextView)
                readableText((TextView)view,name.equals("tvUserName")?TEXT:MUTED);
            if(name.equals("tvConfirmation") || name.equals("tvConfirmationMessage") || name.equals("tvWelcome") ||
               name.equals("tvGetFree") || name.equals("tv200Mb") || name.equals("tvDescription")) {
                if(view instanceof TextView)readableText((TextView)view,TEXT);
            }
            if(name.equals("tabs") || name.equals("tabsBundleMain")) {
                Integer applied=tabIndicators.get(view);
                if(applied==null || applied!=accent) {
                    try {
                        view.getClass().getMethod("setSelectedTabIndicatorColor",int.class).invoke(view,accent);
                        tabIndicators.put(view,accent);
                    } catch(ReflectiveOperationException ignored) { }
                }
                try {
                    Object old=view.getClass().getMethod("getTabTextColors").invoke(view);
                    if(!(old instanceof ColorStateList) || ((ColorStateList)old).getDefaultColor()!=MUTED ||
                       ((ColorStateList)old).getColorForState(new int[]{android.R.attr.state_selected},MUTED)!=accent)
                        view.getClass().getMethod("setTabTextColors",int.class,int.class).invoke(view,MUTED,accent);
                }catch(ReflectiveOperationException | SecurityException ignored){}
            }
        }
        private void solidBackground(View view,int color) {
            Drawable current=view.getBackground();
            if(!(current instanceof ColorDrawable) || ((ColorDrawable)current).getColor()!=color)
                view.setBackgroundColor(color);
        }
        private void setTint(View v,String method,ColorStateList value){
            try{
                // Avoid invalidating Material's navigation bar on every frame.
                String getter=method.equals("setItemTextColor")?"getItemTextColor":"getItemIconTintList";
                Object current=v.getClass().getMethod(getter).invoke(v);
                if(current instanceof ColorStateList && ((ColorStateList)current).getDefaultColor()==value.getDefaultColor() &&
                        ((ColorStateList)current).getColorForState(new int[]{android.R.attr.state_checked},MUTED)==
                        value.getColorForState(new int[]{android.R.attr.state_checked},MUTED))return;
                v.getClass().getMethod(method,ColorStateList.class).invoke(v,value);
            }catch(ReflectiveOperationException | SecurityException ignored){}
        }
        @Override public void onViewAttachedToWindow(View v){detach();observer=v.getViewTreeObserver();if(observer.isAlive())observer.addOnPreDrawListener(this);}
        @Override public void onViewDetachedFromWindow(View v){detach();}
        void detach(){if(observer!=null && observer.isAlive())observer.removeOnPreDrawListener(this);observer=null;}
    }
}
