import dev.jason.gboardpatches.extension.sharedmodel.*;
/** The native inline view/gestures are reused; shared text never fabricates a Delight decoder candidate ID. */
public final class MorpheSharedCompletion188 {
 private MorpheSharedCompletion188(){}
 public static void remember(Object object){if(object instanceof aemy){aemy owner=(aemy)object;if(owner.d!=null)SharedCompletionController.remember(owner,owner.d);}}
 public static int eligibility(Object object){if(!(object instanceof aemy))return -1;aemy owner=(aemy)object;int mode=GboardSharedWritingRuntime.selected(owner.d)?(SharedInlineSettings.completionSelected(owner.d)?1:0):-1;return mode==1?(owner.morpheSharedAllowed()?1:0):mode;}
 public static aegy filter(Object object,Object candidate){
  if(!(object instanceof aemy))return (aegy)candidate;
  if(!GboardSharedWritingRuntime.selected(((aemy)object).d))return (aegy)candidate;
  return candidate instanceof aegy && ((aegy)candidate).m instanceof SharedCompletionController.Suggestion?(aegy)candidate:null;
 }
 public static void show(Object object,String suffix,Object marker){if(!(object instanceof aemy))return;aemy owner=(aemy)object;if(eligibility(owner)!=1 || owner.k==null)return;
  aegv builder=new aegv();builder.a=suffix;builder.c=suffix;builder.w=7;builder.m=marker;
  for(aegx type:aegx.values())if("PREDICTION".equals(((Enum<?>)(Object)type).name())){builder.e=type;break;}
  owner.r(builder.a(),false);
 }
 public static void clear(Object object){if(!(object instanceof aemy))return;aemy owner=(aemy)object;aegy current=owner.morpheSharedCurrent();if((current!=null && current.m instanceof SharedCompletionController.Suggestion) || (owner.g!=null && owner.g.m instanceof SharedCompletionController.Suggestion))owner.morpheSharedClear();}
 public static boolean tryAccept(Object object){if(!(object instanceof aemy))return false;aegy current=((aemy)object).morpheSharedCurrent();return current!=null && SharedCompletionController.accept(current.m);}
}
