package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.Dialog;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.TextView;
import java.util.ArrayList;

/** Synthetic ListView rows; no network, posts or native read-state writes. */
public final class PositionTest {
    public static int checks;
    public static String result="pending";
    static final Handler MAIN=new Handler(Looper.getMainLooper());

    public static void start(Activity activity){
        checks=0;result="pending";
        Dialog dialog=new Dialog(activity);ListView list=new ListView(activity);ArrayList<String> rows=new ArrayList<>();
        for(int i=0;i<40;i++)rows.add("レス "+i+"\n本文");
        list.setAdapter(adapter(activity,rows));dialog.setContentView(list);dialog.show();dialog.getWindow().setLayout(700,850);layoutAndDraw(list,700,850);
        MAIN.postDelayed(()->{
            try{
                check(list.getChildCount()>2,"synthetic response rows laid out");
                int position=list.getFirstVisiblePosition(),top=list.getChildAt(0).getTop(),targetPosition=position+1;
                TextView firstTarget=(TextView)list.getChildAt(1);
                list.requestLayout();check(list.isLayoutRequested(),"parent layout request pending before capture");
                beforeChange(firstTarget);rows.set(targetPosition,"伸長した投稿\n"+"カード本文\n".repeat(8));firstTarget.setText(rows.get(targetPosition));layoutAndDraw(list,700,850);
                MAIN.postDelayed(()->{
                    try{
                        check(list.getFirstVisiblePosition()==position,"layout-requested capture retains first row");
                        check(list.getChildAt(0).getTop()==top,"layout-requested capture retains pixel offset");
                        TextView appendedTarget=(TextView)list.getChildAt(targetPosition-position);
                        int retainedPosition=list.getFirstVisiblePosition(),retainedTop=list.getChildAt(0).getTop();
                        beforeChange(appendedTarget);rows.set(targetPosition,"更新時に伸長した投稿\n"+"画像\n".repeat(8));appendedTarget.setText(rows.get(targetPosition));
                        rows.add("更新で追加されたレス\n本文");((BaseAdapter)list.getAdapter()).notifyDataSetChanged();layoutAndDraw(list,700,850);
                        MAIN.postDelayed(()->{
                            try{
                                check(list.getFirstVisiblePosition()==retainedPosition,"anchor survives appended response count");
                                check(list.getChildAt(0).getTop()==retainedTop,"pixel offset survives appended response count");
                                TextView touchTarget=(TextView)list.getChildAt(1);beforeChange(touchTarget);
                                android.view.MotionEvent down=android.view.MotionEvent.obtain(0,0,android.view.MotionEvent.ACTION_DOWN,1,1,0);
                                onTouch(touchTarget,down);down.recycle();int before=list.getChildAt(0).getTop();list.scrollListBy(24);layoutAndDraw(list,700,850);
                                check(!pending(list),"touch cancels automated correction");
                                check(list.getChildAt(0).getTop()!=before,"user scroll wins over pending correction");
                                dialog.dismiss();verifyReadMarker(activity);
                            }catch(Throwable error){fail(dialog,error);}
                        },250);
                    }catch(Throwable error){fail(dialog,error);}
                },250);
            }catch(Throwable error){fail(dialog,error);}
        },250);
    }

    private static BaseAdapter adapter(Activity activity,ArrayList<String> rows){
        return new BaseAdapter(){
            @Override public int getCount(){return rows.size();}
            @Override public Object getItem(int p){return rows.get(p);}
            @Override public long getItemId(int p){return p;}
            @Override public View getView(int p,View old,ViewGroup parent){TextView text=old instanceof TextView?(TextView)old:new TextView(activity);text.setTextSize(18);text.setPadding(10,10,10,10);text.setText(rows.get(p));return text;}
        };
    }

    private static void verifyReadMarker(Activity activity){
        Dialog dialog=new Dialog(activity);ListView list=new ListView(activity);ArrayList<String> rows=new ArrayList<>();
        rows.add("既読レス");rows.add("ここまで読んだ");rows.add("未読レス");list.setTag("haiagaru.read-marker-fixture");list.setAdapter(adapter(activity,rows));
        dialog.setContentView(list);dialog.show();dialog.getWindow().setLayout(700,500);layoutAndDraw(list,700,500);
        MAIN.postDelayed(()->{
            try{
                Class<?> reading=Class.forName("app.morphe.extension.chmate.ReadingPosition",true,activity.getClassLoader());
                Class<?> sessionType=null;java.lang.reflect.Constructor<?> constructor=null;
                for(Class<?> type:reading.getDeclaredClasses())for(java.lang.reflect.Constructor<?> candidate:type.getDeclaredConstructors()){
                    Class<?>[] p=candidate.getParameterTypes();if(p.length==3&&p[0]==Object.class&&Activity.class.isAssignableFrom(p[1])&&View.class.isAssignableFrom(p[2])){sessionType=type;constructor=candidate;break;}
                }
                if(sessionType==null)throw new AssertionError("reading-position session missing");constructor.setAccessible(true);
                Object session=constructor.newInstance(new Object(),activity,list);
                java.lang.reflect.Method preDraw=null;for(java.lang.reflect.Method m:sessionType.getDeclaredMethods())if(m.getName().equals("onPreDraw")&&m.getParameterTypes().length==0)preDraw=m;
                if(preDraw==null)throw new AssertionError("pre-draw callback missing");preDraw.setAccessible(true);
                boolean draws=(Boolean)preDraw.invoke(session);check(!draws,"visible read boundary suppresses displaced frame");
                check(list.isLayoutRequested(),"native list schedules the read-boundary alignment");
                result="PASS "+checks+" synthetic resize and unread-boundary checks";
            }catch(Throwable error){fail(dialog,error);return;}finally{if(dialog.isShowing())dialog.dismiss();}
            dialog.dismiss();
        },250);
    }

    private static void beforeChange(View body)throws Exception{
        Class<?> type=Class.forName("app.morphe.extension.chmate.XPostPreviewPosition",true,body.getContext().getClassLoader());
        java.lang.reflect.Method method=type.getDeclaredMethod("beforeChange",View.class);method.setAccessible(true);method.invoke(null,body);
    }
    private static void onTouch(View body,android.view.MotionEvent event)throws Exception{
        Class<?> type=Class.forName("app.morphe.extension.chmate.XPostPreviewPosition",true,body.getContext().getClassLoader());
        java.lang.reflect.Method method=type.getDeclaredMethod("onTouch",View.class,android.view.MotionEvent.class);method.setAccessible(true);method.invoke(null,body,event);
    }
    private static boolean pending(View list)throws Exception{
        Class<?> type=Class.forName("app.morphe.extension.chmate.XPostPreviewPosition",true,list.getContext().getClassLoader());
        java.lang.reflect.Method method=type.getDeclaredMethod("pending",View.class);method.setAccessible(true);return (Boolean)method.invoke(null,list);
    }
    private static void layoutAndDraw(ListView list,int width,int height){
        int w=View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),h=View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY);
        for(int i=0;i<8;i++){list.measure(w,h);list.layout(0,0,width,height);if(list.getViewTreeObserver().dispatchOnPreDraw())break;}
    }
    private static void fail(Dialog dialog,Throwable error){result="FAIL "+android.util.Log.getStackTraceString(error);if(dialog.isShowing())dialog.dismiss();}
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
}
