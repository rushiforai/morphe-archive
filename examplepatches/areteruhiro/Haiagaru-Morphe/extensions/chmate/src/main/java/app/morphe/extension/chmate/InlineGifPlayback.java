package app.morphe.extension.chmate;

import android.graphics.*;
import android.graphics.drawable.*;
import android.os.*;
import android.text.*;
import android.text.style.ReplacementSpan;
import android.widget.*;
import java.io.*;
import java.lang.ref.WeakReference;
import java.util.*;
import java.util.concurrent.*;

/** Opt-in, bounded inline animations. No account cookies and no layout changes per frame. */
final class InlineGifPlayback {
    private static final int TAG=0x48694731;
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ThreadPoolExecutor IO=new ThreadPoolExecutor(1,1,30,TimeUnit.SECONDS,new ArrayBlockingQueue<>(8),new ThreadPoolExecutor.AbortPolicy());
    private static final Set<Slot> ACTIVE=new LinkedHashSet<>();
    private static boolean writing;
    static void onBound(Object object){
        if(writing||!DirectBodySelection.isBody(object))return;
        TextView view=(TextView)object;
        if(!VideoViewerSettings.prefs(view.getContext()).getBoolean(VideoViewerSettings.INLINE_GIF,false))return;
        CharSequence text=view.getText();if(!(text instanceof Spanned)||text.length()>100000)return;
        if(view.getTag(TAG) instanceof Slot){Slot old=(Slot)view.getTag(TAG);if(!old.closed&&old.matches(text))return;old.close();}
        String body=XPostPreview.originalText(text).toString();
        String[] gif=GifAutoFetchPolicy.extract(body),ids=XMediaAttachments.postIds(body);
        String direct=null;for(String url:XMediaAttachments.directVideos(body))if(VideoViewerSettings.xGif(url)){direct=url;break;}
        if(gif.length==0&&ids.length==0&&direct==null)return;
        // The first animation per response keeps long, media-heavy threads bounded.
        Slot slot=new Slot(view,text,direct!=null?direct:gif.length>0?gif[0]:null,ids.length>0?ids[0]:null);
        view.setTag(TAG,slot);slot.schedule();
    }
    private static final class Slot implements Runnable {
        final WeakReference<TextView> target;final CharSequence original;final String text,id;
        final int width,height;String url;boolean loading,installed;volatile boolean closed;long start;Movie movie;Drawable drawable;androidx.media3.exoplayer.ExoPlayer player;android.view.TextureView texture;android.view.ViewGroup overlayHost;boolean prepared;float videoAspect;android.view.ViewTreeObserver.OnPreDrawListener positionListener;
        boolean matches(CharSequence value){return value.toString().equals(text)||installed&&value.toString().equals(text+"\n\ufffc");}
        Slot(TextView view,CharSequence original,String url,String id){target=new WeakReference<>(view);this.original=original;text=original.toString();this.url=url;this.id=id;float d=view.getResources().getDisplayMetrics().density;width=Math.max(1,Math.min(Math.round(200*d),Math.max(1,view.getWidth()-view.getTotalPaddingLeft()-view.getTotalPaddingRight())));height=Math.max(1,Math.round(width*.75f));}
        void schedule(){MAIN.postDelayed(this,200);}
        boolean visible(TextView view){return view.isAttachedToWindow()&&view.isShown()&&view.hasWindowFocus()&&view.getGlobalVisibleRect(new Rect());}
        public void run(){
            TextView view=target.get();
            if(closed||view==null||view.getTag(TAG)!=this)return;
            if(!VideoViewerSettings.prefs(view.getContext()).getBoolean(VideoViewerSettings.INLINE_GIF,false)){close();return;}
            if(!matches(view.getText())){close();return;}
            if(!view.isAttachedToWindow()){close();return;}
            if(!visible(view)||!VideoViewerSettings.inlineNetworkAllowed(view.getContext())){
                pause();
                if(!VideoViewerSettings.inlineNetworkAllowed(view.getContext()))detachVideo();
                schedule();return;
            }
            if(installed&&VideoViewerSettings.xGif(url)&&texture==null)attachVideo(view);
            int limit=VideoViewerSettings.inlineLimit(view.getContext());
            if(ACTIVE.contains(this)&&new ArrayList<>(ACTIVE).indexOf(this)>=limit){pause();schedule();return;}
            if(!ACTIVE.contains(this)&&ACTIVE.size()>=limit){schedule();return;}
            ACTIVE.add(this);
            if(!installed&&!loading){loading=true;try{IO.execute(()->load(view.getContext().getApplicationContext()));}catch(RejectedExecutionException busy){loading=false;}}
            if(installed){if(drawable instanceof Animatable)((Animatable)drawable).start();if(player!=null&&prepared)try{player.play();}catch(IllegalStateException ignored){}view.invalidate();}
            MAIN.postDelayed(this,installed&&player!=null?100:installed&&movie!=null?50:250);
        }
        void load(android.content.Context context){
            try{
                if(!VideoViewerSettings.inlineNetworkAllowed(context)){MAIN.post(()->{loading=false;});return;}
                if(url==null){String json=XPostMetadata.fetchPreview(id);if(json!=null)for(String candidate:XMediaAttachments.fromJson(json,id))if(VideoViewerSettings.xGif(candidate)){url=candidate;break;}}
                if(url==null)throw new IOException("No GIF in post");
                if(VideoViewerSettings.xGif(url)){
                    // Playback uses Media3 on a row-local clipped TextureView.
                }else{
                    File file=GifMediaLoader.load(context,url,VideoViewerSettings.inlineMaxMb(context)*1024*1024,false,()->closed||!VideoViewerSettings.inlineNetworkAllowed(context));
                    if(Build.VERSION.SDK_INT>=28)drawable=android.graphics.ImageDecoder.decodeDrawable(android.graphics.ImageDecoder.createSource(file),(decoder,info,source)->{double scale=Math.min(1d,Math.min(240d/info.getSize().getWidth(),240d/info.getSize().getHeight()));decoder.setTargetSize(Math.max(1,(int)(info.getSize().getWidth()*scale)),Math.max(1,(int)(info.getSize().getHeight()*scale)));});
                    else movie=Movie.decodeFile(file.getAbsolutePath());
                    if(drawable==null&&movie==null)throw new IOException("Invalid GIF");
                }
                MAIN.post(()->install());
            }catch(Exception error){android.util.Log.w("HaiagaruInlineGif","Cannot load animation",error);MAIN.post(()->close());}
        }
        void install(){
            TextView view=target.get();if(closed||view==null||view.getTag(TAG)!=this)return;
            if(!VideoViewerSettings.inlineNetworkAllowed(view.getContext())){loading=false;return;}
            if(!view.isAttachedToWindow()||!VideoViewerSettings.prefs(view.getContext()).getBoolean(VideoViewerSettings.INLINE_GIF,false)){close();return;}
            CharSequence current=view.getText();if(!current.toString().equals(text)){close();return;}
            SpannableStringBuilder decorated=new SpannableStringBuilder(current);decorated.append("\n");int at=decorated.length();decorated.append("\ufffc");decorated.setSpan(new AnimationSpan(this),at,at+1,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            if(VideoViewerSettings.xGif(url))attachVideo(view);
            installed=true;start=SystemClock.uptimeMillis();writing=true;
            try{XPostPreviewPosition.beforeChange(view);view.setText(decorated,TextView.BufferType.SPANNABLE);}finally{writing=false;}
            // Keep original text identity for recycled-row checks after our own append.
            view.setTag(TAG,this);
            if(drawable!=null){drawable.setBounds(0,0,width,height);drawable.setCallback(new Drawable.Callback(){public void invalidateDrawable(Drawable d){TextView v=target.get();if(v!=null)v.invalidate();}public void scheduleDrawable(Drawable d,Runnable r,long time){MAIN.postAtTime(r,time);}public void unscheduleDrawable(Drawable d,Runnable r){MAIN.removeCallbacks(r);}});}
        }
        void attachVideo(TextView view){
            if(!(view.getParent() instanceof android.view.ViewGroup))return;
            overlayHost=(android.view.ViewGroup)view.getParent();
            texture=new android.view.TextureView(view.getContext());texture.setOpaque(false);
            texture.layout(0,0,width,height);texture.setVisibility(android.view.View.INVISIBLE);
            positionListener=()->{positionVideo();return true;};
            overlayHost.getViewTreeObserver().addOnPreDrawListener(positionListener);
            overlayHost.getOverlay().add(texture);
            texture.setSurfaceTextureListener(new android.view.TextureView.SurfaceTextureListener(){
                public void onSurfaceTextureAvailable(android.graphics.SurfaceTexture surface,int w,int h){
                    if(closed||!VideoViewerSettings.inlineNetworkAllowed(view.getContext()))return;
                    try{
                        player=new androidx.media3.exoplayer.ExoPlayer.Builder(view.getContext()).build();
                        player.setVideoTextureView(texture);player.setVolume(0);player.setRepeatMode(androidx.media3.common.Player.REPEAT_MODE_ONE);
                        player.addListener(new androidx.media3.common.Player.Listener(){
                            public void onVideoSizeChanged(androidx.media3.common.VideoSize size){
                                if(size.width>0&&size.height>0){videoAspect=size.width*size.pixelWidthHeightRatio/size.height;fitVideo();}
                            }
                            public void onPlaybackStateChanged(int state){if(state==androidx.media3.common.Player.STATE_READY){prepared=true;TextView v=target.get();player.setPlayWhenReady(v!=null&&visible(v)&&VideoViewerSettings.inlineNetworkAllowed(v.getContext())&&ACTIVE.contains(Slot.this));}}
                            public void onPlayerError(androidx.media3.common.PlaybackException error){android.util.Log.w("HaiagaruInlineGif","X GIF playback failed",error);close();}
                        });
                        player.setMediaItem(androidx.media3.common.MediaItem.fromUri(url));player.prepare();
                    }catch(RuntimeException failure){close();}
                }
                public void onSurfaceTextureSizeChanged(android.graphics.SurfaceTexture surface,int w,int h){fitVideo();}
                public boolean onSurfaceTextureDestroyed(android.graphics.SurfaceTexture surface){releasePlayer();return true;}
                public void onSurfaceTextureUpdated(android.graphics.SurfaceTexture surface){}
            });
        }
        void fitVideo(){
            if(texture==null||videoAspect<=0||texture.getWidth()<=0||texture.getHeight()<=0)return;
            float box=texture.getWidth()/(float)texture.getHeight();
            Matrix matrix=new Matrix();
            matrix.setScale(videoAspect<box?videoAspect/box:1f,videoAspect>box?box/videoAspect:1f,
                    texture.getWidth()/2f,texture.getHeight()/2f);
            texture.setTransform(matrix);
        }
        /** Layout owns the span position; global visible bounds include every scrolling ancestor. */
        void positionVideo(){
            TextView view=target.get();
            if(texture==null||view==null)return;
            if(!visible(view)||!ACTIVE.contains(this)||!VideoViewerSettings.inlineNetworkAllowed(view.getContext())
                    ||!(view.getText() instanceof Spanned)||view.getLayout()==null){texture.setVisibility(android.view.View.INVISIBLE);return;}
            Spanned text=(Spanned)view.getText();AnimationSpan[] spans=text.getSpans(0,text.length(),AnimationSpan.class);
            int offset=-1;for(AnimationSpan span:spans)if(span.slot==this){offset=text.getSpanStart(span);break;}
            if(offset<0){texture.setVisibility(android.view.View.INVISIBLE);return;}
            Layout layout=view.getLayout();int line=layout.getLineForOffset(offset);
            int[] body=new int[2],host=new int[2];view.getLocationOnScreen(body);overlayHost.getLocationOnScreen(host);
            int left=body[0]+view.getTotalPaddingLeft()-view.getScrollX()+Math.round(layout.getPrimaryHorizontal(offset));
            int top=body[1]+view.getTotalPaddingTop()-view.getScrollY()+layout.getLineBaseline(line)-height;
            Rect visible=new Rect();if(!view.getGlobalVisibleRect(visible)||!visible.intersect(left,top,left+width,top+height)){
                texture.setVisibility(android.view.View.INVISIBLE);return;
            }
            texture.layout(left-host[0],top-host[1],left-host[0]+width,top-host[1]+height);
            visible.offset(-left,-top);texture.setClipBounds(visible);texture.setVisibility(android.view.View.VISIBLE);
        }
        void detachVideo(){
            releasePlayer();
            if(overlayHost!=null&&positionListener!=null&&overlayHost.getViewTreeObserver().isAlive())overlayHost.getViewTreeObserver().removeOnPreDrawListener(positionListener);
            positionListener=null;
            if(texture!=null&&overlayHost!=null)overlayHost.getOverlay().remove(texture);texture=null;overlayHost=null;
        }
        void releasePlayer(){prepared=false;if(player!=null){player.release();player=null;}}
        void pause(){ACTIVE.remove(this);if(drawable instanceof Animatable)((Animatable)drawable).stop();if(player!=null&&prepared)try{player.pause();}catch(IllegalStateException ignored){}if(texture!=null)texture.setVisibility(android.view.View.INVISIBLE);}
        void close(){closed=true;TextView view=target.get();if(view!=null&&installed&&view.getTag(TAG)==this&&matches(view.getText())){writing=true;try{view.setText(original,TextView.BufferType.SPANNABLE);}finally{writing=false;}}pause();MAIN.removeCallbacks(this);if(drawable!=null)drawable.setCallback(null);detachVideo();}

    }
    private static final class AnimationSpan extends ReplacementSpan {
        final Slot slot;AnimationSpan(Slot slot){this.slot=slot;}
        public int getSize(Paint paint,CharSequence text,int start,int end,Paint.FontMetricsInt fm){if(fm!=null){fm.ascent=-slot.height;fm.top=fm.ascent;fm.descent=0;fm.bottom=0;}return slot.width;}
        public void draw(Canvas canvas,CharSequence text,int start,int end,float x,int top,int y,int bottom,Paint paint){
            canvas.save();canvas.translate(x,y-slot.height);
            canvas.clipRect(0,0,slot.width,slot.height);
            if(slot.drawable!=null){
                int w=Math.max(1,slot.drawable.getIntrinsicWidth()),h=Math.max(1,slot.drawable.getIntrinsicHeight());
                float scale=Math.min(slot.width/(float)w,slot.height/(float)h);
                canvas.translate((slot.width-w*scale)/2f,(slot.height-h*scale)/2f);canvas.scale(scale,scale);
                slot.drawable.setBounds(0,0,w,h);slot.drawable.draw(canvas);
            }
            else if(slot.movie!=null){
                slot.movie.setTime((int)((SystemClock.uptimeMillis()-slot.start)%Math.max(1,slot.movie.duration())));
                float scale=Math.min(slot.width/(float)slot.movie.width(),slot.height/(float)slot.movie.height());
                canvas.translate((slot.width-slot.movie.width()*scale)/2f,(slot.height-slot.movie.height()*scale)/2f);
                canvas.scale(scale,scale);slot.movie.draw(canvas,0,0);
            }
            else if(slot.texture!=null)slot.positionVideo();
            canvas.restore();
        }
    }
    private InlineGifPlayback(){}
}
