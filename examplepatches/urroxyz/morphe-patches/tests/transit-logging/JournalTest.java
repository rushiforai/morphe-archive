import xyz.urro.transit.DiagnosticJournal;import java.nio.file.*;import java.io.*;
public class JournalTest{
 public static void main(String[] args)throws Exception{
  Path dir=Files.createTempDirectory("transit-journal-test");
  try{
   DiagnosticJournal j=new DiagnosticJournal(dir.toFile(),"run-a",80);
   File first=j.append("{\"source\":\"timer\",\"line\":\"♪ 日本語\"}");
   j.append("{\"source\":\"timer\",\"line\":\"♪ 日本語\"}");
   long before=Files.list(dir).mapToLong(p->{try{return Files.size(p);}catch(Exception e){throw new RuntimeException(e);}}).sum();
   for(int i=0;i<20;i++)j.append("{\"sequence\":"+i+"}");
   DiagnosticJournal restarted=new DiagnosticJournal(dir.toFile(),"run-a",80);File later=restarted.append("{\"source\":\"restart\"}");
   if(first.equals(later))throw new AssertionError("restart overwrote old log");
   String all="";try(var list=Files.list(dir)){for(Path p:list.toList()){String content=Files.readString(p);if(!content.endsWith("\n"))throw new AssertionError("partial line");all+=content;}}
   if(all.lines().count()!=23||all.indexOf("日本語")==all.lastIndexOf("日本語")||before<50)throw new AssertionError("lost repeated or Unicode records");
   System.out.println("PASS: durable append, repeated records, Unicode, rotation, restart, complete JSONL lines");
  }finally{try(var list=Files.list(dir)){for(Path p:list.toList())Files.delete(p);}Files.delete(dir);}
 }
}
