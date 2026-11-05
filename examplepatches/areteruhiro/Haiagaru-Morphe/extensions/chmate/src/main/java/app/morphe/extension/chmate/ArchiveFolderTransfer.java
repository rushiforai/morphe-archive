package app.morphe.extension.chmate;

import java.io.*;
import java.util.*;

/** Validate/stage native archives, then overwrite selected files with rollback copies. */
final class ArchiveFolderTransfer {
 interface Source { List<Node> children(String id)throws IOException; InputStream open(String id)throws IOException; }
 static final class Node {
  final String id,name;final boolean directory;final long size,modified,crc;
  Node(String id,String name,boolean directory,long size,long modified){this(id,name,directory,size,modified,-1);}
  Node(String id,String name,boolean directory,long size,long modified,long crc){this.id=id;this.name=name;this.directory=directory;this.size=size;this.modified=modified;this.crc=crc;}
 }
 static final class Entry { final Node node;final String path;Entry(Node n,String p){node=n;path=p;} }
 static final class Plan {
  final List<Entry> entries=new ArrayList<>();int threads;long bytes;
  final Set<String> paths=new HashSet<>();
 }
 static Plan scan(Source source,String root)throws IOException {
  Plan p=new Plan();Set<String> seen=new HashSet<>();
  List<Node> children=source.children(root);
  // ZIP tools often include an outer 2chMate/files/backup directory. Look
  // through a single-directory wrapper without dropping native board paths
  // when no archive directory exists (for example a selected board folder).
  List<Node> probe=children;
  search:for(int depth=0;depth<8;depth++){
   for(Node n:probe)if(n.directory&&n.name.equals("archive")){children=source.children(n.id);break search;}
   if(probe.size()!=1||!probe.get(0).directory)break;probe=source.children(probe.get(0).id);
  }
  walk(source,children,"",0,p,seen);if(p.threads==0)throw new IOException("DAT形式のアーカイブが見つかりません。archiveフォルダ、またはその親フォルダを選択してください。");
  return p;
 }
 private static void walk(Source s,List<Node> nodes,String prefix,int depth,Plan p,Set<String> seen)throws IOException{
  if(depth>32)throw new IOException("フォルダ階層が深すぎます");
  for(Node n:nodes){
   if(!seen.add(n.id)||seen.size()>100000)throw new IOException("フォルダの重複または項目数の上限を超えました");
   String name=n.name;if(name==null||name.isEmpty()||name.equals(".")||name.equals("..")||name.indexOf('/')>=0||name.indexOf('\\')>=0||name.indexOf('\0')>=0)throw new IOException("使用できないファイル名です");
   String path=prefix+name;
   if(!p.paths.add(path))throw new IOException("同じ保存パスが重複しています");
   if(n.directory)walk(s,s.children(n.id),path+"/",depth+1,p,seen);
   else if(name.endsWith(".dat")||name.endsWith(".idx")){
    p.entries.add(new Entry(n,path));if(name.endsWith(".dat"))p.threads++;
    if(n.size>0){if(Long.MAX_VALUE-p.bytes<n.size)throw new IOException("ファイルサイズが大きすぎます");p.bytes+=n.size;}
   }
  }
 }
 static Plan select(Plan plan,Set<String> folders){
  Plan chosen=new Plan();for(Entry e:plan.entries){String top=e.path.split("/",2)[0];if(folders.contains(top)){chosen.entries.add(e);chosen.bytes+=Math.max(0,e.node.size);if(e.path.endsWith(".dat"))chosen.threads++;}}return chosen;
 }
 /** Stage first, then replace selected files with rollback copies until commit. */
 static synchronized void restore(Source source,Plan plan,File archiveRoot)throws IOException{
  if(plan.entries.isEmpty())throw new IOException("取り込む項目が選択されていません");
  File root=archiveRoot.getCanonicalFile();if(!root.isDirectory()&&!root.mkdirs())throw new IOException("保存先を作成できません");
  File workspace=new File(root.getParentFile(),".haiagaru-restore-"+UUID.randomUUID());if(!workspace.mkdir())throw new IOException("作業領域を作成できません");
  List<File> replaced=new ArrayList<>(),createdDirs=new ArrayList<>();File backup=new File(workspace,"previous");boolean preserve=false;
  try{
   for(Entry e:plan.entries){File target=new File(root,e.path);String absolute=target.getAbsolutePath(),canonical=target.getCanonicalPath();if(!absolute.equals(canonical)||!canonical.startsWith(root.getPath()+File.separator)||(target.exists()&&!target.isFile()))throw new IOException("保存先のファイル構造が競合しています");}
   File staged=copy(source,plan,workspace,"payload");
   preserve=true;
   for(Entry e:plan.entries){
    File target=new File(root,e.path),previous=new File(backup,e.path);File parent=target.getParentFile();List<File> missing=new ArrayList<>();
    for(File d=parent;!d.exists();d=d.getParentFile())missing.add(d);Collections.reverse(missing);for(File d:missing){if(!d.mkdir())throw new IOException("保存フォルダを作成できません");createdDirs.add(d);}
    if(target.exists()){if(!previous.getParentFile().isDirectory()&&!previous.getParentFile().mkdirs())throw new IOException("上書き前のファイルを退避できません");if(!target.renameTo(previous))throw new IOException("上書き前のファイルを退避できません");}
    replaced.add(target);if(!new File(staged,e.path).renameTo(target))throw new IOException("アーカイブを反映できません");
   }
   preserve=false;
  }catch(IOException error){
   boolean restored=true;Collections.reverse(replaced);for(File target:replaced){File previous=new File(backup,target.getPath().substring(root.getPath().length()+1));if(target.exists()&&!target.delete())restored=false;if(previous.exists()&&!previous.renameTo(target))restored=false;}
   Collections.reverse(createdDirs);for(File d:createdDirs)d.delete();
   preserve=!restored;
   if(preserve)throw new IOException("復元に失敗しました。上書き前データの退避先: "+workspace,error);throw error;
  }finally{if(!preserve)remove(workspace);}
 }
 static File copy(Source source,Plan plan,File archiveRoot,String name)throws IOException {
  if(name==null||name.isEmpty()||name.equals(".")||name.equals("..")||name.indexOf('/')>=0||name.indexOf('\\')>=0)throw new IOException("保存フォルダ名が不正です");
  File root=archiveRoot.getCanonicalFile();if(!root.isDirectory()&&!root.mkdirs())throw new IOException("保存先を作成できません");
  if(root.getUsableSpace()>0&&plan.bytes>root.getUsableSpace()-8L*1024*1024)throw new IOException("アーカイブ保存先の空き容量が不足しています");
  // A sibling on the same filesystem keeps unfinished files out of both the
  // native archive browser and concurrently running archive backups.
  File stage=new File(root.getParentFile(),".haiagaru-import-"+UUID.randomUUID());if(!stage.mkdir())throw new IOException("一時フォルダを作成できません");
  boolean done=false;
  try{
   byte[] buffer=new byte[65536];
   for(Entry e:plan.entries){
    File target=new File(stage,e.path).getCanonicalFile();if(!target.getPath().startsWith(stage.getCanonicalPath()+File.separator))throw new IOException("保存領域外です");
    File parent=target.getParentFile();if(!parent.isDirectory()&&!parent.mkdirs())throw new IOException("保存先を作成できません");
    long total=0;java.util.zip.CRC32 crc=new java.util.zip.CRC32();try(InputStream input=source.open(e.node.id);FileOutputStream out=new FileOutputStream(target)){
     if(input==null)throw new IOException("元ファイルを開けません");int count;
     while((count=input.read(buffer))!=-1){if(Thread.currentThread().isInterrupted())throw new InterruptedIOException();long free=target.getUsableSpace();if(free>0&&free<8L*1024*1024)throw new IOException("保存先の空き容量が不足しています");out.write(buffer,0,count);crc.update(buffer,0,count);total+=count;}
     out.getFD().sync();
    }
    if(e.node.size>=0&&total!=e.node.size)throw new IOException("読み込み中に元ファイルが変化しました。もう一度選択してください。");
    if(e.node.crc>=0&&crc.getValue()!=e.node.crc)throw new IOException("ZIP内のファイルが破損しています");
    if(e.node.modified>0)target.setLastModified(e.node.modified);
   }
   synchronized(ArchiveFolderTransfer.class){
    File destination=new File(root,name);int suffix=1;while(destination.exists())destination=new File(root,name+" ("+(suffix++)+")");
    if(!stage.renameTo(destination))throw new IOException("アーカイブを保存先へ反映できません");done=true;return destination;
   }
  }finally{if(!done)remove(stage);}
 }
 private static void remove(File file){File[] children=file.listFiles();if(children!=null)for(File child:children)remove(child);file.delete();}
}
