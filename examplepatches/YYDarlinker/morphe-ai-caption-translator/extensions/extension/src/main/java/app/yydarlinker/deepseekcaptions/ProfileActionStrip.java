package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.*;
import android.graphics.drawable.*;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;

/** Quiet, equal-width profile actions. Stack only when text would crowd the touch targets. */
final class ProfileActionStrip extends LinearLayout {
    private Button primaryButton;
    private boolean stackedLastMeasure;
    ProfileActionStrip(Context context) { super(context); }

    Button add(String label,Runnable click) {
        Button button=CaptionSettingsStyle.action(getContext(),label,false,false,click);
        // The host dialog's text-only action buttons are the visual contract at every step.
        addView(button,new LayoutParams(0,LayoutParams.WRAP_CONTENT,1));
        return button;
    }

    Button addPrimary(String label,Runnable click){
        Button b=CaptionSettingsStyle.action(getContext(),label,true,false,click);
        primaryButton=b;
        addView(b,new LayoutParams(0,LayoutParams.WRAP_CONTENT,1));return b;
    }
    static int danger(Context c) {
        int fg=CaptionSettingsStyle.primary(c);
        boolean dark=Color.red(fg)+Color.green(fg)+Color.blue(fg)>420;
        return dark?0xffe7aaa4:0xff98413c;
    }

    @Override protected void onMeasure(int widthSpec,int heightSpec) {
        int gap=CaptionSettingsStyle.dp(getContext(),8);
        int available=MeasureSpec.getSize(widthSpec)-getPaddingLeft()-getPaddingRight();
        int largest=0;
        for(int i=0;i<getChildCount();i++){
            View child=getChildAt(i);
            child.measure(MeasureSpec.makeMeasureSpec(0,MeasureSpec.UNSPECIFIED),
                    MeasureSpec.makeMeasureSpec(0,MeasureSpec.UNSPECIFIED));
            largest=Math.max(largest,child.getMeasuredWidth());
        }
        boolean stacked=MeasureSpec.getMode(widthSpec)!=MeasureSpec.UNSPECIFIED
                && largest*getChildCount()+gap*Math.max(0,getChildCount()-1)>available;
        // Morphe puts the primary action before Cancel when it stacks actions vertically.
        // Preserve the familiar Cancel-left / Primary-right order when there is room.
        if(stacked != stackedLastMeasure && primaryButton!=null && getChildCount()==2) {
            int target=stacked?0:1;
            if(indexOfChild(primaryButton)!=target) {
                LayoutParams params=(LayoutParams)primaryButton.getLayoutParams();
                removeView(primaryButton);
                addView(primaryButton,target,params);
            }
        }
        stackedLastMeasure=stacked;
        setOrientation(stacked?VERTICAL:HORIZONTAL);
        for(int i=0;i<getChildCount();i++){
            LayoutParams lp=(LayoutParams)getChildAt(i).getLayoutParams();
            int width=stacked?LayoutParams.MATCH_PARENT:0;
            float weight=stacked?0:1;
            int top=stacked && i>0?gap:0,start=!stacked && i>0?gap:0;
            if(lp.width!=width || lp.height!=LayoutParams.WRAP_CONTENT || lp.weight!=weight
                    || lp.topMargin!=top || lp.getMarginStart()!=start){
                lp.width=width;lp.height=LayoutParams.WRAP_CONTENT;lp.weight=weight;
                lp.topMargin=top;lp.setMarginStart(start);getChildAt(i).setLayoutParams(lp);
            }
        }
        super.onMeasure(widthSpec,heightSpec);
    }

    static Drawable icon(Context c,int kind,int color){return new ActionIcon(c,kind,color);}
    private static final class ActionIcon extends Drawable {
        final int size,kind;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        ActionIcon(Context c,int kind,int color){
            this.kind=kind;size=CaptionSettingsStyle.dp(c,18);paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(1.6f);
            paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);
        }
        @Override public void draw(Canvas canvas){
            canvas.save();canvas.translate(getBounds().left,getBounds().top);
            canvas.scale(getBounds().width()/24f,getBounds().height()/24f);
            Path p=new Path();
            if(kind==1){
                p.moveTo(4,16);p.lineTo(15.5f,4.5f);p.lineTo(19.5f,8.5f);p.lineTo(8,20);p.lineTo(3,21);p.close();
                canvas.drawPath(p,paint);canvas.drawLine(13.5f,6.5f,17.5f,10.5f,paint);
            }else if(kind==3){
                paint.setStyle(Paint.Style.FILL);
                for(int y:new int[]{5,12,19})canvas.drawCircle(12,y,1.7f,paint);
                paint.setStyle(Paint.Style.STROKE);
            }else if(kind==4){
                p.moveTo(6,15);p.lineTo(12,9);p.lineTo(18,15);canvas.drawPath(p,paint);
            }else{
                canvas.drawLine(4,6,20,6,paint);canvas.drawLine(9,3,15,3,paint);
                p.moveTo(6,6);p.lineTo(7,21);p.lineTo(17,21);p.lineTo(18,6);canvas.drawPath(p,paint);
                canvas.drawLine(10,10,10,17,paint);canvas.drawLine(14,10,14,17,paint);
            }
            canvas.restore();
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);invalidateSelf();}
        @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
        @Override public int getIntrinsicWidth(){return size;}
        @Override public int getIntrinsicHeight(){return size;}
    }
}
