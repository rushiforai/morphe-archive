package app.morphe.extension.chmate;

import android.app.Activity;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;

/** Complements reporter metadata only. This class never creates an NG rule. */
final class ReporterArchiveLookup {
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor();
    private static final Set<Long> pending=new HashSet<>();
    private static final Map<Long,Long> checked=new LinkedHashMap<>();
    private static long retryAfter;
    static void opened(Object fragment){
        if(!EdgeReporterOptions.menu())return;
        try{
            Activity a=Haiagaru.toolbarActivity(fragment);if(a==null)return;
            String version=a.getPackageManager().getPackageInfo(a.getPackageName(),0).versionName;
            String url=NativeThreadContext.url(NativeThreadContext.board(fragment,version),version,1);
            URI uri=new URI(url);ThreadWatchRules.Target target=ThreadWatchRules.target(url);
            if(target!=null&&uri.getPath().startsWith("/test/read.cgi/liveedge/"))request(a,uri.getHost(),"liveedge",Long.valueOf(target.id),null);
        }catch(Exception ignored){/* Unknown native state must not guess a thread. */}
    }
    static void request(Activity activity,String server,String board,Object id,String title){
        if(!EdgeReporterOptions.menu()||!"liveedge".equals(board)||server==null
                ||!server.equalsIgnoreCase("bbs.eddibb.cc"))return;
        final long thread;
        try{thread=Long.parseLong(String.valueOf(id));}catch(Exception invalid){return;}
        if(thread<100000000L||thread>System.currentTimeMillis()/1000L+86400)return;
        String stored=EdgeReporterHistory.archiveSuffix(thread);
        if(stored!=null){if(title!=null)EdgeReporterHistory.rememberArchive(thread,title,stored);return;}
        synchronized(pending){long now=System.currentTimeMillis();if(pending.size()>=8||pending.contains(thread)||now<retryAfter||now-checked.getOrDefault(thread,0L)<6*3600000L)return;pending.add(thread);}
        File directory=activity.getCacheDir();
        WORKER.execute(()->{
            try{
                File csv=source(directory);ReporterSearch.Row row;
                try(Reader input=new InputStreamReader(new FileInputStream(csv),StandardCharsets.UTF_8)){row=ReporterSearch.lookup(input,thread);}
                if(row!=null){String suffix="["+row.id+"★]";EdgeReporterHistory.rememberArchive(thread,row.title,suffix);if(title!=null)EdgeReporterHistory.rememberArchive(thread,title,suffix);}
                synchronized(pending){checked.put(thread,System.currentTimeMillis());while(checked.size()>256)checked.remove(checked.keySet().iterator().next());}
            }catch(Exception unavailable){synchronized(pending){retryAfter=System.currentTimeMillis()+60000L;}}
            finally{synchronized(pending){pending.remove(thread);}}
        });
    }
    private static File source(File directory)throws IOException{
        File csv=new File(directory,"haiagaru-reporter-log.csv");
        if(csv.isFile()&&System.currentTimeMillis()-csv.lastModified()<6*3600000L)return csv;
        File temp=new File(directory,"haiagaru-reporter-log.tmp");HttpURLConnection connection=null;
        try{
            connection=(HttpURLConnection)new URL(ReporterSearch.SOURCE).openConnection();connection.setConnectTimeout(15000);connection.setReadTimeout(30000);
            if(connection.getResponseCode()!=200)throw new IOException("Reporter log unavailable");
            try(InputStream input=connection.getInputStream();OutputStream output=new FileOutputStream(temp)){
                byte[] bytes=new byte[8192];int read;long size=0;
                while((read=input.read(bytes))!=-1){size+=read;if(size>64L*1024*1024)throw new IOException("Reporter log too large");output.write(bytes,0,read);}
            }
            // Check the CSV schema before replacing the last good cache.
            try(Reader input=new InputStreamReader(new FileInputStream(temp),StandardCharsets.UTF_8)){ReporterSearch.lookup(input,100000000L);}
            if(!temp.renameTo(csv))throw new IOException("Reporter cache unavailable");return csv;
        }finally{if(connection!=null)connection.disconnect();if(temp.exists())temp.delete();}
    }
    private ReporterArchiveLookup(){}
}
