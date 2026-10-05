package e.e.a;
import java.io.*;import java.nio.*;import java.nio.channels.*;import java.util.*;
/** Seekable container: original HLS bytes plus a checked offset index, no recompression. */
public final class CachePackIndex {
 private static final byte[] MAGIC={'N','I','C','O','I','D','P','1'};
 public static class Entry{public String name;public long offset,size,time;public Entry(String n,long o,long s,long t){name=n;offset=o;size=s;time=t;}}
 public static void finish(OutputStream stream,List<Entry> entries)throws IOException{
  ByteArrayOutputStream buffer=new ByteArrayOutputStream();DataOutputStream index=new DataOutputStream(buffer);index.writeInt(entries.size());for(Entry e:entries){index.writeUTF(e.name);index.writeLong(e.offset);index.writeLong(e.size);index.writeLong(e.time);}index.flush();byte[] bytes=buffer.toByteArray();if(bytes.length>2*1024*1024)throw new IOException("Cache index too large");DataOutputStream out=new DataOutputStream(stream);out.write(bytes);out.write(MAGIC);out.writeInt(bytes.length);out.flush();
 }
 public static Map<String,Entry> read(FileChannel c)throws IOException{
  long size=c.size();if(size<12)throw new IOException("Incomplete cache container");ByteBuffer footer=ByteBuffer.allocate(12);c.position(size-12);full(c,footer);byte[] magic=new byte[8];footer.flip();footer.get(magic);int length=footer.getInt();if(!Arrays.equals(magic,MAGIC)||length<4||length>2*1024*1024||length>size-12)throw new IOException("Invalid cache index");long end=size-12-length;ByteBuffer bytes=ByteBuffer.allocate(length);c.position(end);full(c,bytes);DataInputStream in=new DataInputStream(new ByteArrayInputStream(bytes.array()));int count=in.readInt();if(count<0||count>10000)throw new IOException("Invalid entry count");Map<String,Entry> entries=new LinkedHashMap<>();long previous=0;for(int i=0;i<count;i++){String name=in.readUTF();long start=in.readLong(),n=in.readLong(),time=in.readLong();if(name.isEmpty()||name.contains("/")||name.contains("\\")||name.equals("..")||start<previous||n<0||start>end||n>end-start||entries.containsKey(name))throw new IOException("Invalid cache entry");entries.put(name,new Entry(name,start,n,time));previous=start+n;}if(in.available()!=0)throw new IOException("Trailing cache index data");return entries;
 }
 private static void full(FileChannel c,ByteBuffer b)throws IOException{while(b.hasRemaining())if(c.read(b)<0)throw new EOFException();}
}
