package dev.rikunode.futatabi.bridge;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Private read-only rendering; no private thread response enters the HTTP server. */
public final class MebukiReaderActivity extends Activity {
    static final String ID = "virtualId";
    private static final String BASE = "https://futatabi.invalid/";
    private final ExecutorService io = Executors.newSingleThreadExecutor();
    private MebukiAdapter adapter;
    private WebView web;
    private TextView status;
    private String id, session="";
    private MebukiThreadData data;
    private int generation;
    private boolean loading, imageLoading;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        id=getIntent().getStringExtra(ID);
        adapter=new MebukiAdapter(this);
        if(adapter.slugForThreadId(id)==null){finish();return;}
        setTitle("\u3081\u3076\u304d");
        LinearLayout page=new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        if(getActionBar()!=null)getActionBar().hide();
        if(android.os.Build.VERSION.SDK_INT>=30){
            getWindow().setDecorFitsSystemWindows(false);
            page.setOnApplyWindowInsetsListener((v,insets)->{
                android.graphics.Insets safe=insets.getInsets(android.view.WindowInsets.Type.systemBars()
                        |android.view.WindowInsets.Type.displayCutout());
                v.setPadding(safe.left,safe.top,safe.right,safe.bottom);
                return android.view.WindowInsets.CONSUMED;
            });
        }else page.setFitsSystemWindows(true);
        LinearLayout controls=new LinearLayout(this);
        button(controls,"\u623b\u308b",this::finish);
        button(controls,"\u66f4\u65b0",this::reload);
        button(controls,"\u30ed\u30b0\u30a4\u30f3\u78ba\u8a8d",()->startActivityForResult(new Intent(this,MebukiLoginActivity.class),1));
        page.addView(controls);
        status=new TextView(this);status.setPadding(12,8,12,8);page.addView(status);
        web=new WebView(this);web.setSaveEnabled(false);
        web.getSettings().setJavaScriptEnabled(false);
        web.getSettings().setDomStorageEnabled(false);
        web.getSettings().setAllowFileAccess(false);
        web.getSettings().setAllowContentAccess(false);
        web.getSettings().setBlockNetworkLoads(true);
        web.getSettings().setCacheMode(android.webkit.WebSettings.LOAD_NO_CACHE);
        web.setWebViewClient(new WebViewClient(){
            @Override public boolean shouldOverrideUrlLoading(WebView v,android.webkit.WebResourceRequest r){
                return !r.isForMainFrame()||handleLink(r.getUrl().toString());
            }
            @SuppressWarnings("deprecation")
            @Override public boolean shouldOverrideUrlLoading(WebView v,String url){return handleLink(url);}
        });
        page.addView(web,new LinearLayout.LayoutParams(-1,0,1));
        setContentView(page);page.requestApplyInsets();reload();
    }
    private void button(LinearLayout row,String title,Runnable run){
        Button b=new Button(this);b.setText(title);row.addView(b,new LinearLayout.LayoutParams(0,-2,1));
        b.setOnClickListener(v->run.run());
    }
    private boolean handleLink(String url){
        if(url.matches("https://futatabi[.]invalid/#post[0-9]{1,4}"))return false;
        if(url.matches("https://futatabi[.]invalid/attachment/[0-9]{1,3}"))
            showImage(Integer.parseInt(url.substring(url.lastIndexOf('/')+1)));
        return true;
    }
    private void reload(){
        if(loading||isFinishing()||isDestroyed()||web==null)return;
        final int epoch=++generation;
        loading=true;data=null;session="";
        web.loadDataWithBaseURL(BASE,"<html><body></body></html>","text/html","UTF-8",null);
        status.setText("\u8a8d\u8a3c\u3068\u30b9\u30ec\u672c\u6587\u3092\u78ba\u8a8d\u4e2d...");
        io.execute(()->{
            final String cookie=MebukiSession.saved(this);
            try{
                MebukiThreadData result=adapter.readPrivateThread(this,id);
                runOnUiThread(()->{
                    if(!active(epoch))return;
                    loading=false;
                    if(!cookie.equals(MebukiSession.saved(this))){
                        status.setText("SESSION_CHANGED \u66f4\u65b0\u3057\u3066\u304f\u3060\u3055\u3044");return;
                    }
                    data=result;session=cookie;
                    status.setText("\u8a8d\u8a3c\u6e08\u307f \u2022 "+result.count+" \u6295\u7a3f");
                    web.loadDataWithBaseURL(BASE,BridgePalette.decorate(result.html,BridgePalette.get(this)),"text/html","UTF-8",null);
                });
            }catch(Exception ex){
                final String reason=ex instanceof MebukiSession.ReadFailure?ex.getMessage():"READ_FAILED";
                runOnUiThread(()->{if(!active(epoch))return;loading=false;
                    status.setText("\u672c\u6587\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093 ("+reason+")\u3002\u30ed\u30b0\u30a4\u30f3\u78ba\u8a8d\u307e\u305f\u306f\u66f4\u65b0\u3092\u304a\u8a66\u3057\u304f\u3060\u3055\u3044\u3002");});
            }
        });
    }
    private boolean active(int epoch){return !isFinishing()&&!isDestroyed()&&epoch==generation;}
    private void showImage(int n){
        if(data==null||n<0||n>=data.images.size()||loading||imageLoading||!session.equals(MebukiSession.saved(this)))return;
        imageLoading=true;
        final int epoch=generation;final String url=data.images.get(n),cookie=session;
        io.execute(()->{
            Bitmap bitmap=null;
            try{
                if(MebukiSession.verify(cookie)!=MebukiSession.State.AUTHENTICATED)throw new IllegalStateException();
                byte[] bytes=adapter.readPrivateImage(url);
                BitmapFactory.Options opt=new BitmapFactory.Options();opt.inJustDecodeBounds=true;
                BitmapFactory.decodeByteArray(bytes,0,bytes.length,opt);
                if(opt.outWidth<=0||opt.outHeight<=0||opt.outWidth>16000||opt.outHeight>16000||
                        (long)opt.outWidth*opt.outHeight>40_000_000L)throw new IllegalArgumentException();
                opt.inJustDecodeBounds=false;opt.inSampleSize=1;
                // Decode original for screen display, sampling only very large bitmaps.
                while(Math.max(opt.outWidth,opt.outHeight)/opt.inSampleSize>4096||
                        (long)(opt.outWidth/opt.inSampleSize)*(opt.outHeight/opt.inSampleSize)>8_000_000L)opt.inSampleSize*=2;
                bitmap=BitmapFactory.decodeByteArray(bytes,0,bytes.length,opt);
            }catch(Exception ignored){}
            final Bitmap value=bitmap;
            runOnUiThread(()->{
                imageLoading=false;
                if(!active(epoch)||!cookie.equals(MebukiSession.saved(this))){if(value!=null)value.recycle();return;}
                if(value==null){new AlertDialog.Builder(this).setMessage("\u753b\u50cf\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093").setPositiveButton("OK",null).show();return;}
                ImageView image=new ImageView(this);image.setAdjustViewBounds(true);image.setImageBitmap(value);
                new AlertDialog.Builder(this).setView(image).setPositiveButton("OK",null).show();
            });
        });
    }
    @Override protected void onActivityResult(int request,int result,Intent intent){
        super.onActivityResult(request,result,intent);if(request==1&&result==RESULT_OK)reload();
    }
    @Override protected void onResume(){super.onResume();if(data!=null&&!session.equals(MebukiSession.saved(this)))reload();}
    @Override protected void onDestroy(){generation++;data=null;session="";io.shutdownNow();if(web!=null){web.destroy();web=null;}super.onDestroy();}
}
