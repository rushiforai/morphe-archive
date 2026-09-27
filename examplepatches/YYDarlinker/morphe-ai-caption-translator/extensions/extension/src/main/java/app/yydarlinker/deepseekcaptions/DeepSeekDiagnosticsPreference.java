package app.yydarlinker.deepseekcaptions;
import android.content.*;
import android.util.AttributeSet;
import android.view.*;
import android.widget.*;
/** Quiet by default; expanding or pressing a button is always explicit and never calls the provider. */
@SuppressWarnings("deprecation")
public final class DeepSeekDiagnosticsPreference extends android.preference.Preference {
    public DeepSeekDiagnosticsPreference(Context c){super(c);init();}
    public DeepSeekDiagnosticsPreference(Context c,AttributeSet a){super(c,a);init();}
    public DeepSeekDiagnosticsPreference(Context c,AttributeSet a,int d){super(c,a,d);init();}
    public DeepSeekDiagnosticsPreference(Context c,AttributeSet a,int d,int r){super(c,a,d,r);init();}
    private void init(){setPersistent(false);setSelectable(false);}
    @Override protected View onCreateView(ViewGroup parent){
        Context c=getContext();LinearLayout box=new LinearLayout(c);box.setOrientation(LinearLayout.VERTICAL);CaptionSettingsStyle.row(box);
        LinearLayout header=new LinearLayout(c);header.setGravity(Gravity.CENTER_VERTICAL);
        TextView title=new TextView(c);title.setText(CaptionStrings.localize(getContext(), "字幕诊断"));CaptionSettingsStyle.title(title);header.addView(title,new LinearLayout.LayoutParams(0,-2,1));
        Button toggle=new Button(c,null,android.R.attr.borderlessButtonStyle);CaptionSettingsStyle.button(toggle);toggle.setText(CaptionStrings.localize(getContext(), "展开"));toggle.setTag("ai_diagnostics_toggle");header.addView(toggle);box.addView(header);
        TextView hint=new TextView(c);hint.setText(CaptionStrings.localize(getContext(), "长时间测试请开启显示文本调试；保存完整诊断可导出最近 24 小时记录（容量上限 16 MiB）。下方仅显示最近摘要。"));CaptionSettingsStyle.caption(hint);box.addView(hint);
        LinearLayout expanded=new LinearLayout(c);expanded.setOrientation(LinearLayout.VERTICAL);expanded.setVisibility(View.GONE);
        ProfileActionStrip actions=new ProfileActionStrip(c);
        TextView body=new TextView(c);body.setTag("ai_diagnostics_body");CaptionSettingsStyle.caption(body);body.setTextIsSelectable(true);body.setPadding(CaptionSettingsStyle.dp(c,12),CaptionSettingsStyle.dp(c,10),CaptionSettingsStyle.dp(c,12),CaptionSettingsStyle.dp(c,10));
        ScrollView scroll=new ScrollView(c){@Override public boolean onInterceptTouchEvent(MotionEvent e){if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(true);return super.onInterceptTouchEvent(e);}};
        scroll.setTag("ai_diagnostics_scroll");scroll.setBackground(CaptionSettingsStyle.surface(c,false));scroll.setFillViewport(false);scroll.setVerticalScrollBarEnabled(true);scroll.addView(body,new ScrollView.LayoutParams(-1,-2));
        Button refresh=CaptionSettingsStyle.action(c,CaptionStrings.localize(c,"刷新"),false,false,()->{});refresh.setTag("ai_diagnostics_refresh");refresh.setOnClickListener(v->{body.setText(CaptionDiagnostics.uiText(c));scroll.scrollTo(0,0);});actions.addView(refresh,new LinearLayout.LayoutParams(0,-2,1));
        Button copy=CaptionSettingsStyle.action(c,CaptionStrings.localize(c,"复制"),false,false,()->{});copy.setTag("ai_diagnostics_copy");copy.setOnClickListener(v->{ClipboardManager manager=(ClipboardManager)c.getSystemService(Context.CLIPBOARD_SERVICE);if(manager!=null){manager.setPrimaryClip(ClipData.newPlainText("AI 字幕诊断",body.getText()));Toast.makeText(c,"诊断已复制",Toast.LENGTH_SHORT).show();}});actions.addView(copy,new LinearLayout.LayoutParams(0,-2,1));
        ProfileActionStrip archiveActions=new ProfileActionStrip(c);
        Button save=CaptionSettingsStyle.action(c,"保存完整诊断",false,false,()->{});save.setTag("ai_diagnostics_save");archiveActions.addView(save,new LinearLayout.LayoutParams(0,-2,1));
        save.setOnClickListener(v->{save.setEnabled(false);new Thread(()->{
            String report=CaptionDiagnostics.fullText(c);String result;
            try { result=saveReport(c,report); } catch(Exception e){result="保存失败："+e.getClass().getSimpleName();}
            String message=result;new android.os.Handler(android.os.Looper.getMainLooper()).post(()->{save.setEnabled(true);if(message==null)copyPages(c,report);else Toast.makeText(c,message,Toast.LENGTH_LONG).show();});
        },"caption-export").start();});
        Button clear=CaptionSettingsStyle.action(c,CaptionStrings.settings(c,"clear_diagnostics"),false,true,()->{});clear.setTag("ai_diagnostics_clear");
        clear.setOnClickListener(v->CaptionSettingsDialogs.confirm(c,
                CaptionStrings.settings(c,"clear_diagnostics"),
                CaptionStrings.localize(c,"清空本地诊断记录？不会清除 API 设置或翻译缓存。"),
                CaptionStrings.settings(c,"clear_diagnostics"),
                ()->{CaptionDiagnostics.clear(c);body.setText(CaptionDiagnostics.uiText(c));}));
        body.setTypeface(android.graphics.Typeface.MONOSPACE);
        expanded.addView(scroll,new LinearLayout.LayoutParams(-1,CaptionSettingsStyle.dp(c,240)));
        int gap=CaptionSettingsStyle.dp(c,8);
        actions.setPadding(0,gap,0,0);archiveActions.setPadding(0,gap,0,0);
        expanded.addView(actions,new LinearLayout.LayoutParams(-1,-2));
        expanded.addView(archiveActions,new LinearLayout.LayoutParams(-1,-2));
        LinearLayout.LayoutParams clearParams=new LinearLayout.LayoutParams(-1,-2);clearParams.topMargin=gap;
        expanded.addView(clear,clearParams);box.addView(expanded);
        toggle.setOnClickListener(v->{boolean open=expanded.getVisibility()!=View.VISIBLE;if(open)body.setText(CaptionDiagnostics.uiText(c));expanded.setVisibility(open?View.VISIBLE:View.GONE);toggle.setText(CaptionStrings.localize(getContext(), open?"收起":"展开"));toggle.setContentDescription(CaptionStrings.localize(getContext(), open?"收起字幕诊断":"展开字幕诊断"));});return box;
    }
    static String saveReport(Context c,String report) throws java.io.IOException {
        if(android.os.Build.VERSION.SDK_INT<29)return null;
        android.content.ContentValues values=new android.content.ContentValues();
        String name="caption-diagnostics-"+app.yydarlinker.extension.BuildConfig.CAPTION_PATCH_VERSION+"-"+new java.text.SimpleDateFormat("yyyyMMdd-HHmmss",java.util.Locale.ROOT).format(new java.util.Date())+".txt";
        values.put(android.provider.MediaStore.MediaColumns.DISPLAY_NAME,name);
        values.put(android.provider.MediaStore.MediaColumns.MIME_TYPE,"text/plain");
        values.put(android.provider.MediaStore.MediaColumns.RELATIVE_PATH,android.os.Environment.DIRECTORY_DOWNLOADS);
        values.put(android.provider.MediaStore.MediaColumns.IS_PENDING,1);
        android.content.ContentResolver resolver=c.getContentResolver();
        android.net.Uri uri=resolver.insert(android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI,values);
        if(uri==null)throw new java.io.IOException("No download destination");
        try {
            try(java.io.OutputStream out=resolver.openOutputStream(uri)){if(out==null)throw new java.io.IOException("No output stream");out.write(report.getBytes(java.nio.charset.StandardCharsets.UTF_8));}
            values.clear();values.put(android.provider.MediaStore.MediaColumns.IS_PENDING,0);if(resolver.update(uri,values,null,null)!=1)throw new java.io.IOException("Download was not published");
        }catch(Exception e){resolver.delete(uri,null,null);throw new java.io.IOException(e);}
        return "已保存到 Download/"+name;
    }
    private static void copyPages(Context c,String report){
        int length=60000,count=(report.length()+length-1)/length;String[] labels=new String[count];
        for(int i=0;i<count;i++)labels[i]="复制第 "+(i+1)+" / "+count+" 部分";
        new android.app.AlertDialog.Builder(c).setTitle("Android 9 及以下：分段复制完整诊断").setItems(labels,(d,index)->{
            ClipboardManager manager=(ClipboardManager)c.getSystemService(Context.CLIPBOARD_SERVICE);
            if(manager!=null)manager.setPrimaryClip(ClipData.newPlainText("Caption diagnostic "+(index+1)+"/"+count,report.substring(index*length,Math.min(report.length(),(index+1)*length))));
            Toast.makeText(c,"已复制第 "+(index+1)+" 部分；再次保存可选择其余部分",Toast.LENGTH_LONG).show();
        }).show();
    }
}
