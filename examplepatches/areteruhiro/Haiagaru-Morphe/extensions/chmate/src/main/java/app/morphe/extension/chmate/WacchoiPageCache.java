package app.morphe.extension.chmate;

import android.content.Context;
import java.io.*;

/** Keep the existing bounded page cache in app files, migrating accessed legacy entries. */
final class WacchoiPageCache {
    static synchronized File file(Context c,String name)throws IOException{
        File dir=new File(c.getFilesDir(),"hissi-public-pages");
        if(!dir.isDirectory()&&!dir.mkdirs())throw new IOException("キャッシュを作成できません");
        File result=new File(dir,name),old=new File(new File(c.getCacheDir(),"hissi-public-pages"),name);
        if(!result.exists()&&old.isFile()&&old.length()<=2*1024*1024){
            try(InputStream in=new FileInputStream(old);OutputStream out=new FileOutputStream(result)){
                byte[] buffer=new byte[8192];int read;while((read=in.read(buffer))!=-1)out.write(buffer,0,read);
            }catch(IOException e){result.delete();throw e;}
            result.setLastModified(old.lastModified());
        }
        return result;
    }
    /** Readers never observe a parallel scan's partial response. No network under this lock. */
    static synchronized byte[] read(Context context,File file)throws IOException{
        if(!WacchoiStorageLimits.fresh(context,file))return null;
        try(InputStream in=new FileInputStream(file);ByteArrayOutputStream out=new ByteArrayOutputStream()){
            byte[] buffer=new byte[8192];int count;
            while((count=in.read(buffer))!=-1){
                if(out.size()+count>2*1024*1024)return null;
                out.write(buffer,0,count);
            }
            return out.toByteArray();
        }catch(FileNotFoundException ignored){return null;}
    }
    static synchronized void write(Context context,File file,byte[] bytes)throws IOException{
        android.util.AtomicFile atomic=new android.util.AtomicFile(file);
        FileOutputStream out=null;
        try{out=atomic.startWrite();out.write(bytes);atomic.finishWrite(out);}
        catch(IOException error){if(out!=null)atomic.failWrite(out);throw error;}
        file.setLastModified(System.currentTimeMillis());
        File[] files=file.getParentFile().listFiles();if(files==null)return;
        long size=0;for(File entry:files)size+=entry.length();
        long limit=WacchoiStorageLimits.scaled(context,5,1024L*1024);
        java.util.Arrays.sort(files,java.util.Comparator.comparingLong(File::lastModified));
        for(File entry:files){if(size<=limit)break;long length=entry.length();if(entry.delete())size-=length;}
    }
    private WacchoiPageCache(){}
}
