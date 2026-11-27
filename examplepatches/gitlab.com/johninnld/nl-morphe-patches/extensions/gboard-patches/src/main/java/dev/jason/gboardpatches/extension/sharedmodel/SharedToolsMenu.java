package dev.jason.gboardpatches.extension.sharedmodel;
import android.content.Context;
/** The standard writing actions stay in Gboard's native, keyboard-themed Writing Tools UI. */
public final class SharedToolsMenu {
 private SharedToolsMenu(){}
 public static void open(Context context){
  if(!GboardSharedWritingRuntime.selected(context) || !SharedModelClient.ready(context)){SharedModelSetupActivity.open(context);return;}
  SharedWritingActivation.ensure(context,GboardSharedWritingRuntime.captureEditor(),()->{});
 }
 static void extra(Context context,String operation){
  if(!GboardSharedWritingRuntime.selected(context) || !SharedModelClient.ready(context)){SharedModelSetupActivity.open(context);return;}
  EditorSnapshot snapshot=GboardSharedWritingRuntime.captureEditor();
  if("reply".equals(operation)||"my_style".equals(operation)){SharedScreenContext.reply(context,"my_style".equals(operation),snapshot);return;}
  SharedWritingActivation.ensure(context,snapshot,()->SharedKeyboardSurface.whenAvailable(context,snapshot,()->{
   SharedModelClient.cancelRequests();
   if("voice_edit".equals(operation)){SharedVoiceEditController.arm(context,snapshot);return;}
   String instruction="edit".equals(operation)?SharedWritingPreferences.read(context,"instruction"):null;
   if(instruction!=null && instruction.isEmpty()){SharedTextActions.message(context,"Add the instruction in Writing preferences first.");return;}
   String language="translate".equals(operation)?SharedWritingPreferences.language(context):null;
   SharedTextActions.run(context,operation,instruction,language,snapshot);
  }));
 }
}
