package e.e.a;
import java.text.ParsePosition;import java.text.SimpleDateFormat;import java.util.*;import java.util.regex.*;
/** Bounded row-date cache; select one strict formatter rather than probing with exceptions. */
public final class RowDates194 {
 private RowDates194(){}
 private static final Pattern TAGS=Pattern.compile("<[^>]*>"),EPOCH=Pattern.compile("[0-9]{10}|[0-9]{13}");
 private static final Pattern DATE=Pattern.compile("[0-9]{4}(?:[-/][0-9]{2}[-/][0-9]{2}[ T][0-9]{2}:[0-9]{2}(?::[0-9]{2}(?:\\.[0-9]+)?)?(?:Z|[+-][0-9]{2}:?[0-9]{2})?|年[0-9]{2}月[0-9]{2}日 [0-9]{2}(?:時[0-9]{2}分|:[0-9]{2}))");
 private static final Pattern ZONE_SUFFIX=Pattern.compile("(?:Z|[+-][0-9]{2}:?[0-9]{2})$");
 private static final TimeZone ZONE=TimeZone.getTimeZone("Asia/Tokyo");
 private static final String[] PATTERNS={"yyyy-MM-dd HH:mm","yyyy-MM-dd HH:mm:ss","yyyy-MM-dd HH:mm:ss.SSS","yyyy-MM-dd HH:mmXXX","yyyy-MM-dd HH:mm:ssXXX","yyyy-MM-dd HH:mm:ss.SSSXXX","yyyy年MM月dd日 HH時mm分","yyyy年MM月dd日 HH:mm"};
 private static final ThreadLocal<Formats> FORMATS=new ThreadLocal<>();
 private static final Map<String,Long> PARSED=new LinkedHashMap<String,Long>(256,.75f,true){protected boolean removeEldestEntry(Map.Entry<String,Long> e){return size()>256;}};
 private static final class Formats {final SimpleDateFormat[] input=new SimpleDateFormat[PATTERNS.length];final SimpleDateFormat output=create("yyyy/MM/dd HH:mm");SimpleDateFormat get(int i){if(input[i]==null)input[i]=create(PATTERNS[i]);return input[i];}}
 private static SimpleDateFormat create(String pattern){SimpleDateFormat f=new SimpleDateFormat(pattern,Locale.ROOT);f.setLenient(false);f.setTimeZone(ZONE);return f;}
 private static Formats formats(){Formats f=FORMATS.get();if(f==null){f=new Formats();FORMATS.set(f);}return f;}
 public static long millis(String source){if(source==null)return 0;if(source.length()<=2048)synchronized(PARSED){Long c=PARSED.get(source);if(c!=null)return c;}long value=parse(source);if(source.length()<=2048)synchronized(PARSED){PARSED.put(source,value);}return value;}
 private static long parse(String source){source=TAGS.matcher(source).replaceAll("").trim();if(EPOCH.matcher(source).matches())try{long n=Long.parseLong(source);return source.length()==10?n*1000:n;}catch(NumberFormatException e){return 0;}Matcher found=DATE.matcher(source);if(!found.find())return 0;String date=found.group();int pattern;
  if(date.indexOf('年')>=0)pattern=date.indexOf('時')>=0?6:7;
  else {if(date.charAt(4)!=date.charAt(7))return 0;date=date.replace('/','-').replace('T',' ');Matcher zone=ZONE_SUFFIX.matcher(date);boolean hasZone=zone.find();String suffix=hasZone?zone.group():"";String body=hasZone?date.substring(0,zone.start()):date;
   int dot=body.indexOf('.');pattern=body.length()>16?1:0;if(dot>=0){String fraction=body.substring(dot+1);body=body.substring(0,dot)+"."+(fraction+"000").substring(0,3);pattern=2;}
   if(hasZone){if(suffix.length()==5)suffix=suffix.substring(0,3)+":"+suffix.substring(3);pattern+=3;}date=body+suffix;
  }
  SimpleDateFormat format=formats().get(pattern);format.setTimeZone(ZONE);ParsePosition pos=new ParsePosition(0);Date parsed=format.parse(date,pos);return parsed!=null&&pos.getIndex()==date.length()?parsed.getTime():0;
 }
 public static String format(long millis,String label){return millis<=0?"":formats().output.format(new Date(millis))+" "+UiStrings.translate(label);}
}
