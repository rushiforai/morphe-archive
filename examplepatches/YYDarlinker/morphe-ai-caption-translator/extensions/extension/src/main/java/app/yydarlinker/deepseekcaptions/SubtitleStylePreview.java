package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.graphics.*;
import android.graphics.drawable.GradientDrawable;
import android.util.AttributeSet;
import android.view.*;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.*;

/** Theme-aware settings preview measured in the same content-frame coordinates as the live overlay. */
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
        TextView title=new TextView(c);title.setText(CaptionStrings.localize(c,"字幕预览"));CaptionSettingsStyle.title(title);heading.addView(title,new LinearLayout.LayoutParams(0,-2,1));
        Button toggle=new Button(c,null,android.R.attr.borderlessButtonStyle);CaptionSettingsStyle.button(toggle);heading.addView(toggle);
        root.addView(heading,new LinearLayout.LayoutParams(-1,-2));
        Preview preview=new Preview(c);preview.setTag("ai_style_preview_canvas");views.add(preview);
        Runnable labels=()->toggle.setText(CaptionStrings.localize(c,preview.portrait?"切换为横屏":"切换为竖屏"));preview.onOrientationChanged=labels;labels.run();toggle.setOnClickListener(v->preview.performClick());
        root.addView(preview,new LinearLayout.LayoutParams(-1,-2));
        TextView hint=new TextView(c);hint.setText(CaptionStrings.localize(c,"点按画面切换方向 · 字号与背景设置实时预览"));CaptionSettingsStyle.caption(hint);hint.setPadding(0,CaptionSettingsStyle.dp(c,8),0,0);root.addView(hint);return root;
    }
    static void update(String key,int value){for(Preview p:new ArrayList<>(views)){if(key.equals(DeepSeekSliderPreference.KEY_TEXT_SIZE))p.size=value;else p.opacity=value;p.invalidate();}}
    // Both orientations use the same on-screen video width, so the configured font
    // has the same apparent size. Bound the tall frame to 75% of the display;
    // settings remain scrollable rather than squeezing the portrait video.
    static float frameWidth(float width,float screenHeight,float density){
        return Math.max(1,Math.min(Math.min(width,560*density),screenHeight*.75f*9f/16f));
    }
    static float stageHeight(float width,float screenHeight,float density,boolean portrait){
        float videoWidth=frameWidth(width,screenHeight,density);
        return portrait?videoWidth*16f/9f:Math.max(videoWidth*9f/16f,Math.min(220*density,screenHeight*.48f));
    }
    static TextView sampleLabel(Context c,String sample,int size,int opacity,float contentWidth,boolean portrait){
        android.util.DisplayMetrics d=c.getResources().getDisplayMetrics();TextView label=new TextView(c);
        label.setIncludeFontPadding(false);label.setGravity(Gravity.CENTER);label.setTextColor(Color.WHITE);label.setText(sample);label.setMaxLines(2);label.setEllipsize(null);
        label.setBreakStrategy(android.text.Layout.BREAK_STRATEGY_BALANCED);label.setHyphenationFrequency(android.text.Layout.HYPHENATION_FREQUENCY_NONE);
        int padX=Math.round(6*d.density),padY=Math.round(4*d.density);label.setPadding(padX,padY,padX,padY);
        int maximum=Math.max(1,Math.round(contentWidth*(portrait?.78f:.92f))-2*padX);float sp=SubtitleStyleMetrics.scaledSp(size,contentWidth/d.density);
        label.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP,sp);label.setShadowLayer(d.density,0,d.density,0xD0000000);
        GradientDrawable bg=new GradientDrawable();bg.setColor(SubtitleStyleMetrics.alpha(opacity)<<24);bg.setCornerRadius(4*d.density);label.setBackground(bg);
        int compact=CaptionOverlay.compactWidth(c,sample,sp,maximum)+2*padX;label.measure(View.MeasureSpec.makeMeasureSpec(compact,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));label.layout(0,0,compact,label.getMeasuredHeight());return label;
    }
    static final class Preview extends View {
        boolean portrait;int size,opacity;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);Runnable onOrientationChanged;
        Preview(Context c){super(c);DeepSeekConfig.Snapshot s=DeepSeekConfig.displayStyle(c);size=s.captionTextSize;opacity=s.backgroundOpacity;setClickable(true);setFocusable(true);describe();}
        private void describe(){setContentDescription(CaptionStrings.localize(getContext(),(portrait?"竖屏":"横屏")+"字幕预览，点击切换方向"));}
        @Override public boolean performClick(){super.performClick();portrait=!portrait;describe();if(onOrientationChanged!=null)onOrientationChanged.run();requestLayout();invalidate();return true;}
        @Override protected void onMeasure(int widthSpec,int heightSpec){android.util.DisplayMetrics d=getResources().getDisplayMetrics();int width=MeasureSpec.getSize(widthSpec);int height=Math.round(stageHeight(width,d.heightPixels,d.density,portrait));setMeasuredDimension(width,resolveSize(height,heightSpec));}
        @Override protected void onDraw(Canvas c){
            android.util.DisplayMetrics d=getResources().getDisplayMetrics();float radius=12*d.density;paint.setColor(CaptionSettingsStyle.tint(CaptionSettingsStyle.primary(getContext()),7));c.drawRoundRect(0,0,getWidth(),getHeight(),radius,radius,paint);
            float w=frameWidth(getWidth(),d.heightPixels,d.density);
            float h=portrait?w*16f/9f:w*9f/16f;
            c.save();c.translate((getWidth()-w)/2f,(getHeight()-h)/2f);Path clip=new Path();clip.addRoundRect(new RectF(0,0,w,h),radius,radius,Path.Direction.CW);c.clipPath(clip);
            paint.setAlpha(255);paint.setShader(new LinearGradient(0,0,w,h,new int[]{0xff354650,0xff9faeae},null,Shader.TileMode.CLAMP));c.drawRect(0,0,w,h,paint);paint.setShader(null);paint.setColor(0xff536866);Path hill=new Path();hill.moveTo(0,h);hill.lineTo(w*.3f,h*.38f);hill.lineTo(w*.6f,h*.70f);hill.lineTo(w*.82f,h*.48f);hill.lineTo(w,h*.64f);hill.lineTo(w,h);hill.close();c.drawPath(hill,paint);
            float shortSide=Math.min(d.widthPixels,d.heightPixels),longSide=Math.max(d.widthPixels,d.heightPixels);
            float contentW=portrait?Math.min(shortSide,longSide*9f/16f):Math.min(longSide,shortSide*16f/9f);
            contentW=Math.max(1,contentW);
            float scale=w/contentW,contentH=h/scale;
            String sample=CaptionStrings.localize(getContext(),"这是字幕样式预览");
            // Simulate the full-size content frame first; shrink the entire view exactly once.
            // Applying the live 12sp floor to the miniature itself incorrectly enlarges portrait text.
            TextView label=sampleLabel(getContext(),sample,size,opacity,contentW,portrait);
            float pos=portrait?DeepSeekConfig.shortsPosition(getContext()):DeepSeekConfig.captionPositionY(getContext(),true);
            c.save();c.scale(scale,scale);
            c.translate((contentW-label.getMeasuredWidth())/2f,Math.max(0,Math.min(contentH-label.getMeasuredHeight(),contentH*pos-label.getMeasuredHeight()/2f)));label.draw(c);c.restore();
            paint.setTextSize(12*d.scaledDensity);paint.setTextAlign(Paint.Align.LEFT);paint.setColor(Color.WHITE);c.drawText(portrait?"9:16":"16:9",12*d.density,24*d.density,paint);c.restore();
        }
    }
}
