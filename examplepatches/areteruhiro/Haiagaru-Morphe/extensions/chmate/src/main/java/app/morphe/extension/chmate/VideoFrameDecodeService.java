package app.morphe.extension.chmate;

import android.app.Service;
import android.content.*;
import android.os.*;
import android.os.Process;
import java.io.*;
import java.util.concurrent.*;

/** Same-UID, non-exported decoder process contains native media crashes. */
public final class VideoFrameDecodeService extends Service {
    public static boolean decoderProcess(Context context){
        String name=null;
        if(Build.VERSION.SDK_INT>=28)name=android.app.Application.getProcessName();
        else try{android.app.ActivityManager manager=(android.app.ActivityManager)context.getSystemService(Context.ACTIVITY_SERVICE);for(android.app.ActivityManager.RunningAppProcessInfo process:manager.getRunningAppProcesses())if(process.pid==Process.myPid()){name=process.processName;break;}}catch(RuntimeException ignored){}
        return name!=null&&name.equals(context.getPackageName()+":haiagaru_video_decoder");
    }
    static boolean blocked(Context context){
        SharedPreferences health=context.getSharedPreferences("haiagaru-video-decoder-health",0);
        if(health.getInt("decoderRevision",0)!=4){health.edit().putBoolean("unsafe",false).putInt("decoderRevision",4).commit();return false;}
        if(!health.getBoolean("unsafe",false))return false;
        // Native framework state can recover after reboot. Never permanently disable previews.
        long boot=System.currentTimeMillis()-SystemClock.elapsedRealtime();
        long previous=health.getLong("boot",0);
        if(previous==0||Math.abs(boot-previous)>120000){health.edit().putBoolean("unsafe",false).putLong("boot",boot).commit();return false;}
        long since=health.getLong("unsafeSince",0),now=SystemClock.elapsedRealtime();
        // OS memory kills are not a reason to disable all future videos until reboot.
        // Retain a cooldown after interruptions; the serial worker prevents concurrent decoders.
        if(since<=0||now<since||now-since>=60000){health.edit().putBoolean("unsafe",false).commit();return false;}
        return true;
    }
    private final ExecutorService worker=Executors.newSingleThreadExecutor();
    private final Messenger messenger=new Messenger(new Handler(Looper.getMainLooper(),message->{
        Bundle data=message.getData();Messenger reply=message.replyTo;
        worker.execute(()->{boolean ok=false;VideoThumbnailFailure failure=new VideoThumbnailFailure(VideoThumbnailFailure.DECODE);try{
            File root=new File(getCacheDir(),"haiagaru-video-frames").getCanonicalFile();
            File output=new File(data.getString("output")).getCanonicalFile();
            if(!root.equals(output.getParentFile())||!output.getName().startsWith("preview-"))throw new IOException("Invalid decoder path");
            if(data.containsKey("url")) {
                long budget=data.getLong("budget"),timeout=data.getLong("timeout");
                if(budget<1||budget>1024L*1024*1024||timeout<1||timeout>600000)throw new IOException("Invalid remote decoder limits");
                ok=VideoFrameThumbnail.decodeRemote(this,data.getString("url"),output,data.getBoolean("four"),data.getInt("minimum"),data.getInt("count"),budget,timeout,data.getBoolean("wifiOnly"));
            } else {
                File input=new File(data.getString("input")).getCanonicalFile();
                if(!root.equals(input.getParentFile())||!input.getName().startsWith("frame-"))throw new IOException("Invalid decoder input");
                ok=VideoFrameThumbnail.decodeFile(input,output,data.getBoolean("four"),data.getInt("minimum"),data.getInt("count"));
            }
        }catch(Exception|OutOfMemoryError error){failure=VideoThumbnailFailure.from(error);android.util.Log.w("HaiagaruMedia","Decoder failed",error);}
        try{Message result=Message.obtain();result.arg1=ok?1:0;result.arg2=failure.kind;Bundle detail=new Bundle();detail.putInt("value",failure.value);result.setData(detail);reply.send(result);}catch(Exception ignored){}
        });return true;
    }));
    @Override public IBinder onBind(Intent intent){return messenger.getBinder();}
    @Override public void onDestroy(){worker.shutdownNow();super.onDestroy();}

    private static VideoThumbnailFailure interrupted(Context context,long started){
        if(Build.VERSION.SDK_INT>=30)try{
            android.app.ActivityManager manager=(android.app.ActivityManager)context.getSystemService(Context.ACTIVITY_SERVICE);
            for(android.app.ApplicationExitInfo exit:manager.getHistoricalProcessExitReasons(context.getPackageName(),0,8)){
                if(!exit.getProcessName().equals(context.getPackageName()+":haiagaru_video_decoder")||exit.getTimestamp()<started-1000)continue;
                if(exit.getReason()==android.app.ApplicationExitInfo.REASON_LOW_MEMORY)return new VideoThumbnailFailure(VideoThumbnailFailure.MEMORY);
                if(exit.getReason()==android.app.ApplicationExitInfo.REASON_CRASH||exit.getReason()==android.app.ApplicationExitInfo.REASON_CRASH_NATIVE)return new VideoThumbnailFailure(VideoThumbnailFailure.DECODE);
                break;
            }
        }catch(RuntimeException ignored){}
        return new VideoThumbnailFailure(VideoThumbnailFailure.STOPPED);
    }

    static boolean decode(Context context,File input,File output,boolean four,int minimum,int count)throws Exception{
        Bundle data=new Bundle();data.putString("input",input.getAbsolutePath());
        return decode(context,data,output,four,minimum,count);
    }
    static boolean decodeRemote(Context context,String url,File output,boolean four,int minimum,int count,long budget,long timeout,boolean wifiOnly)throws Exception{
        Bundle data=new Bundle();data.putString("url",url);data.putLong("budget",budget);data.putLong("timeout",timeout);data.putBoolean("wifiOnly",wifiOnly);
        return decode(context,data,output,four,minimum,count);
    }
    private static boolean decode(Context context,Bundle data,File output,boolean four,int minimum,int count)throws Exception{
        data.putString("output",output.getAbsolutePath());data.putBoolean("four",four);data.putInt("minimum",minimum);data.putInt("count",count);
        SharedPreferences health=context.getSharedPreferences("haiagaru-video-decoder-health",0);
        // A pending request surviving process death means a crash/timeout, not permission to retry indefinitely.
        if(blocked(context))throw new VideoThumbnailFailure(VideoThumbnailFailure.STOPPED);
        if(!health.edit().putBoolean("unsafe",true).putLong("unsafeSince",SystemClock.elapsedRealtime()).putLong("boot",System.currentTimeMillis()-SystemClock.elapsedRealtime()).commit())throw new VideoThumbnailFailure(VideoThumbnailFailure.STORAGE);
        CountDownLatch done=new CountDownLatch(1);boolean[] result={false},responded={false};
        long started=System.currentTimeMillis();
        int[] failure={VideoThumbnailFailure.DECODE,0};
        Messenger receiver=new Messenger(new Handler(Looper.getMainLooper(),message->{result[0]=message.arg1==1;failure[0]=message.arg2;failure[1]=message.getData().getInt("value");responded[0]=true;done.countDown();return true;}));
        ServiceConnection connection=new ServiceConnection(){
            public void onServiceConnected(ComponentName name,IBinder binder){try{Message request=Message.obtain();request.setData(data);request.replyTo=receiver;new Messenger(binder).send(request);}catch(Exception error){done.countDown();}}
            public void onServiceDisconnected(ComponentName name){done.countDown();}
            public void onBindingDied(ComponentName name){done.countDown();}
            public void onNullBinding(ComponentName name){done.countDown();}
        };
        boolean bound=false;
        try{
            bound=context.bindService(new Intent(context,VideoFrameDecodeService.class),connection,Context.BIND_AUTO_CREATE|Context.BIND_IMPORTANT);
            if(!bound){health.edit().putBoolean("unsafe",false).commit();throw new VideoThumbnailFailure(VideoThumbnailFailure.STOPPED);}
            if(!done.await(45,TimeUnit.SECONDS))throw new VideoThumbnailFailure(VideoThumbnailFailure.TIMEOUT);
            if(responded[0])health.edit().putBoolean("unsafe",false).commit();
            else throw interrupted(context,started);
            if(!result[0])throw new VideoThumbnailFailure(failure[0],failure[1]);
            return output.isFile()&&output.length()>0;
        }finally{if(bound)context.unbindService(connection);}
    }
}
