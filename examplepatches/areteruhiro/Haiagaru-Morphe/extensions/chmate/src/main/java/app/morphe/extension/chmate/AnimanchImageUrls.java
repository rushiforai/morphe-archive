package app.morphe.extension.chmate;

import java.util.*;
import java.util.function.Function;
import java.util.regex.*;

/** Extensionless source URLs can be missed by ChMate's normal image matcher. */
final class AnimanchImageUrls {
    private static final Pattern IMAGE=Pattern.compile("https://bbs\\.animanch\\.com/(?:arc/)?img/[1-9][0-9]{0,11}/[1-9][0-9]{0,11}(?=$|[\\s<>\"'])");
    static List<String> sources(String text){
        if(text==null||text.length()>1024*1024)return Collections.emptyList();
        LinkedHashSet<String> found=new LinkedHashSet<>();Matcher matcher=IMAGE.matcher(text);
        while(found.size()<256&&matcher.find())found.add(matcher.group());return new ArrayList<>(found);
    }
    static List<String> candidates(String source){
        if(source.startsWith("https://bbs.animanch.com/arc/img/"))
            return Arrays.asList(source.replace("/arc/img/","/img/"),source);
        return Collections.singletonList(source);
    }
    static String[] append(String[] original,String text,Function<String,String> convert){
        ArrayList<String> merged=new ArrayList<>(Arrays.asList(original));Set<String> present=new HashSet<>(merged);
        for(String source:sources(text)){if(merged.size()>=256)break;String target=convert.apply(source);if(target!=null&&present.add(target))merged.add(target);}
        return merged.size()==original.length?original:merged.toArray(new String[0]);
    }
    private AnimanchImageUrls(){}
}
