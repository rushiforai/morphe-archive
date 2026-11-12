package app.haiagaru.tests.toolbaricons;

import android.app.*;
import android.content.*;
import android.graphics.*;
import android.graphics.drawable.*;
import android.os.*;
import java.io.*;
import java.lang.reflect.*;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.*;

/** Real native toolbar renderer and framework ConstantState cloning, synthetic local images only. */
public final class ToolbarIconSizingInstrumentation extends Instrumentation {
    private Context app;private ClassLoader loader;private Class<?> icons,importer;private File file;private byte[] previous;private boolean isolated;
    private int checks;private String diagnostic="";
    private void ok(boolean value,String label){checks++;if(!value)throw new AssertionError(label+"; "+diagnostic);}
    private Method method(Class<?> c,String name,Class<?>...params)throws Exception{Method m=c.getDeclaredMethod(name,params);m.setAccessible(true);return m;}
    private Object call(Class<?> c,String name,Class<?>[] params,Object...args)throws Exception{return method(c,name,params).invoke(null,args);}
    private Drawable render()throws Exception{
        String v=app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName;
        int id=app.getResources().getIdentifier("haiagaru_edge_archive","drawable",app.getPackageName());Object item;
        Class<?> owner=loader.loadClass(v.contains("191")?"o.r8lambda98incQ33GAiiY2082BMi9yDa3l0":v.contains("226")?"o.PAGBannerAdLoadCallback":"o.zzcI");
        if(v.contains("191"))item=owner.getConstructor(int.class,int.class,int.class,int.class,boolean.class).newInstance(0x7e000001,id,0,0,true);
        else{Class<?> spec=loader.loadClass("jp.syoboi.a2chMate.feature.toolbar.ToolbarButtonSpec");Object data=spec.getConstructor(int.class,int.class,int.class,int.class,boolean.class).newInstance(0x7e000001,id,0,0,true);item=owner.getConstructor(spec).newInstance(data);}
        return (Drawable)method(owner,v.contains("191")?"XB_":v.contains("226")?"b":"e",Context.class,int.class).invoke(item,app,Color.YELLOW);
    }
    private void image(int width,int height)throws Exception{
        Bitmap bitmap=Bitmap.createBitmap(width,height,Bitmap.Config.ARGB_8888);bitmap.eraseColor(Color.WHITE);
        Canvas canvas=new Canvas(bitmap);Paint paint=new Paint();paint.setColor(Color.RED);canvas.drawRect(width*.25f,height*.25f,width*.75f,height*.75f,paint);
        byte[] raw;try(ByteArrayOutputStream out=new ByteArrayOutputStream()){bitmap.compress(Bitmap.CompressFormat.PNG,100,out);raw=out.toByteArray();}finally{bitmap.recycle();}
        call(importer,"importImage",new Class<?>[]{Context.class,int.class,InputStream.class},app,0,new ByteArrayInputStream(raw));
        BitmapFactory.Options bounds=new BitmapFactory.Options();bounds.inJustDecodeBounds=true;BitmapFactory.decodeFile(file.getPath(),bounds);ok(bounds.outWidth==256&&bounds.outHeight==256,"stored image normalized to 256 square");
        Drawable icon=render();int size=Math.round(24*app.getResources().getDisplayMetrics().density);
        Drawable.ConstantState state=icon.getConstantState();ok(state!=null,"native renderer returns clonable icon");
        Drawable copy=state.newDrawable(app.getResources()).mutate();
        diagnostic="input="+width+"x"+height+" expected="+size+" direct="+icon.getIntrinsicWidth()+"x"+icon.getIntrinsicHeight()+" cloned="+copy.getIntrinsicWidth()+"x"+copy.getIntrinsicHeight()+" class="+icon.getClass().getName();
        ok(icon.getIntrinsicWidth()==size&&icon.getIntrinsicHeight()==size,"direct native icon remains 24dp");
        ok(copy.getIntrinsicWidth()==size&&copy.getIntrinsicHeight()==size,"framework cloning retains 24dp instead of expanding toolbar");
        Drawable plain=state.newDrawable();ok(plain.getIntrinsicWidth()==size&&plain.getIntrinsicHeight()==size,"cloning without resources also retains size");
        Drawable themed=state.newDrawable(app.getResources(),app.getTheme());ok(themed.getIntrinsicWidth()==size&&themed.getIntrinsicHeight()==size,"theme-aware cloning retains size");
        android.content.res.Configuration config=new android.content.res.Configuration(app.getResources().getConfiguration());config.densityDpi=320;
        Context otherDensity=app.createConfigurationContext(config);Drawable densityCopy=state.newDrawable(otherDensity.getResources());int densitySize=Math.round(24*otherDensity.getResources().getDisplayMetrics().density);
        ok(densityCopy.getIntrinsicWidth()==densitySize&&densityCopy.getIntrinsicHeight()==densitySize,"clone follows destination display density without expanding");
        Bitmap output=Bitmap.createBitmap(size*3,size*2,Bitmap.Config.ARGB_8888);output.eraseColor(Color.BLUE);Canvas target=new Canvas(output);
        copy.setBounds(size,0,size*2,size);copy.draw(target);
        ok(output.getPixel(size+size/2,size/2)==Color.RED,"native theme tint does not replace custom colors");
        ok(output.getPixel(size-1,size/2)==Color.BLUE&&output.getPixel(size*2,size/2)==Color.BLUE&&output.getPixel(size+size/2,size+1)==Color.BLUE,"icon painting cannot cover adjacent toolbar area");
        if(width!=height)ok(output.getPixel(size+size/2,0)==Color.BLUE,"wide image keeps transparent vertical padding");output.recycle();
        Drawable again=render();ok(again.getIntrinsicWidth()==size,"cached render retains same bounds");
        if(icon instanceof BitmapDrawable&&again instanceof BitmapDrawable)ok(((BitmapDrawable)icon).getBitmap()==((BitmapDrawable)again).getBitmap(),"repeated rendering reuses scaled bitmap");
        android.widget.LinearLayout toolbar=new android.widget.LinearLayout(app);toolbar.setOrientation(android.widget.LinearLayout.HORIZONTAL);
        android.widget.ImageView button=new android.widget.ImageView(app);button.setImageDrawable(state.newDrawable(app.getResources()));toolbar.addView(button,new android.widget.LinearLayout.LayoutParams(-2,-1));
        android.widget.TextView next=new android.widget.TextView(app);next.setText("次の操作");next.setPadding(8,0,0,0);next.setBackgroundColor(Color.GREEN);toolbar.addView(next,new android.widget.LinearLayout.LayoutParams(-2,-1));
        int barWidth=Math.round(480*app.getResources().getDisplayMetrics().density),barHeight=Math.round(48*app.getResources().getDisplayMetrics().density);
        toolbar.measure(android.view.View.MeasureSpec.makeMeasureSpec(barWidth,1073741824),android.view.View.MeasureSpec.makeMeasureSpec(barHeight,1073741824));toolbar.layout(0,0,barWidth,barHeight);
        ok(button.getMeasuredWidth()==size&&next.getLeft()==size,"real ImageView cloning/layout leaves adjacent toolbar button in place");
        Bitmap bar=Bitmap.createBitmap(barWidth,barHeight,Bitmap.Config.ARGB_8888);toolbar.draw(new Canvas(bar));ok(bar.getPixel(size+1,barHeight/2)==Color.GREEN,"custom icon never paints over neighboring widget");bar.recycle();
    }
    private void test()throws Exception{
        app=getTargetContext();loader=app.getClassLoader();ok(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated package");
        icons=loader.loadClass("app.morphe.extension.chmate.ToolbarIcons");importer=loader.loadClass("app.morphe.extension.chmate.ToolbarIconsActivity");
        file=(File)call(icons,"file",new Class<?>[]{Context.class,int.class},app,0);previous=file.isFile()?Files.readAllBytes(file.toPath()):null;isolated=true;
        FutureTask<Void> work=new FutureTask<>(()->{image(2048,512);image(128,128);image(16,8);return null;});runOnMainSync(work);work.get(30,TimeUnit.SECONDS);
    }
    @Override public void onCreate(Bundle args){super.onCreate(args);start();}
    @Override public void onStart(){Bundle result=new Bundle();int status=Activity.RESULT_CANCELED;try{test();result.putString("result","PASS "+checks+" native toolbar icon sizing/ConstantState/clipping/color checks; public requests/posts=0");status=Activity.RESULT_OK;}catch(Throwable error){result.putInt("checksCompleted",checks);result.putString("diagnostic",diagnostic);result.putString("error",android.util.Log.getStackTraceString(error));}finally{try{if(isolated){if(previous!=null)Files.write(file.toPath(),previous);else file.delete();call(icons,"invalidate",new Class<?>[]{int.class},0);}}catch(Throwable error){status=Activity.RESULT_CANCELED;result.putString("cleanupError",error.toString());}}finish(status,result);}
}
