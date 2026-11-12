package app.morphe.extension.chmate;

import android.view.*;import android.widget.*;import android.content.*;

/** Retry is confined to failed previews; ordinary thumbnail binding has no posted work. */
public final class VideoThumbnailRetry {
    private static final int TAG=0x7e0b0022;
    private static final int ACTIONS_TAG=0x7e0b0023;
    private static final android.os.Handler MAIN=new android.os.Handler(android.os.Looper.getMainLooper());
    public static void bind(Object object,String poster){
        if(!(object instanceof View))return;
        View view=(View)object;Object previous=view.getTag(TAG);
        if(poster==null||!poster.contains("/video-error-")||!FeatureSwitches.enabled("videoFrameThumbnailsEnabled",true)){
            if(previous instanceof Slot)((Slot)previous).close();return;
        }
        if(previous instanceof Slot&&poster.equals(((Slot)previous).poster)){((Slot)previous).update();return;}
        if(previous instanceof Slot)((Slot)previous).close();
        String source=XMediaAttachments.sourceVideo(poster);if(source==null)return;
        Slot slot=new Slot(view,poster,source);view.setTag(TAG,slot);
        view.addOnAttachStateChangeListener(slot);
        MAIN.post(()->{if(view.getTag(TAG)==slot&&!slot.closed){slot.attach();slot.update();}});
    }
    private static final class Slot implements View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener {
        final View view;final String poster,source;Button button;LinearLayout actions;FrameLayout host;
        boolean closed,detachPosted;
        final Runnable polling=this::poll;
        final android.graphics.Rect visible=new android.graphics.Rect();final int[] location=new int[2],origin=new int[2];
        Slot(View view,String poster,String source){this.view=view;this.poster=poster;this.source=source;}
        void attach(){
            if(closed||view.getTag(TAG)!=this||actions!=null||!view.isAttachedToWindow()||!(view.getRootView() instanceof FrameLayout))return;
            host=(FrameLayout)view.getRootView();
            actions=new LinearLayout(host.getContext());actions.setOrientation(LinearLayout.HORIZONTAL);
            actions.setTag(ACTIONS_TAG,Boolean.TRUE);
            button=button("再取得","サムネイルを再取得");
            Button play=button("再生","サムネイルを使わずに動画を再生");
            actions.addView(button,new LinearLayout.LayoutParams(0,-1,1));actions.addView(play,new LinearLayout.LayoutParams(0,-1,1));
            int height=Math.round(36*view.getResources().getDisplayMetrics().density);
            host.addView(actions,new FrameLayout.LayoutParams(Math.max(1,view.getWidth()),height,Gravity.TOP|Gravity.LEFT));
            host.getViewTreeObserver().addOnPreDrawListener(this);position();
            button.setOnClickListener(v->{if(closed||view.getTag(TAG)!=this)return;if(VideoFrameThumbnail.retry(source)){update();MAIN.removeCallbacks(polling);MAIN.postDelayed(polling,500);}else if(!VideoFrameThumbnail.running(source))Toast.makeText(view.getContext(),"動画サムネイルの取得設定を確認してください",Toast.LENGTH_SHORT).show();});
            play.setOnClickListener(v->{if(closed||view.getTag(TAG)!=this)return;try{view.getContext().startActivity(playbackIntent(view.getContext(),source));}catch(RuntimeException unavailable){Toast.makeText(view.getContext(),"動画を開けませんでした",Toast.LENGTH_SHORT).show();}});
        }
        Button button(String text,String description){Button button=new Button(host.getContext());button.setText(text);button.setContentDescription(description);button.setTextSize(12);button.setAllCaps(false);button.setMinHeight(0);button.setMinimumHeight(0);button.setMinWidth(0);button.setMinimumWidth(0);button.setPadding(4,0,4,0);return button;}
        void update(){if(button!=null){boolean running=VideoFrameThumbnail.running(source);button.setText(running?"再取得中…":"再取得");button.setEnabled(!running);}}
        void poll(){if(closed||view.getTag(TAG)!=this)return;update();if(VideoFrameThumbnail.running(source)&&view.isAttachedToWindow())MAIN.postDelayed(polling,500);}
        void position(){
            if(closed||host==null||actions==null)return;
            if(!view.isAttachedToWindow()||!view.isShown()||view.getWidth()<=0||!view.getGlobalVisibleRect(visible)||covered(view,host,visible)){actions.setVisibility(View.GONE);return;}
            view.getLocationOnScreen(location);host.getLocationOnScreen(origin);int height=actions.getLayoutParams().height;
            int top=location[1]+view.getHeight()-height;
            if(top<visible.top||top+height>visible.bottom){actions.setVisibility(View.GONE);return;}
            ViewGroup.LayoutParams params=actions.getLayoutParams();if(params.width!=view.getWidth()){params.width=view.getWidth();actions.setLayoutParams(params);}
            actions.setX(location[0]-origin[0]);actions.setY(top-origin[1]);actions.setVisibility(View.VISIBLE);
        }
        @Override public boolean onPreDraw(){position();return true;}
        @Override public void onViewAttachedToWindow(View v){MAIN.post(()->{if(!closed&&view.getTag(TAG)==this){attach();update();}});}
        @Override public void onViewDetachedFromWindow(View v){
            scheduleDetach();
        }
        void scheduleDetach(){
            MAIN.removeCallbacks(polling);
            if(detachPosted)return;detachPosted=true;
            // A bind/close may run inside FrameLayout.layoutChildren, not just
            // dispatchDetachedFromWindow. Never remove root children inline.
            MAIN.post(()->{detachPosted=false;detach();if(!closed&&view.isAttachedToWindow()&&view.getTag(TAG)==this){attach();update();}});
        }
        void detach(){if(host!=null){if(host.getViewTreeObserver().isAlive())host.getViewTreeObserver().removeOnPreDrawListener(this);if(actions!=null)host.removeView(actions);}actions=null;button=null;host=null;}
        void close(){if(closed)return;closed=true;view.removeOnAttachStateChangeListener(this);if(view.getTag(TAG)==this)view.setTag(TAG,null);if(actions!=null){actions.setVisibility(View.GONE);button.setEnabled(false);}scheduleDetach();}
    }
    /** Root overlays must not float over a later native reply popup or another image.
     * Inspect only this thumbnail's ancestor path and later siblings, never other windows. */
    static boolean covered(View source,ViewGroup root,android.graphics.Rect area){
        View branch=source;android.graphics.Rect bounds=new android.graphics.Rect();
        while(branch!=root&&branch.getParent() instanceof ViewGroup){
            ViewGroup parent=(ViewGroup)branch.getParent();int index=parent.indexOfChild(branch);
            for(int n=index+1;n<parent.getChildCount();n++){
                View sibling=parent.getChildAt(n);
                if(Boolean.TRUE.equals(sibling.getTag(ACTIONS_TAG))||!sibling.isShown()||sibling.getAlpha()<=0)continue;
                if(sibling.getGlobalVisibleRect(bounds)&&android.graphics.Rect.intersects(area,bounds)&&drawsOver(sibling,area,bounds))return true;
            }
            branch=parent;
        }
        return false;
    }
    private static boolean drawsOver(View sibling,android.graphics.Rect area,android.graphics.Rect bounds){
        if(!sibling.isShown()||sibling.getAlpha()<=0||Boolean.TRUE.equals(sibling.getTag(ACTIONS_TAG)))return false;
        if(!sibling.getGlobalVisibleRect(bounds)||!android.graphics.Rect.intersects(area,bounds))return false;
        if(!(sibling instanceof ViewGroup))return true;
        android.graphics.drawable.Drawable background=sibling.getBackground();
        if(background!=null&&background.getOpacity()!=android.graphics.PixelFormat.TRANSPARENT&&background.getAlpha()>0)return true;
        ViewGroup group=(ViewGroup)sibling;
        for(int n=0;n<group.getChildCount();n++)if(drawsOver(group.getChildAt(n),area,bounds))return true;
        return false;
    }
    static Intent playbackIntent(android.content.Context context,String source){
        java.util.ArrayList<String> links=new java.util.ArrayList<>();links.add(source);
        Intent intent=new Intent().setClassName(context,"jp.syoboi.a2chMate.activity.ImagesViewer2Activity")
                .putStringArrayListExtra("links",links).putExtra("index",0).putExtra("forwardTabletHome",false);
        MediaViewerNavigation.prepareNativeIntent(intent,context);
        if(NativeToolTabs.activity(context)==null)intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return intent;
    }
    private VideoThumbnailRetry(){}
}
