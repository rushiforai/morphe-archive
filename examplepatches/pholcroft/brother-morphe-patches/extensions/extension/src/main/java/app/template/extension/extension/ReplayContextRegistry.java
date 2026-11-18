package app.template.extension.extension;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/** Bounded, process-only credentials, partitioned by verified printer ID. */
public final class ReplayContextRegistry {
    private static final class Key {
        final String printer,context;
        Key(String printer,String context){this.printer=printer;this.context=context;}
        @Override public boolean equals(Object other){if(!(other instanceof Key))return false;Key k=(Key)other;return printer.equals(k.printer)&&context.equals(k.context);}
        @Override public int hashCode(){return 31*printer.hashCode()+context.hashCode();}
    }
    private final int limit;private final LinkedHashMap<Key,String> entries=new LinkedHashMap<>(16,0.75f,true);
    public ReplayContextRegistry(int limit){if(limit<1)throw new IllegalArgumentException();this.limit=limit;}
    public synchronized void put(String printer,String context,String value){if(printer==null||context==null||value==null)throw new IllegalArgumentException();entries.put(new Key(printer,context),value);while(entries.size()>limit){Iterator<Key> it=entries.keySet().iterator();it.next();it.remove();}}
    public synchronized String get(String printer,String context){if(printer==null||context==null)return null;return entries.get(new Key(printer,context));}
    public synchronized void clear(String printer){Iterator<Map.Entry<Key,String>> it=entries.entrySet().iterator();while(it.hasNext())if(it.next().getKey().printer.equals(printer))it.remove();}
    public synchronized void clearAll(){entries.clear();}
    public synchronized int size(){return entries.size();}
}
