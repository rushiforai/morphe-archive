package app.haiagaru.tests.localimages;

import android.app.*;
import android.content.*;
import android.database.*;
import android.net.Uri;
import android.os.*;
import android.provider.DocumentsContract;
import android.provider.DocumentsProvider;
import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.security.MessageDigest;
import java.util.*;

/** Isolated APK only. Own PNG fixtures and read-only SAF provider; no public requests/posts. */
public final class LocalImageArchiveInstrumentation extends Instrumentation {
    public static final String AUTH="app.haiagaru.tests.localimages.documents";
    static final byte[] PNG=Base64.getDecoder().decode("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+j7t8AAAAASUVORK5CYII=");
    private Class<?> archive;private Context app;private int checks;
    private void ok(boolean b,String s){if(!b)throw new AssertionError(s);checks++;}
    private Object call(String name,Class<?>[] types,Object...args)throws Exception{Method m=archive.getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(null,args);}
    private Object field(String name)throws Exception{Field f=archive.getDeclaredField(name);f.setAccessible(true);return f.get(null);}
    private void idle()throws Exception{for(int n=0;n<100;n++){Thread.sleep(100);if(!((java.util.concurrent.atomic.AtomicBoolean)field("SCANNING")).get()&&!((java.util.concurrent.atomic.AtomicBoolean)field("RESETTING")).get())return;}throw new AssertionError("index timeout");}
    private String project(String raw)throws Exception{return ((String[])call("project",new Class[]{Object.class,String[].class},null,new String[]{raw}))[0];}
    private String ready(String raw)throws Exception{String result=raw;for(int n=0;n<60&&result.equals(raw);n++){result=project(raw);Thread.sleep(100);}return result;}
    private byte[] read(String raw)throws Exception{HttpURLConnection c=(HttpURLConnection)new URL(raw).openConnection();c.setConnectTimeout(3000);c.setReadTimeout(3000);try(InputStream in=c.getInputStream();ByteArrayOutputStream out=new ByteArrayOutputStream()){byte[] b=new byte[1024];int n;while((n=in.read(b))!=-1)out.write(b,0,n);return out.toByteArray();}finally{c.disconnect();}}
    private Bundle fixture(String operation,String name){return app.getContentResolver().call(Uri.parse("content://"+AUTH),operation,name,null);}
    private static Method method(Class<?> c,String name,Class<?>...types)throws Exception{Method m=c.getDeclaredMethod(name,types);m.setAccessible(true);return m;}
    private void siteRegressions()throws Exception{
        ClassLoader loader=app.getClassLoader();Class<?> gatewayType=loader.loadClass("app.morphe.extension.chmate.SiteBoardGateway"),transportType=loader.loadClass(gatewayType.getName()+"$Transport");
        int[] requests={0};Object transport=java.lang.reflect.Proxy.newProxyInstance(loader,new Class[]{transportType},(p,m,args)->{requests[0]++;throw new IOException("public network disabled in regression");});
        SharedPreferences prefs=app.getSharedPreferences("haiagaru.site-regressions",0);prefs.edit().clear().putBoolean("enabled",true).putBoolean("bbs.haiagaru_site_animanch.enable",true).commit();
        Constructor<?> ctor=gatewayType.getDeclaredConstructor(SharedPreferences.class,transportType);ctor.setAccessible(true);Object gateway=ctor.newInstance(prefs,transport);
        Field singleton=gatewayType.getDeclaredField("instance");singleton.setAccessible(true);Object previous=singleton.get(null);singleton.set(null,gateway);
        try{
            String address=(String)method(gatewayType,"localUrl",String.class).invoke(gateway,"https://bbs.animanch.com/board/6408106/");
            ok(address!=null&&address.contains("/9246408106/"),"unknown Animanch URL opens in dedicated root board");
            Class<?> refresh=loader.loadClass("app.morphe.extension.chmate.OpenTabsRefresh");
            Object info=method(refresh,"parseInfo",Context.class,String.class).invoke(null,app,"https://bbs.animanch.com/board/7244171/");
            ok(info!=null,"native parser recognizes an Animanch link outside thread list");ok(requests[0]==0,"URL parsing does not fetch the network");
            // Open the native dialog without sending or accepting any agreement.
            SharedPreferences nativePrefs=android.preference.PreferenceManager.getDefaultSharedPreferences(app);
            boolean hadTablet=nativePrefs.contains("enableTabletHome2"),previousTablet=nativePrefs.getBoolean("enableTabletHome2",false);
            try{for(boolean tablet:new boolean[]{false,true}){
            nativePrefs.edit().putBoolean("enableTabletHome2",tablet).commit();
            ActivityMonitor monitor=addMonitor("jp.syoboi.a2chMate.activity.ResEditActivity$Dialog",null,false);Activity editor=null;
            try{
                app.startActivity(new Intent(Intent.ACTION_SENDTO,Uri.parse(address)).setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.ResEditActivity$Dialog").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                editor=waitForMonitorWithTimeout(monitor,10000);ok(editor!=null,"native reply activity opens");
                final Activity target=editor;boolean visible=false;
                for(int n=0;n<30&&!visible;n++){java.util.concurrent.FutureTask<Boolean> task=new java.util.concurrent.FutureTask<>(()->hasEditor(target.getWindow().getDecorView()));runOnMainSync(task);visible=task.get();if(!visible)Thread.sleep(250);}
                ok(visible,"native reply body visible with nonzero dimensions; tablet="+tablet);
                java.util.concurrent.FutureTask<Void> copy=new java.util.concurrent.FutureTask<>(()->{copyChecks(target);return null;});runOnMainSync(copy);copy.get();
            }finally{if(editor!=null){final Activity target=editor;runOnMainSync(target::finish);}removeMonitor(monitor);}
            }}finally{if(hadTablet)nativePrefs.edit().putBoolean("enableTabletHome2",previousTablet).commit();else nativePrefs.edit().remove("enableTabletHome2").commit();}
            Field boards=gatewayType.getDeclaredField("boards");boards.setAccessible(true);String root=(String)((Map<?,?>)boards.get(gateway)).keySet().iterator().next();
            method(gatewayType,"boardEnabled",String.class,boolean.class).invoke(gateway,root,false);
            ok(method(gatewayType,"localUrl",String.class).invoke(gateway,"https://bbs.animanch.com/board/6408106/")==null,"explicit OFF is respected");
        }finally{method(gatewayType,"stop").invoke(gateway);singleton.set(null,previous);}
        Class<?> row=loader.loadClass("o.KeJ11");Object response=row.getConstructor(String.class,String.class,String.class).newInstance("name","date","body");
        Field date=row.getDeclaredField("p");date.setAccessible(true);date.set(response,"2026/11/07 12:00:00");
        Class<?> metadata=loader.loadClass("app.morphe.extension.chmate.SiteThreadMetadata");Method popup=method(metadata,"popupEpoch",long.class,Object.class);
        long expected=java.time.LocalDateTime.of(2026,11,7,12,0).atZone(java.time.ZoneId.of("Asia/Tokyo")).toEpochSecond();
        ok((Long)popup.invoke(null,9246408106L,Collections.singletonList(response))==expected,"popup uses loaded opening response date");
        ok((Long)popup.invoke(null,1794012345L,Collections.singletonList(response))==1794012345L,"normal timestamp unchanged");
    }
    private boolean hasEditor(android.view.View v){
        if(v instanceof android.widget.EditText&&v.isShown()&&v.getHeight()>50&&v.getWidth()>50)return true;
        if(v instanceof android.view.ViewGroup)for(int n=0;n<((android.view.ViewGroup)v).getChildCount();n++)if(hasEditor(((android.view.ViewGroup)v).getChildAt(n)))return true;return false;
    }
    public interface Click {Object invoke();}
    public static final class SheetItem {final String title;final Click click;SheetItem(String t,Click c){title=t;click=c;}}
    public static final class Sheet {
        public final Context context;public final List<SheetItem> items=new ArrayList<>();
        Sheet(Context c){context=c;}
        public void add(String title,String detail,boolean enabled,boolean checked,Click click){items.add(new SheetItem(title,click));}
    }
    private void copyChecks(Activity activity)throws Exception{
        Class<?> menus=app.getClassLoader().loadClass("app.morphe.extension.chmate.WacchoiLongPressMenu");
        Sheet builder=new Sheet(activity);method(menus,"appendNameSheet",Object.class,Object.class,Object.class,String.class).invoke(null,null,builder,null,"(ﾜｯﾁｮｲ Ab12-xY+/)");
        android.content.ClipboardManager clipboard=(android.content.ClipboardManager)activity.getSystemService(Context.CLIPBOARD_SERVICE);
        android.content.ClipData previous=clipboard.getPrimaryClip();try{
        int copies=0;for(SheetItem item:builder.items)if(item.title.endsWith("をコピー")){
            item.click.invoke();String actual=clipboard.getPrimaryClip().getItemAt(0).getText().toString();
            ok(actual.equals(item.title.contains("上4桁")?"Ab12":"xY+/"),"copy preserves exact four characters, case and symbols");copies++;
        }
        ok(copies==2,"both upper/lower copy actions exist in name sheet");
        }finally{if(previous==null)clipboard.clearPrimaryClip();else clipboard.setPrimaryClip(previous);}
    }
    @Override public void onCreate(Bundle args){super.onCreate(args);start();}
    @Override public void onStart(){Bundle out=new Bundle();try{test();out.putString("result","PASS "+checks+" local image recovery checks; public requests/posts=0");finish(Activity.RESULT_OK,out);}catch(Throwable t){out.putString("error",android.util.Log.getStackTraceString(t));finish(Activity.RESULT_CANCELED,out);}}
    private void test()throws Exception{
        app=getTargetContext();ok(app.getPackageName().endsWith("sitefix242"),"isolated target only");
        archive=app.getClassLoader().loadClass("app.morphe.extension.chmate.LocalImageArchive");call("initialize",new Class[]{Context.class},app);
        android.database.sqlite.SQLiteDatabase testDb=((android.database.sqlite.SQLiteOpenHelper)field("database")).getWritableDatabase();
        testDb.delete("files",null,null);testDb.delete("urls",null,null);((Map<?,?>)field("READY")).clear();((Map<?,?>)field("CHECKED")).clear();
        Uri tree=DocumentsContract.buildTreeDocumentUri(AUTH,"root");
        getContext().grantUriPermission(app.getPackageName(),tree,Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
        fixture("delete","renamed-image.png");
        SharedPreferences prefs=app.getSharedPreferences("haiagaru.local-image-archive",0);prefs.edit().putBoolean("enabled",true).putString("tree1",tree.toString()).commit();
        String source="https://deleted.invalid/local-image-regression.png";StringBuilder key=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(source.getBytes("UTF-8")))key.append(String.format("%02x",b&255));
        ok(fixture("fixture",key+".png").getBoolean("ok"),"provider fixture created");call("reset",new Class[]{});idle();
        String restored=ready(source);ok(!restored.equals(source),"URL hash file found through additional SAF tree");ok(Arrays.equals(PNG,read(restored)),"local relay returns original bytes");
        ok(source.equals(call("originalUrl",new Class[]{String.class},restored)),"original source retained");
        ok(fixture("rename",key+".png").getBoolean("ok"),"fixture renamed");
        call("scan",new Class[]{boolean.class},true);idle();
        String renamedUrl=ready(source);ok(!renamedUrl.equals(source),"content hash locates renamed file");ok(Arrays.equals(PNG,read(renamedUrl)),"renamed image returned");
        prefs.edit().putBoolean("enabled",false).commit();ok(project(renamedUrl).equals(source),"OFF restores network source URL");
        prefs.edit().putBoolean("enabled",true).remove("tree1").commit();call("reset",new Class[]{});idle();
        project(source);for(int n=0;n<50&&!((Set<?>)field("PENDING")).isEmpty();n++)Thread.sleep(100);
        ok(project(source).equals(source),"removed folder cannot supply image");
        String manual="https://deleted.invalid/older-renamed-image.png";
        call("associate",new Class[]{String.class,Uri.class},manual,DocumentsContract.buildDocumentUriUsingTree(tree,"renamed-image.png"));
        ok(Arrays.equals(PNG,read(ready(manual))),"manual source association");
        call("reset",new Class[]{});idle();ok(Arrays.equals(PNG,read(ready(manual))),"explicit image association survives index reset");
        fixture("delete","renamed-image.png");siteRegressions();archiveScreen();
    }
    private android.widget.Switch findSwitch(android.view.View v){if(v instanceof android.widget.Switch)return (android.widget.Switch)v;
        if(v instanceof android.view.ViewGroup)for(int n=0;n<((android.view.ViewGroup)v).getChildCount();n++){android.widget.Switch found=findSwitch(((android.view.ViewGroup)v).getChildAt(n));if(found!=null)return found;}return null;}
    private void archiveScreen()throws Exception{
        String name="app.morphe.extension.chmate.LocalImageArchiveActivity";ActivityMonitor monitor=addMonitor(name,null,false);Activity screen=null;
        try{app.startActivity(new Intent().setClassName(app.getPackageName(),name).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));screen=waitForMonitorWithTimeout(monitor,10000);ok(screen!=null,"archive settings activity opens");
            final Activity target=screen;Thread.sleep(700);
            java.util.concurrent.FutureTask<Void> check=new java.util.concurrent.FutureTask<>(()->{
                android.widget.Switch toggle=findSwitch(target.getWindow().getDecorView());ok(toggle!=null&&toggle.isShown()&&toggle.getWidth()>0,"archive switch visible and measured");
                int[] position=new int[2];toggle.getLocationOnScreen(position);ok(position[1]>0,"archive controls below status bar");
                boolean previous=toggle.isChecked();toggle.performClick();ok(toggle.isChecked()!=previous,"archive switch changes state");
                ok(app.getSharedPreferences("haiagaru.local-image-archive",0).getBoolean("enabled",previous)!=previous,"archive switch persists state");toggle.performClick();return null;
            });runOnMainSync(check);check.get();
        }finally{if(screen!=null){final Activity target=screen;runOnMainSync(target::finish);}removeMonitor(monitor);}
    }
    public static final class ImagesProvider extends ContentProvider {
        @Override public boolean onCreate(){return true;}
        @Override public Cursor query(Uri uri,String[] p,String selection,String[] args,String order){try{
            String id=DocumentsContract.getDocumentId(uri);
            return uri.getLastPathSegment().equals("children")?queryChildDocuments(id,p,order):queryDocument(id,p);
        }catch(Exception e){throw new IllegalArgumentException(e);}}
        @Override public String getType(Uri uri){return "image/png";}
        @Override public ParcelFileDescriptor openFile(Uri uri,String mode)throws FileNotFoundException{return openDocument(DocumentsContract.getDocumentId(uri),mode,null);}
        @Override public Uri insert(Uri uri,ContentValues values){throw new UnsupportedOperationException();}
        @Override public int delete(Uri uri,String selection,String[] args){throw new UnsupportedOperationException();}
        @Override public int update(Uri uri,ContentValues values,String selection,String[] args){throw new UnsupportedOperationException();}
        @Override public Bundle call(String operation,String arg,Bundle extras){Bundle out=new Bundle();try{
            File f=file(arg);boolean result=false;
            if(operation.equals("fixture")){try(FileOutputStream stream=new FileOutputStream(f)){stream.write(PNG);}result=true;}
            else if(operation.equals("rename"))result=f.renameTo(file("renamed-image.png"));
            else if(operation.equals("delete"))result=f.delete();
            else return super.call(operation,arg,extras);
            out.putBoolean("ok",result);
        }catch(Exception e){out.putString("error",e.toString());}return out;}
        private File file(String id)throws FileNotFoundException{if(id.equals("root"))return getContext().getFilesDir();if(!id.matches("[a-zA-Z0-9.-]+"))throw new FileNotFoundException();return new File(getContext().getFilesDir(),id);}
        private void row(MatrixCursor cursor,String id)throws FileNotFoundException{File f=file(id);MatrixCursor.RowBuilder r=cursor.newRow();for(String c:cursor.getColumnNames())switch(c){case "document_id":r.add(id);break;case "_display_name":r.add(f.getName());break;case "mime_type":r.add(f.isDirectory()?DocumentsContract.Document.MIME_TYPE_DIR:"image/png");break;case "_size":r.add(f.length());break;case "last_modified":r.add(f.lastModified());break;default:r.add(0);}}
        private String[] columns(String[] p){return p==null?new String[]{"document_id","_display_name","mime_type","_size","last_modified"}:p;}
        public Cursor queryRoots(String[] p){return new MatrixCursor(p==null?new String[]{"root_id"}:p);}
        public Cursor queryDocument(String id,String[] p)throws FileNotFoundException{MatrixCursor c=new MatrixCursor(columns(p));row(c,id);return c;}
        public Cursor queryChildDocuments(String id,String[] p,String order)throws FileNotFoundException{MatrixCursor c=new MatrixCursor(columns(p));File[] files=file(id).listFiles();if(files!=null)for(File f:files)if(f.getName().endsWith(".png"))row(c,f.getName());return c;}
        public ParcelFileDescriptor openDocument(String id,String mode,CancellationSignal signal)throws FileNotFoundException{if(!mode.equals("r"))throw new FileNotFoundException("read only");return ParcelFileDescriptor.open(file(id),ParcelFileDescriptor.MODE_READ_ONLY);}
        public boolean isChildDocument(String parent,String child){return parent.equals("root")&&child.matches("[a-zA-Z0-9.-]+");}
    }
}
