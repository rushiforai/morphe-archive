package app.morphe.extension.chmate;

import android.content.Context;
import java.util.*;
import java.lang.reflect.*;

/** Display-only unread adjustment. Never changes the native read position or database. */
public final class HiddenNgUnread {
    public static final String KEY="excludeHiddenNgUnread";
    private static volatile android.content.SharedPreferences preferences;
    // Called once per response on legacy renderers: do not resolve ContextImpl's
    // preferences file/cache on every row. Read the boolean itself live for toggles/imports.
    private static boolean enabled(){
        android.content.SharedPreferences prefs=preferences;
        if(prefs==null){Context context=Haiagaru.applicationContextForExtension();if(context==null)return false;
            preferences=prefs=context.getSharedPreferences(WacchoiSearchOptions.PREFS,0);}
        return prefs.getBoolean(KEY,false);
    }
    private static final Map<Object,String> OWNERS=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object,String> MODERN=Collections.synchronizedMap(new WeakHashMap<>());
    private static final java.util.concurrent.ConcurrentMap<Class<?>,Map<String,Field>> FIELDS=new java.util.concurrent.ConcurrentHashMap<>();
    private static final Map<Integer,RowKey> ROW_KEYS=new LinkedHashMap<Integer,RowKey>(128,.75f,true){
        @Override protected boolean removeEldestEntry(Map.Entry<Integer,RowKey> e){return size()>1024;}
    };
    private static final class RowKey {
        final java.lang.ref.WeakReference<Object> row;final String signature,key;
        RowKey(Object row,String signature,String key){this.row=new java.lang.ref.WeakReference<>(row);this.signature=signature;this.key=key;}
    }
    private static final Map<String,Set<Integer>> HIDDEN=new LinkedHashMap<String,Set<Integer>>(32,.75f,true){
        @Override public Set<Integer> put(String key,Set<Integer> value){candidateIds=null;return super.put(key,value);}
        @Override public Set<Integer> remove(Object key){candidateIds=null;return super.remove(key);}
        @Override public void clear(){candidateIds=null;super.clear();}
        @Override protected boolean removeEldestEntry(Map.Entry<String,Set<Integer>> e){return size()>128;}
    };
    // Negative prefilter only: different boards can share a numeric thread ID,
    // so positive matches still use the exact board/URL key below.
    private static Set<Long> candidateIds;
    private static Set<Long> candidateThreads(){
        if(candidateIds!=null)return candidateIds;
        Set<Long> ids=new HashSet<>();
        for(Map.Entry<String,Set<Integer>> entry:HIDDEN.entrySet())if(!entry.getValue().isEmpty()){
            String key=entry.getKey();
            try{ids.add(Long.parseLong(key.substring(key.lastIndexOf('/')+1)));}
            catch(RuntimeException unknown){return null;} // Unknown keys must never hide an adjustment.
        }
        return candidateIds=ids;
    }
    // Opening/closing a thread can ask for its unread total repeatedly. Cache the
    // hidden response numbers as a sorted array and answer each read-position query
    // with binary search instead of scanning every hidden response on the UI path.
    private static final Map<String,int[]> SORTED=new LinkedHashMap<String,int[]>(32,.75f,true){
        @Override protected boolean removeEldestEntry(Map.Entry<String,int[]> e){return size()>128;}
    };
    private static Object field(Object o,String n)throws Exception{
        Map<String,Field> fields=FIELDS.computeIfAbsent(o.getClass(),c->new java.util.concurrent.ConcurrentHashMap<>());
        Field f=fields.get(n);if(f==null){
            for(Class<?> type=o.getClass();type!=null;type=type.getSuperclass())try{f=type.getDeclaredField(n);f.setAccessible(true);break;}catch(NoSuchFieldException ignored){}
            if(f==null)throw new NoSuchFieldException(n);fields.put(n,f);
        }
        return f.get(o);
    }
    /** Guard reused native rows by their board, thread and explicit Intent URL. */
    private static String rowKey(Object row,String name,Context c)throws Exception{
        if(name.equals("o.zzauw")){Object info=field(row,"i");return key((String)info.getClass().getMethod(ArchiveOrigins.nativeUrlMethod()).invoke(info));}
        boolean old=name.equals("o.onAdDisplayed$setIcon"),middle=name.equals("o.Yy2$open");
        Object board=field(row,old?"g":middle?"b":"e");
        long thread=((Number)field(row,old?"h":middle?"g":"b")).longValue();
        android.content.Intent intent=(android.content.Intent)field(row,old?"d":middle?"a":"k");
        String signature=String.valueOf(board)+"\n"+thread+"\n"+(intent==null?"":intent.getDataString());
        int identity=System.identityHashCode(row);
        synchronized(ROW_KEYS){RowKey cached=ROW_KEYS.get(identity);if(cached!=null&&cached.row.get()==row&&cached.signature.equals(signature))return cached.key;}
        String result=key(DroppedThreadStatus.rowUrl(row,c));
        // A failed native lookup can become resolvable after board metadata arrives.
        if(result!=null)synchronized(ROW_KEYS){ROW_KEYS.put(identity,new RowKey(row,signature,result));}
        return result;
    }
    private static String responseUrl(Object response,Object board)throws Exception{
        boolean old=response.getClass().getName().equals("o.processAdDisplayErrorPostbackForUserError"),middle=response.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion");
        Method method=board.getClass().getDeclaredMethod(old?"d":middle?"e":"c",int.class);method.setAccessible(true);
        return (String)method.invoke(board,((Number)field(response,middle?"l":"o")).intValue());
    }
    static String key(String url){
        try{java.net.URI u=java.net.URI.create(url);String id=ArchiveOriginPaths.threadKey(url);
            if(id==null)return null;String[] parts=u.getPath().split("/");
            int i=java.util.Arrays.asList(parts).indexOf(id);if(i<1)return null;
            return u.getHost().toLowerCase(Locale.ROOT).replaceFirst("\\.(?:2ch\\.net|5ch\\.net)$",".5ch.io")+"/"+parts[i-1]+"/"+id;
        }catch(Exception ignored){return null;}
    }
    static void begin(Object owner){
        if(!enabled())return;
        try{boolean old=owner.getClass().getName().equals("o.m9ExternalSyntheticLambda1");
            Object list=field(owner,old?"K":"J"),board=field(field(owner,old?"M":"E"),old?"f":"j");
            List<?> rows=PopularReplies.fullList(list);if(rows.isEmpty())return;
            String k=key(responseUrl(rows.get(0),board));if(k==null)return;
            OWNERS.put(owner,k);synchronized(HIDDEN){HIDDEN.put(k,new HashSet<>());invalidate(k);}
            // Row keys validate board/thread/Intent themselves. Rebuilding one
            // thread must not invalidate every HOME row when returning to the list.
        }catch(Exception ignored){OWNERS.remove(owner);}
    }
    static int observe(Object owner,Object response,int flags){
        if(!enabled())return flags;
        try{String k=OWNERS.get(owner);if(k==null){begin(owner);k=OWNERS.get(owner);}if(k==null)return flags;
            synchronized(HIDDEN){Set<Integer> rows=HIDDEN.get(k);if(rows==null||((flags&0x1000)==0&&rows.isEmpty()))return flags;
                int n=((Number)field(response,response.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion")?"l":"o")).intValue();
                if(n>0&&rows.size()<100000){boolean changed=(flags&0x1000)!=0?rows.add(n):rows.remove(n);if(changed)invalidate(k);}}
        }catch(Exception ignored){}return flags;
    }
    private static void invalidate(String key){SORTED.remove(key);candidateIds=null;}
    private static int[] sorted(String key,Set<Integer> hidden){
        int[] values=SORTED.get(key);if(values!=null)return values;
        values=new int[hidden.size()];int i=0;for(Integer n:hidden)values[i++]=n;
        Arrays.sort(values);SORTED.put(key,values);return values;
    }
    private static int unreadHidden(String key,int read,int total,Set<Integer> hidden){
        int[] values=sorted(key,hidden);int lo=0,hi=values.length;
        while(lo<hi){int mid=(lo+hi)>>>1;if(values[mid]<=read)lo=mid+1;else hi=mid;}int first=lo;
        lo=first;hi=values.length;while(lo<hi){int mid=(lo+hi)>>>1;if(values[mid]<=total)lo=mid+1;else hi=mid;}
        return lo-first;
    }
    static int subtract(int total,int read,Set<Integer> hidden){
        int count=0;for(int n:hidden)if(n>read&&n<=total)count++;
        return Math.max(Math.min(read,total),total-count);
    }
    static void bind242(Object result){try{List<?> rows=PopularReplies.fullList(field(result,"a"));if(rows.isEmpty())return;String k=key(responseUrl(rows.get(0),field(result,"d")));if(k!=null)MODERN.put(rows.get(0),k);}catch(Exception ignored){}}
    static Map modern(Object source,Map flags){
        if(!enabled()||flags==null)return flags;
        try{List<?> rows=PopularReplies.fullList(source);if(rows.isEmpty())return flags;String k=MODERN.get(rows.get(0));if(k==null)return flags;
            Set<Integer> candidates=new HashSet<>();for(Object item:flags.entrySet()){
                Map.Entry entry=(Map.Entry)item;Object n=entry.getKey(),f=entry.getValue();
                if(n instanceof Integer&&f instanceof Number&&(((Number)f).intValue()&0x1000)!=0&&(Integer)n>0&&candidates.size()<100000)candidates.add((Integer)n);
            }
            Set<Integer> hidden=new HashSet<>();
            // Most renders have no hidden posts. Do not reflect over every response
            // in that common case, but still clear any previous hidden membership.
            if(!candidates.isEmpty()){
                // Full DAT lists normally have response n at index n-1. Verify
                // each actual row instead of reflecting over all visible posts.
                // Missing/sparse/reordered lists fall back to an exact scan.
                if(rows instanceof RandomAccess)for(Iterator<Integer> it=candidates.iterator();it.hasNext();){int n=it.next();
                    if(n<=rows.size()&&((Number)field(rows.get(n-1),"o")).intValue()==n){hidden.add(n);it.remove();}}
                if(!candidates.isEmpty())for(Object row:rows){int n=((Number)field(row,"o")).intValue();
                    if(candidates.remove(n)){hidden.add(n);if(candidates.isEmpty())break;}}
            }
            synchronized(HIDDEN){if(!hidden.equals(HIDDEN.get(k))){HIDDEN.put(k,hidden);invalidate(k);}}
        }catch(Exception ignored){}return flags;
    }
    public static int totalFromStoredRead(Object row){
        String name=row.getClass().getName();
        String read=name.equals("o.onAdDisplayed$setIcon")?"l":name.equals("o.Yy2$open")?"i":"g";
        try{return total(row,((Number)field(row,read)).intValue());}
        catch(Exception ignored){return total(row,Integer.MAX_VALUE);}
    }
    public static int total(Object row,int read){
        String name=row.getClass().getName();String total=name.equals("o.onAdDisplayed$setIcon")?"k":name.equals("o.Yy2$open")?"m":name.equals("o.zzauw")?"a":name.equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ")?"o":null;
        if(total==null)throw new IllegalArgumentException("Unsupported unread row");
        int nativeTotal;
        try{nativeTotal=((Number)field(row,total)).intValue();}catch(Exception e){throw new IllegalStateException(e);}
        if(!enabled()||nativeTotal<=read)return nativeTotal;
        synchronized(HIDDEN){
            if(HIDDEN.isEmpty())return nativeTotal;
            // HOME can contain thousands of unrelated threads. Avoid creating
            // their native thread model and URL just to discover no hidden NG.
            Set<Long> candidates=candidateThreads();
            if(candidates!=null){
                if(candidates.isEmpty())return nativeTotal;
                String threadField=name.equals("o.onAdDisplayed$setIcon")?"h":name.equals("o.Yy2$open")?"g":name.equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ")?"b":null;
                if(threadField!=null)try{if(!candidates.contains(((Number)field(row,threadField)).longValue()))return nativeTotal;}
                catch(Exception unknown){/* Fall back to the exact URL lookup. */}
            }
        }
        try{Context c=Haiagaru.applicationContextForExtension();
            String k=rowKey(row,name,c);synchronized(HIDDEN){Set<Integer> hidden=HIDDEN.get(k);if(hidden==null||hidden.isEmpty())return nativeTotal;
                int count=unreadHidden(k,read,nativeTotal,hidden);return Math.max(Math.min(read,nativeTotal),nativeTotal-count);}
        }catch(Exception ignored){return nativeTotal;}
    }
    private static void invalidateAll(){SORTED.clear();}
    static void clear(){OWNERS.clear();MODERN.clear();synchronized(HIDDEN){HIDDEN.clear();invalidateAll();}synchronized(ROW_KEYS){ROW_KEYS.clear();}}
    private HiddenNgUnread(){}
}
