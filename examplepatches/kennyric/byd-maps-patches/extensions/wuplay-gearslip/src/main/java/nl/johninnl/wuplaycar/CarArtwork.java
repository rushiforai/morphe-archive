package nl.johninnl.wuplaycar;

import android.content.*;
import android.graphics.*;
import android.net.Uri;
import androidx.car.app.model.CarIcon;
import androidx.core.graphics.drawable.IconCompat;
import java.io.*;
import java.net.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.*;

/** Read-only, lazy thumbnails: bounded network, decode, metadata and disk footprint. */
final class CarArtwork implements AutoCloseable {
 static final Map<String,String[]> entries=Collections.synchronizedMap(new LinkedHashMap<String,String[]>(512,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,String[]> e){return size()>512;}});
 private static final Semaphore downloads=new Semaphore(2);
 private final Context context;private final String session=UUID.randomUUID().toString();private boolean closed;private int revision;private final Set<String> keys=ConcurrentHashMap.newKeySet();
 CarArtwork(Context context){this.context=context.getApplicationContext();}
 void refresh(){revision++;}
 CarIcon icon(String url,String label){
  try{
   String key=hex(MessageDigest.getInstance("SHA-256").digest((session+"/"+revision+"/"+url+"/"+label).getBytes("UTF-8")));
   if(!closed){entries.put(key,new String[]{url,label});keys.add(key);}
   Uri uri=Uri.parse("content://"+context.getPackageName()+".morphe.car.art/"+key);
   for(String host:HostPackages.packageNames())try{context.grantUriPermission(host,uri,Intent.FLAG_GRANT_READ_URI_PERMISSION);}catch(RuntimeException ignored){}
   return new CarIcon.Builder(ArtworkIcons.create(uri)).build();
  }catch(Exception e){throw new IllegalStateException("Car artwork unavailable",e);}
 }
 static File file(Context context,String key)throws IOException {
  if(key==null||!key.matches("[a-f0-9]{64}"))throw new FileNotFoundException("Invalid artwork key");
  File folder=new File(context.getCacheDir(),"morphe-car-art");if(!folder.isDirectory()&&!folder.mkdirs())throw new IOException("Artwork cache unavailable");
  File output=new File(folder,key+".jpg");if(output.isFile()){output.setLastModified(System.currentTimeMillis());return output;}
  String[] entry=entries.get(key);if(entry==null)throw new FileNotFoundException("Artwork expired");
  boolean acquired=false;
  try{
   acquired=downloads.tryAcquire(5,TimeUnit.SECONDS);if(!acquired)return placeholder(folder,key,entry[1]);
   if(output.isFile())return output;
   Bitmap image=fetch(entry[0]);if(image==null)return placeholder(folder,key,entry[1]);
   float scale=Math.min(1f,240f/Math.max(image.getWidth(),image.getHeight()));
   Bitmap tile=Bitmap.createScaledBitmap(image,Math.max(1,Math.round(image.getWidth()*scale)),Math.max(1,Math.round(image.getHeight()*scale)),true);
   if(tile!=image)image.recycle();
   File temporary=File.createTempFile("thumbnail-",".tmp",folder);
   try(FileOutputStream stream=new FileOutputStream(temporary)){tile.compress(Bitmap.CompressFormat.JPEG,88,stream);}finally{tile.recycle();}
   if(!temporary.renameTo(output)){temporary.delete();throw new IOException("Artwork write failed");}
   trim(folder,output);return output;
  }catch(InterruptedException e){Thread.currentThread().interrupt();throw new IOException("Artwork cancelled",e);}finally{if(acquired)downloads.release();}
 }
 private static File placeholder(File folder,String key,String label)throws IOException {
  File output=new File(folder,key+".fallback.jpg");if(output.isFile())return output;
  Bitmap tile=Bitmap.createBitmap(240,240,Bitmap.Config.ARGB_8888);Canvas canvas=new Canvas(tile);Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
  paint.setShader(new LinearGradient(0,0,240,240,0xff1c283a,0xff0a101a,Shader.TileMode.CLAMP));canvas.drawRect(0,0,240,240,paint);paint.setShader(null);
  paint.setColor(0xff8bbce0);paint.setTextAlign(Paint.Align.CENTER);paint.setTextSize(52);paint.setTypeface(Typeface.create("sans-serif-medium",Typeface.NORMAL));String text=label.trim();canvas.drawText(text.isEmpty()?"W":text.substring(0,Math.min(2,text.length())).toUpperCase(Locale.ROOT),120,138,paint);
  File temporary=File.createTempFile("placeholder-",".tmp",folder);try(FileOutputStream stream=new FileOutputStream(temporary)){tile.compress(Bitmap.CompressFormat.JPEG,88,stream);}finally{tile.recycle();}
  if(!temporary.renameTo(output)){temporary.delete();if(!output.isFile())throw new IOException("Placeholder unavailable");}trim(folder,output);return output;
 }
 private static int remaining(long deadline)throws java.io.InterruptedIOException {long millis=TimeUnit.NANOSECONDS.toMillis(deadline-System.nanoTime());if(millis<=0)throw new java.io.InterruptedIOException("Artwork deadline");return (int)Math.min(2000,millis);}
 private static Bitmap fetch(String url){
  if(!CarStreamPolicy.direct(url))return null;HttpURLConnection connection=null;long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(6);
  try{
   for(int redirects=0;redirects<=3;redirects++){
    connection=(HttpURLConnection)new URL(url).openConnection();connection.setConnectTimeout(remaining(deadline));connection.setReadTimeout(remaining(deadline));connection.setInstanceFollowRedirects(false);
    int status=connection.getResponseCode();
    if(status>=300&&status<400){String location=connection.getHeaderField("Location");if(location==null||redirects==3)return null;url=new URL(new URL(url),location).toString();connection.disconnect();connection=null;if(!CarStreamPolicy.direct(url))return null;continue;}
    if(status!=200)return null;break;
   }
   if(connection==null)return null;ByteArrayOutputStream bytes=new ByteArrayOutputStream();
   try(InputStream in=connection.getInputStream()){byte[] buffer=new byte[8192];int n;while(true){connection.setReadTimeout(remaining(deadline));n=in.read(buffer);if(n==-1)break;if(Thread.currentThread().isInterrupted()||bytes.size()+n>3*1024*1024)return null;bytes.write(buffer,0,n);}}
   byte[] encoded=bytes.toByteArray();BitmapFactory.Options options=new BitmapFactory.Options();options.inJustDecodeBounds=true;BitmapFactory.decodeByteArray(encoded,0,encoded.length,options);
   if(options.outWidth<=0||options.outHeight<=0||options.outWidth>20000||options.outHeight>20000)return null;
   options.inSampleSize=1;while(Math.max(options.outWidth,options.outHeight)/options.inSampleSize>480)options.inSampleSize*=2;options.inJustDecodeBounds=false;return BitmapFactory.decodeByteArray(encoded,0,encoded.length,options);
  }catch(IOException|RuntimeException e){return null;}finally{if(connection!=null)connection.disconnect();}
 }
 private static void trim(File folder,File keep){File[] files=folder.listFiles((dir,name)->name.endsWith(".jpg"));if(files==null)return;Arrays.sort(files,Comparator.comparingLong(File::lastModified));long size=0;for(File file:files)size+=file.length();for(File file:files)if(size>32*1024*1024&&!file.equals(keep)){long length=file.length();if(file.delete())size-=length;}}
 private static String hex(byte[] bytes){StringBuilder out=new StringBuilder();for(byte b:bytes)out.append(String.format(Locale.ROOT,"%02x",b&255));return out.toString();}
 @Override public void close(){closed=true;for(String key:keys){entries.remove(key);context.revokeUriPermission(Uri.parse("content://"+context.getPackageName()+".morphe.car.art/"+key),Intent.FLAG_GRANT_READ_URI_PERMISSION);}keys.clear();}
}
