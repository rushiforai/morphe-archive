package nl.johninnl.warningprobe;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.View;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Method;
import java.lang.reflect.Field;
import java.util.Locale;
import java.util.ArrayList;
import java.util.Collections;
import org.json.JSONArray;
import org.json.JSONObject;

/** Target-only component rendering; no provider, route, speaker or real report is created. */
public final class NativeWarningUiProbe extends Instrumentation {
    private Bundle arguments;
    @Override public void onCreate(Bundle args){super.onCreate(args);arguments=args==null?new Bundle():args;start();}
    @Override public void onStart(){
        Bundle output=new Bundle();
        try{
            Context target=getTargetContext();String pkg=target.getPackageName();
            String namespace=pkg.equals("app.vela")?"nl.johninnl.vela":pkg.contains("maps")?"org.ungoogled.ui":null;
            if(namespace==null)throw new IllegalArgumentException("Unexpected UI target");
            ClassLoader loader=target.getClassLoader();Class<?> widget=Class.forName(namespace+".CompactSpeedView",true,loader);
            Class<?> data=Class.forName(namespace+".TelemetryStore$View",true,loader);
            Method empty=data.getDeclaredMethod("empty",String.class);empty.setAccessible(true);
            Method bind=widget.getDeclaredMethod("bind",data,Float.class,Double.class,boolean.class,boolean.class,String.class);bind.setAccessible(true);
            JSONArray cases=new JSONArray();File folder=new File(target.getExternalFilesDir(null),"native-warning-ui");if(!folder.exists()&&!folder.mkdirs())throw new IllegalStateException("Output directory");
            ArrayList<String> profiles=new ArrayList<>();
            for(String lang:new String[]{"en","nl"})for(boolean dark:new boolean[]{false,true})for(float scale:new float[]{1f,1.5f})profiles.add(lang+"-"+(dark?"dark":"light")+"-"+scale);
            if(arguments.getBoolean("reverse",false)||"true".equals(arguments.getString("reverse")))Collections.reverse(profiles);
            for(String profile:profiles){
                if(arguments.containsKey("case")&&!profile.equals(arguments.getString("case")))continue;
                String[] values=profile.split("-");String lang=values[0];boolean dark=values[1].equals("dark");float scale=Float.parseFloat(values[2]);
                String name=lang+"-"+(dark?"dark":"light")+"-"+scale;
                Configuration config=new Configuration(target.getResources().getConfiguration());config.fontScale=scale;config.setLocale(Locale.forLanguageTag(lang));
                Context context=target.createConfigurationContext(config);
                final Throwable[] failure={null};final JSONObject record=new JSONObject();
                runOnMainSync(()->{try{
                    View view=(View)widget.getConstructor(Context.class).newInstance(context);
                    String text=lang.equals("nl")?"Flitsmeister\nSpookrijder\nHulpdienst achter u\nPersoon op de weg":"Flitsmeister\nWrong-way driver\nEmergency vehicle behind\nPerson on road";
                    bind.invoke(view,empty.invoke(null,"nl.flitsmeister"),Float.valueOf(0),Double.valueOf(100),false,dark,text);
                    int max=(int)(480*context.getResources().getDisplayMetrics().density);
                    view.measure(View.MeasureSpec.makeMeasureSpec(max,View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(max,View.MeasureSpec.AT_MOST));
                    view.layout(0,0,view.getMeasuredWidth(),view.getMeasuredHeight());
                    if(view.getWidth()<=0||view.getHeight()<=0)throw new IllegalStateException("Empty native component");
                    record.put("density",context.getResources().getDisplayMetrics().density).put("scaled_density",context.getResources().getDisplayMetrics().scaledDensity).put("requested_font_scale",scale);
                    JSONObject geometry=new JSONObject();for(String field:new String[]{"pairWidth","signSize","rowHeight","totalHeight","density"})try{Field value=widget.getDeclaredField(field);value.setAccessible(true);geometry.put(field,String.valueOf(value.get(view)));}catch(NoSuchFieldException absent){geometry.put(field,"absent");}
                    record.put("geometry",geometry);
                    Bitmap bitmap=Bitmap.createBitmap(view.getWidth(),view.getHeight(),Bitmap.Config.ARGB_8888);CountingCanvas canvas=new CountingCanvas(bitmap);view.draw(canvas);
                    File attached=new File(folder,name+"-attached.png");try(FileOutputStream stream=new FileOutputStream(attached)){bitmap.compress(Bitmap.CompressFormat.PNG,100,stream);}record.put("attached_png",attached.getAbsolutePath());
                    record.put("draw_circles",canvas.circles).put("draw_text",canvas.texts).put("canvas_clip",canvas.getClipBounds().flattenToString());
                    float density=context.getResources().getDisplayMetrics().density,pair=Float.parseFloat(geometry.getString("pairWidth")),size=Float.parseFloat(geometry.getString("signSize"));
                    float cx=2*density+Math.min(pair,view.getWidth()-4*density)-size/2,cy=2*density+size/2;
                    record.put("final_badge_center",canvas.pixel(cx,cy)).put("save_count_after_view",canvas.getSaveCount());
                    canvas.setBitmap(null);record.put("badge_center_after_detach",pixel(bitmap,cx,cy));
                    File png=new File(folder,name+".png");try(FileOutputStream stream=new FileOutputStream(png)){if(!bitmap.compress(Bitmap.CompressFormat.PNG,100,stream))throw new IllegalStateException("PNG failed");}
                    Bitmap plain=Bitmap.createBitmap(view.getWidth(),view.getHeight(),Bitmap.Config.ARGB_8888);Canvas direct=new Canvas(plain);view.draw(direct);direct.setBitmap(null);
                    record.put("plain_second_badge_center",pixel(plain,cx,cy));File control=new File(folder,name+"-plain.png");try(FileOutputStream stream=new FileOutputStream(control)){plain.compress(Bitmap.CompressFormat.PNG,100,stream);}record.put("plain_png",control.getAbsolutePath());
                    View anonymous=(View)widget.getConstructor(Context.class).newInstance(context);bind.invoke(anonymous,empty.invoke(null,"nl.flitsmeister"),Float.valueOf(0),Double.valueOf(100),false,dark,text);
                    anonymous.measure(View.MeasureSpec.makeMeasureSpec(max,View.MeasureSpec.AT_MOST),View.MeasureSpec.makeMeasureSpec(max,View.MeasureSpec.AT_MOST));anonymous.layout(0,0,anonymous.getMeasuredWidth(),anonymous.getMeasuredHeight());
                    Bitmap original=Bitmap.createBitmap(anonymous.getWidth(),anonymous.getHeight(),Bitmap.Config.ARGB_8888);anonymous.draw(new Canvas(original));File originalFile=new File(folder,name+"-anonymous.png");try(FileOutputStream stream=new FileOutputStream(originalFile)){original.compress(Bitmap.CompressFormat.PNG,100,stream);}record.put("anonymous_png",originalFile.getAbsolutePath()).put("anonymous_final_badge_center",pixel(original,cx,cy));
                    record.put("name",name).put("width",view.getWidth()).put("height",view.getHeight()).put("png",png.getAbsolutePath()).put("description",String.valueOf(view.getContentDescription()));
                    if(!String.valueOf(view.getContentDescription()).contains(lang.equals("nl")?"Spookrijder":"Wrong-way driver"))throw new IllegalStateException("Missing warning accessibility content");
                }catch(Throwable error){failure[0]=error;}});
                if(failure[0]!=null)throw new IllegalStateException(name,failure[0]);cases.put(record);
            }
            JSONObject report=new JSONObject().put("probe_completed",true).put("target_package",pkg).put("process_uid",android.os.Process.myUid()).put("target_uid",target.getApplicationInfo().uid).put("cases",cases).put("acceptance_scope","Actual target compact component rendering only; synthetic bound values, not integrated placement, car surface or playback");
            output.putString("warning_ui_result",report.toString());finish(Activity.RESULT_OK,output);
        }catch(Throwable error){output.putString("warning_ui_error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,output);}
    }
    private static String pixel(Bitmap bitmap,float x,float y){if(!Float.isFinite(x)||!Float.isFinite(y))return "nonfinite";int ix=Math.round(x),iy=Math.round(y);return ix<0||iy<0||ix>=bitmap.getWidth()||iy>=bitmap.getHeight()?"outside":String.format(Locale.ROOT,"%08x",bitmap.getPixel(ix,iy));}
    /** Diagnostic observer only. Every operation forwards to the real bitmap Canvas. */
    private static final class CountingCanvas extends Canvas {
        final Bitmap bitmap;final JSONArray circles=new JSONArray(),texts=new JSONArray();
        CountingCanvas(Bitmap bitmap){super(bitmap);this.bitmap=bitmap;}
        private JSONObject paint(Paint value)throws Exception{return new JSONObject().put("color",String.format(Locale.ROOT,"%08x",value.getColor())).put("alpha",value.getAlpha()).put("style",value.getStyle().toString()).put("stroke_width",String.valueOf(value.getStrokeWidth())).put("shader",value.getShader()==null?"null":value.getShader().getClass().getName()).put("color_filter",value.getColorFilter()==null?"null":value.getColorFilter().getClass().getName()).put("clip",getClipBounds().flattenToString());}
        private String pixel(float x,float y){return NativeWarningUiProbe.pixel(bitmap,x,y);}
        @Override public void drawCircle(float cx,float cy,float radius,Paint ink){
            JSONObject record=new JSONObject();try{record=paint(ink).put("cx",String.valueOf(cx)).put("cy",String.valueOf(cy)).put("radius",String.valueOf(radius)).put("center_before",pixel(cx,cy));}catch(Exception error){throw new IllegalStateException(error);}
            super.drawCircle(cx,cy,radius,ink);try{record.put("center_after",pixel(cx,cy));circles.put(record);}catch(Exception error){throw new IllegalStateException(error);}
        }
        @Override public void drawText(String text,float x,float y,Paint ink){
            try{texts.put(paint(ink).put("text",text).put("x",String.valueOf(x)).put("y",String.valueOf(y)));}catch(Exception error){throw new IllegalStateException(error);}
            super.drawText(text,x,y,ink);
        }
    }
}
