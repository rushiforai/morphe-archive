package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.Rect;
import android.content.res.ColorStateList;
import android.os.Handler;
import android.os.Looper;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;

/** Additional tasks live inside the native Writing Tools body and copy its actual themed view styles. */
public final class SharedKeyboardSurface {
    private static final int BODY_SWITCHER=0x7f0b2a8b;
    private static final int MESSAGE_TEXT=0x7f0b0436;
    private static final int MODERN_BODY=0x7f0b2a8c,RESULTS=0x7f0b0430,RESULT_TEXT=0x7f0b042e,FOOTER=0x7f0b045e;
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static WeakReference<ViewGroup> keyboard=new WeakReference<>(null);
    private static WeakReference<ViewSwitcher> switcher=new WeakReference<>(null);
    private static WeakReference<ViewGroup> modern=new WeakReference<>(null);
    private static final ViewTreeObserver.OnGlobalLayoutListener LAYOUT=SharedWritingActivation::nativeReady;
    private static Panel current;
    private SharedKeyboardSurface() {}

    /** Gboard reuses a keyboard view after deactivation without calling ep again. */
    static void bindVisible(View root){
        if(keyboard.get()!=null || !(root instanceof ViewGroup))return;
        if(hasVisibleBody(root))bind(null,root);
    }
    private static boolean hasVisibleBody(View root){
        if(!root.isAttachedToWindow() || !root.isShown())return false;
        if(root.getId()==BODY_SWITCHER || root.getId()==MODERN_BODY)return true;
        if(root instanceof ViewGroup){ViewGroup group=(ViewGroup)root;for(int i=0;i<group.getChildCount();i++)if(hasVisibleBody(group.getChildAt(i)))return true;}
        return false;
    }

    public static void bind(Object owner,Object root){
        if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("surface.bind root="+(root instanceof ViewGroup));
        if(!(root instanceof ViewGroup))return;
        View candidate=((ViewGroup)root).findViewById(BODY_SWITCHER),currentBody=((ViewGroup)root).findViewById(MODERN_BODY);
        if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("surface.bind switcher="+(candidate instanceof ViewSwitcher)+" modern="+(currentBody instanceof ViewGroup));
        if(!(candidate instanceof ViewSwitcher) && !(currentBody instanceof ViewGroup))return;
        clear();
        keyboard=new WeakReference<>((ViewGroup)root);
        switcher=new WeakReference<>(candidate instanceof ViewSwitcher?(ViewSwitcher)candidate:null);
        modern=new WeakReference<>(currentBody instanceof ViewGroup?(ViewGroup)currentBody:null);
        if(((ViewGroup)root).getViewTreeObserver().isAlive()){((ViewGroup)root).getViewTreeObserver().removeOnGlobalLayoutListener(LAYOUT);((ViewGroup)root).getViewTreeObserver().addOnGlobalLayoutListener(LAYOUT);}((ViewGroup)root).post(SharedWritingActivation::nativeReady);
    }
    public static void clear(){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("surface.clear");Panel old=current;current=null;if(old!=null)old.detach();ViewGroup root=keyboard.get();if(root!=null&&root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnGlobalLayoutListener(LAYOUT);keyboard.clear();switcher.clear();modern.clear();}
    static boolean available(){
        ViewGroup root=keyboard.get();if(root==null || !root.isAttachedToWindow() || !root.isShown())return false;
        if(switcher.get()!=null)return switcher.get().getCurrentView() instanceof FrameLayout;
        FrameLayout card=nativeCard();
        TextView footer=footerTemplate();
        // Panels borrow controls from the visible footer. The result card may still be loading.
        return card!=null && card.getWidth()>0 && card.getHeight()>0
                && stableModernParent()!=null && footer!=null && footer.getHeight()>0;
    }
    static void whenAvailable(Context context,EditorSnapshot snapshot,Runnable show){await(context,snapshot,show,20);}
    private static void await(Context context,EditorSnapshot snapshot,Runnable show,int remaining){
        if(!GboardSharedWritingRuntime.isCurrent(snapshot))return;
        if(available()){show.run();return;}
        if(remaining==0){SharedModelClient.noteFailure("NATIVE_THEME_UNAVAILABLE");SharedTextActions.message(context,"Gboard’s writing surface is not available in this editor.");return;}
        MAIN.postDelayed(()->await(context,snapshot,show,remaining-1),100);
    }
    private static ViewGroup root(){ViewGroup root=keyboard.get();if(root==null)throw new IllegalStateException("NATIVE_THEME_UNAVAILABLE");return root;}
    private static ViewGroup templateRoot(){ViewSwitcher body=switcher.get();View current=body==null?modern.get():body.getCurrentView();if(!(current instanceof ViewGroup))throw new IllegalStateException("NATIVE_THEME_UNAVAILABLE");return (ViewGroup)current;}
    private static FrameLayout nativeCard(){ViewGroup body=modern.get();View list=body==null?null:body.findViewById(RESULTS);if(!(list instanceof ViewGroup) || ((ViewGroup)list).getChildCount()==0)return null;View card=((ViewGroup)list).getChildAt(0);return card instanceof FrameLayout?(FrameLayout)card:null;}
    private static FrameLayout stableModernParent(){View body=modern.get();ViewParent parent=body==null?null:body.getParent();while(parent instanceof View){if(parent instanceof FrameLayout)return (FrameLayout)parent;parent=parent.getParent();}return null;}
    private static TextView footerTemplate(){ViewGroup body=modern.get();View footer=body==null?null:body.findViewById(FOOTER);return footer==null?null:findText(footer,true);}
    private static TextView messageTemplate(){
        ViewGroup root=templateRoot();View known=root.findViewById(modern.get()!=null?RESULT_TEXT:MESSAGE_TEXT);
        if(known instanceof TextView)return (TextView)known;
        TextView text=findText(root,false);if(text==null)throw new IllegalStateException("NATIVE_THEME_UNAVAILABLE");return text;
    }
    private static TextView buttonTemplate(){TextView text=modern.get()!=null?footerTemplate():findText(templateRoot(),true);if(text==null)throw new IllegalStateException("NATIVE_THEME_UNAVAILABLE");return text;}
    private static TextView findText(View view,boolean clickable){
        if(view instanceof TextView && !(view instanceof EditText)){
            TextView text=(TextView)view;
            if(text.length()>0 && (!clickable || clickableOwner(text)!=null))return text;
        }
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){TextView text=findText(group.getChildAt(i),clickable);if(text!=null)return text;}}
        return null;
    }
    private static View clickableOwner(View source){
        ViewGroup boundary=root();View view=source;
        while(view!=null && view!=boundary){if(view.isClickable())return view;ViewParent parent=view.getParent();view=parent instanceof View?(View)parent:null;}
        return null;
    }
    private static Drawable copy(Drawable drawable,Context context){if(drawable==null || drawable.getConstantState()==null)return null;Drawable result=drawable.getConstantState().newDrawable(context.getResources(),context.getTheme()).mutate();result.setAlpha(drawable.getAlpha());result.setColorFilter(drawable.getColorFilter());result.setLevel(drawable.getLevel());result.setLayoutDirection(drawable.getLayoutDirection());return result;}
    static TextView styledText(TextView source,String value){return copyTextStyle(source,new TextView(source.getContext()),value);}
    private static TextView copyTextStyle(TextView source,TextView text,String value){
        text.setText(value);text.setTextColor(source.getTextColors());text.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX,source.getTextSize());text.setTypeface(source.getTypeface());text.setLetterSpacing(source.getLetterSpacing());text.setFontFeatureSettings(source.getFontFeatureSettings());text.setGravity(source.getGravity());text.setIncludeFontPadding(source.getIncludeFontPadding());text.setTextDirection(source.getTextDirection());text.setTextAlignment(source.getTextAlignment());if(source.getFontVariationSettings()!=null)text.setFontVariationSettings(source.getFontVariationSettings());text.setLineSpacing(source.getLineSpacingExtra(),source.getLineSpacingMultiplier());text.setPadding(source.getPaddingLeft(),source.getPaddingTop(),source.getPaddingRight(),source.getPaddingBottom());return text;
    }
    static LinearLayout body(){
        ViewGroup nativeBody=templateRoot();LinearLayout result=new LinearLayout(nativeBody.getContext());result.setOrientation(LinearLayout.VERTICAL);
        if(modern.get()!=null){FrameLayout card=nativeCard();if(card==null)throw new IllegalStateException("NATIVE_THEME_UNAVAILABLE");Drawable surface=card.getBackground();if(surface==null){View nativeResult=card.findViewById(0x7f0b2a93);if(nativeResult!=null)surface=nativeResult.getBackground();}if(surface==null){View status=card.findViewById(0x7f0b0433);if(status!=null)surface=status.getBackground();}result.setBackground(copy(surface,result.getContext()));result.setPadding(card.getPaddingLeft(),card.getPaddingTop(),card.getPaddingRight(),card.getPaddingBottom());}
        else result.setPadding(nativeBody.getPaddingLeft(),nativeBody.getPaddingTop(),nativeBody.getPaddingRight(),nativeBody.getPaddingBottom());
        return result;
    }
    static void label(LinearLayout body,String value){TextView text=styledText(messageTemplate(),value);text.setTextIsSelectable(false);body.addView(text,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));}
    static void button(LinearLayout body,String title,Runnable action){
        TextView template=buttonTemplate();appendButton(body,template,clickableOwner(template),title,action);
    }
    private static void appendButton(LinearLayout body,TextView template,View shape,String title,Runnable action){
        Drawable background=copy(shape.getBackground(),template.getContext());
        if(background==null)throw new IllegalStateException("NATIVE_THEME_UNAVAILABLE");
        NativeActionButton button=new NativeActionButton(template.getContext(),shape);copyTextStyle(template,button,title);button.setGravity(Gravity.CENTER);button.setTextAlignment(View.TEXT_ALIGNMENT_GRAVITY);button.setBackground(background);ColorStateList tint=shape.getBackgroundTintList();if(tint!=null)button.setBackgroundTintList(tint);button.setPadding(shape.getPaddingLeft(),shape.getPaddingTop(),shape.getPaddingRight(),shape.getPaddingBottom());button.setMinHeight(Math.max(Math.max(shape.getMinimumHeight(),shape.getHeight()),shape.getLayoutParams()!=null?Math.max(0,shape.getLayoutParams().height):0));button.setMinWidth(shape.getMinimumWidth());button.setElevation(shape.getElevation());if(shape.isEnabled())button.setAlpha(shape.getAlpha());button.setClickable(true);button.setFocusable(true);button.setEnabled(true);button.setOnClickListener(v->action.run());
        LinearLayout.LayoutParams params=new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT);
        ViewGroup.LayoutParams source=shape.getLayoutParams();if(source instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams margins=(ViewGroup.MarginLayoutParams)source;params.setMargins(margins.leftMargin,margins.topMargin,margins.rightMargin,margins.bottomMargin);}params.topMargin=Math.max(params.topMargin,button.nativeSpacing);body.addView(button,params);
    }
    /** Preserve Material's native checked/checkable drawable states without making an action a checkbox. */
    private static final class NativeActionButton extends Button {
        private int[] themeStates;final int nativeSpacing;
        NativeActionButton(Context context,View source){
            super(context,null,0);setAllCaps(false);
            int[] states=source.getDrawableState();int count=0;for(int state:states)if(state==android.R.attr.state_checkable || state==android.R.attr.state_checked)count++;
            themeStates=new int[count];int at=0;for(int state:states)if(state==android.R.attr.state_checkable || state==android.R.attr.state_checked)themeStates[at++]=state;
            int gap=spacing(source);if(gap==0){TextView footer=footerTemplate();if(footer!=null)gap=spacing(footer);}nativeSpacing=source instanceof NativeActionButton?((NativeActionButton)source).nativeSpacing:gap;
            setSelected(source.isSelected());setActivated(source.isActivated());refreshDrawableState();
        }
        @Override protected int[] onCreateDrawableState(int extra){int[] nativeStates=themeStates;int[] states=super.onCreateDrawableState(extra+(nativeStates==null?0:nativeStates.length));return nativeStates==null?states:mergeDrawableStates(states,nativeStates);}
        private static int spacing(View source){
            ViewParent parent=source.getParent();if(!(parent instanceof ViewGroup))return 0;ViewGroup group=(ViewGroup)parent;int gap=Integer.MAX_VALUE;
            for(int i=0;i<group.getChildCount();i++){View other=group.getChildAt(i);if(other==source || !(other instanceof TextView) || !other.isClickable())continue;int distance=other.getLeft()>=source.getRight()?other.getLeft()-source.getRight():source.getLeft()>=other.getRight()?source.getLeft()-other.getRight():0;if(distance>0)gap=Math.min(gap,distance);}
            return gap==Integer.MAX_VALUE?0:gap;
        }
    }
    static final class Panel {
        final LinearLayout content;private FrameLayout wrapper,parent;private Runnable onDismiss;private boolean detached;private TextView labelStyle,actionStyle;
        private final java.util.Map<View,Integer> hidden=new java.util.LinkedHashMap<>();
        Panel(LinearLayout content){this.content=content;}
        void setOnDismissListener(Runnable action){onDismiss=action;}
        boolean isShowing(){return !detached && wrapper!=null && wrapper.isAttachedToWindow();}
        void replaceContent(){if(labelStyle==null || actionStyle==null)throw new IllegalStateException("NATIVE_THEME_UNAVAILABLE");content.removeAllViews();}
        void label(String value){TextView text=styledText(labelStyle,value);text.setTextIsSelectable(false);content.addView(text,new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));}
        void button(String title,Runnable action){appendButton(content,actionStyle,actionStyle,title,action);}
        boolean show(){
            if(detached || !available())return false;
            // Retain only this operation's initial controls; their text is static progress/Cancel copy.
            // Result transitions reuse these detached styles and the existing frame, never recycled native rows.
            for(int i=0;i<content.getChildCount();i++){View view=content.getChildAt(i);if(view instanceof TextView){if(view.isClickable()&&actionStyle==null)actionStyle=(TextView)view;else if(!view.isClickable()&&labelStyle==null)labelStyle=(TextView)view;}}
            ViewSwitcher nativeBody=switcher.get();FrameLayout card=modern.get()!=null?nativeCard():null;
            View child=nativeBody==null?stableModernParent():nativeBody.getCurrentView();if(!(child instanceof FrameLayout))return false;
            if(current!=null)current.dismiss();parent=(FrameLayout)child;
            FrameLayout.LayoutParams bounds=new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT);
            if(card!=null && card.getWidth()>0 && card.getHeight()>0){Rect rect=new Rect(0,0,card.getWidth(),card.getHeight());parent.offsetDescendantRectToMyCoords(card,rect);bounds.width=rect.width();bounds.height=rect.height();bounds.leftMargin=rect.left;bounds.topMargin=rect.top;}
            for(int i=0;i<parent.getChildCount();i++){View original=parent.getChildAt(i);hidden.put(original,original.getVisibility());if(original.getVisibility()==View.VISIBLE)original.setVisibility(View.INVISIBLE);}
            wrapper=new FrameLayout(parent.getContext());wrapper.setBackground(content.getBackground());content.setBackground(null);wrapper.setClipToOutline(wrapper.getBackground()!=null);wrapper.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){public void onViewAttachedToWindow(View view){}public void onViewDetachedFromWindow(View view){dismiss();}});
            ScrollView scroll=new ScrollView(parent.getContext());scroll.setFillViewport(true);scroll.addView(content);wrapper.addView(scroll,new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT));
            parent.addView(wrapper,bounds);current=this;return true;
        }
        void dismiss(){if(current==this)current=null;detach();}
        private void detach(){
            if(detached)return;detached=true;
            if(wrapper!=null && parent!=null)parent.removeView(wrapper);
            // Native lifecycle transitions own visibility once a keyboard is deactivated.
            // Never resurrect a recycled writing/menu body above the current prime keyboard.
            for(java.util.Map.Entry<View,Integer> original:hidden.entrySet()){
                View view=original.getKey();if(view.getParent()==parent && view.getVisibility()==View.INVISIBLE)view.setVisibility(original.getValue());
            }
            hidden.clear();
            if(onDismiss!=null)onDismiss.run();
        }
    }
}
