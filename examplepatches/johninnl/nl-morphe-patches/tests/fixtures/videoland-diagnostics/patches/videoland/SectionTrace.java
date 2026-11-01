package patches.videoland;

import android.util.Log;
import com.bedrockstreaming.component.layout.domain.core.model.*;
import java.util.*;
import w4.*;

/** Test-only in-UID render evidence. Enabled only by the diagnostic build. */
public final class SectionTrace {
 private static final Set<String> seen=new HashSet<>();
 private static void emit(String text){synchronized(seen){if(seen.size()>1024)seen.clear();if(seen.add(text))Log.i("MorpheSections",text);}}
 private static Object field(Object object,String name)throws Exception{return object.getClass().getField(name).get(object);}
 private static String kind(Object value){return value==null?"null":value.getClass().getName();}
 private static String key(Object value){return value==null?"end":value instanceof Number?value.toString():kind(value);}
 public static void raw(Block block,A1 list){describe(block,list,"raw",-1,"");}
 public static void bound(Object value){model(value,"bound",-1,"");}
 public static void row(Object adapter,int count){try{model(field(adapter,"Q"),"horizontal",count,"");}catch(Exception e){emit("horizontal trace-error="+kind(e));}}
 public static void grid(Object wrapper){try{Object child=field(wrapper,"Q");int count=((androidx.recyclerview.widget.RecyclerView$a)child).c();model(field(child,"e0"),"grid",count," hideEmpty="+field(wrapper,"T"));}catch(Exception e){emit("grid trace-error="+kind(e));}}
 private static void model(Object value,String phase,int count,String extra){if(value instanceof d8.a){d8.a row=(d8.a)value;describe(row.N,row.O,phase,count,extra);}else emit(phase+" model="+kind(value));}
 private static void describe(Block block,A1 list,String phase,int count,String extra){try{
  StringBuilder s=new StringBuilder(phase).append(" count=").append(count).append(extra);
  if(block==null){emit(s.append(" block=null").toString());return;}
  s.append(" id=").append(field(block,"N")).append(" title=").append(field(block,"O")).append(" template=").append(block.P);
  if(block instanceof Block.LayoutBlock){LayoutBlockContent content=((Block.LayoutBlock)block).U;
   if(content!=null){s.append(" items=").append(content.Q==null?-1:content.Q.size());int blocked=0,unknown=0;if(content.Q!=null)for(Object item:content.Q){if(!Availability.keep(item))blocked++;if(!(item instanceof Item)||((Item)item).o()==null)unknown++;}
    s.append(" subscription=").append(blocked).append(" unknown=").append(unknown);
    if(content.R!=null)s.append(" total=").append(content.R.P).append(" next=").append(key(content.R.O));
   }
   Action action=((Block.LayoutBlock)block).S;s.append(" blockAction=").append(action==null?"null":kind(action.P));
  }
  s.append(" pager=").append(kind(list));
  if(list!=null){s.append(" size=").append(list.size()).append(" source=").append(kind(list.k()));
   if(list.k() instanceof FilteredSource){FilteredSource source=(FilteredSource)list.k();s.append(" exhausted=").append(source.exhausted).append(" pending=").append(source.awaitingPublication);}
   if(!list.Q.N.isEmpty()){W1$b$c seed=(W1$b$c)list.Q.N.get(0);s.append(" seedPrev=").append(key(seed.O)).append(" seedNext=").append(key(seed.P));}
  }
  emit(s.toString());
 }catch(Exception e){emit(phase+" trace-error="+kind(e));}}
 public static void page(Object value){try{
  W1$b$c page=(W1$b$c)value;if(!page.N.isEmpty())return;
  StringBuilder s=new StringBuilder("empty-page prev=").append(key(page.O)).append(" next=").append(key(page.P));
  StackTraceElement[] stack=new Exception().getStackTrace();for(int i=1;i<Math.min(stack.length,6);i++)s.append(" <-").append(stack[i].getClassName()).append('.').append(stack[i].getMethodName());emit(s.toString());
 }catch(Exception e){emit("page trace-error="+kind(e));}}
}
