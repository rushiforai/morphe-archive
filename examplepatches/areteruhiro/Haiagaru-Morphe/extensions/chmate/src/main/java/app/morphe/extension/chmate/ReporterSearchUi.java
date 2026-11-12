package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.widget.*;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.*;

/** Native search form. Reads only the already-public log; never expires its records. */
final class ReporterSearchUi {
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    static void show(Activity activity, String initialId) {
        if (!FeatureSwitches.enabled("reporterSearchEnabled", true)) {
            Toast.makeText(activity, "Haiagaru設定で記者ID・スレ名検索をオンにしてください", Toast.LENGTH_LONG).show();
            return;
        }
        LinearLayout content = new LinearLayout(activity); content.setOrientation(LinearLayout.VERTICAL);
        int pad = (int)(16 * activity.getResources().getDisplayMetrics().density); content.setPadding(pad,pad,pad,pad);
        Spinner mode = new Spinner(activity);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(activity, android.R.layout.simple_spinner_dropdown_item,
                new String[]{"記者ID全文", "記者ID前半4桁", "記者ID後半4桁", "スレ名（部分一致）"});
        mode.setAdapter(adapter); content.addView(mode);
        EditText query = new EditText(activity); query.setSingleLine(true); query.setHint("記者ID／スレ名");
        if (initialId != null) query.setText(initialId); content.addView(query);
        // Preserve the full ID while the spinner displays a four-character search term.
        // If the user edits the field, never overwrite their new search text with stale data.
        final String[] fullId = {initialId != null && initialId.matches("[A-Za-z0-9+/.]{8}") ? initialId : null};
        final String[] autoQuery = {fullId[0]};
        mode.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override public void onItemSelected(AdapterView<?> parent, android.view.View view, int position, long rowId) {
                if (position == 3) return;
                String current = query.getText().toString();
                String source = current.matches("[A-Za-z0-9+/.]{8}") ? current
                        : fullId[0] != null && current.equals(autoQuery[0]) ? fullId[0] : null;
                if (source == null) return;
                fullId[0] = source;
                String shown = ReporterSearch.queryForMode(source, position);
                if (!shown.equals(current)) {
                    query.setText(shown);
                    query.setSelection(shown.length());
                }
                autoQuery[0] = shown;
            }
            @Override public void onNothingSelected(AdapterView<?> parent) {}
        });
        TimeZone zone=TimeZone.getTimeZone("Asia/Tokyo");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ROOT);
        format.setTimeZone(zone); format.setLenient(false);
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd",Locale.ROOT);dateFormat.setTimeZone(zone);
        TextView help = new TextView(activity);
        help.setText("日本時間。開始日から終了日まで両日を含めて検索します。記者IDは木曜9時／毎日0時に更新されるため期間をまたぐと異なるIDになります。部分IDの一致だけでは同一人物とは限りません。"); content.addView(help);
        Calendar endDay=Calendar.getInstance(zone,Locale.JAPAN);
        Calendar startDay=(Calendar)endDay.clone();startDay.add(Calendar.DAY_OF_MONTH,-6);
        Button start=new Button(activity);start.setAllCaps(false);content.addView(start);
        Button end=new Button(activity);end.setAllCaps(false);content.addView(end);
        updateDate(start,"開始日",startDay,dateFormat);updateDate(end,"終了日",endDay,dateFormat);
        start.setOnClickListener(v->pickDate(activity,start,"開始日",startDay,dateFormat));
        end.setOnClickListener(v->pickDate(activity,end,"終了日",endDay,dateFormat));
        Button search = new Button(activity); search.setText("検索"); content.addView(search);
        TextView status = new TextView(activity); content.addView(status);
        LinearLayout results = new LinearLayout(activity); results.setOrientation(LinearLayout.VERTICAL); content.addView(results);
        ScrollView scroll = new ScrollView(activity); scroll.addView(content);
        HaiagaruDialog dialog = new HaiagaruDialog.Builder(activity).setTitle("エッヂの過去スレ検索").setView(scroll).setNegativeButton("閉じる",null).create();
        final Future<?>[] pending = {null}; final boolean[] closed = {false};
        dialog.setOnDismissListener(d -> { closed[0] = true; if(pending[0]!=null)pending[0].cancel(true); });
        search.setOnClickListener(v -> {
            final int selected = mode.getSelectedItemPosition(); final String text = query.getText().toString();
            final long from, until;
            try {
                long[] range=ReporterSearch.dateRange(dateFormat.format(startDay.getTime()),dateFormat.format(endDay.getTime()));
                from=range[0];until=range[1];
            } catch(Exception error){status.setText("終了日は開始日以降にしてください。");return;}
            search.setEnabled(false); results.removeAllViews();
            final String rangeText=dateFormat.format(startDay.getTime())+" ～ "+dateFormat.format(endDay.getTime())+"（両日含む）";
            status.setText(rangeText+" を検索中…");
            pending[0]=WORKER.submit(() -> {
                ReporterSearch.Result found=null; String failure=null;
                HttpURLConnection connection=null;
                try {
                    connection=(HttpURLConnection)new URL(ReporterSearch.SOURCE).openConnection();
                    connection.setConnectTimeout(15000);connection.setReadTimeout(30000);
                    if(connection.getResponseCode()!=200)throw new IOException("HTTP "+connection.getResponseCode());
                    try(Reader reader=new InputStreamReader(connection.getInputStream(),StandardCharsets.UTF_8)){
                        found=ReporterSearch.search(reader,selected,text,from,until);
                    }
                }catch(Exception error){failure=error.getMessage();}finally{if(connection!=null)connection.disconnect();}
                final ReporterSearch.Result answer=found;final String error=failure;
                activity.runOnUiThread(() -> {
                    if(closed[0]||activity.isFinishing())return;
                    search.setEnabled(true);
                    if(answer==null){status.setText("検索できませんでした: "+error);return;}
                    status.setText(rangeText+"\n"+answer.matches+"件（表示最大200件）。収集済みログのみが対象です。");
                    for(ReporterSearch.Row row:answer.rows){
                        Button item=new Button(activity);item.setAllCaps(false);
                        item.setText(row.title+"\n["+row.id+"★] "+format.format(new Date(row.created)));
                        item.setOnClickListener(w -> {
                            try{activity.startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse(row.url)).setPackage(activity.getPackageName()));}
                            catch(Exception unavailable){Toast.makeText(activity,"スレを開けませんでした",Toast.LENGTH_LONG).show();}
                        });results.addView(item);
                    }
                });
            });
        });
        dialog.show();
    }
    private static void updateDate(Button button,String label,Calendar date,SimpleDateFormat format){
        button.setText(label+"："+format.format(date.getTime()));
    }
    private static void pickDate(Activity activity,Button button,String label,Calendar date,SimpleDateFormat format){
        new android.app.DatePickerDialog(activity,(picker,year,month,day)->{
            date.set(Calendar.YEAR,year);date.set(Calendar.MONTH,month);date.set(Calendar.DAY_OF_MONTH,day);
            updateDate(button,label,date,format);
        },date.get(Calendar.YEAR),date.get(Calendar.MONTH),date.get(Calendar.DAY_OF_MONTH)).show();
    }
    private ReporterSearchUi(){}
}
