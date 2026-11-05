package app.haiagaru.tests.archive;
import android.provider.*;import android.content.*;import android.net.Uri;import android.database.*;import android.os.*;import java.io.*;import java.util.*;

/** Public synthetic documents only. Installed solely with the isolated test APK. */
public final class ArchiveFixtureProvider extends ContentProvider {
 static final String BOARD="egg.5ch.io%2Fandroid",TITLE="移行テスト[1793798226]",DAT=BOARD+"_1793798226.dat";
 static final String LEAF="root/archive/"+BOARD+"/"+TITLE+"/";
 static final String[] DEFAULT={"document_id","_display_name","mime_type","_size","last_modified","flags"};
 public boolean onCreate(){return true;}
 public Cursor query(Uri uri,String[] projection,String selection,String[] args,String order){try{return uri.getLastPathSegment().equals("children")?queryChildDocuments(DocumentsContract.getDocumentId(uri),projection,order):queryDocument(DocumentsContract.getDocumentId(uri),projection);}catch(FileNotFoundException e){throw new IllegalArgumentException(e);}}
 public String getType(Uri uri){return "application/octet-stream";}
 public Uri insert(Uri uri,ContentValues values){throw new UnsupportedOperationException();}
 public int delete(Uri uri,String where,String[] args){throw new UnsupportedOperationException();}
 public int update(Uri uri,ContentValues values,String where,String[] args){throw new UnsupportedOperationException();}
 public ParcelFileDescriptor openFile(Uri uri,String mode)throws FileNotFoundException{return openDocument(DocumentsContract.getDocumentId(uri),mode,null);}
 static byte[] data(String id)throws IOException{return id.endsWith(".idx")?new byte[]{1,4,0,3}:"名前<>sage<>2026/11/05<>取り込み本文<>移行テスト\n".getBytes("MS932");}
 private void row(MatrixCursor c,String id)throws IOException{boolean dir=!id.endsWith(".dat")&&!id.endsWith(".idx");Object[] values=new Object[c.getColumnCount()];for(int i=0;i<values.length;i++){String col=c.getColumnNames()[i];values[i]=col.equals("document_id")?id:col.equals("_display_name")?id.substring(id.lastIndexOf('/')+1):col.equals("mime_type")?dir?DocumentsContract.Document.MIME_TYPE_DIR:"application/octet-stream":col.equals("_size")?dir?0:data(id).length:col.equals("last_modified")?1700000000000L:0;}c.addRow(values);}
 public Cursor queryRoots(String[] projection){String[] cols=projection==null?new String[]{"root_id","document_id","title","flags"}:projection;MatrixCursor c=new MatrixCursor(cols);Object[] vals=new Object[cols.length];for(int i=0;i<vals.length;i++)vals[i]=cols[i].equals("root_id")||cols[i].equals("document_id")?"root":cols[i].equals("title")?"Fixture":0;c.addRow(vals);return c;}
 public Cursor queryDocument(String id,String[] projection)throws FileNotFoundException{MatrixCursor c=new MatrixCursor(projection==null?DEFAULT:projection);try{row(c,id);}catch(IOException e){throw new FileNotFoundException(e.toString());}return c;}
 public Cursor queryChildDocuments(String parent,String[] projection,String order)throws FileNotFoundException{MatrixCursor c=new MatrixCursor(projection==null?DEFAULT:projection);String[] children=parent.equals("root")?new String[]{"root/archive"}:parent.equals("root/archive")?new String[]{"root/archive/"+BOARD}:parent.equals("root/archive/"+BOARD)?new String[]{"root/archive/"+BOARD+"/"+TITLE}:parent.equals(LEAF.substring(0,LEAF.length()-1))?new String[]{LEAF+DAT,LEAF+DAT.replace(".dat",".idx")}:new String[0];try{for(String id:children)row(c,id);}catch(IOException e){throw new FileNotFoundException(e.toString());}return c;}
 public boolean isChildDocument(String parent,String child){return child.startsWith(parent+"/");}
 public ParcelFileDescriptor openDocument(String id,String mode,CancellationSignal signal)throws FileNotFoundException{try{File f=new File(getContext().getCacheDir(),id.endsWith(".idx")?"fixture.idx":"fixture.dat");try(FileOutputStream out=new FileOutputStream(f)){out.write(data(id));}return ParcelFileDescriptor.open(f,ParcelFileDescriptor.MODE_READ_ONLY);}catch(IOException e){throw new FileNotFoundException(e.toString());}}
}
