package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.Window;
import java.util.function.Consumer;

/** Owns one screen's state, not an Activity. Shared by standalone screens and native tabs. */
abstract class ToolScreenController extends ContextThemeWrapper {
    final Activity host;
    final boolean embedded;
    private Intent intent;
    private final Runnable back;
    private final Consumer<View> render;
    private boolean closed;
    private boolean finishPending;
    ToolScreenController(Activity host,Intent intent,boolean embedded,Runnable back,Consumer<View> render){
        super(SettingsTabUi.context(host),android.R.style.Theme_Material_Light_NoActionBar);
        this.host=host;this.intent=new Intent(intent);this.embedded=embedded;this.back=back;this.render=render;
    }
    final Intent getIntent(){return intent;}
    final void setIntent(Intent value){intent=new Intent(value);}
    final Window getWindow(){return host.getWindow();}
    final boolean isFinishing(){return closed||host.isFinishing();}
    final boolean isDestroyed(){return closed||host.isDestroyed();}
    final void finish(){
        if(closed||finishPending)return;
        finishPending=true;
        // A WebView/Compose callback may still be dispatching its touch event.
        // Do not detach its view tree or destroy the browser on that call stack.
        new android.os.Handler(android.os.Looper.getMainLooper()).post(()->{
            if(!isDestroyed()&&!host.isFinishing())back.run();
        });
    }
    final void runOnUiThread(Runnable action){host.runOnUiThread(()->{if(!isDestroyed())action.run();});}
    final void requestPermissions(String[] permissions,int code){host.requestPermissions(permissions,code);}
    final void showModel(String title,View model){
        boolean hissiViewer=intent.getBooleanExtra("haiagaru.native.hissiViewer",false);
        android.net.Uri data=intent.getData();
        String hostName=data==null?null:data.getHost();
        hissiViewer|=hostName!=null&&("hissi.org".equalsIgnoreCase(hostName)
                ||hostName.toLowerCase(java.util.Locale.ROOT).endsWith(".hissi.org"));
        render.accept(ToolScreenUi.model(host,hissiViewer?"":title,model,this::finish,!hissiViewer));
    }
    final void showSearch(HissiWacchoiSearchController controller){render.accept(SearchComposeUi.embed(host,controller));}
    final void showArchive(android.widget.LinearLayout model){render.accept(ToolScreenUi.archive(host,model,this::finish));}
    abstract void create(Bundle state);
    void resume(){}
    void pause(){}
    void save(Bundle state){}
    void close(){closed=true;}
}
