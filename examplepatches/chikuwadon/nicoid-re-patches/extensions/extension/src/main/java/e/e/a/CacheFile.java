package e.e.a;

import java.io.*;
import java.util.*;
import android.net.Uri;
import android.provider.DocumentsContract;

/** Preserve the legacy File API while resolving selected cache files through SAF. */
public class CacheFile extends File {
    public CacheFile(String path){super(CacheFolders.privatePath(path));}
    public CacheFile(String parent,String child){super(CacheFolders.privatePath(new File(parent,child).getPath()));}
    public CacheFile(File parent,String child){super(CacheFolders.privatePath(new File(parent,child).getPath()));}
    public CacheFile(java.net.URI uri){super(CacheFolders.privatePath(new File(uri).getPath()));}
    private boolean saf(){return CacheFolders.virtual(this);}
    @Override public File getParentFile(){String p=getParent();return p==null?null:new CacheFile(p);}
    @Override public File getAbsoluteFile(){return new CacheFile(getAbsolutePath());}
    @Override public boolean exists(){if(!saf())return super.exists();try{return CacheFolders.stat(this)!=null;}catch(IOException e){return false;}}
    @Override public boolean isDirectory(){if(!saf())return super.isDirectory();try{CacheFolders.Entry e=CacheFolders.stat(this);return e!=null&&DocumentsContract.Document.MIME_TYPE_DIR.equals(e.mime);}catch(IOException e){return false;}}
    @Override public boolean isFile(){return saf()?exists()&&!isDirectory():super.isFile();}
    @Override public long length(){if(!saf())return super.length();try{CacheFolders.Entry e=CacheFolders.stat(this);return e==null?0:e.size;}catch(IOException e){return 0;}}
    @Override public long lastModified(){if(!saf())return super.lastModified();try{CacheFolders.Entry e=CacheFolders.stat(this);return e==null?0:e.time;}catch(IOException e){return 0;}}
    @Override public boolean mkdir(){return saf()?isDirectory():super.mkdir();}
    @Override public boolean mkdirs(){return saf()?isDirectory():super.mkdirs();}
    @Override public boolean createNewFile()throws IOException{if(!saf())return super.createNewFile();if(exists())return false;CacheFolders.document(this,true);return true;}
    @Override public boolean delete(){if(!saf())return super.delete();try{if(CacheFolders.relative(this).isEmpty())return false;Uri uri=CacheFolders.document(this,false);boolean removed=uri!=null&&DocumentsContract.deleteDocument(CacheFolders.context.getContentResolver(),uri);if(removed)CacheFolders.forget(this);return removed;}catch(Exception e){return false;}}
    @Override public boolean renameTo(File dest){if(!saf())return super.renameTo(dest);try{if(!CacheFolders.virtual(dest)||!CacheFolders.tree(this).equals(CacheFolders.tree(dest))||dest.exists())return false;Uri renamed=DocumentsContract.renameDocument(CacheFolders.context.getContentResolver(),CacheFolders.document(this,false),CacheFolders.physicalName(dest.getName()));if(renamed!=null){CacheFolders.forget(this);CacheFolders.remember(dest,renamed);}return renamed!=null;}catch(Exception e){return false;}}
    @Override public File[] listFiles(){if(!saf())return super.listFiles();try{Uri tree=CacheFolders.tree(this),parent=CacheFolders.document(this,false);if(parent==null)return null;List<CacheFolders.Entry> es=CacheFolders.cacheChildren(parent,tree);File[] files=new File[es.size()];for(int i=0;i<files.length;i++)files[i]=new CacheFile(this,es.get(i).name);return files;}catch(IOException e){return null;}}
    @Override public File[] listFiles(FilenameFilter filter){File[] fs=listFiles();if(fs==null||filter==null)return fs;ArrayList<File> out=new ArrayList<>();for(File f:fs)if(filter.accept(this,f.getName()))out.add(f);return out.toArray(new File[0]);}
    @Override public File[] listFiles(FileFilter filter){File[] fs=listFiles();if(fs==null||filter==null)return fs;ArrayList<File> out=new ArrayList<>();for(File f:fs)if(filter.accept(f))out.add(f);return out.toArray(new File[0]);}
    @Override public String[] list(){File[] fs=listFiles();if(fs==null)return null;String[] names=new String[fs.length];for(int i=0;i<names.length;i++)names[i]=fs[i].getName();return names;}
    @Override public String[] list(FilenameFilter filter){File[] fs=listFiles(filter);if(fs==null)return null;String[] names=new String[fs.length];for(int i=0;i<names.length;i++)names[i]=fs[i].getName();return names;}
}
