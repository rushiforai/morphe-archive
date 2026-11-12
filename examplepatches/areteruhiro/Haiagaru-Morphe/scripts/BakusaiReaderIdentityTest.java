package app.morphe.extension.chmate;
import java.nio.file.*;import java.io.*;import org.jsoup.Jsoup;
public final class BakusaiReaderIdentityTest {
 static int checks;static void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 public static void main(String[]args)throws Exception{
  Path dir=Path.of(args[0]);var board=SiteBoardProtocol.address("https://bakusai.com/thr_res/acode=1/ctgid=132/bid=2434/tid=3099994/");
  String initial=Files.readString(dir.resolve("android.raw")),first=Files.readString(dir.resolve("android-p1.raw")),last=Files.readString(dir.resolve("android-p3.raw"));
  for(String html:new String[]{initial,first,last})ok(Jsoup.parse(html).selectFirst("select[name=p] option[selected]").attr("value").equals("2"),"actual WebView responses repeat page two despite requested page");
  try{BakusaiPagination.thread(board,board.thread,initial,u->u.contains("/p=1/")?first:last);throw new AssertionError("missing replies must not be silently accepted");}catch(IOException expected){ok(expected.getMessage().contains("全件取得"),"reported 503 reproduced without forging missing content");}
  String complete=Files.readString(dir.resolve("native.raw"));var page=BakusaiPagination.thread(board,board.thread,complete,u->{throw new AssertionError("complete representation needs no extra request");});
  ok(page.entries.size()==16,"real Haiagaru response contains OP and all fifteen replies");
  for(int n=0;n<16;n++){var row=page.entries.get(n);ok(row.original.equals(Integer.toString(n)),"original numbering preserved");ok(!row.name.equals("未取得"),"real response never replaced with placeholder");}
  String dat=new String(SiteNativeData.dat(board,page,x->x,x->x),"windows-31j");ok(dat.split("\n").length==16,"all real rows reach native DAT");ok(page.title.equals("ワカサギ釣り"),"reported thread title preserved");
  System.out.println("PASS "+checks+" actual repeated-page and complete native-client regressions");
 }
}
