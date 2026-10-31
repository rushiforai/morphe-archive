package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;

/* renamed from: com.facebook.ads.redexgen.X.ri, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class DialogC2494ri extends Dialog {
    public static byte[] A07;
    public static final int A08;
    public static final int A09;
    public static final int A0A;
    public static final int A0B;
    public static final int A0C;
    public static final int A0D;
    public static final int A0E;
    public static final int A0F;
    public static final int A0G;
    public static final int A0H;
    public static final int A0I;
    public static final int A0J;
    public long A00;
    public String A01;
    public boolean A02;
    public final Handler A03;
    public final C1760fd A04;
    public final C0958Hi A05;
    public final C2232nO A06;

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 75);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A07 = new byte[]{52, 24, 7, 30, 18, 19, 9, 37, 58, 35, 47, 57, 106, 58, 56, 37, 39, 37, 106, 41, 37, 46, 47, 106, 62, 37, 106, 41, 38, 35, 58, 40, 37, 43, 56, 46, 62, 18, 13, 4, 115, 99, 126, 102, 98, 116, 99, 78, 117, 116, 98, 101, 99, 126, 104, 116, 117, 83, 92, 89, 64, 82, 95, 81, 66, 84, 100, 105, 115, 109, 105, 115, 115, 95, 115, 111, 117, 114, 99, 101, 64, 77, 87, 73, 77, 87, 87, 69, 72, 123, 80, 77, 73, 65, 123, 87, 77, 74, 71, 65, 123, 87, 76, 75, 83, 74, 123, 73, 87, 57, 59, 38, 36, 38, 105, 42, 38, 45, 44, 49, 44, 40, 32, 26, 54, 44, 43, 38, 32, 26, 54, 45, 42, 50, 43, 26, 40, 54, 109, 107, 125, 106};
    }

    static {
        A06();
        A0G = AbstractC2383pv.A0C;
        A0H = AbstractC2383pv.A0C;
        A0A = AbstractC2383pv.A06;
        A0B = AbstractC2383pv.A0A;
        A0I = AbstractC2383pv.A06;
        A0J = AbstractC2383pv.A0K;
        A09 = AbstractC2383pv.A06;
        A08 = AbstractC2383pv.A0L;
        A0C = AbstractC2383pv.A0X;
        A0D = AbstractC2383pv.A0A;
        A0F = AbstractC2383pv.A0X;
        A0E = AbstractC2383pv.A06;
    }

    public DialogC2494ri(Activity activity, C0958Hi c0958Hi, C1760fd c1760fd, C2232nO c2232nO) {
        super(activity);
        this.A03 = new Handler(Looper.getMainLooper());
        this.A00 = 0L;
        this.A01 = A05(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 4, 83);
        this.A02 = false;
        this.A05 = c0958Hi;
        this.A04 = c1760fd;
        this.A06 = c2232nO;
    }

    public static int A00(Button button) {
        TextPaint paint = button.getPaint();
        return ((int) Math.ceil(Math.max(paint.measureText(A05(36, 4, 54)), paint.measureText(A05(0, 6, 60))))) + (A0D * 2);
    }

    private View A01() {
        Context context = getContext();
        LinearLayout linearLayout = new LinearLayout(context);
        linearLayout.setOrientation(1);
        linearLayout.setPadding(A0H, A0H, A0H, A0H);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(-854793);
        gradientDrawable.setCornerRadii(new float[]{A0G, A0G, A0G, A0G, 0.0f, 0.0f, 0.0f, 0.0f});
        linearLayout.setBackground(gradientDrawable);
        if (A0B()) {
            linearLayout.addView(A02(context), A04(0));
        }
        if (!TextUtils.isEmpty(this.A04.A04)) {
            TextView textView = new TextView(context);
            textView.setText(this.A04.A04);
            textView.setTextSize(2, 16.0f);
            textView.setTypeface(Typeface.DEFAULT_BOLD);
            textView.setTextColor(-16448251);
            linearLayout.addView(textView, A04(A0I));
        }
        if (!TextUtils.isEmpty(this.A04.A03)) {
            TextView textView2 = new TextView(context);
            textView2.setText(this.A04.A03);
            textView2.setTextSize(2, 14.0f);
            textView2.setTextColor(-10131605);
            linearLayout.addView(textView2, A04(A0J));
        }
        linearLayout.addView(A03(context), A04(A0I));
        return linearLayout;
    }

    private View A02(Context context) {
        LinearLayout linearLayout = new LinearLayout(context);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(16);
        C2661uP c2661uP = new C2661uP(this.A05);
        c2661uP.setFullCircleCorners(true);
        c2661uP.setBackground(new ColorDrawable(0));
        linearLayout.addView(c2661uP, new LinearLayout.LayoutParams(A08, A08));
        if (!TextUtils.isEmpty(this.A04.A00)) {
            new AsyncTaskC0892Et(c2661uP, this.A05).A05(A08, A08).A07(this.A04.A00);
        }
        if (!TextUtils.isEmpty(this.A04.A01)) {
            TextView textView = new TextView(context);
            textView.setText(this.A04.A01);
            textView.setTextSize(2, 18.0f);
            textView.setTypeface(Typeface.DEFAULT_BOLD);
            textView.setTextColor(-16448251);
            LinearLayout.LayoutParams nameParams = new LinearLayout.LayoutParams(0, -2, 1.0f);
            nameParams.leftMargin = A09;
            linearLayout.addView(textView, nameParams);
        }
        return linearLayout;
    }

    private View A03(Context context) {
        LinearLayout linearLayout = new LinearLayout(context);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(16);
        linearLayout.setPadding(A0B, A0B, A0B, A0B);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(-1);
        gradientDrawable.setCornerRadius(A0A);
        linearLayout.setBackground(gradientDrawable);
        TextView textView = new TextView(context);
        textView.setText(this.A04.A02);
        textView.setTextSize(2, 14.0f);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        textView.setTextColor(-16448251);
        linearLayout.addView(textView, new LinearLayout.LayoutParams(0, -2, 1.0f));
        final Button button = new Button(context);
        button.setAllCaps(false);
        button.setTextSize(2, 14.0f);
        button.setTypeface(Typeface.DEFAULT_BOLD);
        button.setMinHeight(0);
        button.setMinimumHeight(0);
        button.setPadding(A0D, A0F, A0D, A0F);
        A09(button);
        button.setContentDescription(A05(6, 30, 1));
        button.setMinWidth(A00(button));
        button.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.rg
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.A01.A0D(button, view);
            }
        });
        LinearLayout.LayoutParams buttonParams = new LinearLayout.LayoutParams(-2, -2);
        buttonParams.leftMargin = A0E;
        linearLayout.addView(button, buttonParams);
        return linearLayout;
    }

    public static LinearLayout.LayoutParams A04(int i5) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = i5;
        return params;
    }

    private void A07(final Button button) {
        ClipboardManager clipboardManager = (ClipboardManager) getContext().getSystemService(A05(57, 9, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
        if (clipboardManager != null) {
            clipboardManager.setPrimaryClip(ClipData.newPlainText(A05(109, 10, 2), this.A04.A02));
        }
        HashMap map = new HashMap();
        map.put(A05(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 19, 14), String.valueOf(SystemClock.elapsedRealtime() - this.A00));
        this.A06.A04(EnumC2231nN.A0r, map);
        A08(button);
        this.A03.postDelayed(new Runnable() { // from class: com.facebook.ads.redexgen.X.rh
            @Override // java.lang.Runnable
            public final void run() {
                DialogC2494ri.A09(button);
            }
        }, a.f39430h);
    }

    public static void A08(Button button) {
        button.setText(A05(0, 6, 60));
        button.setTextColor(-16448251);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(-1775893);
        gradientDrawable.setCornerRadius(A0C);
        button.setBackground(gradientDrawable);
    }

    public static void A09(Button button) {
        button.setText(A05(36, 4, 54));
        button.setTextColor(-1);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(-11903495);
        gradientDrawable.setCornerRadius(A0C);
        button.setBackground(gradientDrawable);
    }

    private boolean A0B() {
        return (TextUtils.isEmpty(this.A04.A01) && TextUtils.isEmpty(this.A04.A00)) ? false : true;
    }

    public final void A0C() {
        this.A01 = A05(40, 17, 90);
        dismiss();
    }

    public final /* synthetic */ void A0D(Button button, View view) {
        A07(button);
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public final void dismiss() {
        if (this.A00 != 0 && !this.A02) {
            this.A02 = true;
            HashMap map = new HashMap();
            map.put(A05(80, 29, 111), String.valueOf(SystemClock.elapsedRealtime() - this.A00));
            map.put(A05(66, 14, 75), this.A01);
            this.A06.A04(EnumC2231nN.A0s, map);
        }
        this.A03.removeCallbacksAndMessages(null);
        super.dismiss();
    }

    @Override // android.app.Dialog
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(A01());
        setCanceledOnTouchOutside(true);
        Window window = getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(0));
            window.setLayout(-1, -2);
            window.setGravity(80);
            WindowManager.LayoutParams attrs = window.getAttributes();
            attrs.dimAmount = 0.4f;
            window.setAttributes(attrs);
            window.addFlags(2);
        }
    }

    @Override // android.app.Dialog
    public final void show() {
        if (this.A00 == 0) {
            this.A00 = SystemClock.elapsedRealtime();
            this.A06.A04(EnumC2231nN.A0t, null);
        }
        super.show();
    }
}
