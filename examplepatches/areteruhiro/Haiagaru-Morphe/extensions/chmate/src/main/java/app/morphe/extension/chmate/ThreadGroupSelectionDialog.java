package app.morphe.extension.chmate;

import android.app.*;
import android.view.*;
import android.widget.*;
import android.text.*;
import java.util.*;

/** Selection is keyed by the original tab index, independent of search results. */
public final class ThreadGroupSelectionDialog {
    public interface Result { void accept(List<String> keys); }
    static HaiagaruDialog show(Activity activity,List<NativeThreadTabBridge.Tab> tabs,String selected,Result result){
        LinearLayout root=new LinearLayout(activity);root.setOrientation(1);
        root.setTag("haiagaru.thread-group-selection");
        int pad=Math.round(16*activity.getResources().getDisplayMetrics().density);
        root.setPadding(pad,0,pad,0);
        EditText search=new EditText(activity);search.setSingleLine();search.setHint("スレ名で検索");root.addView(search);
        LinearLayout actions=new LinearLayout(activity);
        Button all=new Button(activity);all.setText("表示中をすべて選択");actions.addView(all,new LinearLayout.LayoutParams(0,-2,1));
        Button none=new Button(activity);none.setText("表示中をすべて解除");actions.addView(none,new LinearLayout.LayoutParams(0,-2,1));root.addView(actions);
        TextView info=new TextView(activity);root.addView(info);
        TextView help=new TextView(activity);help.setText("長押しして上下にスライドすると、通過したスレをまとめて選択／解除できます。検索で隠れたスレの選択は保持します。");root.addView(help);
        ListView list=new ListView(activity);list.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
        list.setClipChildren(true);list.setClipToPadding(true);
        // Keep the actual ListView touch surface for long-press sweep selection.
        // The shared dialog supplies the same heading, colors and actions as other settings.
        root.addView(new NativeSurfaceSlot(list),new LinearLayout.LayoutParams(-1,0,1));
        boolean[] checked=new boolean[tabs.size()];for(int i=0;i<tabs.size();i++)checked[i]=tabs.get(i).key.equals(selected);
        ArrayList<Integer> visible=new ArrayList<>();ArrayList<String> labels=new ArrayList<>();
        ArrayAdapter<String> adapter=new ArrayAdapter<String>(activity,android.R.layout.simple_list_item_multiple_choice,labels){
            @Override public View getView(int position,View convertView,ViewGroup parent){
                CheckedTextView row=(CheckedTextView)super.getView(position,convertView,parent);
                row.setSingleLine(false);
                row.setMaxLines(Integer.MAX_VALUE);
                row.setEllipsize(null);
                row.setHorizontallyScrolling(false);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setMinHeight(Math.round(48*activity.getResources().getDisplayMetrics().density));
                row.setPaddingRelative(row.getPaddingStart(),pad/2,row.getPaddingEnd(),pad/2);
                row.setLayoutParams(new android.widget.AbsListView.LayoutParams(-1,-2));
                return row;
            }
        };list.setAdapter(adapter);
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(activity).setTitle("グループ化するスレを選択").setView(root)
            .setPositiveButton("追加先を選ぶ",(d,w)->{List<String> keys=new ArrayList<>();for(int i=0;i<checked.length;i++)if(checked[i])keys.add(tabs.get(i).key);result.accept(keys);})
            .setNegativeButton("キャンセル",null).create();
        Runnable count=()->{int n=0;for(boolean value:checked)if(value)n++;info.setText("表示 "+visible.size()+"件／全 "+tabs.size()+"件・選択 "+n+"件");try{dialog.getButton(-1).setEnabled(n>0);}catch(IllegalArgumentException ignored){}};
        Runnable filter=()->{String q=search.getText().toString().trim().toLowerCase(Locale.ROOT);visible.clear();labels.clear();for(int i=0;i<tabs.size();i++)if(tabs.get(i).title.toLowerCase(Locale.ROOT).contains(q)){visible.add(i);labels.add(tabs.get(i).title);}adapter.notifyDataSetChanged();list.clearChoices();for(int i=0;i<visible.size();i++)list.setItemChecked(i,checked[visible.get(i)]);count.run();};
        search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int f){}public void onTextChanged(CharSequence s,int a,int b,int c){filter.run();}public void afterTextChanged(Editable e){}});
        all.setOnClickListener(v->{for(int i=0;i<visible.size();i++){checked[visible.get(i)]=true;list.setItemChecked(i,true);}count.run();});
        none.setOnClickListener(v->{for(int i=0;i<visible.size();i++){checked[visible.get(i)]=false;list.setItemChecked(i,false);}count.run();});
        list.setOnItemClickListener((p,v,position,id)->{checked[visible.get(position)]=list.isItemChecked(position);count.run();});
        class Sweep implements View.OnTouchListener {
            boolean dragging,value;int previous=-1;float y;
            final Runnable scroll=new Runnable(){public void run(){if(!dragging)return;int edge=pad*2,delta=y<edge?-pad:y>list.getHeight()-edge?pad:0;if(delta!=0){list.scrollListBy(delta);paint(list.pointToPosition(list.getWidth()/2,(int)y));}list.postDelayed(this,40);}};
            void paint(int position){if(position<0||position>=visible.size())return;int start=previous<0?position:Math.min(previous,position),end=previous<0?position:Math.max(previous,position);for(int i=start;i<=end;i++){checked[visible.get(i)]=value;list.setItemChecked(i,value);}previous=position;count.run();}
            final GestureDetector detector=new GestureDetector(activity,new GestureDetector.SimpleOnGestureListener(){public void onLongPress(MotionEvent event){int position=list.pointToPosition((int)event.getX(),(int)event.getY());if(position<0)return;dragging=true;previous=-1;value=!checked[visible.get(position)];y=event.getY();MotionEvent cancel=MotionEvent.obtain(event);cancel.setAction(MotionEvent.ACTION_CANCEL);list.onTouchEvent(cancel);cancel.recycle();list.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);list.getParent().requestDisallowInterceptTouchEvent(true);paint(position);list.post(scroll);}});
            public boolean onTouch(View v,MotionEvent event){detector.onTouchEvent(event);if(!dragging)return false;y=Math.max(0,Math.min(list.getHeight()-1,event.getY()));if(event.getActionMasked()==MotionEvent.ACTION_MOVE)paint(list.pointToPosition((int)event.getX(),(int)y));if(event.getActionMasked()==MotionEvent.ACTION_UP||event.getActionMasked()==MotionEvent.ACTION_CANCEL){dragging=false;previous=-1;list.removeCallbacks(scroll);list.getParent().requestDisallowInterceptTouchEvent(false);}return true;}
        }
        Sweep sweep=new Sweep();list.setOnTouchListener(sweep);
        dialog.setOnDismissListener(d->{sweep.dragging=false;list.removeCallbacks(sweep.scroll);});
        dialog.setOnShowListener(d->{root.setLayoutParams(new ViewGroup.LayoutParams(-1,Math.round(activity.getResources().getDisplayMetrics().heightPixels*.60f)));filter.run();dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);});
        filter.run();dialog.show();return dialog;
    }
}
