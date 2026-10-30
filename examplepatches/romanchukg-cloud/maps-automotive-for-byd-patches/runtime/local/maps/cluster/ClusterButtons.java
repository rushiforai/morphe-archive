package local.maps.cluster;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.*;
import android.graphics.drawable.*;
import android.view.*;
import android.widget.*;

/** Cluster and voice controls anchored to the measured native one-bar column, including its animations. */
final class ClusterButtons {
    private static final String TAG="local.cluster.buttons";
    static void attach(Activity a) {
        if(a.isFinishing()||a.isDestroyed())return;
        ViewGroup root=(ViewGroup)a.getWindow().getDecorView();
        if(root.findViewWithTag(TAG)!=null)return;
        new Controls(a,root);
    }
    private static int id(Context c,String name){return MapsResources.id(c.getResources(),name,"id");}
    private static int dp(Context c,int n){return Math.round(n*c.getResources().getDisplayMetrics().density);}
    private static final class Controls implements ViewTreeObserver.OnPreDrawListener {
        final Activity activity; final ViewGroup root; final ScrollView column; final LinearLayout buttons;
        final ImageButton settings,map,voice; final FrameLayout settingsSlot,voiceSlot; final Icon settingsIcon=new Icon(false),mapIcon=new Icon(true),voiceIcon=new Icon(false,true);
        View template,bar,bottom; Drawable nativeBackground; int lastColour,lastSurface,lastActive;
        boolean styled,wasOn; int tx,ty,tw,th;
        Controls(Activity a,ViewGroup r) {
            activity=a;root=r;column=new ScrollView(a);column.setTag(TAG);column.setFillViewport(false);
            column.setClipToPadding(false);column.setClipChildren(false);column.setVerticalScrollBarEnabled(false);
            buttons=new LinearLayout(a);buttons.setOrientation(LinearLayout.VERTICAL);buttons.setClipChildren(false);
            settings=button(settingsIcon,"Instrument cluster settings");map=button(mapIcon,"Hide map on instrument cluster");
            settingsSlot=(FrameLayout)settings.getParent();buttons.removeView(settingsSlot);
            voice=button(voiceIcon,"Talk to Gemini Live");voiceSlot=(FrameLayout)voice.getParent();
            settings.setTag("local.cluster.settings.button");map.setTag("local.cluster.map.button");voice.setTag("local.cluster.gemini.button");
            GeminiLaunch.init(a);voice.setOnClickListener(v->GeminiLaunch.open(a));
            settings.setOnClickListener(v->ClusterSettings.show(a));
            map.setOnClickListener(v->{ClusterSettings.toggleMap();updateState();});
            column.addView(buttons);column.setVisibility(View.INVISIBLE);
            root.addView(column,new FrameLayout.LayoutParams(1,1,Gravity.TOP|Gravity.LEFT));
            settingsSlot.setVisibility(View.INVISIBLE);root.addView(settingsSlot,new FrameLayout.LayoutParams(1,1,Gravity.TOP|Gravity.LEFT));
            root.getViewTreeObserver().addOnPreDrawListener(this);
            root.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
                public void onViewAttachedToWindow(View v){}
                public void onViewDetachedFromWindow(View v){if(root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnPreDrawListener(Controls.this);}
            });
        }
        ImageButton button(Icon icon,String description){
            ImageButton b=new ImageButton(activity);b.setImageDrawable(icon);b.setScaleType(ImageView.ScaleType.FIT_CENTER);
            b.setPadding(0,0,0,0);b.setContentDescription(description);b.setTooltipText(description);b.setFocusable(true);
            FrameLayout slot=new FrameLayout(activity);slot.setClipChildren(false);slot.addView(b,new FrameLayout.LayoutParams(1,1,Gravity.CENTER));
            buttons.addView(slot,new LinearLayout.LayoutParams(1,1));return b;
        }
        public boolean onPreDraw(){
            ReportButtonRecovery.observe(root);
            if(activity.isDestroyed()||activity.isFinishing())return true;
            if(template==null||!template.isAttachedToWindow()){
                template=root.findViewById(id(activity,"map_buttons_view_settings_button"));
                bar=root.findViewById(id(activity,"one_bar_ellipsizing_container"));
                bottom=root.findViewById(id(activity,"one_bar_bottom_group"));styled=false;
            }
            if(template==null||bar==null||!bar.isShown()||activity.isInPictureInPictureMode()||template.getWidth()==0){column.setVisibility(View.INVISIBLE);settingsSlot.setVisibility(View.INVISIBLE);voiceSlot.setVisibility(View.INVISIBLE);return true;}
            Rect anchor=new Rect(),area=new Rect();template.getGlobalVisibleRect(anchor);bar.getGlobalVisibleRect(area);
            int end=anchor.bottom;int slot=template.getHeight();
            if(bar instanceof ViewGroup){ViewGroup g=(ViewGroup)bar;for(int i=0;i<g.getChildCount();i++){
                View child=g.getChildAt(i);Rect bounds=new Rect();
                if(child.isShown()&&child.getHeight()>0&&child.getGlobalVisibleRect(bounds)){
                    end=Math.max(end,bounds.bottom);if(bounds.top<=anchor.top&&bounds.bottom>=anchor.bottom)slot=bounds.height();
                }
            }}
            int gap=Math.max(0,(slot-template.getHeight())/2);
            int limit=area.bottom;Rect obstacle=new Rect();if(bottom!=null&&bottom.isShown()&&bottom.getGlobalVisibleRect(obstacle))limit=Math.min(limit,obstacle.top);
            int rows=GeminiLaunch.buttonEnabled()?2:1;
            voiceSlot.setVisibility(rows==2?View.VISIBLE:View.GONE);
            int height=ClusterButtonPlacement.columnHeight(slot,rows,limit-end);
            column.setVerticalScrollBarEnabled(height<rows*slot);column.setScrollbarFadingEnabled(false);
            if(rows==1||height>=rows*slot)column.scrollTo(0,0);
            int[] origin=new int[2];root.getLocationOnScreen(origin);
            FrameLayout.LayoutParams right=(FrameLayout.LayoutParams)settingsSlot.getLayoutParams();
            // Mirror against the actual native column, including Maps' per-app language.
            // anchor.left is an outer inset only in LTR; in RTL it spans almost the whole screen.
            Rect visible=new Rect();root.getWindowVisibleDisplayFrame(visible);
            Rect sceneBounds=new Rect();View scene=root.findViewById(id(activity,"scene_card"));
            boolean sceneShown=scene!=null&&scene.getGlobalVisibleRect(sceneBounds)&&scene.isShown();
            // Next to Search: the opposite corner was hard to reach from the driver's seat.
            int beside=sceneShown?ClusterButtonPlacement.besideCard(visible.left,visible.right,anchor.width(),sceneBounds.left,sceneBounds.right,dp(activity,12),area.left,area.right):-1;
            Rect box=new Rect();View search=root.findViewById(id(activity,"main_suggested_destinations_search_box"));
            if(beside<0||search==null||!search.isShown()||!search.getGlobalVisibleRect(box)||box.top<sceneBounds.top||box.bottom>sceneBounds.bottom)box.setEmpty();
            int settingsX=(beside>=0?beside:ClusterButtonPlacement.settingsLeft(visible.left,visible.right,anchor.left,anchor.right,sceneBounds.left,sceneBounds.right))-origin[0];
            int top=(beside>=0?ClusterButtonPlacement.besideTop(anchor.top,box.top,box.bottom,anchor.height()):anchor.top)-origin[1];
            if(right.width!=anchor.width()||right.height!=anchor.height()||right.leftMargin!=settingsX||right.topMargin!=top){right.width=anchor.width();right.height=anchor.height();right.gravity=Gravity.TOP|Gravity.LEFT;right.leftMargin=settingsX;right.rightMargin=0;right.topMargin=top;settingsSlot.setLayoutParams(right);}
            FrameLayout.LayoutParams sb=(FrameLayout.LayoutParams)settings.getLayoutParams();if(sb.width!=anchor.width()||sb.height!=anchor.height()){sb.width=anchor.width();sb.height=anchor.height();settings.setLayoutParams(sb);}
            settingsSlot.setVisibility(View.VISIBLE);
            if(height<dp(template.getContext(),48)){column.setVisibility(View.INVISIBLE);style();updateState();return true;}
            int x=area.left-origin[0], y=end-origin[1], width=area.width();
            if(tx!=x||ty!=y||tw!=width||th!=height){
                tx=x;ty=y;tw=width;th=height;FrameLayout.LayoutParams lp=(FrameLayout.LayoutParams)column.getLayoutParams();lp.width=width;lp.height=height;lp.leftMargin=x;lp.topMargin=y;column.setLayoutParams(lp);
            }
            for(ImageButton b:new ImageButton[]{map,voice}){
                View slotView=(View)b.getParent();ViewGroup.LayoutParams sp=slotView.getLayoutParams();
                if(sp.width!=width||sp.height!=slot){sp.width=width;sp.height=slot;slotView.setLayoutParams(sp);}
                FrameLayout.LayoutParams bp=(FrameLayout.LayoutParams)b.getLayoutParams();
                if(bp.width!=anchor.width()||bp.height!=template.getHeight()){bp.width=anchor.width();bp.height=template.getHeight();b.setLayoutParams(bp);}
            }
            style();updateState();column.setVisibility(View.VISIBLE);return true;
        }
        int colour(String name,int fallback){try{int i=MapsResources.id(activity.getResources(),name,"color");return i==0?fallback:activity.getResources().getColor(i,activity.getTheme());}catch(RuntimeException e){return fallback;}}
        void style(){
            int ink=colour("geo_sys_color_on_surface",0xff303134),surface=colour("geo_sys_color_surface",Color.WHITE),active=colour("geo_sys_color_primary",0xff0b57d0);
            if(styled&&ink==lastColour&&surface==lastSurface&&active==lastActive)return;
            lastColour=ink;lastSurface=surface;lastActive=active;nativeBackground=null;
            View v=template;for(int i=0;i<4&&v!=bar;i++){
                if(v.getBackground()!=null&&v.getBackground().getConstantState()!=null){nativeBackground=v.getBackground();break;}
                if(!(v.getParent() instanceof View))break;v=(View)v.getParent();
            }
            for(ImageButton b:new ImageButton[]{settings,map,voice}){b.setBackground(background(surface));b.setClipToOutline(true);}
            float elevation=template.getElevation();for(ImageButton b:new ImageButton[]{settings,map,voice})b.setElevation(Math.max(elevation,dp(activity,2)));
            settingsIcon.colour=ink;settingsIcon.invalidateSelf();voiceIcon.colour=ink;voiceIcon.invalidateSelf();styled=true;wasOn=!ClusterSettings.state().mapEnabled;
        }
        Drawable background(int colour){
            GradientDrawable circle=new GradientDrawable();circle.setShape(GradientDrawable.OVAL);circle.setColor(colour);
            GradientDrawable mask=new GradientDrawable();mask.setShape(GradientDrawable.OVAL);mask.setColor(Color.WHITE);
            ColorStateList ripple=ColorStateList.valueOf((lastColour&0x00ffffff)|0x26000000);
            return new RippleDrawable(ripple,circle,mask);
        }
        void updateState(){
            boolean on=ClusterSettings.state().mapEnabled;
            if(wasOn!=on){map.setSelected(on);map.setActivated(on);mapIcon.on=on;mapIcon.colour=on?lastActive:lastColour;mapIcon.invalidateSelf();String text=(on?"Hide":"Show")+" map on instrument cluster";map.setContentDescription(text);map.setTooltipText(text);wasOn=on;}
        }
    }
    /** Dashboard toggle and instrument settings, at the same optical size as the native gear. */
    private static final class Icon extends Drawable {
        final boolean map,voice;boolean on;int colour=0xff303134;final Paint paint=new Paint(3);
        Icon(boolean m){this(m,false);}Icon(boolean m,boolean v){map=m;voice=v;}
        public void draw(Canvas canvas){
            Rect b=getBounds();canvas.save();canvas.translate(b.left,b.top);canvas.scale(b.width()/48f,b.height()/48f);
            paint.setColor(colour);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(1.8f);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);
            Path p=new Path();
            if(voice){
                paint.setColor(0xff8ab4f8);paint.setStrokeWidth(2.6f);
                // Own Gemini Live waveform glyph.
                float[] height={8,17,25,17,8};
                for(int i=0;i<height.length;i++){float x=14+i*5;canvas.drawLine(x,24-height[i]/2,x,24+height[i]/2,paint);}
            }else if(map){
                canvas.drawRoundRect(12,16,36,32,4,4,paint);
                canvas.drawArc(15,20,23,28,185,170,false,paint);canvas.drawArc(25,20,33,28,185,170,false,paint);
                canvas.drawLine(19,25,21,22,paint);canvas.drawLine(29,25,27,22,paint);
                if(on){paint.setStyle(Paint.Style.FILL);canvas.drawCircle(33,33,4.5f,paint);paint.setStyle(Paint.Style.STROKE);paint.setColor(Color.WHITE);paint.setStrokeWidth(1.4f);p.reset();p.moveTo(30.8f,33);p.lineTo(32.4f,34.5f);p.lineTo(35.4f,31.4f);canvas.drawPath(p,paint);}
                else{canvas.drawLine(14,14,34,34,paint);}
            }else{
                canvas.drawRoundRect(13,15,35,33,4,4,paint);canvas.drawArc(17,19,31,31,195,150,false,paint);
                canvas.drawLine(24,27,28,22,paint);canvas.drawLine(20,30,28,30,paint);
            }
            canvas.restore();
        }
        public void setAlpha(int a){paint.setAlpha(a);}public void setColorFilter(ColorFilter f){paint.setColorFilter(f);}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
