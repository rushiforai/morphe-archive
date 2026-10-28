package e.e.a;

import android.content.*;
import android.app.Activity;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.preference.*;
import android.view.*;
import android.widget.*;
import com.sauzask.nicoid.NicoidChormecastSenderService;
import java.util.*;
import org.json.*;

/** Reuse the sender session and fetched comments; never create another player or request. */
public final class CastControls218 {
    public static final String QUALITY="cast_fixed_quality";
    private static final String BUTTON="nicoid-cast-disconnect";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final WeakHashMap<Object,ArrayList<?>> COMMENTS=new WeakHashMap<Object,ArrayList<?>>();
    private static final WeakHashMap<Object,ArrayList<?>> SHOWN=new WeakHashMap<Object,ArrayList<?>>();
    private CastControls218() {}
    private static Object get(Object o,String n)throws Exception{return Playback214.get(o,n);}
    private static Object state(String name)throws Exception {return NicoidChormecastSenderService.class.getField(name).get(null);}
    public static boolean phone(Activity a){return a!=null&&!a.isFinishing()&&NicoidChormecastSenderService.D;}
    public static boolean current(Object fragment) {
        try{return fragment!=null&&Boolean.TRUE.equals(state("D"))&&Boolean.TRUE.equals(get(fragment,"x0"))&&state("I").equals(get(fragment,"b0"));}
        catch(Exception e){return false;}
    }
    public static void publish(final Object model,ArrayList<?> comments) {
        try {
            if(!Boolean.TRUE.equals(get(model,"t")))return;
            final ArrayList<?> copy=new ArrayList<Object>(comments);
            MAIN.post(new Runnable(){public void run(){
                COMMENTS.put(model,copy);
                try {
                    Object callback=NicoidChormecastSenderService.K;
                    if(callback!=null)showComments(get(callback,"a"));
                }catch(Exception e){android.util.Log.w("nicoid-cast","Cannot update Cast comment list",e);}
            }});
        }catch(Exception e){android.util.Log.w("nicoid-cast","Cannot publish Cast comments",e);}
    }
    private static ArrayList<?> comments(Object fragment)throws Exception {
        Object adapter=NicoidChormecastSenderService.E;
        if(adapter==null)return null;
        // The callback on the active sender model owns the service instance.
        for(Map.Entry<Object,ArrayList<?>> entry:COMMENTS.entrySet()) {
            Object model=entry.getKey();
            if(model==null)continue;
            Object callback=get(model,"k");
            Object service=callback==null?null:get(callback,"a");
            if(service instanceof NicoidChormecastSenderService&&get(service,"u")==model&&state("I").equals(get(service,"t")))return entry.getValue();
        }
        return (ArrayList<?>)adapter.getClass().getMethod("b").invoke(adapter);
    }
    private static void showComments(Object fragment)throws Exception {
        if(!current(fragment))return;
        ArrayList<?> list=comments(fragment);
        if(list==null||SHOWN.get(fragment)==list)return;
        fragment.getClass().getMethod("b",ArrayList.class).invoke(fragment,list);
        SHOWN.put(fragment,list);
    }
    public static void update(Object fragment) {
        try {
            View root=(View)get(fragment,"x1");if(root==null)return;
            ViewGroup bar=(ViewGroup)PortraitTimeline213.find(root,"topmenulay");if(bar==null)return;
            View button=root.findViewWithTag(BUTTON);
            boolean active=current(fragment);
            if(active&&button==null){
                final Context context=root.getContext();ImageButton image=new ImageButton(context);image.setTag(BUTTON);
                image.setContentDescription(PanelUi.tr(context,"Castの接続解除","Disconnect Cast","中斷 Cast 連線"));
                image.setBackgroundColor(Color.TRANSPARENT);image.setElevation(0);
                int padding=PanelUi.dp(context,8);image.setPadding(padding,padding,padding,padding);image.setMinimumWidth(0);image.setMinimumHeight(0);
                image.setImageDrawable(new Disconnect(UiDialogs.accent(context)));image.setScaleType(ImageView.ScaleType.FIT_CENTER);
                image.setOnClickListener(new View.OnClickListener(){public void onClick(View v){context.stopService(new Intent().setClassName(context,"com.sauzask.nicoid.NicoidChormecastSenderService"));}});
                int size=PanelUi.dp(context,40);bar.addView(image,new LinearLayout.LayoutParams(size,size));button=image;
            }
            if(button!=null)button.setVisibility(active?View.VISIBLE:View.GONE);
            showComments(fragment);
        }catch(Exception e){android.util.Log.w("nicoid-cast","Cannot update Cast controls",e);}
    }
    /** A small adapter lets both existing comment jump paths retain their timing and bounds checks. */
    public static Object player(Object fragment)throws Exception{return current(fragment)?new Clock(fragment):get(fragment,"a0");}
    public static final class Clock {
        private final Object fragment;
        public Clock(Object f){fragment=f;}
        public long getDuration()throws Exception{return current(fragment)?Math.max(0,((Number)state("N")).longValue()):0;}
        public long getCurrentPosition()throws Exception{return current(fragment)?Math.max(0,((Number)state("O")).longValue()):0;}
        public void seekTo(long position)throws Exception {
            if(!current(fragment))return;
            Context c=(Context)get(fragment,"A1");long duration=getDuration();
            int target=(int)Math.min(Integer.MAX_VALUE,Math.max(0,duration>0?Math.min(position,duration):position));
            Intent intent=new Intent().setClassName(c,"com.sauzask.nicoid.NicoidChormecastSenderService").putExtra("url",(String)get(fragment,"b0")).putExtra("type",3).putExtra("posi",target);
            v0.a(c,intent);
        }
    }
    private static int fixed(Object model) {
        try{if(!Boolean.TRUE.equals(get(model,"t")))return -1;
            Context c=(Context)get(model,"K");String value=PreferenceManager.getDefaultSharedPreferences(c).getString(QUALITY,"");
            if(value.equals("highest"))return Integer.MAX_VALUE;
            if(value.equals("720")||value.equals("480")||value.equals("360"))return Integer.parseInt(value);
        }catch(Exception e){android.util.Log.w("nicoid-cast","Cannot read Cast quality",e);}return -1;
    }
    public static String pickVideo(Object model,JSONArray videos,int tier) {
        int ceiling=fixed(model);return ceiling<0?Playback214.pickVideo(videos,tier):Playback214.choose(videos,ceiling);
    }
    public static JSONArray outputs(Object model,JSONObject media,String audio,String video)throws Exception {
        if(fixed(model)<0)return null;
        return new JSONArray().put(new JSONArray().put(video).put(audio));
    }
    public static void settings(PreferenceActivity a) {
        if(a.findPreference(QUALITY)!=null)return;
        Preference group=a.findPreference("google_cast");if(!(group instanceof PreferenceGroup))return;
        final ListPreference p=new ListPreference(a);p.setKey(QUALITY);
        p.setTitle(PanelUi.tr(a,"Castの画質固定","Fixed Cast quality","固定 Cast 畫質"));
        p.setEntries(new CharSequence[]{PanelUi.tr(a,"自動","Automatic","自動"),PanelUi.tr(a,"最高画質（固定）","Highest (fixed)","最高畫質（固定）"),"720p","480p","360p"});
        p.setEntryValues(new CharSequence[]{"","highest","720","480","360"});p.setDefaultValue("");
        p.setSummary(PanelUi.tr(a,"次のCast再生から反映。指定解像度以下で利用可能な最高画質に固定し、通信が遅い場合は画質を下げずにバッファリングします","Applies to the next Cast playback. Fixes the best available quality up to the selected resolution; slow connections buffer without lowering quality","下次 Cast 播放生效。固定為所選解析度以下可用的最高畫質，連線緩慢時緩衝而不降低畫質"));
        ((PreferenceGroup)group).addPreference(p);
    }
    static final class Disconnect extends Drawable {
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        Disconnect(int color){paint.setColor(color);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(1.8f);paint.setStrokeCap(Paint.Cap.ROUND);}
        public int getIntrinsicWidth(){return 24;}public int getIntrinsicHeight(){return 24;}
        public void draw(Canvas c){Rect b=getBounds();c.save();c.translate(b.left,b.top);c.scale(b.width()/24f,b.height()/24f);c.drawLine(3,3,21,21,paint);c.drawLine(8,5,21,5,paint);c.drawLine(21,5,21,17,paint);c.drawLine(21,17,18,17,paint);c.drawArc(2,10,14,22,270,90,false,paint);c.drawArc(2,14,10,22,270,90,false,paint);c.drawPoint(3,21,paint);c.restore();}
        public void setAlpha(int a){paint.setAlpha(a);}public void setColorFilter(ColorFilter f){paint.setColorFilter(f);}public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
