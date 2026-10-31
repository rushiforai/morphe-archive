package e.e.a;
import java.io.IOException;import java.net.URL;
/** Adapt Java default-method fixtures to dex2jar's desugared interface shape. */
abstract class PlanFetch250 implements CacheTransferPlan.Fetch {
 interface Text {String text(URL url)throws IOException;}
 public void assets(int count){}public long length(URL url)throws IOException{return -1;}
 static long bytes(URL url,Text source)throws IOException{return CacheTransferPlan.bytes(url,new PlanFetch250(){public String text(URL next)throws IOException{return source.text(next);}});}
 static long bytes(URL url,CacheTransferPlan.Fetch source)throws IOException{return CacheTransferPlan.bytes(url,source);}
}
