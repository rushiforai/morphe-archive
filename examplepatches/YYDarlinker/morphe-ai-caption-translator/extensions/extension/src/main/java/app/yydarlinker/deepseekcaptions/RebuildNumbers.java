package app.yydarlinker.deepseekcaptions;
import java.util.*;
import java.util.regex.*;
import java.math.BigDecimal;
/** High-confidence date equivalence; unrecognized language is unknown, not a contradiction. */
final class RebuildNumbers {
  static final String MONTHS="january february march april may june july august september october november december";
  static final Pattern EN=Pattern.compile("(?i)\\b("+MONTHS.replace(" ","|")+")\\s+(\\d{1,2})(?:st|nd|rd|th)?\\b");
  static final Pattern ZH=Pattern.compile("(?<![0-9一二三四五六七八九十])([0-9]{1,2}|[一二三四五六七八九十]{1,3})月\\s*([0-9]{1,2}|[一二三四五六七八九十]{1,3})(?:日|号)");
  static final Pattern NUMBER=Pattern.compile("(?<![a-zA-Z0-9])[+-]?\\d+(?:,\\d{3})*(?:\\.\\d+)?");
  static int integer(String s) {
    if(s.matches("[0-9]+"))return Integer.parseInt(s);
    String digits="零一二三四五六七八九"; int t=s.indexOf('十');
    if(t>=0) {int tens=t==0?1:digits.indexOf(s.charAt(0));int units=t==s.length()-1?0:digits.indexOf(s.charAt(t+1));return tens<0||units<0?-1:tens*10+units;}
    return s.length()==1?digits.indexOf(s.charAt(0)):-1;
  }
  static List<String> dates(String text) {
    List<String> out=new ArrayList<>();Matcher en=EN.matcher(text),zh=ZH.matcher(text);
    List<String> names=Arrays.asList(MONTHS.split(" "));
    while(en.find()){int d=integer(en.group(2));if(d>=1&&d<=31)out.add((names.indexOf(en.group(1).toLowerCase(Locale.ROOT))+1)+":"+d);}
    while(zh.find()){int m=integer(zh.group(1)),d=integer(zh.group(2));if(m>=1&&m<=12&&d>=1&&d<=31)out.add(m+":"+d);}
    Collections.sort(out);return out;
  }
  static List<String> numbers(String text) {
    List<String> out=new ArrayList<>();Matcher m=NUMBER.matcher(text);
    while(m.find())try{out.add(new BigDecimal(m.group().replace(",","")).stripTrailingZeros().toPlainString());}catch(NumberFormatException ignored){}
    return out;
  }
  static boolean safe(String source,String target) {
    List<String> a=dates(source),b=dates(target);
    if(!a.isEmpty()&&!b.isEmpty()&&!a.equals(b))return false;
    // Never compare a partially decoded translated date with an ordinary quantity.
    if(!a.isEmpty()||!b.isEmpty()) {
      if(a.isEmpty()||b.isEmpty())return true;
      source=ZH.matcher(EN.matcher(source).replaceAll(" ")).replaceAll(" ");
      target=ZH.matcher(EN.matcher(target).replaceAll(" ")).replaceAll(" ");
    }
    a=numbers(source);b=numbers(target);
    if(a.size()!=1||b.size()!=1||target.matches("(?s).*[万亿].*")||source.matches("(?is).*\\b(million|billion|thousand)\\b.*"))return true;
    return a.equals(b);
  }
}
