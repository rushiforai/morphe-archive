package app.morphe.extension.chmate;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;

/** Bounded encoded files, never decoded frames. Staging files are not cache hits. */
final class GifFileCache {
    static final int MAX_FILE=64*1024*1024;
    static final long MAX_TOTAL=96L*1024*1024, MAX_AGE=7L*24*60*60*1000;
    private static final Map<String,KeyLock> LOCKS=new HashMap<>();
    private static final class KeyLock {final java.util.concurrent.locks.ReentrantLock lock=new java.util.concurrent.locks.ReentrantLock();int users;}
    interface Cancellation{boolean getAsBoolean();}
    interface Downloader{void download(OutputStream output,Cancellation cancelled)throws IOException;}
    static File get(File directory,String url,int limit,boolean force,Cancellation cancelled,Downloader downloader)throws IOException{
        String key=key(url);
        KeyLock entry;synchronized(LOCKS){entry=LOCKS.get(key);if(entry==null){entry=new KeyLock();LOCKS.put(key,entry);}entry.users++;}
        boolean locked=false;
        try{
            do{if(cancelled.getAsBoolean())throw new InterruptedIOException("GIF cancelled");}
            while(!(locked=entry.lock.tryLock(100,java.util.concurrent.TimeUnit.MILLISECONDS)));
            if(cancelled.getAsBoolean())throw new InterruptedIOException("GIF cancelled");
            if(!directory.isDirectory()&&!directory.mkdirs())throw new IOException("GIF cache unavailable");
            File file=new File(directory,key+".gif"),backup=new File(directory,key+".old");long now=System.currentTimeMillis();
            if(!file.exists()&&backup.isFile())backup.renameTo(file);
            if(file.exists()&&backup.exists())backup.delete();
            if(!force&&file.isFile()&&now-file.lastModified()<=MAX_AGE&&valid(file)){
                if(file.length()>limit)throw new IOException("GIF too large");
                file.setLastModified(now);return file;
            }
            File staging=File.createTempFile("download-",".part",directory);
            try{
                try(OutputStream raw=new BufferedOutputStream(new FileOutputStream(staging))){
                    downloader.download(new FilterOutputStream(raw){
                        long size;
                        @Override public void write(int b)throws IOException{check(1);out.write(b);}
                        @Override public void write(byte[] b,int offset,int count)throws IOException{check(count);out.write(b,offset,count);}
                        private void check(int count)throws IOException{
                            if(cancelled.getAsBoolean())throw new InterruptedIOException("GIF cancelled");
                            if(count>Math.min(limit,MAX_FILE)-size)throw new IOException("GIF too large");size+=count;
                        }
                    },cancelled);
                }
                if(cancelled.getAsBoolean())throw new InterruptedIOException("GIF cancelled");
                if(!valid(staging))throw new IOException("Not a complete GIF header");
                // Preserve the old good file and recover it after a process interruption.
                if(file.exists()&&!file.renameTo(backup))throw new IOException("GIF cache backup failed");
                if(!staging.renameTo(file)){
                    if(backup.exists()&&!backup.renameTo(file))throw new IOException("GIF cache commit and rollback failed");
                    throw new IOException("GIF cache commit failed");
                }
                if(backup.exists())backup.delete();
                prune(directory,file,now);return file;
            }finally{if(staging.exists())staging.delete();}
        }catch(InterruptedException interrupted){Thread.currentThread().interrupt();throw new InterruptedIOException("GIF cancelled");}
        finally{if(locked)entry.lock.unlock();synchronized(LOCKS){if(--entry.users==0)LOCKS.remove(key);}}
    }
    static void invalidate(File directory,String url,File file){
        try{
            File expected=new File(directory,key(url)+".gif").getCanonicalFile();
            if(expected.equals(file.getCanonicalFile()))file.delete();
        }catch(IOException ignored){}
    }
    static boolean valid(File file){
        if(!file.isFile()||file.length()<14||file.length()>MAX_FILE)return false;
        try(RandomAccessFile input=new RandomAccessFile(file,"r")){
            byte[] header=new byte[10];input.readFully(header);
            int width=(header[6]&255)|((header[7]&255)<<8),height=(header[8]&255)|((header[9]&255)<<8);
            input.seek(file.length()-1);
            return header[0]=='G'&&header[1]=='I'&&header[2]=='F'&&header[3]=='8'
                    &&(header[4]=='7'||header[4]=='9')&&header[5]=='a'&&width>0&&height>0&&width<=16384&&height<=16384&&input.read()==0x3b;
        }catch(IOException invalid){return false;}
    }
    static void prune(File directory,File keep,long now){
        File[] files=directory.listFiles(f->f.getName().matches("[0-9a-f]{64}\\.gif"));if(files==null)return;
        Arrays.sort(files,(left,right)->Long.compare(left.lastModified(),right.lastModified()));long total=0;
        for(File file:files)total+=file.length();
        for(File file:files)if(!file.equals(keep)&&(now-file.lastModified()>MAX_AGE||total>MAX_TOTAL)){
            long size=file.length();if(file.delete())total-=size;
        }
    }
    private static String key(String url)throws IOException{
        try{
            byte[] bytes=MessageDigest.getInstance("SHA-256").digest(url.getBytes(StandardCharsets.UTF_8));
            StringBuilder key=new StringBuilder();for(byte b:bytes)key.append(String.format(Locale.ROOT,"%02x",b&255));return key.toString();
        }catch(java.security.NoSuchAlgorithmException impossible){throw new IOException(impossible);}
    }
    private GifFileCache(){}
}
