package e.e.a;
import java.lang.reflect.*;import java.util.*;
/** Preserve identity and lane anchors when history reparses the same comments. */
public final class CommentContinuity118 {
 static final class Model {Map<String,Object> comments=new HashMap<>();}
 static final WeakHashMap<Object,Model> MODELS=new WeakHashMap<>();
 static final WeakHashMap<Object,Long> GENERATIONS=new WeakHashMap<>();
 static final java.util.concurrent.ConcurrentHashMap<Class<?>,Map<String,Field>> FIELDS=new java.util.concurrent.ConcurrentHashMap<>();
 static Object field(Object o,String name){if(o==null)return null;try{Map<String,Field> map=FIELDS.get(o.getClass());if(map==null){map=new HashMap<>();for(Field f:o.getClass().getDeclaredFields()){f.setAccessible(true);map.put(f.getName(),f);}FIELDS.put(o.getClass(),map);}Field f=map.get(name);return f==null?null:f.get(o);}catch(Exception e){return null;}}
 static String key(Object c){Object m=CommentListExtras.meta.get(c);if(m==null)return null;Object no=field(m,"no");if(!(no instanceof Number)||((Number)no).intValue()<=0)return null;StringBuilder s=new StringBuilder();for(String name:new String[]{"video","thread","fork","no"})part(s,field(m,name));for(String name:new String[]{"a","b","c","d","f","h","i","j","l","o"})part(s,field(c,name));return s.toString();}
 static void part(StringBuilder b,Object o){String s=String.valueOf(o);b.append(s.length()).append(':').append(s);}
 public static ArrayList<?> merge(Object model,ArrayList<?> input){if(input==null)return null;Model state;synchronized(MODELS){state=MODELS.get(model);if(state==null){state=new Model();MODELS.put(model,state);}}synchronized(state){Map<String,Object> old=state.comments,next=new HashMap<>();ArrayList<Object> out=new ArrayList<>(input.size());for(Object c:input){String key=key(c);Object previous=key==null?null:old.remove(key);Object use=previous==null?c:previous;if(previous!=null){CommentListExtras.Meta meta=CommentListExtras.meta.get(c);if(meta!=null)CommentListExtras.meta.put(previous,meta);}out.add(use);if(key!=null&&next.size()<15000)next.put(key,use);}state.comments=next;return out;}}
 public static void refresh(Object renderer)throws Exception{Object worker=field(renderer,"t");if(worker instanceof Thread&&((Thread)worker).isAlive()&&!Boolean.TRUE.equals(field(renderer,"u")))return;renderer.getClass().getMethod("e").invoke(renderer);}
 public static boolean reset(Object renderer){long current=CommentMotion.generation(renderer);synchronized(GENERATIONS){Long old=GENERATIONS.put(renderer,current);return old==null||old.longValue()!=current;}}
}
