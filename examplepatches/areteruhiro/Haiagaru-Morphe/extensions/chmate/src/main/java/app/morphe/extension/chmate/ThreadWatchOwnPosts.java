package app.morphe.extension.chmate;

import android.content.Context;
import java.io.*;
import java.util.*;

/** Read-only native own-post flags; never changes DAT, index or posting history. */
final class ThreadWatchOwnPosts {
    static Set<Integer> read(Context context,ThreadWatchRules.Target target)throws Exception{
        String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
        Class<?> type=Class.forName("jp.syoboi.a2chMate.client.BBSUrlInfo",false,context.getClassLoader());
        Object info=type.getMethod(version.contains("242")?"d":"c",String.class).invoke(null,target.url);
        if(info==null)throw new IOException("Thread unavailable");
        String board=RefreshTargets.nativeBoard(info,version).toString();
        if(board.contains("/")||board.contains("\\")||board.contains(".."))throw new IOException("Invalid native board identity");
        File file=new File(new File(HaiagaruSyncSnapshot.externalRoot(context),"dat"),board+"_"+target.id+".idx");
        if(!file.isFile())return Collections.emptySet();
        if(file.length()>2*1024*1024)throw new IOException("Index too large");
        try(BufferedReader reader=new BufferedReader(new InputStreamReader(new FileInputStream(file),java.nio.charset.StandardCharsets.UTF_8))){
            reader.readLine();return ThreadWatchRules.ownPosts(reader.readLine());
        }
    }
    private ThreadWatchOwnPosts(){}
}
