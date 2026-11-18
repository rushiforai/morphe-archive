package app.canada.walmart;
import android.view.*;import android.widget.*;
/** The existing Sparky tab is redirected in bytecode; these hooks cover its FAB and nudges. */
public final class SparkyReplacement {
 private static final int MUTED=0x7e010061;
 public static void suppress(View view){try{if(view.getTag(MUTED)!=null)return;AdCleaner.Hidden state=new AdCleaner.Hidden(view);view.setTag(MUTED,state);view.addOnAttachStateChangeListener(state);if(view.isAttachedToWindow())state.watch();state.collapse();RuntimeStats.hit("Sparky callouts hidden");}catch(Exception e){RuntimeStats.error("Sparky callout",e);}}
 private static void bind(View view){if(view instanceof ImageButton){((ImageButton)view).setImageResource(android.R.drawable.ic_menu_manage);view.setContentDescription("Patch tools");view.setOnClickListener(PatchStatus::open);}if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)bind(((ViewGroup)view).getChildAt(i));}
 public static void fab(View view){try{bind(view);view.post(()->{try{bind(view);}catch(Exception e){RuntimeStats.error("Tools shortcut",e);}});}catch(Exception e){RuntimeStats.error("Tools shortcut",e);}}
}
