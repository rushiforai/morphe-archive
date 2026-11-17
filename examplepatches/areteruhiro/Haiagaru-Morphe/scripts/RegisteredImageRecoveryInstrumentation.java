package app.haiagaru.tests.recovery;
import android.provider.DocumentsContract.Document;import android.provider.DocumentsContract.Root;
import android.app.*;import android.content.*;import android.database.*;import android.graphics.*;import android.os.*;import android.provider.*;import android.net.Uri;import java.io.*;import java.lang.reflect.*;import java.util.*;

/** Exercises real SAF I/O with synthetic images in isolated storage, never user registrations. */
public final class RegisteredImageRecoveryInstrumentation extends Instrumentation {
 public static final String AUTH="app.haiagaru.tests.recovery.documents";
 public static final class Provider extends ContentProvider {
  File root;
  public boolean onCreate(){root=new File(getContext().getFilesDir(),"recovery-provider");root.mkdirs();return true;}
  File file(String id)throws FileNotFoundException{if(!id.matches("root|[a-f0-9]{32}\\.(png|img)"))throw new FileNotFoundException(id);return id.equals("root")?root:new File(root,id);}
  public Cursor queryRoots(String[] p){return new MatrixCursor(new String[]{Root.COLUMN_ROOT_ID,Root.COLUMN_DOCUMENT_ID});}
  void row(MatrixCursor c,File f){c.newRow().add(f.equals(root)?"root":f.getName()).add(f.getName()).add(f.isDirectory()?Document.MIME_TYPE_DIR:"image/png").add(f.length()).add(f.lastModified());}
  public Cursor queryDocument(String id,String[] p)throws FileNotFoundException{MatrixCursor c=new MatrixCursor(new String[]{Document.COLUMN_DOCUMENT_ID,Document.COLUMN_DISPLAY_NAME,Document.COLUMN_MIME_TYPE,Document.COLUMN_SIZE,Document.COLUMN_LAST_MODIFIED});row(c,file(id));return c;}
  public Cursor queryChildDocuments(String id,String[] p,String order)throws FileNotFoundException{MatrixCursor c=new MatrixCursor(new String[]{Document.COLUMN_DOCUMENT_ID,Document.COLUMN_DISPLAY_NAME,Document.COLUMN_MIME_TYPE,Document.COLUMN_SIZE,Document.COLUMN_LAST_MODIFIED});File[] fs=file(id).listFiles();if(fs!=null)for(File f:fs)row(c,f);return c;}
  public ParcelFileDescriptor openDocument(String id,String mode,CancellationSignal signal)throws FileNotFoundException{return ParcelFileDescriptor.open(file(id),ParcelFileDescriptor.parseMode(mode));}
  public String createDocument(String parent,String mime,String name)throws FileNotFoundException{try{file(name).createNewFile();return name;}catch(IOException e){throw new FileNotFoundException(e.toString());}}
  public void deleteDocument(String id)throws FileNotFoundException{if(!file(id).delete())throw new FileNotFoundException(id);}
  public Cursor query(Uri uri,String[] projection,String selection,String[] args,String order){try{return uri.getLastPathSegment().equals("children")?queryChildDocuments(DocumentsContract.getDocumentId(uri),projection,order):queryDocument(DocumentsContract.getDocumentId(uri),projection);}catch(Exception e){throw new IllegalArgumentException(e);}}
  public String getType(Uri uri){return "image/png";}
  public Uri insert(Uri uri,ContentValues values){throw new UnsupportedOperationException();}
  public int update(Uri uri,ContentValues values,String selection,String[] args){throw new UnsupportedOperationException();}
  public int delete(Uri uri,String selection,String[] args){throw new UnsupportedOperationException();}
  public ParcelFileDescriptor openFile(Uri uri,String mode)throws FileNotFoundException{return openDocument(DocumentsContract.getDocumentId(uri),mode,null);}
  public Bundle call(String method,String arg,Bundle extras){try{
   Uri uri=extras.getParcelable("uri");Bundle out=new Bundle();
   if(method.equals("android:createDocument")){String id=createDocument(DocumentsContract.getDocumentId(uri),extras.getString("mimeType"),extras.getString("_display_name"));out.putParcelable("uri",DocumentsContract.buildDocumentUriUsingTree(uri,id));}
   else if(method.equals("android:deleteDocument"))deleteDocument(DocumentsContract.getDocumentId(uri));else throw new UnsupportedOperationException(method);
   return out;
  }catch(Exception e){throw new IllegalArgumentException(e);}}
 }
 int checks;void ok(boolean b,String why){if(!b)throw new AssertionError(why);checks++;}
 Method method(Class<?> c,String n,Class<?>...p)throws Exception{Method m=c.getDeclaredMethod(n,p);m.setAccessible(true);return m;}
 public void onCreate(Bundle b){super.onCreate(b);start();}
 public void onStart(){Bundle result=new Bundle();try{
  Context target=getTargetContext();ok(target.getPackageName().endsWith("reporter242"),"isolated app");
  File sandbox=new File(target.getCacheDir(),"image-recovery-test");sandbox.mkdirs();SharedPreferences prefs=target.getSharedPreferences("test.image-recovery",0);prefs.edit().clear().commit();
  Context app=new ContextWrapper(target){public Context getApplicationContext(){return this;}public File getFilesDir(){return sandbox;}public SharedPreferences getSharedPreferences(String name,int mode){return prefs;}};
  ClassLoader loader=target.getClassLoader();Class<?> store=loader.loadClass("app.morphe.extension.chmate.RegisteredImageSafStore"),ng=loader.loadClass("app.morphe.extension.chmate.RegisteredImageNg");
  Method digest=method(ng,"digest",byte[].class);ByteArrayOutputStream bytes=new ByteArrayOutputStream();Bitmap image=Bitmap.createBitmap(16,16,Bitmap.Config.ARGB_8888);image.eraseColor(Color.MAGENTA);image.compress(Bitmap.CompressFormat.PNG,100,bytes);image.recycle();byte[] png=bytes.toByteArray();String hash=(String)digest.invoke(null,png);
  File old=new File(sandbox,"haiagaru-registered-image-ng");old.mkdirs();File original=new File(old,hash+".img");try(OutputStream out=new FileOutputStream(original)){out.write(png);}
  Class<?> reader=loader.loadClass("app.morphe.extension.chmate.RegisteredImageSafStore$BytesReader");Object io=java.lang.reflect.Proxy.newProxyInstance(loader,new Class<?>[]{reader},(p,m,args)->{if(m.getName().equals("digest"))return digest.invoke(null,args[0]);InputStream in=(InputStream)args[0];ByteArrayOutputStream data=new ByteArrayOutputStream();byte[] buffer=new byte[1024];int n;while((n=in.read(buffer))!=-1)data.write(buffer,0,n);return data.toByteArray();});
  Method recover=method(store,"recoverLegacy",Context.class,int.class,reader),list=method(store,"list",Context.class),deleted=method(store,"deleted",Context.class,String.class),put=method(store,"put",Context.class,byte[].class,String.class,int.class);
  ok((Integer)recover.invoke(null,app,80,io)==0,"private registrations already usable without SAF");ok(((List<?>)list.invoke(null,app)).size()==1,"private URL registration retained");
  Uri tree=DocumentsContract.buildTreeDocumentUri(AUTH,"root");prefs.edit().putString("saf_tree",tree.toString()).putString("saf_folder_id","root").commit();
  ok((Integer)recover.invoke(null,app,80,io)==1,"missing URL image restored to SAF");ok(original.isFile(),"original retained");ok(((List<?>)list.invoke(null,app)).size()==1,"active reference visible");ok((Integer)recover.invoke(null,app,80,io)==0,"repeat opening never duplicates");
  DocumentsContract.deleteDocument(app.getContentResolver(),DocumentsContract.buildDocumentUriUsingTree(tree,hash+".png"));deleted.invoke(null,app,hash);
  ok((Integer)recover.invoke(null,app,80,io)==0,"explicit removal not resurrected");ok((Boolean)put.invoke(null,app,png,hash,80),"deliberate re-registration succeeds");ok(!prefs.getStringSet("deleted_reference_digests",Collections.emptySet()).contains(hash),"re-registration clears tombstone");
  DocumentsContract.deleteDocument(app.getContentResolver(),DocumentsContract.buildDocumentUriUsingTree(tree,hash+".png"));ok((Integer)recover.invoke(null,app,0,io)==0,"capacity respected");
  prefs.edit().putString("saf_folder_id","unavailable").commit();boolean failed=false;try{recover.invoke(null,app,80,io);}catch(InvocationTargetException expected){failed=true;}ok(failed&&original.isFile(),"failed destination never removes originals");
  prefs.edit().remove("saf_tree").remove("saf_folder_id").commit();
  String damagedHash="abcdefabcdefabcdefabcdefabcdefab";File broken=new File(old,damagedHash+".img");try(RandomAccessFile out=new RandomAccessFile(broken,"rw")){out.setLength(8*1024*1024+1);}
  Object entry=null;for(Object item:(List<?>)list.invoke(null,app)){Field name=item.getClass().getDeclaredField("name");name.setAccessible(true);if(name.get(item).equals(broken.getName()))entry=item;}
  Field appField=ng.getDeclaredField("app");appField.setAccessible(true);Object previousApp=appField.get(null);
  try{appField.set(null,app);java.util.concurrent.CountDownLatch done=new java.util.concurrent.CountDownLatch(1);method(ng,"remove",entry.getClass(),java.util.function.Consumer.class).invoke(null,entry,(java.util.function.Consumer<String>)message->done.countDown());ok(done.await(15,java.util.concurrent.TimeUnit.SECONDS),"broken image removal completes");ok(!broken.exists()&&prefs.getStringSet("deleted_reference_digests",Collections.emptySet()).contains(damagedHash),"oversize/corrupt reference removable and tombstoned");}finally{appField.set(null,previousApp);}
  original.delete();old.delete();sandbox.delete();prefs.edit().clear().commit();result.putString("result","PASS "+checks+" automatic image recovery and SAF checks");finish(Activity.RESULT_OK,result);
 }catch(Throwable e){result.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}}
}
