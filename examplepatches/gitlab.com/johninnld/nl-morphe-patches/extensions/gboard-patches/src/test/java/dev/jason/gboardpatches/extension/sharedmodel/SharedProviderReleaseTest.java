package dev.jason.gboardpatches.extension.sharedmodel;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.json.JSONObject;
import app.johninnl.modelhost.api.ProviderRelease;
import app.johninnl.modelhost.api.ProviderUpdates;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;
@RunWith(RobolectricTestRunner.class)
@Config(sdk=34,manifest=Config.NONE)
public class SharedProviderReleaseTest {
 private JSONObject release()throws Exception{return new JSONObject().put("packageName","app.johninnl.modelhost").put("apkSha256",new String(new char[64]).replace('\0','a')).put("signerSha256",ProviderUpdates.OFFICIAL_SIGNER_SHA256).put("versionCode",100).put("apkBytes",12345);}
 @Test public void reviewArtifactCanBeVerifiedWithoutInventingDownloadUrl()throws Exception{ProviderRelease r=new ProviderRelease(release());assertNull(r.download);assertEquals(100,r.versionCode);}
 @Test public void acceptsImmutableOfficialGitlabAsset()throws Exception{ProviderRelease r=new ProviderRelease(release().put("downloadUrl","https://gitlab.com/johninnld/local-model-host/-/releases/v0.1.0/downloads/local-model-host.apk"));assertEquals("gitlab.com",r.download.getHost());}
 @Test public void acceptsOnlyTheExactCommitOfARegistryReview()throws Exception{
  String source="0123456789abcdef0123456789abcdef01234567";
  String url="https://gitlab.com/api/v4/projects/89371837/packages/generic/local-model-host-review/"+source+"/host.apk";
  assertNotNull(new ProviderRelease(release().put("sourceCommit",source).put("downloadUrl",url)).download);
  try{new ProviderRelease(release().put("sourceCommit",source).put("downloadUrl",url.replace(source,"latest")));fail("Mutable review accepted");}catch(java.io.IOException expected){}
  try{new ProviderRelease(release().put("sourceCommit","abcdef0123456789abcdef0123456789abcdef01").put("downloadUrl",url));fail("Different commit accepted");}catch(java.io.IOException expected){}
 }
 @Test public void rejectsMutableOrUntrustedReleaseLocations()throws Exception{
  for(String url:new String[]{"http://gitlab.com/johninnld/local-model-host/-/releases/v1/downloads/host.apk","https://gitlab.com/other/local-model-host/-/releases/v1/downloads/host.apk","https://gitlab.com/johninnld/local-model-host/-/releases/latest/downloads/host.apk","https://gitlab.com@other.example/johninnld/local-model-host/-/releases/v1/downloads/host.apk","https://gitlab.com/johninnld/local-model-host/-/releases/v1/downloads/host.apk?mutable=yes"}){
   try{new ProviderRelease(release().put("downloadUrl",url));fail("Untrusted release accepted");}catch(java.io.IOException expected){}
  }
 }
 @Test public void acceptsTheCurrentHostSizeWithinTheSharedVerifierBound()throws Exception{
  assertEquals(167502289L,new ProviderRelease(release().put("apkBytes",167502289L)).apkBytes);
 }
 @Test public void rejectsInvalidIdentityAndExcessiveSize()throws Exception{
  for(JSONObject value:new JSONObject[]{release().put("apkBytes",app.johninnl.modelhost.api.VerifiedApk.MAX_APK_BYTES+1),release().put("versionCode",0),release().put("apkSha256","invalid"),release().put("packageName","other.package")}){
   try{new ProviderRelease(value);fail("Invalid identity accepted");}catch(java.io.IOException expected){}
  }
 }
}
