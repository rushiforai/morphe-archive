import android.content.Context;
import dev.jason.gboardpatches.extension.sharedmodel.*;
import java.util.*;
import java.util.concurrent.*;

/** Native grammar-result ABI, independent of SentenceExplorer/Nano model admission. */
public final class MorpheSharedGrammar188 implements uum {
 private final Context context;
 private volatile CompletableFuture<List<GrammarEdits.Edit>> pending;
 private volatile boolean closed;
 private MorpheSharedGrammar188(Context context){this.context=context.getApplicationContext();}
 public static uum create(Context context){if(context==null)return null;SharedInlineSettings.refresh(context);return SharedInlineSettings.grammarSelected(context)?new MorpheSharedGrammar188(context):null;}
 public boolean a(akpu locale){return !closed && SharedInlineSettings.grammarSelected(context);}
 public auaz b(CharSequence input,boolean cachedOnly){
  if(closed || input==null || !SharedInlineSettings.grammarSelected(context) || SharedGrammarController.onUiThread())return auaz.n(Collections.emptyList());
  CompletableFuture<List<GrammarEdits.Edit>> request=SharedGrammarController.check(context,input.toString());pending=request;
  try{
   List<Object> result=new ArrayList<>();for(GrammarEdits.Edit edit:request.get(SharedGrammarController.REQUEST_DEADLINE_MS+1_000L,TimeUnit.MILLISECONDS)){uuk builder=new uuk();builder.a=edit.start;builder.b=edit.end;builder.c=Collections.singletonList(edit.replacement);result.add(builder.a());}
   return auaz.n(result);
  }catch(Exception error){request.cancel(false);return auaz.n(Collections.emptyList());}
  finally{if(pending==request)pending=null;}
 }
 public void close(){closed=true;CompletableFuture<?> request=pending;if(request!=null)request.cancel(false);}
}
