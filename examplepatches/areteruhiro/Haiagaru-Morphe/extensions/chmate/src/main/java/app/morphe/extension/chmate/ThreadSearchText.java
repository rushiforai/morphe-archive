package app.morphe.extension.chmate;

import java.util.regex.*;
/** Search-only projection. Native response fields and the highlight matcher remain untouched. */
public final class ThreadSearchText {
    private static final java.util.Map<Matcher,Pattern> SOURCES=java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());
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
            Matcher matcher=WACCHOI.matcher(name+"\n"+header);while(matcher.find())result.append(matcher.group()).append('\n');
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
