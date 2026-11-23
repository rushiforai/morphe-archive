package nl.johninnl.deezer.auto;
import static org.junit.Assert.*;
import static org.junit.Assume.assumeNotNull;
import com.google.gson.*;
import java.io.*;
import java.util.*;
import org.junit.Test;
public class NativePageGroupsTest {
 @Test public void actualNativeHomeKeepsSectionOrderAndEveryOpaqueMediaId() throws Exception {
  String path=System.getenv("DEEZER_BROWSE_CAPTURE");assumeNotNull(path);
  JsonObject capture;try(Reader in=new FileReader(path)){capture=JsonParser.parseReader(in).getAsJsonObject();}
  List<JsonObject> items=new ArrayList<>();
  for(JsonElement node:capture.getAsJsonArray("nodes")){JsonObject n=node.getAsJsonObject();if(n.has("depth")&&n.get("depth").getAsInt()==1)for(JsonElement row:n.getAsJsonArray("items"))items.add(row.getAsJsonObject());}
  assertFalse(items.isEmpty());
  List<NativePageGroups.Part<JsonObject>> groups=NativePageGroups.split(items,row->{JsonObject style=row.getAsJsonObject("style");return style.has("android.media.browse.CONTENT_STYLE_GROUP_TITLE_HINT")?style.get("android.media.browse.CONTENT_STYLE_GROUP_TITLE_HINT").getAsString():"";});
  int position=0;for(NativePageGroups.Part<JsonObject> group:groups){for(JsonObject row:group.items){assertSame(items.get(position++),row);assertTrue(row.has("id"));}}
  assertEquals(items.size(),position);assertTrue(groups.size()>1);
 }
}
