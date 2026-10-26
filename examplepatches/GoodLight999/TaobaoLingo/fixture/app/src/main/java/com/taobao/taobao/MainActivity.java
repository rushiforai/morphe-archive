package com.taobao.taobao;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.text.SpannableString;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import tb.gi6;
import tb.cx5;

/**
 * Runtime integration fixture. All labels are actually passed through the
 * two hook targets, not manually translated or mocked.
 * This APK is NOT Taobao; its pass cannot establish Taobao runtime behavior.
 */
public final class MainActivity extends Activity {
    private static final String TAG = "TaobaoLingoFixture";
    private static final long TEXT = 38178040921L;

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setPadding(25, 25, 25, 25);
        add(layout, "SYNTHETIC NATIVE DEX FIXTURE (NOT TAOBAO)");

        gi6 standard = new gi6();
        standard.setText("我的淘宝");
        add(layout, "BUTTER_SET=" + standard.text);

        standard.setText(new SpannableString("我的淘宝"));
        add(layout, "BUTTER_SPANNABLE= " + standard.text);

        standard.onSetStringAttribute(TEXT, "我的订单");
        add(layout, "BUTTER_ATTR=" + standard.text);

        standard.onSetStringAttribute(0x12345L, "搜索");
        add(layout, "BUTTER_OTHER=" + standard.style);

        cx5 fast = new cx5();
        fast.setText("搜索");
        add(layout, "FAST_SET=" + fast.text);

        fast.setText(new SpannableString("搜索"));
        add(layout, "FAST_SPANNABLE= " + fast.text);

        fast.onSetStringAttribute(TEXT, "购物车");
        add(layout, "FAST_ATTR=" + fast.text);

        fast.onSetStringAttribute(0x67890L, "设置");
        add(layout, "FAST_OTHER=" + fast.style);

        fast.setText("未收录的专有名词");
        add(layout, "UNMAPPED=" + fast.text);

        fast.setText(null);
        add(layout, "NULL=" + String.valueOf(fast.text));

        ScrollView view = new ScrollView(this);
        view.addView(layout);
        setContentView(view);
        Log.i(TAG, "RENDER_COMPLETE");
    }
    private void add(LinearLayout root, String line) {
        TextView text = new TextView(this);
        text.setText(line);
        text.setTextSize(17);
        root.addView(text);
        Log.i(TAG, line);
    }
}
