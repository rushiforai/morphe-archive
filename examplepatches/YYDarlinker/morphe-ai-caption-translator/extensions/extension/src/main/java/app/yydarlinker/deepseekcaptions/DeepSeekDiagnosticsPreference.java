package app.yydarlinker.deepseekcaptions;
import android.content.*;
import android.util.AttributeSet;
import android.view.*;
import android.widget.*;
/** Quiet by default; expanding or pressing a button is always explicit and never calls the provider. */
@SuppressWarnings("deprecation")
public final class DeepSeekDiagnosticsPreference extends CaptionSettingPreference {
    public DeepSeekDiagnosticsPreference(Context c){super(c);init();}
    public DeepSeekDiagnosticsPreference(Context c,AttributeSet a){super(c,a);init();}
    public DeepSeekDiagnosticsPreference(Context c,AttributeSet a,int d){super(c,a,d);init();}
    public DeepSeekDiagnosticsPreference(Context c,AttributeSet a,int d,int r){super(c,a,d,r);init();}
    private java.lang.ref.WeakReference<Panel> currentPanel=new java.lang.ref.WeakReference<>(null);
    private final class Panel {
        final java.lang.ref.WeakReference<View> root;
        final java.lang.ref.WeakReference<TextView> body;
        final java.lang.ref.WeakReference<View> expanded;
        long request;
        String lastLocale="";
        CaptionDiagnosticSnapshot.Snapshot complete;
        CaptionDiagnosticSnapshot.Callback callback;
        Panel(View root,TextView body,View expanded){this.root=new java.lang.ref.WeakReference<>(root);this.body=new java.lang.ref.WeakReference<>(body);this.expanded=new java.lang.ref.WeakReference<>(expanded);}
        String text(){CaptionDiagnosticSnapshot.Snapshot safe=CaptionDiagnosticSnapshot.peek(getContext());complete=safe;
            return safe==null?CaptionStrings.settings(getContext(),"diagnostics_loading"):safe.text;}
        void refresh(){
            View view=root.get();TextView text=body.get();if(view==null||text==null)return;
            String value=text();if(!sameText(text.getText(),value))text.setText(value);
            final long ticket=++request;final Object token=view.getWindowToken();final View window=view.getRootView();
            lastLocale=CaptionTextResolver.locale(getContext()).toLanguageTag();
            callback=snapshot->{
                View row=root.get(),open=expanded.get();TextView target=body.get();
                if(currentPanel.get()!=this||ticket!=request||row==null||target==null||open==null||open.getVisibility()!=View.VISIBLE
                    ||!row.isAttachedToWindow()||row.getRootView()!=window||row.getWindowToken()!=token||!snapshot.key.current(getContext()))return;
                complete=snapshot;if(!sameText(target.getText(),snapshot.text))target.setText(snapshot.text);
            };
            CaptionDiagnosticSnapshot.request(getContext(),callback);
        }
        void cancel(){request++;callback=null;}
    }
    @Override protected void refreshDynamicText(){
        Panel panel=currentPanel.get();if(panel==null)return;
        View open=panel.expanded.get();
        if(open!=null&&open.getVisibility()==View.VISIBLE
            &&!panel.lastLocale.equals(CaptionTextResolver.locale(getContext()).toLanguageTag()))panel.refresh();
    }
    private void init(){setPersistent(false);setSelectable(false);}
    @Override protected View onCreateView(ViewGroup parent){
        Context c=getContext();LinearLayout box=new LinearLayout(c);box.setOrientation(LinearLayout.VERTICAL);CaptionSettingsStyle.row(box);
        LinearLayout header=new LinearLayout(c);header.setGravity(Gravity.CENTER_VERTICAL);
        TextView title=new TextView(c);uiText(title,"diagnostics");CaptionSettingsStyle.title(title);header.addView(title,new LinearLayout.LayoutParams(0,-2,1));
        Button toggle=new Button(c,null,android.R.attr.borderlessButtonStyle);CaptionSettingsStyle.button(toggle);toggle.setText(CaptionStrings.settings(c,"expand"));toggle.setTag("ai_diagnostics_toggle");header.addView(toggle);box.addView(header);
        TextView hint=new TextView(c);uiText(hint,"diagnostics_hint");CaptionSettingsStyle.caption(hint);box.addView(hint);
        LinearLayout expanded=new LinearLayout(c);expanded.setOrientation(LinearLayout.VERTICAL);expanded.setVisibility(View.GONE);
        ProfileActionStrip actions=new ProfileActionStrip(c);
        TextView body=new TextView(c);body.setTag("ai_diagnostics_body");CaptionSettingsStyle.caption(body);body.setTextIsSelectable(true);body.setPadding(CaptionSettingsStyle.dp(c,12),CaptionSettingsStyle.dp(c,10),CaptionSettingsStyle.dp(c,12),CaptionSettingsStyle.dp(c,10));
        ScrollView scroll=new ScrollView(c){@Override public boolean onInterceptTouchEvent(MotionEvent e){if(getParent()!=null)getParent().requestDisallowInterceptTouchEvent(true);return super.onInterceptTouchEvent(e);}};
        scroll.setTag("ai_diagnostics_scroll");scroll.setBackground(CaptionSettingsStyle.surface(c,false));scroll.setFillViewport(false);scroll.setVerticalScrollBarEnabled(true);scroll.addView(body,new ScrollView.LayoutParams(-1,-2));
        Panel panel=new Panel(box,body,expanded);currentPanel=new java.lang.ref.WeakReference<>(panel);
        box.setTag(panel);
        box.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
            public void onViewAttachedToWindow(View v){if(expanded.getVisibility()==View.VISIBLE)panel.refresh();}
            public void onViewDetachedFromWindow(View v){panel.cancel();}
        });
        Button refresh=CaptionSettingsStyle.action(c,CaptionStrings.settings(c,"refresh"),false,false,()->{});refresh.setTag("ai_diagnostics_refresh");refresh.setOnClickListener(v->{panel.refresh();scroll.scrollTo(0,0);});actions.addView(refresh,new LinearLayout.LayoutParams(0,-2,1));
        Button copy=CaptionSettingsStyle.action(c,CaptionStrings.settings(c,"copy"),false,false,()->{});copy.setTag("ai_diagnostics_copy");copy.setOnClickListener(v->{ClipboardManager manager=(ClipboardManager)c.getSystemService(Context.CLIPBOARD_SERVICE);if(manager!=null&&panel.complete!=null&&panel.complete.key.current(c)){manager.setPrimaryClip(ClipData.newPlainText(CaptionStrings.settings(c,"diagnostics"),panel.complete.text));Toast.makeText(c,CaptionStrings.settings(c,"message_896c4b51d7e9"),Toast.LENGTH_SHORT).show();}});actions.addView(copy,new LinearLayout.LayoutParams(0,-2,1));
        ProfileActionStrip archiveActions=new ProfileActionStrip(c);
        Button save=CaptionSettingsStyle.action(c,CaptionStrings.settings(c,"save_diagnostics"),false,false,()->{});save.setTag("ai_diagnostics_save");archiveActions.addView(save,new LinearLayout.LayoutParams(0,-2,1));
        save.setOnClickListener(v->{save.setEnabled(false);new Thread(()->{
            // The export keeps the stable raw report; only the toast text follows the interface language.
            String report=CaptionDiagnostics.fullText(c);String result;boolean failed;
            try { result=writeReport(c,report);failed=false; } catch(Exception e){result=e.getClass().getSimpleName();failed=true;}
            String value=result;boolean failure=failed;
            new android.os.Handler(android.os.Looper.getMainLooper()).post(()->{save.setEnabled(true);if(value==null&&!failure)copyPages(c,report);else Toast.makeText(c,String.format(java.util.Locale.ROOT,CaptionStrings.settings(c,failure?"save_failed":"save_ok"),value),Toast.LENGTH_LONG).show();});
        },"caption-export").start();});
        Button clear=CaptionSettingsStyle.action(c,CaptionStrings.settings(c,"clear_diagnostics"),false,true,()->{});clear.setTag("ai_diagnostics_clear");
        clear.setOnClickListener(v->CaptionSettingsDialogs.confirm(c,
                CaptionStrings.settings(c,"clear_diagnostics"),
                CaptionStrings.settings(c,"clear_diagnostics_confirm"),
                CaptionStrings.settings(c,"clear_diagnostics"),
                ()->{panel.cancel();CaptionDiagnostics.clear(c);panel.complete=null;panel.refresh();}));
        body.setTypeface(android.graphics.Typeface.MONOSPACE);
        expanded.addView(scroll,new LinearLayout.LayoutParams(-1,CaptionSettingsStyle.dp(c,240)));
        int gap=CaptionSettingsStyle.dp(c,8);
        actions.setPadding(0,gap,0,0);archiveActions.setPadding(0,gap,0,0);
        expanded.addView(actions,new LinearLayout.LayoutParams(-1,-2));
        expanded.addView(archiveActions,new LinearLayout.LayoutParams(-1,-2));
        LinearLayout.LayoutParams clearParams=new LinearLayout.LayoutParams(-1,-2);clearParams.topMargin=gap;
        expanded.addView(clear,clearParams);box.addView(expanded);
        uiText(toggle,()->{String label=CaptionStrings.settings(c,expanded.getVisibility()==View.VISIBLE?"collapse":"expand");toggle.setContentDescription(label);return label;});
        uiText(refresh,"refresh");uiText(copy,"copy");uiText(save,"save_diagnostics");uiText(clear,"clear_diagnostics");
        uiText(body,panel::text);
        toggle.setOnClickListener(v->{boolean open=expanded.getVisibility()!=View.VISIBLE;expanded.setVisibility(open?View.VISIBLE:View.GONE);if(open)panel.refresh();else panel.cancel();toggle.setText(CaptionStrings.settings(c,open?"collapse":"expand"));toggle.setContentDescription(open?CaptionStrings.settings(c,"collapse"):CaptionStrings.settings(c,"expand"));});return box;
    }
    static String saveReport(Context c,String report) throws java.io.IOException {
        String name=writeReport(c,report);
        return name==null?null:String.format(java.util.Locale.ROOT,CaptionStrings.settings(c,"save_ok"),name);
    }
    private static String writeReport(Context c,String report) throws java.io.IOException {
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
        // Only the file name is substituted; the whole sentence is one authored template per locale.
        return name;
    }
    /**
     * Android 9 cannot publish a file through MediaStore, so the export is handed over in clipboard
     * chunks. Each label and toast is one complete authored template, never a concatenated fragment.
     */
    private static void copyPages(Context c,String report){
        int length=60000,count=(report.length()+length-1)/length;String[] labels=new String[count];
        for(int i=0;i<count;i++)labels[i]=String.format(java.util.Locale.ROOT,
                CaptionStrings.settings(c,"copy_part_label"),i+1,count);
        new android.app.AlertDialog.Builder(c)
                .setTitle(CaptionStrings.settings(c,"copy_parts_title"))
                .setItems(labels,(d,index)->{
            ClipboardManager manager=(ClipboardManager)c.getSystemService(Context.CLIPBOARD_SERVICE);
            String chunk=report.substring(index*length,Math.min(report.length(),(index+1)*length));
            if(manager!=null)manager.setPrimaryClip(ClipData.newPlainText(
                    String.format(java.util.Locale.ROOT,CaptionStrings.settings(c,"copy_part_label"),index+1,count),chunk));
            Toast.makeText(c,String.format(java.util.Locale.ROOT,
                    CaptionStrings.settings(c,"copy_part_done"),index+1,count),Toast.LENGTH_LONG).show();
        }).show();
    }
}
