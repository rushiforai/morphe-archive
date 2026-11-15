package app.morphe.extension.chmate;

import android.app.ActivityManager;
import android.app.ApplicationExitInfo;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

/** Android-confirmed ANR exits, imported on next startup without blocking main. */
final class AnrLogs {
    static void collect(Context context){
        if(Build.VERSION.SDK_INT<30||!context.getPackageName().equals(android.app.Application.getProcessName()))return;
        new Thread(()->read(context),"Haiagaru-ANR-log").start();
    }
    private static void read(Context context){
        try{
            ActivityManager manager=(ActivityManager)context.getSystemService(Context.ACTIVITY_SERVICE);
            if(manager==null)return;
            SharedPreferences saved=context.getSharedPreferences("haiagaru-anr-log",0);
            List<ApplicationExitInfo> exits=manager.getHistoricalProcessExitReasons(context.getPackageName(),0,32);
            Set<String> done=new HashSet<>(saved.getStringSet("recorded",Collections.emptySet()));
            for(ApplicationExitInfo exit:exits){
                if(exit.getReason()!=ApplicationExitInfo.REASON_ANR)continue;
                String key=exit.getTimestamp()+":"+exit.getPid()+":"+exit.getProcessName();if(done.contains(key))continue;
                StringBuilder report=new StringBuilder("Haiagaru ANR log\nType: Android confirmed ANR exit\n");
                try{report.append("Installed version at collection: ").append(context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName).append("\n");}catch(Exception ignored){}
                report.append("Time: ").append(new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ",Locale.US).format(new Date(exit.getTimestamp()))).append("\nPackage: ").append(context.getPackageName())
                    .append("\nProcess: ").append(exit.getProcessName()).append("\nPID: ").append(exit.getPid())
                    .append("\nAndroid: ").append(Build.VERSION.RELEASE).append("\nDevice: ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL)
                    .append("\nDescription: ").append(exit.getDescription()).append("\nRecorded on next startup; this is not a Java exception.\n\n");
                try(InputStream input=exit.getTraceInputStream()){
                    if(input==null)report.append("Android did not retain an ANR trace.\n");
                    else{ByteArrayOutputStream bytes=new ByteArrayOutputStream();byte[] buffer=new byte[8192];int n;while(bytes.size()<1024*1024&&(n=input.read(buffer,0,Math.min(buffer.length,1024*1024-bytes.size())))!=-1)bytes.write(buffer,0,n);report.append(new String(bytes.toByteArray(),StandardCharsets.UTF_8));if(bytes.size()==1024*1024)report.append("\n[Trace limited to 1 MiB]\n");}
                }catch(IOException unavailable){report.append("ANR trace unavailable.\n");}
                Haiagaru.writeDownloadLog(context,"chmate-anr-"+exit.getTimestamp()+"-"+exit.getPid()+".txt",report.toString());
                done.add(key);
            }
            if(done.size()>128){ArrayList<String> keys=new ArrayList<>(done);Collections.sort(keys);done=new HashSet<>(keys.subList(keys.size()-128,keys.size()));}
            saved.edit().putStringSet("recorded",done).apply();
        }catch(Exception error){android.util.Log.w("Haiagaru","Unable to collect ANR exit logs",error);}
    }
    private AnrLogs(){}
}
