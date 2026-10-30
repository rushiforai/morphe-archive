package local.maps.cluster;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/** 3D car in navigation through Maps' own Navatars feature, from a model bundled in the patch only.
 * At startup the model, its textures and manifest_1.json go to app_customchevron and Maps' own
 * custom_chevron_* settings select it; the hooks in hpq.aa, mug.c, mug.e and uxp.j call back here.
 * Bundled models are listed in navatars/models.json (id, label, body paint cells of the 16x16
 * palette texture); the one chosen in the menu becomes model.fbx, and a chosen colour repaints its
 * body cells (scaled by each cell's brightness, so two-tone paint keeps its shading).
 * The manifest uses modelBasis Z_UP with the transform "rotX 90 rotY -90" (Maps builds
 * position·Rx·Ry(rotY−bearing)·Rz·model; the FBX loader returns Blender's Z-up vertices).
 * Never throws. */
public final class Navatars {
    static final String TAG="MapsNavatars";
    static final String KEY="navatars_3d_car";
    static final String MODEL_KEY="navatars_model";
    static final String COLOUR_KEY="navatars_colour";
    static final String MODEL="suv";
    static final String[] COLOUR_NAMES={"Original","Silver","White","Black","Grey","Blue","Red","Green"};
    static final int[] COLOURS={0,0x9da2a8,0xe6e7e8,0x232427,0x5f646b,0x1e4f91,0xa01c22,0x2e6048};
    private static final int GRID=16,CELL=8;
    private static volatile boolean enabled;
    private static boolean loggedEnabled;
    private static volatile String lastAnimation;

    static boolean enabled(SharedPreferences prefs){return prefs.getBoolean(KEY,true);}

    /** PatchBootstrap.attach: before Maps reads its custom chevron settings. */
    public static void installEarly(Context context){
        try{
            String process=Application.getProcessName();
            if(process!=null&&!process.equals(context.getPackageName()))return;
            SharedPreferences own=context.getSharedPreferences("local_cluster_settings",Context.MODE_PRIVATE);
            enabled=enabled(own);
            if(!enabled){android.util.Log.i(TAG,"3D car off");return;}
            Model model=selected(models(context),own);int colour=colour(own);
            File dir=context.getDir("customchevron",Context.MODE_PRIVATE);
            int updated=write(asset(context,"navatars/manifest_1.json"),new File(dir,"manifest_1.json"));
            updated+=write(asset(context,"navatars/"+model.id+".fbx"),new File(dir,"model.fbx"));
            byte[] texture=texture(asset(context,"navatars/"+model.id+".png"),model.paint,colour);
            updated+=write(texture,new File(dir,"texture.png"));
            updated+=write(texture,new File(dir,"texture_dark.png"));
            SharedPreferences maps=context.getSharedPreferences("settings_preference",Context.MODE_PRIVATE);
            SharedPreferences.Editor edit=maps.edit();boolean changed=false;
            if(!MODEL.equals(maps.getString("custom_chevron_model_name",null))){edit.putString("custom_chevron_model_name",MODEL);changed=true;}
            if(maps.getInt("custom_chevron_model_color_id",0)!=1){edit.putInt("custom_chevron_model_color_id",1);changed=true;}
            if(maps.getInt("custom_chevron_opt_in",0)!=1){edit.putInt("custom_chevron_opt_in",1);changed=true;}
            if(changed)edit.commit();
            android.util.Log.i(TAG,"3D car ready: "+model.id+", "+COLOUR_NAMES[colour]+"; "+updated+" file(s) updated, settings "+(changed?"set":"unchanged"));
        }catch(Throwable e){
            enabled=false;
            android.util.Log.w(TAG,"3D car setup failed: "+e.getClass().getSimpleName()+": "+e.getMessage());
        }
    }
    /** hpq.aa: the server switch for the NavatarDisplayer. */
    public static boolean enabled(){
        if(!loggedEnabled){loggedEnabled=true;android.util.Log.i(TAG,"custom chevron "+(enabled?"on":"off"));}
        return enabled;
    }
    /** mug.c: keep the bundled files instead of deleting and downloading them. */
    public static void keepLocalModel(Object model){
        android.util.Log.i(TAG,"model selected; using local files, no download");
    }
    /** mug.e: read app_customchevron/manifest_N.json through mug.q(N); no server manifest. */
    public static void loadLocalManifest(Object manager,int eventId){
        try{
            Method q=manager.getClass().getDeclaredMethod("q",int.class);
            q.setAccessible(true);
            android.util.Log.i(TAG,"local manifest "+eventId+": "+q.invoke(manager,eventId));
        }catch(Throwable e){
            Throwable cause=e.getCause()!=null?e.getCause():e;
            android.util.Log.w(TAG,"local manifest "+eventId+" failed: "+cause.getClass().getSimpleName()+": "+cause.getMessage());
        }
    }
    /** uxp.j: the animation the FBX model plays (idle, drive, turnleft, turnright, ...); logged on change. */
    public static void animation(String name){
        if(name==null||name.equals(lastAnimation))return;
        lastAnimation=name;
        android.util.Log.i(TAG,"animation "+name);
    }
    static final class Model {
        final String id,label;final int[] paint;
        Model(String id,String label,int[] paint){this.id=id;this.label=label;this.paint=paint;}
    }
    /** navatars/models.json from the APK assets (written by the resource patch); the first is the default. */
    static List<Model> models(Context context){
        List<Model> out=new ArrayList<>();
        try{
            JSONArray list=new JSONObject(new String(asset(context,"navatars/models.json"),"UTF-8")).getJSONArray("models");
            for(int i=0;i<list.length();i++){
                JSONObject m=list.getJSONObject(i);JSONArray cells=m.optJSONArray("paint");
                int[] paint=new int[cells==null?0:cells.length()];for(int k=0;k<paint.length;k++)paint[k]=cells.getInt(k);
                out.add(new Model(m.getString("id"),m.optString("label",m.getString("id")),paint));
            }
        }catch(Exception e){android.util.Log.w(TAG,"models.json: "+e.getClass().getSimpleName()+": "+e.getMessage());}
        return out;
    }
    static Model selected(List<Model> models,SharedPreferences prefs){
        String id=prefs.getString(MODEL_KEY,null);
        for(Model m:models)if(m.id.equals(id))return m;
        if(models.isEmpty())throw new IllegalStateException("no bundled 3D car");
        return models.get(0);
    }
    static int colour(SharedPreferences prefs){int c=prefs.getInt(COLOUR_KEY,0);return c>=0&&c<COLOURS.length?c:0;}
    /** Menu summary: "BYD Tang 2024 · Silver", or "Off". */
    static String summary(Context context,SharedPreferences prefs){
        if(!enabled(prefs))return "Off";
        List<Model> all=models(context);if(all.isEmpty())return "On";
        Model m=selected(all,prefs);int c=colour(prefs);
        return m.label+(m.paint.length>0&&c!=0?" · "+COLOUR_NAMES[c]:"");
    }
    /** The palette texture, with the body cells repainted in colour index c (0 keeps the model's own). */
    static byte[] texture(byte[] png,int[] paint,int c){
        if(c==0||paint.length==0)return png;
        BitmapFactory.Options options=new BitmapFactory.Options();options.inMutable=true;options.inScaled=false;
        Bitmap bitmap=BitmapFactory.decodeByteArray(png,0,png.length,options);
        if(bitmap==null||bitmap.getWidth()<GRID*CELL||bitmap.getHeight()<GRID*CELL)return png;
        double brightest=0;double[] light=new double[paint.length];
        for(int i=0;i<paint.length;i++){
            int p=bitmap.getPixel(paint[i]%GRID*CELL+CELL/2,paint[i]/GRID*CELL+CELL/2);
            light[i]=0.2126*(p>>16&255)+0.7152*(p>>8&255)+0.0722*(p&255);brightest=Math.max(brightest,light[i]);
        }
        int target=COLOURS[c];int[] fill=new int[CELL*CELL];
        for(int i=0;i<paint.length;i++){
            double f=brightest>0?light[i]/brightest:1;
            int r=(int)Math.round((target>>16&255)*f),g=(int)Math.round((target>>8&255)*f),b=(int)Math.round((target&255)*f);
            Arrays.fill(fill,0xff000000|r<<16|g<<8|b);
            bitmap.setPixels(fill,0,CELL,paint[i]%GRID*CELL,paint[i]/GRID*CELL,CELL,CELL);
        }
        ByteArrayOutputStream out=new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG,100,out);bitmap.recycle();
        return out.toByteArray();
    }
    private static byte[] asset(Context context,String name) throws IOException {
        try(InputStream in=context.getAssets().open(name)){return read(in);}
    }
    /** Writes data to target (app_customchevron) unless it already holds exactly these bytes. */
    private static int write(byte[] data,File target) throws IOException {
        if(target.length()==data.length){
            try(InputStream in=new FileInputStream(target)){if(Arrays.equals(read(in),data))return 0;}
        }
        File tmp=new File(target.getPath()+".tmp");
        try(FileOutputStream out=new FileOutputStream(tmp)){out.write(data);}
        if(!tmp.renameTo(target))throw new IOException("rename "+target.getName());
        return 1;
    }
    private static byte[] read(InputStream in) throws IOException {
        ByteArrayOutputStream out=new ByteArrayOutputStream();byte[] buffer=new byte[16384];
        for(int n;(n=in.read(buffer))>0;)out.write(buffer,0,n);
        return out.toByteArray();
    }
    private Navatars(){}
}
