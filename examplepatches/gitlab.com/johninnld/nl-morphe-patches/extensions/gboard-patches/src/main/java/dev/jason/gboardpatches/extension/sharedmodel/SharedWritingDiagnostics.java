package dev.jason.gboardpatches.extension.sharedmodel;

import android.util.Log;

/** Default-off lifecycle metadata, with a separate explicit controlled-image text trace. */
public final class SharedWritingDiagnostics {
    private static final String TAG="GboardLocalAi";
    private SharedWritingDiagnostics(){}
    public static boolean enabled(){try{return Log.isLoggable(TAG,Log.DEBUG);}catch(Throwable ignored){return false;}}
    public static void event(String state){
        try{if(Log.isLoggable(TAG,Log.DEBUG))Log.d(TAG,state);}catch(Throwable ignored){/* Observation must not change keyboard behavior. */}
    }
    public static void clientEvent(String phase,String id,String operation,String code,int outputChars){
        if(!enabled())return;
        String client=id!=null && id.matches("[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}")?id:"unassigned";
        String task=java.util.Arrays.asList("generate","proofread","rephrase","professional","friendly","emojify","elaborate","shorten","translate","summarize","reply","complete","edit","grammar","suggest_instructions","my_style","ocr","describe_image").contains(operation)?operation:"unknown";
        String stage="submit".equals(phase)?"submit":"terminal";
        event("client.request phase="+stage+" client="+client+" operation="+task+" code="+SharedLocalAiState.safeCode(code)+" outputChars="+Math.max(0,Math.min(outputChars,1000000)));
    }
    /** Owner-requested comparison with native OCR output; disabled independently of metadata. */
    public static void visionText(String id,String text){
        try{
            if(!Log.isLoggable("LocalAiVisionNative",Log.DEBUG) || !Log.isLoggable("LocalAiVisionText",Log.DEBUG))return;
            if(id==null || !id.matches("[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}") || text==null)return;
            int parts=Math.max(1,(text.length()+999)/1000);
            for(int i=0;i<parts;i++)Log.d("LocalAiVisionText","client="+id+" stage=gboard_terminal part="+(i+1)+"/"+parts+" text="+org.json.JSONObject.quote(text.substring(i*1000,Math.min(text.length(),(i+1)*1000))));
        }catch(Throwable ignored){/* Observation must not change keyboard behavior. */}
    }
}
