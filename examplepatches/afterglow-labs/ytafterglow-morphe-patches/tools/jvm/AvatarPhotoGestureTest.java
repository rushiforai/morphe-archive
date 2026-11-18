package app.afterglow.extension.menus;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Handler;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.litho.LithoContext;
import app.afterglow.extension.settings.AfterglowPrefs;
import java.lang.ref.WeakReference;

/** Executes the production binding/gesture code against a deterministic Android boundary. */
public final class AvatarPhotoGestureTest {
    private static int checks;
    private static final String URL="https://yt3.ggpht.com/profile=s88-c-k-c0x00ffffff-no-rj";
    private static final String PATH="comment.eml-js-fe|1234567890abcdef|ContainerType|avatar.eml-fe|fd3e1a338fad6b68|ImageType|";
    private static void check(boolean value,String what){checks++;if(!value)throw new AssertionError(what);}
    private static LithoContext context(String path){return new LithoContext(){
        public String afterglow_getIdentifier(){return "comment.eml-js-fe|1234567890abcdef";}
        public StringBuilder afterglow_getPathBuilder(){return new StringBuilder(path);}
        public Integer afterglow_getHeightConstraint(){return null;}
        public Object afterglow_getSwipeProtector(){return null;}
    };}
    private static final class Fixture {
        final Activity activity=new Activity();
        final ViewGroup decor=new ViewGroup(activity),host=new ViewGroup(activity),nested=new ViewGroup(activity);
        final ImageView image=new ImageView(activity);
        final Object callback=new Object();
        final WeakReference<View> token=new WeakReference<>(host);
        final long down;
        Fixture(){
            Handler.advance(1000);InstalledTweaks.installed=true;AfterglowPrefs.avatar=true;
            activity.window.decor=decor;decor.addView(host);host.addView(nested);nested.addView(image);
            Afterglow.activity=activity;down=++SystemClock.now;
            AvatarPhotoActions.bind(image,callback,context(PATH),URL,token);
        }
        void loaded(){AvatarPhotoActions.loaded(image,callback);}
        MotionEvent event(int action){return new MotionEvent(down,action,30,40);}
        void start(){AvatarPhotoActions.onTouch(host,event(MotionEvent.ACTION_DOWN));}
        boolean claim(){return AvatarPhotoActions.claimsTouch(host,event(MotionEvent.ACTION_DOWN));}
        void absentAfterHold(String reason){int before=AlertDialog.opens;start();Handler.advance(301);check(AlertDialog.opens==before,reason);AvatarPhotoActions.onTouch(host,event(MotionEvent.ACTION_UP));}
    }
    public static void main(String[] args){
        Fixture f=new Fixture();check(!f.claim(),"placeholder never claims");f.loaded();check(f.claim(),"loaded exact avatar claims");
        check(!AvatarPhotoActions.claimsTouch(f.host,f.event(MotionEvent.ACTION_MOVE)),"priority is side-effect-free down only");
        int before=AlertDialog.opens;Object listener=f.image.nativeListener;
        check(!AvatarPhotoActions.onTouch(f.host,f.event(MotionEvent.ACTION_DOWN)),"native down retained");
        Handler.advance(299);check(AlertDialog.opens==before,"hold has not fired early");Handler.advance(1);
        check(AlertDialog.opens==before+1,"300ms hold opens once");check(f.host.cancels==1,"native gesture cancelled only after open");
        check(f.image.nativeListener==listener,"native listener unchanged");
        check(AlertDialog.last.choices.length==2,"save and copy available on supported Android");
        check(AvatarPhotoActions.onTouch(f.host,f.event(MotionEvent.ACTION_UP)),"shown sheet consumes trailing up");
        Handler.advance(400);check(AlertDialog.opens==before+1,"no duplicate timer sheet");

        f=new Fixture();f.loaded();f.start();AvatarPhotoActions.onTouch(f.host,f.event(MotionEvent.ACTION_UP));before=AlertDialog.opens;
        Handler.advance(301);check(AlertDialog.opens==before,"short tap stays native");check(f.host.cancels==0,"tap never cancels native");
        f=new Fixture();f.loaded();f.start();MotionEvent moved=f.event(MotionEvent.ACTION_MOVE);moved.rawX+=17;
        AvatarPhotoActions.onTouch(f.host,moved);before=AlertDialog.opens;Handler.advance(301);check(AlertDialog.opens==before,"scroll beyond slop cancels");
        f=new Fixture();f.loaded();f.start();MotionEvent multi=f.event(MotionEvent.ACTION_POINTER_DOWN);multi.pointers=2;
        AvatarPhotoActions.onTouch(f.host,multi);before=AlertDialog.opens;Handler.advance(301);check(AlertDialog.opens==before,"multi-touch cancels");
        f=new Fixture();f.loaded();f.start();AvatarPhotoActions.onTouch(f.host,f.event(MotionEvent.ACTION_CANCEL));before=AlertDialog.opens;
        Handler.advance(301);check(AlertDialog.opens==before,"native cancel cancels hold");

        f=new Fixture();f.loaded();AfterglowPrefs.avatar=false;check(!f.claim(),"preference off never claims");f.absentAfterHold("preference off no sheet");
        f=new Fixture();f.loaded();InstalledTweaks.installed=false;check(!f.claim(),"absent owner never claims");f.absentAfterHold("absent owner no sheet");
        f=new Fixture();f.loaded();f.start();AfterglowPrefs.avatar=false;before=AlertDialog.opens;Handler.advance(301);
        check(AlertDialog.opens==before,"preference change during hold revalidated");
        f=new Fixture();f.loaded();f.start();f.token.clear();before=AlertDialog.opens;Handler.advance(301);
        check(AlertDialog.opens==before,"native root token cleared during hold");check(!f.claim(),"cleared native token rejected");
        f=new Fixture();f.loaded();f.start();AvatarPhotoActions.unbind(f.image);before=AlertDialog.opens;Handler.advance(301);
        check(AlertDialog.opens==before,"native unmount cancels hold");check(!f.claim(),"native unmount removes binding");

        f=new Fixture();Object replacement=new Object();AvatarPhotoActions.bind(f.image,replacement,context(PATH),URL,f.token);
        f.loaded();check(!f.claim(),"stale image callback cannot mark replacement ready");
        AvatarPhotoActions.loaded(f.image,replacement);check(f.claim(),"current replacement callback marks ready");
        f.start();AvatarPhotoActions.bind(f.image,f.callback,context(PATH),URL,f.token);f.loaded();before=AlertDialog.opens;Handler.advance(301);
        check(AlertDialog.opens==before,"recycled target invalidates armed hold");
        f=new Fixture();f.loaded();AvatarPhotoActions.bind(f.image,f.callback,context("thumbnail.eml-fe|fd3e1a338fad6b68|ImageType|"),URL,f.token);
        check(!f.claim(),"non-avatar rebind clears old identity");
        f=new Fixture();f.loaded();AvatarPhotoActions.bind(f.image,f.callback,context(PATH),"https://example.com/profile",f.token);f.loaded();
        check(!f.claim(),"foreign source cannot reuse avatar identity");
        f=new Fixture();f.loaded();f.image.drawable=null;check(!f.claim(),"no drawable rejected");
        f=new Fixture();f.loaded();f.image.attached=false;check(!f.claim(),"detached image rejected");
        f=new Fixture();f.loaded();f.image.shown=false;check(!f.claim(),"hidden image rejected");
        f=new Fixture();f.loaded();f.image.enabled=false;check(!f.claim(),"disabled image rejected");
        f=new Fixture();f.loaded();f.image.parent=f.decor;check(!f.claim(),"image outside its captured native root rejected");
        f=new Fixture();AvatarPhotoActions.bind(f.image,f.callback,context(PATH),URL,null);
        check(!f.claim(),"absent optional context token still requires native resource-ready callback");f.loaded();
        check(f.claim(),"exact current native avatar supports renderer without context token");
        before=AlertDialog.opens;f.start();Handler.advance(300);check(AlertDialog.opens==before+1,"tokenless native avatar opens its own sheet");
        AvatarPhotoActions.onTouch(f.host,f.event(MotionEvent.ACTION_UP));
        check(f.image.attachListenerCount()==1,"rebind replaces lifecycle listener instead of duplicating it");
        f=new Fixture();AvatarPhotoActions.bind(f.image,f.callback,context(PATH),URL,null);f.loaded();f.start();
        before=AlertDialog.opens;f.image.detach();Handler.advance(300);
        check(AlertDialog.opens==before&&!f.claim(),"detach cancels tokenless image identity and pending hold");
        check(f.image.attachListenerCount()==0,"detach removes its lifecycle observer");
        f.image.attached=true;check(!f.claim(),"reattach cannot resurrect detached image binding");
        AvatarPhotoActions.loaded(f.image,f.callback);check(!f.claim(),"late ready callback cannot revive detached image");
        AvatarPhotoActions.bind(f.image,f.callback,context(PATH),URL,null);f.loaded();check(f.claim(),"a fresh exact native rebind may restore image actions");
        AvatarPhotoActions.bind(f.image,f.callback,context(PATH),URL,new Object());f.loaded();check(!f.claim(),"unexpected non-null root token type is rejected");
        check(f.image.attachListenerCount()==0,"rejected rebind clears old lifecycle observer");
        f=new Fixture();AvatarPhotoActions.bind(f.image,f.callback,context(PATH),URL,null);f.loaded();Afterglow.activity=new Activity();Afterglow.activity.window.decor=new ViewGroup(Afterglow.activity);
        check(!f.claim(),"tokenless exact image still requires the current activity window");
        f=new Fixture();f.loaded();Afterglow.activity=new Activity();Afterglow.activity.window.decor=new ViewGroup(Afterglow.activity);
        check(!f.claim(),"previous activity view tree rejected");
        f=new Fixture();f.loaded();f.activity.destroyed=true;check(!f.claim(),"destroyed activity rejected");
        f=new Fixture();f.loaded();f.activity.finishing=true;check(!f.claim(),"finishing activity rejected");
        f=new Fixture();f.loaded();f.host.focus=false;f.absentAfterHold("unfocused native host cannot open sheet");
        f=new Fixture();f.loaded();f.image.visible=new android.graphics.Rect();f.image.visible.set(40,0,64,64);
        check(!f.claim(),"clipped image point rejected");
        f=new Fixture();f.loaded();check(!AvatarPhotoActions.claimsTouch(new ViewGroup(f.activity),f.event(MotionEvent.ACTION_DOWN)),"unrelated host cannot claim");

        f=new Fixture();f.loaded();ImageView duplicate=new ImageView(f.activity);f.nested.addView(duplicate);Object second=new Object();
        AvatarPhotoActions.bind(duplicate,second,context(PATH),URL,f.token);AvatarPhotoActions.loaded(duplicate,second);
        check(!f.claim(),"ambiguous overlapping avatars not guessed");AvatarPhotoActions.unbind(duplicate);check(f.claim(),"unique remaining avatar accepted");
        f.start();AvatarPhotoActions.onTouch(f.nested,f.event(MotionEvent.ACTION_DOWN));before=AlertDialog.opens;Handler.advance(300);
        check(AlertDialog.opens==before+1,"same down through parent and child opens one sheet");
        check(f.host.cancels==1&&f.nested.cancels==0,"first native host retains gesture ownership");
        AvatarPhotoActions.onTouch(f.host,f.event(MotionEvent.ACTION_UP));
        f=new Fixture();f.loaded();android.os.Build.VERSION.SDK_INT=28;f.start();Handler.advance(300);
        check(AlertDialog.last.choices.length==1&&AlertDialog.last.choices[0].startsWith("Copy"),"unsupported MediaStore save not offered");
        AvatarPhotoActions.onTouch(f.host,f.event(MotionEvent.ACTION_UP));android.os.Build.VERSION.SDK_INT=36;
        check(app.afterglow.extension.diagnostics.DebugLog.messages.isEmpty(),"diagnostics opt out produces no messages");
        app.afterglow.extension.diagnostics.DebugLog.enabled=true;
        f=new Fixture();f.loaded();f.start();AvatarPhotoActions.onTouch(f.host,f.event(MotionEvent.ACTION_UP));
        check(app.afterglow.extension.diagnostics.DebugLog.messages.stream().anyMatch(s->s.startsWith("Avatar down enabled=true")&&s.contains(" hit=")),"diagnostics distinguish dispatch and exact image hit stages");
        for(int i=0;i<80;i++){f=new Fixture();f.loaded();f.start();AvatarPhotoActions.onTouch(f.host,f.event(MotionEvent.ACTION_UP));}
        check(app.afterglow.extension.diagnostics.DebugLog.messages.size()<=64,"avatar stage diagnostics bounded per process");
        check(app.afterglow.extension.diagnostics.DebugLog.messages.stream().noneMatch(s->s.contains("https:")||s.contains("profile=")||s.contains("avatar.eml")||s.contains(PATH)),"diagnostics contain no image URLs or component paths");
        System.out.println("PASS: "+checks+" production avatar lifecycle checks");
    }
}
