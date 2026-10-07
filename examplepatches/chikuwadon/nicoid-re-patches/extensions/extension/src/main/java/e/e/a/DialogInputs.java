package e.e.a;
import android.content.res.ColorStateList;import android.graphics.Rect;import android.graphics.drawable.Drawable;import android.view.*;import android.widget.*;
/** Native theme-aware underline, aligned with the surrounding dialog content. */
public final class DialogInputs {
 public static void pad(View view){
  if(view instanceof EditText){
   EditText field=(EditText)view,themed=new EditText(view.getContext());field.setBackgroundDrawable(themed.getBackground());
   int accent=ThemeChoice.accent(view.getContext()),ink=ThemeChoice.textColor(view),muted=(ink&0x00ffffff)|0x99000000;
   try{view.getClass().getMethod("setBackgroundTintList",ColorStateList.class).invoke(view,new ColorStateList(new int[][]{new int[]{android.R.attr.state_focused},new int[]{}},new int[]{accent,muted}));}catch(Exception ignored){}
   field.setTextColor(ink);field.setHintTextColor(muted);
   int inset=Math.round(24*view.getResources().getDisplayMetrics().density);View parent=view.getParent() instanceof View?(View)view.getParent():null;
   boolean padded=false;
   for(View ancestor=parent;ancestor!=null;ancestor=ancestor.getParent() instanceof View?(View)ancestor.getParent():null){if(ancestor.getPaddingLeft()>0||ancestor.getPaddingRight()>0){padded=true;break;}}
   int margin=padded?0:inset;
   ViewGroup.LayoutParams lp=view.getLayoutParams();
   if(lp instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams margins=(ViewGroup.MarginLayoutParams)lp;margins.leftMargin=margin;margins.rightMargin=margin;try{margins.getClass().getMethod("setMarginStart",int.class).invoke(margins,margin);margins.getClass().getMethod("setMarginEnd",int.class).invoke(margins,margin);}catch(Exception ignored){}view.setLayoutParams(margins);}
   // Keep the themed underline's own horizontal inset so the caret and text stay
   // between the visible ends of the underline (including in search and NG forms).
   Rect backgroundPadding=new Rect();Drawable background=field.getBackground();
   if(background!=null)background.getPadding(backgroundPadding);
   field.setPadding(backgroundPadding.left,field.getPaddingTop(),backgroundPadding.right,field.getPaddingBottom());
  }
  if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)pad(group.getChildAt(i));}
 }
}
