package rx;

import ads_mobile_sdk.bu1;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.view.ViewOutlineProvider;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import k0.m1;
import kotlin.NoWhenBranchMatchedException;
import qx.s0;
import ui.p;
import vm.c;

/* loaded from: classes4.dex */
public final class a implements b {

    /* renamed from: b, reason: collision with root package name */
    public static final a f86459b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f86460c = new a(1);

    /* renamed from: d, reason: collision with root package name */
    public static final a f86461d = new a(3);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86462a;

    public /* synthetic */ a(int i5) {
        this.f86462a = i5;
    }

    public static b b(s0 s0Var) {
        int iOrdinal = s0Var.ordinal();
        if (iOrdinal == 0) {
            return f86461d;
        }
        if (iOrdinal == 1) {
            return f86460c;
        }
        if (iOrdinal == 2) {
            return f86459b;
        }
        throw new NoWhenBranchMatchedException();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // rx.b
    public FrameLayout a(Context context, bu1 bu1Var, p pVar) {
        mi.b bVar;
        Drawable drawable;
        mi.b bVar2;
        char c11;
        Drawable drawable2;
        int i5;
        switch (this.f86462a) {
            case 0:
                m1 m1Var = new m1(context.getResources().getDisplayMetrics().density, 2);
                FrameLayout frameLayout = new FrameLayout(context);
                GradientDrawable gradientDrawable = new GradientDrawable();
                gradientDrawable.setCornerRadius(((Number) m1Var.invoke(12)).intValue());
                gradientDrawable.setColor(context.getColor(2131100697));
                frameLayout.setBackground(gradientDrawable);
                frameLayout.setClipToOutline(true);
                frameLayout.setOutlineProvider(ViewOutlineProvider.BACKGROUND);
                LinearLayout linearLayout = new LinearLayout(context);
                linearLayout.setOrientation(1);
                if (bu1Var.f1567p != null) {
                    bVar = new mi.b(context, 2);
                    bVar.setLayoutParams(new LinearLayout.LayoutParams(-1, ((Number) m1Var.invoke(180)).intValue()));
                    linearLayout.addView(bVar);
                } else {
                    bVar = null;
                }
                LinearLayout linearLayout2 = new LinearLayout(context);
                linearLayout2.setOrientation(0);
                linearLayout2.setGravity(17);
                linearLayout2.setMinimumHeight(((Number) m1Var.invoke(40)).intValue());
                c cVar = bu1Var.f1566m;
                if (cVar != null && (drawable = (Drawable) cVar.f92857b) != null) {
                    ImageView imageView = new ImageView(context);
                    imageView.setImageDrawable(drawable);
                    imageView.setLayoutParams(new LinearLayout.LayoutParams(((Number) m1Var.invoke(40)).intValue(), ((Number) m1Var.invoke(40)).intValue()));
                    linearLayout2.addView(imageView);
                }
                LinearLayout linearLayout3 = new LinearLayout(context);
                linearLayout3.setOrientation(1);
                linearLayout3.setPadding(((Number) m1Var.invoke(10)).intValue(), 0, 0, 0);
                linearLayout3.setLayoutParams(new LinearLayout.LayoutParams(0, -2, 0.7f));
                String str = bu1Var.f1563d;
                if (str != null) {
                    TextView textView = new TextView(context);
                    textView.setText(str);
                    textView.setTextSize(14.0f);
                    textView.setTypeface(textView.getTypeface(), 1);
                    textView.setTextColor(context.getColor(2131101206));
                    textView.setMaxLines(1);
                    textView.setEllipsize(TextUtils.TruncateAt.END);
                    linearLayout3.addView(textView);
                }
                String str2 = bu1Var.f1565h;
                if (str2 != null) {
                    TextView textView2 = new TextView(context);
                    textView2.setText(str2);
                    textView2.setTextSize(11.0f);
                    textView2.setTextColor(context.getColor(2131101208));
                    textView2.setMaxLines(1);
                    linearLayout3.addView(textView2);
                }
                linearLayout2.addView(linearLayout3);
                String str3 = bu1Var.f1564g;
                if (str3 != null) {
                    TextView textView3 = new TextView(context);
                    textView3.setText(str3);
                    textView3.setTextSize(14.0f);
                    textView3.setGravity(17);
                    textView3.setLayoutParams(new LinearLayout.LayoutParams(0, -1, 0.5f));
                    GradientDrawable gradientDrawable2 = new GradientDrawable();
                    gradientDrawable2.setCornerRadii(new float[]{((Number) m1Var.invoke(12)).intValue(), ((Number) m1Var.invoke(12)).intValue(), 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f});
                    gradientDrawable2.setColor(context.getColor(2131099677));
                    textView3.setBackground(gradientDrawable2);
                    textView3.setTextColor(context.getColor(2131099678));
                    linearLayout2.addView(textView3);
                }
                linearLayout.addView(linearLayout2);
                frameLayout.addView(linearLayout);
                TextView textView4 = new TextView(context);
                textView4.setText(k.f40332f);
                textView4.setTextSize(9.0f);
                textView4.setTextColor(context.getColor(2131099676));
                textView4.setPadding(((Number) m1Var.invoke(4)).intValue(), ((Number) m1Var.invoke(2)).intValue(), ((Number) m1Var.invoke(4)).intValue(), ((Number) m1Var.invoke(2)).intValue());
                GradientDrawable gradientDrawable3 = new GradientDrawable();
                gradientDrawable3.setCornerRadius(((Number) m1Var.invoke(4)).intValue());
                gradientDrawable3.setColor(context.getColor(2131099675));
                textView4.setBackground(gradientDrawable3);
                FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
                layoutParams.gravity = 8388661;
                layoutParams.setMarginEnd(((Number) m1Var.invoke(16)).intValue());
                textView4.setLayoutParams(layoutParams);
                frameLayout.addView(textView4);
                try {
                    pVar.a(bu1Var, bVar);
                } catch (IllegalStateException unused) {
                }
                return frameLayout;
            case 1:
                m1 m1Var2 = new m1(context.getResources().getDisplayMetrics().density, 3);
                FrameLayout frameLayout2 = new FrameLayout(context);
                GradientDrawable gradientDrawable4 = new GradientDrawable();
                gradientDrawable4.setCornerRadius(((Number) m1Var2.invoke(12)).intValue());
                gradientDrawable4.setColor(context.getColor(2131100697));
                frameLayout2.setBackground(gradientDrawable4);
                frameLayout2.setClipToOutline(true);
                frameLayout2.setOutlineProvider(ViewOutlineProvider.BACKGROUND);
                LinearLayout linearLayout4 = new LinearLayout(context);
                linearLayout4.setOrientation(1);
                if (bu1Var.f1567p != null) {
                    bVar2 = new mi.b(context, 2);
                    bVar2.setLayoutParams(new LinearLayout.LayoutParams(-1, ((Number) m1Var2.invoke(120)).intValue()));
                    linearLayout4.addView(bVar2);
                } else {
                    bVar2 = null;
                }
                LinearLayout linearLayout5 = new LinearLayout(context);
                linearLayout5.setOrientation(0);
                linearLayout5.setGravity(17);
                linearLayout5.setMinimumHeight(((Number) m1Var2.invoke(40)).intValue());
                c cVar2 = bu1Var.f1566m;
                if (cVar2 == null || (drawable2 = (Drawable) cVar2.f92857b) == null) {
                    c11 = 4;
                } else {
                    ImageView imageView2 = new ImageView(context);
                    imageView2.setImageDrawable(drawable2);
                    c11 = 4;
                    imageView2.setLayoutParams(new LinearLayout.LayoutParams(((Number) m1Var2.invoke(40)).intValue(), ((Number) m1Var2.invoke(40)).intValue()));
                    linearLayout5.addView(imageView2);
                }
                LinearLayout linearLayout6 = new LinearLayout(context);
                linearLayout6.setOrientation(1);
                linearLayout6.setPadding(((Number) m1Var2.invoke(10)).intValue(), 0, 0, 0);
                linearLayout6.setLayoutParams(new LinearLayout.LayoutParams(0, -2, 0.7f));
                String str4 = bu1Var.f1563d;
                if (str4 != null) {
                    TextView textView5 = new TextView(context);
                    textView5.setText(str4);
                    textView5.setTextSize(14.0f);
                    textView5.setTypeface(textView5.getTypeface(), 1);
                    textView5.setTextColor(context.getColor(2131101206));
                    textView5.setMaxLines(1);
                    textView5.setEllipsize(TextUtils.TruncateAt.END);
                    linearLayout6.addView(textView5);
                }
                String str5 = bu1Var.f1565h;
                if (str5 != null) {
                    TextView textView6 = new TextView(context);
                    textView6.setText(str5);
                    textView6.setTextSize(11.0f);
                    textView6.setTextColor(context.getColor(2131101208));
                    textView6.setMaxLines(1);
                    linearLayout6.addView(textView6);
                }
                linearLayout5.addView(linearLayout6);
                String str6 = bu1Var.f1564g;
                if (str6 != null) {
                    TextView textView7 = new TextView(context);
                    textView7.setText(str6);
                    textView7.setTextSize(14.0f);
                    textView7.setGravity(17);
                    textView7.setLayoutParams(new LinearLayout.LayoutParams(0, -1, 0.5f));
                    GradientDrawable gradientDrawable5 = new GradientDrawable();
                    float fIntValue = ((Number) m1Var2.invoke(12)).intValue();
                    float fIntValue2 = ((Number) m1Var2.invoke(12)).intValue();
                    float[] fArr = new float[8];
                    fArr[0] = fIntValue;
                    fArr[1] = fIntValue2;
                    fArr[2] = 0.0f;
                    fArr[3] = 0.0f;
                    fArr[c11] = 0.0f;
                    fArr[5] = 0.0f;
                    fArr[6] = 0.0f;
                    fArr[7] = 0.0f;
                    gradientDrawable5.setCornerRadii(fArr);
                    gradientDrawable5.setColor(context.getColor(2131099677));
                    textView7.setBackground(gradientDrawable5);
                    textView7.setTextColor(context.getColor(2131099678));
                    linearLayout5.addView(textView7);
                }
                linearLayout4.addView(linearLayout5);
                frameLayout2.addView(linearLayout4);
                TextView textView8 = new TextView(context);
                textView8.setText(k.f40332f);
                textView8.setTextSize(9.0f);
                textView8.setTextColor(context.getColor(2131099676));
                textView8.setPadding(((Number) m1Var2.invoke(4)).intValue(), ((Number) m1Var2.invoke(2)).intValue(), ((Number) m1Var2.invoke(4)).intValue(), ((Number) m1Var2.invoke(2)).intValue());
                GradientDrawable gradientDrawable6 = new GradientDrawable();
                gradientDrawable6.setCornerRadius(((Number) m1Var2.invoke(4)).intValue());
                gradientDrawable6.setColor(context.getColor(2131099675));
                textView8.setBackground(gradientDrawable6);
                FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(-2, -2);
                layoutParams2.gravity = 8388661;
                layoutParams2.setMarginEnd(((Number) m1Var2.invoke(16)).intValue());
                textView8.setLayoutParams(layoutParams2);
                frameLayout2.addView(textView8);
                try {
                    pVar.a(bu1Var, bVar2);
                } catch (IllegalStateException unused2) {
                }
                return frameLayout2;
            default:
                m1 m1Var3 = new m1(context.getResources().getDisplayMetrics().density, 4);
                FrameLayout frameLayout3 = new FrameLayout(context);
                GradientDrawable gradientDrawable7 = new GradientDrawable();
                gradientDrawable7.setCornerRadius(((Number) m1Var3.invoke(12)).intValue());
                gradientDrawable7.setColor(context.getColor(2131100697));
                frameLayout3.setBackground(gradientDrawable7);
                frameLayout3.setClipToOutline(true);
                frameLayout3.setOutlineProvider(ViewOutlineProvider.BACKGROUND);
                LinearLayout linearLayout7 = new LinearLayout(context);
                linearLayout7.setOrientation(0);
                linearLayout7.setGravity(17);
                FrameLayout frameLayout4 = new FrameLayout(context);
                frameLayout4.setLayoutParams(new LinearLayout.LayoutParams(0, -1, 1.0f));
                mi.b bVar3 = new mi.b(context, 2);
                bVar3.setLayoutParams(new FrameLayout.LayoutParams(-2, -1));
                frameLayout4.addView(bVar3);
                linearLayout7.addView(frameLayout4);
                LinearLayout linearLayout8 = new LinearLayout(context);
                linearLayout8.setOrientation(1);
                linearLayout8.setGravity(17);
                linearLayout8.setPadding(((Number) m1Var3.invoke(8)).intValue(), ((Number) m1Var3.invoke(8)).intValue(), ((Number) m1Var3.invoke(12)).intValue(), ((Number) m1Var3.invoke(8)).intValue());
                linearLayout8.setLayoutParams(new LinearLayout.LayoutParams(0, -2, 1.0f));
                String str7 = bu1Var.f1563d;
                if (str7 != null) {
                    TextView textView9 = new TextView(context);
                    textView9.setText(str7);
                    textView9.setTextSize(14.0f);
                    textView9.setTypeface(textView9.getTypeface(), 1);
                    textView9.setTextColor(context.getColor(2131101206));
                    textView9.setMaxLines(1);
                    textView9.setEllipsize(TextUtils.TruncateAt.END);
                    LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-1, -2);
                    layoutParams3.bottomMargin = ((Number) m1Var3.invoke(6)).intValue();
                    textView9.setLayoutParams(layoutParams3);
                    i5 = 17;
                    textView9.setGravity(17);
                    linearLayout8.addView(textView9);
                } else {
                    i5 = 17;
                }
                String str8 = bu1Var.f1564g;
                if (str8 != null) {
                    TextView textView10 = new TextView(context);
                    textView10.setText(str8);
                    textView10.setMaxLines(1);
                    textView10.setGravity(i5);
                    textView10.setPadding(((Number) m1Var3.invoke(16)).intValue(), ((Number) m1Var3.invoke(10)).intValue(), ((Number) m1Var3.invoke(16)).intValue(), ((Number) m1Var3.invoke(10)).intValue());
                    textView10.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
                    GradientDrawable gradientDrawable8 = new GradientDrawable();
                    gradientDrawable8.setCornerRadius(((Number) m1Var3.invoke(8)).intValue());
                    gradientDrawable8.setColor(context.getColor(2131099677));
                    textView10.setBackground(gradientDrawable8);
                    textView10.setTextColor(context.getColor(2131099678));
                    if (Build.VERSION.SDK_INT >= 27) {
                        textView10.setAutoSizeTextTypeUniformWithConfiguration(8, 14, 1, 2);
                    } else if (textView10 instanceof e5.b) {
                        ((e5.b) textView10).setAutoSizeTextTypeUniformWithConfiguration(8, 14, 1, 2);
                    }
                    linearLayout8.addView(textView10);
                }
                linearLayout7.addView(linearLayout8);
                frameLayout3.addView(linearLayout7, new FrameLayout.LayoutParams(-1, -1));
                TextView textView11 = new TextView(context);
                textView11.setText(k.f40332f);
                textView11.setTextSize(9.0f);
                textView11.setTextColor(context.getColor(2131099676));
                textView11.setPadding(((Number) m1Var3.invoke(4)).intValue(), ((Number) m1Var3.invoke(2)).intValue(), ((Number) m1Var3.invoke(4)).intValue(), ((Number) m1Var3.invoke(2)).intValue());
                GradientDrawable gradientDrawable9 = new GradientDrawable();
                gradientDrawable9.setCornerRadius(((Number) m1Var3.invoke(4)).intValue());
                gradientDrawable9.setColor(context.getColor(2131099675));
                textView11.setBackground(gradientDrawable9);
                FrameLayout.LayoutParams layoutParams4 = new FrameLayout.LayoutParams(-2, -2);
                layoutParams4.gravity = 8388661;
                layoutParams4.setMarginEnd(((Number) m1Var3.invoke(16)).intValue());
                textView11.setLayoutParams(layoutParams4);
                frameLayout3.addView(textView11);
                try {
                    pVar.a(bu1Var, bVar3);
                } catch (IllegalStateException unused3) {
                }
                return frameLayout3;
        }
    }
}
