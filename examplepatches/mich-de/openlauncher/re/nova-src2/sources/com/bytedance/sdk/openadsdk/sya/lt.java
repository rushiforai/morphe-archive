package com.bytedance.sdk.openadsdk.sya;

import android.content.Context;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.utils.dc;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class lt extends ScrollView {
    private final jc ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.core.lt.lud f27012zb;

    public lt(Context context, jc jcVar) {
        super(context);
        this.ycx = jcVar;
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        this.f27012zb = ludVar;
        ludVar.setOrientation(1);
        addView(ludVar, new FrameLayout.LayoutParams(-1, -2));
        if (jcVar.fby() == 0) {
            ycx();
        }
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, 0);
        layoutParams.weight = 1.0f;
        setLayoutParams(layoutParams);
        setVerticalScrollBarEnabled(false);
    }

    private static List<FilterWord> sya(List<FilterWord> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        int i5 = 0;
        int i11 = -1;
        for (int i12 = 0; i12 < list.size(); i12++) {
            if (list.get(i12).hasSecondOptions()) {
                i11 = i12;
            }
        }
        if (i11 != -1 && i11 <= list.size()) {
            i5 = i11;
        }
        FilterWord filterWord = list.get(i5);
        Iterator<FilterWord> it = list.iterator();
        while (it.hasNext()) {
            FilterWord next = it.next();
            if (!next.hasSecondOptions()) {
                filterWord.addOption(next);
                it.remove();
            }
        }
        return list;
    }

    private void ycx() {
        if (this.ycx.fby() != 0) {
            return;
        }
        this.ycx.ycx(dc.dj(getContext()), dc.lt(getContext()));
    }

    private void zb(List<FilterWord> list) {
        this.f27012zb.removeAllViews();
        for (int i5 = 0; i5 < list.size(); i5++) {
            FilterWord filterWord = list.get(i5);
            if (filterWord != null) {
                this.f27012zb.addView(new ul(getContext(), filterWord, this.ycx));
            }
            if (i5 < list.size() - 1) {
                LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
                int iZb = dc.zb(getContext(), this.ycx.jw() ? 16.0f : 8.0f);
                layoutParams.topMargin = iZb;
                layoutParams.bottomMargin = iZb;
                this.f27012zb.addView(new ea(getContext()), layoutParams);
            }
        }
    }

    public void ycx(List<FilterWord> list) {
        List<FilterWord> listSya = sya(list);
        if (listSya == null) {
            return;
        }
        zb(listSya);
    }
}
