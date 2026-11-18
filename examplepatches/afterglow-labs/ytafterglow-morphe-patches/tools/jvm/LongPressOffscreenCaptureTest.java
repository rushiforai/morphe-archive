package app.afterglow.extension.menus;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.HardwareRenderer;
import android.graphics.RecordingCanvas;
import android.graphics.Rect;
import android.graphics.RenderNode;
import android.hardware.HardwareBuffer;
import android.media.ImageReader;
import android.os.Looper;
import android.view.SurfaceView;
import android.view.ViewGroup;

/** Production render/readback/resource lifetime with observable Android boundaries. */
public final class LongPressOffscreenCaptureTest {
    private static int checks;
    private static void check(boolean value,String message){checks++;if(!value)throw new AssertionError(message);}
    private static boolean rejects(Runnable work){try{work.run();return false;}catch(RuntimeException expected){return true;}}
    public static void main(String[] args){
        HardwareBuffer.supported=true;ViewGroup root=new ViewGroup(new Activity());root.width=700;root.height=3000;
        root.localVisible=new Rect(0,200,700,900);
        root.drawError=new RuntimeException("native wrapper",new IllegalArgumentException("Software rendering doesn't support hardware bitmaps"));
        Bitmap result=LongPressOffscreenCapture.capture(root,0xff121212,()->true);
        check(result.width==700&&result.height==3000&&result.config==Bitmap.Config.ARGB_8888&&!result.recycled,"Entire tall mounted root becomes an independent software bitmap");
        check(root.draws==1&&RenderNode.last.width==700&&RenderNode.last.height==3000&&RenderNode.last.clip,"Exact root draws once into a bounded hardware recording");
        check(HardwareRenderer.last.waited&&HardwareRenderer.last.destroyed&&HardwareRenderer.last.node==null,"Owned renderer waits for its frame and is detached/destroyed");
        check(RenderNode.last.ended&&RenderNode.last.discarded,"Only the owned display list is ended and discarded");
        check(ImageReader.last.closed&&ImageReader.last.image.closed&&ImageReader.last.image.buffer.closed&&Bitmap.wrapped.recycled,"Producer resources close after independent readback");
        check(result!=Bitmap.wrapped,"Returned image is not a producer-owned hardware wrapper");
        HardwareRenderer.result=HardwareRenderer.SYNC_FRAME_DROPPED;
        check(rejects(()->LongPressOffscreenCapture.capture(root,0,()->true)),"Dropped native frame cannot become an image");
        check(ImageReader.last.closed&&HardwareRenderer.last.destroyed&&RenderNode.last.discarded,"Frame failure still releases all acquired resources");HardwareRenderer.result=0;
        ImageReader.noImage=true;check(rejects(()->LongPressOffscreenCapture.capture(root,0,()->true)),"Missing completed image is rejected");
        check(ImageReader.last.closed&&HardwareRenderer.last.destroyed,"Missing-image failure releases renderer and reader");ImageReader.noImage=false;
        Bitmap.failCopy=true;check(rejects(()->LongPressOffscreenCapture.capture(root,0,()->true)),"Failed software readback never returns wrapped buffer");
        check(ImageReader.last.closed&&ImageReader.last.image.closed&&Bitmap.wrapped.recycled,"Readback failure releases hardware lifetime");Bitmap.failCopy=false;
        boolean[] current={true};HardwareRenderer.onRender=()->current[0]=false;
        check(rejects(()->LongPressOffscreenCapture.capture(root,0,()->current[0])),"Entity becoming stale during render is rejected");
        check(Bitmap.readback.recycled&&ImageReader.last.closed,"Rejected independent image is recycled too");HardwareRenderer.onRender=null;
        HardwareRenderer.failDestroy=true;Bitmap cleanup=LongPressOffscreenCapture.capture(root,0,()->true);
        check(!cleanup.recycled&&ImageReader.last.closed,"One cleanup failure does not skip reader release or destroy valid output");HardwareRenderer.failDestroy=false;
        check(LongPressOffscreenCapture.capture(root,0,()->true)!=null,"Cleanup failure cannot permanently latch capture busy");
        RenderNode.failBegin=true;check(rejects(()->LongPressOffscreenCapture.capture(root,0,()->true)),"Recording allocation failure remains recoverable");
        check(ImageReader.last.closed&&RenderNode.last.discarded,"Early allocation failure releases already-owned reader/node");RenderNode.failBegin=false;
        RecordingCanvas.maxSide=2048;check(rejects(()->LongPressOffscreenCapture.capture(root,0,()->true)),"GPU maximum bitmap side is enforced before root draw");RecordingCanvas.maxSide=8192;
        root.children.add(new SurfaceView(root.getContext()));check(rejects(()->LongPressOffscreenCapture.capture(root,0,()->true)),"External surface content is not fabricated into a full row image");root.children.clear();
        root.width=8193;check(rejects(()->LongPressOffscreenCapture.capture(root,0,()->true)),"Capture maximum side is enforced");root.width=700;
        int sdk=android.os.Build.VERSION.SDK_INT;android.os.Build.VERSION.SDK_INT=28;
        check(rejects(()->LongPressOffscreenCapture.capture(root,0,()->true)),"Unsupported platform skips API29 renderer");android.os.Build.VERSION.SDK_INT=sdk;
        Looper.current=new Looper();check(rejects(()->LongPressOffscreenCapture.capture(root,0,()->true)),"Native View recording is restricted to main thread");Looper.current=Looper.MAIN;
        boolean[] nested={false};
        Bitmap finalResult=LongPressOffscreenCapture.capture(root,0,()->{if(!nested[0]){nested[0]=true;check(rejects(()->LongPressOffscreenCapture.capture(root,0,()->true)),"Reentrant capture cannot acquire a second renderer");}return true;});
        check(finalResult!=null&&!finalResult.recycled,"Rejected reentrancy does not invalidate the active capture");
        System.out.println(checks+" offscreen hardware lifecycle checks passed");
    }
}
