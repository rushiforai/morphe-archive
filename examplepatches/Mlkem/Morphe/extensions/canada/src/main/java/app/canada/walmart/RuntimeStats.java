package app.canada.walmart;
import java.util.*;
/** UI-independent session counters; no product, account or network data is logged. */
public final class RuntimeStats {
    static final Map<String,Integer> counts=new LinkedHashMap<>();
    static final Map<String,String> errors=new LinkedHashMap<>();
    public static synchronized void hit(String name){counts.put(name,counts.containsKey(name)?counts.get(name)+1:1);}
    public static synchronized void error(String name,Exception e){errors.put(name,e.getClass().getSimpleName());}
    static synchronized Map<String,Integer> countSnapshot(){return new LinkedHashMap<>(counts);}
    static synchronized Map<String,String> errorSnapshot(){return new LinkedHashMap<>(errors);}
    static synchronized void clear(){counts.clear();errors.clear();}
}
