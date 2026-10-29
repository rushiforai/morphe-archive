package e.e.a;
import java.io.*;import java.security.MessageDigest;import java.util.*;
/** Bounded encoded thumbnails; reconcile periodically, account for writes incrementally. */
final class ImageDiskCache {
 private static final long AGE=7L*24*60*60*1000,LIMIT=32L*1024*1024,RECONCILE_NANOS=300_000_000_000L;
 private final File directory;
 private static final class Entry {final File file;final long size,time;Entry(File f){file=f;size=f.length();time=f.lastModified();}}
 private final Map<String,Entry> known=new HashMap<>();
 private final TreeSet<Entry> oldest=new TreeSet<>((a,b)->{int n=Long.compare(a.time,b.time);return n==0?a.file.getName().compareTo(b.file.getName()):n;});
 private static final long TEMP_AGE=24L*60*60*1000;
 private boolean initialized;private long total,reconciled;int reconciliations;
 ImageDiskCache(File parent){directory=new File(parent,"nicoid-thumbnails");}
 private File file(String url)throws IOException{try{byte[] digest=MessageDigest.getInstance("SHA-256").digest(url.getBytes("UTF-8"));char[] hex="0123456789abcdef".toCharArray(),name=new char[digest.length*2];for(int n=0;n<digest.length;n++){int b=digest[n]&255;name[n*2]=hex[b>>>4];name[n*2+1]=hex[b&15];}return new File(directory,new String(name)+".img");}catch(java.security.NoSuchAlgorithmException e){throw new IOException(e);}}
 private void forget(File f){Entry old=known.remove(f.getName());if(old!=null){oldest.remove(old);total-=old.size;}}
 private void remember(File f){forget(f);Entry e=new Entry(f);known.put(f.getName(),e);oldest.add(e);total+=e.size;}
 private void reconcile(){long now=System.nanoTime();if(initialized&&now-reconciled<RECONCILE_NANOS)return;known.clear();oldest.clear();total=0;File[] files=directory.listFiles();long wall=System.currentTimeMillis();if(files!=null)for(File f:files){String name=f.getName();if(name.endsWith(".img"))remember(f);else if(name.startsWith("image-")&&name.endsWith(".tmp")&&wall-f.lastModified()>TEMP_AGE)f.delete();}initialized=true;reconciled=now;reconciliations++;}
 synchronized byte[] get(String url)throws IOException{File f=file(url);if(!f.isFile()){forget(f);return null;}long age=System.currentTimeMillis()-f.lastModified();if(age<0||age>AGE||f.length()>8*1024*1024){if(f.delete())forget(f);return null;}try(InputStream in=new FileInputStream(f);ByteArrayOutputStream body=new ByteArrayOutputStream()){byte[] b=new byte[8192];int n;while((n=in.read(b))!=-1){if(body.size()+n>8*1024*1024){if(f.delete())forget(f);return null;}body.write(b,0,n);}return body.toByteArray();}}
 synchronized void remove(String url)throws IOException{File f=file(url);if(f.delete()||!f.exists())forget(f);}
 synchronized void put(String url,byte[] data)throws IOException{
  if(data.length==0||data.length>8*1024*1024)return;
  if(!directory.isDirectory()&&!directory.mkdirs())throw new IOException("Thumbnail cache unavailable");reconcile();
  File target=file(url),temporary=File.createTempFile("image-",".tmp",directory);
  try{try(OutputStream out=new FileOutputStream(temporary)){out.write(data);}if(!temporary.renameTo(target))throw new IOException("Thumbnail cache write failed");remember(target);trim();if(total>LIMIT){if(target.delete())forget(target);throw new IOException("Thumbnail cache limit unavailable");}}
  finally{temporary.delete();}
 }
 private void trim(){long now=System.currentTimeMillis();for(Iterator<Entry> it=oldest.iterator();it.hasNext();){Entry e=it.next();if(total<=LIMIT&&now-e.time<=AGE&&now>=e.time)break;if(e.file.delete()||!e.file.exists()){it.remove();known.remove(e.file.getName());total-=e.size;}}}
}
