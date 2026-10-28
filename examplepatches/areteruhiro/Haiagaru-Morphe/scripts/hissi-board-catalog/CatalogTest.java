package app.morphe.extension.chmate;
import android.content.Context;import java.io.File;import java.nio.charset.StandardCharsets;import java.util.concurrent.*;import java.util.concurrent.atomic.AtomicInteger;
final class WacchoiPageCache {
 static final AtomicInteger reads=new AtomicInteger();static final CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
 static File file(Context c,String n){return new File("not-created-"+n);}
 static byte[] read(Context c,File f)throws java.io.IOException{reads.incrementAndGet();entered.countDown();try{if(!release.await(5,TimeUnit.SECONDS))throw new java.io.IOException("fixture timed out");}catch(InterruptedException e){throw new java.io.IOException(e);}return "<a href='/read.php/android/'>Android</a><a href='/read.php/software/'>Software</a>".getBytes(StandardCharsets.UTF_8);}
 static void write(Context c,File f,byte[] b){throw new AssertionError("No network or file writes allowed");}
}
final class HissiHtmlEncoding {static String decode(byte[] b){return new String(b,StandardCharsets.UTF_8);}}
public final class CatalogTest {
 static int checks;static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);checks++;}
 public static void main(String[] args)throws Exception{
  var parsed=HissiBoardCatalog.parse("<a href='/read.php/android/'>Android</a><A HREF=\"http://hissi.org/read.php/software/\"><b>Soft&amp;ware</b></A><a href='/read.php/android/'>duplicate</a><a href='/other/'>ignore</a>");
  check(parsed.size()==2,"supported board links, duplicate and unrelated links");check(parsed.get(1).label.equals("Soft&ware"),"HTML labels decoded");
  var done=new CountDownLatch(2);var errors=new java.util.concurrent.atomic.AtomicReference<Throwable>();
  HissiBoardCatalog.Callback callback=(rows,error)->{try{if(error!=null)throw error;if(rows.size()!=2)throw new AssertionError("wrong catalog");}catch(Throwable e){errors.set(e);}finally{done.countDown();}};
  Context context=new Context();HissiBoardCatalog.load(context,false,callback);check(WacchoiPageCache.entered.await(2,TimeUnit.SECONDS),"metadata loads independently on its own worker");
  HissiBoardCatalog.load(context,false,callback);check(WacchoiPageCache.reads.get()==1,"concurrent selectors share one catalog load");WacchoiPageCache.release.countDown();check(done.await(2,TimeUnit.SECONDS)&&errors.get()==null,"both selectors receive completed catalog");
  check(HissiBoardCatalog.peek().size()==2,"catalog is immediately reusable");var immediate=new java.util.concurrent.atomic.AtomicBoolean();long begin=System.nanoTime();HissiBoardCatalog.load(context,false,(rows,e)->immediate.set(e==null&&rows.size()==2));check(immediate.get()&&System.nanoTime()-begin<100000000,"warm selector receives cached entries synchronously");check(WacchoiPageCache.reads.get()==1,"warm selectors perform no additional I/O");
  try{HissiBoardCatalog.peek().clear();throw new AssertionError("mutable shared catalog");}catch(UnsupportedOperationException expected){checks++;}
  System.out.println("PASS "+checks+" catalog parsing, single-flight, cache and worker-isolation checks");
 }
}
