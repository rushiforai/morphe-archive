package app.afterglow.extension.menus;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewGroup;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.ui.LongPressCaptureSheet;
import java.util.ArrayList;
import java.util.List;

/** Exercises the production async fallback, actual native ownership and platform-copy boundary. */
public final class LongPressWindowCaptureTest {
    private static int checks;
    private static final String BODY="Exact current comment with a hardware avatar.\nA second native line.";
    private static final class Host extends ViewGroup implements LongPressCaptureHost {
        final List<CharSequence> text=new ArrayList<>(List.of("Author",BODY,"Reply"));
        Host(Activity activity){super(activity);}
        public List<CharSequence> afterglow_captureTextItems(){return text;}
    }
    private static final class Context implements LongPressCaptureContext {
        public View afterglow_captureRoot(){return null;}
        public Object afterglow_captureBinding(){return null;}
        public String afterglow_captureIdentifier(){return "comment_thread.eml-js-fe|d982a5431929e34e";}
        public StringBuilder afterglow_capturePath(){return new StringBuilder("CellType|comment_thread.eml-js-fe|d982a5431929e34e|ContainerType|comment.eml-js-fe|e4f80cdd23f3b973|"+"ContainerType|".repeat(8)+"TextType|");}
    }
    private static final class Source implements LongPressPostComponent,LongPressMountedTextModel {
        final Context context=new Context();
        public Object afterglow_postTextInput(){return null;}
        public Object afterglow_postTextContext(){return context;}
        public Object afterglow_captureSource(){return this;}
    }
    private static final class Fixture {
        final Activity activity=new Activity();final Host host=new Host(activity);final Object item=new Object(),content=new Object();Source source;
        Fixture(){
            host.parent=activity.window.decor;activity.window.decor.children.add(host);
            host.x=24;host.y=360;host.windowX=24;host.windowY=300;
            host.drawError=new RuntimeException("native wrapper private body",new IllegalArgumentException("Software rendering doesn't support hardware bitmaps"));
            rebind();
        }
        void rebind(){source=new Source();LongPressPostTools.onNativeText(source,BODY);LongPressMountedText.mounted(host,item,source,content);}
    }
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static boolean touch(View root,int action){return LongPressCaptureTools.onTouch(root,new MotionEvent(action,20,30));}
    private static PixelCopy.Copy begin(Fixture f){
        int requests=PixelCopy.requests.size(),opens=LongPressCaptureSheet.opens;
        check(!touch(f.host,MotionEvent.ACTION_DOWN),"Initial touch reaches native handlers");Handler.advance(300);
        check(PixelCopy.requests.size()==requests+1&&LongPressCaptureSheet.opens==opens,"Known hardware failure requests a window copy before displaying sheet");
        return PixelCopy.requests.get(requests);
    }
    private static void stale(Fixture f,Runnable change,String reason){
        PixelCopy.Copy request=begin(f);int before=LongPressCaptureSheet.opens;change.run();request.complete(PixelCopy.SUCCESS);
        check(LongPressCaptureSheet.opens==before&&request.bitmap.recycled,reason);touch(f.host,MotionEvent.ACTION_UP);
    }
    public static void main(String[] args){
        AfterglowPrefs.comments=true;DebugLog.enabled=true;
        Fixture first=new Fixture();Object listener=first.host.nativeListener;PixelCopy.Copy copied=begin(first);
        check(copied.window==first.activity.window&&copied.region.equals(new Rect(24,300,264,400)),"Crop uses exact own-window coordinates, not screen offsets or whole viewport");
        check(copied.bitmap.width==240&&copied.bitmap.height==100,"Destination dimensions match complete item without scaling");
        check(first.host.cancels==1&&first.host.haptics==1,"Claimed hold cancels native child timeout once while copy is pending");
        check(!copied.bitmap.recycled,"PixelCopy destination stays alive while platform owns it");
        check(touch(first.host,MotionEvent.ACTION_UP),"Claimed release is consumed while copy finishes");
        int before=LongPressCaptureSheet.opens;copied.complete(PixelCopy.SUCCESS);
        check(LongPressCaptureSheet.opens==before+1&&!copied.bitmap.recycled,"Verified result can open sheet after finger release");
        LongPressCaptureSheet.text.run();check(first.activity.clipboard.value.text.equals(BODY),"Text action preserves exact selected native body");
        LongPressCaptureSheet.save.run();LongPressCaptureSheet.copy.run();
        check(LongPressImageProvider.saved==copied.bitmap&&LongPressImageProvider.copied==copied.bitmap,"Save/copy use the accepted hardware-window bitmap");
        check(first.host.nativeListener==listener&&!first.host.longClickable,"Native listeners and flags remain unchanged");
        before=LongPressCaptureSheet.opens;copied.complete(PixelCopy.SUCCESS);check(LongPressCaptureSheet.opens==before,"Duplicate platform completion cannot reopen sheet");

        Fixture rebound=new Fixture();stale(rebound,rebound::rebind,"Same-text native rebind rejects stale image generation");
        Fixture unbound=new Fixture();stale(unbound,()->LongPressMountedText.unmounted(unbound.host,unbound.item,unbound.source),"Native unbind rejects in-flight image");
        Fixture moved=new Fixture();stale(moved,()->moved.host.x++,"Even one-pixel movement rejects the queued region");
        Fixture resized=new Fixture();stale(resized,()->resized.host.height++,"Size changes reject a stale crop");
        Fixture replacedText=new Fixture();stale(replacedText,()->replacedText.host.text.set(1,"Different current comment"),"Mounted text changes reject queued image");
        Fixture detached=new Fixture();stale(detached,()->detached.host.attached=false,"Detached item cannot open a delayed sheet");
        Fixture noFocus=new Fixture();stale(noFocus,()->noFocus.host.focus=false,"Another focused window prevents delivery");
        Fixture disabled=new Fixture();stale(disabled,()->AfterglowPrefs.comments=false,"Live OFF prevents pending capture delivery");AfterglowPrefs.comments=true;
        Fixture cancel=new Fixture();PixelCopy.Copy cancelled=begin(cancel);before=LongPressCaptureSheet.opens;
        touch(cancel.host,MotionEvent.ACTION_CANCEL);check(!cancelled.bitmap.recycled,"Cancellation does not recycle while PixelCopy may still be writing");
        cancelled.complete(PixelCopy.SUCCESS);check(cancelled.bitmap.recycled&&LongPressCaptureSheet.opens==before,"Cancelled callback recycles only after platform completion");
        Fixture newTouch=new Fixture();PixelCopy.Copy obsolete=begin(newTouch);before=LongPressCaptureSheet.opens;
        android.os.SystemClock.now++;touch(new View(newTouch.activity),MotionEvent.ACTION_DOWN);obsolete.complete(PixelCopy.SUCCESS);
        check(obsolete.bitmap.recycled&&LongPressCaptureSheet.opens==before,"A new touch elsewhere invalidates pending capture");touch(newTouch.host,MotionEvent.ACTION_UP);

        Fixture clipped=new Fixture();clipped.host.localVisible=new Rect(0,20,240,100);int requests=PixelCopy.requests.size();before=LongPressCaptureSheet.opens;
        touch(clipped.host,MotionEvent.ACTION_DOWN);Handler.advance(300);
        check(PixelCopy.requests.size()==requests&&LongPressCaptureSheet.opens==before+1,"Partially visible entity is not mislabeled as a full viewport image");
        check(LongPressCaptureSheet.text!=null&&LongPressCaptureSheet.save==null&&LongPressCaptureSheet.copy==null,"Clipped hardware entity retains text with image actions explicitly unavailable");
        LongPressCaptureSheet.text.run();check(clipped.activity.clipboard.value.text.equals(BODY),"Clipped entity still copies its complete verified text");touch(clipped.host,MotionEvent.ACTION_UP);
        Fixture foreign=new Fixture();foreign.host.tokenOverride=new Object();requests=PixelCopy.requests.size();touch(foreign.host,MotionEvent.ACTION_DOWN);Handler.advance(300);
        check(PixelCopy.requests.size()==requests&&LongPressCaptureSheet.save==null,"Foreign window token cannot supply pixels");touch(foreign.host,MotionEvent.ACTION_UP);
        Fixture transformed=new Fixture();transformed.host.scaleX=1.1f;requests=PixelCopy.requests.size();touch(transformed.host,MotionEvent.ACTION_DOWN);Handler.advance(300);
        check(PixelCopy.requests.size()==requests&&LongPressCaptureSheet.copy==null,"Transformed root cannot capture surrounding unrelated content");touch(transformed.host,MotionEvent.ACTION_UP);
        Fixture outside=new Fixture();outside.host.windowY=2350;requests=PixelCopy.requests.size();touch(outside.host,MotionEvent.ACTION_DOWN);Handler.advance(300);
        check(PixelCopy.requests.size()==requests&&LongPressCaptureSheet.copy==null,"Window overflow is rejected before PixelCopy can clamp and scale it");touch(outside.host,MotionEvent.ACTION_UP);
        Fixture failed=new Fixture();PixelCopy.Copy failure=begin(failed);before=LongPressCaptureSheet.opens;failure.complete(PixelCopy.ERROR_TIMEOUT);
        check(failure.bitmap.recycled&&LongPressCaptureSheet.opens==before+1&&LongPressCaptureSheet.copy==null,"Platform failure recycles image and preserves text action");touch(failed.host,MotionEvent.ACTION_UP);
        Fixture throwsRequest=new Fixture();PixelCopy.failRequest=true;requests=PixelCopy.requests.size();before=LongPressCaptureSheet.opens;
        touch(throwsRequest.host,MotionEvent.ACTION_DOWN);Handler.advance(300);
        check(PixelCopy.requests.size()==requests&&Bitmap.last.recycled&&LongPressCaptureSheet.opens==before+1&&LongPressCaptureSheet.save==null,"Synchronous platform failure preserves text and releases destination");PixelCopy.failRequest=false;touch(throwsRequest.host,MotionEvent.ACTION_UP);
        Fixture ordinary=new Fixture();ordinary.host.drawError=new IllegalStateException("private unexpected drawable contents");requests=PixelCopy.requests.size();before=LongPressCaptureSheet.opens;
        touch(ordinary.host,MotionEvent.ACTION_DOWN);Handler.advance(300);
        check(PixelCopy.requests.size()==requests&&LongPressCaptureSheet.opens==before+1&&LongPressCaptureSheet.copy==null,"Unknown drawing errors do not trigger an unrelated window fallback");touch(ordinary.host,MotionEvent.ACTION_UP);
        Fixture software=new Fixture();software.host.drawError=null;software.host.localVisible=new Rect(0,20,240,100);requests=PixelCopy.requests.size();
        touch(software.host,MotionEvent.ACTION_DOWN);Handler.advance(300);
        check(PixelCopy.requests.size()==requests&&LongPressCaptureSheet.copy!=null,"Successful software draw still captures full partially visible entity");touch(software.host,MotionEvent.ACTION_UP);
        android.hardware.HardwareBuffer.supported=true;Fixture tall=new Fixture();tall.host.height=3000;tall.host.localVisible=new Rect(0,200,240,900);
        requests=PixelCopy.requests.size();before=LongPressCaptureSheet.opens;touch(tall.host,MotionEvent.ACTION_DOWN);Handler.advance(300);
        check(PixelCopy.requests.size()==requests&&LongPressCaptureSheet.opens==before+1&&LongPressCaptureSheet.copy!=null,"Tall mounted hardware root uses full offscreen rendering before any window fallback");
        LongPressCaptureSheet.copy.run();check(LongPressImageProvider.copied.height==3000&&!LongPressImageProvider.copied.recycled,"Whole tall-item image is delivered as a live independent bitmap");touch(tall.host,MotionEvent.ACTION_UP);
        Fixture staleHardware=new Fixture();android.graphics.HardwareRenderer.onRender=staleHardware::rebind;before=LongPressCaptureSheet.opens;requests=PixelCopy.requests.size();
        touch(staleHardware.host,MotionEvent.ACTION_DOWN);Handler.advance(300);
        check(LongPressCaptureSheet.opens==before&&PixelCopy.requests.size()==requests&&Bitmap.readback.recycled,"Rebind during full hardware rendering rejects output and prevents fallback to stale window");android.graphics.HardwareRenderer.onRender=null;touch(staleHardware.host,MotionEvent.ACTION_UP);
        Fixture softwareOom=new Fixture();Bitmap.oomCreate=true;requests=PixelCopy.requests.size();before=LongPressCaptureSheet.opens;
        touch(softwareOom.host,MotionEvent.ACTION_DOWN);Handler.advance(300);Bitmap.oomCreate=false;
        check(LongPressCaptureSheet.opens==before+1&&LongPressCaptureSheet.text!=null&&LongPressCaptureSheet.copy==null&&PixelCopy.requests.size()==requests,"Software allocation failure retains text without retrying large image allocations");touch(softwareOom.host,MotionEvent.ACTION_UP);
        Fixture hardwareOom=new Fixture();Bitmap.oomCopy=true;requests=PixelCopy.requests.size();before=LongPressCaptureSheet.opens;
        touch(hardwareOom.host,MotionEvent.ACTION_DOWN);Handler.advance(300);Bitmap.oomCopy=false;
        check(LongPressCaptureSheet.opens==before+1&&LongPressCaptureSheet.save==null&&PixelCopy.requests.size()==requests,"Hardware readback allocation failure retains text without window retry");
        check(android.media.ImageReader.last.closed&&android.media.ImageReader.last.image.closed&&Bitmap.wrapped.recycled,"Hardware allocation failure releases producer resources before text sheet");touch(hardwareOom.host,MotionEvent.ACTION_UP);
        check(DebugLog.messages.stream().noneMatch(message->message.contains("private")||message.contains(BODY)||message.contains("http")),"Capture diagnostics expose no native text or exception messages");
        System.out.println(checks+" hardware-window capture checks passed");
    }
}
