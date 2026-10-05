package e.e.a;

import android.app.*;
import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;
import android.preference.*;
import android.provider.DocumentsContract;
import android.widget.Toast;
import java.io.*;
import java.util.*;

/** A persisted SAF grant, never a guessed shared-storage filesystem path. */
public final class CacheFolders {
    static volatile Context context;
    private static final String KEY="cache_tree_uri", PREFIX="/@nicoid-cache/", SUFFIX="/nicoid/nicoid_cache";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    static SharedPreferences prefs(){return PreferenceManager.getDefaultSharedPreferences(context);}
    static void init(Context c){context=c.getApplicationContext();}
    static String privatePath(String path){if(path!=null&&context!=null&&path.startsWith(PREFIX)){int start=path.indexOf('/',PREFIX.length());if(start>=0){String relative=path.substring(start);if(relative.startsWith("/nicoid/")&&!relative.startsWith(SUFFIX))return privateRoot(context)+relative;}}return path;}
    public static void started(Context c){init(c);UiStrings.selectLanguage(prefs().getString("app_lang","0"));MAIN.post(()->Toast.makeText(c,UiStrings.translate("キャッシュ取得を開始しました"),Toast.LENGTH_SHORT).show());}
    public static String privateRoot(Context c){init(c);File base=c.getExternalFilesDir(null);return (base==null?c.getFilesDir():base).getAbsolutePath();}
    public static String root(Context c) {
        init(c);String tree=prefs().getString(KEY,"");
        if(tree.isEmpty()){File old=c.getExternalFilesDir(null);return (old==null?c.getFilesDir():old).getAbsolutePath();}
        String key=key(tree);prefs().edit().putString("cache_tree_"+key,tree).apply();return PREFIX+key;
    }
    private static String key(String tree) {
        try{byte[] bytes=java.security.MessageDigest.getInstance("SHA-256").digest(tree.getBytes("UTF-8"));StringBuilder s=new StringBuilder();for(byte b:bytes)s.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return s.toString();}catch(Exception e){throw new IllegalStateException(e);}
    }
    static boolean virtual(File f){return f.getAbsolutePath().startsWith(PREFIX);}
    static Uri tree(File f) throws FileNotFoundException {
        String path=f.getAbsolutePath();int end=path.indexOf('/',PREFIX.length());String key=end<0?path.substring(PREFIX.length()):path.substring(PREFIX.length(),end);
        String tree=prefs().getString("cache_tree_"+key,"");if(tree.isEmpty())throw new FileNotFoundException("Cache folder not selected");return Uri.parse(tree);
    }
    static String relative(File f) throws FileNotFoundException {
        String path=f.getAbsolutePath();int start=path.indexOf(SUFFIX,PREFIX.length());if(start<0)throw new FileNotFoundException("Not a video cache path");
        String name=path.substring(start+SUFFIX.length());if(name.startsWith("/"))name=name.substring(1);
        if(name.contains("/")||name.equals("..")||name.equals("."))throw new FileNotFoundException("Invalid cache path");return name;
    }
    private static final class Index {long refreshed;final Map<String,Uri> files=new HashMap<>();}
    private static final Map<String,Index> indexes=new LinkedHashMap<String,Index>(8,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,Index> e){return size()>8;}};
    static synchronized void forget(File f){try{Index i=indexes.get(tree(f).toString());if(i!=null)i.files.remove(relative(f));}catch(IOException ignored){}}
    static synchronized void remember(File f,Uri uri){try{Index i=indexes.get(tree(f).toString());if(i!=null)i.files.put(relative(f),uri);}catch(IOException ignored){}}
    static synchronized Uri document(File f,boolean create) throws IOException {
        Uri tree=tree(f),parent=DocumentsContract.buildDocumentUriUsingTree(tree,DocumentsContract.getTreeDocumentId(tree));String name=relative(f);
        if(name.isEmpty())return parent;
        Index index=indexes.get(tree.toString());long now=SystemClock.elapsedRealtime();
        if(index==null||now-index.refreshed>2000){index=new Index();for(Entry e:cacheChildren(parent,tree))index.files.put(e.name,e.uri);index.refreshed=now;indexes.put(tree.toString(),index);}
        Uri found=index.files.get(name);if(found!=null)return found;
        if(!create)return null;
        String id=videoId(name);String physical=physicalName(name);
        if(id!=null){Uri directory=null;for(Entry e:children(parent,tree))if(e.name.equals(id)&&DocumentsContract.Document.MIME_TYPE_DIR.equals(e.mime))directory=e.uri;
            if(directory==null)directory=DocumentsContract.createDocument(context.getContentResolver(),parent,DocumentsContract.Document.MIME_TYPE_DIR,id);
            if(directory==null)throw new IOException("Cannot create video cache folder");parent=directory;
            boolean hidden=false;for(Entry e:children(parent,tree))if(e.name.equals(".nomedia"))hidden=true;
            if(!hidden)DocumentsContract.createDocument(context.getContentResolver(),parent,"application/octet-stream",".nomedia");
        }
        Uri made=DocumentsContract.createDocument(context.getContentResolver(),parent,mime(physical),physical);
        if(made==null)throw new IOException("Cannot create cache file");index.files.put(name,made);return made;
    }
    static String videoId(String name){java.util.regex.Matcher m=java.util.regex.Pattern.compile("^((?:sm|so|nm|ss)[0-9]+)(?:[._].*)?$").matcher(name);return m.matches()?m.group(1):null;}
    static String physicalName(String name){return videoId(name)!=null&&name.endsWith(".mp4")?name.substring(0,name.length()-4)+".complete":name;}
    static List<Entry> cacheChildren(Uri parent,Uri tree)throws IOException{LinkedHashMap<String,Entry> result=new LinkedHashMap<>();List<Entry> all=children(parent,tree);
        for(Entry e:all)if(!DocumentsContract.Document.MIME_TYPE_DIR.equals(e.mime)&&videoId(e.name)!=null)result.put(e.name,e);
        for(Entry e:all)if(DocumentsContract.Document.MIME_TYPE_DIR.equals(e.mime)&&e.name.matches("(?:sm|so|nm|ss)[0-9]+"))for(Entry child:children(e.uri,tree)){if(child.name.equals(".nomedia"))continue;if(child.name.endsWith(".complete"))child.name=child.name.substring(0,child.name.length()-9)+".mp4";result.put(child.name,child);}
        return new ArrayList<>(result.values());
    }
    private static final Map<String,String> comments=new LinkedHashMap<String,String>(4,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,String> e){return size()>4;}};
    public static boolean comments(String folder,String id,String json){if(json!=null&&json.length()<2000000)synchronized(comments){comments.put(id,json);}return saveComments(folder,id);}
    static void exportComments(String folder,String id){String json;synchronized(comments){json=comments.get(id);}if(json==null)return;try(OutputStream out=new CacheOutputStream(new CacheFile(folder,id+".comments.json"))){out.write(json.getBytes("UTF-8"));}catch(IOException e){android.util.Log.w("nicoid-cache","Cannot save cached comments",e);}}
    public static boolean saveComments(String folder,String id){return new CacheFile(folder,id+".json").exists()||new CacheFile(folder,id+".mp4").exists()||new CacheFile(folder,id+".ncache").exists();}
    static String mime(String n){return n.endsWith(".m3u8")?"application/vnd.apple.mpegurl":n.endsWith(".json")?"application/json":n.endsWith(".mp4")?"video/mp4":"application/octet-stream";}
    static final class Entry {Uri uri;String name,mime;long size,time;}
    static List<Entry> children(Uri parent,Uri tree) throws IOException {
        ArrayList<Entry> result=new ArrayList<>();Uri uri=DocumentsContract.buildChildDocumentsUriUsingTree(tree,DocumentsContract.getDocumentId(parent));
        String[] columns={"document_id","_display_name","mime_type","_size","last_modified"};
        try(Cursor cursor=context.getContentResolver().query(uri,columns,null,null,null)) {
            if(cursor==null)throw new IOException("Cache folder unavailable");
            while(cursor.moveToNext()){Entry e=new Entry();e.uri=DocumentsContract.buildDocumentUriUsingTree(tree,cursor.getString(0));e.name=cursor.getString(1);e.mime=cursor.getString(2);e.size=cursor.getLong(3);e.time=cursor.getLong(4);result.add(e);}
        }catch(RuntimeException e){throw new IOException("Cache folder unavailable",e);}return result;
    }
    static Entry stat(File f) throws IOException {
        Uri u=document(f,false);if(u==null){CachePackIndex.Entry packed=CachePack.entry(f);if(packed==null)return null;Entry e=new Entry();e.name=f.getName();e.mime=mime(e.name);e.size=packed.size;e.time=packed.time;return e;}Entry e=new Entry();e.uri=u;e.name=f.getName();
        try(Cursor c=context.getContentResolver().query(u,new String[]{"mime_type","_size","last_modified"},null,null,null)){
            if(c==null||!c.moveToFirst()){forget(f);return null;}e.mime=c.getString(0);e.size=c.getLong(1);e.time=c.getLong(2);return e;
        }catch(RuntimeException x){throw new IOException(x);}
    }
    static ParcelFileDescriptor open(File f,boolean write,boolean append) throws FileNotFoundException {
        try {
            if(!virtual(f)){
                if(write&&f.getAbsolutePath().contains("/nicoid/nicoid_cache/")&&prefs().getString(KEY,"").isEmpty())throw new IOException("Select a cache folder in settings");
                return ParcelFileDescriptor.open(f,write?ParcelFileDescriptor.MODE_WRITE_ONLY|ParcelFileDescriptor.MODE_CREATE|(append?ParcelFileDescriptor.MODE_APPEND:ParcelFileDescriptor.MODE_TRUNCATE):ParcelFileDescriptor.MODE_READ_ONLY);
            }
            Uri uri=document(f,write);if(uri==null)throw new IOException("Missing cached file");ParcelFileDescriptor fd=context.getContentResolver().openFileDescriptor(uri,write?(append?"wa":"wt"):"r");if(fd==null)throw new IOException("Cannot open cached file");return fd;
        }catch(IOException|RuntimeException e){FileNotFoundException failure=new FileNotFoundException(e.getMessage());failure.initCause(e);throw failure;}
    }
    public static void settings(PreferenceActivity a) {
        init(a);Preference old=a.findPreference("cache_dir");
        if(old instanceof ListPreference){PreferenceGroup parent=parent(a.getPreferenceScreen(),old);if(parent!=null){Preference p=new Preference(a);p.setKey("cache_dir");p.setTitle(UiStrings.translate("キャッシュ保存先"));p.setOrder(old.getOrder());parent.removePreference(old);parent.addPreference(p);old=p;}}
        if(old!=null){old.setOnPreferenceClickListener(p->{choose(a,null);return true;});summary(a);}
    }
    private static PreferenceGroup parent(PreferenceGroup group,Preference p){for(int i=0;i<group.getPreferenceCount();i++){Preference child=group.getPreference(i);if(child==p)return group;if(child instanceof PreferenceGroup){PreferenceGroup found=parent((PreferenceGroup)child,p);if(found!=null)return found;}}return null;}
    public static void summary(PreferenceActivity a) {
        init(a);Preference p=a.findPreference("cache_dir");if(p==null)return;String tree=prefs().getString(KEY,"");
        String label=tree.isEmpty()?UiStrings.translate("未選択（推奨: Movies/nicoid）"):DocumentsContract.getTreeDocumentId(Uri.parse(tree));p.setSummary(UiStrings.translate("保存先: ")+label);
    }
    private static Activity activity(Context c){while(c instanceof ContextWrapper){if(c instanceof Activity)return (Activity)c;Context next=((ContextWrapper)c).getBaseContext();if(next==c)break;c=next;}return c instanceof Activity?(Activity)c:null;}
    private static boolean ready(){try{String s=prefs().getString(KEY,"");if(s.isEmpty())return false;Uri tree=Uri.parse(s);Uri root=DocumentsContract.buildDocumentUriUsingTree(tree,DocumentsContract.getTreeDocumentId(tree));children(root,tree);return true;}catch(Exception e){return false;}}
    public static ComponentName startService(Context c,Intent intent) {return service(c,intent,false);}
    public static ComponentName startForegroundService(Context c,Intent intent) {return service(c,intent,true);}
    private static ComponentName service(Context c,Intent intent,boolean foreground) {
        init(c);ComponentName target=intent.getComponent();
        if(target!=null&&target.getClassName().equals("com.sauzask.nicoid.NicoidDownloadCache")&&!ready()){
            Activity a=activity(c);if(a!=null)choose(a,new Intent(intent));else Toast.makeText(c,UiStrings.translate("設定でキャッシュ保存先を選択してください"),Toast.LENGTH_LONG).show();return null;
        }
        return foreground&&Build.VERSION.SDK_INT>=26?c.startForegroundService(intent):c.startService(intent);
    }
    static void choose(Activity a,Intent pending) {
        if(a.isFinishing())return;android.app.Fragment existing=a.getFragmentManager().findFragmentByTag("cache-folder-picker");
        Picker p=existing instanceof Picker?(Picker)existing:new Picker();p.pending=pending;
        if(existing==null)a.getFragmentManager().beginTransaction().add(p,"cache-folder-picker").commit();
        a.getFragmentManager().executePendingTransactions();p.pick();
    }
    public static final class Picker extends android.app.Fragment {
        Intent pending;boolean picking;
        @Override public void onCreate(Bundle state){super.onCreate(state);if(state!=null){pending=state.getParcelable("pending");picking=state.getBoolean("picking");}}
        @Override public void onSaveInstanceState(Bundle state){super.onSaveInstanceState(state);state.putParcelable("pending",pending);state.putBoolean("picking",picking);}
        void pick(){if(picking)return;picking=true;Intent i=new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);i.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_WRITE_URI_PERMISSION|Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION|Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
            if(Build.VERSION.SDK_INT>=26)i.putExtra(DocumentsContract.EXTRA_INITIAL_URI,Uri.parse("content://com.android.externalstorage.documents/document/primary%3AMovies"));
            try{startActivityForResult(i,41);}catch(ActivityNotFoundException e){picking=false;Toast.makeText(getActivity(),UiStrings.translate("フォルダー選択画面を開けませんでした"),1).show();}}
        @Override public void onActivityResult(int request,int result,Intent data){
            super.onActivityResult(request,result,data);if(request!=41)return;picking=false;Activity a=getActivity();if(a==null||result!=Activity.RESULT_OK||data==null||data.getData()==null){pending=null;return;}
            init(a);try{
                Uri tree=data.getData();int flags=data.getFlags()&(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
                if(flags!=(Intent.FLAG_GRANT_READ_URI_PERMISSION|Intent.FLAG_GRANT_WRITE_URI_PERMISSION))throw new IOException("Read/write grant required");
                a.getContentResolver().takePersistableUriPermission(tree,flags);
                Uri root=DocumentsContract.buildDocumentUriUsingTree(tree,DocumentsContract.getTreeDocumentId(tree));
                Uri probe=DocumentsContract.createDocument(a.getContentResolver(),root,"application/octet-stream",".nicoid-test-"+UUID.randomUUID());
                if(probe==null)throw new IOException("Folder is not writable");if(!DocumentsContract.deleteDocument(a.getContentResolver(),probe))throw new IOException("Folder is not writable");
                String before=prefs().getString(KEY,"");if(!prefs().edit().putString(KEY,tree.toString()).putString("cache_tree_"+key(tree.toString()),tree.toString()).commit())throw new IOException("Cannot save folder grant");
                if(a instanceof PreferenceActivity)summary((PreferenceActivity)a);
                Intent download=pending;pending=null;if(download!=null)service(a,download,Build.VERSION.SDK_INT>=26);
                if(!tree.toString().equals(before))offerCopy(a,before);
            }catch(Exception e){Toast.makeText(a,UiStrings.translate("保存先を使用できません。別のフォルダーを選択してください"),1).show();}
        }
    }
    static void offerCopy(Activity a,String previous) {
        File old=previous.isEmpty()?new File(a.getExternalFilesDir(null),"nicoid/nicoid_cache"):new CacheFile(PREFIX+key(previous)+SUFFIX);
        AlertDialog dialog=new AlertDialog.Builder(PlaybackSession.dialogContext(a)).setTitle(UiStrings.translate("既存キャッシュをコピー"))
            .setMessage(UiStrings.translate("以前の保存先からコピーします。元のファイルは削除しません"))
            .setPositiveButton(UiStrings.translate("コピー"),(d,w)->copy(a,old))
            .setNegativeButton(UiStrings.translate("後で"),null).create();dialog.show();PlaybackSession.styleDialog(dialog);
    }
    private static int copyOrder(String name){return name.endsWith(".json")?2:name.endsWith(".mp4")?1:0;}
    private static void copy(Activity a,File old) {
        String destination=root(a)+SUFFIX;ProgressDialog progress=new ProgressDialog(a);progress.setMessage(UiStrings.translate("キャッシュをコピー中"));progress.setCancelable(false);progress.show();
        android.widget.ProgressBar bar=progress.findViewById(android.R.id.progress);if(bar!=null){android.util.TypedValue color=new android.util.TypedValue();bar.getContext().getTheme().resolveAttribute(0x7f03005e,color,true);int tint=color.resourceId==0?color.data:bar.getResources().getColor(color.resourceId);bar.setIndeterminateTintList(android.content.res.ColorStateList.valueOf(tint));}
        new Thread(()->{boolean ok=false;try{File[] files=old.listFiles();if(files==null)throw new IOException("Cannot list old cache");Arrays.sort(files,(x,y)->Integer.compare(copyOrder(x.getName()),copyOrder(y.getName())));for(File f:files){if(!f.isFile())continue;File dest=new CacheFile(destination,f.getName());if(dest.exists())continue;File temp=new CacheFile(destination,f.getName()+".copy-"+UUID.randomUUID());
            boolean complete=false;try(InputStream in=virtual(f)?new CacheInputStream(f):new FileInputStream(f);OutputStream out=new CacheOutputStream(temp)){byte[] b=new byte[65536];int n;while((n=in.read(b))!=-1)out.write(b,0,n);complete=true;}finally{if(!complete)temp.delete();}if(!temp.renameTo(dest)){temp.delete();throw new IOException("Cannot finalize cache copy");}}
            ok=true;}catch(Exception e){android.util.Log.w("nicoid-cache","Cache copy failed",e);}boolean success=ok;MAIN.post(()->{if(!a.isFinishing()){progress.dismiss();Toast.makeText(a,UiStrings.translate(success?"キャッシュのコピーが完了しました":"コピーに失敗しました。元のファイルは保持されています"),1).show();}});},"nicoid-cache-copy").start();
    }
}
