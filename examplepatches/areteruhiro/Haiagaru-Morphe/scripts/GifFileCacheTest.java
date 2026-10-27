package app.morphe.extension.chmate;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
public final class GifFileCacheTest {
 static int checks;
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);checks++;}
 static byte[] gif(){byte[] data=new byte[32];System.arraycopy("GIF89a".getBytes(),0,data,0,6);data[6]=data[8]=1;data[31]=59;return data;}
 static void fail(Callable<?> op,String label)throws Exception{try{op.call();throw new AssertionError(label);}catch(IOException expected){checks++;}}
 public static void main(String[] args)throws Exception{
  Path root=Files.createTempDirectory("haiagaru-gif-cache-test");File dir=root.toFile();AtomicInteger hits=new AtomicInteger();
  GifFileCache.Downloader download=(out,cancel)->{hits.incrementAndGet();out.write(gif());};
  File first=GifFileCache.get(dir,"https://example.org/a.gif",128,false,()->false,download);
  check(first.length()==32&&hits.get()==1,"cold fetch");
  check(GifFileCache.get(dir,"https://example.org/a.gif",128,false,()->false,download).equals(first)&&hits.get()==1,"warm cache avoids transfer");
  GifFileCache.get(dir,"https://example.org/a.gif",128,true,()->false,download);check(hits.get()==2,"explicit reload fetches again");
  fail(()->GifFileCache.get(dir,"https://example.org/a.gif",128,true,()->false,(out,c)->{out.write(gif());throw new IOException("interrupted");}),"failed reload");
  check(GifFileCache.valid(first),"failed reload preserves old file");
  fail(()->GifFileCache.get(dir,"https://example.org/b.gif",16,false,()->false,download),"byte limit");
  fail(()->GifFileCache.get(dir,"https://example.org/c.gif",128,false,()->true,download),"cancel before start");
  AtomicBoolean cancel=new AtomicBoolean();
  fail(()->GifFileCache.get(dir,"https://example.org/d.gif",128,false,cancel::get,(out,c)->{out.write(gif());cancel.set(true);}),"cancel after transfer");
  check(Arrays.stream(Objects.requireNonNull(dir.list())).noneMatch(n->n.endsWith(".part")),"no partial files after cancellation/error");
  fail(()->GifFileCache.get(dir,"https://example.org/e.gif",128,false,()->false,(out,c)->out.write("not a GIF at all".getBytes())),"invalid signature");
  byte[] truncated=gif();truncated[31]=0;
  fail(()->GifFileCache.get(dir,"https://example.org/f.gif",128,false,()->false,(out,c)->out.write(truncated)),"truncated GIF rejected");
  first.setLastModified(System.currentTimeMillis()-GifFileCache.MAX_AGE-10000);int before=hits.get();
  GifFileCache.get(dir,"https://example.org/a.gif",128,false,()->false,download);check(hits.get()==before+1,"expired entry re-fetched");
  ExecutorService pool=Executors.newFixedThreadPool(2);AtomicInteger parallel=new AtomicInteger();
  Callable<File> task=()->GifFileCache.get(dir,"https://example.org/parallel.gif",128,false,()->false,(out,c)->{
   parallel.incrementAndGet();try{Thread.sleep(100);}catch(InterruptedException e){throw new InterruptedIOException();}out.write(gif());});
  Future<File> left=pool.submit(task),right=pool.submit(task);check(left.get().equals(right.get())&&parallel.get()==1,"same-URL concurrent transfer coalesces");pool.shutdown();
  // Reproduce the old 16-way lock collision with two independent media URLs.
  Map<Integer,String> slots=new HashMap<>();String slowUrl=null,fastUrl=null;
  for(int i=0;i<100;i++){
   String url="https://example.org/queue-"+i+".gif";
   String key=java.util.HexFormat.of().formatHex(java.security.MessageDigest.getInstance("SHA-256").digest(url.getBytes(java.nio.charset.StandardCharsets.UTF_8)));
   int slot=(key.hashCode()&0x7fffffff)%16;
   if(slots.containsKey(slot)){slowUrl=slots.get(slot);fastUrl=url;break;}slots.put(slot,url);
  }
  final String slow=slowUrl,fast=fastUrl;CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
  ExecutorService queues=Executors.newFixedThreadPool(3);AtomicBoolean stop=new AtomicBoolean();
  Future<File> held=queues.submit(()->GifFileCache.get(dir,slow,128,false,()->false,(out,c)->{
   entered.countDown();try{release.await();}catch(InterruptedException error){throw new InterruptedIOException();}out.write(gif());}));
  try{
   check(entered.await(2,TimeUnit.SECONDS),"slow transfer entered");
   Future<File> independent=queues.submit(()->GifFileCache.get(dir,fast,128,false,()->false,download));
   check(independent.get(1,TimeUnit.SECONDS).exists(),"unrelated colliding URL does not wait for slow transfer");
   Future<Boolean> waiting=queues.submit(()->{try{GifFileCache.get(dir,slow,128,false,stop::get,download);return false;}catch(InterruptedIOException cancelled){return true;}});
   stop.set(true);check(waiting.get(1,TimeUnit.SECONDS),"same-URL waiter can cancel before original download completes");
  }finally{release.countDown();held.get(2,TimeUnit.SECONDS);queues.shutdownNow();}
  GifFileCache.invalidate(dir,"https://example.org/a.gif",first);check(!first.exists(),"decoder failure invalidates actual .gif cache file");
  first=GifFileCache.get(dir,"https://example.org/a.gif",128,false,()->false,download);
  File unrelated=new File(dir,"manual.gif");Files.write(unrelated.toPath(),gif());
  File stale=new File(dir,"0".repeat(64)+".gif");Files.write(stale.toPath(),gif());stale.setLastModified(1);
  GifFileCache.prune(dir,first,System.currentTimeMillis());check(!stale.exists()&&unrelated.exists(),"prune only owned cache entries");
  File huge=new File(dir,"1".repeat(64)+".gif");try(RandomAccessFile f=new RandomAccessFile(huge,"rw")){f.setLength(GifFileCache.MAX_TOTAL+1);}huge.setLastModified(2);
  GifFileCache.prune(dir,first,System.currentTimeMillis());check(!huge.exists()&&first.exists(),"disk bound preserves active file");
  try(var files=Files.walk(root)){for(Path p:files.sorted(Comparator.reverseOrder()).toList())Files.delete(p);}
  System.out.println("PASS "+checks+" cache transfer/cancellation/concurrency/bounds checks");
 }
}
