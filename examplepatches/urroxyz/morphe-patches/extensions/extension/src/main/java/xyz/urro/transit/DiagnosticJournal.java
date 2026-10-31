package xyz.urro.transit;

import java.io.*;
import java.nio.charset.StandardCharsets;

/** Append-only JSONL. Rotation never overwrites an earlier ride or process run. */
public final class DiagnosticJournal {
 private final File directory;private final String run;private final long limit;
 private int part;private File file;
 public DiagnosticJournal(File directory,String run,long limit){this.directory=directory;this.run=run;this.limit=limit;}
 public synchronized File append(String json)throws IOException{
  if(!directory.isDirectory()&&!directory.mkdirs())throw new IOException("Cannot create diagnostic directory");
  if(directory.getUsableSpace()<128L*1024*1024)throw new IOException("Insufficient space for diagnostic log");
  byte[] line=(json+"\n").getBytes(StandardCharsets.UTF_8);
  if(file==null||file.length()+line.length>limit){
   do{file=new File(directory,"go-"+run+"-"+(part++)+".jsonl");}while(file.exists());
  }
  try(FileOutputStream out=new FileOutputStream(file,true)){out.write(line);out.getFD().sync();}
  return file;
 }
}
