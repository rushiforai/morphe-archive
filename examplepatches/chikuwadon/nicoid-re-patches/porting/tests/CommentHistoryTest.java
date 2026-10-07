package e.e.a;
import org.json.*;
public class CommentHistoryTest {
 static class Owner {public Object modernWatch=new Object();public String d="sm1";}
 static String response(int from,int to,int seconds)throws Exception{JSONArray comments=new JSONArray();for(int n=from;n<=to;n++)comments.put(new JSONObject().put("no",n).put("body","comment "+n).put("postedAt",String.format("2026-10-01T00:00:%02dZ",seconds+n)));return new JSONObject().put("data",new JSONObject().put("threads",new JSONArray().put(new JSONObject().put("id","1").put("fork","main").put("comments",comments)))).toString();}
 static String body()throws Exception{return new JSONObject().put("params",new JSONObject().put("language","ja-jp").put("targets",new JSONArray().put(new JSONObject().put("id","1").put("fork","main")))).put("threadKey","key").put("additionals",new JSONObject()).toString();}
 static void check(boolean b,String label){if(!b)throw new AssertionError(label);}
 public static void main(String[] args)throws Exception{
  Owner owner=new Owner();ModernPlayback.pages=new String[]{response(1,3,10),response(1,3,10)};ModernPlayback.index=0;ModernComments.applied=null;
  new CommentHistory.Job(owner,"https://example.invalid",body(),response(3,5,20),7).run();
  check(ModernComments.applied!=null,"apply merged data");JSONArray cs=new JSONObject(ModernComments.applied).getJSONObject("data").getJSONArray("threads").getJSONObject(0).getJSONArray("comments");check(cs.length()==5,"deduplicate overlap");check(ModernPlayback.index==2,"stop repeated response");
  ModernPlayback.index=0;ModernPlayback.pages=new String[]{response(1,3,10)};ModernComments.applied=null;new CommentHistory.Job(owner,"https://example.invalid",body(),response(3,5,20),4).run();check(new JSONObject(ModernComments.applied).getJSONObject("data").getJSONArray("threads").getJSONObject(0).getJSONArray("comments").length()==4,"stop at target");
  ModernPlayback.index=0;ModernPlayback.pages=new String[]{response(1,3,10),null};ModernComments.applied=null;new CommentHistory.Job(owner,"https://example.invalid",body(),response(3,5,20),9).run();check(ModernComments.applied!=null,"keep successful pages on error");
  ModernPlayback.index=0;CommentHistory.Job job=new CommentHistory.Job(owner,"https://example.invalid",body(),response(3,5,20),9);owner.modernWatch=new Object();job.run();check(ModernPlayback.index==0,"cancel obsolete video");
  System.out.println("History merge, target, repeat, error and cancellation checks passed");
 }
}
class ModernPlayback {static String[] pages;static int index;public static String request(CommentHistoryTest.Owner owner,String url,String body,String token)throws Exception{JSONObject r=new JSONObject(body);if(!r.getJSONObject("additionals").has("when"))throw new AssertionError("history cursor");if(r.getJSONObject("params").getJSONArray("targets").length()!=1)throw new AssertionError("target isolation");String page=pages[index++];if(page==null)throw new Exception("network failure");return page;}}
class ModernComments {static String applied;public static void load(CommentHistoryTest.Owner owner)throws Exception{applied=CommentHistory.initial(owner,"unused","unused",null);CommentHistory.extend(owner);}}
