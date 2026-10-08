package e.e.a;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.TextView;

/** Self-contained game with original artwork; no network, audio, or extra Activity. */
public final class BikeRun {
    private BikeRun() {}
    public static void open(Activity activity) {
        UiStrings.selectLanguage(PreferenceManager.getDefaultSharedPreferences(activity).getString("app_lang", "0"));
        if (activity.isFinishing()) return;
        Dialog dialog=new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        FrameLayout root=new FrameLayout(activity);
        Track track=new Track(activity);
        root.addView(track, new FrameLayout.LayoutParams(-1,-1));
        TextView close=new TextView(activity); close.setText("×"); close.setTextSize(28);
        close.setGravity(Gravity.CENTER); close.setTextColor(track.accent);
        close.setContentDescription("ミニゲームを閉じる"); close.setOnClickListener(v->dialog.dismiss());
        int size=Math.round(56*activity.getResources().getDisplayMetrics().density);
        root.addView(close,new FrameLayout.LayoutParams(size,size,Gravity.TOP|Gravity.END));
        dialog.setContentView(root); dialog.setOnDismissListener(d->track.active=false);
        dialog.show();
        Window window=dialog.getWindow();
        if(window!=null) { window.setLayout(-1,-1); window.setBackgroundDrawableResource(android.R.color.transparent); window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON); }
    }
    private static int color(Context c,int attr,int fallback) {
        TypedValue value=new TypedValue();
        if(!c.getTheme().resolveAttribute(attr,value,true))return fallback;
        if(value.resourceId!=0)try{return c.getResources().getColorStateList(value.resourceId).getDefaultColor();}catch(Exception ignored){}
        return value.data;
    }
    private static final class Track extends View {
        final BikeRunModel game=new BikeRunModel(System.nanoTime());
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        final Path road=new Path(), obstacle=new Path();
        final int accent,background,foreground;
        int best;
        long last;
        boolean active=true, recorded;
        Track(Context c) {
            super(c); accent=color(c,0x7f03005e,0xff52cca3);
            background=color(c,android.R.attr.colorBackground,0xff191b20);
            foreground=color(c,android.R.attr.textColorPrimary,0xffeeeeee);
            best=PreferenceManager.getDefaultSharedPreferences(c).getInt("bike_run_best",0);
            setContentDescription("自転車ラン。タップで2段ジャンプ。障害物と穴を避けます。終了後はタップで再挑戦。");
            setFocusable(true);
        }
        void line(Canvas c,float x,float y,float xx,float yy) { c.drawLine(x,y,xx,yy,paint); }
        void scenery(Canvas c,float height) {
            paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(1.5f);paint.setColor(foreground);paint.setAlpha(80);
            float horizon=height*.52f;
            c.drawCircle(585,145,29,paint);
            for(int n=0;n<8;n++){double a=n*Math.PI/4;line(c,585+(float)Math.cos(a)*37,145+(float)Math.sin(a)*37,585+(float)Math.cos(a)*47,145+(float)Math.sin(a)*47);}
            float clouds=(game.distance*.10f)%900;
            for(int n=0;n<4;n++){
                float x=n*270-clouds,y=155+(n%2)*75;
                c.drawArc(x,y,x+42,y+30,180,180,false,paint);
                c.drawArc(x+24,y-16,x+80,y+30,180,180,false,paint);
                c.drawArc(x+62,y,x+106,y+30,180,180,false,paint);
                line(c,x,y+15,x+106,y+15);
            }
            float offset=game.distance*.22f;
            int first=(int)(offset/180)-1;
            for(int n=first;n<first+7;n++) {
                int hash=n*1103515245+12345; hash^=hash>>>16;
                int kind=(hash&0x7fffffff)%5;
                float x=n*180-offset+(hash>>>8&31), size=55+(hash>>>13&63);
                if(kind==0){
                    line(c,x,horizon,x+size/2,horizon-size);line(c,x+size/2,horizon-size,x+size,horizon);
                    line(c,x+size*.32f,horizon-size*.64f,x+size*.48f,horizon-size*.53f);
                } else if(kind==1){
                    line(c,x+26,horizon,x+26,horizon-60);c.drawCircle(x+26,horizon-83,29,paint);
                    c.drawCircle(x+6,horizon-65,20,paint);c.drawCircle(x+46,horizon-65,20,paint);
                } else if(kind==2){
                    line(c,x,horizon,x+30,horizon-size-65);line(c,x+30,horizon-size-65,x+60,horizon);
                    line(c,x+10,horizon-35,x+50,horizon-35);line(c,x+18,horizon-75,x+42,horizon-75);
                } else if(kind==3){
                    float top=horizon-size;c.drawRect(x,top,x+64,horizon,paint);
                    line(c,x-8,top,x+32,top-34);line(c,x+32,top-34,x+72,top);
                    c.drawRect(x+24,horizon-30,x+40,horizon,paint);
                } else {
                    c.drawRect(x,horizon-size-40,x+72,horizon,paint);
                    for(int row=0;row<3;row++)for(int col=0;col<3;col++)c.drawRect(x+10+col*18,horizon-size-27+row*27,x+20+col*18,horizon-size-15+row*27,paint);
                }
            }
            paint.setAlpha(255);
        }
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas); if(!active)return;
            long now=SystemClock.uptimeMillis();
            if(hasWindowFocus()&&last!=0)game.step((now-last)/1000f);
            last=hasWindowFocus()?now:0;
            if(game.over&&!recorded) {
                recorded=true;
                if(game.score()>best) { best=game.score(); PreferenceManager.getDefaultSharedPreferences(getContext()).edit().putInt("bike_run_best",best).apply(); }
            }
            canvas.drawColor(background);
            float scale=getWidth()/720f; if(scale<=0)return;
            canvas.save(); canvas.scale(scale,scale);
            float height=getHeight()/scale,ground=Math.max(230,height*2/3+43);
            paint.setStyle(Paint.Style.FILL); paint.setColor(foreground); paint.setTextSize(25);
            canvas.drawText("自転車ラン",24,44,paint); paint.setTextSize(18);
            canvas.drawText("距離 "+game.score()+" m   ベスト "+best+" m",24,78,paint);
            scenery(canvas,height);
            paint.setColor(accent); paint.setStrokeWidth(3);
            road.reset(); boolean connected=false;
            for(int sx=0;sx<=720;sx+=4) {
                boolean gap=false;
                for(BikeRunModel.Hazard h:game.hazards) if(h.gap && sx>h.x && sx<h.x+h.width) { gap=true; break; }
                float sy=ground+game.groundAt(sx);
                if(gap) { connected=false; continue; }
                if(connected) road.lineTo(sx,sy); else road.moveTo(sx,sy);
                connected=true;
            }
            paint.setStyle(Paint.Style.STROKE); canvas.drawPath(road,paint); paint.setStyle(Paint.Style.FILL);
            for(BikeRunModel.Hazard h:game.hazards) {
                float left=ground+game.groundAt(h.x),right=ground+game.groundAt(h.x+h.width);
                if(h.gap) {
                    line(canvas,h.x,left,h.x,left+230); line(canvas,h.x+h.width,right,h.x+h.width,right+230);
                } else {
                    obstacle.reset(); obstacle.moveTo(h.x,left);
                    if(h.spikes){int teeth=Math.max(2,(int)(h.width/20));for(int n=0;n<teeth;n++){float x=h.x+h.width*n/teeth;obstacle.lineTo(x+h.width/teeth/2,ground+game.groundAt(x+h.width/teeth/2)-h.height);obstacle.lineTo(x+h.width/teeth,ground+game.groundAt(x+h.width/teeth));}}
                    else {obstacle.lineTo(h.x,left-h.height);obstacle.lineTo(h.x+h.width,right-h.height);obstacle.lineTo(h.x+h.width,right);}
                    if(!h.spikes)obstacle.close();paint.setStyle(Paint.Style.STROKE);
                    canvas.drawPath(obstacle,paint);
                }
            }
            paint.setColor(accent); paint.setStyle(Paint.Style.STROKE); paint.setStrokeWidth(4);
            canvas.save();
            canvas.translate(BikeRunModel.RIDER_X,ground+game.groundAt(BikeRunModel.RIDER_X)+game.y);
            canvas.rotate(game.y==0?(float)Math.toDegrees(Math.atan(game.slopeAt(BikeRunModel.RIDER_X))):0);
            canvas.scale(.65f,.65f);
            float x=0,y=-17;
            canvas.drawCircle(x-24,y,16,paint); canvas.drawCircle(x+24,y,16,paint);
            line(canvas,x-24,y,x-7,y-26); line(canvas,x-7,y-26,x+5,y); line(canvas,x+5,y,x-24,y);
            line(canvas,x+5,y,x+19,y-28); line(canvas,x+19,y-28,x+24,y); line(canvas,x-7,y-26,x+19,y-28);
            line(canvas,x+19,y-28,x+15,y-36); line(canvas,x+15,y-36,x+27,y-36);
            canvas.drawCircle(x-1,y-60,9,paint); line(canvas,x-4,y-50,x-13,y-29); line(canvas,x-13,y-29,x+5,y-16);
            line(canvas,x+5,y-16,x-4,y); line(canvas,x-4,y-50,x+16,y-35);
            canvas.restore();
            paint.setStyle(Paint.Style.FILL); paint.setColor(foreground); paint.setTextAlign(Paint.Align.CENTER); paint.setTextSize(22);

            if(!game.started||game.over) {
                paint.setTextSize(32); canvas.drawText(game.over?"ゲームオーバー":"障害物と穴をジャンプで避けよう",360,height/2,paint);
                paint.setTextSize(22); canvas.drawText(game.over?"タップで再挑戦":"タップしてスタート",360,height/2+42,paint);
            }
            paint.setTextAlign(Paint.Align.LEFT); canvas.restore();
            if(active&&hasWindowFocus()&&game.started&&!game.over)postInvalidateOnAnimation();
        }
        public boolean onTouchEvent(MotionEvent e) {
            if(e.getActionMasked()==MotionEvent.ACTION_DOWN) {
                performClick(); recorded=false; game.tap();
                if(last==0)last=SystemClock.uptimeMillis();
                invalidate();
            }
            return true;
        }
        public boolean performClick() { super.performClick(); return true; }
        public void onWindowFocusChanged(boolean focused) { super.onWindowFocusChanged(focused); last=0; if(focused)invalidate(); }
        protected void onDetachedFromWindow() { active=false; super.onDetachedFromWindow(); }
    }
}
