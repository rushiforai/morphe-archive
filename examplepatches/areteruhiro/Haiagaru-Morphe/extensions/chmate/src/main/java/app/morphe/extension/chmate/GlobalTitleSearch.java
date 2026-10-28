package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.*;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.*;
import android.text.Html;
import android.widget.*;
import java.io.*;
import java.net.*;
import java.nio.*;
import java.nio.charset.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

/** Supplements the native HOME all-board title search, only after an explicit query. */
public final class GlobalTitleSearch {
    static final String KEY="globalTitleSearchExternalBoards",BOARDS="globalTitleSearchBoards";
    private static final String PREFS="io.github.areteruhiro.chmate.haiagaru.ui-config";
    private static final Map<Object,Job> QUERIES=Collections.synchronizedMap(new WeakHashMap<>());
    private static final AtomicReference<Job> ACTIVE=new AtomicReference<>();
    private static final LinkedHashMap<String,Cached> CACHE=new LinkedHashMap<>(16,.75f,true);
    private static int cachedCharacters;
    private static final class Cached{final String text;final long until;Cached(String t){text=t;until=SystemClock.elapsedRealtime()+180000;}}
    static final class Board{final String url,title;Board(String u,String t){url=u;title=t==null||t.isBlank()?u:t;}}
    private static final class Job{
        final String query;final AtomicBoolean canceled=new AtomicBoolean();
        final Set<HttpURLConnection> connections=ConcurrentHashMap.newKeySet();
        ExecutorService executor;
        Job(String q){query=q;}
        void cancel(){
            canceled.set(true);ExecutorService e=executor;if(e!=null)e.shutdownNow();
            Runnable close=()->{for(HttpURLConnection c:connections)c.disconnect();};
            if(Looper.myLooper()==Looper.getMainLooper()&&!connections.isEmpty()){Thread t=new Thread(close,"Haiagaru-search-cancel");t.setDaemon(true);t.start();}else close.run();
        }
        boolean stopped(){return canceled.get()||Thread.currentThread().isInterrupted();}
    }
    public static void addSettings(LinearLayout root,Activity activity){
        SharedPreferences prefs=activity.getSharedPreferences(PREFS,0);
        LiveSettings.Toggle toggle=new LiveSettings.Toggle(activity);toggle.setText("全板検索に登録済みの外部板・bbspinkも含める");toggle.setChecked(prefs.getBoolean(KEY,false));root.addView(toggle);
        TextView help=new TextView(activity);help.setText("HOMEの「全板から検索」で、登録済みの外部板とbbspinkのスレタイトルも探します。各板のスレ一覧を取得するため追加通信が発生します。応答しない板がある場合は取得できた結果を表示します。検索結果の本文は、スレを開いたときに取得します。対象板の変更は次の検索から反映します。");help.setTextSize(13);root.addView(help);
        Button choose=new Button(activity);choose.setText("検索対象の外部板を選ぶ");choose.setOnClickListener(v->GlobalTitleSearchBoards.show(activity));root.addView(choose);
        toggle.setOnCheckedChangeListener((button,on)->{prefs.edit().putBoolean(KEY,on).apply();if(!on){Job job=ACTIVE.getAndSet(null);if(job!=null)job.cancel();}});
    }
    private static boolean enabled(Context c){return c!=null&&c.getSharedPreferences(PREFS,0).getBoolean(KEY,false);}
    public static void capture(Object provider,String query){
        Context context=Haiagaru.applicationContextForExtension();
        if(!enabled(context)||query==null||query.trim().isEmpty()||query.length()>512)return;
        Job job=new Job(query);Job old=ACTIVE.getAndSet(job);if(old!=null)old.cancel();QUERIES.put(provider,job);
    }
    /** Called on the native network worker, before its original TSV parser. */
    public static String extend(Object provider,String original){
        Job job=QUERIES.remove(provider);Context context=Haiagaru.applicationContextForExtension();
        if(job==null)return original;
        if(job.stopped()||!enabled(context)||Looper.myLooper()==Looper.getMainLooper()){job.cancel();ACTIVE.compareAndSet(job,null);return original;}
        try{return extend(context,job,original);}
        catch(Exception error){android.util.Log.w("HaiagaruSearch","External board search unavailable",error);return original;}
        finally{job.cancel();ACTIVE.compareAndSet(job,null);}
    }
    static ArrayList<Board> candidates(Context context)throws Exception{
        LinkedHashMap<String,Board> result=new LinkedHashMap<>();
        try(SQLiteDatabase db=SQLiteDatabase.openDatabase(context.getDatabasePath("roidon.sqlite").getPath(),null,SQLiteDatabase.OPEN_READONLY);
            Cursor rows=db.rawQuery("SELECT name,server,is_external,title FROM boards ORDER BY title",null)){
            while(rows.moveToNext()){
                try{
                    String name=URLDecoder.decode(rows.getString(0),"UTF-8"),path=name.contains("/")?name.substring(name.indexOf('/')+1):name;
                    BoardAddress board=BoardAddress.parse("https://"+rows.getString(1)+"/"+path+"/");
                    if(BoardAddress.externalRegistration(rows.getInt(2),board.url)||GlobalTitleSearchRules.pink(board.url))result.put(board.key(),new Board(board.url,rows.getString(3)));
                }catch(IllegalArgumentException ignored){}
            }
        }
        return new ArrayList<>(result.values());
    }
    static Set<String> selected(SharedPreferences prefs){
        String value=prefs.getString(BOARDS,"");if(value.isEmpty())return null;
        Set<String> result=new LinkedHashSet<>();try{org.json.JSONArray list=new org.json.JSONArray(value);for(int i=0;i<list.length();i++)result.add(BoardAddress.parse(list.getString(i)).url);}catch(Exception invalid){result.clear();}
        return result;
    }
    static boolean validSelection(String value){
        if(value.isEmpty())return true;if(value.length()>128*1024)return false;
        try{org.json.JSONArray list=new org.json.JSONArray(value);if(list.length()>2000)return false;for(int i=0;i<list.length();i++)BoardAddress.parse(list.getString(i));return true;}catch(Exception invalid){return false;}
    }
    private static ArrayList<Board> boards(Context context)throws Exception{
        ArrayList<Board> result=candidates(context);Set<String> selected=selected(context.getSharedPreferences(PREFS,0));
        if(selected!=null)result.removeIf(board->!selected.contains(board.url));return result;
    }
    private static String extend(Context context,Job job,String original)throws Exception{
        ArrayList<Board> boards=boards(context);if(boards.isEmpty())return original;
        job.executor=Executors.newFixedThreadPool(2,r->{Thread t=new Thread(r,"Haiagaru-title-search");t.setDaemon(true);return t;});
        CompletionService<String> finished=new ExecutorCompletionService<>(job.executor);
        for(Board board:boards)finished.submit(()->{
            if(job.stopped())throw new CancellationException();
            String subject=fetch(job,board.url),plainQuery=job.query;
            StringBuilder extra=new StringBuilder();
            GlobalTitleSearchRules.append(extra,subject,board.url,plainQuery,new HashSet<>(),text->Html.fromHtml(text).toString());
            return extra.toString();
        });
        String base=original==null?"":original;StringBuilder output=new StringBuilder(base);
        if(output.length()>0&&output.charAt(output.length()-1)!='\n')output.append('\n');
        Set<String> urls=new HashSet<>();GlobalTitleSearchRules.existing(base,urls);
        long deadline=SystemClock.elapsedRealtime()+30000;int complete=0,failed=0;
        while(complete<boards.size()&&!job.stopped()){
            long left=deadline-SystemClock.elapsedRealtime();if(left<=0)break;
            Future<String> future=finished.poll(Math.min(left,250),TimeUnit.MILLISECONDS);if(future==null)continue;complete++;
            try{
                String extra=future.get();for(String line:extra.split("\n")){
                    String[] parts=line.split("\t",-1);if(parts.length==3&&urls.add(GlobalTitleSearchRules.key(parts[2])))output.append(line).append('\n');
                    if(urls.size()>=5000||output.length()>=2*1024*1024)break;
                }
            }catch(ExecutionException|CancellationException error){failed++;}
            if(urls.size()>=5000||output.length()>=2*1024*1024)break;
        }
        if(!job.stopped()&&(failed>0||complete<boards.size())){
            String message="外部板検索："+(complete-failed)+"/"+boards.size()+"板を取得。取得できた結果を表示します";
            new Handler(Looper.getMainLooper()).post(()->{if(ACTIVE.get()==null||ACTIVE.get()==job)Toast.makeText(context,message,Toast.LENGTH_LONG).show();});
        }
        return job.stopped()?original:output.toString();
    }
    private static String fetch(Job job,String board)throws Exception{
        synchronized(CACHE){Cached old=CACHE.get(board);if(old!=null&&old.until>SystemClock.elapsedRealtime())return old.text;}
        HttpURLConnection connection=(HttpURLConnection)new URL(board+"subject.txt").openConnection();
        connection.setConnectTimeout(5000);connection.setReadTimeout(5000);connection.setInstanceFollowRedirects(true);
        job.connections.add(connection);
        try{
            if(job.stopped())throw new CancellationException();int status=connection.getResponseCode();if(status!=200)throw new IOException("HTTP "+status);
            ByteArrayOutputStream bytes=new ByteArrayOutputStream();
            try(InputStream input=connection.getInputStream()){
                byte[] buffer=new byte[8192];int count;while((count=input.read(buffer))!=-1){if(job.stopped())throw new CancellationException();if(bytes.size()+count>2*1024*1024)throw new IOException("Subject too large");bytes.write(buffer,0,count);}
            }
            byte[] raw=bytes.toByteArray();String type=connection.getContentType(),text;
            java.util.regex.Matcher charset=java.util.regex.Pattern.compile("charset\\s*=\\s*[\"']?([^;\\s\"']+)",java.util.regex.Pattern.CASE_INSENSITIVE).matcher(type==null?"":type);
            if(charset.find())text=new String(raw,Charset.forName(charset.group(1)));
            else try{text=StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(raw)).toString();}
            catch(CharacterCodingException legacy){text=new String(raw,Charset.forName("MS932"));}
            if(!text.isBlank()&&!text.matches("(?s).*\\d{9,12}\\.(?:dat<>|cgi,).*"))throw new IOException("Invalid subject response");
            synchronized(CACHE){
                Cached previous=CACHE.remove(board);if(previous!=null)cachedCharacters-=previous.text.length();
                CACHE.put(board,new Cached(text));cachedCharacters+=text.length();
                while(cachedCharacters>4*1024*1024||CACHE.size()>128){Iterator<Cached> values=CACHE.values().iterator();Cached first=values.next();cachedCharacters-=first.text.length();values.remove();}
            }
            return text;
        }finally{job.connections.remove(connection);connection.disconnect();}
    }
    private GlobalTitleSearch(){}
}
