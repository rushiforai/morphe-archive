package app.afterglow.extension.menus;

import android.app.Activity;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.ui.LongPressCaptureSheet;
import java.util.ArrayList;
import java.util.List;

/** Real production source cache, mount lifecycle and gesture behavior with rootless contexts. */
public final class LongPressMountedTextTest {
    private static int checks;
    private static final Activity ACTIVITY=new Activity();
    private static final String BODY="A current native comment with an exact body and line break.\nSecond line.";
    private static final class Host extends ViewGroup implements LongPressCaptureHost {
        final List<CharSequence> text=new ArrayList<>();
        Host(String... values){super(ACTIVITY);text.addAll(List.of(values));}
        public List<CharSequence> afterglow_captureTextItems(){return text;}
    }
    private static final class Context implements LongPressCaptureContext {
        final StringBuilder path;final String identifier;
        Context(String identifier,String path){this.identifier=identifier;this.path=new StringBuilder(path);}
        public View afterglow_captureRoot(){return null;}
        public Object afterglow_captureBinding(){return null;}
        public String afterglow_captureIdentifier(){return identifier;}
        public StringBuilder afterglow_capturePath(){return path;}
    }
    private static class Source implements LongPressPostComponent,LongPressMountedTextModel {
        final Object input=new Object();final Context context;
        Source(Context context){this.context=context;}
        public Object afterglow_postTextInput(){return input;}
        public Object afterglow_postTextContext(){return context;}
        public Object afterglow_captureSource(){return this;}
        @Override public int hashCode(){return 1;}
        @Override public boolean equals(Object other){return other instanceof Source;}
    }
    private static final class Legacy implements LongPressMountedTextModel {
        final Source source;Legacy(Source source){this.source=source;}
        public Object afterglow_captureSource(){return source;}
    }
    private static Context comment(){return new Context("comment_thread.eml-js-fe|d982a5431929e34e","CellType|comment_thread.eml-js-fe|d982a5431929e34e|ContainerType|comment.eml-js-fe|e4f80cdd23f3b973|"+"ContainerType|".repeat(8)+"TextType|");}
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static void observe(Source source,String value){LongPressPostTools.onNativeText(source,value);}
    private static boolean touch(View host,int action){return LongPressCaptureTools.onTouch(host,new MotionEvent(action,20,30));}
    private static void hold(Host host,boolean opens,String reason){int before=LongPressCaptureSheet.opens;check(!touch(host,MotionEvent.ACTION_DOWN),"Native receives DOWN");Handler.advance(300);check((LongPressCaptureSheet.opens>before)==opens,reason);touch(host,MotionEvent.ACTION_UP);}
    public static void main(String[] args){
        Source source=new Source(comment());Legacy legacy=new Legacy(source);Object item=new Object(),content=new Object();Host host=new Host("Author",BODY,"Reply");
        observe(source,BODY);LongPressMountedText.mounted(host,item,legacy,content);
        check(LongPressMountedText.contextForModel(legacy) instanceof LongPressCaptureContext,"Legacy returned model resolves exact source snapshot");
        check(LongPressMountedText.contextForModel(source) instanceof LongPressCaptureContext,"Modern source model resolves directly");
        Context original=source.context;String path=original.path.toString();original.path.append("changed");
        check(((LongPressCaptureContext)LongPressMountedText.contextForModel(legacy)).afterglow_capturePath().toString().equals(path),"Native path mutation cannot alter recorded semantics");
        hold(host,false,"Default OFF retains native behavior with recorded mounts");AfterglowPrefs.comments=true;
        hold(host,true,"Actual128 rootless context opens only after exact native bind");LongPressCaptureSheet.text.run();
        check(ACTIVITY.clipboard.value.text.equals(BODY),"Rootless source copies exact original body");
        check(host.draws==1,"Capture draws the exact proven host");
        Object listener=host.nativeListener;check(!host.longClickable&&listener!=null,"Mount bridge does not replace native listeners");
        LongPressMountedText.Selection selected=LongPressMountedText.select(host,host.text);
        check(selected!=null,"One current native body is selectable");
        touch(host,MotionEvent.ACTION_DOWN);int before=LongPressCaptureSheet.opens;LongPressMountedText.unmounted(host,item,legacy);Handler.advance(300);
        check(LongPressCaptureSheet.opens==before,"Native unbind cancels pending hold");touch(host,MotionEvent.ACTION_UP);
        hold(host,false,"Unbound text is not recovered by identical plain text");
        LongPressMountedText.mounted(host,item,legacy,content);Source replacement=new Source(comment());observe(replacement,BODY);
        touch(host,MotionEvent.ACTION_DOWN);LongPressMountedText.mounted(host,item,replacement,content);before=LongPressCaptureSheet.opens;Handler.advance(300);
        check(LongPressCaptureSheet.opens==before,"Same-item replacement invalidates hold even for identical body");touch(host,MotionEvent.ACTION_UP);
        LongPressMountedText.unmounted(host,item,legacy);
        check(LongPressMountedText.select(host,host.text)!=null,"Late old-model unbind cannot remove replacement");
        Source unknown=new Source(comment());LongPressMountedText.mounted(host,item,unknown,content);
        check(LongPressMountedText.select(host,host.text)==null,"Equal but distinct unobserved source cannot reuse another model's metadata");
        LongPressMountedText.mounted(host,item,replacement,content);Host moved=new Host(BODY);
        LongPressMountedText.mounted(moved,item,replacement,content);
        check(LongPressMountedText.select(host,host.text)==null&&LongPressMountedText.select(moved,moved.text)!=null,"Native item moving hosts invalidates its previous host");
        Object secondItem=new Object(),secondContent=new Object();Source second=new Source(comment());observe(second,BODY);
        LongPressMountedText.mounted(moved,secondItem,second,secondContent);
        check(LongPressMountedText.select(moved,moved.text)==null,"Two body mounts reject even when only one equal text occurrence is returned");
        LongPressMountedText.unmounted(moved,secondItem,second);moved.text.add(BODY);
        check(LongPressMountedText.select(moved,moved.text)==null,"Duplicate mounted body text remains ambiguous");moved.text.remove(1);
        moved.text.set(0,"A current native comment with an exact body and another ending.");
        check(LongPressMountedText.select(moved,moved.text)==null,"Common-prefix replacement does not match old body");moved.text.set(0,BODY);
        Source foreign=new Source(new Context("video_metadata.eml","video_metadata.eml|0123456789abcdef|TextType|"));observe(foreign,"Title");
        LongPressMountedText.mounted(moved,secondItem,foreign,secondContent);
        check(LongPressMountedText.select(moved,moved.text)==null,"Mixed native surfaces reject a broader host");LongPressMountedText.unmounted(moved,secondItem,foreign);
        Host parent=new Host();parent.children.add(moved);moved.parent=parent;
        MotionEvent sameDown=new MotionEvent(MotionEvent.ACTION_DOWN,20,30);sameDown.downTime=++android.os.SystemClock.now;
        before=LongPressCaptureSheet.opens;int parentDraws=parent.draws,childDraws=moved.draws;
        LongPressCaptureTools.onTouch(parent,sameDown);LongPressCaptureTools.onTouch(moved,sameDown);Handler.advance(300);
        check(LongPressCaptureSheet.opens==before+1&&parent.draws==parentDraws+1&&moved.draws==childDraws,"Nested native dispatch retains outermost proven single-entity capture");touch(parent,MotionEvent.ACTION_UP);
        touch(parent,MotionEvent.ACTION_DOWN);before=LongPressCaptureSheet.opens;AfterglowPrefs.comments=false;Handler.advance(300);
        check(LongPressCaptureSheet.opens==before,"Live OFF cancels mounted-owner hold");touch(parent,MotionEvent.ACTION_UP);AfterglowPrefs.comments=true;
        InstalledTweaks.installed=false;check(LongPressMountedText.select(moved,moved.text)==null,"Missing owner disables mounted selection");InstalledTweaks.installed=true;
        String postPath="images_post_root_slim.eml-fe|46f80e605e6300a9|CellType|images_post_slim.eml-fe|ffb55ce8b2f575b8|ContainerType|post_text.eml-fe|946bdce24a350fb4|ContainerType|ExpandableTextType|";
        Source post=new Source(new Context("images_post_root_slim.eml-fe|46f80e605e6300a9",postPath));Host postHost=new Host(BODY);Object postItem=new Object(),postContent=new Object();
        observe(post,BODY);LongPressMountedText.mounted(postHost,postItem,post,postContent);
        check(LongPressMountedText.select(postHost,postHost.text)==null,"Post path alone cannot claim a label model as the body");
        LongPressPostTools.bodyInput(post.input);observe(post,BODY);LongPressMountedText.mounted(postHost,postItem,post,postContent);
        check(LongPressMountedText.select(postHost,postHost.text).entry.isPost,"Exact native expandable-body model enables post selection");
        AfterglowPrefs.comments=false;AfterglowPrefs.posts=true;hold(postHost,true,"Post mounted body opens independently of comment setting");
        System.out.println(checks+" mounted text lifecycle checks passed");
    }
}
