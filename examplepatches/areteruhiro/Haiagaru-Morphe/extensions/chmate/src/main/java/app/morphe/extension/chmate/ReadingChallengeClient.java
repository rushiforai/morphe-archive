package app.morphe.extension.chmate;

import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.widget.LinearLayout;
import android.widget.TextView;

/** A pre-existing clearance cookie alone must not close an unfinished or failed challenge. */
final class ReadingChallengeClient extends WebViewClient {
    private final WebViewClient nativeClient;
    private TextView status;
    private boolean failed;
    private long navigation;
    ReadingChallengeClient(WebView web,WebViewClient original){
        nativeClient=original;
        if(web.getParent() instanceof LinearLayout){
            LinearLayout parent=(LinearLayout)web.getParent();
            status=new TextView(web.getContext());
            int padding=(int)(12*web.getResources().getDisplayMetrics().density);
            status.setPadding(padding,padding,padding,padding);
            status.setText("確認ページを読み込んでいます…");
            status.setOnClickListener(v->web.reload());
            parent.addView(status,parent.indexOfChild(web),new LinearLayout.LayoutParams(-1,-2));
        }
    }
    private void message(String text){if(status!=null)status.setText(text);}
    @Override public void onPageStarted(WebView web,String url,android.graphics.Bitmap icon){
        navigation++;failed=false;message("サイト上で確認を完了してください。ここをタップすると再読み込みします。");
        nativeClient.onPageStarted(web,url,icon);
    }
    @Override public void onReceivedHttpError(WebView web,WebResourceRequest request,WebResourceResponse response){
        if(request.isForMainFrame()){
            failed=true;
            message("サイトの確認が必要です（HTTP "+response.getStatusCode()+"）。確認画面を操作してください。タップで再読み込み。");
        }
    }
    @Override public void onReceivedError(WebView web,WebResourceRequest request,android.webkit.WebResourceError error){
        if(request.isForMainFrame()){
            failed=true;message("確認ページを読み込めませんでした。接続を確認して、ここをタップで再読み込み。");
        }
    }
    @Override public void onReceivedSslError(WebView web,android.webkit.SslErrorHandler handler,android.net.http.SslError error){
        failed=true;handler.cancel();message("証明書を確認できないため接続を停止しました。");
    }
    @Override public void onPageFinished(WebView web,String url){
        if(!ReadingAuthRules.isPage(url)||failed||!ReadingAuth.hasClearance(url))return;
        long generation=navigation;
        web.evaluateJavascript("JSON.stringify([document.title,!!document.querySelector('[id^=\"cf-chl\"],iframe[src*=\"challenges.cloudflare.com\"],form#challenge-form'),!!document.body&&document.body.innerText.trim().length>0])",value->{
            if(failed||generation!=navigation||!url.equals(web.getUrl())||!web.isAttachedToWindow())return;
            try{
                Object decoded=new org.json.JSONTokener(value).nextValue();
                org.json.JSONArray page=new org.json.JSONArray(String.valueOf(decoded));
                if(ReadingAuthRules.challengeTitle(page.optString(0))||page.optBoolean(1,true)||!page.optBoolean(2,false))return;
                nativeClient.onPageFinished(web,url);
            }catch(org.json.JSONException invalid){ /* Keep incomplete verification visible. */ }
        });
    }
}
