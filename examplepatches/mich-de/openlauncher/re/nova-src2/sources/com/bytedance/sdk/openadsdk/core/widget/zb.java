package com.bytedance.sdk.openadsdk.core.widget;

import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.window.OnBackInvokedCallback;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.oty;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class zb extends Dialog {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.fby f26387dj;

    /* renamed from: dy, reason: collision with root package name */
    private boolean f26388dy;

    /* renamed from: ea, reason: collision with root package name */
    private String f26389ea;
    private final Context fby;

    /* renamed from: jc, reason: collision with root package name */
    private String f26390jc;

    /* renamed from: jw, reason: collision with root package name */
    private String f26391jw;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.ycx f26392lt;
    private com.bytedance.sdk.openadsdk.core.lt.ycx lud;

    /* renamed from: ok, reason: collision with root package name */
    private String f26393ok;
    private float pmi;

    /* renamed from: ry, reason: collision with root package name */
    private int f26394ry;
    private com.bytedance.sdk.openadsdk.core.lt.fby sya;
    private boolean syc;

    /* renamed from: uh, reason: collision with root package name */
    private int f26395uh;

    /* renamed from: ul, reason: collision with root package name */
    private View f26396ul;
    private int wie;
    private OnBackInvokedCallback xkz;
    public InterfaceC0090zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.dj f26397zb;

    public static class ycx implements OnBackInvokedCallback {
        private final WeakReference<zb> ycx;

        public ycx(zb zbVar) {
            this.ycx = new WeakReference<>(zbVar);
        }

        public void onBackInvoked() {
            zb zbVar = this.ycx.get();
            if (zbVar != null) {
                com.bytedance.sdk.component.utils.htf.ycx("CustomCommonDialog", "onBackInvoked");
                zbVar.onBackPressed();
            }
        }
    }

    /* renamed from: com.bytedance.sdk.openadsdk.core.widget.zb$zb, reason: collision with other inner class name */
    public interface InterfaceC0090zb {
        void ycx();

        void zb();
    }

    public zb(Context context) {
        super(context, wwx.lt(context, "tt_custom_dialog"));
        this.f26394ry = -1;
        this.syc = false;
        this.f26388dy = false;
        this.fby = context;
    }

    private void sya() {
        if (this.xkz == null || !oty.ycx()) {
            return;
        }
        com.bytedance.sdk.component.utils.htf.ycx("CustomCommonDialog", "isAtLeastT unregisterOnBackInvokedCallback");
        getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(this.xkz);
    }

    private void ycx() {
        this.f26392lt.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.core.widget.zb.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                InterfaceC0090zb interfaceC0090zb = zb.this.ycx;
                if (interfaceC0090zb != null) {
                    interfaceC0090zb.ycx();
                }
            }
        });
        this.lud.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.core.widget.zb.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                InterfaceC0090zb interfaceC0090zb = zb.this.ycx;
                if (interfaceC0090zb != null) {
                    interfaceC0090zb.zb();
                }
            }
        });
    }

    private void zb() {
        if (TextUtils.isEmpty(this.f26390jc)) {
            this.sya.setVisibility(8);
        } else {
            this.sya.setText(this.f26390jc);
            this.sya.setVisibility(0);
        }
        if (!TextUtils.isEmpty(this.f26391jw)) {
            this.f26387dj.setText(this.f26391jw);
        }
        if (TextUtils.isEmpty(this.f26389ea)) {
            this.f26392lt.setText(wwx.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx(), "tt_postive_txt"));
        } else {
            this.f26392lt.setText(this.f26389ea);
        }
        if (TextUtils.isEmpty(this.f26393ok)) {
            this.lud.setText(wwx.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx(), "tt_negtive_txt"));
        } else {
            this.lud.setText(this.f26393ok);
        }
        int i5 = this.f26394ry;
        if (i5 != -1) {
            this.f26397zb.setImageResource(i5);
            this.f26397zb.setVisibility(0);
        } else {
            this.f26397zb.setVisibility(8);
        }
        if (this.syc) {
            this.f26396ul.setVisibility(8);
            this.lud.setVisibility(8);
        } else {
            this.lud.setVisibility(0);
            this.f26396ul.setVisibility(0);
        }
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        super.dismiss();
        sya();
    }

    public zb dj(String str) {
        this.f26393ok = str;
        return this;
    }

    @Override // android.app.Dialog
    public void onBackPressed() {
        com.bytedance.sdk.component.utils.htf.ycx("CustomCommonDialog", "onBackPressed");
    }

    @Override // android.app.Dialog
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        boolean zAv = com.bytedance.sdk.openadsdk.core.pmi.dj().av();
        this.f26388dy = zAv;
        if (zAv) {
            this.wie = Color.argb(166, 0, 0, 0);
            this.pmi = 16.0f;
            this.f26395uh = Color.parseColor("#000000");
            setContentView(zb(this.fby));
        } else {
            setContentView(ycx(this.fby));
        }
        if (oty.ycx()) {
            com.bytedance.sdk.component.utils.htf.ycx("CustomCommonDialog", "isAtLeastT registerOnBackInvokedCallback");
            this.xkz = new ycx(this);
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(0, this.xkz);
        }
        setCanceledOnTouchOutside(false);
        zb();
        ycx();
    }

    @Override // android.app.Dialog
    public void show() {
        super.show();
        zb();
    }

    private View ycx(Context context) {
        com.bytedance.sdk.openadsdk.core.lt.ul ulVar = new com.bytedance.sdk.openadsdk.core.lt.ul(context);
        ulVar.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(13);
        ludVar.setMinimumWidth(ycx(260.0f));
        ludVar.setPadding(0, ycx(32.0f), 0, 0);
        ludVar.setBackground(com.bytedance.sdk.openadsdk.utils.ea.ycx(context, "tt_custom_dialog_bg"));
        ludVar.setOrientation(1);
        ludVar.setLayoutParams(layoutParams);
        this.sya = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams2.gravity = 17;
        layoutParams2.leftMargin = ycx(16.0f);
        layoutParams2.rightMargin = ycx(16.0f);
        layoutParams2.bottomMargin = ycx(16.0f);
        this.sya.setGravity(17);
        this.sya.setVisibility(0);
        this.sya.setTextColor(Color.parseColor("#333333"));
        this.sya.setTextSize(18.0f);
        this.sya.setLayoutParams(layoutParams2);
        this.f26397zb = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams3.gravity = 17;
        layoutParams3.leftMargin = ycx(16.0f);
        layoutParams3.rightMargin = ycx(16.0f);
        layoutParams3.bottomMargin = ycx(10.0f);
        this.f26397zb.setMaxHeight(ycx(150.0f));
        this.f26397zb.setMaxWidth(ycx(150.0f));
        this.f26397zb.setVisibility(0);
        this.f26397zb.setLayoutParams(layoutParams3);
        this.f26387dj = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams4.leftMargin = ycx(20.0f);
        layoutParams4.rightMargin = ycx(20.0f);
        this.f26387dj.setGravity(17);
        this.f26387dj.setLineSpacing(ycx(3.0f), 1.2f);
        this.f26387dj.setTextSize(18.0f);
        this.f26387dj.setTextColor(Color.parseColor("#000000"));
        this.f26387dj.setLayoutParams(layoutParams4);
        View view = new View(context);
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(-1, 1);
        layoutParams5.topMargin = ycx(32.0f);
        view.setBackgroundColor(Color.parseColor("#E4E4E4"));
        view.setLayoutParams(layoutParams5);
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar2 = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        LinearLayout.LayoutParams layoutParams6 = new LinearLayout.LayoutParams(-1, -2);
        ludVar2.setOrientation(0);
        ludVar2.setLayoutParams(layoutParams6);
        com.bytedance.sdk.openadsdk.core.lt.ycx ycxVar = new com.bytedance.sdk.openadsdk.core.lt.ycx(context);
        this.lud = ycxVar;
        ycxVar.setId(520093718);
        LinearLayout.LayoutParams layoutParams7 = new LinearLayout.LayoutParams(0, -2);
        layoutParams7.leftMargin = ycx(10.0f);
        layoutParams7.weight = 1.0f;
        this.lud.setPadding(0, ycx(16.0f), 0, ycx(16.0f));
        this.lud.setBackground(null);
        this.lud.setGravity(17);
        this.lud.setSingleLine(true);
        this.lud.setTextColor(Color.parseColor("#999999"));
        this.lud.setTextSize(16.0f);
        this.lud.setLayoutParams(layoutParams7);
        this.f26396ul = new View(context);
        LinearLayout.LayoutParams layoutParams8 = new LinearLayout.LayoutParams(1, -1);
        this.f26396ul.setBackgroundColor(Color.parseColor("#E4E4E4"));
        this.f26396ul.setLayoutParams(layoutParams8);
        com.bytedance.sdk.openadsdk.core.lt.ycx ycxVar2 = new com.bytedance.sdk.openadsdk.core.lt.ycx(context);
        this.f26392lt = ycxVar2;
        ycxVar2.setId(520093719);
        LinearLayout.LayoutParams layoutParams9 = new LinearLayout.LayoutParams(0, -2);
        layoutParams9.rightMargin = ycx(10.0f);
        layoutParams9.weight = 1.0f;
        this.f26392lt.setPadding(0, ycx(16.0f), 0, ycx(16.0f));
        this.f26392lt.setBackground(null);
        this.f26392lt.setGravity(17);
        this.f26392lt.setSingleLine(true);
        this.f26392lt.setTextColor(Color.parseColor("#38ADFF"));
        this.f26392lt.setTextSize(16.0f);
        this.f26392lt.setLayoutParams(layoutParams9);
        ulVar.addView(ludVar);
        ludVar.addView(this.sya);
        ludVar.addView(this.f26397zb);
        ludVar.addView(this.f26387dj);
        ludVar.addView(view);
        ludVar.addView(ludVar2);
        ludVar2.addView(this.lud);
        ludVar2.addView(this.f26396ul);
        ludVar2.addView(this.f26392lt);
        return ulVar;
    }

    public zb sya(String str) {
        this.f26389ea = str;
        return this;
    }

    private View zb(Context context) {
        com.bytedance.sdk.openadsdk.core.lt.ul ulVar = new com.bytedance.sdk.openadsdk.core.lt.ul(context);
        ulVar.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(13);
        ludVar.setMinimumWidth(ycx(280.0f));
        ludVar.setPadding(0, ycx(32.0f), 0, 0);
        ludVar.setBackground(com.bytedance.sdk.openadsdk.utils.ea.ycx(context, "tt_custom_dialog_bg_new"));
        ludVar.setOrientation(1);
        ludVar.setLayoutParams(layoutParams);
        this.sya = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams2.gravity = 17;
        layoutParams2.leftMargin = ycx(16.0f);
        layoutParams2.rightMargin = ycx(16.0f);
        layoutParams2.bottomMargin = ycx(16.0f);
        this.sya.setGravity(17);
        this.sya.setVisibility(0);
        this.sya.setTextColor(Color.parseColor("#333333"));
        this.sya.setTextSize(20.0f);
        this.sya.setTypeface(Typeface.defaultFromStyle(1));
        this.sya.setLineSpacing(0.0f, 1.3f);
        this.sya.setLetterSpacing(0.015f);
        this.sya.setLayoutParams(layoutParams2);
        this.f26397zb = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams3.gravity = 17;
        layoutParams3.leftMargin = ycx(16.0f);
        layoutParams3.rightMargin = ycx(16.0f);
        layoutParams3.bottomMargin = ycx(10.0f);
        this.f26397zb.setMaxHeight(ycx(150.0f));
        this.f26397zb.setMaxWidth(ycx(150.0f));
        this.f26397zb.setVisibility(0);
        this.f26397zb.setLayoutParams(layoutParams3);
        this.f26387dj = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams4.leftMargin = ycx(20.0f);
        layoutParams4.rightMargin = ycx(20.0f);
        this.f26387dj.setGravity(17);
        this.f26387dj.setLineSpacing(0.0f, 1.3f);
        this.f26387dj.setLetterSpacing(0.004f);
        this.f26387dj.setTextSize(15.0f);
        this.f26387dj.setTextColor(this.wie);
        this.f26387dj.setLayoutParams(layoutParams4);
        View view = new View(context);
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(-1, 1);
        layoutParams5.topMargin = ycx(32.0f);
        view.setBackgroundColor(Color.parseColor("#E4E4E4"));
        view.setLayoutParams(layoutParams5);
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar2 = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        LinearLayout.LayoutParams layoutParams6 = new LinearLayout.LayoutParams(-1, -2);
        ludVar2.setOrientation(0);
        ludVar2.setLayoutParams(layoutParams6);
        com.bytedance.sdk.openadsdk.core.lt.ycx ycxVar = new com.bytedance.sdk.openadsdk.core.lt.ycx(context);
        this.lud = ycxVar;
        ycxVar.setId(520093718);
        LinearLayout.LayoutParams layoutParams7 = new LinearLayout.LayoutParams(0, -2);
        layoutParams7.leftMargin = ycx(10.0f);
        layoutParams7.weight = 1.0f;
        this.lud.setPadding(0, ycx(16.0f), 0, ycx(16.0f));
        this.lud.setBackground(null);
        this.lud.setGravity(17);
        this.lud.setSingleLine(true);
        this.lud.setTextSize(2, this.pmi);
        this.lud.setLineSpacing(0.0f, 1.3f);
        this.lud.setLetterSpacing(0.0019f);
        this.lud.setTypeface(Typeface.defaultFromStyle(0));
        this.lud.setTextColor(ColorStateList.valueOf(this.wie));
        this.lud.setLayoutParams(layoutParams7);
        this.f26396ul = new View(context);
        LinearLayout.LayoutParams layoutParams8 = new LinearLayout.LayoutParams(1, -1);
        this.f26396ul.setBackgroundColor(Color.parseColor("#E4E4E4"));
        this.f26396ul.setLayoutParams(layoutParams8);
        com.bytedance.sdk.openadsdk.core.lt.ycx ycxVar2 = new com.bytedance.sdk.openadsdk.core.lt.ycx(context);
        this.f26392lt = ycxVar2;
        ycxVar2.setId(520093719);
        LinearLayout.LayoutParams layoutParams9 = new LinearLayout.LayoutParams(0, -2);
        layoutParams9.rightMargin = ycx(10.0f);
        layoutParams9.weight = 1.0f;
        this.f26392lt.setPadding(0, ycx(16.0f), 0, ycx(16.0f));
        this.f26392lt.setBackground(null);
        this.f26392lt.setGravity(17);
        this.f26392lt.setSingleLine(true);
        int i5 = Build.VERSION.SDK_INT;
        this.f26392lt.setTextAppearance(16974331);
        Typeface typefaceCreate = i5 >= 28 ? Typeface.create(this.f26392lt.getTypeface(), 500, false) : null;
        if (typefaceCreate != null) {
            this.f26392lt.setTypeface(typefaceCreate);
        }
        this.f26392lt.setLineSpacing(0.0f, 1.3f);
        this.f26392lt.setLetterSpacing(0.0019f);
        this.f26392lt.setTextColor(ColorStateList.valueOf(this.f26395uh));
        this.f26392lt.setTextSize(this.pmi);
        this.f26392lt.setLayoutParams(layoutParams9);
        ulVar.addView(ludVar);
        ludVar.addView(this.sya);
        ludVar.addView(this.f26397zb);
        ludVar.addView(this.f26387dj);
        ludVar.addView(view);
        ludVar.addView(ludVar2);
        ludVar2.addView(this.lud);
        ludVar2.addView(this.f26396ul);
        ludVar2.addView(this.f26392lt);
        return ulVar;
    }

    private int ycx(float f11) {
        return dc.zb(getContext(), f11);
    }

    public zb ycx(InterfaceC0090zb interfaceC0090zb) {
        this.ycx = interfaceC0090zb;
        return this;
    }

    public zb ycx(String str) {
        this.f26391jw = str;
        return this;
    }

    public zb zb(String str) {
        this.f26390jc = str;
        return this;
    }
}
