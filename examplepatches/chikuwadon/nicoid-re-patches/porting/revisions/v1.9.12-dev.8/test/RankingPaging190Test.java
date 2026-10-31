package e.e.a;
import org.json.*;import java.util.*;
public final class RankingPaging190Test {
 public static class Loader {public int j,f,i,g;public String a;}
 public static class Fragment {public int i0,h0;public Loader c0;public Adapter p0=new Adapter();}
 public static class Adapter{public int e;}
 static void check(boolean value,String label){if(!value)throw new AssertionError(label);}
 public static void main(String[] args)throws Exception{
  JSONArray presets=new JSONArray().put(new JSONObject().put("id","abc").put("name","Custom"));JSONArray initial=RankingCatalog190.restore(new JSONArray(),presets);
  check(initial.getJSONObject(initial.length()-2).getString("id").equals("ramuboyn")&&initial.getJSONObject(initial.length()-1).getString("id").equals("custom-abc"),"Custom ranking follows Other by default");
  JSONArray saved=new JSONArray().put(new JSONObject().put("id","custom-abc").put("visible",false)).put(new JSONObject().put("id","4eet3ca4"));JSONArray restored=RankingCatalog190.restore(saved,presets);
  check(restored.getJSONObject(0).getString("id").equals("custom-abc")&&!restored.getJSONObject(0).getBoolean("visible"),"Custom ordering and hiding retained");
  check(RankingCatalog190.restore(saved,new JSONArray()).length()==RankingRules190.GENRES.length,"Deleted presets removed from category settings");
  check(RankingCatalog190.offset(1)==0&&RankingCatalog190.offset(2)==100&&RankingCatalog190.offset(10)==900,"Ranking page boundaries");
  Loader loader=new Loader();loader.a="https://sp.nicovideo.jp/api/ranking/genre/4eet3ca4?term=hour";Fragment fragment=new Fragment();fragment.c0=loader;RankingPages190.install(fragment);check(fragment.i0==100,"Native ranking scroll gate must enable pagination");
  check(RankingPages190.offset(loader)==0&&loader.j==1,"Nonpaged first load must initialize page counter");loader.j++;check(RankingPages190.offset(loader)==100,"Next native load must fetch second page, not first");
  check(RankingPages190.isRanking("https://www.nicovideo.jp/ranking/genre/custom-abc?term=hour"),"Custom HTTPS ranking dispatch");check(!RankingPages190.isRanking("https://www.nicovideo.jp/mylist/9"),"Mylist routing unchanged");
  loader.a="https://www.nicovideo.jp/ranking/genre/custom-abc?term=hour";RankingPages190.install(fragment);check(loader.g==6&&fragment.h0==6&&fragment.p0.e==6,"Custom feed must use ranking adapter, not generic video rows");check(RankingPages190.rank(loader,0).equals("101")&&RankingPages190.rank(loader,99).equals("200"),"Second page ranks are cumulative");
  java.util.HashMap<String,Object> folder=new java.util.HashMap<>();folder.put("title","folder");folder.put("url","http://www.nicovideo.jp/mylist/123");check(MylistFollow190.folderId(folder).equals("123"),"Public folder follows native url field");folder.put("url","http://www.nicovideo.jp/user/123/video");check(MylistFollow190.folderId(folder).isEmpty(),"Uploader video entry cannot follow a mylist");
  loader.j=1;ArrayList<Object> rows=new ArrayList<>();for(int i=0;i<97;i++)rows.add(new Object());
  RankingFetch190.PAGE.set(new JSONObject().put("hasNext",true));RankingPages190.loaded(loader,rows);check(loader.f==97&&loader.i==97,"Short filtered page must continue when API has more");
  loader.j=2;RankingFetch190.PAGE.set(new JSONObject().put("hasNext",false));RankingPages190.loaded(loader,rows);check(loader.i==0,"API end must stop");
  loader.j=10;RankingFetch190.PAGE.set(new JSONObject().put("hasNext",true));RankingPages190.loaded(loader,rows);check(loader.i==0,"Stop at rank 1000");
  loader.j=1;RankingFetch190.PAGE.set(new JSONObject().put("hasNext",true));RankingPages190.loaded(loader,new ArrayList<>());check(loader.i==0,"Empty page must not loop");
  JSONArray order=new JSONArray().put(new JSONObject().put("id","a").put("name","first")).put(new JSONObject().put("id","b").put("name","middle")).put(new JSONObject().put("id","c").put("name","last"));
  JSONArray moved=RankingCatalog190.move(order,"a","c",true);check(moved.getJSONObject(2).getString("id").equals("a")&&moved.getJSONObject(0).getString("id").equals("b"),"Dragging down inserts after target");
  moved=RankingCatalog190.move(order,"c","a",false);check(moved.getJSONObject(0).getString("id").equals("c")&&moved.getJSONObject(1).getString("id").equals("a"),"Dragging up inserts before target");
  check(RankingCatalog190.move(order,"a","a",false).toString().equals(order.toString())&&RankingCatalog190.move(order,"unknown","b",true).toString().equals(order.toString()),"Cancelled/stale drag cannot drop records");
  JSONArray kept=RankingCatalog190.without(order,new HashSet<String>(Arrays.asList("a","c")));check(kept.length()==1&&kept.getJSONObject(0).getString("name").equals("middle"),"Batch deletion preserves unselected metadata");check(RankingCatalog190.without(order,Collections.<String>emptySet()).length()==3,"Empty selection preserves every ranking");check(RankingCatalog190.without(order,new HashSet<String>(Arrays.asList("a","b","c"))).length()==0,"Select-all deletion");
  System.out.println("Ranking category restoration and native paging boundaries verified");
 }
}
