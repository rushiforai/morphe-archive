package e.e.a;
import java.io.*;import java.util.*;import java.util.regex.*;import android.net.Uri;import android.os.ParcelFileDescriptor;
/** Consolidate only HLS resources; metadata/comments/thumbnails remain ordinary files. */
public final class CachePack {
 private static final Pattern ID=Pattern.compile("^((?:sm|so|nm|ss)[0-9]+)(?:[._].*)?$");
 private static class Index{long size,time;Map<String,CachePackIndex.Entry> entries;}
 private static final Map<String,Index> indexes=new LinkedHashMap<String,Index>(8,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,Index> e){return size()>8;}};
 static File archive(File f){Matcher m=ID.matcher(f.getName());return m.matches()&&!f.getName().endsWith(".ncache")?new CacheFile(f.getParent(),m.group(1)+".ncache"):null;}
 static synchronized CachePackIndex.Entry entry(File f)throws IOException{File a=archive(f);if(a==null)return null;CacheFolders.Entry info=CacheFolders.stat(a);if(info==null)return null;String path=a.getAbsolutePath();Index index=indexes.get(path);if(index==null||index.size!=info.size||index.time!=info.time){index=new Index();index.size=info.size;index.time=info.time;try(ParcelFileDescriptor fd=CacheFolders.open(a,false,false);FileInputStream stream=new FileInputStream(fd.getFileDescriptor())){index.entries=CachePackIndex.read(stream.getChannel());}indexes.put(path,index);}return index.entries.get(f.getName());}
 static synchronized void invalidate(File archive){indexes.remove(archive.getAbsolutePath());}
 public static void completed(String folder,String id,long bytes){if(bytes<=0||!CacheFolders.virtual(new File(folder)))return;File root=new CacheFile(folder);File temp=new CacheFile(root,id+".ncache.part"),dest=new CacheFile(root,id+".ncache"),backup=new CacheFile(root,id+".ncache.backup");boolean installed=false,backed=false;
  try{
   File[] all=root.listFiles();if(all==null)throw new IOException("Cannot list cache");List<File> files=new ArrayList<>();for(File f:all)if(f.getName().equals(id+".m3u8")||f.getName().startsWith(id+"_asset_"))files.add(f);if(files.isEmpty())return;Collections.sort(files,(a,b)->a.getName().compareTo(b.getName()));List<CachePackIndex.Entry> index=new ArrayList<>();long offset=0;
   try(OutputStream out=new CacheOutputStream(temp)){byte[] buffer=new byte[65536];for(File f:files){long start=offset;try(InputStream in=new CacheInputStream(f)){int n;while((n=in.read(buffer))!=-1){out.write(buffer,0,n);offset+=n;}}index.add(new CachePackIndex.Entry(f.getName(),start,offset-start,f.lastModified()));}CachePackIndex.finish(out,index);}
   // Check that the provider supports the seekable reads needed during playback.
   try(ParcelFileDescriptor fd=CacheFolders.open(temp,false,false);FileInputStream in=new FileInputStream(fd.getFileDescriptor())){if(CachePackIndex.read(in.getChannel()).size()!=files.size())throw new IOException("Incomplete cache container");}
   if(dest.exists()){if(backup.exists())throw new IOException("Previous cache backup still present");if(!dest.renameTo(backup))throw new IOException("Cannot back up old cache");backed=true;}
   if(!temp.renameTo(dest))throw new IOException("Cannot finalize cache container");installed=true;invalidate(dest);CacheFolders.exportComments(folder,id);for(File f:files)if(!f.delete())android.util.Log.w("nicoid-cache","A loose cache resource was retained");if(backed)backup.delete();
  }catch(Exception e){android.util.Log.w("nicoid-cache","Cache consolidation failed; loose resources retained",e);if(!installed&&backed)backup.renameTo(dest);}
  finally{if(!installed)temp.delete();}
 }
}
