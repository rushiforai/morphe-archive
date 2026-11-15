package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.ContentValues;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.net.URLDecoder;
import java.util.ArrayList;

/** Entry lives in ChMate's native 掲示板/BBSMENU preference screen. */
public final class ExternalBoardEditorActivity extends HaiagaruComposeActivity {
    private android.widget.ListView list;
    private final ArrayList<Board> visibleBoards=new ArrayList<>();
    private boolean busy;
    private boolean includeBbsMenu;
    private HaiagaruDialog editDialog;
    private EditText search;
    private final ArrayList<Board> loadedBoards=new ArrayList<>();
    private final Handler searchHandler=new Handler(Looper.getMainLooper());
    private final Runnable searchUpdate=()->renderBoards();
    static final class Board {
        final long row; final String id,title,original;
        Board(long row,String id,String title,String original) {
            this.row=row;this.id=id;this.title=title;this.original=original;
        }
    }
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        LinearLayout root=new LinearLayout(this);root.setOrientation(1);
        int pad=(int)(16*getResources().getDisplayMetrics().density);root.setPadding(pad,pad,pad,pad);
        root.setOnApplyWindowInsetsListener((v,insets)->{
            v.setPadding(pad+insets.getSystemWindowInsetLeft(),pad+insets.getSystemWindowInsetTop(),
                    pad+insets.getSystemWindowInsetRight(),pad+insets.getSystemWindowInsetBottom());return insets;
        });
        Button back=new Button(this);back.setText("戻る");back.setOnClickListener(v->finish());root.addView(back);
        TextView help=new TextView(this);help.setText("登録した外部板の名前・URLを編集\n保存後はChMateを再起動してください。お気に入り・取得済みログの識別子は変更しません。異なる板への付け替えではなく、同じ板の名前変更・移転に使用してください。認証設定は新しい接続先で再設定してください。");root.addView(help);
        CheckBox all=new CheckBox(this);all.setText("BBSMENUの板も表示（追加した板が見つからない場合）");
        all.setOnCheckedChangeListener((button,on)->{includeBbsMenu=on;load();});root.addView(all);
        search=new EditText(this);search.setSingleLine(true);search.setHint("板名・URLで検索");root.addView(search);
        search.addTextChangedListener(new TextWatcher(){
            public void beforeTextChanged(CharSequence s,int start,int count,int after){}
            public void onTextChanged(CharSequence s,int start,int before,int count){
                searchHandler.removeCallbacks(searchUpdate);searchHandler.postDelayed(searchUpdate,180);
            }
            public void afterTextChanged(Editable s){}
        });
        list=new android.widget.ListView(this);
        list.setAdapter(new android.widget.BaseAdapter(){
            public int getCount(){return visibleBoards.size();}
            public Object getItem(int position){Board b=visibleBoards.get(position);return b.title+"\n"+ExternalBoardEditor.prefs(ExternalBoardEditorActivity.this).getString("target:"+b.id,b.original);}
            public long getItemId(int position){return visibleBoards.get(position).row;}
            public android.view.View getView(int position,android.view.View reused,android.view.ViewGroup parent){
                Board b=visibleBoards.get(position);Button item=reused instanceof Button?(Button)reused:new Button(ExternalBoardEditorActivity.this);
                item.setAllCaps(false);item.setText(b.title+"\n"+ExternalBoardEditor.prefs(ExternalBoardEditorActivity.this).getString("target:"+b.id,b.original));
                item.setOnClickListener(v->edit(b));return item;
            }
        });
        list.setOnItemClickListener((parent,view,position,id)->edit(visibleBoards.get(position)));
        root.addView(list,new LinearLayout.LayoutParams(-1,0,1));HaiagaruUi.showModel(this, "外部板の編集", root);root.requestApplyInsets();load();
    }
    private SQLiteDatabase database() {
        return SQLiteDatabase.openDatabase(getDatabasePath("roidon.sqlite").getPath(),null,SQLiteDatabase.OPEN_READWRITE);
    }
    private ArrayList<Board> boards(SQLiteDatabase db,boolean all) throws Exception {
        ArrayList<Board> rows=new ArrayList<>();
        // is_external is a native engine flag, not a reliable record of manual registration.
        // BBSMENU imports and several native add-board paths leave it zero.
        try(Cursor c=db.rawQuery("SELECT _id,name,title,server,is_external FROM boards ORDER BY title",null)) {
            while(c.moveToNext()) {
                String id=c.getString(1), decoded=URLDecoder.decode(id,"UTF-8");
                String path=decoded.contains("/")?decoded.substring(decoded.indexOf('/')+1):decoded;
                String original="https://"+c.getString(3)+"/"+path+"/";
                if(all || BoardAddress.externalRegistration(c.getInt(4),original))
                    rows.add(new Board(c.getLong(0),id,c.getString(2),original));
            }
        }
        return rows;
    }
    private void load() {
        if(busy)return;busy=true;visibleBoards.clear();((android.widget.BaseAdapter)list.getAdapter()).notifyDataSetChanged();
        final boolean showingAll=includeBbsMenu;
        new Thread(()->{
            try(SQLiteDatabase db=database()) {
                ArrayList<Board> rows=boards(db,showingAll);
                runOnUiThread(()->{
                    busy=false;if(isFinishing())return;
                    if(showingAll!=includeBbsMenu){load();return;}
                    loadedBoards.clear();loadedBoards.addAll(rows);renderBoards();
                });
            } catch(Exception e){runOnUiThread(()->{busy=false;error("板一覧を読み込めませんでした。");});}
        },"Haiagaru-board-list").start();
    }
    private void renderBoards() {
        if(isFinishing() || isDestroyed() || busy || list==null)return;
        visibleBoards.clear();
        String query=search.getText().toString();
        SharedPreferences preferences=ExternalBoardEditor.prefs(this);
        for(Board b:loadedBoards)if(ExternalBoardSearch.matches(query,b.title,preferences.getString("target:"+b.id,b.original)))visibleBoards.add(b);
        ((android.widget.BaseAdapter)list.getAdapter()).notifyDataSetChanged();
    }
    @Override protected void onDestroy() {
        searchHandler.removeCallbacks(searchUpdate);super.onDestroy();
    }
    private void edit(Board b) {
        if(editDialog!=null&&editDialog.isShowing())return;
        LinearLayout box=new LinearLayout(this);box.setOrientation(1);
        EditText title=new EditText(this);title.setSingleLine();title.setHint("板名");title.setText(b.title);box.addView(title);
        EditText url=new EditText(this);url.setSingleLine();url.setInputType(17);url.setHint("板のURL");
        url.setText(ExternalBoardEditor.prefs(this).getString("target:"+b.id,b.original));box.addView(url);
        HaiagaruDialog dialog=new HaiagaruDialog.Builder(this).setTitle("外部板の名前・URLを編集").setView(box)
                .setNegativeButton("キャンセル",null).setPositiveButton("保存",null).create();
        editDialog=dialog;dialog.setOnDismissListener(d->editDialog=null);
        dialog.setOnShowListener(d->dialog.getButton(-1).setOnClickListener(v->{
            String name=title.getText().toString().trim();
            if(name.isEmpty()){title.setError("板名を入力してください");return;}
            final BoardAddress target;
            try {
                target=BoardAddress.parse(url.getText().toString());
                if(!target.engine().equals(BoardAddress.parse(b.original).engine()))
                    throw new IllegalArgumentException("掲示板の種類が異なるURLへは変更できません。別の板として追加してください。");
            }
            catch(IllegalArgumentException e){url.setError(e.getMessage());return;}
            if(busy)return;busy=true;dialog.getButton(-1).setEnabled(false);
            new Thread(()->{
                String failure=null;
                try(SQLiteDatabase db=database()) {
                    SharedPreferences p=ExternalBoardEditor.prefs(this);
                    for(Board other:boards(db,true)) if(!other.id.equals(b.id)) {
                        boolean duplicate=false;
                        try {duplicate=target.key().equals(BoardAddress.parse(p.getString("target:"+other.id,other.original)).key())
                                || target.key().equals(BoardAddress.parse(other.original).key());}
                        catch(IllegalArgumentException ignored) { }
                        if(duplicate)
                            throw new IllegalArgumentException("同じURLの板がすでに登録されています。");
                    }
                    // Do not rename boards.name, bookmarks or log directories.
                    // Commit the routing preference first; roll it back if the DB write fails.
                    String old=p.getString("target:"+b.id,null);
                    SharedPreferences.Editor change=p.edit().putString("original:"+b.id,b.original);
                    if(target.url.equals(b.original))change.remove("target:"+b.id);else change.putString("target:"+b.id,target.url);
                    if(!change.commit())
                        throw new Exception("設定を保存できませんでした。");
                    try {
                        ContentValues values=new ContentValues();values.put("title",name);
                        if(db.update("boards",values,"_id=? AND name=?",new String[]{Long.toString(b.row),b.id})!=1)
                            throw new Exception("板が変更されたため保存できませんでした。開き直してください。");
                    } catch(Exception e) {
                        SharedPreferences.Editor rollback=p.edit();
                        if(old==null) rollback.remove("target:"+b.id);else rollback.putString("target:"+b.id,old);
                        rollback.commit();throw e;
                    }
                }catch(Exception e){failure=e.getMessage()==null?"保存できませんでした。":e.getMessage();}
                final String result=failure;
                runOnUiThread(()->{
                    busy=false;if(isFinishing())return;
                    if(result!=null){dialog.getButton(-1).setEnabled(true);error(result);}
                    else {dialog.dismiss();load();new HaiagaruDialog.Builder(this).setMessage("保存しました。ChMateを終了して起動し直すと反映されます。").setPositiveButton("OK",null).show();}
                });
            },"Haiagaru-board-save").start();
        }));dialog.show();
    }
    private void error(String message){if(!isFinishing())new HaiagaruDialog.Builder(this).setMessage(message).setPositiveButton("OK",null).show();}
}
