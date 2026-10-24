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
    private LinearLayout frame, header;
    private TextView title, close;
    private android.content.SharedPreferences preferences;
    private final android.content.SharedPreferences.OnSharedPreferenceChangeListener headerListener=(prefs,key)->{
        if(NativeToolTabs.HEADER_HEIGHT_KEY.equals(key)&&host!=null)host.runOnUiThread(this::updateHeader);
    };
    @Override public void onAttach(Context context) { super.onAttach(context); host=(Activity)context; }
    @Override public View onCreateView(LayoutInflater inflater,ViewGroup container,Bundle state) {
        content=NativeToolTabs.content(this,host,state);
        frame=new NativeToolTabSwipeLayout(host,this);frame.setOrientation(LinearLayout.VERTICAL);
        header=new LinearLayout(host);header.setGravity(Gravity.CENTER_VERTICAL);
        title=new TextView(host);title.setSingleLine(true);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        title.setText(getArguments().getString(android.content.Intent.EXTRA_TITLE,""));
        title.setPadding(Math.round(12*host.getResources().getDisplayMetrics().density),0,0,0);
        header.addView(title,new LinearLayout.LayoutParams(0,-1,1));
        close=new OutlinedClose(host);
        close.setText("×");
        close.setTextSize(24);
        close.setTextColor(Color.rgb(55,55,60));
        close.setGravity(Gravity.CENTER);
        close.setContentDescription("このタブを閉じる");
        close.setBackground(null);
        close.setOnClickListener(view -> {
            Activity current=host;
            if(current!=null&&!NativeToolTabs.closeCurrentTab(current,NativeToolFragment.this))
                android.widget.Toast.makeText(current,"この画面のタブを閉じられませんでした",android.widget.Toast.LENGTH_SHORT).show();
        });
        int size=Math.round(48*host.getResources().getDisplayMetrics().density);
        header.addView(close,new LinearLayout.LayoutParams(size,-1));
        frame.addView(header,new LinearLayout.LayoutParams(-1,size));
        frame.addView(content.view,new LinearLayout.LayoutParams(-1,0,1));
        preferences=host.getSharedPreferences(WacchoiSearchOptions.PREFS,0);
        preferences.registerOnSharedPreferenceChangeListener(headerListener);
        updateHeader();
        return frame;
    }
    private void updateHeader(){
        if(host==null||frame==null||header==null)return;
        int[] colors=HaiagaruUi.toolTabHeaderColors(host);
        frame.setBackgroundColor(colors[0]);header.setBackgroundColor(colors[0]);
        title.setTextColor(colors[1]);close.setTextColor(colors[1]);
        ViewGroup.LayoutParams params=header.getLayoutParams();
        params.height=Math.round(NativeToolTabs.headerHeightDp(host)*host.getResources().getDisplayMetrics().density);
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
            paint.setStrokeWidth(5*density);paint.setColor(Color.BLACK);canvas.drawText(glyph,x,y,paint);
            paint.setStrokeWidth(3*density);paint.setColor(Color.WHITE);canvas.drawText(glyph,x,y,paint);
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
    @Override public void onResume(){super.onResume();updateHeader();if(content!=null)content.resume();}
    @Override public void onSaveInstanceState(Bundle state) {
        if(content!=null)content.save(state);
        super.onSaveInstanceState(state);
    }
    @Override public void onDestroyView() {
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
