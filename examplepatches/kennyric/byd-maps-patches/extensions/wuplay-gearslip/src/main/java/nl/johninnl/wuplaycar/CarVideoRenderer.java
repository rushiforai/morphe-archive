package nl.johninnl.wuplaycar;

import android.app.Presentation;
import android.content.Context;
import android.graphics.Color;
import android.hardware.display.DisplayManager;
import android.hardware.display.VirtualDisplay;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.util.*;

/** Renders WuPlay video/subtitles on its own display, backed by Gearslip's borrowed surface. */
final class CarVideoRenderer implements AutoCloseable {
    private final CarPlayback<SurfaceHolder> playback;
    private final NativePlayer engine;
    private VirtualDisplay display;private Presentation presentation;
    private SurfaceView video;private TextView subtitles,status;private SurfaceHolder holder;
    private int width,height;private long generation;private android.graphics.Rect area;
    CarVideoRenderer(CarPlayback<SurfaceHolder> playback,NativePlayer engine){this.playback=playback;this.engine=engine;}
    void open(Context context,Surface surface,int width,int height,int dpi) {
        close();final long lease=++generation;this.width=width;this.height=height;
        DisplayManager manager=(DisplayManager)context.getSystemService(Context.DISPLAY_SERVICE);
        display=manager.createVirtualDisplay("WuPlay Gearslip video",width,height,dpi,surface,
            DisplayManager.VIRTUAL_DISPLAY_FLAG_OWN_CONTENT_ONLY|DisplayManager.VIRTUAL_DISPLAY_FLAG_PRESENTATION);
        if(display==null)throw new IllegalStateException("Car video display unavailable");
        presentation=new Presentation(context,display.getDisplay());
        FrameLayout root=new FrameLayout(presentation.getContext());root.setBackgroundColor(Color.BLACK);
        video=new SurfaceView(presentation.getContext());
        root.addView(video,new FrameLayout.LayoutParams(-1,-1,Gravity.CENTER));
        video.getHolder().addCallback(new SurfaceHolder.Callback(){
            public void surfaceCreated(SurfaceHolder h){if(lease!=generation)return;holder=h;playback.bind(h);}
            public void surfaceChanged(SurfaceHolder h,int format,int w,int hgt){if(lease!=generation)return;holder=h;engine.surface(h);}
            public void surfaceDestroyed(SurfaceHolder h){playback.unbind(h);if(holder==h)holder=null;}
        });
        subtitles=new TextView(presentation.getContext());subtitles.setTextColor(Color.WHITE);subtitles.setTextSize(22);
        subtitles.setGravity(Gravity.CENTER);subtitles.setShadowLayer(3,1,1,Color.BLACK);
        FrameLayout.LayoutParams text=new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM|Gravity.CENTER_HORIZONTAL);
        text.setMargins(24,0,24,Math.max(16,height/12));root.addView(subtitles,text);
        status=new TextView(presentation.getContext());status.setTextColor(Color.WHITE);status.setTextSize(20);status.setGravity(Gravity.CENTER);
        root.addView(status,new FrameLayout.LayoutParams(-1,-2,Gravity.CENTER));
        presentation.setContentView(root);presentation.show();
    }
    String diagnostics(){return "surfaceBound="+(holder!=null)+" size="+width+"x"+height;}
    void area(android.graphics.Rect value){area=new android.graphics.Rect(value);refresh();}
    void refresh() {
        if(video==null)return;
        android.graphics.Rect region=area==null?new android.graphics.Rect(0,0,width,height):area;
        VideoViewport fit=VideoViewport.fit(width,height,region.left,region.top,region.right,region.bottom,engine.aspect());
        FrameLayout.LayoutParams layout=(FrameLayout.LayoutParams)video.getLayoutParams();
        if(layout.width!=fit.width||layout.height!=fit.height||layout.leftMargin!=fit.left||layout.topMargin!=fit.top){
            layout.gravity=Gravity.TOP|Gravity.LEFT;layout.width=fit.width;layout.height=fit.height;layout.leftMargin=fit.left;layout.topMargin=fit.top;video.setLayoutParams(layout);
        }
        FrameLayout.LayoutParams caption=(FrameLayout.LayoutParams)subtitles.getLayoutParams();
        if(caption.bottomMargin!=fit.captionBottomMargin){caption.bottomMargin=fit.captionBottomMargin;subtitles.setLayoutParams(caption);}
        List<CharSequence> text=new ArrayList<>();for(Object cue:engine.cues()) {
            Object value=NativeCalls.optional(cue,"text");if(value instanceof CharSequence)text.add((CharSequence)value);
        }
        subtitles.setText(TextUtils.join("\n",text));
        String state=engine.status();status.setText(state.equals("Buffering…")||state.equals("Finished")||state.startsWith("Playback failed")||state.startsWith("Playback stopped")?state:"");
    }
    @Override public void close() {
        generation++;if(holder!=null){playback.unbind(holder);holder=null;}
        if(presentation!=null){presentation.dismiss();presentation=null;}
        if(display!=null){display.release();display=null;}
        video=null;subtitles=null;status=null;
    }
}
