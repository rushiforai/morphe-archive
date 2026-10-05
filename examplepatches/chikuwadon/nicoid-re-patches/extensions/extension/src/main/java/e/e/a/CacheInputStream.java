package e.e.a;
import java.io.*;
import android.os.ParcelFileDescriptor;
public final class CacheInputStream extends FileInputStream {
 private static class Opened{ParcelFileDescriptor descriptor;CachePackIndex.Entry entry;}
 private static final ThreadLocal<Opened> opening=new ThreadLocal<>();
 private final ParcelFileDescriptor descriptor;private long remaining=-1;
 private static FileDescriptor open(File file)throws FileNotFoundException{Opened o=new Opened();try{
  if(CacheFolders.virtual(file)&&CacheFolders.document(file,false)==null)o.entry=CachePack.entry(file);
  o.descriptor=CacheFolders.open(o.entry==null?file:CachePack.archive(file),false,false);opening.set(o);return o.descriptor.getFileDescriptor();
 }catch(IOException e){FileNotFoundException x=new FileNotFoundException(e.getMessage());x.initCause(e);throw x;}}
 public CacheInputStream(File file)throws FileNotFoundException{super(open(file));Opened o=opening.get();opening.remove();descriptor=o.descriptor;if(o.entry!=null)try{getChannel().position(o.entry.offset);remaining=o.entry.size;}catch(IOException e){try{descriptor.close();}catch(IOException ignored){}throw new FileNotFoundException("Cache container is not seekable");}}
 public CacheInputStream(String path)throws FileNotFoundException{this(new CacheFile(path));}
 @Override public int read()throws IOException{if(remaining==0)return -1;int n=super.read();if(n>=0&&remaining>0)remaining--;return n;}
 @Override public int read(byte[] b)throws IOException{return read(b,0,b.length);}
 @Override public int read(byte[] b,int off,int len)throws IOException{if(len==0)return 0;if(remaining==0)return -1;int n=super.read(b,off,remaining<0?len:(int)Math.min(len,remaining));if(n>0&&remaining>0)remaining-=n;return n;}
 @Override public long skip(long n)throws IOException{if(n<=0)return 0;long skipped=super.skip(remaining<0?n:Math.min(n,remaining));if(remaining>=0)remaining-=skipped;return skipped;}
 @Override public int available()throws IOException{return remaining<0?super.available():(int)Math.min(Integer.MAX_VALUE,remaining);}
 @Override public void close()throws IOException{try{super.close();}finally{descriptor.close();}}
}
