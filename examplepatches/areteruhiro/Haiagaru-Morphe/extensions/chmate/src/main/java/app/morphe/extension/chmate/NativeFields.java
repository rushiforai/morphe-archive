package app.morphe.extension.chmate;

import java.lang.reflect.Field;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/** Cache metadata only; never retain a response, Activity or view instance. */
final class NativeFields {
    private static final Map<Class<?>,Map<String,Field>> FIELDS=new ConcurrentHashMap<>();
    private static final Map<Class<?>,List<Field>> ALL=new ConcurrentHashMap<>();
    static Field find(Class<?> owner,String name)throws NoSuchFieldException {
        Map<String,Field> cached=FIELDS.computeIfAbsent(owner,key->new ConcurrentHashMap<>());
        Field known=cached.get(name);if(known!=null)return known;
        for(Class<?> type=owner;type!=null;type=type.getSuperclass())try{
            Field found=type.getDeclaredField(name);found.setAccessible(true);
            Field previous=cached.putIfAbsent(name,found);return previous==null?found:previous;
        }catch(NoSuchFieldException absent){ }
        throw new NoSuchFieldException(name);
    }
    static List<Field> all(Class<?> owner) {
        return ALL.computeIfAbsent(owner,key->{List<Field> result=new ArrayList<>();
            for(Class<?> type=key;type!=null&&type!=Object.class;type=type.getSuperclass())Collections.addAll(result,type.getDeclaredFields());
            return Collections.unmodifiableList(result);});
    }
    private NativeFields(){ }
}
