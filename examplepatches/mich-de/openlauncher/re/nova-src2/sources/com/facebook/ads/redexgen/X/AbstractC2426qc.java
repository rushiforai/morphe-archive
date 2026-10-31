package com.facebook.ads.redexgen.X;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.text.Layout;
import android.transition.AutoTransition;
import android.transition.Transition;
import android.transition.TransitionManager;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.BounceInterpolator;
import android.view.animation.ScaleAnimation;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.ads.internal.protocol.AdPlacementType;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/* renamed from: com.facebook.ads.redexgen.X.qc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2426qc {
    public static byte[] A00;
    public static String[] A01 = {"T9yeGAB86XK0vsZmNpfh4sIozppRZOgX", "Zi2TG3AXo50avc5D0Zq9wx", "JqBKj5K49VPZ3Gy9qBscEl", "4Ni4MdhmG8L", "r65r3", "RNCTQQIFlAbprT7c08Eivsd0jPtRWtbK", "BqjiC5lxzxq0feSMCCnGMnwMzT1DFPOJ", "3asmvLId1fZdr9gBLrqbDNcfpMudytXC"};
    public static final int A02;
    public static final int A03;
    public static final ConcurrentHashMap<Integer, Integer> A04;
    public static final AtomicInteger A05;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static int A03(TextView textView) {
        Layout layout;
        int lineCount;
        if (textView == null || textView.getLayout() == null || (lineCount = (layout = textView.getLayout()).getLineCount()) <= 0) {
            return 0;
        }
        double ellipsisCount = layout.getEllipsisCount(lineCount - 1);
        return (int) Math.ceil(ellipsisCount / (textView.getText().length() - ellipsisCount));
    }

    public static String A0D(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 87);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0E() {
        A00 = new byte[]{-26, -15, -11, -19, -26, 20, 36, 33, 41, 37, 23, 36, 17, 38, 43, 34, 23, 55, 53, 64, 64, 57, 70, 40, 77, 68, 57, 40, 40, 57, 36, 57, 62, 53, 42, 27, 36, 33, 27, 35, 23, 43, 39, 45, 42, 27, 29, -23, -20, -17, -9, -24, -11, -24, -25, -30, -26, -17, -20, -26, -18, -30, -25, -24, -17, -28, -4, -30, -16, -10, -18, -13, -7, -22, -9, -8, -7, -18, -7, -18, -26, -15, -64, -54, -74, -70, -72, -70, -74, -67, -64, -61, -53, -68, -55, -74, -70, -61, -64, -70, -62, -54, -74, -58, -59, -74, -70, -53, -72, -45, -35, -55, -51, -36, -49, -53, -34, -45, -32, -49, -55, -53, -35, -55, -51, -34, -53, -55, -32, -100, 46, 33, 51, 29, 46, 32, 33, 32, 27, 50, 37, 32, 33, 43, 35, 32, 19, 32, 37, 32, -34, 30, 22, 21, 26, 38, 30, 33, 15, 28, 33, -37, 33, 19, 32, 23, 20, -37, 27, 19, 18, 23, 35, 27, 60, 53, 48, 56, 60, 44, 16, 43, 45, 43, 29, 42, 27, 36, 33, 27, 35};
    }

    static {
        A0E();
        A03 = AbstractC1841gx.A02(-1, 0);
        A02 = AbstractC1841gx.A02(-16777216, 115);
        A05 = new AtomicInteger(1);
        A04 = new ConcurrentHashMap<>();
    }

    public static int A00() {
        int i5;
        int newValue;
        do {
            i5 = A05.get();
            newValue = i5 + 1;
            if (newValue > 16777215) {
                newValue = 1;
            }
        } while (!A05.compareAndSet(i5, newValue));
        return i5;
    }

    public static int A01(int i5) {
        return (int) TypedValue.applyDimension(2, i5, AbstractC2385px.A04);
    }

    public static int A02(int i5) {
        if (A0f(i5)) {
            return AbstractC1841gx.A05(i5, -1, 0.4f);
        }
        return AbstractC1841gx.A05(i5, -16777216, 0.2f);
    }

    public static int A04(TextView textView, int i5) {
        int lineHeightTitle = A03(textView);
        int lines = 0;
        int extraLinesRequired = textView.getLineHeight();
        while (i5 > extraLinesRequired && lines < lineHeightTitle) {
            lines++;
            i5 -= extraLinesRequired;
        }
        return lines;
    }

    public static Drawable A05(int i5, int i11) {
        return A08(i5, A02(i5), i11);
    }

    public static Drawable A06(int i5, int i11) {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(i5);
        gradientDrawable.setCornerRadius(i11);
        return gradientDrawable;
    }

    public static Drawable A07(int i5, int i11) {
        float[] fArr = new float[8];
        Arrays.fill(fArr, i11);
        ShapeDrawable shapeDrawable = new ShapeDrawable(new RoundRectShape(fArr, null, null));
        shapeDrawable.getPaint().setColor(i5);
        return shapeDrawable;
    }

    public static Drawable A08(int i5, int i11, int i12) {
        return A09(i5, i11, i5, i12);
    }

    public static Drawable A09(int i5, int i11, int i12, int i13) {
        return new RippleDrawable(ColorStateList.valueOf(i11), A06(i5, i13), A07(i12, i13));
    }

    public static Drawable A0A(int i5, float[] fArr) {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(i5);
        gradientDrawable.setCornerRadii(fArr);
        return gradientDrawable;
    }

    public static View A0B(Context context, int[] iArr) {
        View view = new View(context);
        view.setBackground(new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, iArr));
        return view;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static TextView A0C(ViewGroup viewGroup) {
        for (int i5 = 0; i5 < i; i5++) {
            View v11 = viewGroup.getChildAt(i5);
            if (v11 instanceof TextView) {
                return (TextView) v11;
            }
            if (v11 instanceof ViewGroup) {
                A0C((ViewGroup) v11);
            }
        }
        return null;
    }

    public static void A0F(float f11, LinearLayout linearLayout) {
        linearLayout.setOutlineProvider(new C2424qa(f11));
        linearLayout.setClipToOutline(true);
    }

    public static void A0G(int i5, View view) {
        ScaleAnimation scaleAnimation = new ScaleAnimation(1.0f, 0.8f, 1.0f, 0.8f, 1, 0.5f, 1, 0.5f);
        scaleAnimation.setDuration(i5 / 3);
        scaleAnimation.setInterpolator(new AccelerateInterpolator());
        ScaleAnimation scaleAnimation2 = new ScaleAnimation(0.8f, 1.0f, 0.8f, 1.0f, 1, 0.5f, 1, 0.5f);
        scaleAnimation2.setDuration((i5 / 3) * 2);
        scaleAnimation2.setInterpolator(new BounceInterpolator());
        scaleAnimation.setAnimationListener(new G3(view, scaleAnimation2));
        view.startAnimation(scaleAnimation);
    }

    public static void A0H(int i5, View view) {
        Integer viewId = A04.get(Integer.valueOf(i5));
        if (viewId != null) {
            view.setId(viewId.intValue());
        } else {
            A0L(view);
        }
    }

    public static void A0I(View view) {
        A0P(view, 8);
    }

    public static void A0J(View view) {
        ViewParent parent = view.getParent();
        if (parent != null && (parent instanceof ViewGroup)) {
            A0X((ViewGroup) parent);
        }
    }

    public static void A0K(View view) {
        ViewGroup parent;
        if (view != null && (parent = (ViewGroup) view.getParent()) != null) {
            parent.removeView(view);
        }
    }

    public static void A0L(View view) {
        if (view == null) {
            return;
        }
        view.setId(View.generateViewId());
    }

    public static void A0M(View view) {
        A0P(view, 0);
    }

    public static void A0N(View view, float f11, float f12, int i5) {
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(view, A0D(0, 5, 46), f11, f12);
        objectAnimatorOfFloat.setDuration(i5);
        objectAnimatorOfFloat.start();
    }

    public static void A0O(View view, int i5) {
        view.setBackground(new ColorDrawable(i5));
    }

    public static void A0P(View view, int i5) {
        if (view != null) {
            view.setVisibility(i5);
        }
    }

    public static void A0Q(View view, int i5, int i11) {
        A0W(view, A06(i5, i11));
    }

    public static void A0R(View view, int i5, int i11) {
        A0W(view, A08(i5, A02(i5), i11));
    }

    public static void A0S(View view, int i5, int i11, int i12) {
        GradientDrawable gradientDrawable = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{A03, A02});
        gradientDrawable.setCornerRadius(i5);
        gradientDrawable.setStroke(i11, i12);
        A0W(view, gradientDrawable);
    }

    public static void A0T(View view, int i5, int i11, int i12) {
        A0W(view, A09(i5, A02(i5), i11, i12));
    }

    public static void A0U(View view, int i5, float[] fArr) {
        A0W(view, A0A(i5, fArr));
    }

    public static void A0V(View view, Context context) {
        GradientDrawable gradientDrawable = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{A03, A02});
        gradientDrawable.setCornerRadius(0.0f);
        A0W(view, gradientDrawable);
    }

    public static void A0W(View view, Drawable drawable) {
        view.setBackground(drawable);
    }

    public static void A0X(ViewGroup viewGroup) {
        A0Y(viewGroup, 200);
    }

    public static void A0Y(ViewGroup viewGroup, int i5) {
        A0Z(viewGroup, new AutoTransition(), i5);
    }

    public static void A0Z(ViewGroup viewGroup, Transition transition, int i5) {
        transition.setDuration(i5);
        transition.setInterpolator(new AccelerateDecelerateInterpolator());
        TransitionManager.beginDelayedTransition(viewGroup, transition);
    }

    public static void A0a(Button button) {
        Typeface typeface = Typeface.create(A0D(144, 13, 90), 0);
        button.setTypeface(typeface);
    }

    public static void A0b(TextView textView, boolean z11, int i5) {
        Typeface typeface;
        if (z11) {
            typeface = Typeface.create(A0D(157, 17, 87), 0);
        } else {
            Typeface typeface2 = Typeface.SANS_SERIF;
            typeface = Typeface.create(typeface2, 0);
        }
        textView.setTypeface(typeface);
        textView.setTextSize(2, i5);
    }

    public static void A0c(Toast toast, String str, int i5, int i11, int i12) {
        if (toast == null) {
            return;
        }
        toast.setGravity(i5, i11, i12);
        TextView textViewA0C = A0C((ViewGroup) toast.getView());
        if (textViewA0C != null) {
            textViewA0C.setText(str);
            textViewA0C.setGravity(17);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x000e  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0025  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A0d(Map<String, String> map, LA la2) {
        char c11;
        String[] strArr;
        if (la2 == null) {
            return;
        }
        String strA1c = la2.A1c();
        switch (strA1c.hashCode()) {
            case -1364000502:
                String[] strArr2 = A01;
                if (strArr2[0].charAt(21) != strArr2[5].charAt(21)) {
                    throw new RuntimeException();
                }
                String[] strArr3 = A01;
                strArr3[6] = "JxEEAbJjmawEYAfdK1CmIj4J61XxEMX4";
                strArr3[7] = "0SJncT1BAyTLSP36ejuruM7XkYTmpqCV";
                c11 = strA1c.equals(A0D(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 14, 101)) ? (char) 1 : (char) 65535;
                strArr = A01;
                if (strArr[0].charAt(21) == strArr[5].charAt(21)) {
                    throw new RuntimeException();
                }
                String[] strArr4 = A01;
                strArr4[0] = "n4EWq8cbMgSrFIIPy3PtZs3ykG3gLNVv";
                strArr4[5] = "w61oSRwyzhyXZmY3tLRPvspfZwiCeo8H";
                String browserType = A0D(17, 10, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
                switch (c11) {
                    case 0:
                        String cctType = AdPlacementType.INTERSTITIAL.name();
                        map.put(browserType, cctType);
                        break;
                    case 1:
                        String cctType2 = AdPlacementType.REWARDED_VIDEO.name();
                        map.put(browserType, cctType2);
                        break;
                }
                map.put(A0D(174, 8, 112), la2.A1T());
                map.put(A0D(109, 21, 19), String.valueOf(la2.A2O()));
                map.put(A0D(82, 27, 0), String.valueOf(la2.A2F()));
                map.put(A0D(47, 23, 44), String.valueOf(la2.A1N()));
                String strA1V = la2.A1V();
                if (strA1V != null) {
                    map.put(A0D(5, 12, 91), strA1V);
                }
                String strA1W = la2.A1W();
                if (strA1W != null) {
                    String[] strArr5 = A01;
                    String cctType3 = strArr5[6];
                    if (cctType3.charAt(11) != strArr5[7].charAt(11)) {
                        A01[4] = "QpMMj";
                        map.put(A0D(27, 8, 110), strA1W);
                        return;
                    } else {
                        String[] strArr6 = A01;
                        strArr6[0] = "RlCCOSKS3krO76Z8d8aans18JsIjD59L";
                        strArr6[5] = "r3TWBb0uAOb49M7fooTivsHeogrthYcU";
                        map.put(A0D(27, 5, 48), strA1W);
                        return;
                    }
                }
                return;
            case 604727084:
                if (strA1c.equals(A0D(70, 12, 46))) {
                    c11 = 0;
                }
                strArr = A01;
                if (strArr[0].charAt(21) == strArr[5].charAt(21)) {
                }
                break;
        }
    }

    public static void A0e(View... viewArr) {
        for (View view : viewArr) {
            A0K(view);
        }
    }

    public static boolean A0f(int i5) {
        return AbstractC1841gx.A00(i5) < 0.5d;
    }

    public static boolean A0g(EnumC1698ec enumC1698ec, Map<String, String> extraData) {
        boolean nonIabDestination = !A0D(182, 9, 97).equals(extraData.get(A0D(35, 12, 97)));
        boolean nonCtaClick = enumC1698ec != EnumC1698ec.A07;
        return nonIabDestination && nonCtaClick;
    }

    public static boolean A0h(EnumC1698ec enumC1698ec, Map<String, String> extraData) {
        boolean zEquals = A0D(182, 9, 97).equals(extraData.get(A0D(35, 12, 97)));
        boolean ctaClick = enumC1698ec != EnumC1698ec.A07;
        return zEquals && ctaClick;
    }

    public static boolean A0i(C0958Hi c0958Hi, EnumC1698ec enumC1698ec) {
        return enumC1698ec == EnumC1698ec.A07 && C2203mv.A2z(c0958Hi);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0090  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A0j(C0958Hi c0958Hi, EnumC1698ec enumC1698ec, Map<String, String> extraData) {
        boolean z11;
        String str;
        String str2 = extraData.get(A0D(109, 21, 19));
        if (str2 != null) {
            String creativeAsCtaExtras = Boolean.TRUE.toString();
            z11 = str2.equals(creativeAsCtaExtras);
        }
        if (z11) {
            boolean hasCreativeAsCtaFlag = A0i(c0958Hi, enumC1698ec);
            String[] strArr = A01;
            if (strArr[6].charAt(11) != strArr[7].charAt(11)) {
                String[] strArr2 = A01;
                strArr2[1] = "u8VsnBmPWVphPllKxtlQdK";
                strArr2[2] = "HE77zV2Ng27gpeh0j3drVs";
                if (hasCreativeAsCtaFlag || A0g(enumC1698ec, extraData)) {
                    return true;
                }
                String creativeAsCtaExtras2 = A0D(82, 27, 0);
                str = extraData.get(creativeAsCtaExtras2);
                if (str == null) {
                    String creativeAsCtaExtras3 = Boolean.TRUE.toString();
                    boolean z12 = str.equals(creativeAsCtaExtras3);
                    if (z11 && z12) {
                        boolean hasCreativeAsCtaFlag2 = A0h(enumC1698ec, extraData);
                        String[] strArr3 = A01;
                        String str3 = strArr3[1];
                        String creativeAsCtaExtras4 = strArr3[2];
                        if (str3.length() == creativeAsCtaExtras4.length()) {
                            A01[4] = "KnygK";
                            if (hasCreativeAsCtaFlag2) {
                                return true;
                            }
                        }
                    }
                    return false;
                }
            }
        } else {
            String creativeAsCtaExtras22 = A0D(82, 27, 0);
            str = extraData.get(creativeAsCtaExtras22);
            if (str == null) {
            }
        }
        throw new RuntimeException();
    }
}
