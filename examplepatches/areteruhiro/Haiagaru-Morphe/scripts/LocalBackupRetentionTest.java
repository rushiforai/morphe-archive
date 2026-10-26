package app.morphe.extension.chmate;

import java.util.*;

public final class LocalBackupRetentionTest {
    static int checks;
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
    static final class Store implements LocalBackupRetention.Documents {
        Set<String> missing=new HashSet<>(),unverified=new HashSet<>(),failed=new HashSet<>();
        List<String> deleted=new ArrayList<>();
        public LocalBackupRetention.Presence inspect(String uri){return missing.contains(uri)?LocalBackupRetention.Presence.MISSING:unverified.contains(uri)?LocalBackupRetention.Presence.UNVERIFIED:LocalBackupRetention.Presence.OWNED;}
        public boolean delete(String uri){deleted.add(uri);return !failed.contains(uri);}
    }
    public static void main(String[] args){
        List<String> eight=List.of("a","b","c","d","e","f","g","new");
        Store store=new Store();var result=LocalBackupRetention.prune(eight,5,store);
        check(result.retained.equals(List.of("d","e","f","g","new")),"keep five");
        check(store.deleted.equals(List.of("a","b","c")),"oldest first");check(result.unresolved==0,"no warning on success");
        store=new Store();store.missing.addAll(List.of("a","b","c"));result=LocalBackupRetention.prune(eight,5,store);
        check(result.retained.equals(List.of("d","e","f","g","new")),"forget missing records");check(store.deleted.isEmpty(),"missing files do not consume retention slots");
        store=new Store();result=LocalBackupRetention.prune(List.of("a","a","b","b","new"),2,store);
        check(result.retained.equals(List.of("b","new")),"deduplicate URI");check(store.deleted.equals(List.of("a")),"delete once");
        store=new Store();result=LocalBackupRetention.prune(List.of("a","b","c","a"),2,store);
        check(result.retained.equals(List.of("c","a"))&&!store.deleted.contains("a"),"last URI occurrence is newest and protected");
        store=new Store();store.failed.add("a");result=LocalBackupRetention.prune(eight,5,store);
        check(result.retained.equals(List.of("a","d","e","f","g","new")),"failed old delete retains newer five");check(result.unresolved==1,"warn on deletion failure");
        store=new Store();store.unverified.addAll(List.of("a","b"));result=LocalBackupRetention.prune(eight,5,store);
        check(store.deleted.equals(List.of("c")),"never delete unverified documents");check(result.unresolved==2,"warn on unavailable authority or ownership");
        check(result.retained.contains("new"),"newest protected");
        store=new Store();result=LocalBackupRetention.prune(List.of("a","b","new"),0,store);check(result.retained.equals(List.of("new")),"minimum one");
        store=new Store();result=LocalBackupRetention.prune(eight,500,store);check(result.retained.equals(eight),"large keep never deletes small list");
        store=new Store();result=LocalBackupRetention.prune(List.of(),5,store);check(result.retained.isEmpty()&&result.unresolved==0,"empty list");
        for(int n=1;n<=120;n++)for(int keep=1;keep<=100;keep++){
            List<String> rows=new ArrayList<>();for(int i=0;i<n;i++)rows.add("uri-"+i);
            store=new Store();result=LocalBackupRetention.prune(rows,keep,store);
            check(result.retained.size()==Math.min(n,keep),"bounded count "+n+"/"+keep);
            check(result.retained.equals(rows.subList(Math.max(0,n-keep),n)),"newest retained "+n+"/"+keep);
        }
        System.out.println("PASS "+checks+" retention checks; only in-memory fixture documents deleted");
    }
}
