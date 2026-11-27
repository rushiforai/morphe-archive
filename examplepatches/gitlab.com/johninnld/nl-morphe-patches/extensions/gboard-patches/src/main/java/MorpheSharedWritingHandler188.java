import android.content.Context;
import android.view.inputmethod.EditorInfo;
import java.util.*;
import java.util.concurrent.*;
import dev.jason.gboardpatches.extension.sharedmodel.*;

/** Complete native 18.8 advg ABI. Stubs are compile-only; the target APK supplies every native class. */
public final class MorpheSharedWritingHandler188 implements advh {
    private final Context context;
    private final agrh logger;
    private advg fallback;
    private String fallbackMode;
    private final Set<CompletableFuture<Object>> pending=ConcurrentHashMap.newKeySet();
    public MorpheSharedWritingHandler188(Context context){this(context,null);}
    public MorpheSharedWritingHandler188(Context context,agrh logger){this.context=context.getApplicationContext();this.logger=logger;SharedModelClient.connect(this.context);}
    public static advg tryCreate(Context context,agrh logger){return GboardSharedWritingRuntime.selected(context)?new MorpheSharedWritingHandler188(context,logger):null;}
    public synchronized advg nativeBackend(){
        if(logger==null)throw new IllegalStateException("NATIVE_BACKEND_RESTART_REQUIRED");
        String mode=dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsSettings.readBackendType(dev.jason.gboardpatches.extension.writingtools.GboardAiWritingToolsSettings.preferences(context));
        if(fallback==null || !mode.equals(fallbackMode)){if(fallback!=null)try{fallback.close();}catch(Exception ignored){}fallback=pzy.a(context,logger);fallbackMode=mode;}
        return fallback;
    }
    public aeaf a(){return GboardSharedWritingRuntime.selected(context)?aeaf.a:nativeBackend().a();}
    public avvx b(Context c){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("backend.readiness ready="+SharedModelClient.isReadyCached());if(!GboardSharedWritingRuntime.selected(context))return nativeBackend().b(c);return immediate(SharedModelClient.ready(context)?adsd.b:adsd.a);}
    public avvx c(Context c,auaz messages,EditorInfo info,adve options){
        if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("backend.prompt messages="+messages.size());
        advj prompt=null;
        for(Object value:messages){if(!(value instanceof advj) || ((advj)value).d()!=1 || prompt!=null)return immediate(errorResult("NO_OR_EMPTY_RESPONSE"));prompt=(advj)value;}
        if(prompt==null)return immediate(errorResult("NO_OR_EMPTY_RESPONSE"));
        return text("generate",prompt.c(),"Follow the explicit writing request and output format in the supplied prompt. Preserve facts, names, numbers and negation. Do not add an introduction or unrequested language changes.",operation("prompt"));
    }
    public avvx d(Context c,auaz messages,EditorInfo info,adve options,advf callback){return c(c,messages,info,options);}
    public avvx e(Context c,String text,String other,EditorInfo info,akpu options,axjl language,aisu source,advf callback){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("backend.proofread");return text("proofread",text,null,operation("proofread"));}
    public avvx f(String text,auaz operations,EditorInfo info,axjl language,Context c,aisu source,advf callback){
        if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("backend.rewrite operations="+operations.size());
        if(operations.size()!=1)return immediate(errorResult("NO_OR_EMPTY_RESPONSE"));
        Object operation=operations.get(0);String name=operation.toString();
        if(!Arrays.asList("proofread","rephrase","professional","friendly","emojify","elaborate","shorten").contains(name))return immediate(errorResult("NO_OR_EMPTY_RESPONSE"));
        return text(name,text,null,operation);
    }
    public avvx g(String text,auaz operations,EditorInfo info,axjl language,Context c,aisu source,auaz extra,advf callback){return f(text,operations,info,language,c,source,callback);}
    private avvx text(String operation,String original,String instruction,Object nativeOperation){
        CompletableFuture<String> request=GboardSharedWritingRuntime.request(context,operation,original,instruction);
        CompletableFuture<Object> result=new CompletableFuture<>();pending.add(result);
        result.whenComplete((value,error)->{pending.remove(result);if(result.isCancelled())request.cancel(false);});
        request.whenComplete((value,error)->{
            if(result.isDone())return;
            if(error instanceof java.util.concurrent.CancellationException){result.cancel(false);return;}
            if(error!=null){try{result.complete(errorResult("NO_OR_EMPTY_RESPONSE"));}catch(Throwable drift){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("backend.result error="+drift.getClass().getSimpleName());result.completeExceptionally(drift);}return;}
            try {
            aeai builder=aeak.b();builder.i(value);builder.d(0);builder.g(1.0);builder.h(java.util.UUID.randomUUID().toString());builder.f("Gemma 4 E2B local");builder.b(aeaf.a);builder.k(j$.util.Optional.ofNullable(nativeOperation));builder.c(code(original.equals(value)?"SAME_WITH_REQUEST":"NO_ERROR"));result.complete(auaz.q(builder.a()));
            }catch(Throwable drift){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("backend.result error="+drift.getClass().getSimpleName());result.completeExceptionally(drift);}
        });return new MorpheSharedFuture188(result);
    }
    private static aeaj operation(String name){for(aeaj value:aeaj.values())if(name.equals(value.toString()))return value;throw new IllegalStateException("Native operation enum drift");}
    private static aeal code(String name){for(aeal value:aeal.values())if(name.equals(((Enum<?>)(Object)value).name()))return value;throw new IllegalStateException("Native error enum drift");}
    private static auaz errorResult(String error){if(SharedWritingDiagnostics.enabled())SharedWritingDiagnostics.event("backend.error code="+error);aeai b=aeak.b();b.c(code(error));return auaz.q(b.a());}
    private static avvx immediate(Object value){return new MorpheSharedFuture188(CompletableFuture.completedFuture(value));}
    public void r(){for(CompletableFuture<Object> f:pending)f.cancel(false);if(!GboardSharedWritingRuntime.selected(context) && logger!=null)nativeBackend().r();}
    public void s(Context context){if(GboardSharedWritingRuntime.selected(context))SharedModelClient.connect(context);else nativeBackend().s(context);}
    public boolean w(){return GboardSharedWritingRuntime.selected(context)?false:nativeBackend().w();}
    public String j(){return GboardSharedWritingRuntime.selected(context)?"Gemma 4 E2B local":nativeBackend().j();}
    public synchronized void close(){for(CompletableFuture<Object> f:pending)f.cancel(false);if(fallback!=null)try{fallback.close();}catch(Exception ignored){}fallback=null;}
}
