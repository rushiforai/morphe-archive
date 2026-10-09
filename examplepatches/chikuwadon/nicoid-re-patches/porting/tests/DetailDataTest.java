package e.e.a;
import java.nio.file.*;import org.json.*;
public final class DetailDataTest {
 public static void main(String[] args)throws Exception{
 JSONObject page=new JSONObject(new String(Files.readAllBytes(Paths.get(args[0])),"UTF-8"));JSONObject data=DetailData.watchData(page);if(data.optJSONObject("series")==null||data.optJSONObject("series").optInt("id")!=480166)throw new AssertionError("Series metadata missing");
 JSONObject raw=DetailData.watchData(new JSONObject().put("data",data));if(raw.optJSONObject("series")==null)throw new AssertionError("API metadata wrapper missing");
 JSONObject tree=new JSONObject(new String(Files.readAllBytes(Paths.get(args[1])),"UTF-8"));JSONObject row=tree.getJSONObject("data").getJSONObject("children").getJSONArray("contents").getJSONObject(0);if(!DetailData.target(row).equals("https://www.nicovideo.jp/watch/sm3617161"))throw new AssertionError("Video must open in app");if(!DetailData.thumbnail(row).contains("r320x180"))throw new AssertionError("Small thumbnail missing");
 JSONObject material=new JSONObject().put("globalId","nc42").put("watchURL","https://commons.nicovideo.jp/works/nc42");if(DetailData.target(material).contains("/watch/"))throw new AssertionError("Material is not a video");JSONObject v=new JSONObject().put("id","sm42").put("thumbnail",new JSONObject().put("url","https://example.test/small").put("largeUrl","https://example.test/large"));if(!DetailData.thumbnail(v).endsWith("small"))throw new AssertionError("Use low resolution");
 System.out.println("Series, work links and thumbnail checks passed");
 }
}
