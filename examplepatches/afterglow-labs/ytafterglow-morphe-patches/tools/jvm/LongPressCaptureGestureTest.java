package app.afterglow.extension.menus;

import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.ui.LongPressCaptureSheet;
import java.util.ArrayList;
import java.util.List;

/** Observable native-facing boundaries; production gesture code is compiled unchanged. */
public final class LongPressCaptureGestureTest {
    private static int checks;
    private static final String TEXT="This actual native comment retains its own text\nand line breaks.";
    private static final Activity activity=new Activity();
    private static final class Root extends ViewGroup implements LongPressCaptureHost {
        final List<CharSequence> text=new ArrayList<>(List.of("Author",TEXT,"Reply"));
        Root(){super(activity);}
        public List<CharSequence> afterglow_captureTextItems(){return text;}
    }
    private static final class Context implements LongPressCaptureContext {
        final Root root;final Object token;final String identity;
        Context(Root root,Object token,String identity){this.root=root;this.token=token;this.identity=identity;}
        public View afterglow_captureRoot(){return root;}
        public Object afterglow_captureBinding(){return token;}
        public String afterglow_captureIdentifier(){return "comment_thread.e";}
        public StringBuilder afterglow_capturePath(){return new StringBuilder("root|comment.e|"+identity+"|"+"ContainerType|".repeat(7)+"TextType|");}
    }
    private static final class PostContext implements LongPressCaptureContext {
        final Root root;final Object token;
        PostContext(Root root,Object token){this.root=root;this.token=token;}
        public View afterglow_captureRoot(){return root;}
        public Object afterglow_captureBinding(){return token;}
        public String afterglow_captureIdentifier(){return "images_post_root_slim.eml-fe|46f80e605e6300a9";}
        public StringBuilder afterglow_capturePath(){return new StringBuilder("images_post_root_slim.eml-fe|46f80e605e6300a9|CellType|images_post_slim.eml-fe|ffb55ce8b2f575b8|ContainerType|ContainerType|ContainerType|post_text.eml-fe|946bdce24a350fb4|ContainerType|ExpandableTextType|");}
    }
    private static final class TextComponent implements LongPressPostComponent {
        final Object data;final PostContext context;
        TextComponent(Object data,PostContext context){this.data=data;this.context=context;}
        public Object afterglow_postTextInput(){return data;}
        public Object afterglow_postTextContext(){return context;}
    }
    private static final class EqualInput {
        @Override public int hashCode(){return 1;}
        @Override public boolean equals(Object other){return other instanceof EqualInput;}
    }
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static boolean touch(Root root,int action,float x,float y){return LongPressCaptureTools.onTouch(root,new MotionEvent(action,x,y));}
    private static Context bind(Root root){Object token=new Object();LongPressCaptureTools.bindRoot(root,token);Context owner=new Context(root,token,"comment-one");check(LongPressCaptureTools.onText(owner,TEXT)==TEXT,"Observer preserves native text instance");return owner;}
    private static void down(Root root){check(!touch(root,MotionEvent.ACTION_DOWN,20,30),"Native receives initial down");}
    private static void noOpen(Root root,Runnable between,String reason){int before=LongPressCaptureSheet.opens;down(root);between.run();Handler.advance(300);check(LongPressCaptureSheet.opens==before,reason);touch(root,MotionEvent.ACTION_UP,20,30);}
    public static void main(String[] args){
        Root root=new Root();final Context context=bind(root);Object listener=root.nativeListener;
        noOpen(root,()->{},"Default OFF retains native gesture");
        AfterglowPrefs.comments=true;InstalledTweaks.installed=false;
        noOpen(root,()->{},"Absent owner retains native gesture");InstalledTweaks.installed=true;
        AvatarPhotoActions.claim=true;noOpen(root,()->{},"Exact selected avatar owns its hold instead of comment capture");AvatarPhotoActions.claim=false;
        down(root);Handler.advance(299);check(LongPressCaptureSheet.opens==0,"No sheet before iOS 300ms threshold");Handler.advance(1);
        check(LongPressCaptureSheet.opens==1,"One verified comment opens sheet");
        check(root.cancels==1&&root.haptics==1,"Child native gesture receives cancel and one haptic");
        check(Bitmap.last.width==root.width&&Bitmap.last.height==root.height&&root.draws==1,"Capture belongs to exact native root");
        check(root.nativeListener==listener&&!root.longClickable,"Retained native listener and disabled long-click flag remain untouched");
        check(touch(root,MotionEvent.ACTION_UP,20,30),"Claimed hold consumes its release");
        LongPressCaptureSheet.text.run();check(activity.clipboard.value.text.equals(TEXT),"Copied text preserves source line breaks");
        LongPressCaptureSheet.copy.run();check(LongPressImageProvider.copied==Bitmap.last,"Copy image receives verified capture");
        LongPressCaptureSheet.save.run();check(LongPressImageProvider.saved==Bitmap.last,"Save image receives same verified capture");
        noOpen(root,()->touch(root,MotionEvent.ACTION_UP,20,30),"Short tap never opens sheet");
        noOpen(root,()->touch(root,MotionEvent.ACTION_MOVE,29,30),"Scroll movement cancels hold");
        noOpen(root,()->touch(root,MotionEvent.ACTION_POINTER_DOWN,20,30),"Second pointer cancels hold");
        noOpen(root,()->root.y=3,"Native scroll moving root cancels hold");root.y=0;
        noOpen(root,()->root.attached=false,"Detached root cancels hold");root.attached=true;
        noOpen(root,()->root.focus=false,"Lost window focus cancels hold");root.focus=true;
        noOpen(root,()->AfterglowPrefs.comments=false,"Live OFF cancels pending hold");AfterglowPrefs.comments=true;
        noOpen(root,()->root.text.set(1,"Another comment"),"Different mounted comment cancels hold");root.text.set(1,TEXT);
        noOpen(root,()->LongPressCaptureTools.bindRoot(root,new Object()),"Recycled root invalidates held entity");
        noOpen(root,()->LongPressCaptureTools.onText(context,TEXT),"Late previous binding cannot populate recycled root");
        final Context valid=bind(root);
        noOpen(root,()->LongPressCaptureTools.onText(valid,"A new native comment"),"Updated entity invalidates previously captured entry");
        // Use one current token for two semantic comments, even if only the first is mounted.
        Object multi=new Object();LongPressCaptureTools.bindRoot(root,multi);
        LongPressCaptureTools.onText(new Context(root,multi,"one"),TEXT);LongPressCaptureTools.onText(new Context(root,multi,"two"),"Other text");
        noOpen(root,()->{},"Multi-entity root keeps native gesture");
        bind(root);LongPressCaptureSheet.available=false;int cancelBefore=root.cancels;
        noOpen(root,()->{},"Existing sheet leaves native hold available");check(root.cancels==cancelBefore&&Bitmap.last.recycled,"Unavailable sheet discards unused capture without cancelling native");LongPressCaptureSheet.available=true;
        Root unknown=new Root();noOpen(unknown,()->{},"Unbound native host remains unchanged");
        bind(root);root.width=8193;int beforeOversized=LongPressCaptureSheet.opens;down(root);Handler.advance(300);
        check(LongPressCaptureSheet.opens==beforeOversized+1&&LongPressCaptureSheet.text!=null&&LongPressCaptureSheet.save==null&&LongPressCaptureSheet.copy==null,"Oversized image keeps verified text action with image actions unavailable");touch(root,MotionEvent.ACTION_UP,20,30);root.width=240;
        bind(root);for(int i=0;i<513;i++)root.children.add(new View(activity));noOpen(root,()->{},"Partial traversal cannot establish ownership");root.children.clear();
        bind(root);LongPressCaptureSheet.onShow=()->touch(root,MotionEvent.ACTION_CANCEL,20,30);down(root);int prior=LongPressCaptureSheet.opens;Handler.advance(300);
        check(LongPressCaptureSheet.opens==prior+1&&root.cancels>cancelBefore,"Dialog-induced cancellation still leaves native child cancelled");LongPressCaptureSheet.onShow=null;
        touch(root,MotionEvent.ACTION_CANCEL,20,30);
        Root post=new Root();Object postToken=new Object();LongPressCaptureTools.bindRoot(post,postToken);
        PostContext postContext=new PostContext(post,postToken);LongPressCaptureTools.onText(postContext,TEXT);
        Object data=new EqualInput();TextComponent primary=new TextComponent(data,postContext);
        AfterglowPrefs.comments=false;AfterglowPrefs.posts=true;
        LongPressPostTools.onNativeText(primary,TEXT);noOpen(post,()->{},"Unmarked text data cannot become a post body");
        LongPressPostTools.bodyInput(data);LongPressPostTools.onNativeText(primary,TEXT);
        LongPressPostTools.onNativeText(new TextComponent(new EqualInput(),postContext),"...Read more");
        down(post);Handler.advance(300);check(LongPressCaptureSheet.postOpens==1,"Native primary body opens post sheet independently of comments toggle");
        LongPressCaptureSheet.text.run();check(activity.clipboard.value.text.equals(TEXT),"Post body copy keeps actual source text");touch(post,MotionEvent.ACTION_UP,20,30);
        AfterglowPrefs.posts=false;AfterglowPrefs.comments=true;noOpen(post,()->{},"Comments ON cannot enable post actions");
        check(DebugLog.messages.isEmpty(),"Disabled diagnostics retain no host observations");
        DebugLog.enabled=true;Root unboundChild=new Root();unboundChild.parent=root;
        MotionEvent diagnosticDown=new MotionEvent(MotionEvent.ACTION_DOWN,20,30);
        diagnosticDown.downTime=++android.os.SystemClock.now;
        int opensBeforeDiagnostic=LongPressCaptureSheet.opens;
        for(int i=0;i<20;i++)LongPressCaptureTools.onTouch(unboundChild,diagnosticDown);
        Handler.advance(300);
        check(LongPressCaptureSheet.opens==opensBeforeDiagnostic,"Observing a registered ancestor does not change direct ownership");
        check(DebugLog.messages.size()==12,"Host diagnostics are bounded per physical touch");
        check(DebugLog.messages.get(0).contains("registered=false ancestors=1 mounted=3 ready=true"),"Diagnostics distinguish touched host from registered ancestor");
        for(String message:DebugLog.messages)check(!message.contains(TEXT)&&!message.contains("comment.e|")&&!message.contains("http"),"Diagnostics omit native text, paths and URLs");
        DebugLog.enabled=false;
        RuntimeException wrapped=new RuntimeException("private comment https://private.invalid/token",new IllegalArgumentException("Software rendering doesn't support hardware bitmaps"));
        String summary=LongPressCaptureTools.failureSummary(wrapped);
        check(summary.contains("java.lang.RuntimeException>java.lang.IllegalArgumentException")&&summary.contains("softwareHardwareBitmap=true"),"Native wrapper cause exposes fixed hardware-bitmap signal");
        check(!summary.contains("private")&&!summary.contains("http")&&!summary.contains("Software rendering"),"Failure summary emits no exception messages or URLs");
        check(LongPressCaptureTools.failureSummary(new IllegalArgumentException("Software rendering doesn't support RuntimeShader")).contains("softwareRuntimeShader=true"),"RuntimeShader failure is distinct from hardware bitmap");
        RuntimeException traceOnly=new RuntimeException("ignored");traceOnly.setStackTrace(new StackTraceElement[]{new StackTraceElement("android.graphics.BaseCanvas","throwIfHwBitmapInSwMode","BaseCanvas.java",733)});
        check(LongPressCaptureTools.failureSummary(traceOnly).contains("softwareHardwareBitmap=true"),"Known platform stack signal remains recognizable without message");
        RuntimeException cyclic=new RuntimeException(){@Override public synchronized Throwable getCause(){return this;}@Override public String getMessage(){throw new AssertionError("Native wrapper message must not be evaluated");}};
        check(LongPressCaptureTools.failureSummary(cyclic).length()<512,"Cause cycles are bounded and native wrapper messages are not evaluated");
        Throwable deep=new IllegalArgumentException("hidden");for(int i=0;i<20;i++)deep=new RuntimeException("private",deep);
        check(LongPressCaptureTools.failureSummary(deep).split(">",-1).length==8,"Cause chain is limited to eight classes");
        System.out.println(checks+" production comment gesture checks passed");
    }
}
