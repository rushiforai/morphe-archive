package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.util.AttributeSet;
import android.view.*;
import android.graphics.*;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.*;

/** One theme-aware preview; portrait gets more room with a bounded change to the settings layout. */
@SuppressWarnings("deprecation")
public final class SubtitleStylePreview extends android.preference.Preference {
    private static final Set<Preview> views=Collections.newSetFromMap(new WeakHashMap<Preview,Boolean>());
    public SubtitleStylePreview(Context c){super(c);init();}
    public SubtitleStylePreview(Context c,AttributeSet a){super(c,a);init();}
    public SubtitleStylePreview(Context c,AttributeSet a,int d){super(c,a,d);init();}
    private void init(){setPersistent(false);setSelectable(false);}
    @Override protected View onCreateView(ViewGroup parent){
        Context c=getContext();LinearLayout root=new LinearLayout(c);root.setOrientation(LinearLayout.VERTICAL);CaptionSettingsStyle.row(root);
        LinearLayout heading=new LinearLayout(c);heading.setGravity(Gravity.CENTER_VERTICAL);
        TextView title=new TextView(c);title.setText(CaptionStrings.localize(getContext(), "字幕预览"));CaptionSettingsStyle.title(title);heading.addView(title,new LinearLayout.LayoutParams(0,-2,1));
        Button toggle=new Button(c,null,android.R.attr.borderlessButtonStyle);CaptionSettingsStyle.button(toggle);heading.addView(toggle);
        root.addView(heading,new LinearLayout.LayoutParams(-1,-2));
        Preview preview=new Preview(c);preview.setTag("ai_style_preview_canvas");views.add(preview);
        Runnable labels=()->toggle.setText(CaptionStrings.localize(getContext(), preview.portrait?"切换为横屏":"切换为竖屏"));
        preview.onOrientationChanged=labels;labels.run();toggle.setOnClickListener(v->preview.performClick());
        root.addView(preview,new LinearLayout.LayoutParams(-1,-2));
        TextView hint=new TextView(c);hint.setText(CaptionStrings.localize(getContext(), "点按画面切换方向 · 字号与背景设置实时预览"));CaptionSettingsStyle.caption(hint);hint.setPadding(0,CaptionSettingsStyle.dp(c,8),0,0);
        root.addView(hint);return root;
    }
    static void update(String key,int value){for(Preview p:new ArrayList<>(views)){if(key.equals(DeepSeekSliderPreference.KEY_TEXT_SIZE))p.size=value;else p.opacity=value;p.invalidate();}}
    static float stageHeight(float width,float screenHeight,float density,boolean portrait){
        float videoWidth=Math.min(width,560*density);
        float base=Math.min(Math.max(videoWidth*9f/16f,220*density),Math.max(160*density,screenHeight*.48f));
        return portrait ? base+Math.min(64*density,Math.max(0,screenHeight*.60f-base)) : base;
    }
    static final class Preview extends View {
        boolean portrait;
        int size,opacity;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);Runnable onOrientationChanged;
        Preview(Context c){super(c);DeepSeekConfig.Snapshot s=DeepSeekConfig.displayStyle(c);size=s.captionTextSize;opacity=s.backgroundOpacity;setClickable(true);setFocusable(true);describe();}
        private void describe(){setContentDescription(CaptionStrings.localize(getContext(), (portrait?"竖屏":"横屏")+"字幕预览，点击切换方向"));}
        @Override public boolean performClick(){super.performClick();portrait=!portrait;describe();if(onOrientationChanged!=null)onOrientationChanged.run();requestLayout();invalidate();return true;}
        @Override protected void onMeasure(int widthSpec,int heightSpec){
            android.util.DisplayMetrics d=getResources().getDisplayMetrics();int width=MeasureSpec.getSize(widthSpec);
            int height=Math.round(stageHeight(width,d.heightPixels,d.density,portrait));
            setMeasuredDimension(width,resolveSize(height,heightSpec));
        }
        @Override protected void onDraw(Canvas c){
            android.util.DisplayMetrics d=getResources().getDisplayMetrics();float radius=12*d.density;
            paint.setColor(CaptionSettingsStyle.tint(CaptionSettingsStyle.primary(getContext()),7));
            c.drawRoundRect(0,0,getWidth(),getHeight(),radius,radius,paint);
            float w,h;
            if(portrait){h=getHeight();w=h*9f/16f;if(w>getWidth()){w=getWidth();h=w*16f/9f;}}
            else{w=Math.min(getWidth(),560*d.density);h=w*9f/16f;if(h>getHeight()){h=getHeight();w=h*16f/9f;}}
            c.save();c.translate((getWidth()-w)/2f,(getHeight()-h)/2f);
            Path clip=new Path();clip.addRoundRect(new RectF(0,0,w,h),radius,radius,Path.Direction.CW);c.clipPath(clip);
            paint.setAlpha(255);paint.setShader(new LinearGradient(0,0,w,h,new int[]{0xff354650,0xff9faeae},null,Shader.TileMode.CLAMP));c.drawRect(0,0,w,h,paint);paint.setShader(null);
            paint.setColor(0xff536866);Path hill=new Path();hill.moveTo(0,h);hill.lineTo(w*.3f,h*.38f);hill.lineTo(w*.6f,h*.70f);hill.lineTo(w*.82f,h*.48f);hill.lineTo(w,h*.64f);hill.lineTo(w,h);hill.close();c.drawPath(hill,paint);
            float device=Math.max(1,Math.min(d.widthPixels,d.heightPixels));
            float px=SubtitleStyleMetrics.previewTextPx(size,device,d.density,d.scaledDensity,Math.min(w,h));
            paint.setTextSize(px);paint.setTypeface(Typeface.DEFAULT);paint.setTextAlign(Paint.Align.CENTER);
            String sample=CaptionStrings.localize(getContext(),portrait?"竖屏字幕示例":"这是字幕样式预览");float tw=paint.measureText(sample);
            if(tw>w*.86f){px*=w*.86f/tw;paint.setTextSize(px);tw=w*.86f;}
            float bottom=h*(portrait?.72f:.86f),top=bottom-px*1.65f;
            paint.setColor(Color.argb(SubtitleStyleMetrics.alpha(opacity),0,0,0));c.drawRoundRect(w/2-tw/2-px*.45f,top,w/2+tw/2+px*.45f,bottom,px*.2f,px*.2f,paint);
            paint.setColor(Color.WHITE);c.drawText(sample,w/2,top+px*1.15f,paint);
            paint.setTextSize(12*d.scaledDensity);paint.setTextAlign(Paint.Align.LEFT);c.drawText(portrait?"9:16":"16:9",12*d.density,24*d.density,paint);c.restore();
        }
    }
}
