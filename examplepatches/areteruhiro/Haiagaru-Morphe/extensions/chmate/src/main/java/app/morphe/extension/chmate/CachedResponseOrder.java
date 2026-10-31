package app.morphe.extension.chmate;

import java.lang.reflect.Field;
import java.net.URI;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.*;
import java.util.regex.*;

/** Reorders response rows, retaining native text spans, flags and exact click targets. */
final class CachedResponseOrder {
    private static final Pattern DATE=Pattern.compile("(?<![0-9])([0-9]{4})[-/]([0-9]{1,2})[-/]([0-9]{1,2})(?:\\([^\\r\\n)]{0,16}\\))?[ \\u00a0]+([0-9]{1,2}):([0-9]{2}):([0-9]{2})(?:\\.([0-9]{1,9}))?(?![0-9])");
    static long posted(CharSequence text){
        if(text==null)return Long.MIN_VALUE;
        // The native first line is the response header. A date quoted in the body is not metadata.
        int end=0;while(end<text.length()&&end<2048&&text.charAt(end)!='\n'&&text.charAt(end)!='\r')end++;
        Matcher m=DATE.matcher(text.subSequence(0,end));long result=Long.MIN_VALUE;
        while(m.find()){
            try{String fraction=m.group(7);int nano=fraction==null?0:Integer.parseInt((fraction+"000000000").substring(0,9));
                result=LocalDateTime.of(Integer.parseInt(m.group(1)),Integer.parseInt(m.group(2)),Integer.parseInt(m.group(3)),Integer.parseInt(m.group(4)),Integer.parseInt(m.group(5)),Integer.parseInt(m.group(6)),nano).toInstant(ZoneOffset.ofHours(9)).toEpochMilli();
            }catch(RuntimeException invalid){result=Long.MIN_VALUE;}
        }
        return result;
    }
    static String thread(String url){
        try{URI uri=URI.create(url);String[] parts=uri.getPath().split("/");StringBuilder path=new StringBuilder();
            for(String part:parts){path.append('/').append(part);if(part.matches("[0-9]{9,11}"))return String.valueOf(uri.getAuthority()).toLowerCase(Locale.ROOT)+path;}
        }catch(RuntimeException ignored){}return url;
    }
    private static final class Shape {
        final Field url,text;
        Shape(Class<?> type)throws Exception{
            String u,t;switch(type.getName()){
                case "o.mg":u="b";t="d";break;
                case "o.createFromParcel":u="e";t="b";break;
                case "o.startResolutionForResult":u="d";t="c";break;
                default:throw new IllegalArgumentException("Unsupported cached search row");
            }
            url=type.getDeclaredField(u);text=type.getDeclaredField(t);url.setAccessible(true);text.setAccessible(true);
        }
    }
    private static final class Entry {
        final Object row;final String thread;final long at;Object heading;
        Entry(Object row,String thread,long at){this.row=row;this.thread=thread;this.at=at;}
    }
    static List<?> sorted(List<?> source,boolean newest)throws Exception{
        Map<Class<?>,Shape> shapes=new HashMap<>();Map<String,Object> headings=new HashMap<>();
        Set<String> responseThreads=new HashSet<>();List<Entry> responses=new ArrayList<>(),headers=new ArrayList<>();
        Object preceding=null;String precedingThread=null;
        for(Object row:source){
            Shape shape=shapes.get(row.getClass());if(shape==null){shape=new Shape(row.getClass());shapes.put(row.getClass(),shape);}
            String key=thread((String)shape.url.get(row));Object text=shape.text.get(row);
            if(text==null){headings.putIfAbsent(key,row);headers.add(new Entry(row,key,Long.MIN_VALUE));preceding=row;precedingThread=key;}
            else {
                if(!(text instanceof CharSequence))throw new IllegalArgumentException("Unsupported response text");
                Entry entry=new Entry(row,key,posted((CharSequence)text));
                if(Objects.equals(key,precedingThread))entry.heading=preceding;
                responses.add(entry);responseThreads.add(key);
            }
        }
        responses.sort((a,b)->{if(a.at==Long.MIN_VALUE||b.at==Long.MIN_VALUE)return a.at==b.at?0:a.at==Long.MIN_VALUE?1:-1;
            return newest?Long.compare(b.at,a.at):Long.compare(a.at,b.at);});
        ArrayList<Object> result=new ArrayList<>();String lastThread=null;Object lastHeading=null;
        for(Entry e:responses){Object heading=e.heading==null?headings.get(e.thread):e.heading;
            if(heading!=null&&(!Objects.equals(lastThread,e.thread)||lastHeading!=heading))result.add(heading);
            result.add(e.row);lastThread=e.thread;lastHeading=heading;
        }
        // Title-only hits have no posting time. Keep them visible at the end in native order.
        for(Entry e:headers)if(!responseThreads.contains(e.thread))result.add(e.row);
        return result;
    }
    private CachedResponseOrder(){}
}
