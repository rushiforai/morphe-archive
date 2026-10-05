package e.e.a;
import android.view.*;
import android.widget.*;
/** Extend native underline past the text while preserving the text's outer inset. */
public final class DialogInputs {
 private static final java.util.WeakHashMap<View,int[]> BASE_MARGINS=new java.util.WeakHashMap<>();
 public static void pad(View view){
  if(view instanceof EditText){
   float density=view.getResources().getDisplayMetrics().density;
   int inset=Math.round(24*density),gap=Math.round(4*density);
   ViewGroup.LayoutParams lp=view.getLayoutParams();
   if(lp instanceof ViewGroup.MarginLayoutParams){
    ViewGroup.MarginLayoutParams margins=(ViewGroup.MarginLayoutParams)lp;
    View parent=view.getParent() instanceof View?(View)view.getParent():null;
    int start=parent==null?0:parent.getPaddingStart(),end=parent==null?0:parent.getPaddingEnd();
    int[] base=BASE_MARGINS.get(view);
    if(base==null){base=new int[]{Math.max(margins.getMarginStart(),Math.max(0,inset-start)),Math.max(margins.getMarginEnd(),Math.max(0,inset-end))};BASE_MARGINS.put(view,base);}
    android.graphics.Rect nativePadding=new android.graphics.Rect();
    if(view.getBackground()!=null)view.getBackground().getPadding(nativePadding);
    boolean rtl=view.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL;
    int extendStart=(rtl?nativePadding.right:nativePadding.left)+gap;
    int extendEnd=(rtl?nativePadding.left:nativePadding.right)+gap;
    // Widen the whole field, then offset text by exactly that amount: text stays put.
    margins.setMarginStart(base[0]-extendStart);
    margins.setMarginEnd(base[1]-extendEnd);
    view.setLayoutParams(margins);
    view.setPaddingRelative(extendStart,view.getPaddingTop(),extendEnd,view.getPaddingBottom());
   }
  }
  if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)pad(group.getChildAt(i));}
 }
}
