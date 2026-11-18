package app.template.extension.extension;

import java.util.HashMap;
import java.util.Map;

/** In-memory response index; caller supplies only verified printer identities. */
public final class CacheIndex {
    private static final class Printer {
        long generation;
        final Map<String,Map<String,String>> contexts=new HashMap<>();
    }
    private final Map<String,Printer> printers=new HashMap<>();
    private Printer printer(String id){if(id==null)throw new IllegalArgumentException();Printer p=printers.get(id);if(p==null){p=new Printer();printers.put(id,p);}return p;}
    public synchronized long generation(String id){return printer(id).generation;}
    public synchronized boolean install(String id,String context,long generation,Map<String,String> entries){
        if(context==null||entries==null)throw new IllegalArgumentException();Printer p=printer(id);
        if(p.generation!=generation)return false;
        // Merge without overwriting responses learned while the load was running.
        Map<String,String> current=p.contexts.get(context);
        if(current==null){current=new HashMap<>();p.contexts.put(context,current);}
        for(Map.Entry<String,String> e:entries.entrySet())if(!current.containsKey(e.getKey()))current.put(e.getKey(),e.getValue());
        return true;
    }
    public synchronized boolean put(String id,String context,String oid,String value,long generation){
        if(context==null||oid==null||value==null)throw new IllegalArgumentException();Printer p=printer(id);
        if(p.generation!=generation)return false;
        Map<String,String> current=p.contexts.get(context);if(current==null){current=new HashMap<>();p.contexts.put(context,current);}current.put(oid,value);return true;
    }
    public synchronized String get(String id,String context,String oid){Printer p=printers.get(id);if(p==null)return null;Map<String,String> values=p.contexts.get(context);return values==null?null:values.get(oid);}
    public synchronized void clear(String id){Printer p=printer(id);p.generation++;p.contexts.clear();}
}
