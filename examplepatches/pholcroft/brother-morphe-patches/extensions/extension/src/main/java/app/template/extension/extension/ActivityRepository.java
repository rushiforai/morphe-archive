package app.template.extension.extension;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/** In-memory identity index; durable storage must apply the same transaction rules. */
public final class ActivityRepository {
    private static final class Entry {
        String id, name, mac, address;
        boolean changed;
        final ArrayList<String> addresses = new ArrayList<>();
        final Map<String,String> cache = new HashMap<>();
        PrinterRecord snapshot(){return new PrinterRecord(id,name,address,mac,addresses,changed);}
    }
    private final Map<String,Entry> byId = new HashMap<>(), byMac = new HashMap<>(), byAddress = new HashMap<>();
    private final Map<String,Long> generations = new HashMap<>();
    public synchronized PrinterRecord resolveVerified(String address,String mac,String name) {
        if(address==null||mac==null||!mac.matches("(?i)[0-9a-f]{2}(:[0-9a-f]{2}){5}"))throw new IllegalArgumentException();
        mac=mac.toLowerCase(java.util.Locale.ROOT);
        Entry entry=byMac.get(mac);
        if(entry==null){entry=new Entry();entry.id=UUID.randomUUID().toString();entry.mac=mac;byMac.put(mac,entry);byId.put(entry.id,entry);}
        Entry previous=byAddress.get(address);
        if(previous!=null&&previous!=entry&&address.equals(previous.address))previous.address=null;
        if(entry.address!=null&&!entry.address.equals(address)){entry.changed=true;if(byAddress.get(entry.address)==entry)byAddress.remove(entry.address);}
        entry.name=name;entry.address=address;if(!entry.addresses.contains(address))entry.addresses.add(address);
        byAddress.put(address,entry);return entry.snapshot();
    }
    public synchronized long generation(String id){Long n=generations.get(id);return n==null?0:n;}
    public synchronized boolean putCached(String id,String key,String value,long generation){Entry e=byId.get(id);if(e==null||generation(id)!=generation)return false;e.cache.put(key,value);return true;}
    public synchronized String getCached(String id,String key){Entry e=byId.get(id);return e==null?null:e.cache.get(key);}
    public synchronized void clear(String id){Entry e=byId.remove(id);generations.put(id,generation(id)+1);if(e==null)return;byMac.remove(e.mac);if(e.address!=null&&byAddress.get(e.address)==e)byAddress.remove(e.address);}
}
