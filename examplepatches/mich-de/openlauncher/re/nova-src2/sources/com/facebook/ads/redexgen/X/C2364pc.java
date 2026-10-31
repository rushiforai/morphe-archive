package com.facebook.ads.redexgen.X;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.animation.LinearInterpolator;
import java.util.ArrayList;
import java.util.Arrays;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.pc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2364pc {
    public static byte[] A0B;
    public static String[] A0C = {"CnNhEYD3lod5HVD7nnRSgaysYv1M847l", "qLryoeBRkRNzkq7WOerXpiL1kHyR4bx", "ofiky0rDOD2J78blqJbS7ho32ks4pN5", "pMkgXZDsGZBCNqo", "vOB6c8OOGx1HYyMkwsvKTqpk6v8gBddj", "wklrv2vfRzSEjI08pM3RFYLxCKg7ZoK9", "tB0dMvS0lSE6j8lWp2k27q49", "Od2IjT477tWVei3lxI3ScNznY1QSYbw4"};
    public static final C2362pa A0D;
    public long A00;
    public long A01;
    public AnimatorSet A02;
    public boolean A03;
    public View[] A04;
    public final float A05;
    public final long A06;
    public final long A07;
    public final long A08;
    public final Handler A09;
    public final Runnable A0A;

    public C2364pc() {
        this(0L, 0L, 0L, 0.0f, 15, null);
    }

    public C2364pc(long j11) {
        this(j11, 0L, 0L, 0.0f, 14, null);
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] ^ i12) ^ 14;
            String[] strArr = A0C;
            if (strArr[7].charAt(20) == strArr[5].charAt(20)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0C;
            strArr2[0] = "AmTDAEqgWwlCe7CXgFokstrN2v3T5F0i";
            strArr2[4] = "N1UmiSYGCYpcHpTeJX7nG6T9gvaerqAL";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A0B = new byte[]{110, 123, 104, 125, AbstractJsonLexerKt.TC_INVALID, 110, 76, 115, AbstractJsonLexerKt.TC_INVALID, 109, 105, 76, 74, 89, 86, 75, 84, 89, 76, 81, 87, 86, 97};
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 13 out of bounds for length 13
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final void A03() {
        AnimatorSet animatorSet = this.A02;
        if (animatorSet == null) {
            return;
        }
        char c11 = 0;
        if (this.A04.length == 0) {
            return;
        }
        float height = this.A04[0].getHeight() * this.A05;
        View[] viewArr = this.A04;
        ArrayList arrayList = new ArrayList(viewArr.length);
        int length = viewArr.length;
        int i5 = 0;
        while (i5 < length) {
            View view = viewArr[i5];
            float[] fArr = new float[2];
            fArr[c11] = -height;
            fArr[1] = 0.0f;
            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(view, A01(11, 12, 54), fArr);
            objectAnimatorOfFloat.setInterpolator(new LinearInterpolator());
            arrayList.add(objectAnimatorOfFloat);
            i5++;
            c11 = 0;
        }
        animatorSet.playTogether(arrayList);
        animatorSet.setDuration(this.A06);
        animatorSet.start();
    }

    static {
        A02();
        A0D = new C2362pa(null);
    }

    public C2364pc(long j11, long j12, long j13, float f11) {
        this.A07 = j11;
        this.A08 = j12;
        this.A06 = j13;
        this.A05 = f11;
        this.A09 = new Handler(Looper.getMainLooper());
        this.A04 = new View[0];
        this.A0A = new RunnableC2363pb(this);
    }

    public /* synthetic */ C2364pc(long j11, long j12, long j13, float f11, int i5, AbstractC05811i abstractC05811i) {
        this((i5 & 1) != 0 ? 6000L : j11, (i5 & 2) != 0 ? 1000L : j12, (i5 & 4) != 0 ? 600L : j13, (i5 & 8) != 0 ? 0.1f : f11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void A04(long j11) {
        this.A01 = j11;
        this.A00 = SystemClock.elapsedRealtime();
        this.A09.postDelayed(this.A0A, j11);
    }

    public final void A08() {
        if (this.A00 > 0) {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            if (A0C[3].length() == 30) {
                throw new RuntimeException();
            }
            A0C[6] = "RZi7N6IKiiGHC0ZvGPrdlQ1Y";
            long j11 = jElapsedRealtime - this.A00;
            long elapsed = this.A01;
            this.A01 = Math.max(0L, elapsed - j11);
        }
        AnimatorSet animatorSet = this.A02;
        if (animatorSet != null) {
            animatorSet.cancel();
        }
        this.A09.removeCallbacks(this.A0A);
        this.A00 = 0L;
    }

    public final void A09() {
        if (this.A02 == null) {
            return;
        }
        boolean z11 = this.A03;
        if (A0C[6].length() != 24) {
            throw new RuntimeException();
        }
        String[] strArr = A0C;
        strArr[7] = "2ucQZw0jeXkAvtUj8aJ64VO17jjIJlN8";
        strArr[5] = "XzV8r0h74uO38huaZBZnjdRgpHrgOW4S";
        if (z11) {
            A04(this.A08);
        } else {
            if (this.A01 <= 0) {
                return;
            }
            A04(this.A01);
        }
    }

    public final void A0A() {
        AnimatorSet animatorSet = this.A02;
        if (animatorSet != null) {
            animatorSet.cancel();
        }
        this.A09.removeCallbacks(this.A0A);
        this.A02 = null;
        this.A03 = false;
        this.A00 = 0L;
        this.A01 = 0L;
    }

    public final void A0B(View... viewArr) {
        C1h.A09(viewArr, A01(0, 11, 20));
        this.A04 = viewArr;
        this.A03 = false;
        this.A02 = new AnimatorSet();
        A04(this.A07);
    }
}
