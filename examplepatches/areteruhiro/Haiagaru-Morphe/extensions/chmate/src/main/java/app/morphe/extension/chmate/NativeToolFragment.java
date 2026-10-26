package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Gravity;
import android.graphics.Color;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Compilation placeholder: the patch replaces this superclass and super calls with ChMate's own base. */
@SuppressWarnings("deprecation")
public final class NativeToolFragment extends android.app.Fragment {
    private Activity host;
    private NativeToolTabs.Content content;
    private LinearLayout frame;
    private LinearLayout header;
    private TextView title, close;
    private Runnable releaseArchiveBack;
    private android.content.SharedPreferences preferences;
    private final android.content.SharedPreferences.OnSharedPreferenceChangeListener headerListener=(prefs,key)->{
        if(NativeToolTabs.HEADER_HEIGHT_KEY.equals(key)&&host!=null)host.runOnUiThread(this::updateHeader);
    };
    @Override public void onAttach(Context context) { super.onAttach(context); host=(Activity)context; }
    @Override public View onCreateView(LayoutInflater inflater,ViewGroup container,Bundle state) {
        content=NativeToolTabs.content(this,host,state);
        frame=new NativeToolTabSwipeLayout(host,this);frame.setOrientation(LinearLayout.VERTICAL);
        header=new LinearLayout(host);header.setGravity(Gravity.CENTER_VERTICAL);
        String tool=NativeToolTabs.tool(getArguments());
        title=new TextView(host);title.setSingleLine(true);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        title.setTextSize("search".equals(tool)?18:15);
        title.setGravity(Gravity.CENTER_VERTICAL);
        title.setText(getArguments().getString(android.content.Intent.EXTRA_TITLE,""));
        title.setPadding(Math.round(12*host.getResources().getDisplayMetrics().density),0,0,0);
        header.addView(title,new LinearLayout.LayoutParams(0,-1,1));
        close=new OutlinedClose(host);
        close.setText("×");
        close.setTextSize(20);
        close.setTextColor(Color.rgb(55,55,60));
        close.setGravity(Gravity.CENTER);
        close.setContentDescription("このタブを閉じる");
        close.setBackground(null);
        View.OnClickListener closeAction=view -> {
            Activity current=host;
            if(current!=null&&!NativeToolTabs.closeCurrentTab(current,NativeToolFragment.this))
                android.widget.Toast.makeText(current,"この画面のタブを閉じられませんでした",android.widget.Toast.LENGTH_SHORT).show();
        };
        close.setOnClickListener(closeAction);
        if("search".equals(tool)){
            title.setOnClickListener(closeAction);
            title.setContentDescription("投稿を探すタブを閉じる");
        }
        int width=Math.round(64*host.getResources().getDisplayMetrics().density);
        header.addView(close,new LinearLayout.LayoutParams(width,-1));
        applyHeaderHeight(NativeToolTabs.headerHeightDp(host));
        frame.addView(header,new LinearLayout.LayoutParams(-1,Math.round(NativeToolTabs.headerHeightDp(host)*host.getResources().getDisplayMetrics().density)));
        if("hissi".equals(tool)||"checker".equals(tool)||"eddi".equals(tool))header.setVisibility(View.GONE);
        frame.addView(content.view,new LinearLayout.LayoutParams(-1,0,1));
        preferences=host.getSharedPreferences(WacchoiSearchOptions.PREFS,0);
        preferences.registerOnSharedPreferenceChangeListener(headerListener);
        updateHeader();
        if("eddi".equals(tool)&&android.os.Build.VERSION.SDK_INT>=33)
            releaseArchiveBack=ArchiveBack.attach(frame,host,()->{
                if(!NativeToolTabs.closeCurrentTab(host,this))
                    android.widget.Toast.makeText(host,"この画面のタブを閉じられませんでした",android.widget.Toast.LENGTH_SHORT).show();
            });
        return frame;
    }
    /** Only the visible archive pane intercepts system Back; hidden tabs release it. */
    private static final class ArchiveBack {
        static Runnable attach(View view,Activity activity,Runnable close){
            android.window.OnBackInvokedDispatcher dispatcher=activity.getOnBackInvokedDispatcher();
            android.window.OnBackInvokedCallback callback=close::run;
            boolean[] registered={false};
            android.view.ViewTreeObserver.OnGlobalLayoutListener listener=()->{
                boolean visible=view.isShown()&&view.isAttachedToWindow();
                if(visible==registered[0])return;
                if(visible)dispatcher.registerOnBackInvokedCallback(android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT,callback);
                else dispatcher.unregisterOnBackInvokedCallback(callback);
                registered[0]=visible;
            };
            view.getViewTreeObserver().addOnGlobalLayoutListener(listener);
            return ()->{
                if(view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnGlobalLayoutListener(listener);
                if(registered[0])dispatcher.unregisterOnBackInvokedCallback(callback);
            };
        }
    }
    private void updateHeader(){
        if(host==null||frame==null||header==null)return;
        int[] colors=HaiagaruUi.toolTabHeaderColors(host);
        frame.setBackgroundColor(colors[0]);header.setBackgroundColor(colors[0]);
        title.setTextColor(colors[1]);close.setTextColor(colors[1]);
        ViewGroup.LayoutParams params=header.getLayoutParams();
        if(params!=null&&params.height!=Math.round(NativeToolTabs.headerHeightDp(host)*host.getResources().getDisplayMetrics().density))
            applyHeaderHeight(NativeToolTabs.headerHeightDp(host));
    }
    private void applyHeaderHeight(int dp){
        if(host==null||header==null)return;
        int bounded=Math.max(48,Math.min(80,dp));
        ViewGroup.LayoutParams params=header.getLayoutParams();
        if(params==null)params=new LinearLayout.LayoutParams(-1,Math.round(bounded*host.getResources().getDisplayMetrics().density));
        else params.height=Math.round(bounded*host.getResources().getDisplayMetrics().density);
        header.setLayoutParams(params);
    }
    /** Transparent hit target with a black/white double outline, independent of the theme. */
    private static final class OutlinedClose extends TextView {
        OutlinedClose(Context context){super(context);setFocusable(true);}
        @Override protected void onDraw(Canvas canvas){
            Paint paint=new Paint(getPaint());paint.setAntiAlias(true);
            String glyph="×";float density=getResources().getDisplayMetrics().density;
            float x=(getWidth()-paint.measureText(glyph))/2;
            Paint.FontMetrics metrics=paint.getFontMetrics();
            float y=(getHeight()-metrics.ascent-metrics.descent)/2;
            paint.setStyle(Paint.Style.STROKE);paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStrokeWidth(3.5f*density);paint.setColor(Color.BLACK);canvas.drawText(glyph,x,y,paint);
            paint.setStrokeWidth(1.8f*density);paint.setColor(Color.WHITE);canvas.drawText(glyph,x,y,paint);
            paint.setStyle(Paint.Style.FILL);paint.setColor(getCurrentTextColor());canvas.drawText(glyph,x,y,paint);
        }
    }
    // Native list-fragment initialization assumes a native ListView. This tool owns its view tree.
    @Override public void onViewCreated(View view,Bundle state) { }
    @Override public void onPause() {
        if(content!=null)content.pause();
        if(content!=null)content.save(new Bundle());
        super.onPause();
    }
    @Override public void onResume(){super.onResume();updateHeader();if(content!=null)content.resume();
        if(frame!=null)frame.post(()->NativeToolTabs.restoreToolVisibility(frame));}
    @Override public void onSaveInstanceState(Bundle state) {
        if(content!=null)content.save(state);
        super.onSaveInstanceState(state);
    }
    @Override public void onDestroyView() {
        if(releaseArchiveBack!=null){releaseArchiveBack.run();releaseArchiveBack=null;}
        if(preferences!=null){preferences.unregisterOnSharedPreferenceChangeListener(headerListener);preferences=null;}
        frame=null;header=null;title=null;close=null;
        if(content!=null){content.save(new Bundle());content.close();content=null;}
        super.onDestroyView();
    }
    public void openSettingsFile(){
        startActivityForResult(new Intent(Intent.ACTION_OPEN_DOCUMENT).setType("*/*").addCategory(Intent.CATEGORY_OPENABLE),SettingsProfiles.OPEN);
    }
    @Override public void onActivityResult(int request,int result,Intent data){
        super.onActivityResult(request,result,data);
        if(request==SettingsProfiles.OPEN&&result==Activity.RESULT_OK&&data!=null&&data.getData()!=null&&host!=null)
            host.startActivity(new Intent(host,SettingsImportActivity.class).setData(data.getData()).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION));
    }
    @Override public void onDetach(){host=null;super.onDetach();}
}
