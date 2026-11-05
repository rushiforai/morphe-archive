package app.morphe.extension.chmate;

import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Native archive ZIP transport; paths are data, never filesystem extraction paths. */
final class ArchiveZipSource implements ArchiveFolderTransfer.Source,Closeable {
 private final ZipFile zip;
 private final Map<String,LinkedHashMap<String,ArchiveFolderTransfer.Node>> directories=new LinkedHashMap<>();
 ArchiveZipSource(File file)throws IOException{
  zip=new ZipFile(file);boolean ready=false;
  try{
   directories.put("",new LinkedHashMap<>());Set<String> explicit=new HashSet<>();Enumeration<? extends ZipEntry> entries=zip.entries();int count=0;
   while(entries.hasMoreElements()){
    ZipEntry entry=entries.nextElement();if(++count>100000)throw new IOException("ZIP内の項目数が多すぎます");
    String path=entry.getName();if(path.endsWith("/"))path=path.substring(0,path.length()-1);
    if(path.isEmpty()||!explicit.add(path))throw new IOException("ZIP内のファイル名が重複しています");
    String[] parts=path.split("/",-1);if(parts.length>33)throw new IOException("ZIP内のフォルダ階層が深すぎます");String parent="";
    for(int i=0;i<parts.length;i++){
     String name=parts[i];if(name.isEmpty()||name.equals(".")||name.equals("..")||name.indexOf('\\')>=0||name.indexOf('\0')>=0||(i==0&&name.matches("[A-Za-z]:.*")))throw new IOException("ZIP内の保存パスが不正です");
     String id=parent.isEmpty()?name:parent+"/"+name;boolean dir=i<parts.length-1||entry.isDirectory();
     LinkedHashMap<String,ArchiveFolderTransfer.Node> children=directories.get(parent);if(children==null)throw new IOException("ZIP内のフォルダ構造が不正です");
     ArchiveFolderTransfer.Node before=children.get(name);if(before!=null&&(!before.directory||!dir))throw new IOException("ZIP内の保存パスが競合しています");
     if(before==null)children.put(name,new ArchiveFolderTransfer.Node(id,name,dir,dir?0:entry.getSize(),entry.getTime(),dir?-1:entry.getCrc()));
     if(dir)directories.computeIfAbsent(id,k->new LinkedHashMap<>());parent=id;
    }
   }ready=true;
  }finally{if(!ready)zip.close();}
 }
 public List<ArchiveFolderTransfer.Node> children(String id)throws IOException{
  Map<String,ArchiveFolderTransfer.Node> entries=directories.get(id);if(entries==null)throw new IOException("ZIP内のフォルダがありません");return new ArrayList<>(entries.values());
 }
 public InputStream open(String id)throws IOException{ZipEntry entry=zip.getEntry(id);if(entry==null||entry.isDirectory())throw new IOException("ZIP内のファイルがありません");return zip.getInputStream(entry);}
 public void close()throws IOException{zip.close();}
}
