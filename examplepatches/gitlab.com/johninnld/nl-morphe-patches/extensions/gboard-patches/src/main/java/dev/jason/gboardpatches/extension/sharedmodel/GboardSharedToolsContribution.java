package dev.jason.gboardpatches.extension.sharedmodel;
import android.content.Context;
import java.util.*;
import dev.jason.gboardpatches.extension.editingaccesspoints.GboardEditingAccessPointsContribution;
/** All entries are native draggable access points, styled by the applied keyboard theme. */
public final class GboardSharedToolsContribution {
 private static final String[][] ACTIONS={{"shared_local_translate","AI Translate","translate"},{"shared_local_reply","AI Reply","reply"},{"shared_local_style","My Style","my_style"},{"shared_local_instruction","AI Instruction","edit"},{"shared_local_suggestions","Suggest Changes","suggest_instructions"},{"shared_local_voice","Voice Edit","voice_edit"}};
 private GboardSharedToolsContribution(){}
 public static Object extend(Context context,Object original){
  if(!GboardSharedWritingRuntime.selected(context) || !(original instanceof Collection<?>))return original;
  try{List<Object> values=new ArrayList<>((Collection<?>)original);boolean changed=values.remove("shared_local_tools");for(String[] action:ACTIONS)if(!values.contains(action[0])){values.add(action[0]);changed=true;}if(!changed)return original;Class<?> set=Class.forName("auco",false,original.getClass().getClassLoader());if(!set.isInstance(original))return original;return set.getMethod("n",Collection.class).invoke(null,values);}catch(Exception e){return original;}
 }
 public static void register(Object controller,Context context){try{int icon=0x7f0804b7;if(!"drawable".equals(context.getResources().getResourceTypeName(icon)))return;for(String[] action:ACTIONS)GboardEditingAccessPointsContribution.registerExtra(controller,context,action[0],icon,action[1],()->SharedToolsMenu.extra(context,action[2]));}catch(Exception unavailable){}}
}
