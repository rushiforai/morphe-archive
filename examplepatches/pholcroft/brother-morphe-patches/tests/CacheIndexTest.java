import app.template.extension.extension.CacheIndex;
import java.util.HashMap;
import java.util.Map;

public class CacheIndexTest {
    public static void main(String[] args) {
        CacheIndex index=new CacheIndex();
        long generation=index.generation("printer");
        Map<String,String> saved=new HashMap<>();saved.put("1.2.3","original");
        if(!index.install("printer","ctx",generation,saved))throw new AssertionError("valid load should install");
        saved.put("1.2.3","modified");
        if(!"original".equals(index.get("printer","ctx","1.2.3")))throw new AssertionError("load must be copied");
        if(index.get("printer","other","1.2.3")!=null)throw new AssertionError("contexts must be isolated");
        index.clear("printer");
        if(index.install("printer","ctx",generation,saved))throw new AssertionError("stale load cannot revive cleared entries");
        if(index.put("printer","ctx","1.2.3","stale",generation))throw new AssertionError("stale response cannot revive cleared entries");
        long next=index.generation("printer");
        if(!index.put("printer","ctx","1.2.3","fresh",next)||!"fresh".equals(index.get("printer","ctx","1.2.3")))
            throw new AssertionError("new generation must accept learning");
    }
}
