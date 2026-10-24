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

/** Actual ListView layout/resize regression, synthetic rows, no network or native read-state writes. */
public final class PositionTest {
    public static int checks;
    public static String result = "pending";
    static final Handler MAIN = new Handler(Looper.getMainLooper());
    public static void start(Activity activity) {
        checks=0;result="pending";
        Dialog dialog = new Dialog(activity);
        ListView list = new ListView(activity);
        String[] rows = new String[40];
        for (int i=0;i<rows.length;i++) rows[i]="レス "+i+"\n本文";
        list.setAdapter(new BaseAdapter() {
            @Override public int getCount(){return rows.length;}
            @Override public Object getItem(int p){return rows[p];}
            @Override public long getItemId(int p){return p;}
            @Override public View getView(int p,View old,ViewGroup parent){
                TextView text=old instanceof TextView?(TextView)old:new TextView(activity);
                text.setTextSize(18);text.setPadding(10,10,10,10);text.setText(rows[p]);return text;
            }
        });
        dialog.setContentView(list);dialog.show();dialog.getWindow().setLayout(700,850);
        MAIN.postDelayed(()->{
            list.setSelection(rows.length-1);
            MAIN.postDelayed(()->{
                try {
                    check(!list.canScrollVertically(1),"initial bottom");
                    TextView last=(TextView)list.getChildAt(list.getChildCount()-1);
                    XPostPreviewPosition.beforeChange(last);
                    rows[39]="最下部の投稿\n"+"Xの本文\n".repeat(40);
                    last.setText(rows[39]);
                    MAIN.postDelayed(()->{
                        try {
                            check(!list.canScrollVertically(1),"bottom retained after preview expansion");
                            list.setSelectionFromTop(20,-10);
                            MAIN.postDelayed(()->{
                                try {
                                    int position=list.getFirstVisiblePosition(),top=list.getChildAt(0).getTop();
                                    TextView target=(TextView)list.getChildAt(1);
                                    XPostPreviewPosition.beforeChange(target);
                                    rows[position+1]="中間の投稿\n"+"Xの本文\n".repeat(10);
                                    target.setText(rows[position+1]);
                                    MAIN.postDelayed(()->{
                                        try {
                                            check(list.getFirstVisiblePosition()==position,"middle anchor position retained");
                                            check(list.getChildAt(0).getTop()==top,"middle anchor pixel offset retained");
                                            XPostPreviewPosition.beforeChange(target);
                                            android.view.MotionEvent down=android.view.MotionEvent.obtain(0,0,android.view.MotionEvent.ACTION_DOWN,1,1,0);
                                            XPostPreviewPosition.onTouch(target,down);down.recycle();
                                            list.setSelectionFromTop(10,-4);
                                            MAIN.postDelayed(()->{
                                                try{check(list.getFirstVisiblePosition()==10,"user/native navigation supersedes a pending preview anchor");
                                                    check(list.getChildAt(0).getTop()==-4,"user/native pixel offset is not corrected backwards");
                                                    result="PASS "+checks+" actual ListView resize checks";
                                                }catch(Throwable error){result="FAIL "+error;}finally{dialog.dismiss();}
                                            },250);
                                        }catch(Throwable error){result="FAIL "+error;}
                                        finally{if(result.startsWith("FAIL"))dialog.dismiss();}
                                    },250);
                                }catch(Throwable error){result="FAIL "+error;dialog.dismiss();}
                            },250);
                        }catch(Throwable error){result="FAIL "+error;dialog.dismiss();}
                    },250);
                }catch(Throwable error){result="FAIL "+error;dialog.dismiss();}
            },250);
        },250);
    }
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
}
