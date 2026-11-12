package app.morphe.extension.chmate;

import java.util.regex.*;
/** Search-only projection and match highlighting; native response fields remain untouched. */
public final class ThreadSearchText {
    private static final java.util.Map<Matcher,Pattern> SOURCES=java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static final java.util.Map<Matcher,CharSequence> HIGHLIGHTS=java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static final Pattern HEADER_DATE=Pattern.compile("(?<![0-9/])(?:20[0-9]{2}/)?[0-9]{1,2}/[0-9]{1,2}(?:[（(][日月火水木金土][）)])?(?:[ \\t]+[0-9]{1,2}:[0-9]{2}(?::[0-9]{2}(?:\\.[0-9]+)?)?)?");
    public static Matcher resetHighlight(Matcher matcher, CharSequence text) {
        HIGHLIGHTS.put(matcher,text);
        return matcher.reset(text);
    }
    public static boolean findHighlight(Matcher matcher) {
        CharSequence text=HIGHLIGHTS.get(matcher);
        while(matcher.find()) {
            if(text==null)return true;
            int end=0;while(end<text.length()&&text.charAt(end)!='\n')end++;
            if(matcher.start()>=end)return true;
            Matcher date=HEADER_DATE.matcher(text.subSequence(0,end));
            boolean timestamp=false;
            while(date.find())if(matcher.start()<date.end()&&matcher.end()>date.start()) { timestamp=true;break; }
            if(!timestamp)return true;
        }
        return false;
    }
    private static final Pattern WACCHOI=Pattern.compile("(?<![A-Za-z0-9+/])[A-Za-z0-9+/]{4}-[A-Za-z0-9+/]{4}(?![A-Za-z0-9+/])");
    private static final Pattern ID=Pattern.compile("(?:^|\\s)ID:([A-Za-z0-9+/!_.-]{1,100})");
    public static String text(Object response){
        String[] fields;
        switch(response.getClass().getName()){
            case "o.processAdDisplayErrorPostbackForUserError":fields=new String[]{"c","n","q"};break;
            case "o.BouncyCastleSocketAdapterCompanion":fields=new String[]{"d","m","t"};break;
            case "o.KeJ11":fields=new String[]{"h","n","p"};break;
            default:return "";
        }
        String body=read(response,fields[0]),name=read(response,fields[1]),header=read(response,fields[2]);
        StringBuilder result=new StringBuilder(body).append('\n');
        if(ThreadSearchOptions.enabled(ThreadSearchOptions.NAME))result.append(WACCHOI.matcher(name).replaceAll("")).append('\n');
        if(ThreadSearchOptions.enabled(ThreadSearchOptions.WACCHOI)){
            String source=name+"\n"+header;
            Matcher matcher=WACCHOI.matcher(source);while(matcher.find()){
                result.append(matcher.group()).append('\n');
                int end=matcher.end();
                if(end<source.length()&&(source.charAt(end)==')'||source.charAt(end)=='）')){
                    int begin=Math.max(source.lastIndexOf('(',matcher.start()),source.lastIndexOf('（',matcher.start()));
                    String prefix=begin<0?"":source.substring(begin,matcher.start());
                    if(begin<0||prefix.length()>80||prefix.indexOf('\n')>=0||prefix.indexOf(')')>=0||prefix.indexOf('）')>=0||prefix.indexOf('[')>=0)begin=matcher.start();
                    result.append(source,begin,end+1).append('\n');
                }
            }
        }
        if(ThreadSearchOptions.enabled(ThreadSearchOptions.ID)){
            Matcher matcher=ID.matcher(header);boolean found=false;
            while(matcher.find()){result.append("ID:").append(matcher.group(1)).append('\n');found=true;}
            if(!found){String id=read(response,fields[0].equals("c")?"h":fields[0].equals("d")?"j":"g");if(!id.isEmpty())result.append(id.startsWith("ID:")?id:"ID:"+id).append('\n');}
        }
        return result.toString();
    }
    private static String read(Object response,String field){try{Object value=ResponseArchiveEntry.field(response,field);return value==null?"":value.toString();}catch(ReflectiveOperationException ignored){return "";}}
    public static Matcher reset(Matcher original,Object response){
        Pattern source=SOURCES.get(original);if(source==null)source=original.pattern();
        String query=source.pattern();String body=text(response);
        // Native regex remains the fallback. Plain multiword searches use AND across fields.
        if(query.indexOf(' ')>=0&&query.matches("[\\p{L}\\p{N}_:./+ -]+")){
            String[] terms=query.trim().split("(?i)\\s+(?:AND\\s+)?");boolean match=true;
            String value=body.toLowerCase(java.util.Locale.ROOT);
            for(String term:terms)if(!value.contains(term.toLowerCase(java.util.Locale.ROOT))){match=false;break;}
            Matcher result=Pattern.compile(match?"":"(?!)").matcher(body);SOURCES.put(result,source);return result;
        }
        Matcher result=source.matcher(body);return result;
    }
    private ThreadSearchText(){}
}
