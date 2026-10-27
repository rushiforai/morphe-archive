import app.morphe.extension.chmate.*;
import jp.syoboi.a2chMate.ng.NGWord.Item;
import android.util.SparseIntArray;
import java.util.*;

public final class PosterIdHiddenChainTest {
    static int checks;
    static void check(boolean ok, String message) { checks++; if (!ok) throw new AssertionError(message); }
    static class Matcher { List<Item> rules; Matcher(Item... items) { rules = Arrays.asList(items); } }
    static class processAdDisplayErrorPostbackForUserError { String h,c; int o; int[] d; }
    static class BouncyCastleSocketAdapterCompanion { String j,d; int l; int[] a; }
    static class KeJ11 { String g,h; int o; int[] b; }
    static class m9ExternalSyntheticLambda1 { Object K,C; SparseIntArray N = new SparseIntArray(); }
    static class listener { Object J,A; Map<Integer,Integer> K = new HashMap<>(); }
    static class zzaW { Object a,c; Map<Integer,Integer> j = new HashMap<>(); }
    static class BaseView extends ArrayList<Object> { List<Object> mBase; BaseView(List<Object> rows) { mBase = rows; } }
    record Model(Class<?> owner, Class<?> row, String rows, String word, String map, String id, String body, String number, String anchors) {}
    static final Model[] MODELS = {
        new Model(m9ExternalSyntheticLambda1.class,processAdDisplayErrorPostbackForUserError.class,"K","C","N","h","c","o","d"),
        new Model(listener.class,BouncyCastleSocketAdapterCompanion.class,"J","A","K","j","d","l","a"),
        new Model(zzaW.class,KeJ11.class,"a","c","j","g","h","o","b")
    };
    static void set(Object o,String f,Object v)throws Exception { var field=o.getClass().getDeclaredField(f);field.set(o,v); }
    static Object row(Model m,int n,String id,String body,int... anchors)throws Exception {
        Object r=m.row.getDeclaredConstructor().newInstance();set(r,m.id,id);set(r,m.body,body);set(r,m.number,n);set(r,m.anchors,anchors);return r;
    }
    static Object owner(Model m,List<Object> rows,Item... rules)throws Exception {
        Object o=m.owner.getDeclaredConstructor().newInstance();set(o,m.rows,rows);set(o,m.word,new Matcher(rules));return o;
    }
    static int flags(Model m,Object owner,int n)throws Exception {
        Object map=m.owner.getDeclaredField(m.map).get(owner);
        return map instanceof Map ? ((Map<Integer,Integer>)map).getOrDefault(n,0) : ((SparseIntArray)map).get(n,0);
    }
    static void seed(Model m,Object owner,int n,int flags)throws Exception {
        Object map=m.owner.getDeclaredField(m.map).get(owner);
        if(map instanceof Map)((Map<Integer,Integer>)map).put(n,flags);else ((SparseIntArray)map).put(n,flags);
    }
    public static void main(String[] args)throws Exception {
        for(Model m:MODELS) {
            List<Object> rows=List.of(row(m,1,"A","bad"),row(m,2,"A","ordinary"),row(m,3,"B","reply",2),
                row(m,4,"C","grandchild",3),row(m,5,"B","unrelated"),row(m,6,"D","unrelated"),
                row(m,7,"E","forward",8),row(m,8,"A","ordinary"),row(m,9,"F","direct",1),
                row(m,10,"G","multiple",5,4,4,0,-1),row(m,11,"H","self",11));
            Object owner=owner(m,rows,new Item("bad",0x119));seed(m,owner,4,0x20);
            Haiagaru.hiddenReplies=false;PosterIdChainNg.applyHidden(owner);
            check(flags(m,owner,2)==0&&flags(m,owner,3)==0&&flags(m,owner,4)==0x20,"OFF unchanged");
            Haiagaru.hiddenReplies=true;PosterIdChainNg.applyHidden(owner);
            for(int n:new int[]{1,2,8})check(flags(m,owner,n)==0x4000,"same-author hidden root "+n);
            for(int n:new int[]{3,9,10})check(flags(m,owner,n)==0x1000,"reply hidden "+n);
            check(flags(m,owner,4)==0x1020,"grandchild hidden and native bits retained");
            for(int n:new int[]{5,6,7,11})check(flags(m,owner,n)==0,"unrelated/forward/self preserved "+n);
            PosterIdChainNg.applyHidden(owner);check(flags(m,owner,4)==0x1020,"idempotent");
            for(int bits:new int[]{0x118,0x111,0x19,0x11d,0x159,0x199}) {
                Object disabled=owner(m,rows,new Item("bad",bits));PosterIdChainNg.applyHidden(disabled);
                check(flags(m,disabled,3)==0,"all three enabled flags on one rule required "+bits);
            }
            Object split=owner(m,rows,new Item("bad",0x118),new Item("bad",0x11));PosterIdChainNg.applyHidden(split);
            check(flags(m,split,3)==0,"flags on separate rules do not combine");
            BaseView filtered=new BaseView(rows);filtered.add(rows.get(2));
            Object full=owner(m,filtered,new Item("B.D",0x129));PosterIdChainNg.applyHidden(full);
            check(flags(m,full,4)==0x1000,"regex and full source behind filtered view");
            Object other=owner(m,List.of(rows.get(1),rows.get(2)),new Item("bad",0x119));PosterIdChainNg.applyHidden(other);
            check(flags(m,other,3)==0,"thread/rules isolated");
            for(String id:new String[]{"","???0","DELETED","CAP_USER","OVER1000"}) {
                Object system=owner(m,List.of(row(m,1,id,"bad"),row(m,2,"B","reply",1)),new Item("bad",0x119));
                PosterIdChainNg.applyHidden(system);check(flags(m,system,2)==0,"system/missing ID excluded "+id);
            }
            Object reused=owner(m,rows,new Item("bad",0x119));PosterIdChainNg.applyHidden(reused);
            set(reused,m.rows,List.of(row(m,1,"X","ordinary"),row(m,2,"Y","reply",1)));
            if(m.map.equals("N"))set(reused,m.map,new SparseIntArray());else set(reused,m.map,new HashMap<Integer,Integer>());
            PosterIdChainNg.applyHidden(reused);check(flags(m,reused,2)==0,"rebuilt thread cannot retain previous decisions");
        }
        System.out.println("PASS "+checks+" hidden poster-ID chain checks for 191/226/242");
    }
}
