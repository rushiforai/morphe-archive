package app.yydarlinker.deepseekcaptions;
import java.util.*;import java.util.regex.*;import java.math.BigDecimal;
/** High-confidence numeric guard only. Negation/scope cannot be certified by a regex. */
final class CaptionFidelity {
    private static final Pattern NUMBER=Pattern.compile("(?<![\\p{L}\\p{N}])([+-]?\\d+(?:,\\d{3})*(?:\\.\\d+)?)(?:\\s*(万|亿))?");
    static Set<String> numbers(String text){
        Set<String> out=new HashSet<>();Matcher m=NUMBER.matcher(text==null?"":text);
        while(m.find())try{
            BigDecimal n=new BigDecimal(m.group(1).replace(",",""));
            if("万".equals(m.group(2)))n=n.multiply(new BigDecimal("10000"));
            if("亿".equals(m.group(2)))n=n.multiply(new BigDecimal("100000000"));
            out.add(n.stripTrailingZeros().toPlainString());
        }catch(NumberFormatException ignored){}
        return out;
    }
    static String issue(String source,String target){
        Set<String> a=numbers(source),b=numbers(target);
        // Mixed word-form/localized numbers, unit conversion and scientific notation require
        // semantic evaluation. Only reject a definite substitution in a single-number phrase.
        if(a.size()!=1||b.size()!=1)return "";
        if(target.matches(".*[一二三四五六七八九十百千万亿两零].*"))return "";
        if(source.matches("(?is).*\\b(million|billion|trillion|thousand|percent|fahrenheit|celsius|mile|inch|pound).*"))return "";
        if(!a.equals(b))return "numeric_substitution";
        return "";
    }
}
