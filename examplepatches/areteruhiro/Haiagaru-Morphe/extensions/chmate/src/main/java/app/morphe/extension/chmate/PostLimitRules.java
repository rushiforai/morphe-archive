package app.morphe.extension.chmate;

import java.util.*;

/** Posting units are server-defined. Keep UTF-16 editor offsets separate from displayed characters. */
final class PostLimitRules {
    interface Measure { int count(CharSequence text)throws Exception; }
    static final Measure UTF16=text->text.length();
    static final Measure CODE_POINTS=text->Character.codePointCount(text,0,text.length());
    static final class Limit {
        final int maximum;final String unit;final Measure measure;
        Limit(int maximum,String unit,Measure measure){this.maximum=Math.max(0,maximum);this.unit=unit;this.measure=measure;}
    }
    static final class Result {
        final int characters,used,lines,excessStart;
        Result(int characters,int used,int lines,int excessStart){this.characters=characters;this.used=used;this.lines=lines;this.excessStart=excessStart;}
    }
    static Result inspect(CharSequence text,Limit limit,int maxLines)throws Exception{
        int characters=text.length(),codePoints=Character.codePointCount(text,0,text.length()),used=limit.measure==null?characters:limit.measure.count(text);
        int excess=-1;
        if(limit.maximum>0&&limit.measure!=null&&used>limit.maximum){
            // Prefixes end only at Unicode code-point boundaries, never inside an emoji surrogate pair.
            int[] offsets=new int[codePoints+1];int at=0;
            for(int i=1;i<offsets.length;i++){at+=Character.charCount(Character.codePointAt(text,at));offsets[i]=at;}
            int low=1,high=codePoints;
            while(low<high){int middle=(low+high)>>>1;if(limit.measure.count(text.subSequence(0,offsets[middle]))>limit.maximum)high=middle;else low=middle+1;}
            excess=offsets[low-1];
        }
        int lines=text.length()==0?0:1;
        for(int i=0;i<text.length();i++)if(text.charAt(i)=='\n'||text.charAt(i)=='\r'){
            int separator=i;if(text.charAt(i)=='\r'&&i+1<text.length()&&text.charAt(i+1)=='\n')i++;
            if(++lines>maxLines&&maxLines>0&&excess<0)excess=separator;
            else if(maxLines>0&&lines>maxLines)excess=Math.min(excess,separator);
        }
        return new Result(characters,used,lines,excess);
    }
    static final class LineResult {
        final Result longest;final List<int[]> excess;
        LineResult(Result longest,List<int[]> excess){this.longest=longest;this.excess=excess;}
    }
    static LineResult inspectLines(CharSequence text,Limit limit)throws Exception{
        Result longest=inspect("",limit,0);List<int[]> excess=new ArrayList<>();int start=0;
        for(int end=0;end<=text.length();end++)if(end==text.length()||text.charAt(end)=='\r'||text.charAt(end)=='\n'){
            Result line=inspect(text.subSequence(start,end),limit,0);if(line.used>longest.used)longest=line;
            if(line.excessStart>=0&&line.excessStart<end-start)excess.add(new int[]{start+line.excessStart,end});
            if(end<text.length()&&text.charAt(end)=='\r'&&end+1<text.length()&&text.charAt(end+1)=='\n')end++;
            start=end+1;
        }
        return new LineResult(longest,excess);
    }
    static int lineMaximum(Map<String,String> values,String board){
        int configured=lineMaximum(values);if(configured>0)return configured;
        try{
            java.net.URI uri=java.net.URI.create(board);String host=uri.getHost(),path=uri.getPath();
            if(("nova.5ch.io".equalsIgnoreCase(host)||"nova.5ch.net".equalsIgnoreCase(host))
                    &&path!=null&&path.replaceAll("^/+|/+$","").equals("livegalileo"))return 1024;
        }catch(RuntimeException ignored){}
        return 0;
    }
    static int lineMaximum(Map<String,String> values){
        int chars=positive(values.get("BBS_MAX_LINE_CHARS"));if(chars>0)return chars;
        int bytes=positive(values.get("BBS_MAX_LINE_BYTES"));if(bytes>0)return bytes;
        String unit=values.getOrDefault("BBS_MAX_LINE_UNIT","").toLowerCase(Locale.ROOT);
        return unit.equals("chars")||unit.equals("characters")||unit.equals("bytes")?positive(values.get("BBS_MAX_LINE_LENGTH")):0;
    }
    static boolean lineCharacters(Map<String,String> values){return positive(values.get("BBS_MAX_LINE_CHARS"))>0||positive(values.get("BBS_MAX_LINE_BYTES"))==0&&!"bytes".equalsIgnoreCase(values.get("BBS_MAX_LINE_UNIT"));}
    static boolean lineCharacters(Map<String,String> values,String board){return lineMaximum(values)>0?lineCharacters(values):lineMaximum(values,board)==0;}
    static String summary(String name,Result result,Limit limit){
        StringBuilder out=new StringBuilder(name).append("：").append(result.characters).append("文字");
        if(limit.maximum<1||limit.measure==null)return out.append("（上限未取得）").toString();
        int remaining=limit.maximum-result.used;
        if(!"文字".equals(limit.unit))out.append("・").append(result.used).append('/').append(limit.maximum).append(limit.unit);
        else {if(result.used!=result.characters)out.append("（制限上").append(result.used).append("文字）");out.append(" / 上限").append(limit.maximum).append("文字");}
        return out.append(remaining>=0?"（残り":"（超過").append(Math.abs(remaining)).append(limit.unit).append('）').toString();
    }
    static String lineSummary(Result result,int maximum){
        if(maximum<1)return "行数："+result.lines+"行（上限未取得）";
        int remaining=maximum-result.lines;
        return "行数："+result.lines+'/'+maximum+"行（"+(remaining>=0?"残り":"超過")+Math.abs(remaining)+"行）";
    }
    static int positive(String value){
        try{double number=Double.parseDouble(value.trim());return Double.isFinite(number)&&number>0&&number<=1000000?(int)number:0;}catch(Exception invalid){return 0;}
    }
    static Map<String,String> settings(String source){
        Map<String,String> out=new HashMap<>();if(source==null||source.length()>131072)return out;
        for(String line:source.split("\\r?\\n")){int at=line.indexOf('=');if(at<1)continue;String key=line.substring(0,at).trim();
            if(key.matches("BBS_(SUBJECT_COUNT|MESSAGE_COUNT|LINE_NUMBER|MAX_LINES|MAX_LINE_CHARS|MAX_LINE_BYTES|MAX_LINE_LENGTH|MAX_LINE_UNIT|UNICODE|CHARSET)"))out.put(key,line.substring(at+1).trim());}
        return out;
    }
    static int lines(Map<String,String> settings,String host){
        int explicit=positive(settings.get("BBS_MAX_LINES"));if(explicit>0)return explicit;
        // Shitaraba's public line setting describes collapsed display, not rejected submissions.
        if(host!=null&&(host.equals("jbbs.shitaraba.net")||host.equals("jbbs.livedoor.jp")))return 0;
        int nativeLines=positive(settings.get("BBS_LINE_NUMBER"));return nativeLines>0?Math.min(1000000,nativeLines*2):0;
    }
    private PostLimitRules(){}
}
