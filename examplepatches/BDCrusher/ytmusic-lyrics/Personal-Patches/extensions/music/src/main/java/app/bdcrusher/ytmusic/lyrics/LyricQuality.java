/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import org.json.*;
import org.xmlpull.v1.*;
import java.io.StringReader;
import java.util.*;

/** Quality follows actual validated timing, rather than a provider's advertised label. */
final class LyricQuality {
    private LyricQuality(){}
    static double time(String s){
        if(s==null)return Double.NaN;
        try{
            double value;
            if(s.matches("\\d+(?:\\.\\d+)?ms"))value=Double.parseDouble(s.substring(0,s.length()-2));
            else if(s.matches("\\d+(?:\\.\\d+)?s"))value=Double.parseDouble(s.substring(0,s.length()-1))*1000;
            else if(s.matches("(?:\\d{1,3}:)?\\d{1,3}:\\d{2}(?:\\.\\d+)?")){String[] parts=s.split(":");if(Double.parseDouble(parts[parts.length-1])>=60||parts.length==3&&Double.parseDouble(parts[1])>=60)return Double.NaN;value=0;for(String p:parts)value=value*60+Double.parseDouble(p);value*=1000;}
            else return Double.NaN;
            return Double.isFinite(value)&&value>=0&&value<=24*3600*1000?value:Double.NaN;
        }catch(Exception bad){return Double.NaN;}
    }
    static int lines(JSONArray lines){
        if(lines==null||lines.length()==0||lines.length()>2000)return -1;int quality=-1;
        for(int i=0;i<lines.length();i++){
            JSONObject l=lines.optJSONObject(i);if(l==null)continue;String words=l.optString("words");if(words.isBlank())continue;quality=Math.max(0,quality);
            double start=l.optDouble("startTimeMs",Double.NaN),duration=l.optDouble("durationMs",0);
            if(Double.isFinite(start)&&start>=0&&Double.isFinite(duration)&&duration>0)quality=Math.max(1,quality);
            JSONArray parts=l.optJSONArray("parts");if(parts==null)continue;String previous="";
            for(int j=0;j<parts.length();j++){
                JSONObject part=parts.optJSONObject(j);if(part==null)continue;String text=part.optString("words");
                double t=part.optDouble("startTimeMs",Double.NaN),d=part.optDouble("durationMs",0);
                if(!Double.isFinite(t)||t<0||!Double.isFinite(d)||d<=0||text.isBlank()){previous="";continue;}
                quality=Math.max(2,quality);
                if(joined(previous,text))quality=3;previous=text;
            }
        }return quality;
    }
    private static boolean joined(String a,String b){return !a.isEmpty()&&!b.isEmpty()&&Character.isLetterOrDigit(a.charAt(a.length()-1))&&Character.isLetterOrDigit(b.charAt(0));}
    static int raw(String raw,String format){
        if(raw==null||raw.isBlank()||raw.length()>4*1024*1024)return -1;
        try{
            if("ttml".equals(format))return ttml(raw);
            if("richsync".equals(format)){
                JSONArray lines=new JSONArray(raw);int quality=-1;
                for(int i=0;i<lines.length();i++){JSONObject line=lines.optJSONObject(i);if(line==null)continue;double ts=line.optDouble("ts",Double.NaN),te=line.optDouble("te",Double.NaN);if(!Double.isFinite(ts)||ts<0||!Double.isFinite(te)||te<=ts)continue;
                    JSONArray parts=line.optJSONArray("l");if(parts==null)continue;for(int j=0;j<parts.length();j++){JSONObject p=parts.optJSONObject(j);if(p!=null&&!p.optString("c").isBlank()&&p.optDouble("d",0)>0&&p.optDouble("o",-1)>=0)quality=2;}
                }return quality;
            }
            if("qrc".equals(format)){
                if(raw.contains("<!DOCTYPE")||raw.contains("<!ENTITY"))return -1;
                java.util.regex.Matcher line=java.util.regex.Pattern.compile("\\[(\\d+),(\\d+)\\]([^\\r\\n]+)").matcher(raw);
                while(line.find())if(Long.parseLong(line.group(2))>0&&java.util.regex.Pattern.compile("[^(),\\d]\\((\\d+),([1-9]\\d*)\\)").matcher(line.group(3)).find())return 2;
                return -1;
            }
            if("lrc".equals(format)){
                java.util.regex.Matcher line=java.util.regex.Pattern.compile("\\[(\\d{1,3}:\\d{2}(?:[.:]\\d+)?)\\]([^\\r\\n]*)").matcher(raw);boolean timed=false;
                while(line.find())if(!line.group(2).isBlank()&&Double.isFinite(time(line.group(1).replaceFirst("^(\\d+:\\d{2}):(\\d+)$","$1.$2"))))timed=true;
                java.util.regex.Matcher part=java.util.regex.Pattern.compile("<(\\d{1,3}:\\d{2}(?:\\.\\d+)?)>([^<\\r\\n]*)").matcher(raw);double previousTime=Double.NaN;String previous="";int rich=-1;
                while(part.find()){double at=time(part.group(1));String text=part.group(2);if(Double.isFinite(previousTime)&&Double.isFinite(at)&&at>previousTime&&!previous.isBlank())rich=Math.max(rich,joined(previous,text)?3:2);previousTime=at;previous=text;}
                if(timed&&rich>=2)return rich;
                return timed?1:-1;
            }
            return "plain".equals(format)||"txt".equals(format)?0:-1;
        }catch(Exception invalid){return -1;}
    }
    private static int ttml(String raw)throws Exception{
        if(raw.contains("<!DOCTYPE")||raw.contains("<!ENTITY"))return -1;
        XmlPullParserFactory factory=XmlPullParserFactory.newInstance();factory.setNamespaceAware(true);XmlPullParser p=factory.newPullParser();p.setInput(new StringReader(raw));
        boolean root=false,inP=false;int quality=-1;String previous="";ArrayDeque<Boolean> timed=new ArrayDeque<>();StringBuilder span=new StringBuilder();
        for(int e=p.getEventType();e!=XmlPullParser.END_DOCUMENT;e=p.next()){
            if(e==XmlPullParser.DOCDECL)return -1;
            if(e==XmlPullParser.START_TAG){
                String tag=p.getName();if(!root){if(!"tt".equals(tag))return -1;root=true;}
                if("p".equals(tag)){inP=true;previous="";}
                if(inP&&(tag.equals("p")||tag.equals("span"))){double begin=time(p.getAttributeValue(null,"begin")),end=time(p.getAttributeValue(null,"end")),duration=time(p.getAttributeValue(null,"dur"));boolean valid=Double.isFinite(begin)&&((Double.isFinite(end)&&end>begin)||(Double.isFinite(duration)&&duration>0));
                    if(tag.equals("p")&&valid)quality=Math.max(quality,1);
                    if(tag.equals("span")){timed.push(valid);span.setLength(0);}
                }
            }else if(e==XmlPullParser.TEXT&&inP){String text=p.getText();if(!text.isBlank())quality=Math.max(quality,0);if(!timed.isEmpty())span.append(text);else if(text.matches("(?s).*\\s+.*"))previous="";}
            else if(e==XmlPullParser.END_TAG){
                if(p.getName().equals("span")&&!timed.isEmpty()){boolean valid=timed.pop();String text=span.toString();if(valid&&!text.isBlank()){quality=Math.max(quality,2);if(joined(previous,text))quality=3;previous=text;}span.setLength(0);}
                if(p.getName().equals("p")){inP=false;timed.clear();previous="";}
            }
        }return root?quality:-1;
    }
}
