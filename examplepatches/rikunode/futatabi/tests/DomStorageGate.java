package dev.rikunode.futatabi.domtest;
import android.app.*;
import android.content.*;
import android.os.*;
import android.webkit.*;
import java.lang.reflect.*;
import java.util.concurrent.*;
public final class DomStorageGate extends Instrumentation {
 public void onCreate(Bundle args) {super.onCreate(args);start();}
 public void onStart() {
  Bundle result=new Bundle();Activity activity=null;
  try {
   Intent i=new Intent().setClassName(getTargetContext().getPackageName(),"dev.rikunode.futatabi.bridge.MebukiLoginActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
   activity=startActivitySync(i);final Activity current=activity;
   Field f=activity.getClass().getDeclaredField("browser");f.setAccessible(true);final WebView view=(WebView)f.get(activity);
   Field statusField=activity.getClass().getDeclaredField("status");statusField.setAccessible(true);
   android.widget.TextView status=(android.widget.TextView)statusField.get(activity);
   CountDownLatch done=new CountDownLatch(1);
   runOnMainSync(()->{
    result.putBoolean("domStorage",view.getSettings().getDomStorageEnabled());
    result.putBoolean("thirdPartyCookies",CookieManager.getInstance().acceptThirdPartyCookies(view));
    result.putBoolean("firstPartyCookies",CookieManager.getInstance().acceptCookie());
    result.putBoolean("multipleWindows",view.getSettings().supportMultipleWindows());
    result.putBoolean("jsAutoWindows",view.getSettings().getJavaScriptCanOpenWindowsAutomatically());
    view.stopLoading();
    if(android.os.Build.VERSION.SDK_INT>=26) {
     WebResourceRequest req=new WebResourceRequest(){
      public android.net.Uri getUrl(){return android.net.Uri.parse("https://futatabi-dom-test.invalid/?fixture=not-a-real-secret");}
      public boolean isForMainFrame(){return true;}
      public boolean isRedirect(){return false;}
      public boolean hasGesture(){return false;}
      public String getMethod(){return "GET";}
      public java.util.Map<String,String> getRequestHeaders(){return java.util.Collections.emptyMap();}
     };
     WebResourceResponse resp=new WebResourceResponse("text/plain","UTF-8",503,"Synthetic",java.util.Collections.emptyMap(),null);
     view.getWebViewClient().onReceivedHttpError(view,req,resp);
     String label=status.getText().toString();
     result.putBoolean("httpErrorVisible",label.contains("503")&&!label.contains("fixture")&&!label.contains("secret"));
    }
    view.setWebViewClient(new WebViewClient(){
     public void onPageFinished(WebView v,String url){
      if(!"https://futatabi-dom-test.invalid/".equals(url))return;
      v.evaluateJavascript("(function(){try{localStorage.setItem('fixture','ok');var l=localStorage.getItem('fixture')==='ok';localStorage.removeItem('fixture');sessionStorage.setItem('fixture','ok');var s=sessionStorage.getItem('fixture')==='ok';sessionStorage.removeItem('fixture');return l&&s;}catch(e){return false;}})()",value->{result.putBoolean("storageRoundtrip","true".equals(value));done.countDown();});
     }
    });
    view.loadDataWithBaseURL("https://futatabi-dom-test.invalid/","<html><body>Synthetic DOM storage fixture</body></html>","text/html","UTF-8",null);
   });
   if(!done.await(15,TimeUnit.SECONDS))throw new AssertionError("fixture did not finish");
   finish(-1,result);
  }catch(Throwable ex){result.putString("failure",ex.getClass().getSimpleName()+": "+ex.getMessage());finish(0,result);}
 }
}
