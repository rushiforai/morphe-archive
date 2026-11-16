package app.morphe.extension.chmate;

import android.content.Context;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.regex.*;

/** Read-only native registration checks for notification DATs. No rule copies or writes. */
final class NotificationNg {
    static final String KEY="suppressNgReplyNotifications";
    private final Object board;
    private final Map<String,NativeNgStore> stores=new LinkedHashMap<>();
    private final Method match;
    private final Set<Integer> manual=new HashSet<>(),chained=new HashSet<>();
    private static final Pattern ID=Pattern.compile("(?:^|\\s)ID:([^\\s<>]+)");
    private static final Pattern ANCHOR=Pattern.compile(">>([1-9][0-9]{0,6})(?:-([1-9][0-9]{0,6}))?");
    static boolean enabled(Context context){return FeatureSwitches.prefs(context).getBoolean(KEY,true);}
    NotificationNg(Context context,ThreadWatchRules.Target target)throws Exception{
        String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
        Class<?> info=Class.forName("jp.syoboi.a2chMate.client.BBSUrlInfo",false,context.getClassLoader());
        Object parsed=info.getMethod(version.contains("242")?"d":"c",String.class).invoke(null,target.url);
        if(parsed==null)throw new IOException("Notification thread unavailable");
        board=RefreshTargets.nativeBoard(parsed,version);
        for(String kind:new String[]{"ID","NAME","WORD","BE","IMAGE"})stores.put(kind,new NativeNgStore(context,kind));
        NativeNgStore store=stores.get("ID");Method found=null;
        for(Method method:store.store.getClass().getMethods()){
            Class<?>[] args=method.getParameterTypes();
            if(method.getReturnType()==store.itemType&&args.length==2&&args[0]==String.class&&args[1].isInstance(board)){
                if(found!=null)throw new IllegalStateException("Ambiguous native NG matcher");
                found=method;
            }
        }
        if(found==null)throw new IllegalStateException("Native NG matcher unavailable");
        found.setAccessible(true);match=found;
        File file=new File(new File(HaiagaruSyncSnapshot.externalRoot(context),"dat"),ThreadWatchOwnPosts.board(context,target)+"_"+target.id+".idx");
        if(file.isFile()&&file.length()<=2*1024*1024)try(BufferedReader reader=new BufferedReader(new InputStreamReader(new FileInputStream(file),java.nio.charset.StandardCharsets.UTF_8))){
            reader.readLine();String flags=reader.readLine();
            if(flags!=null)for(String value:flags.split(",")){
                String[] pair=value.split(":");if(pair.length!=2)continue;
                try{if((Integer.parseInt(pair[1])&8)!=0)manual.add(Integer.parseInt(pair[0]));}catch(NumberFormatException ignored){}
            }
        }
    }
    boolean blocked(int number,String name,String date,String body)throws Exception{
        if(number==1&&FirstResponseNg.disabled())return false;
        if(manual.contains(number)){chained.add(number);return true;}
        String plain=android.text.Html.fromHtml(body).toString();
        Matcher id=ID.matcher(android.text.Html.fromHtml(date).toString());
        String identity=id.find()?id.group(1):"";
        for(Map.Entry<String,NativeNgStore> entry:stores.entrySet()){
            if(entry.getKey().equals("BE")||entry.getKey().equals("IMAGE"))continue;
            String value=entry.getKey().equals("ID")?identity:entry.getKey().equals("NAME")?
                    android.text.Html.fromHtml(name).toString():plain;
            if(value.isEmpty())continue;
            Object item=match.invoke(entry.getValue().store,value,board);
            if(item!=null){
                NativeNgStore.Entry rule=new NativeNgStore.Entry(item);
                if((rule.flags&8)!=0)chained.add(number);
                return true;
            }
        }
        Matcher be=Pattern.compile("BE:([0-9]{1,12})").matcher(date);
        if(be.find()&&match.invoke(stores.get("BE").store,be.group(1),board)!=null)return true;
        Matcher image=Pattern.compile("https?://[^\\s<>\"']{1,1024}").matcher(plain);
        while(image.find())if(match.invoke(stores.get("IMAGE").store,image.group(),board)!=null)return true;
        Matcher anchors=ANCHOR.matcher(plain);
        while(anchors.find()){
            int first=Integer.parseInt(anchors.group(1)),last=anchors.group(2)==null?first:Integer.parseInt(anchors.group(2));
            for(int ng:chained)if(ng<number&&ng>=first&&ng<=last){chained.add(number);return true;}
        }
        return false;
    }
    static Map<Integer,String> filter(Context context,ThreadWatchRules.Target target,String dat,int before,int count)throws Exception{
        Map<Integer,String> candidates=ThreadWatchRules.newBodies(target,dat,before,count);
        if(!enabled(context))return candidates;
        NotificationNg checker=new NotificationNg(context,target);
        Set<Integer> blocked=new HashSet<>();int ordinal=0;
        List<ProgrammableNgScript.Input> extensionInputs=new ArrayList<>();
        List<Integer> numbers=new ArrayList<>();
        for(String line:dat.split("\n")){
            ordinal++;String[] fields=line.split("<>",-1);int number=ordinal,body=3,name=0,date=2;
            if(target.shitaraba){
                if(fields.length<6)continue;
                try{number=Integer.parseInt(fields[0]);}catch(NumberFormatException ignored){continue;}
                name=1;date=3;body=4;
            }else if(fields.length<5)continue;
            if(number>count)continue;
            if(checker.blocked(number,fields[name],fields[date],fields[body]))blocked.add(number);
            Map<String,Object> values=new LinkedHashMap<>();
            values.put("apiVersion",2);values.put("target","body");values.put("boardUrl",target.subject.substring(0,target.subject.length()-"subject.txt".length()));
            values.put("threadId",target.id);values.put("responseNumber",number);
            Matcher identity=ID.matcher(android.text.Html.fromHtml(fields[date]).toString());
            values.put("responseId",identity.find()?identity.group(1):"");
            values.put("name",android.text.Html.fromHtml(fields[name]).toString());
            values.put("dateText",fields[date]);
            extensionInputs.add(new ProgrammableNgScript.Input(android.text.Html.fromHtml(fields[body]).toString(),values));numbers.add(number);
        }
        boolean[] extension=ProgrammableNgController.notificationMatches(extensionInputs);
        for(int i=0;i<extension.length;i++)if(extension[i]&&!(numbers.get(i)==1&&FirstResponseNg.disabled()))blocked.add(numbers.get(i));
        candidates.keySet().removeAll(blocked);return candidates;
    }
    private NotificationNg(){board=null;match=null;}
}
