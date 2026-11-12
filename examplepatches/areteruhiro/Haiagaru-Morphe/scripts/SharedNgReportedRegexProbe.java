import java.util.regex.*;
public class SharedNgReportedRegexProbe {
 public static void main(String[] args){
 String body="ﾜｯﾁｮｲやIPのNGも「()」「-」や「ﾜｯﾁｮｲ」を対象外にしないと同じ事をされると思う";
 String tail="\\p{Extended_Pictographic}{6}|ゴミ|死期|ワッチョイワッチョイ老害」信者|無能|ガイジ|コロコロ";
 for(String prefix:new String[]{"(^\\n)","(^\n)\n","(^\\n)|","(^\n)|",""}){
 String regex=prefix+tail;System.out.println("REGEX "+regex.replace("\n","<LF>"));
 try{Matcher m=Pattern.compile(regex).matcher(body);boolean found=false;while(m.find()){found=true;System.out.println("MATCH "+m.start()+":"+m.end()+" <"+m.group()+">");}System.out.println("matched="+found);}catch(Throwable e){System.out.println(e);}
 }
 }
}