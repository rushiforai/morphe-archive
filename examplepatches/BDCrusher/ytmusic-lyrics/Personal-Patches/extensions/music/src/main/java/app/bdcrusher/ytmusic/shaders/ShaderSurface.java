/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.shaders;
import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.*;
import android.net.Uri;
import android.os.*;
import android.view.*;
import android.webkit.*;
import org.json.JSONObject;
import java.io.*;
import java.util.*;
import app.morphe.extension.shared.Logger;

/** Non-interactive local-only renderer. Remote pages never receive a JavaScript bridge. */
@SuppressLint("SetJavaScriptEnabled")
final class ShaderSurface extends WebView {
    static final String ROOT="https://appassets.androidplatform.net/bdcrusher-shaders/";
    private boolean ready,closed;
    private volatile byte[] image;
    private volatile File media;
    private int imageRevision,imageRequest;
    private Bitmap lastBitmap;private int lastBitmapRevision,lastBitmapTrack;
    static final java.util.concurrent.ExecutorService IMAGES=java.util.concurrent.Executors.newSingleThreadExecutor();
    private JSONObject state,settings;
    private String lastState="",lastSettings="";
    private boolean frameInput;
    ShaderSurface(Context c){
        super(c);setBackgroundColor(Color.TRANSPARENT);setFocusable(false);setClickable(false);setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        getSettings().setJavaScriptEnabled(true);getSettings().setAllowFileAccess(false);getSettings().setAllowContentAccess(false);getSettings().setMediaPlaybackRequiresUserGesture(false);
        addJavascriptInterface(new Bridge(),"BDShader");
        setWebViewClient(new WebViewClient(){
            @Override public boolean shouldOverrideUrlLoading(WebView view,WebResourceRequest request){return !request.getUrl().toString().startsWith(ROOT);}
            @Override public WebResourceResponse shouldInterceptRequest(WebView view,WebResourceRequest request){
                Uri uri=request.getUrl();if(!"https".equals(uri.getScheme())||!"appassets.androidplatform.net".equals(uri.getHost())||!uri.getPath().startsWith("/bdcrusher-shaders/"))return empty();
                String name=uri.getLastPathSegment();try{
                    if("art.jpg".equals(name)){byte[] current=image;return new WebResourceResponse("image/jpeg",null,new ByteArrayInputStream(current==null?new byte[0]:current));}
                    if("cover.mp4".equals(name))return video(request);
                    if(!Arrays.asList("index.html","shaders.js").contains(name))return empty();
                    return new WebResourceResponse("index.html".equals(name)?"text/html":"text/javascript","UTF-8",getContext().getAssets().open("bdcrusher-shaders/"+name));
                }catch(Exception ex){return empty();}
            }
            @Override public boolean onRenderProcessGone(WebView view,RenderProcessGoneDetail detail){setVisibility(INVISIBLE);closeSurface();return true;}
        });loadUrl(ROOT+"index.html");
    }
    private static WebResourceResponse empty(){return new WebResourceResponse("text/plain","UTF-8",new ByteArrayInputStream(new byte[0]));}
    private WebResourceResponse video(WebResourceRequest request)throws IOException{
        File current=media;if(current==null||!current.isFile())return empty();long size=current.length(),start=0,end=size-1;String range=request.getRequestHeaders().get("Range");if(range==null)range=request.getRequestHeaders().get("range");
        if(range!=null){java.util.regex.Matcher match=java.util.regex.Pattern.compile("bytes=(\\d+)-(\\d*)").matcher(range);if(!match.matches())return empty();try{start=Long.parseLong(match.group(1));if(!match.group(2).isEmpty())end=Math.min(end,Long.parseLong(match.group(2)));}catch(NumberFormatException invalid){return empty();}if(start>end||start>=size)return empty();}
        FileInputStream input=new FileInputStream(current);long skipped=0;while(skipped<start){long n=input.skip(start-skipped);if(n<=0){input.close();return empty();}skipped+=n;}long length=end-start+1;
        Map<String,String> headers=new HashMap<>();headers.put("Accept-Ranges","bytes");headers.put("Content-Length",Long.toString(length));headers.put("Cache-Control","no-store");if(range!=null)headers.put("Content-Range","bytes "+start+"-"+end+"/"+size);
        return new WebResourceResponse("video/mp4",null,range==null?200:206,range==null?"OK":"Partial Content",headers,new FilterInputStream(input){long left=length;@Override public int read()throws IOException{if(left<=0)return -1;int n=super.read();if(n>=0)left--;return n;}@Override public int read(byte[] b,int offset,int count)throws IOException{if(left<=0)return -1;int n=super.read(b,offset,(int)Math.min(count,left));if(n>0)left-=n;return n;}});
    }
    @Override @SuppressLint("ClickableViewAccessibility") public boolean onTouchEvent(MotionEvent event){return false;} // Deliberately non-interactive; native gestures pass through.
    void clearImage(){imageRequest++;image=null;lastBitmap=null;imageRevision++;}
    String imageUrl(){return image==null?"":ROOT+"art.jpg?g="+ShaderRuntime.generation()+"&r="+imageRevision;}
    void image(Bitmap bitmap,int expected){frameInput=bitmap!=null&&bitmap.getWidth()==208&&bitmap.getHeight()==117;if(bitmap==null||bitmap.isRecycled())return;int revision=bitmap.getGenerationId();if(bitmap==lastBitmap&&revision==lastBitmapRevision&&expected==lastBitmapTrack)return;lastBitmap=bitmap;lastBitmapRevision=revision;lastBitmapTrack=expected;int request=++imageRequest;IMAGES.execute(()->{try{if(closed||request!=imageRequest||bitmap==null||bitmap.isRecycled())return;int width=bitmap.getWidth(),height=bitmap.getHeight();float scale=Math.min(1,512f/Math.max(width,height));Bitmap small=scale<1?Bitmap.createScaledBitmap(bitmap,Math.max(1,Math.round(width*scale)),Math.max(1,Math.round(height*scale)),true):bitmap;ByteArrayOutputStream output=new ByteArrayOutputStream();small.compress(Bitmap.CompressFormat.JPEG,85,output);byte[] data=output.toByteArray();if(small!=bitmap)small.recycle();post(()->{if(closed||request!=imageRequest||expected!=ShaderRuntime.generation())return;image=data;imageRevision++;ShaderRuntime.refresh();});}catch(Exception ignored){}});}
    void update(JSONObject value,JSONObject configuration,File file){
        if(closed)return;state=value;try{state.put("frame",frameInput);}catch(Exception ignored){}settings=configuration;media=file;
        if(!ready)return;String next=value.toString(),options=configuration.toString();
        if(!options.equals(lastSettings)){lastSettings=options;evaluateJavascript("BDS.settings("+options+")",null);}
        if(!next.equals(lastState)){lastState=next;evaluateJavascript("BDS.state("+next+")",null);}
    }
    boolean solve(int id,JSONObject challenge){if(!ready||closed)return false;evaluateJavascript("BDS.solve("+id+","+challenge+")",null);return true;}
    void closeSurface(){if(closed)return;closed=true;if(ready)evaluateJavascript("BDS.close()",null);removeJavascriptInterface("BDShader");stopLoading();image=null;media=null;lastBitmap=null;destroy();}
    private final class Bridge {
        @JavascriptInterface public void ready(){post(()->{if(closed)return;ready=true;lastState="";lastSettings="";if(state!=null)update(state,settings,media);ArtworkToken.ensure(getContext());});}
        @JavascriptInterface public void proof(int id,String solution){ArtworkToken.proof(getContext(),id,solution);}
        @JavascriptInterface public void failure(String message){if(message!=null&&message.length()<=160)app.bdcrusher.ytmusic.common.FeatureDiagnostics.record("Shaders",message);}
        @JavascriptInterface public void mediaReady(int expected){post(()->{if(!closed&&expected==ShaderRuntime.generation())ShaderRuntime.refresh();});}
        @JavascriptInterface public void mediaError(int expected){post(()->{if(!closed&&expected==ShaderRuntime.generation())ShaderRuntime.mediaFailed();});}
    }
}
