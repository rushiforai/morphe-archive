package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.app.Activity;
import java.io.*;
import org.json.JSONObject;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class CaptionLongDiagnosticsTest {
  Activity a;
  @Before public void setup(){a=Robolectric.buildActivity(Activity.class).setup().get();CaptionDiagnostics.clear(a);DeepSeekConfig.saveDisplayTextDebugEnabled(a,true);}
  @After public void end(){CaptionDiagnostics.clear(a);a.finish();}
  @Test public void retainsThirtyMinutesOfSyntheticOneSecondEventsAndModelEvidence() throws Exception {
    for(int i=0;i<1800;i++){CaptionDiagnosticArchive.append(a,"history","event-"+i+";playback_ms="+(i*1000)+";"+"字幕证据".repeat(30));if(i%60==59)CaptionDiagnosticArchive.read(a,"history");}
    for(int i=0;i<120;i++)CaptionQualityTrace.record(a,"private-key-123456",i,new JSONObject().put("source","source-"+i),"translation-"+i,"private-key-123456");
    String history=CaptionDiagnosticArchive.read(a,"history"),quality=CaptionDiagnosticArchive.read(a,"quality");
    assertTrue(history.contains("event-0;"));assertTrue(history.contains("event-1799;"));
    assertTrue(quality.contains("source-0"));assertTrue(quality.contains("source-119"));assertFalse(quality.contains("private-key-123456"));
    assertTrue(CaptionDiagnostics.fullText(a).contains("event-0;"));
  }
  @Test public void rotationAndExpiryAreBounded() throws Exception {
    File dir=new File(a.getFilesDir(),"rotation-test");dir.mkdirs();
    for(int i=0;i<200;i++)CaptionDiagnosticArchive.appendNow(dir,"row-"+i+":"+"x".repeat(59900));
    File[] files=dir.listFiles();assertTrue(files.length<=CaptionDiagnosticArchive.SEGMENTS);
    long size=0;for(File f:files){size+=f.length();f.setLastModified(System.currentTimeMillis()-CaptionDiagnosticArchive.RETENTION_MS-1000);}
    assertTrue(size<=((long)CaptionDiagnosticArchive.SEGMENT_BYTES)*CaptionDiagnosticArchive.SEGMENTS);
    CaptionDiagnosticArchive.appendNow(dir,"after-expiry");assertEquals(1,dir.listFiles().length);
    for(File f:dir.listFiles())f.delete();dir.delete();
  }
  @Test public void clearRemovesBothArchiveChannels() {
    CaptionDiagnosticArchive.append(a,"history","old-history");CaptionDiagnosticArchive.append(a,"quality","old-quality");
    CaptionDiagnostics.clear(a);assertEquals("",CaptionDiagnosticArchive.read(a,"history"));assertEquals("",CaptionDiagnosticArchive.read(a,"quality"));
  }
  @Test public void detailBeyondOld260CharacterLimitSurvives() {
    CaptionDiagnostics.mark(a,"REBUILD_PRESENTED","a".repeat(400)+"end-marker");
    // N36: records are redacted and appended on the diagnostics lane; the evidence reader drains it.
    assertTrue(CaptionDiagnostics.history(a).contains("end-marker"));
  }
  @Test public void exportManifestReportsActualEngineAndBothChannels() {
    CaptionDiagnostics.mark(a,"REBUILD_TEST","test");
    String report=CaptionDiagnostics.fullText(a);
    assertTrue(report.contains("ui="+app.yydarlinker.extension.BuildConfig.CAPTION_PATCH_VERSION));
    assertTrue(report.contains("engine=" + app.yydarlinker.extension.BuildConfig.CAPTION_PATCH_VERSION));
    assertTrue(report.contains("ui=" + RebuildProtocol.VERSION + "; engine=" + RebuildProtocol.VERSION));
    assertTrue(report.contains("Engine: Event rebuild / " + RebuildProtocol.VERSION));
    assertTrue("manifest: "+report.substring(0,Math.min(600,report.length())),report.contains("history_records=1"));
    assertTrue(report.contains("quality_records=0"));
    assertTrue(report.contains("completeness=bounded_not_guaranteed"));
  }

  @Test public void olderAndroidUsesExplicitCopyFallback() throws Exception {assertNull(DeepSeekDiagnosticsPreference.saveReport(a,"test"));}
  @Test @Config(sdk=35) public void downloadsExportPublishesCompleteUtf8File() throws Exception {
    ExportProvider provider=new ExportProvider();provider.file=new File(a.getCacheDir(),"export-test.txt");
    android.content.pm.ProviderInfo info=new android.content.pm.ProviderInfo();info.authority="media";provider.attachInfo(a,info); org.robolectric.shadows.ShadowContentResolver.registerProviderInternal("media",provider);
    String report="完整字幕诊断\n".repeat(10000);
    String result=DeepSeekDiagnosticsPreference.saveReport(a,report);
    assertTrue(result.contains("Download/"));assertTrue(provider.published);assertFalse(provider.deleted);
    assertTrue(result.contains("caption-diagnostics-"+app.yydarlinker.extension.BuildConfig.CAPTION_PATCH_VERSION+"-"));
    assertEquals(report,new String(java.nio.file.Files.readAllBytes(provider.file.toPath()),java.nio.charset.StandardCharsets.UTF_8));provider.file.delete();
  }
  @Test @Config(sdk=35) public void failedExportDeletesPendingDownload() throws Exception {
    ExportProvider provider=new ExportProvider();provider.fail=true;
    android.content.pm.ProviderInfo info=new android.content.pm.ProviderInfo();info.authority="media";provider.attachInfo(a,info); org.robolectric.shadows.ShadowContentResolver.registerProviderInternal("media",provider);
    try{DeepSeekDiagnosticsPreference.saveReport(a,"test");fail("must report failure");}catch(IOException expected){}
    assertTrue(provider.deleted);assertFalse(provider.published);
  }
  public static class ExportProvider extends android.content.ContentProvider {
    File file;boolean published,deleted,fail;
    public boolean onCreate(){return true;}
    public android.net.Uri insert(android.net.Uri u,android.content.ContentValues v){assertEquals(Integer.valueOf(1),v.getAsInteger("is_pending"));return android.net.Uri.parse("content://media/external/downloads/1");}
    public android.os.ParcelFileDescriptor openFile(android.net.Uri u,String mode) throws FileNotFoundException {if(fail)throw new IllegalStateException("simulated provider failure");return android.os.ParcelFileDescriptor.open(file,android.os.ParcelFileDescriptor.MODE_CREATE|android.os.ParcelFileDescriptor.MODE_WRITE_ONLY|android.os.ParcelFileDescriptor.MODE_TRUNCATE);}
    public int update(android.net.Uri u,android.content.ContentValues v,String w,String[] args){published=v.getAsInteger("is_pending")==0;return 1;}
    public int delete(android.net.Uri u,String w,String[] args){deleted=true;return 1;}
    public String getType(android.net.Uri u){return "text/plain";}
    public android.database.Cursor query(android.net.Uri u,String[] p,String s,String[] a,String o){return null;}
  }
}
