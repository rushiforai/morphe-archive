package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.text.*;
import android.view.*;
import android.widget.*;
import java.util.*;

/** Stable URL-based selection, preserved while the candidate list is filtered. */
final class GlobalTitleSearchBoards {
    static void show(Activity activity){
        new Thread(()->{
            try{ArrayList<GlobalTitleSearch.Board> boards=GlobalTitleSearch.candidates(activity);activity.runOnUiThread(()->{if(!activity.isFinishing()&&!activity.isDestroyed())show(activity,boards);});}
            catch(Exception error){activity.runOnUiThread(()->{if(!activity.isFinishing())Toast.makeText(activity,"登録済みの外部板を取得できませんでした",Toast.LENGTH_LONG).show();});}
        },"Haiagaru-search-board-list").start();
    }
    static void show(Activity activity,ArrayList<GlobalTitleSearch.Board> boards){
        SharedPreferences prefs=activity.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);
        Set<String> saved=GlobalTitleSearch.selected(prefs),selected=new LinkedHashSet<>();
        if(saved==null)for(GlobalTitleSearch.Board board:boards)selected.add(board.url);else selected.addAll(saved);
        LinearLayout root=new LinearLayout(activity);root.setOrientation(LinearLayout.VERTICAL);
        EditText search=new EditText(activity);search.setSingleLine(true);search.setHint("板名・URLで検索");root.addView(search);
        TextView count=new TextView(activity);root.addView(count);
        LinearLayout actions=new LinearLayout(activity);Button all=new Button(activity),none=new Button(activity);all.setText("表示中をすべて選択");none.setText("表示中を解除");actions.addView(all,new LinearLayout.LayoutParams(0,-2,1));actions.addView(none,new LinearLayout.LayoutParams(0,-2,1));root.addView(actions);
        ListView list=new ListView(activity);list.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);root.addView(list,new LinearLayout.LayoutParams(-1,Math.round(300*activity.getResources().getDisplayMetrics().density)));
        ArrayList<GlobalTitleSearch.Board> visible=new ArrayList<>();ArrayList<String> labels=new ArrayList<>();
        ArrayAdapter<String> adapter=new ArrayAdapter<>(activity,android.R.layout.simple_list_item_multiple_choice,labels){
            @Override public View getView(int position,View old,ViewGroup parent){View view=super.getView(position,old,parent);if(view instanceof TextView){TextView text=(TextView)view;text.setSingleLine(false);text.setMaxLines(2);text.setTextSize(14);}return view;}
        };list.setAdapter(adapter);
        Runnable check=()->{list.clearChoices();for(int i=0;i<visible.size();i++)list.setItemChecked(i,selected.contains(visible.get(i).url));count.setText("表示 "+visible.size()+" / "+boards.size()+"板・選択 "+selected.size()+"板");};
        Runnable render=()->{
            String query=GlobalTitleSearchRules.normalize(search.getText().toString().trim());visible.clear();labels.clear();
            for(GlobalTitleSearch.Board board:boards)if(query.isEmpty()||GlobalTitleSearchRules.normalize(board.title+" "+board.url).contains(query)){visible.add(board);labels.add(board.title+"\n"+board.url);}
            adapter.notifyDataSetChanged();check.run();
        };
        list.setOnItemClickListener((parent,view,position,id)->{String url=visible.get(position).url;if(list.isItemChecked(position))selected.add(url);else selected.remove(url);check.run();});
        all.setOnClickListener(v->{for(GlobalTitleSearch.Board b:visible)selected.add(b.url);check.run();});none.setOnClickListener(v->{for(GlobalTitleSearch.Board b:visible)selected.remove(b.url);check.run();});
        search.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int start,int n,int after){}public void onTextChanged(CharSequence s,int start,int before,int n){render.run();}public void afterTextChanged(Editable e){}});
        render.run();
        new HaiagaruDialog.Builder(activity).setTitle("全板検索に含める外部板").setView(root)
                .setPositiveButton("保存",(dialog,which)->prefs.edit().putString(GlobalTitleSearch.BOARDS,new org.json.JSONArray(selected).toString()).apply())
                .setNegativeButton("キャンセル",(dialog,which)->{})
                .setNeutralButton("すべての登録板を対象",(dialog,which)->prefs.edit().putString(GlobalTitleSearch.BOARDS,"").apply()).show();
    }
    private GlobalTitleSearchBoards(){}
}
