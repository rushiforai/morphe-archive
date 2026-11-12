package e.e.a;
import java.util.Locale;
/** Refresh AES-128 key identity per playlist reload, retaining the signed HTTP URL. */
public final class HlsKeyRefreshPolicy {
 private HlsKeyRefreshPolicy(){}
 public static boolean isAes128KeyLine(String line){
  if(line==null||!line.startsWith("#EXT-X-KEY:"))return false;
  String header=line.toUpperCase(Locale.ROOT);
  int p=header.indexOf("METHOD=");
  if(p<0)return false;
  String method=header.substring(p+7);
  return method.startsWith("AES-128")&&
         (method.length()==7||method.charAt(7)==','||method.charAt(7)==' ');
 }
 public static String rewriteLine(String line,long refreshId){
  if(!isAes128KeyLine(line)||refreshId<1)return line;
  int index=line.indexOf("URI=\"");
  if(index<0)return line;
  int begin=index+5,end=line.indexOf('"',begin);
  if(end<=begin)return line;
  String uri=line.substring(begin,end);
  if(uri.isEmpty()||uri.indexOf('\r')>=0||uri.indexOf('\n')>=0)return line;
  String suffix=(uri.indexOf('#')<0?"#":"&")+"nicoid-key-refresh-"+refreshId;
  return line.substring(0,end)+suffix+line.substring(end);
 }
}
