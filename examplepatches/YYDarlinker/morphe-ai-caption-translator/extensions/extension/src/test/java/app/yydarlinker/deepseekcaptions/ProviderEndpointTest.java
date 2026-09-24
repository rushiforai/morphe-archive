package app.yydarlinker.deepseekcaptions;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;import org.json.*;import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class ProviderEndpointTest {
 @Test public void bailianDedicatedAndRegionalHostsAreRecognizedWithoutSpoofing(){
  for(String h:new String[]{"dashscope.aliyuncs.com","dashscope-intl.aliyuncs.com","dashscope-us.aliyuncs.com","llm-test.cn-beijing.maas.aliyuncs.com"})assertTrue(h,ProviderEndpoint.bailian(h));
  for(String h:new String[]{"evilmaas.aliyuncs.com","maas.aliyuncs.com.evil.test","api.deepseek.com.evil.test"})assertFalse(h,ProviderEndpoint.bailian(h));
 }
 @Test public void knownBareHostsResolveToChatAndPreserveFullEndpoints(){
  String[][] cases={{"https://coding.dashscope.aliyuncs.com","/v1"},{"https://api.openai.com","/v1"},{"https://api.deepseek.com","/v1"},{"https://dashscope-intl.aliyuncs.com","/compatible-mode/v1"},{"https://llm-test.cn-beijing.maas.aliyuncs.com","/compatible-mode/v1"},{"https://api.groq.com","/openai/v1"},{"https://openrouter.ai","/api/v1"},{"https://generativelanguage.googleapis.com","/v1beta/openai"},{"https://open.bigmodel.cn","/api/paas/v4"},{"https://ark.cn-beijing.volces.com","/api/v3"},{"https://api.fireworks.ai","/inference/v1"}};
  for(String[] c:cases){String expected=c[0]+c[1]+"/chat/completions";assertEquals(expected,ProviderEndpoint.chat(c[0]));assertEquals(expected,ProviderEndpoint.chat(expected));assertEquals(c[0]+c[1]+"/models",ProviderEndpoint.models(expected));}
 }
 @Test public void azureDeploymentQueryAndCustomGatewayPathArePreserved(){
  String url="https://example.openai.azure.com/openai/deployments/my-model/chat/completions?api-version=2024-10-21";
  assertEquals(url,ProviderEndpoint.chat(url));assertEquals("https://gateway.example/prefix/v1/chat/completions?version=1",ProviderEndpoint.chat("https://gateway.example/prefix/v1/?version=1"));
 }
 @Test public void unsafeAndNativeProtocolAddressesAreRejected(){
  for(String url:new String[]{"file:///etc/passwd","https://key:secret@example.com/v1","https://example.com/v1#secret","https://api.anthropic.com/v1/messages","https://generativelanguage.googleapis.com/v1beta/models/x:generateContent"}){
   try{ProviderEndpoint.chat(url);fail(url);}catch(IllegalArgumentException expected){}
  }
 }
 @Test public void bailianRequestDisablesThinkingButUnknownGatewayStaysPortable()throws Exception{
  for(String host:new String[]{"dashscope.aliyuncs.com","dashscope-intl.aliyuncs.com","llm-test.cn-beijing.maas.aliyuncs.com"}){
   JSONObject r=ProviderRequestPolicy.request(new DeepSeekConfig.Snapshot(true,"https://"+host+"/compatible-mode/v1","qwen-test","",16,70,"test"),"",new JSONObject(),512);
   assertFalse(r.getBoolean("enable_thinking"));assertFalse(r.getBoolean("stream"));
  }
  JSONObject r=ProviderRequestPolicy.request(new DeepSeekConfig.Snapshot(true,"https://gateway.example/v1","deepseek-test","",16,70,"test"),"",new JSONObject(),512);
  assertFalse(r.has("thinking"));assertFalse(r.has("enable_thinking"));
 }
 @Test public void officialHeadersAndQueriesDoNotMoveKeysToWrongAuthFields()throws Exception{
  okhttp3.mockwebserver.MockWebServer server=new okhttp3.mockwebserver.MockWebServer();server.start();
  try{
   for(boolean azure:new boolean[]{true,false}){
    server.enqueue(new okhttp3.mockwebserver.MockResponse().setBody("{}"));
    java.net.HttpURLConnection c=(java.net.HttpURLConnection)server.url("/").url().openConnection();
    ProviderEndpoint.authenticate(c,azure?"https://demo.openai.azure.com/openai/deployments/x/chat/completions?api-version=2024-10-21":"https://proxy.example/v1","FAKE");
    assertEquals(200,c.getResponseCode());c.disconnect();
    okhttp3.mockwebserver.RecordedRequest sent=server.takeRequest();
    assertEquals(azure?"FAKE":null,sent.getHeader("api-key"));assertEquals(azure?null:"Bearer FAKE",sent.getHeader("Authorization"));
   }
  }finally{server.shutdown();}
 }
 @Test public void jsonFallbackDoesNotReenableBailianThinking()throws Exception{
  JSONObject r=ProviderRequestPolicy.request(new DeepSeekConfig.Snapshot(true,"https://llm-test.cn-beijing.maas.aliyuncs.com/compatible-mode/v1","deepseek-v4.1-flash","",16,70,"test"),"",new JSONObject(),512);
  assertTrue(ProviderRequestPolicy.removeOptional(r,"response_format_unsupported"));assertFalse(r.has("response_format"));assertFalse(r.getBoolean("enable_thinking"));assertEquals(512,r.getInt("max_tokens"));
 }
 @Test public void officialOpenAiUsesCompletionBudgetAndAnthropicUsesJsonPrompt()throws Exception{
  JSONObject a=ProviderRequestPolicy.request(new DeepSeekConfig.Snapshot(true,"https://api.openai.com/v1","gpt-test","",16,70,"test"),"",new JSONObject(),512);
  assertFalse(a.has("max_tokens"));assertEquals(512,a.getInt("max_completion_tokens"));
  JSONObject b=ProviderRequestPolicy.request(new DeepSeekConfig.Snapshot(true,"https://api.anthropic.com/v1","claude-test","",16,70,"test"),"",new JSONObject(),512);
  assertFalse(b.has("response_format"));assertTrue(b.getJSONArray("messages").toString().contains("JSON"));
 }

}
