package app.morphe.extension.chmate;
import java.io.*;import java.nio.file.*;import java.util.*;import java.util.zip.*;

public final class ArchiveFolderTransferTest {
 static int checks;
 static void check(boolean ok){checks++;if(!ok)throw new AssertionError("check "+checks);}
 interface Job{void run()throws Exception;}
 static void fails(Job job)throws Exception{try{job.run();throw new AssertionError("expected rejection");}catch(IOException expected){checks++;}}
 static File zip(File dir,String filename,Map<String,byte[]> files)throws Exception{File file=new File(dir,filename);try(var out=new ZipOutputStream(new FileOutputStream(file))){for(var e:files.entrySet()){out.putNextEntry(new ZipEntry(e.getKey()));out.write(e.getValue());out.closeEntry();}}return file;}
 public static void main(String[] args)throws Exception{
  File temp=Files.createTempDirectory("archive-transfer-test-").toFile(),root=new File(temp,"target");root.mkdir();
  String relative="egg.5ch.io%2Fandroid/移行テスト[1793798226]/egg.5ch.io%2Fandroid_1793798226.dat";
  byte[] dat="名前<>sage<>2026/11/05<>本文<>タイトル\n".getBytes("MS932"),idx={1,4,0,3};
  Map<String,byte[]> entries=new LinkedHashMap<>();entries.put("archive/"+relative,dat);entries.put("archive/"+relative.replace(".dat",".idx"),idx);entries.put("dat/not-an-archive.dat",new byte[]{9});entries.put("preferences.xml",new byte[]{8});
  File file=zip(temp,"native.zip",entries);byte[] original=Files.readAllBytes(file.toPath());
  try(var source=new ArchiveZipSource(file)){
   var plan=ArchiveFolderTransfer.scan(source,"");check(plan.threads==1);check(plan.entries.size()==2);check(plan.bytes==dat.length+idx.length);
   File destination=ArchiveFolderTransfer.copy(source,plan,root,"migration");check(Arrays.equals(Files.readAllBytes(new File(destination,relative).toPath()),dat));check(Arrays.equals(Files.readAllBytes(new File(destination,relative.replace(".dat",".idx")).toPath()),idx));
   check(!new File(destination,"dat").exists());
   File second=ArchiveFolderTransfer.copy(source,plan,root,"migration");check(!second.equals(destination));check(new File(destination,relative).isFile());
   File restoreRoot=new File(temp,"restore");File old=new File(restoreRoot,relative);old.getParentFile().mkdirs();Files.writeString(old.toPath(),"old data");File untouched=new File(restoreRoot,"unselected/keep.dat");untouched.getParentFile().mkdirs();Files.writeString(untouched.toPath(),"keep");
   var selected=ArchiveFolderTransfer.select(plan,Collections.singleton(relative.split("/")[0]));check(selected.entries.size()==2);
   ArchiveFolderTransfer.restore(source,selected,restoreRoot);check(Arrays.equals(Files.readAllBytes(old.toPath()),dat));check(Files.readString(untouched.toPath()).equals("keep"));check(Files.exists(new File(restoreRoot,relative.replace(".dat",".idx")).toPath()));
   fails(()->ArchiveFolderTransfer.restore(source,ArchiveFolderTransfer.select(plan,Collections.emptySet()),restoreRoot));
   fails(()->ArchiveFolderTransfer.copy(source,plan,root,"../escape"));
   ArchiveFolderTransfer.Source broken=new ArchiveFolderTransfer.Source(){public List<ArchiveFolderTransfer.Node> children(String id)throws IOException{return source.children(id);}public InputStream open(String id)throws IOException{throw new IOException("fixture read failure");}};
   int before=root.list().length;fails(()->ArchiveFolderTransfer.copy(broken,plan,root,"failed"));check(root.list().length==before);
   var node=plan.entries.get(0);var corrupt=new ArchiveFolderTransfer.Plan();corrupt.entries.add(new ArchiveFolderTransfer.Entry(new ArchiveFolderTransfer.Node(node.node.id,node.node.name,false,node.node.size,node.node.modified,0),node.path));corrupt.threads=1;
   fails(()->ArchiveFolderTransfer.copy(source,corrupt,root,"bad-crc"));check(root.list().length==before);
   var shortPlan=new ArchiveFolderTransfer.Plan();shortPlan.entries.add(new ArchiveFolderTransfer.Entry(new ArchiveFolderTransfer.Node(node.node.id,node.node.name,false,node.node.size+1,node.node.modified),node.path));shortPlan.threads=1;
   fails(()->ArchiveFolderTransfer.copy(source,shortPlan,root,"bad-size"));check(root.list().length==before);
   Files.writeString(old.toPath(),"preserve on failure");fails(()->ArchiveFolderTransfer.restore(source,shortPlan,restoreRoot));check(Files.readString(old.toPath()).equals("preserve on failure"));
   // A second entry below a file must roll back a first committed replacement.
   File blocker=new File(restoreRoot,"blocked");Files.writeString(blocker.toPath(),"blocker");var rollback=new ArchiveFolderTransfer.Plan();rollback.entries.add(plan.entries.get(0));rollback.entries.add(new ArchiveFolderTransfer.Entry(plan.entries.get(1).node,"blocked/child.idx"));rollback.threads=1;
   fails(()->ArchiveFolderTransfer.restore(source,rollback,restoreRoot));check(Files.readString(old.toPath()).equals("preserve on failure"));check(Files.readString(blocker.toPath()).equals("blocker"));
  }
  check(Arrays.equals(Files.readAllBytes(file.toPath()),original));
  try(var wrapped=new ArchiveZipSource(zip(temp,"wrapped.zip",Collections.singletonMap("2chMate/archive/board/題名:part1/thread.dat",dat)))){var plan=ArchiveFolderTransfer.scan(wrapped,"");check(plan.entries.get(0).path.equals("board/題名:part1/thread.dat"));}
  try(var boardOnly=new ArchiveZipSource(zip(temp,"board.zip",Collections.singletonMap("board/題名[1793798226]/thread.dat",dat)))){check(ArchiveFolderTransfer.scan(boardOnly,"").entries.get(0).path.equals("board/題名[1793798226]/thread.dat"));}
  for(String bad:List.of("../evil.dat","/evil.dat","C:/evil.dat","a/../../evil.dat","a\\evil.dat","a//evil.dat")){
   File invalid=zip(temp,"bad"+checks+".zip",Collections.singletonMap(bad,dat));fails(()->{try(var ignored=new ArchiveZipSource(invalid)){} });
  }
  try(var empty=new ArchiveZipSource(zip(temp,"empty.zip",Collections.singletonMap("setting.xml",dat)))){fails(()->ArchiveFolderTransfer.scan(empty,""));}
  check(Arrays.stream(root.list()).noneMatch(s->s.startsWith(".haiagaru-import")));
  System.out.println("ArchiveFolderTransfer: "+checks+" passed (native DAT/IDX, ZIP CRC, rollback, paths, source/target preservation)");
 }
}
