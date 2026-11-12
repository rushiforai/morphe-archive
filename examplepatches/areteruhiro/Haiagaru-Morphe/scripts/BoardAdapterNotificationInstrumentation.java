package app.haiagaru.tests.boards;

import android.app.*;
import android.content.*;
import android.database.DataSetObserver;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.FutureTask;

/** Exercises the real board adapter's synchronous observer contract without DB/network writes. */
public final class BoardAdapterNotificationInstrumentation extends Instrumentation {
 private int checks;
 private void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 private void test()throws Exception{
  Context context=getTargetContext();
  boolean old=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName.contains("191");
  Class<?> type=context.getClassLoader().loadClass(old?"o.m6dExternalSyntheticLambda0":"o.getNextStreamIdokhttp");
  Field source=type.getDeclaredField(old?"c":"b");source.setAccessible(true);
  for(int columns:new int[]{1,2,4}){
   FutureTask<Void> task=new FutureTask<>(()->{
    BaseAdapter adapter=(BaseAdapter)type.getConstructor(Context.class,int.class,boolean.class).newInstance(context,columns,false);
    final int[] observed={-1},notifications={0};
    adapter.registerDataSetObserver(new DataSetObserver(){@Override public void onChanged(){observed[0]=adapter.getCount();notifications[0]++;}});
    BaseAdapter rendering=new BaseAdapter(){
     public int getCount(){return adapter.getCount();}
     public Object getItem(int n){return adapter.getItem(n);}
     public long getItemId(int n){return n;}
     public View getView(int n,View recycled,ViewGroup parent){TextView view=recycled instanceof TextView?(TextView)recycled:new TextView(context);view.setText("board fixture "+n);view.setMinimumHeight(48);return view;}
    };
    adapter.registerDataSetObserver(new DataSetObserver(){@Override public void onChanged(){rendering.notifyDataSetChanged();}});
    ListView nativeList=new ListView(context);nativeList.setAdapter(adapter);
    ListView list=new ListView(context);list.setAdapter(rendering);
    int measure=View.MeasureSpec.makeMeasureSpec(600,View.MeasureSpec.EXACTLY);
    check(adapter.getCount()==0,"initial empty snapshot");
    int iteration=0;
    for(int count:new int[]{120,3,75,1,0,40,160,0,2}){
     ArrayList<Object> rows=new ArrayList<>();for(int n=0;n<count;n++)rows.add("board "+n);
     source.set(adapter,rows);adapter.notifyDataSetChanged();
     int expected=(count+columns-1)/columns;
     check(observed[0]==expected,"observer sees current count: columns="+columns+" expected="+expected+" observed="+observed[0]);
     check(adapter.getCount()==expected,"subsequent count stays consistent");
     check(list.getCount()==expected,"ListView cached count matches adapter");
     check(nativeList.getCount()==expected,"direct native ListView cached count matches adapter");
     list.forceLayout();list.measure(measure,measure);list.layout(0,0,600,600);
     if(expected>0){list.setSelection(expected-1);list.smoothScrollBy(240,1);}
     list.forceLayout();list.measure(measure,measure);list.layout(0,0,600,600);
     check(adapter.getCount()==expected,"layout/scroll preserves count");iteration++;
    }
    check(notifications[0]==iteration,"one notification per update");
    nativeList.setAdapter(null);list.setAdapter(null);return null;
   });runOnMainSync(task);task.get();
  }
 }
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();int code=Activity.RESULT_CANCELED;try{test();result.putString("result","PASS "+checks+" native observer/count/ListView layout checks; DB/network writes=0");code=Activity.RESULT_OK;}catch(Throwable error){result.putString("error",android.util.Log.getStackTraceString(error));}finish(code,result);}
}
