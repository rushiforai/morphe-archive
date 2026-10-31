package e.e.a;
public final class PolicyTest {
 static int count;static void check(boolean b){count++;if(!b)throw new AssertionError("case "+count);}
 public static void main(String[] args){
  check(TabUiRules244.reveal(100,200,120,220)==100);
  check(TabUiRules244.reveal(100,200,80,150)==80);
  check(TabUiRules244.reveal(100,200,280,350)==150);
  check(TabUiRules244.reveal(100,0,0,200)==100);
  check(TabUiRules244.reveal(0,300,0,50)==0);
  check(TabUiRules244.related(13,""));check(TabUiRules244.related(14,""));check(TabUiRules244.related(0,"https://flapi.nicovideo.jp/api/getrelation?video=sm9"));
  check(!TabUiRules244.related(0,"https://www.nicovideo.jp/search/video?keyword=x"));check(!TabUiRules244.related(9,"deflist"));
  SavedTabs227 d=new SavedTabs227("{}");for(int i=0;i<64;i++){SavedTabs227.Tab t=new SavedTabs227.Tab();t.label="tab"+i;d.add(t);}String selected=d.selected;check(d.tabs.size()==64);try{d.add(new SavedTabs227.Tab());throw new AssertionError();}catch(IllegalStateException ok){count++;}
  SavedTabs227 restored=new SavedTabs227(d.save());check(restored.tabs.size()==64);check(restored.selected.equals(selected));String first=restored.tabs.get(0).id;restored.remove(first);check(restored.selected.equals(selected));restored.remove(selected);check(restored.tabs.size()==62);check(restored.find(restored.selected)!=null);
  SavedTabs227 legacy=new SavedTabs227("{\"tabs\":[{\"id\":\"related\",\"type\":13,\"screen\":\"list\",\"kind\":3},{\"id\":\"search\",\"kind\":0,\"screen\":\"list\",\"label\":\"query\"}],\"selected\":\"related\"}");check(legacy.tabs.size()==1);check(legacy.selected.equals("search"));check(legacy.tabs.get(0).label.equals("query"));
  System.out.println("Policy and persistence: "+count+" checks passed");
 }
}
