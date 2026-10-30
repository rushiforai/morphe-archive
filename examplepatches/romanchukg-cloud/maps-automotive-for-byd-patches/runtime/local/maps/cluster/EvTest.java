package local.maps.cluster;

import android.app.*;
import android.content.*;
import android.graphics.Color;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.lang.ref.WeakReference;
import java.util.*;

/** Session-only experiment with Maps' existing distance-based demo EV model. No vehicle IPC. */
public final class EvTest {
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static final List<WeakReference<Object>> sources=new ArrayList<>();
    private static final Map<Object,Object[]> saved=new IdentityHashMap<>();
    private static volatile boolean active;private static int percent=60,fullRangeKm=400;
    private static String result="Test is off. Real BYD data is not connected.";
    private static WeakReference<TextView> badge=new WeakReference<>(null);
    static boolean isActive(){return active;}
    static boolean available(){return !sources.isEmpty();}
    /** Called after the native hlc constructor; it does not enable the experiment. */
    public static void register(Object source){main.post(()->{sources.add(new WeakReference<>(source));android.util.Log.i("MapsEvTest","native demo EV source registered");if(active)apply();});}
    static void attach(Activity a){
        ViewGroup root=(ViewGroup)a.getWindow().getDecorView();TextView text=(TextView)root.findViewWithTag("local.ev.test.badge");
        if(text==null){text=new TextView(a);text.setTag("local.ev.test.badge");text.setTextColor(Color.BLACK);text.setBackgroundColor(0xffffd54f);text.setTextSize(14);text.setPadding(12,8,12,8);text.setOnClickListener(v->show(a));
            FrameLayout.LayoutParams lp=new FrameLayout.LayoutParams(-2,-2,Gravity.TOP|Gravity.RIGHT);lp.topMargin=Math.max(root.getRootWindowInsets()==null?0:root.getRootWindowInsets().getStableInsetTop(),Math.round(32*a.getResources().getDisplayMetrics().density));lp.rightMargin=Math.round(96*a.getResources().getDisplayMetrics().density);root.addView(text,lp);}
        badge=new WeakReference<>(text);refreshBadge();
    }
    private static void refreshBadge(){TextView b=badge.get();if(b!=null){b.setText("TEST EV · "+percent+"% · "+Math.round(fullRangeKm*percent/100f)+" km");b.setVisibility(active?View.VISIBLE:View.GONE);}}
    private static Field field(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f;}
    private static Object get(Object o,String name)throws Exception{return field(o,name).get(o);}
    private static Object call(Object o,String name,Class<?>[] types,Object... args)throws Exception{return o.getClass().getMethod(name,types).invoke(o,args);}
    private static void apply(){
        int done=0;String error=null;
        for(Iterator<WeakReference<Object>> it=sources.iterator();it.hasNext();){Object source=it.next().get();if(source==null){it.remove();continue;}
            try{synchronized(get(source,"b")){
                if(!saved.containsKey(source))saved.put(source,new Object[]{get(source,"c"),get(source,"e"),get(source,"f"),get(source,"g")});
                // c/e/g take precedence over distance-based f in the native publisher.
                for(String name:new String[]{"c","e","g"})field(source,name).set(source,null);
                call(source,"i",new Class<?>[]{float.class,float.class},(float)fullRangeKm,(float)percent);
                Object snapshot=call(source,"a",new Class<?>[0]);Object energy=get(snapshot,"c");
                int wh=(Integer)get(get(energy,"d"),"c"),capacity=(Integer)get(get(energy,"e"),"c");
                if(capacity!=100000||Math.abs(wh-percent*1000)>1)throw new IllegalStateException("native EV readback mismatch");
                done++;android.util.Log.i("MapsEvTest","synthetic native EV readback: batteryWh="+wh+" capacityWh="+capacity+" fullRangeKm="+fullRangeKm);
            }}catch(Exception e){error=e.getClass().getSimpleName();android.util.Log.w("MapsEvTest","native EV injection failed",e);}
        }
        result=done>0?"Maps' native EV source reports "+percent+"% and "+Math.round(fullRangeKm*percent/100f)+" km remaining. Synthetic distance-based model, virtual 100 kWh battery. Check Maps' route preview for its response to these test values.":"No EV data injected. "+(error==null?"Maps has not created its demo EV source.":"Native source error: "+error+".");
        if(done==0){active=false;restore();}refreshBadge();
    }
    private static void restore(){
        boolean ok=true;
        for(Map.Entry<Object,Object[]> entry:saved.entrySet())try{Object source=entry.getKey();synchronized(get(source,"b")){
            String[] names={"c","e","f","g"};for(int i=0;i<names.length;i++)field(source,names[i]).set(source,entry.getValue()[i]);call(source,"f",new Class<?>[0]);
        }}catch(Exception e){ok=false;android.util.Log.w("MapsEvTest","restore native EV source",e);}
        if(ok)saved.clear();else result="Could not restore the native EV source. Restart Maps to end this test.";
    }
    private static void stop(){active=false;restore();if(saved.isEmpty())result="Test is off. Original Maps EV source restored.";refreshBadge();}
    static void show(Activity activity){
        if(VehicleDataStore.enabled(activity)){Toast.makeText(activity,"Turn off BYD vehicle data before using synthetic EV data.",Toast.LENGTH_LONG).show();return;}
        Context c=new ContextThemeWrapper(activity,android.R.style.Theme_DeviceDefault_Dialog_Alert);
        LinearLayout panel=new LinearLayout(c);panel.setOrientation(LinearLayout.VERTICAL);panel.setPadding(32,16,32,16);
        TextView note=new TextView(c);note.setText("Synthetic data for testing Maps only. No readings or writes to the BYD vehicle. The test switches off when Maps restarts.");note.setTextSize(17);panel.addView(note);
        TextView status=new TextView(c);status.setText(result);status.setTextSize(16);status.setPadding(0,16,0,16);panel.addView(status);
        TextView soc=new TextView(c);soc.setText("Battery: "+percent+"%");panel.addView(soc);
        SeekBar level=new SeekBar(c);level.setContentDescription("Synthetic EV battery percent");level.setMax(100);level.setProgress(percent);panel.addView(level);
        level.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onProgressChanged(SeekBar s,int n,boolean user){if(user){percent=n;soc.setText("Battery: "+n+"%");}}public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){if(active){apply();status.setText(result);}}});
        TextView range=new TextView(c);range.setText("Range at 100%: "+fullRangeKm+" km");panel.addView(range);
        SeekBar distance=new SeekBar(c);distance.setContentDescription("Synthetic EV full range kilometres");distance.setMax(500);distance.setProgress(fullRangeKm-100);panel.addView(distance);
        distance.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){public void onProgressChanged(SeekBar s,int n,boolean user){if(user){fullRangeKm=100+n;range.setText("Range at 100%: "+fullRangeKm+" km");}}public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){if(active){apply();status.setText(result);}}});
        Switch enabled=new Switch(c);
        Button low=new Button(c);low.setText("Apply low battery: 10%, 40 km");low.setAllCaps(false);low.setOnClickListener(v->{percent=10;fullRangeKm=400;level.setProgress(percent);distance.setProgress(300);soc.setText("Battery: 10%");range.setText("Range at 100%: 400 km");if(enabled.isChecked()){active=true;apply();}else enabled.setChecked(true);status.setText(result);});panel.addView(low);
        enabled.setText("Feed synthetic EV data to Maps");enabled.setChecked(active);enabled.setOnCheckedChangeListener((v,on)->{if(on){active=true;apply();if(!active)enabled.setChecked(false);}else stop();status.setText(result);});panel.addView(enabled);
        ScrollView scroll=new ScrollView(c);scroll.addView(panel);new AlertDialog.Builder(c).setTitle("TEST EV — synthetic vehicle data").setView(scroll).setPositiveButton("Done",null).show();
    }
}
