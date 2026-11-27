package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.Context;
import android.os.*;
import android.widget.LinearLayout;
import app.johninnl.modelhost.api.TextRequest;
import java.util.concurrent.CompletableFuture;

/** Extra operations use native-themed body content and the original GenAiEditHandler apply/undo path. */
public final class SharedTextActions {
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private SharedTextActions(){}
 static void run(Context context,String operation,String instruction,String language,EditorSnapshot snapshot){
  try{
   if(!GboardSharedWritingRuntime.isCurrent(snapshot))return;
   String original=NativeEditBridge.prepare();
   if(original==null){failure(context,"NATIVE_EDITOR_UNAVAILABLE");return;}
   if(original.trim().isEmpty()&&!"reply".equals(operation)){message(context,"Select text or place the cursor in an editable draft.");return;}
   request(context,operation,original,instruction,null,language,snapshot);
  }catch(Exception error){failure(context,SharedLocalAiState.failureCode(error));}
 }
 static void request(Context context,String operation,String original,String instruction,String explicitContext,String language,EditorSnapshot snapshot){
  request(context,operation,original,instruction,explicitContext,language,snapshot,null);
 }
 static void request(Context context,String operation,String original,String instruction,String explicitContext,String language,EditorSnapshot snapshot,SharedKeyboardSurface.Panel existing){
  if(!GboardSharedWritingRuntime.isCurrent(snapshot)){if(existing!=null)existing.dismiss();return;}
  TextRequest request=new TextRequest(operation,"reply".equals(operation)&&original.trim().isEmpty()?"Draft a brief, relevant reply to the visible messages. Do not invent facts, excuses, promises or commitments. Ask for missing information when needed.":original,instruction,explicitContext,language,null,512,30000);
  final SharedKeyboardSurface.Panel working;
  java.util.concurrent.atomic.AtomicReference<CompletableFuture<String>> active=new java.util.concurrent.atomic.AtomicReference<>();
  if(existing==null){
   LinearLayout progress=SharedKeyboardSurface.body();SharedKeyboardSurface.label(progress,progressLabel(operation,language));working=new SharedKeyboardSurface.Panel(progress);
   SharedKeyboardSurface.button(progress,"Cancel",working::dismiss);
  }else{
   working=existing;if(!working.isShowing())return;working.replaceContent();working.label(progressLabel(operation,language));working.button("Cancel",working::dismiss);
  }
  working.setOnDismissListener(()->{CompletableFuture<String> task=active.get();if(task!=null&&!task.isDone())task.cancel(false);});
  if(existing==null&&!working.show()){failure(context,"NATIVE_THEME_UNAVAILABLE");return;}
  if(!GboardSharedWritingRuntime.isCurrent(snapshot)){working.dismiss();return;}
  final CompletableFuture<String> pending;
  try{pending=SharedModelClient.request(context,request);active.set(pending);}
  catch(RuntimeException unavailable){showFailure(context,working,SharedLocalAiState.failureCode(unavailable));return;}
  pending.whenComplete((result,error)->MAIN.post(()->{
   if(pending.isCancelled() || !working.isShowing())return;
   if(!GboardSharedWritingRuntime.isCurrent(snapshot)){working.dismiss();message(context,"The editor changed. Nothing was applied.");return;}
   if(error!=null){showFailure(context,working,SharedLocalAiState.failureCode(error));return;}
   try{if("suggest_instructions".equals(operation))showInstructions(context,working,result,original,snapshot);else preview(context,working,result,operation,snapshot);}
   catch(Exception unavailable){showFailure(context,working,"NATIVE_THEME_UNAVAILABLE");}
  }));
 }
 static String progressLabel(String operation,String language){
  if("translate".equals(operation))return "Translating to "+java.util.Locale.forLanguageTag(language==null?"en":language).getDisplayLanguage(java.util.Locale.ENGLISH)+"…";
  if("suggest_instructions".equals(operation))return "Suggesting changes…";
  if("reply".equals(operation))return "Drafting your reply…";
  return "Working on your text…";
 }
 private static void showInstructions(Context context,SharedKeyboardSurface.Panel panel,String result,String original,EditorSnapshot snapshot){
  final String[] instructions;
  try{instructions=SharedInstructionSuggestions.parse(result);}
  catch(IllegalArgumentException unusable){SharedWritingDiagnostics.event("suggestions.rejected "+unusable.getMessage());showFailure(context,panel,"NO_USABLE_SUGGESTIONS");return;}
  if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("suggestions.accepted count="+instructions.length);
  panel.replaceContent();panel.label(instructions.length==0?"No editing changes were suggested. Your draft is unchanged.":"Suggested changes");
  for(String instruction:instructions)panel.button(instruction,()->{if(GboardSharedWritingRuntime.isCurrent(snapshot))request(context,"edit",original,instruction,null,null,snapshot,panel);else{panel.dismiss();message(context,"The editor changed. Nothing was applied.");}});
  panel.button("Back",panel::dismiss);
 }
 private static void preview(Context context,SharedKeyboardSurface.Panel panel,String result,String operation,EditorSnapshot snapshot){
  if(result==null || result.isEmpty()){showFailure(context,panel,"NO_OR_EMPTY_RESPONSE");return;}
  panel.replaceContent();panel.label(result);
  panel.button("Apply",()->{panel.dismiss();if(!GboardSharedWritingRuntime.isCurrent(snapshot)){message(context,"The editor changed. Nothing was applied.");return;}try{if(!NativeEditBridge.apply(result,operation))failure(context,"EDITOR_UNAVAILABLE");}catch(Exception unavailable){failure(context,"EDITOR_UNAVAILABLE");}});
  panel.button("Cancel",panel::dismiss);
 }
 private static void showFailure(Context context,SharedKeyboardSurface.Panel panel,String code){
  SharedModelClient.noteFailure(code);if(!panel.isShowing())return;panel.replaceContent();panel.label(SharedLocalAiState.failureMessage(code));panel.button("Back",panel::dismiss);panel.button("Local AI settings",()->{panel.dismiss();SharedModelSetupActivity.open(context);});
 }
 static void failure(Context context,String code){SharedModelClient.noteFailure(code);message(context,SharedLocalAiState.failureMessage(code));}
 static void message(Context context,String text){MAIN.post(()->{
  try{
   if(SharedKeyboardSurface.available()){
    LinearLayout body=SharedKeyboardSurface.body();SharedKeyboardSurface.label(body,text);SharedKeyboardSurface.Panel panel=new SharedKeyboardSurface.Panel(body);
    SharedKeyboardSurface.button(body,"Back",panel::dismiss);SharedKeyboardSurface.button(body,"Local AI settings",()->{panel.dismiss();SharedModelSetupActivity.open(context);});
    if(panel.show())return;
   }
  }catch(Exception unavailable){SharedModelClient.noteFailure("NATIVE_THEME_UNAVAILABLE");}
  android.widget.Toast.makeText(context,text,android.widget.Toast.LENGTH_LONG).show();
 });}
}
