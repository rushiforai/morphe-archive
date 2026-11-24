package app.zonghome.extension;

import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Owns only explicitly registered form roots; does not read or replace entered values or listeners. */
public final class OnboardingStyling {
    private OnboardingStyling() {}
    private static final WeakHashMap<View,Observer> ROOTS=new WeakHashMap<>();
    public static boolean isRoot(View view) { return ROOTS.containsKey(view); }
    public static void attach(View root) { attach(root,false); }
    private static void attach(View root,boolean sheet) {
        if(root==null || ROOTS.containsKey(root))return;
        Observer observer=new Observer(root,sheet);ROOTS.put(root,observer);
        root.addOnAttachStateChangeListener(observer);
        if(root.isAttachedToWindow())observer.onViewAttachedToWindow(root);
    }
    static void attachKeyboardSheet(View window) {
        View keyboard=ViewNames.find(window,"keyboard");
        for(View current=keyboard;current!=null && current!=window;current=current.getParent() instanceof View?(View)current.getParent():null) {
            if(ViewNames.find(current,"etP1") instanceof EditText){attach(current,true);return;}
        }
    }
    private static int dp(View view,int value) {return Math.round(value*view.getResources().getDisplayMetrics().density);}
    private static ColorStateList enabledColors(int normal,int disabled) {
        return new ColorStateList(new int[][]{{-android.R.attr.state_enabled},{}},new int[]{disabled,normal});
    }
    private static final class FieldSurface extends GradientDrawable {
        private int previousColor=Integer.MIN_VALUE,previousWidth=-1;
        FieldSurface(View view,float originalRadius) {
            setColor(CharcoalTheme.SURFACE);
            setCornerRadius(NavigationStyle.shapes()?dp(view,FormStyleSpec.digit(ViewNames.name(view))?6:8):originalRadius);
        }
        void state(View field,boolean error) {
            boolean active=field.hasFocus() || field instanceof CompoundButton && ((CompoundButton)field).isChecked();
            int color=FormStyleSpec.fieldStroke(field.isEnabled(),active,error,
                CharcoalTheme.ACCENT,CharcoalTheme.TRACK,CharcoalTheme.RAISED,0xffffb4ab);
            int width=dp(field,active||error?2:1);
            if(color!=previousColor || width!=previousWidth){setStroke(width,color);previousColor=color;previousWidth=width;}
        }
    }
    private static final class NextArrow extends Drawable {
        private final int size;
        private final android.graphics.Paint paint=new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        NextArrow(int size){this.size=size;paint.setColor(CharcoalTheme.ON_ACCENT);paint.setStyle(android.graphics.Paint.Style.STROKE);paint.setStrokeWidth(2.4f);paint.setStrokeCap(android.graphics.Paint.Cap.ROUND);paint.setStrokeJoin(android.graphics.Paint.Join.ROUND);}
        @Override public void draw(android.graphics.Canvas canvas){
            android.graphics.Rect b=getBounds();int save=canvas.save();canvas.translate(b.left,b.top);canvas.scale(b.width()/24f,b.height()/24f);
            android.graphics.Path p=new android.graphics.Path();p.moveTo(5,12);p.lineTo(19,12);p.moveTo(13,6);p.lineTo(19,12);p.lineTo(13,18);canvas.drawPath(p,paint);canvas.restoreToCount(save);
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);invalidateSelf();}
        @Override public void setColorFilter(android.graphics.ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
        @Override public int getOpacity(){return android.graphics.PixelFormat.TRANSLUCENT;}
        @Override public int getIntrinsicWidth(){return size;}
        @Override public int getIntrinsicHeight(){return size;}
    }
    private static final class Observer implements ViewTreeObserver.OnPreDrawListener,View.OnAttachStateChangeListener {
        final WeakReference<View> root;
        final boolean sheet;
        ViewTreeObserver tree;
        final ColorStateList text=enabledColors(CharcoalTheme.TEXT,CharcoalTheme.MUTED);
        final ColorStateList muted=ColorStateList.valueOf(CharcoalTheme.MUTED);
        final ColorStateList accent=enabledColors(CharcoalTheme.ACCENT,CharcoalTheme.MUTED);
        final ColorStateList error=enabledColors(0xffffb4ab,CharcoalTheme.MUTED);
        final ColorStateList primary=enabledColors(CharcoalTheme.ACCENT,CharcoalTheme.RAISED);
        final ColorStateList onPrimary=enabledColors(CharcoalTheme.ON_ACCENT,CharcoalTheme.MUTED);
        final ColorStateList transparent=ColorStateList.valueOf(0x00000000);
        final ColorStateList ripple=ColorStateList.valueOf((CharcoalTheme.TEXT&0xffffff)|0x18000000);
        final ColorStateList choice=new ColorStateList(new int[][]{{-android.R.attr.state_enabled},{android.R.attr.state_checked},{}},
            new int[]{CharcoalTheme.TRACK,CharcoalTheme.ACCENT,CharcoalTheme.MUTED});
        final WeakHashMap<View,Boolean> prepared=new WeakHashMap<>();
        final java.util.HashMap<Class<?>,java.lang.reflect.Method[]> cards=new java.util.HashMap<>();
        final WeakHashMap<View,Integer> lastLine=new WeakHashMap<>();
        final WeakHashMap<View,Boolean> activeLine=new WeakHashMap<>();
        Observer(View view,boolean sheet){root=new WeakReference<>(view);this.sheet=sheet;}
        @Override public void onViewAttachedToWindow(View view) {
            if(tree!=null && tree.isAlive())tree.removeOnPreDrawListener(this);
            tree=view.getViewTreeObserver();tree.addOnPreDrawListener(this);
        }
        @Override public void onViewDetachedFromWindow(View view) {
            if(tree!=null && tree.isAlive())tree.removeOnPreDrawListener(this);tree=null;
        }
        @Override public boolean onPreDraw() {
            View view=root.get();
            if(view!=null && view.isShown())walk(view,true);
            return true;
        }
        private void walk(View view,boolean formRoot) {
            if(view.getVisibility()!=View.VISIBLE)return;
            String name=ViewNames.name(view);FormStyleSpec.Role role=FormStyleSpec.role(name);
            neutralSurface(view);
            if(formRoot || view instanceof ViewGroup) {
                if(view.getBackgroundTintList()!=null)view.setBackgroundTintList(null);
                solid(view,sheet?CharcoalTheme.SURFACE:CharcoalTheme.BG);
            }
            if(view instanceof EditText || role==FormStyleSpec.Role.INPUT || role==FormStyleSpec.Role.DIGIT) {
                if(view instanceof TextView)field((TextView)view,role==FormStyleSpec.Role.DIGIT);
            } else if(view instanceof CompoundButton) {
                CompoundButton button=(CompoundButton)view;
                if(button.getButtonTintList()!=choice)button.setButtonTintList(choice);
                if(button instanceof android.widget.RadioButton) {
                    int left=button.getPaddingLeft(),top=button.getPaddingTop(),right=button.getPaddingRight(),bottom=button.getPaddingBottom();
                    if(!(button.getBackground() instanceof FieldSurface)) {
                        button.setBackground(new FieldSurface(button,dp(button,8)));button.setPadding(left,top,right,bottom);
                    }
                    if(button.getBackgroundTintList()!=null)button.setBackgroundTintList(null);
                    ((FieldSurface)button.getBackground()).state(button,false);
                    for(Drawable icon:button.getCompoundDrawablesRelative())if(icon!=null)icon.mutate().setTintList(choice);
                }
                label(button,text,16,false);
                if(NavigationStyle.shapes() && button.getMinimumHeight()<dp(view,48))button.setMinimumHeight(dp(view,48));
            } else if(view instanceof Button || role==FormStyleSpec.Role.PRIMARY && view instanceof ImageView) {
                action(view,role);
            } else if(role==FormStyleSpec.Role.KEY && view instanceof TextView) {
                TextView key=(TextView)view;
                if(key.getBackgroundTintList()!=null)key.setBackgroundTintList(null);
                if(!(key.getBackground() instanceof FieldSurface))key.setBackground(new FieldSurface(key,dp(key,8)));
                ((FieldSurface)key.getBackground()).state(key,false);label(key,text,20,false);
            } else if(view instanceof TextView) {
                TextView label=(TextView)view;
                if(role==FormStyleSpec.Role.TITLE)label(label,text,name.equals("titleTv")?22:18,true);
                else if(role==FormStyleSpec.Role.ERROR)label(label,error,14,false);
                else if(role==FormStyleSpec.Role.LINK)label(label,accent,14,false);
                else if(role==FormStyleSpec.Role.STEP)label(label,muted,12,false);
                else label(label,muted,14,false);
            } else if(role==FormStyleSpec.Role.LINE)stepLine(view);
            if(role==FormStyleSpec.Role.PANEL && !formRoot)solid(view,sheet?CharcoalTheme.SURFACE:CharcoalTheme.BG);
            card(view);
            if(view instanceof ImageView && (name.equals("cross") || name.equals("cancel") || name.equals("btnBack"))) {
                ImageView icon=(ImageView)view;
                if(icon.getImageTintList()!=text)icon.setImageTintList(text);
            }
            if(view instanceof ImageView && (name.equals("imgOnBoarding") || name.equals("img"))) {
                ImageView image=(ImageView)view;
                if(image.getScaleType()!=ImageView.ScaleType.FIT_CENTER)image.setScaleType(ImageView.ScaleType.FIT_CENTER);
            }
            if(view instanceof ViewGroup) {
                ViewGroup group=(ViewGroup)view;
                for(int i=0;i<group.getChildCount();i++)walk(group.getChildAt(i),false);
            }
        }
        private void field(TextView field,boolean digit) {
            if(field.getTextColors()!=text)field.setTextColor(text);
            if(field.getHintTextColors()!=muted)field.setHintTextColor(muted);
            boolean invalid=field.getError()!=null && field.getError().length()>0;
            // A custom native red error background must survive until the app clears it.
            if(!invalid && legacyError(field))return;
            Drawable background=field.getBackground();
            if(!(background instanceof FieldSurface)) {
                float radius=0;
                Drawable current=background==null?null:background.getCurrent();
                if(Build.VERSION.SDK_INT>=24 && current instanceof GradientDrawable)radius=((GradientDrawable)current).getCornerRadius();
                int left=field.getPaddingLeft(),top=field.getPaddingTop(),right=field.getPaddingRight(),bottom=field.getPaddingBottom();
                field.setBackground(new FieldSurface(field,radius));
                field.setPadding(left,top,right,bottom);
            }
            if(field.getBackgroundTintList()!=null)field.setBackgroundTintList(null);
            ((FieldSurface)field.getBackground()).state(field,invalid);
            if(prepared.put(field,true)==null) {
                int inset=dp(field,digit?3:16);
                field.setPaddingRelative(Math.max(inset,field.getPaddingStart()),field.getPaddingTop(),
                    Math.max(inset,field.getPaddingEnd()),field.getPaddingBottom());
                if(!digit && NavigationStyle.shapes())compactField(field);
                field.setHighlightColor((CharcoalTheme.ACCENT&0xffffff)|0x40000000);
                if(Build.VERSION.SDK_INT>=29 && field instanceof EditText) {
                    Drawable cursor=field.getTextCursorDrawable();
                    if(cursor!=null){cursor=cursor.mutate();cursor.setTint(CharcoalTheme.ACCENT);field.setTextCursorDrawable(cursor);}
                }
            }
        }
        private void compactField(TextView field) {
            if(field.getMaxLines()>1)return;
            int height=Math.round(dp(field,48)*Math.max(1f,field.getResources().getConfiguration().fontScale));
            field.setMinimumHeight(height);field.setMinHeight(height);
            ViewGroup.LayoutParams params=field.getLayoutParams();
            if(params!=null && params.height>0 && params.height!=height){params.height=height;field.setLayoutParams(params);}
            field.setPaddingRelative(dp(field,12),dp(field,4),dp(field,ViewNames.name(field).equals("etMobileNumber")?56:12),dp(field,4));
        }
        private void registrationNext(ImageView view) {
            if(prepared.put(view,true)==null) {
                GradientDrawable fill=new GradientDrawable();fill.setColor(CharcoalTheme.ACCENT);fill.setCornerRadius(dp(view,8));
                view.setBackground(new android.graphics.drawable.RippleDrawable(ripple,fill,null));
                view.setImageDrawable(new NextArrow(dp(view,24)));view.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
                int padding=dp(view,12);view.setPadding(padding,padding,padding,padding);
                view.setMinimumWidth(dp(view,48));view.setMinimumHeight(dp(view,48));
                ViewGroup.LayoutParams params=view.getLayoutParams();
                if(params!=null){params.width=dp(view,48);params.height=dp(view,48);view.setLayoutParams(params);}
                if(view.getContentDescription()==null)view.setContentDescription("Next");
            }
            if(view.getBackgroundTintList()!=primary)view.setBackgroundTintList(primary);
            if(view.getImageTintList()!=onPrimary)view.setImageTintList(onPrimary);
        }
        private boolean legacyError(TextView field) {
            ColorStateList tint=field.getBackgroundTintList();
            if(tint!=null && red(tint.getDefaultColor()))return true;
            Drawable background=field.getBackground();
            if(background instanceof FieldSurface || background==null)return false;
            try {
                Object stroke=background.getCurrent().getClass().getMethod("getStrokeColor").invoke(background.getCurrent());
                return stroke instanceof ColorStateList && red(((ColorStateList)stroke).getDefaultColor());
            } catch(ReflectiveOperationException | SecurityException ignored){return false;}
        }
        private boolean red(int color){int r=(color>>>16)&255,g=(color>>>8)&255,b=color&255;return r-g>35 && r-b>35;}
        private void action(View view,FormStyleSpec.Role role) {
            if(view instanceof ImageView && ViewNames.name(view).equals("btnRegister")) {
                registrationNext((ImageView)view);return;
            }
            boolean secondary=role==FormStyleSpec.Role.SECONDARY || role==FormStyleSpec.Role.DESTRUCTIVE;
            ColorStateList fill=secondary?transparent:primary;
            if(view.getBackgroundTintList()!=fill)view.setBackgroundTintList(fill);
            if(view instanceof TextView)label((TextView)view,role==FormStyleSpec.Role.DESTRUCTIVE?error:secondary?accent:onPrimary,16,false);
            if(view instanceof ImageView && ((ImageView)view).getImageTintList()!=onPrimary)((ImageView)view).setImageTintList(onPrimary);
            optionalColors(view,"getRippleColor","setRippleColor",ripple);
            if(NavigationStyle.shapes())MaterialShapes.buttonRadius(view,dp(view,secondary?8:12));
            if(prepared.put(view,true)==null) {
                if(view instanceof TextView)((TextView)view).setAllCaps(false);
                if(NavigationStyle.shapes())minimumHeight(view,48);
            }
        }
        private void label(TextView view,ColorStateList colors,int sp,boolean bold) {
            if(view.getTextColors()!=colors)view.setTextColor(colors);
            if(view.getLinkTextColors()!=accent)view.setLinkTextColor(accent);
            if(!NavigationStyle.shapes())return;
            float px=TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP,sp,view.getResources().getDisplayMetrics());
            if(Math.abs(view.getTextSize()-px)>0.5f)view.setTextSize(TypedValue.COMPLEX_UNIT_SP,sp);
            if(bold && (view.getTypeface()==null || !view.getTypeface().isBold()))view.setTypeface(view.getTypeface(),Typeface.BOLD);
        }
        private void minimumHeight(View view,int height) {
            int pixels=Math.round(dp(view,height)*Math.max(1f,view.getResources().getConfiguration().fontScale));
            if(view.getMinimumHeight()<pixels)view.setMinimumHeight(pixels);
            ViewGroup.LayoutParams params=view.getLayoutParams();
            if(params!=null && params.height>=0 && params.height<pixels){params.height=pixels;view.setLayoutParams(params);}
        }
        private void stepLine(View view) {
            if(!(view.getBackground() instanceof android.graphics.drawable.ColorDrawable))return;
            int current=((android.graphics.drawable.ColorDrawable)view.getBackground()).getColor();
            Integer previous=lastLine.get(view);
            if(previous==null || previous!=current) {
                int r=(current>>>16)&255,g=(current>>>8)&255,b=current&255;
                activeLine.put(view,Math.max(r,Math.max(g,b))-Math.min(r,Math.min(g,b))>30);
            }
            int desired=Boolean.TRUE.equals(activeLine.get(view))?CharcoalTheme.ACCENT:CharcoalTheme.TRACK;
            if(current!=desired)view.setBackgroundColor(desired);lastLine.put(view,desired);
        }
        private void card(View view) {
            Class<?> type=view.getClass();java.lang.reflect.Method[] access=cards.get(type);
            if(access==null) {
                try {access=new java.lang.reflect.Method[]{type.getMethod("getCardBackgroundColor"),type.getMethod("setCardBackgroundColor",int.class)};}
                catch(NoSuchMethodException ignored){access=new java.lang.reflect.Method[0];}
                cards.put(type,access);
            }
            if(access.length!=2)return;
            try {
                Object old=access[0].invoke(view);
                int color=sheet?CharcoalTheme.SURFACE:CharcoalTheme.BG;
                if(old instanceof ColorStateList && ((ColorStateList)old).getDefaultColor()!=color)access[1].invoke(view,color);
            } catch(ReflectiveOperationException | SecurityException ignored) { }
        }
        private void neutralSurface(View view) {
            if(view instanceof ImageView)return;
            Drawable bg=view.getBackground();
            if(bg instanceof android.graphics.drawable.ColorDrawable) {
                int color=((android.graphics.drawable.ColorDrawable)bg).getColor();
                if(pale(color))view.setBackgroundColor(CharcoalTheme.SURFACE);
            } else if(Build.VERSION.SDK_INT>=24 && bg instanceof GradientDrawable) {
                ColorStateList fill=((GradientDrawable)bg).getColor();
                if(fill!=null && pale(fill.getDefaultColor()))((GradientDrawable)bg).setColor(CharcoalTheme.SURFACE);
            }
        }
        private boolean pale(int color) {
            int r=(color>>>16)&255,g=(color>>>8)&255,b=color&255;
            return (color>>>24)>200 && Math.min(r,Math.min(g,b))>205 && Math.max(r,Math.max(g,b))-Math.min(r,Math.min(g,b))<25;
        }        private void optionalColors(View view,String getter,String setter,ColorStateList value) {
            try {
                Object old=view.getClass().getMethod(getter).invoke(view);
                if(!(old instanceof ColorStateList) || ((ColorStateList)old).getDefaultColor()!=value.getDefaultColor())
                    view.getClass().getMethod(setter,ColorStateList.class).invoke(view,value);
            } catch(ReflectiveOperationException | SecurityException ignored) { }
        }
        private void solid(View view,int color) {
            Drawable bg=view.getBackground();
            if(!(bg instanceof android.graphics.drawable.ColorDrawable) || ((android.graphics.drawable.ColorDrawable)bg).getColor()!=color)
                view.setBackgroundColor(color);
        }
    }
}
