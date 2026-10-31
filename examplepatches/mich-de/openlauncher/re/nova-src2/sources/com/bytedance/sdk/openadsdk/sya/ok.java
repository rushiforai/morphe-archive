package com.bytedance.sdk.openadsdk.sya;

import a2.c;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Bundle;
import android.text.Editable;
import android.text.InputFilter;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Locale;

/* loaded from: classes2.dex */
public class ok extends Dialog {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.fby f27017dj;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.dj f27018lt;
    private com.bytedance.sdk.openadsdk.core.lt.fby lud;
    private com.bytedance.sdk.openadsdk.core.lt.zb sya;

    /* renamed from: ul, reason: collision with root package name */
    private final jc f27019ul;
    private com.bytedance.sdk.openadsdk.core.lt.lud ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ycx f27020zb;

    public interface ycx {
        void sya();

        void ycx();

        void ycx(int i5, FilterWord filterWord, String str);

        void zb();
    }

    public ok(Context context, jc jcVar) {
        super(context, wwx.lt(context, "tt_quick_option_dialog"));
        setCanceledOnTouchOutside(false);
        this.f27019ul = jcVar;
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public void dismiss() {
        zb();
        super.dismiss();
    }

    @Override // android.app.Dialog
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        com.bytedance.sdk.openadsdk.core.lt.lud ludVarYcx = ycx(pmi.ycx());
        this.ycx = ludVarYcx;
        setContentView(ludVarYcx);
        ycx(this.ycx);
        sya();
        ycx();
        dj();
    }

    @Override // android.app.Dialog
    public void show() {
        super.show();
        ycx ycxVar = this.f27020zb;
        if (ycxVar != null) {
            ycxVar.ycx();
        }
    }

    private void dj() {
        setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.bytedance.sdk.openadsdk.sya.ok.5
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialogInterface) {
                if (ok.this.f27020zb != null) {
                    ok.this.f27020zb.sya();
                }
            }
        });
    }

    private void sya() {
        setCanceledOnTouchOutside(true);
        setCancelable(true);
        Window window = getWindow();
        if (window != null) {
            if (window.getDecorView() != null) {
                window.getDecorView().setPadding(0, 0, 0, 0);
            }
            WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.width = -1;
            attributes.height = -2;
            window.setAttributes(attributes);
            window.setGravity(80);
        }
    }

    private void ycx(View view) {
        ycx((EditText) this.sya);
        jc jcVar = this.f27019ul;
        if (jcVar != null) {
            String strUl = jcVar.ul();
            if (!TextUtils.isEmpty(strUl)) {
                this.sya.setText(strUl);
                this.f27017dj.setText(String.format(Locale.getDefault(), "%d%s", Integer.valueOf(strUl.length()), "/200"));
            }
            this.lud.setEnabled(!TextUtils.isEmpty(strUl));
        }
        this.lud.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.sya.ok.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                String string = ok.this.sya.getText().toString();
                if (ok.this.f27020zb != null) {
                    ok.this.f27020zb.ycx(4, jc.ycx, string);
                }
                ok.this.dismiss();
            }
        });
        this.f27018lt.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.sya.ok.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                if (ok.this.f27020zb != null) {
                    ok.this.f27020zb.zb();
                }
                ok.this.dismiss();
            }
        });
        this.sya.addTextChangedListener(new TextWatcher() { // from class: com.bytedance.sdk.openadsdk.sya.ok.3
            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
                com.bytedance.sdk.openadsdk.core.lt.fby fbyVar;
                int iRound = Math.round(charSequence.length());
                ok.this.f27017dj.setText(c.h(iRound, "/200"));
                boolean z11 = true;
                if (iRound <= 0) {
                    fbyVar = ok.this.lud;
                    if (ok.this.f27019ul == null || TextUtils.isEmpty(ok.this.f27019ul.ul())) {
                        z11 = false;
                    }
                } else if (ok.this.lud.isEnabled()) {
                    return;
                } else {
                    fbyVar = ok.this.lud;
                }
                fbyVar.setEnabled(z11);
            }
        });
    }

    public void zb() {
        InputMethodManager inputMethodManager;
        com.bytedance.sdk.openadsdk.core.lt.zb zbVar = this.sya;
        if (zbVar == null || (inputMethodManager = (InputMethodManager) zbVar.getContext().getSystemService("input_method")) == null) {
            return;
        }
        inputMethodManager.hideSoftInputFromWindow(this.ycx.getWindowToken(), 0);
    }

    public static void ycx(EditText editText) {
        editText.setFilters(new InputFilter[]{new InputFilter() { // from class: com.bytedance.sdk.openadsdk.sya.ok.4
            @Override // android.text.InputFilter
            public CharSequence filter(CharSequence charSequence, int i5, int i11, Spanned spanned, int i12, int i13) {
                while (i5 < i11) {
                    int type = Character.getType(charSequence.charAt(i5));
                    if (type == 19 || type == 28) {
                        return b.f42142b;
                    }
                    i5++;
                }
                return null;
            }
        }, new InputFilter.LengthFilter(200)});
    }

    public void ycx(ycx ycxVar) {
        this.f27020zb = ycxVar;
    }

    public void ycx() {
        com.bytedance.sdk.openadsdk.core.lt.zb zbVar = this.sya;
        if (zbVar == null) {
            return;
        }
        zbVar.requestFocus();
        Window window = getWindow();
        if (window != null) {
            window.setSoftInputMode(5);
        }
    }

    public void ycx(tn tnVar) {
        jc jcVar = this.f27019ul;
        if (jcVar != null) {
            jcVar.ycx(tnVar);
        }
    }

    private com.bytedance.sdk.openadsdk.core.lt.lud ycx(Context context) {
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        ludVar.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        ludVar.setOrientation(1);
        ludVar.setBackground(com.bytedance.sdk.openadsdk.utils.ea.ycx(context, "tt_dislike_dialog_bg"));
        com.bytedance.sdk.openadsdk.core.lt.ul ulVar = new com.bytedance.sdk.openadsdk.core.lt.ul(context);
        ulVar.setLayoutParams(new LinearLayout.LayoutParams(-1, dc.zb(context, 48.0f)));
        this.f27018lt = new com.bytedance.sdk.openadsdk.core.lt.dj(context);
        int iZb = dc.zb(context, 24.0f);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(iZb, iZb);
        layoutParams.addRule(16);
        layoutParams.addRule(11);
        int iZb2 = dc.zb(context, 10.0f);
        layoutParams.topMargin = iZb2;
        layoutParams.rightMargin = iZb2;
        this.f27018lt.setLayoutParams(layoutParams);
        this.f27018lt.setClickable(true);
        this.f27018lt.setFocusable(true);
        this.f27018lt.setImageDrawable(com.bytedance.sdk.openadsdk.utils.ea.ycx(context, "tt_titlebar_close_seletor"));
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(16);
        layoutParams2.topMargin = dc.zb(context, 12.0f);
        fbyVar.setLayoutParams(layoutParams2);
        fbyVar.setEllipsize(TextUtils.TruncateAt.MARQUEE);
        fbyVar.setGravity(17);
        fbyVar.setSingleLine(true);
        fbyVar.setText(wwx.ycx(context, "tt_other_reason"));
        fbyVar.setTextColor(Color.parseColor("#161823"));
        fbyVar.setTextSize(15.0f);
        fbyVar.setTypeface(Typeface.defaultFromStyle(0));
        View view = new View(context);
        view.setLayoutParams(new LinearLayout.LayoutParams(-1, dc.zb(context, 0.5f)));
        view.setBackgroundColor(Color.argb(51, 22, 24, 35));
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar2 = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        ludVar2.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        ludVar2.setOrientation(1);
        com.bytedance.sdk.openadsdk.core.lt.zb zbVar = new com.bytedance.sdk.openadsdk.core.lt.zb(context);
        this.sya = zbVar;
        zbVar.setFilters(new InputFilter[]{new InputFilter.LengthFilter(200), new InputFilter.AllCaps()});
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams3.leftMargin = dc.zb(context, 16.0f);
        layoutParams3.rightMargin = dc.zb(context, 16.0f);
        layoutParams3.topMargin = dc.zb(context, 11.5f);
        this.sya.setLayoutParams(layoutParams3);
        this.sya.setLines(4);
        this.sya.setGravity(48);
        this.sya.setTextSize(15.0f);
        this.sya.setTextColor(Color.rgb(22, 24, 35));
        this.sya.setHintTextColor(Color.parseColor("#57161823"));
        this.sya.setBackground(null);
        this.sya.setImeOptions(268435456);
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar3 = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(-1, -2);
        int iZb3 = dc.zb(context, 16.0f);
        int iZb4 = dc.zb(context, 17.0f);
        ludVar3.setPadding(iZb3, iZb4, iZb3, iZb4);
        ludVar3.setLayoutParams(layoutParams4);
        ludVar3.setOrientation(0);
        this.f27017dj = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(0, -2);
        layoutParams5.weight = 1.0f;
        layoutParams5.gravity = 8388611;
        this.f27017dj.setLayoutParams(layoutParams5);
        this.f27017dj.setText("0/200");
        this.f27017dj.setGravity(8388611);
        this.f27017dj.setTextColor(Color.parseColor("#57161823"));
        this.f27017dj.setTextSize(15.0f);
        this.lud = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        LinearLayout.LayoutParams layoutParams6 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams6.gravity = 8388613;
        this.lud.setLayoutParams(layoutParams6);
        this.lud.setTextSize(14.0f);
        this.lud.setTextColor(-1);
        this.lud.setVisibility(0);
        this.lud.setSingleLine(true);
        int iZb5 = dc.zb(context, 27.0f);
        int iZb6 = dc.zb(context, 5.0f);
        this.lud.setPadding(iZb5, iZb6, iZb5, iZb6);
        int iZb7 = dc.zb(context, 6.0f);
        GradientDrawable gradientDrawable = new GradientDrawable();
        float f11 = iZb7;
        gradientDrawable.setCornerRadius(f11);
        int iRgb = Color.rgb(254, 44, 85);
        gradientDrawable.setColor(iRgb);
        gradientDrawable.setAlpha(102);
        GradientDrawable gradientDrawable2 = new GradientDrawable();
        gradientDrawable2.setCornerRadius(f11);
        gradientDrawable2.setColor(iRgb);
        StateListDrawable stateListDrawable = new StateListDrawable();
        stateListDrawable.addState(new int[]{16842910}, gradientDrawable2);
        stateListDrawable.addState(new int[0], gradientDrawable);
        this.lud.setBackground(stateListDrawable);
        this.lud.setText(wwx.ycx(context, "tt_done"));
        this.lud.setEnabled(false);
        ludVar.addView(ulVar);
        ludVar.addView(view);
        ludVar.addView(ludVar2);
        ulVar.addView(this.f27018lt);
        ulVar.addView(fbyVar);
        ludVar2.addView(this.sya);
        ludVar2.addView(ludVar3);
        ludVar3.addView(this.f27017dj);
        ludVar3.addView(this.lud);
        return ludVar;
    }
}
