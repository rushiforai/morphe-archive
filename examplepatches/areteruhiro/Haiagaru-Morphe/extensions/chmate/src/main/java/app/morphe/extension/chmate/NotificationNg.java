package app.morphe.extension.chmate;

import android.content.Context;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.regex.*;

/** Read-only native registration checks for notification DATs. No rule copies or writes. */
final class NotificationNg {
    static final String KEY="suppressNgReplyNotifications";
    static final String CHAIN_KEY="suppressChainedNgReplyNotifications";
    private final Object board;
    private final Map<String,NativeNgStore> stores=new LinkedHashMap<>();
    private final Method match;
    private final boolean suppressChainedReplies;
    private final Set<Integer> manual=new HashSet<>();
    private final NavigableSet<Integer> chained=new TreeSet<>();
    private static final Pattern ID=Pattern.compile("(?:^|\\s)ID:([^\\s<>]+)");
    private static final Pattern ANCHOR=Pattern.compile(">>([1-9][0-9]{0,6})(?:-([1-9][0-9]{0,6}))?");
    private static final Pattern BE=Pattern.compile("BE:([0-9]{1,12})");
    private static final Pattern IMAGE=Pattern.compile("https?://[^\\s<>\"']{1,1024}");
    static boolean chainedRepliesEnabled(Context context){
        return FeatureSwitches.prefs(context).getBoolean(CHAIN_KEY,false);
    }
    static boolean enabled(Context context){return FeatureSwitches.prefs(context).getBoolean(KEY,true);}
    NotificationNg(Context context,ThreadWatchRules.Target target)throws Exception{
        String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
        Class<?> info=Class.forName("jp.syoboi.a2chMate.client.BBSUrlInfo",false,context.getClassLoader());
        Object parsed=info.getMethod(version.contains("242")?"d":"c",String.class).invoke(null,target.url);
        if(parsed==null)throw new IOException("Notification thread unavailable");
        board=RefreshTargets.nativeBoard(parsed,version);
        suppressChainedReplies=chainedRepliesEnabled(context);
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
        if(manual.contains(number)){if(suppressChainedReplies)chained.add(number);return true;}
        String plain=ProgrammableNgController.plain(body);
        Matcher id=ID.matcher(ProgrammableNgController.plain(date));
        String identity=id.find()?id.group(1):"";
        for(Map.Entry<String,NativeNgStore> entry:stores.entrySet()){
            if(entry.getKey().equals("BE")||entry.getKey().equals("IMAGE"))continue;
            String value=entry.getKey().equals("ID")?identity:entry.getKey().equals("NAME")?
                    ProgrammableNgController.plain(name):plain;
            if(value.isEmpty())continue;
            Object item=match.invoke(entry.getValue().store,value,board);
            if(item!=null){
                NativeNgStore.Entry rule=new NativeNgStore.Entry(item);
                if(suppressChainedReplies&&(rule.flags&8)!=0)chained.add(number);
                return true;
            }
        }
        Matcher be=BE.matcher(date);
        if(be.find()&&match.invoke(stores.get("BE").store,be.group(1),board)!=null)return true;
        Matcher image=IMAGE.matcher(plain);
        while(image.find())if(match.invoke(stores.get("IMAGE").store,image.group(),board)!=null)return true;
        Matcher anchors=ANCHOR.matcher(plain);
        while(suppressChainedReplies&&anchors.find()){
            int first=Integer.parseInt(anchors.group(1)),last=anchors.group(2)==null?first:Integer.parseInt(anchors.group(2));
            Integer ng=chained.ceiling(first);
            if(ng!=null&&ng<number&&ng<=last){chained.add(number);return true;}
        }
        return false;
    }
    static final class Row {
        final int number;
        final String name,date,body;

        private Row(int number,String name,String date,String body){
            this.number=number;this.name=name;this.date=date;this.body=body;
        }

        static Row parse(String line,int ordinal,boolean numbered){
            String[] fields=line.split("<>",-1);
            if(!numbered)return fields.length<5?null:new Row(ordinal,fields[0],fields[2],fields[3]);
            if(fields.length<6)return null;
            try{return new Row(Integer.parseInt(fields[0]),fields[1],fields[3],fields[4]);}
            catch(NumberFormatException invalid){return null;}
        }

        String previewBody(){return body.substring(0,Math.min(body.length(),16384));}
    }

    static Map<Integer,String> filter(Context context,ThreadWatchRules.Target target,String dat,int before,int count)throws Exception{
        boolean skipRead=FeatureSwitches.prefs(context).getBoolean(ExpertSettings.NEW_DAT,true);
        Map<Integer,String> candidates=ThreadWatchRules.newBodies(target,dat,before,count,skipRead);
        if(candidates.isEmpty()||!enabled(context))return candidates;
        boolean chain=chainedRepliesEnabled(context);
        boolean script=ProgrammableNgController.programmableBodyRulesEnabled();
        List<Row> rows=new ArrayList<>();
        if(skipRead&&!target.shitaraba&&!chain&&!script){
            int start=ThreadWatchRules.afterLines(dat,before);
            for(int ordinal=before+1;start>=0&&start<dat.length()&&ordinal<=count;ordinal++){
                int end=ThreadWatchRules.lineEnd(dat,start);
                if(candidates.containsKey(ordinal)){
                    Row row=Row.parse(dat.substring(start,end),ordinal,false);
                    if(row!=null)rows.add(row);
                }
                if(end>=dat.length())break;
                start=end+1;
            }
        }else{
            int ordinal=0;
            for(String line:dat.split("\n")){
                ordinal++;
                Row row=Row.parse(line,ordinal,target.shitaraba);
                if(row!=null&&row.number<=count&&(chain||script||candidates.containsKey(row.number)))rows.add(row);
            }
        }
        removeBlocked(context,target,rows,candidates,chain,script);
        return candidates;
    }

    private static BitSet chainAncestors(List<Row> rows, Set<Integer> candidates) {
        BitSet needed = new BitSet();
        int next = Integer.MAX_VALUE;
        for (int i = rows.size() - 1; i >= 0; i--) {
            Row row = rows.get(i);
            // Unordered or unusual imported DATs retain the original sequential scan.
            if (row.number <= 0 || row.number >= next || row.number > 1000000) return null;
            next = row.number;
            if (!candidates.contains(row.number) && !needed.get(row.number)) continue;
            Matcher anchors = ANCHOR.matcher(ProgrammableNgController.plain(row.body));
            while (anchors.find()) {
                int first;
                int last;
                try {
                    first = Integer.parseInt(anchors.group(1));
                    last = anchors.group(2) == null ? first : Integer.parseInt(anchors.group(2));
                } catch (NumberFormatException malformedAnchor) {
                    return null;
                }
                last = Math.min(last, row.number - 1);
                if (first <= last) needed.set(first, last + 1);
            }
        }
        return needed;
    }

    static void removeBlocked(Context context,ThreadWatchRules.Target target,List<Row> rows,
                              Map<Integer,String> candidates,boolean chain,boolean script)throws Exception{
        if(candidates.isEmpty())return;
        NotificationNg checker=new NotificationNg(context,target);
        Set<Integer> blocked=new HashSet<>();
        List<ProgrammableNgScript.Input> inputs=new ArrayList<>();
        List<Integer> numbers=new ArrayList<>();
        boolean shared=SharedNg.enabled();
        BitSet ancestors = chain && FeatureSwitches.prefs(context).getBoolean(ExpertSettings.CHAIN_ANCESTORS,true)
                ? chainAncestors(rows,candidates.keySet()) : null;
        String boardUrl=target.subject.substring(0,target.subject.length()-"subject.txt".length());
        for(Row row:rows){
            int number=row.number;
            boolean candidate=candidates.containsKey(number);
            if(candidate || (chain && (ancestors == null || ancestors.get(number)))){
                boolean nativeBlocked=checker.blocked(number,row.name,row.date,row.body);
                if(candidate&&nativeBlocked)blocked.add(number);
            }
            // Script chaining and batch evaluation can depend on posts outside the candidate set.
            if(!script&&(!shared||!candidate))continue;
            Map<String,Object> values=new LinkedHashMap<>();
            values.put("apiVersion",2);values.put("target","body");values.put("boardUrl",boardUrl);
            values.put("threadId",target.id);values.put("responseNumber",number);
            Matcher identity=ID.matcher(ProgrammableNgController.plain(row.date));
            values.put("responseId",identity.find()?identity.group(1):"");
            values.put("name",ProgrammableNgController.plain(row.name));
            values.put("dateText",row.date);
            inputs.add(new ProgrammableNgScript.Input(ProgrammableNgController.plain(row.body),values));
            numbers.add(number);
        }
        if(!inputs.isEmpty()){
            boolean[] extension=ProgrammableNgController.notificationMatches(inputs);
            for(int i=0;i<extension.length;i++){
                int number=numbers.get(i);
                if(extension[i]&&!(number==1&&FirstResponseNg.disabled()))blocked.add(number);
            }
        }
        candidates.keySet().removeAll(blocked);
    }
    private NotificationNg(){board=null;match=null;suppressChainedReplies=false;}
}
