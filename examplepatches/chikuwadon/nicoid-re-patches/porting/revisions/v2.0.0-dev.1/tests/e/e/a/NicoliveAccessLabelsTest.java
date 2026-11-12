package e.e.a;

import org.junit.Test;
import org.json.JSONObject;
import static org.junit.Assert.*;

/** User-facing access labels must never be inferred from missing API fields. */
public class NicoliveAccessLabelsTest {
 @Test public void onlyExplicitPermissionMetadataProducesLabels() throws Exception {
  assertEquals("",NicoliveData.accessLabel(new JSONObject()));
  assertEquals("有料",NicoliveData.accessLabel(new JSONObject().put("isPayProgram",true)));
  assertEquals("会員無料",NicoliveData.accessLabel(new JSONObject().put("isMemberOnly",true)));
  assertEquals("一部無料",NicoliveData.accessLabel(new JSONObject().put("isPartialFree",true)));
  assertEquals("一部無料",NicoliveData.accessLabel(new JSONObject().put("isPartialFree",true).put("isPayProgram",true)));
  assertEquals("",NicoliveData.accessLabel(new JSONObject().put("isPayProgram",false)));
 }
 @Test public void sourceListAndStoredHistoryKeepAccessMetadata() throws Exception {
  JSONObject source=new JSONObject()
      .put("nicoliveProgramId","lv1234")
      .put("title","検証用の生放送")
      .put("status","ON_AIR")
      .put("isMemberOnly",true);
  NicoliveData.Program p=NicoliveData.Program.listing(source);
  assertNotNull(p);
  assertEquals("会員無料",p.accessLabel());
  assertEquals("会員無料",NicoliveData.Program.listing(p.stored()).accessLabel());
 }
 @Test public void noPermissionRequiresExplicitWatchResult() {
  NicoliveData.Program p=new NicoliveData.Program("lv1234");
  assertTrue("Unknown entitlement remains playable until server denies",p.canWatch);
  p.canWatch=false;
  assertFalse(p.canWatch);
 }
}
