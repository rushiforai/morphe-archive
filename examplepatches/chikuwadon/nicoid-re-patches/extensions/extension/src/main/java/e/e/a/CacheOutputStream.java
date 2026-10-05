package e.e.a;
import java.io.*;
import android.os.ParcelFileDescriptor;
public final class CacheOutputStream extends FileOutputStream {
    private static final ThreadLocal<ParcelFileDescriptor> opening=new ThreadLocal<>();
    private final ParcelFileDescriptor descriptor;
    private static FileDescriptor open(File file,boolean append)throws FileNotFoundException{ParcelFileDescriptor fd=CacheFolders.open(file,true,append);opening.set(fd);return fd.getFileDescriptor();}
    public CacheOutputStream(File file,boolean append)throws FileNotFoundException{super(open(file,append));descriptor=opening.get();opening.remove();}
    public CacheOutputStream(File file)throws FileNotFoundException{this(file,false);}
    public CacheOutputStream(String path)throws FileNotFoundException{this(new CacheFile(path),false);}
    public CacheOutputStream(String path,boolean append)throws FileNotFoundException{this(new CacheFile(path),append);}
    @Override public void close()throws IOException{try{super.close();}finally{descriptor.close();}}
}
