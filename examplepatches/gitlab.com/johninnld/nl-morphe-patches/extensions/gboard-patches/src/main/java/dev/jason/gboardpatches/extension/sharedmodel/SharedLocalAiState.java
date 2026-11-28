package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.SharedPreferences;
import app.johninnl.modelhost.api.HostException;
import app.johninnl.modelhost.api.HostStatus;
import dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsSettings;
import org.json.JSONObject;

/** Selection is a user preference; readiness is a separate, current provider state. */
public final class SharedLocalAiState {
    private static final String PREVIOUS_BACKEND="pref_shared_previous_backend";
    private static final String PREVIOUS_OVERRIDE_ENABLED="pref_shared_previous_override_enabled";
    private SharedLocalAiState() {}

    public static boolean selected(SharedPreferences p) {
        return GboardAiWritingToolsSettings.readEnabled(p) &&
            GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL.equals(GboardAiWritingToolsSettings.readBackendType(p));
    }
    public static boolean select(SharedPreferences p,boolean enabled) {
        if(p==null)return false;
        SharedPreferences.Editor edit=p.edit();
        String current=GboardAiWritingToolsSettings.readBackendType(p);
        if(enabled){
            if(!GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL.equals(current)){
                edit.putString(PREVIOUS_BACKEND,current)
                    .putBoolean(PREVIOUS_OVERRIDE_ENABLED,GboardAiWritingToolsSettings.readEnabled(p));
            }
            edit.putBoolean(GboardAiWritingToolsSettings.PREF_KEY_ENABLED,true)
                .putString(GboardAiWritingToolsSettings.PREF_KEY_BACKEND_TYPE,GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL);
        }else if(GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL.equals(current)){
            String previous;
            try{previous=p.getString(PREVIOUS_BACKEND,GboardAiWritingToolsSettings.DEFAULT_BACKEND_TYPE);}catch(ClassCastException e){previous=null;}
            previous=GboardAiWritingToolsSettings.sanitizeBackendType(previous);
            if(GboardAiWritingToolsSettings.BACKEND_SHARED_LOCAL.equals(previous))previous=GboardAiWritingToolsSettings.DEFAULT_BACKEND_TYPE;
            // Earlier versions only saved the backend. With no saved choice, leave the override off.
            boolean previousEnabled;
            try{previousEnabled=p.getBoolean(PREVIOUS_OVERRIDE_ENABLED,false);}catch(ClassCastException e){previousEnabled=false;}
            edit.putString(GboardAiWritingToolsSettings.PREF_KEY_BACKEND_TYPE,previous)
                .putBoolean(GboardAiWritingToolsSettings.PREF_KEY_ENABLED,previousEnabled)
                .remove(PREVIOUS_BACKEND)
                .remove(PREVIOUS_OVERRIDE_ENABLED);
        }
        return edit.commit();
    }
    public static String providerSummary(HostStatus status,String connectionCode) {
        if(status==null)return failureMessage(connectionCode);
        String code="";
        try{code=new JSONObject(status.toJson()).optString("code","");}catch(Exception ignored){}
        if(!status.enabled)return "Provider OFF. Open provider setup and tap Start local AI.";
        if("VERIFYING_MODEL".equals(code))return "Provider STARTING — verifying the downloaded model.";
        switch(status.state){
            case "READY":return "Model READY — local requests can run.";
            case "BUSY":return "Model BUSY — processing a local request.";
            case "LOADING":case "PREPARING":case "RECOVERING":return "Provider STARTING — loading and preparing the model.";
            case "MODEL_MISSING":return "Model MISSING. Open provider setup and download or import the model.";
            case "MEMORY_PAUSED":return "Model PAUSED for memory. Close other demanding apps and try again.";
            case "FAILED":return failureMessage(code.isEmpty()?"LOAD_FAILED":code);
            default:return "Provider is enabled; model is not ready yet ("+safeCode(status.state)+").";
        }
    }
    public static String failureCode(Throwable failure) {
        Throwable current=failure;
        for(int i=0;i<6 && current!=null;i++){
            if(current instanceof HostException)return safeCode(((HostException)current).code);
            String message=current.getMessage();
            if(message!=null && message.matches("[A-Z][A-Z_]{1,63}"))return safeCode(message);
            current=current.getCause();
        }
        return "REQUEST_FAILED";
    }
    public static String safeCode(String code){return code!=null && code.matches("[A-Z][A-Z_]{1,63}")?code:"REQUEST_FAILED";}
    public static String failureMessage(String code) {
        switch(safeCode(code)){
            case "PROVIDER_MISSING":return "Provider NOT INSTALLED. Install Local Model Host below.";
            case "PROVIDER_STOPPED":case "DISABLED":case "STOPPED":return "Provider OFF. Open provider setup and tap Start local AI.";
            case "PROVIDER_UNTRUSTED":case "UNTRUSTED_PROVIDER":return "Provider verification failed. Install the matching signed Local Model Host APK.";
            case "MODEL_MISSING":return "Model MISSING. Download or import it in provider setup.";
            case "LOAD_FAILED":case "ENGINE_OWNERSHIP_UNKNOWN":return "The model could not load. Open Model setup, switch it off and on again.";
            case "MEMORY_PAUSED":return "Model PAUSED for memory. Close other demanding apps and try again.";
            case "ENABLE_OCR_IN_PROVIDER":return "Image support is OFF. Enable Images and text scanning in Local Model Host.";
            case "PROVIDER_NOT_READY":return "The model is not ready. Open Model setup to see its current state.";
            case "OCR_TIMEOUT":return "Reading the image timed out. Try a smaller crop when the model is ready.";
            case "LOADING":case "PREPARING":case "RECOVERING":case "LOAD_BACKOFF":case "RECONFIGURING":return "Model is STARTING. Wait for Model ready in provider setup.";
            case "SESSION_INACTIVE":case "SESSION_UNAVAILABLE":return "Keyboard session is unavailable. Close and reopen the keyboard, then retry.";
            case "PROVIDER_UNAVAILABLE":case "SERVICE_DISCONNECTED":case "BINDING_DIED":return "Provider connection was lost. Open provider setup, then reopen the keyboard.";
            case "INPUT_TOO_LONG":case "CONTEXT_EXCEEDED":case "TOKEN_BUDGET_EXCEEDED":case "CONTEXT_LIMIT":return "This text exceeds the local model's context limit. Select a shorter passage.";
            case "OUTPUT_TRUNCATED":return "The model ran out of output space. Nothing was applied; try a shorter passage.";
            case "DEADLINE_EXCEEDED":case "TIMEOUT":return "The local request timed out. Nothing was applied; retry when the model is ready.";
            case "NATIVE_THEME_UNAVAILABLE":return "Gboard’s themed writing surface is not ready. Close and reopen Writing Tools.";
            case "NATIVE_WRITING_ACTIVATION_FAILED":return "Gboard could not open its writing session in this editor. Nothing was applied.";
            case "NATIVE_EDITOR_UNAVAILABLE":return "Gboard’s writing session is not active. Open Writing tools for this draft, then retry Local AI.";
            case "EDIT_NO_CHANGE":return "This edit left your draft unchanged. Try a different edit.";
            case "SUGGESTIONS_TOO_FEW":return "Local AI could not find two distinct suggestions for this draft. Your text is unchanged. Try Suggest Changes again.";
            case "NO_USABLE_SUGGESTIONS":case "SUGGESTIONS_INVALID_OUTPUT":return "The model returned suggestions in an unreadable format. Nothing was applied. Try Suggest Changes again.";
            case "EDITOR_UNAVAILABLE":return "Writing tools are unavailable in this editor. Try a normal editable draft.";
            case "SHARED_BACKEND_NOT_SELECTED":return "Local AI is OFF for Gboard. Enable it in Local AI settings.";
            default:return "The local request could not finish. Nothing was applied. Check the model status or try again.";
        }
    }
}
