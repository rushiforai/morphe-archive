package app.morphe.extension.boost;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Outline;
import android.graphics.drawable.GradientDrawable;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.ReplacementSpan;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Material roles come from Boost's wallpaper-aware Activity theme.
 * Drawing caches belong to individual views, and are recreated with that theme.
 */
public final class MaterialYouTweaks {
    private static final WeakHashMap<View,CardLayout> CARDS=new WeakHashMap<>();
    private MaterialYouTweaks() { }
    private static final java.util.HashMap<String,Integer> ATTRIBUTES=new java.util.HashMap<>();
    /** Themes compare by their applied styles, so a changed theme gets its own entry. */
    private static final WeakHashMap<android.content.res.Resources.Theme,java.util.HashMap<String,Integer>> COLORS=new WeakHashMap<>();
    public static int color(Context context,String role,int fallbackAttr) {
        android.content.res.Resources.Theme theme=context.getTheme();
        synchronized(COLORS) {
            java.util.HashMap<String,Integer> known=COLORS.get(theme);
            Integer cached=known==null ? null:known.get(role);if(cached!=null)return cached;
            Integer attribute=ATTRIBUTES.get(role);
            if(attribute==null){attribute=context.getResources().getIdentifier(role,"attr",context.getPackageName());ATTRIBUTES.put(role,attribute);}
            Integer resolved=attribute==0 ? null:resolve(context,attribute);
            if(resolved!=null){if(known==null){known=new java.util.HashMap<>();COLORS.put(theme,known);}known.put(role,resolved);return resolved;}
        }
        return fallback(context,fallbackAttr);
    }
    private static Integer resolve(Context context,int attribute) {
        TypedValue value=new TypedValue();
        if(context.getTheme().resolveAttribute(attribute,value,true)) {
            if(value.type>=TypedValue.TYPE_FIRST_COLOR_INT && value.type<=TypedValue.TYPE_LAST_COLOR_INT)return value.data;
            if(value.resourceId!=0)try{return context.getColor(value.resourceId);}catch(RuntimeException ignored) { }
        }
        return null;
    }
    private static int fallback(Context context,int fallbackAttr) {
        TypedValue value=new TypedValue();
        if(context.getTheme().resolveAttribute(fallbackAttr,value,true)) {
            if(value.resourceId!=0)try{return context.getColor(value.resourceId);}catch(RuntimeException ignored) { }
            return value.data;
        }
        return 0;
    }
    /** Boost's SPOILER and NSFW labels take the theme's error role. */
    public static int tagColor(String value) {
        android.app.Activity activity=SurfaceAppearanceTweaks.current();
        if(activity!=null && ("#ed4956".equalsIgnoreCase(value) || "#BE1337".equalsIgnoreCase(value)))
            return color(activity,"colorError",android.R.attr.colorError);
        return android.graphics.Color.parseColor(value);
    }
    /** Transparent flairs sit on the surface, so they take its role instead of Reddit's colour. */
    public static int flairText(Object flair,int text,int background) {
        if(!CommentsChromeTweaks.materialYouEnabled() || !(flair instanceof View))return text;
        Context context=((View)flair).getContext();
        if(!SurfaceSettingsActivity.enabled(context,"flair_style"))return text;
        boolean clear=android.graphics.Color.alpha(background)<0xF0;
        int behind=clear ? color(context,"colorSurfaceContainerHigh",android.R.attr.colorBackground):background;
        if(contrast(text,behind)>=3)return text;
        if(clear)return color(context,"colorOnSurfaceVariant",android.R.attr.textColorSecondary);
        return contrast(0xff000000,behind)>=contrast(0xffffffff,behind) ? 0xff000000:0xffffffff;
    }
    private static double contrast(int first,int second) {
        double a=luminance(first),b=luminance(second);
        return (Math.max(a,b)+.05)/(Math.min(a,b)+.05);
    }
    private static double luminance(int color) {
        return .2126*channel(android.graphics.Color.red(color))+.7152*channel(android.graphics.Color.green(color))+.0722*channel(android.graphics.Color.blue(color));
    }
    private static double channel(int value) {
        double level=value/255d;
        return level<=.03928 ? level/12.92:Math.pow((level+.055)/1.055,2.4);
    }
    public static void bindPost(Object holder) {
        if(!CommentsChromeTweaks.materialYouEnabled())return;
        Haptics.tap(CommentsChromeTweaks.field(holder,"voteUpButton"));Haptics.tap(CommentsChromeTweaks.field(holder,"voteDownButton"));
        if(Boolean.TRUE.equals(CommentsChromeTweaks.field(holder,"Q"))) { CommentsScreenTweaks.bindPost(holder);return; }
        Object nativeType=CommentsChromeTweaks.field(holder,"P");
        if(!(nativeType instanceof Enum) || !"MiniCards".equals(((Enum<?>)nativeType).name()))return;
        Object value=CommentsChromeTweaks.field(holder,"a");
        if(!(value instanceof View))return;
        View row=(View)value;if(CARDS.containsKey(row))return;
        Object thumb=CommentsChromeTweaks.field(holder,"thumbnailIv");
        Object title=CommentsChromeTweaks.field(holder,"title");
        // Only native mini-card metadata has this RelativeLayout; full image/video layouts stay intact.
        if(!(thumb instanceof ImageView) || !(title instanceof TextView) || !(((View)thumb).getParent() instanceof RelativeLayout))return;
        ViewGroup metadata=(ViewGroup)((View)thumb).getParent();
        int id=row.getResources().getIdentifier("post_metadata","id",row.getContext().getPackageName());
        if(id==0 || metadata.getId()!=id)return;
        CardLayout layout=new CardLayout(holder,row);CARDS.put(row,layout);Motion.press(row,0.98f);
        row.addOnAttachStateChangeListener(layout);layout.attach(row);
    }
    /** Native feed adapters call this after their full (possibly wrapped) post binder. */
    public static void onPostBound(Object holder) {
        if(!CommentsChromeTweaks.materialYouEnabled())return;
        UnifiedChromeTweaks.profilePost(holder);
        try {
            Object value=CommentsChromeTweaks.field(holder,"a");
            CardLayout layout=value instanceof View ? CARDS.get((View)value):null;
            if(layout!=null)layout.prepare();
        }catch(RuntimeException | LinkageError error){}
    }
    private static View view(Object holder,String name) { Object v=CommentsChromeTweaks.field(holder,name);return v instanceof View ? (View)v:null; }
    private static int dp(View v,int n) { return CommentLayoutTweaks.dp(v,n); }
    private static void take(View child,ViewGroup parent,ViewGroup.LayoutParams params) {
        if(child==null)return;
        if(child.getParent() instanceof ViewGroup)((ViewGroup)child.getParent()).removeView(child);
        parent.addView(child,params);
    }
    private static LinearLayout.LayoutParams wrap() { return new LinearLayout.LayoutParams(-2,-2); }
    private static void rounded(View view,int radius) {
        view.setOutlineProvider(new ViewOutlineProvider() {
            @Override public void getOutline(View v,Outline outline) { outline.setRoundRect(0,0,v.getWidth(),v.getHeight(),radius); }
        });view.setClipToOutline(true);
    }
    private static final class CardLayout implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener {
        final WeakReference<Object> holder;
        final WeakReference<View> root;
        WeakReference<ViewTreeObserver> observer;
        boolean installed;
        WeakReference<TextView> flair;
        WeakReference<CharSequence> lastInfo,lastScore;
        WeakReference<TextView> infoView,scoreView;
        WeakReference<ViewGroup> badgeRow;
        CardLayout(Object owner,View row) {
            holder=new WeakReference<>(owner);root=new WeakReference<>(row);
            View info=view(owner,"infoTop"),score=view(owner,"scoreTv");
            if(info instanceof TextView)infoView=new WeakReference<>((TextView)info);
            if(score instanceof TextView)scoreView=new WeakReference<>((TextView)score);
        }
        void attach(View view) {
            ViewTreeObserver old=observer==null ? null:observer.get();
            if(old==view.getViewTreeObserver())return;
            FrameBus.remove(old,this);ViewTreeObserver tree=FrameBus.add(view,this);observer=tree==null ? null:new WeakReference<>(tree);
        }
        @Override public void onViewAttachedToWindow(View view){attach(view);}
        @Override public void onViewDetachedFromWindow(View view){FrameBus.remove(observer==null ? null:observer.get(),this);observer=null;}
        @Override public boolean onPreDraw() {
            prepare();
            // Native bind completion prepares cards before measurement. Never stall
            // a fling by cancelling the entire frame when a row or score changes.
            return true;
        }
        void prepare() {
            View row=root.get();Object owner=holder.get();if(row==null || owner==null)return;
            if(!installed){if(!install(owner,row))return;installed=true;}
            TextView info=infoView==null ? null:infoView.get();
            if(info!=null && (lastInfo==null || lastInfo.get()!=info.getText())) {
                if(Features.flairs() && SurfaceSettingsActivity.enabled(info.getContext(),"flair_style"))splitFlair(info,flair==null ? null:flair.get());
                lastInfo=new WeakReference<>(info.getText());
            }
            TextView score=scoreView==null ? null:scoreView.get();
            if(score!=null && (lastScore==null || lastScore.get()!=score.getText())) {
                CommentLayoutTweaks.scoreLabel(score);lastScore=new WeakReference<>(score.getText());
            }
            ViewGroup badges=badgeRow==null ? null:badgeRow.get();
            if(badges!=null) {
                boolean visible=false;
                for(int i=0;i<badges.getChildCount();i++) {
                    View child=badges.getChildAt(i);
                    if(hasBadge(child)){visible=true;break;}
                }
                int visibility=visible ? View.VISIBLE:View.GONE;
                if(badges.getVisibility()!=visibility)badges.setVisibility(visibility);
            }
        }
        boolean hasBadge(View child) {
            if(child.getVisibility()==View.GONE)return false;
            if(child instanceof ViewGroup) {
                ViewGroup group=(ViewGroup)child;
                for(int i=0;i<group.getChildCount();i++)if(hasBadge(group.getChildAt(i)))return true;
                return false;
            }
            return !(child instanceof TextView) || ((TextView)child).getText().length()>0;
        }
        boolean install(Object owner,View row) {
            View thumb=view(owner,"thumbnailIv"),title=view(owner,"title"),score=view(owner,"scoreTv"),comments=view(owner,"commentsTv");
            if(comments==null){int id=row.getResources().getIdentifier("submission_header_comment_count","id",row.getContext().getPackageName());comments=id==0 ? null:row.findViewById(id);}
            if(thumb==null || title==null || !(thumb.getParent() instanceof RelativeLayout))return false;
            RelativeLayout metadata=(RelativeLayout)thumb.getParent();
            if(!(metadata.getParent() instanceof LinearLayout))return false;
            LinearLayout content=(LinearLayout)metadata.getParent();
            int inset=dp(row,12);content.setPaddingRelative(inset,inset,inset,dp(row,4));
            int surface=color(row.getContext(),"colorSurfaceContainerHigh",android.R.attr.colorBackground);
            try {
                row.getClass().getMethod("setRadius",float.class).invoke(row,(float)dp(row,16));
                row.getClass().getMethod("setCardBackgroundColor",int.class).invoke(row,surface);
                row.getClass().getMethod("setCardElevation",float.class).invoke(row,0f);
                row.getClass().getMethod("setStrokeWidth",int.class).invoke(row,0);
            }catch(ReflectiveOperationException ignored) {
                GradientDrawable bg=new GradientDrawable();bg.setColor(surface);bg.setCornerRadius(dp(row,16));row.setBackground(bg);
            }
            rounded(row,dp(row,16));
            if(row.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){
                ViewGroup.MarginLayoutParams p=(ViewGroup.MarginLayoutParams)row.getLayoutParams();
                p.setMarginStart(inset);
                p.setMarginEnd(inset);
                p.leftMargin=p.rightMargin=inset;
                p.topMargin=p.bottomMargin=dp(row,6);
                row.requestLayout();
            }
            RelativeLayout.LayoutParams thumbParams=(RelativeLayout.LayoutParams)thumb.getLayoutParams();
            thumbParams.width=thumbParams.height=dp(row,64);thumbParams.removeRule(RelativeLayout.CENTER_VERTICAL);thumbParams.addRule(RelativeLayout.ALIGN_PARENT_TOP);
            thumb.setLayoutParams(thumbParams);rounded(thumb,dp(row,12));
            boolean left=thumbParams.getRule(RelativeLayout.ALIGN_PARENT_START)!=0 || thumbParams.getRule(RelativeLayout.ALIGN_PARENT_LEFT)!=0;
            for(int i=0;i<metadata.getChildCount();i++)if(metadata.getChildAt(i)!=thumb){
                View main=metadata.getChildAt(i);main.setPaddingRelative(left ? inset:0,0,left ? 0:inset,0);
            }
            View info=view(owner,"infoTop");
            if(info instanceof TextView && info.getParent() instanceof View && ((View)info.getParent()).getParent() instanceof LinearLayout) {
                LinearLayout main=(LinearLayout)((View)info.getParent()).getParent();
                TextView chip=new TextView(row.getContext());chip.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,((TextView)info).getTextSize());chip.setTypeface(((TextView)info).getTypeface());
                chip.setVisibility(View.GONE);chip.setPadding(0,dp(row,2),0,dp(row,2));main.addView(chip,main.indexOfChild((View)info.getParent())+1,wrap());flair=new WeakReference<>(chip);
            }
            if(score!=null && score.getParent() instanceof ViewGroup) {
                ViewGroup original=(ViewGroup)score.getParent();badgeRow=new WeakReference<>(original);
                if(original.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
                    ViewGroup.MarginLayoutParams margins=(ViewGroup.MarginLayoutParams)original.getLayoutParams();
                    margins.topMargin=0;margins.bottomMargin=0;original.setLayoutParams(margins);
                }
            }
            // Move existing bound views, retaining listeners, vote state and accessibility labels.
            LinearLayout footer=new LinearLayout(row.getContext());footer.setGravity(android.view.Gravity.CENTER_VERTICAL);footer.setMinimumHeight(dp(row,48));footer.setBaselineAligned(false);
            CountsRow counts=new CountsRow(row.getContext());
            CommentLayoutTweaks.regularScore(score);take(score,counts,wrap());take(comments,counts,wrap());
            footer.addView(counts,new LinearLayout.LayoutParams(0,-2,1));
            for(String name:new String[]{"voteUpButton","voteDownButton","overFlowButton"}) {
                View button=view(owner,name);
                View glyph=button;
                if(button!=null && !(button instanceof ImageView)) {
                    int icon=button.getResources().getIdentifier("icon","id",button.getContext().getPackageName());
                    glyph=icon==0 ? null:button.findViewById(icon);
                }
                if(glyph instanceof ImageView) {
                    int padding=dp(row,15);button.setPadding(padding,padding,padding,padding);
                    ((ImageView)glyph).setScaleType(ImageView.ScaleType.CENTER_INSIDE);
                    if(glyph!=button && glyph.getLayoutParams() instanceof android.widget.FrameLayout.LayoutParams) {
                        android.widget.FrameLayout.LayoutParams iconParams=(android.widget.FrameLayout.LayoutParams)glyph.getLayoutParams();
                        iconParams.width=iconParams.height=dp(row,18);iconParams.gravity=android.view.Gravity.CENTER;glyph.setLayoutParams(iconParams);
                    }
                    // Native vote controls are FrameLayouts whose child translates during
                    // the original vote animation. Leave the padding region available to it.
                    if(button instanceof ViewGroup)((ViewGroup)button).setClipToPadding(false);
                }
                take(button,footer,new LinearLayout.LayoutParams(dp(row,48),dp(row,48)));
            }
            // Keep native spoiler/NSFW/award views in their own responsive badge row.
            int dotId=row.getResources().getIdentifier("submission_header_dot","id",row.getContext().getPackageName());
            View dot=dotId==0 ? null:row.findViewById(dotId);if(dot!=null)dot.setVisibility(View.GONE);
            int expandableId=row.getResources().getIdentifier("row_submission_expandable_layout","id",row.getContext().getPackageName());
            View expandable=expandableId==0 ? null:row.findViewById(expandableId);
            int index=expandable==null ? content.getChildCount():content.indexOfChild(expandable);
            content.addView(footer,Math.max(0,index),new LinearLayout.LayoutParams(-1,-2));
            return true;
        }
    }
    /** Compact footer: points above comments at the logical start of every card. */
    public static final class CountsRow extends ViewGroup {
        final int stackGap;
        boolean stacked=true;
        int firstWidth,secondWidth,firstHeight,secondHeight,firstTop,secondTop;
        CountsRow(Context context){super(context);stackGap=dp(this,2);}
        @Override protected void onMeasure(int widthSpec,int heightSpec) {
            int available=MeasureSpec.getMode(widthSpec)==MeasureSpec.UNSPECIFIED ? Integer.MAX_VALUE/4:MeasureSpec.getSize(widthSpec);
            View first=getChildCount()>0 ? getChildAt(0):null,second=getChildCount()>1 ? getChildAt(1):null;
            int childWidth=MeasureSpec.makeMeasureSpec(available,MeasureSpec.AT_MOST),childHeight=MeasureSpec.makeMeasureSpec(0,MeasureSpec.UNSPECIFIED);
            if(first!=null && first.getVisibility()!=GONE)first.measure(childWidth,childHeight);
            if(second!=null && second.getVisibility()!=GONE)second.measure(childWidth,childHeight);
            firstWidth=first!=null && first.getVisibility()!=GONE ? first.getMeasuredWidth():0;
            secondWidth=second!=null && second.getVisibility()!=GONE ? second.getMeasuredWidth():0;
            firstHeight=first!=null && first.getVisibility()!=GONE ? first.getMeasuredHeight():0;
            secondHeight=second!=null && second.getVisibility()!=GONE ? second.getMeasuredHeight():0;
            firstTop=0;secondTop=firstHeight+(firstHeight>0 && secondHeight>0 ? stackGap:0);int height=secondTop+secondHeight;
            int desiredWidth=Math.max(firstWidth,secondWidth);
            setMeasuredDimension(resolveSize(desiredWidth,widthSpec),resolveSize(height,heightSpec));
        }
        @Override protected void onLayout(boolean changed,int left,int top,int right,int bottom) {
            boolean rtl=getLayoutDirection()==LAYOUT_DIRECTION_RTL;
            if(getChildCount()>0){int x=rtl ? getWidth()-firstWidth:0;getChildAt(0).layout(x,firstTop,x+firstWidth,firstTop+firstHeight);}
            if(getChildCount()>1){int x=rtl ? getWidth()-secondWidth:0;getChildAt(1).layout(x,secondTop,x+secondWidth,secondTop+secondHeight);}
        }
    }
    static boolean splitFlair(TextView view,TextView target) {
        CharSequence content=view.getText();
        if(!(content instanceof android.text.Spanned)) { if(target!=null && target.getVisibility()!=View.GONE){target.setVisibility(View.GONE);return true;}return false; }
        android.text.Spanned old=(android.text.Spanned)content;
        BackgroundColorSpan[] spans=old.getSpans(0,old.length(),BackgroundColorSpan.class);
        if(spans.length==0) {if(target!=null && target.getVisibility()!=View.GONE){target.setVisibility(View.GONE);return true;}return false;}
        android.text.SpannableStringBuilder metadata=new android.text.SpannableStringBuilder(content),chips=new android.text.SpannableStringBuilder();
        java.util.Arrays.sort(spans,(a,b)->Integer.compare(old.getSpanStart(a),old.getSpanStart(b)));
        for(BackgroundColorSpan span:spans) {
            int start=old.getSpanStart(span),end=old.getSpanEnd(span);if(start<0 || end<=start)continue;
            if(chips.length()>0)chips.append(" ");int offset=chips.length();
            // Long flairs would push the whole line onto a second row.
            chips.append(end-start>24 ? new android.text.SpannableStringBuilder(old.subSequence(start,start+22)).append('\u2026'):old.subSequence(start,end));
            for(BackgroundColorSpan bg:chips.getSpans(offset,chips.length(),BackgroundColorSpan.class))chips.removeSpan(bg);
            for(ForegroundColorSpan fg:chips.getSpans(offset,chips.length(),ForegroundColorSpan.class))chips.removeSpan(fg);
            chips.setSpan(new Pill(color(view.getContext(),"colorSecondaryContainer",android.R.attr.colorAccent),color(view.getContext(),"colorOnSecondaryContainer",android.R.attr.textColorPrimary),dp(view,6)),offset,chips.length(),Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        if(target==null) return false;
        for(int i=spans.length-1;i>=0;i--){int start=old.getSpanStart(spans[i]),end=old.getSpanEnd(spans[i]);if(start>=0 && end>start){
            // Consume the native separator immediately before an inline flair.
            int from=start;while(from>0 && Character.isWhitespace(metadata.charAt(from-1)))from--;
            if(from>0 && (metadata.charAt(from-1)=='·' || metadata.charAt(from-1)=='•'))from--;
            metadata.delete(from,end);
        }}
        // Flairs lead the line: an inline label reads as part of the post, and saves a row.
        while(metadata.length()>0 && Character.isWhitespace(metadata.charAt(0)))metadata.delete(0,1);
        if(chips.length()>0)metadata.insert(0,chips.append(" "));
        view.setText(metadata);target.setVisibility(View.GONE);return true;
    }
    public static final class Pill extends ReplacementSpan {
        final int background,foreground,pad;
        Pill(int bg,int fg,int padding){background=bg;foreground=fg;pad=padding;}
        android.text.StaticLayout cachedLayout;
        final Paint cachedPaint=new Paint();
        WeakReference<CharSequence> cachedText;
        int cachedStart,cachedEnd;
        android.text.style.CharacterStyle[] cachedSpans;
        int[] spanState;
        boolean reusable(Paint paint,CharSequence text,int start,int end,android.text.style.CharacterStyle[] spans) {
            if(cachedLayout==null || cachedText==null || cachedText.get()!=text || cachedStart!=start || cachedEnd!=end ||
                android.os.Build.VERSION.SDK_INT<28 || !paint.equalsForTextMeasurement(cachedPaint))return false;
            CharSequence measured=cachedLayout.getText();
            for(int i=start;i<end;i++)if(text.charAt(i)!=measured.charAt(i-start))return false;
            if(spans==null)return cachedSpans==null;
            if(cachedSpans==null || spans.length!=cachedSpans.length)return false;
            android.text.Spanned source=(android.text.Spanned)text;
            for(int i=0;i<spans.length;i++) {
                android.text.style.CharacterStyle span=spans[i];int offset=i*7;
                if(span!=cachedSpans[i] || source.getSpanStart(span)!=spanState[offset] || source.getSpanEnd(span)!=spanState[offset+1] || source.getSpanFlags(span)!=spanState[offset+2])return false;
                android.text.style.CharacterStyle underlying=span.getUnderlying();
                if(underlying instanceof android.text.style.DynamicDrawableSpan) {
                    android.graphics.Rect bounds=((android.text.style.DynamicDrawableSpan)underlying).getDrawable().getBounds();
                    if(bounds.left!=spanState[offset+3] || bounds.top!=spanState[offset+4] || bounds.right!=spanState[offset+5] || bounds.bottom!=spanState[offset+6])return false;
                } else if(underlying!=this && (underlying instanceof ReplacementSpan ||
                    (underlying instanceof android.text.style.MetricAffectingSpan && !underlying.getClass().getName().startsWith("android.text.style.")))) {
                    // Custom metrics may mutate internally; wrappers must not hide that.
                    return false;
                }
            }
            return true;
        }
        android.text.StaticLayout label(Paint paint,CharSequence text,int start,int end) {
            android.text.style.CharacterStyle[] spans=text instanceof android.text.Spanned ? ((android.text.Spanned)text).getSpans(start,end,android.text.style.CharacterStyle.class):null;
            if(reusable(paint,text,start,end,spans)) {
                cachedLayout.getPaint().set(paint);cachedLayout.getPaint().setColor(foreground);
                return cachedLayout;
            }
            // Retain rich spans; source identity, content, metrics, span ranges and image
            // bounds are checked before reuse. Unknown custom replacement spans remeasure.
            SpannableString content=new SpannableString(text.subSequence(start,end));
            for(Pill span:content.getSpans(0,content.length(),Pill.class))content.removeSpan(span);
            android.text.TextPaint ink=new android.text.TextPaint(paint);ink.setColor(foreground);
            int width=Math.max(1,(int)Math.ceil(android.text.Layout.getDesiredWidth(content,ink)));
            cachedLayout=android.text.StaticLayout.Builder.obtain(content,0,content.length(),ink,width).setIncludePad(false).setMaxLines(1).build();
            cachedPaint.set(paint);cachedText=new WeakReference<>(text);cachedStart=start;cachedEnd=end;cachedSpans=spans;
            if(spans!=null) {
                spanState=new int[spans.length*7];android.text.Spanned source=(android.text.Spanned)text;
                for(int i=0;i<spans.length;i++) {
                    android.text.style.CharacterStyle span=spans[i];int offset=i*7;
                    spanState[offset]=source.getSpanStart(span);spanState[offset+1]=source.getSpanEnd(span);spanState[offset+2]=source.getSpanFlags(span);
                    android.text.style.CharacterStyle underlying=span.getUnderlying();
                    if(underlying instanceof android.text.style.DynamicDrawableSpan) {
                        android.graphics.Rect bounds=((android.text.style.DynamicDrawableSpan)underlying).getDrawable().getBounds();
                        spanState[offset+3]=bounds.left;spanState[offset+4]=bounds.top;spanState[offset+5]=bounds.right;spanState[offset+6]=bounds.bottom;
                    }
                }
            }
            return cachedLayout;
        }
        @Override public int getSize(Paint paint,CharSequence text,int start,int end,Paint.FontMetricsInt fm){
            android.text.StaticLayout layout=label(paint,text,start,end);
            if(fm!=null){
                paint.getFontMetricsInt(fm);
                fm.ascent=Math.min(fm.ascent,layout.getLineAscent(0));
                fm.descent=Math.max(fm.descent,layout.getLineDescent(0));
                fm.top=Math.min(fm.top,fm.ascent);
                fm.bottom=Math.max(fm.bottom,fm.descent);
            }
            return layout.getWidth()+pad*2;
        }
        @Override public void draw(Canvas canvas,CharSequence text,int start,int end,float x,int top,int y,int bottom,Paint paint){
            android.text.StaticLayout layout=label(paint,text,start,end);
            int old=paint.getColor();paint.setColor(background);
            canvas.drawRoundRect(x,top,x+layout.getWidth()+pad*2,bottom,pad*2,pad*2,paint);paint.setColor(old);
            canvas.save();canvas.translate(x+pad,y-layout.getLineBaseline(0));layout.draw(canvas);canvas.restore();
        }
    }
}
