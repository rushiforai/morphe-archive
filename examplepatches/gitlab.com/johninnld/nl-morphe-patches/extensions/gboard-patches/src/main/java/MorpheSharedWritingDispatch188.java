import android.content.Context;
import android.view.inputmethod.EditorInfo;
import dev.jason.gboardpatches.extension.sharedmodel.*;

/** Per-request dispatch also covers native handlers cached before the user selected Shared. */
public final class MorpheSharedWritingDispatch188 {
    private static advg choose(advg original,Context context){
        if(GboardSharedWritingRuntime.selected(context))return original instanceof MorpheSharedWritingHandler188?original:new MorpheSharedWritingHandler188(context);
        return original instanceof MorpheSharedWritingHandler188?((MorpheSharedWritingHandler188)original).nativeBackend():original;
    }
    public static avvx b(advg original,Context context){return choose(original,context).b(context);}
    public static avvx c(advg original,Context context,auaz messages,EditorInfo info,adve options){return choose(original,context).c(context,messages,info,options);}
    public static avvx d(advg original,Context context,auaz messages,EditorInfo info,adve options,advf callback){return choose(original,context).d(context,messages,info,options,callback);}
    public static avvx e(advg original,Context context,String text,String other,EditorInfo info,akpu options,axjl language,aisu source,advf callback){return choose(original,context).e(context,text,other,info,options,language,source,callback);}
    public static avvx f(advg original,String text,auaz operations,EditorInfo info,axjl language,Context context,aisu source,advf callback){return choose(original,context).f(text,operations,info,language,context,source,callback);}
    public static avvx g(advg original,String text,auaz operations,EditorInfo info,axjl language,Context context,aisu source,auaz extra,advf callback){return choose(original,context).g(text,operations,info,language,context,source,extra,callback);}
    public static void r(advg original){if(GboardSharedWritingRuntime.selected(GboardSharedWritingRuntime.context()))SharedModelClient.cancelRequests();original.r();}
    public static adsd tryReadiness(){Context c=GboardSharedWritingRuntime.context();return GboardSharedWritingRuntime.selected(c)?(SharedModelClient.ready(c)?adsd.b:adsd.a):null;}
}