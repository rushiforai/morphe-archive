package com.bytedance.sdk.openadsdk.xkz.ycx;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Build;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.a2;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.s2;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.core.lt.dj;
import com.bytedance.sdk.openadsdk.core.lt.fby;
import com.bytedance.sdk.openadsdk.core.lt.lud;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.vungle.ads.internal.protos.Sdk;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/* loaded from: classes2.dex */
public class zb extends m1 {
    private InterfaceC0118zb lud;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private List<Object> f27434zb = new ArrayList();
    private List<com.bytedance.sdk.openadsdk.xkz.ycx.ycx> sya = new ArrayList();

    /* renamed from: dj, reason: collision with root package name */
    private List<com.bytedance.sdk.openadsdk.xkz.ycx.ycx> f27433dj = new ArrayList();

    public class sya extends s2 {
        fby ycx;

        public sya(View view) {
            super(view);
            this.ycx = (fby) view;
        }
    }

    public class ycx extends s2 {

        /* renamed from: dj, reason: collision with root package name */
        fby f27437dj;
        fby sya;
        dj ycx;

        /* renamed from: zb, reason: collision with root package name */
        fby f27438zb;

        public ycx(View view) {
            super(view);
            View[] viewArr = (View[]) view.getTag();
            this.ycx = (dj) viewArr[0];
            this.f27438zb = (fby) viewArr[1];
            this.sya = (fby) viewArr[2];
            this.f27437dj = (fby) viewArr[3];
            view.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.xkz.ycx.zb.ycx.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    int adapterPosition = ycx.this.getAdapterPosition();
                    if (adapterPosition != -1) {
                        Object obj = zb.this.f27434zb.get(adapterPosition);
                        if (obj instanceof com.bytedance.sdk.openadsdk.xkz.ycx.ycx) {
                            zb.this.ycx((com.bytedance.sdk.openadsdk.xkz.ycx.ycx) obj);
                        }
                    }
                }
            });
        }

        public void ycx(com.bytedance.sdk.openadsdk.xkz.ycx.ycx ycxVar) {
            try {
                String strLud = ycxVar.lud();
                this.f27438zb.setText(ycxVar.dj());
                this.sya.setText(strLud);
                this.f27437dj.setText(new SimpleDateFormat("MMM dd · HH:mm", Locale.US).format(new Date(Long.parseLong(ycxVar.lt()))));
                this.ycx.setImageResource(2131232363);
                if (TextUtils.isEmpty(strLud)) {
                    return;
                }
                com.bytedance.sdk.openadsdk.jc.dj.ycx(com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.ycx().ycx(strLud)).sya(1).ycx(this.ycx);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7k=", "cs8PvQqvfciSU+RYjwWpJ1XPKZQTqGzVxGLeTpgesjFy+iiYNbVs0KhF21mJAw==", "WecjkQ==", 359);
                htf.ycx("IABHSecAdapter", "bind error: ", e3);
            }
        }
    }

    /* renamed from: com.bytedance.sdk.openadsdk.xkz.ycx.zb$zb, reason: collision with other inner class name */
    public interface InterfaceC0118zb {
        void ycx(com.bytedance.sdk.openadsdk.xkz.ycx.ycx ycxVar);
    }

    public zb(Context context) {
        this.ycx = context.getApplicationContext();
    }

    private lud zb() {
        lud ludVar = new lud(this.ycx);
        ludVar.setOrientation(0);
        ludVar.setLayoutParams(new a2(-1, ycx(84.0f)));
        ludVar.setPadding(ycx(16.0f), ycx(10.0f), ycx(16.0f), ycx(10.0f));
        lud ludVar2 = new lud(this.ycx);
        ludVar2.setOrientation(1);
        dj djVar = new dj(this.ycx);
        djVar.setId(View.generateViewId());
        djVar.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        djVar.setAdjustViewBounds(true);
        djVar.setLayoutParams(new LinearLayout.LayoutParams(ycx(64.0f), ycx(64.0f)));
        ludVar2.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        ludVar2.setPadding(ycx(8.0f), ycx(0.0f), ycx(0.0f), ycx(0.0f));
        fby fbyVar = new fby(this.ycx);
        fbyVar.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        int i5 = Build.VERSION.SDK_INT;
        fbyVar.setTextAppearance(16974331);
        Typeface typefaceCreate = i5 >= 28 ? Typeface.create(fbyVar.getTypeface(), 500, false) : null;
        if (typefaceCreate != null) {
            fbyVar.setTypeface(typefaceCreate);
        }
        fbyVar.setLineSpacing(0.0f, 1.3f);
        fbyVar.setLetterSpacing(0.0067f);
        fbyVar.setTextColor(Color.argb(255, 0, 0, 0));
        fbyVar.setMaxLines(1);
        TextUtils.TruncateAt truncateAt = TextUtils.TruncateAt.END;
        fbyVar.setEllipsize(truncateAt);
        fbyVar.setId(View.generateViewId());
        fbyVar.setTextSize(0, ycx(14.0f));
        fbyVar.setIncludeFontPadding(false);
        fby fbyVar2 = new fby(this.ycx);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.topMargin = ycx(4.0f);
        fbyVar2.setLayoutParams(layoutParams);
        Typeface typefaceCreate2 = i5 >= 28 ? Typeface.create(fbyVar.getTypeface(), Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, false) : null;
        if (typefaceCreate2 != null) {
            fbyVar2.setTypeface(typefaceCreate2);
        }
        fbyVar2.setLineSpacing(0.0f, 1.3f);
        fbyVar2.setLetterSpacing(0.0067f);
        fbyVar2.setTextColor(Color.argb(166, 0, 0, 0));
        fbyVar2.setMaxLines(1);
        fbyVar2.setEllipsize(truncateAt);
        fbyVar2.setId(View.generateViewId());
        fbyVar2.setTextSize(0, ycx(14.0f));
        fbyVar2.setIncludeFontPadding(false);
        fby fbyVar3 = new fby(this.ycx);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams2.topMargin = ycx(8.0f);
        fbyVar3.setLayoutParams(layoutParams2);
        fbyVar3.setTextAppearance(16974321);
        fbyVar3.setTextColor(Color.argb(166, 0, 0, 0));
        fbyVar3.setId(View.generateViewId());
        Typeface typefaceCreate3 = i5 >= 28 ? Typeface.create(fbyVar.getTypeface(), Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, false) : null;
        if (typefaceCreate3 != null) {
            fbyVar3.setTypeface(typefaceCreate3);
        }
        fbyVar3.setLineSpacing(0.0f, 1.3f);
        fbyVar3.setLetterSpacing(0.0067f);
        fbyVar3.setTextColor(Color.argb(166, 0, 0, 0));
        fbyVar3.setMaxLines(1);
        fbyVar3.setEllipsize(truncateAt);
        fbyVar3.setId(View.generateViewId());
        fbyVar3.setTextSize(0, ycx(12.0f));
        fbyVar3.setIncludeFontPadding(false);
        ludVar.addView(djVar);
        ludVar.addView(ludVar2);
        ludVar2.addView(fbyVar);
        ludVar2.addView(fbyVar2);
        ludVar2.addView(fbyVar3);
        ludVar.setTag(new View[]{djVar, fbyVar, fbyVar2, fbyVar3});
        return ludVar;
    }

    @Override // androidx.recyclerview.widget.m1
    public int getItemCount() {
        return this.f27434zb.size();
    }

    @Override // androidx.recyclerview.widget.m1
    public int getItemViewType(int i5) {
        return this.f27434zb.get(i5) instanceof String ? 0 : 1;
    }

    @Override // androidx.recyclerview.widget.m1
    public void onBindViewHolder(s2 s2Var, int i5) {
        Object obj = this.f27434zb.get(i5);
        if (s2Var.getItemViewType() == 0) {
            ((sya) s2Var).ycx.setText((String) obj);
        } else {
            ((ycx) s2Var).ycx((com.bytedance.sdk.openadsdk.xkz.ycx.ycx) obj);
        }
    }

    @Override // androidx.recyclerview.widget.m1
    public s2 onCreateViewHolder(ViewGroup viewGroup, int i5) {
        if (i5 != 0) {
            return new ycx(zb());
        }
        fby fbyVar = new fby(this.ycx);
        fbyVar.setPadding(ycx(16.0f), ycx(8.0f), 0, ycx(8.0f));
        fbyVar.setTextSize(14.0f);
        int i11 = Build.VERSION.SDK_INT;
        fbyVar.setTextAppearance(16974331);
        Typeface typefaceCreate = i11 >= 28 ? Typeface.create(fbyVar.getTypeface(), 500, false) : null;
        if (typefaceCreate != null) {
            fbyVar.setTypeface(typefaceCreate);
        }
        fbyVar.setTextColor(Color.argb(167, 0, 0, 0));
        fbyVar.setLayoutParams(new a2(-1, -2));
        return new sya(fbyVar);
    }

    public void ycx(InterfaceC0118zb interfaceC0118zb) {
        this.lud = interfaceC0118zb;
    }

    @SuppressLint({"NotifyDataSetChanged"})
    public void ycx(List<com.bytedance.sdk.openadsdk.xkz.ycx.ycx> list) {
        this.sya.clear();
        this.f27433dj.clear();
        if (list != null) {
            long jCurrentTimeMillis = System.currentTimeMillis() - 604800000;
            for (com.bytedance.sdk.openadsdk.xkz.ycx.ycx ycxVar : list) {
                try {
                    if (Long.parseLong(ycxVar.lt()) >= jCurrentTimeMillis) {
                        this.sya.add(ycxVar);
                    } else {
                        this.f27433dj.add(ycxVar);
                    }
                } catch (NumberFormatException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7k=", "cs8PvQqvfciSU+RYjwWpJ1XPKZQTqGzV", "SOs5tA+wTcaUSw==", 79);
                    this.sya.add(ycxVar);
                }
            }
        }
        ycx();
        notifyDataSetChanged();
    }

    private void ycx() {
        this.f27434zb.clear();
        if (!this.sya.isEmpty()) {
            List<Object> list = this.f27434zb;
            Context context = this.ycx;
            list.add(context.getString(wwx.zb(context, "tt_history_this_week")));
            this.f27434zb.addAll(this.sya);
        }
        if (this.f27433dj.isEmpty()) {
            return;
        }
        List<Object> list2 = this.f27434zb;
        Context context2 = this.ycx;
        list2.add(context2.getString(wwx.zb(context2, "tt_history_a_week_ago")));
        this.f27434zb.addAll(this.f27433dj);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(com.bytedance.sdk.openadsdk.xkz.ycx.ycx ycxVar) {
        InterfaceC0118zb interfaceC0118zb = this.lud;
        if (interfaceC0118zb != null) {
            interfaceC0118zb.ycx(ycxVar);
        }
    }

    private int ycx(float f11) {
        return dc.zb(this.ycx, f11);
    }
}
