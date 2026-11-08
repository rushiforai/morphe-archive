package app.morphe.extension.boost;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.window.BackEvent;
import android.window.OnBackAnimationCallback;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/** API34-only media overlay transition, driven by the platform Back gesture.
 * The translucent window reveals the actual underlying Activity. Only native viewer
 * content moves/fades. The existing Back guard registers this at default priority. */
final class SurfaceMediaBack implements OnBackAnimationCallback {
    final WeakReference<SurfaceAppearanceTweaks.Screen> owner;
    final ArrayList<Target> targets=new ArrayList<>();
    ValueAnimator animator;
    float progress,direction=1f;
    boolean started,committing,finished;
    SurfaceMediaBack(SurfaceAppearanceTweaks.Screen screen){owner=new WeakReference<>(screen);}
    @Override public void onBackStarted(BackEvent event){
        SurfaceAppearanceTweaks.Screen screen=owner.get();
        if(committing || screen==null || !screen.active || screen.disposed)return;
        stopAnimation();restore();direction=event.getSwipeEdge()==BackEvent.EDGE_LEFT ? 1f:-1f;
        collect();apply(0);
    }
    void collect(){
        SurfaceAppearanceTweaks.Screen screen=owner.get();View root=screen==null ? null:screen.decor.get();
        if(root==null)return;
        View content=root.findViewById(android.R.id.content);
        if(content!=null)targets.add(new Target(content));
        started=true;
    }
    @Override public void onBackProgressed(BackEvent event){if(!committing){if(!started)onBackStarted(event);if(started)apply(event.getProgress());}}
    @Override public void onBackCancelled(){if(!committing)settle(0,false);}
    @Override public void onBackInvoked(){
        if(committing || finished)return;
        SurfaceAppearanceTweaks.Screen screen=owner.get();if(screen==null || !screen.active || screen.disposed)return;
        if(!started)collect();committing=true;settle(1,true);
    }
    void apply(float value){
        progress=Math.max(0,Math.min(1,value));
        SurfaceAppearanceTweaks.Screen screen=owner.get();if(screen==null)return;View root=screen.decor.get();if(root==null)return;
        float shift=direction*root.getWidth()*0.14f*progress,scale=1-0.08f*progress;
        for(Target target:targets)target.apply(shift,scale,1-progress);
        if(screen.backdrop!=null){screen.backdrop.exitProgress=progress;screen.backdrop.invalidateSelf();}
        if(screen.status!=null)screen.status.setAlpha(Math.round(255*(1-progress)));
        if(screen.navigation!=null)screen.navigation.setAlpha(Math.round(255*(1-progress)));
    }
    void settle(float end,boolean finish){
        stopAnimation();
        if(!ValueAnimator.areAnimatorsEnabled() || progress==end){apply(end);if(finish)finish();else restore();return;}
        ValueAnimator next=ValueAnimator.ofFloat(progress,end);animator=next;
        next.setDuration(finish ? 140:180);next.setInterpolator(new DecelerateInterpolator(1.5f));
        next.addUpdateListener(value->apply((float)value.getAnimatedValue()));
        next.addListener(new AnimatorListenerAdapter(){
            boolean cancelled;
            @Override public void onAnimationCancel(Animator animation){cancelled=true;}
            @Override public void onAnimationEnd(Animator animation){if(animator==animation)animator=null;if(cancelled)return;if(finish)finish();else restore();}
        });next.start();
    }
    void finish(){
        if(finished)return;finished=true;
        SurfaceAppearanceTweaks.Screen screen=owner.get();Activity activity=screen==null ? null:screen.owner.get();
        if(activity==null || !screen.active || screen.disposed || activity.isFinishing() || activity.isDestroyed())return;
        // Avoid a second whole-window transition after the overlay has faded out.
        // Native Back retains result/cleanup semantics; nothing runs on cancellation.
        activity.overrideActivityTransition(Activity.OVERRIDE_TRANSITION_CLOSE,0,0);
        activity.onBackPressed();activity.overridePendingTransition(0,0);
    }
    void stopAnimation(){ValueAnimator previous=animator;animator=null;if(previous!=null)previous.cancel();}
    void pause(){stopAnimation();if(!finished){committing=false;restore();}}
    void resume(){stopAnimation();committing=finished=false;restore();}
    void restore(){
        for(Target target:targets)target.restore();targets.clear();started=false;progress=0;
        SurfaceAppearanceTweaks.Screen screen=owner.get();
        if(screen!=null){
            if(screen.backdrop!=null){
                screen.backdrop.exitProgress=0;
                screen.backdrop.invalidateSelf();
            }
            if(screen.status!=null)screen.status.setAlpha(255);
            if(screen.navigation!=null)screen.navigation.setAlpha(255);
        }
    }
    static final class Target {
        final WeakReference<View> owner;
        final float x,y,sx,sy,alpha;
        Target(View view){owner=new WeakReference<>(view);x=view.getTranslationX();y=view.getTranslationY();sx=view.getScaleX();sy=view.getScaleY();alpha=view.getAlpha();}
        void apply(float shift,float scale,float fade){View view=owner.get();if(view!=null){view.setTranslationX(x+shift);view.setScaleX(sx*scale);view.setScaleY(sy*scale);view.setAlpha(alpha*fade);}}
        void restore(){View view=owner.get();if(view!=null){view.setTranslationX(x);view.setTranslationY(y);view.setScaleX(sx);view.setScaleY(sy);view.setAlpha(alpha);}}
    }
}
