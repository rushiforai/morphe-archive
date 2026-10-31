package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Build;
import android.os.Parcelable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Display;
import android.view.FocusFinder;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.Interpolator;
import android.widget.EdgeEffect;
import android.widget.OverScroller;
import androidx.compose.ui.node.LayoutNode;
import com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView;
import com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$SavedState;
import com.facebook.ads.internal.util.parcelable.WrappedParcelable;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.7O, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C7O extends ViewGroup {
    public static byte[] A18;
    public static String[] A19 = {"EzQ8zede2M", "Jhjgeach8ubRdn89CHbftPIFCkhy8Cmz", "AI0RoC", "LwFgY3t3Qwi2PJUU36Pvm2", "gOCwMU1oDfpLVyXTNaTi7eQdHjis00sx", "GZYggCcl1OWg4VOzBYKk2kBvqjxmktta", "Te26Sy6xLG0KtVPzJaOHws0Kts3F9NRb", "K773CdyIAwEU"};
    public static final Interpolator A1A;
    public static final boolean A1B;
    public static final boolean A1C;
    public static final boolean A1D;
    public static final boolean A1E;
    public static final boolean A1F;
    public static final boolean A1G;
    public static final int[] A1H;
    public static final int[] A1I;
    public static final Class<?>[] A1J;
    public JB A00;
    public C1924iK A01;
    public JA A02;
    public RunnableC1937iX A03;
    public AbstractC1948ik A04;
    public AbstractC1956is A05;
    public AbstractC1960iw A06;
    public InterfaceC1969j5 A07;
    public RunnableC1977jD A08;
    public C0978Ic A09;
    public boolean A0A;
    public boolean A0B;
    public boolean A0C;
    public boolean A0D;
    public boolean A0E;
    public boolean A0F;
    public boolean A0G;
    public boolean A0H;
    public boolean A0I;
    public boolean A0J;
    public boolean A0K;
    public float A0L;
    public float A0M;
    public int A0N;
    public int A0O;
    public int A0P;
    public int A0Q;
    public int A0R;
    public int A0S;
    public int A0T;
    public int A0U;
    public int A0V;
    public int A0W;
    public int A0X;
    public VelocityTracker A0Y;
    public EdgeEffect A0Z;
    public EdgeEffect A0a;
    public EdgeEffect A0b;
    public EdgeEffect A0c;
    public C1862hJ A0d;
    public InterfaceC1951in A0e;
    public InterfaceC1954iq A0f;
    public AbstractC1963iz A0g;
    public InterfaceC1964j0 A0h;
    public AbstractC1965j1 A0i;
    public RecyclerView$SavedState A0j;
    public Runnable A0k;
    public List<RecyclerView.OnChildAttachStateChangeListener> A0l;
    public List<AbstractC1965j1> A0m;
    public boolean A0n;
    public boolean A0o;
    public final Rect A0p;
    public final RectF A0q;
    public final C1968j4 A0r;
    public final C1975jB A0s;
    public final C1986jM A0t;
    public final Runnable A0u;
    public final ArrayList<AbstractC1957it> A0v;
    public final List<AbstractC1978jE> A0w;
    public final int A0x;
    public final int A0y;
    public final Rect A0z;
    public final AccessibilityManager A10;
    public final C0992Ir A11;
    public final InterfaceC1985jL A12;
    public final ArrayList<InterfaceC1964j0> A13;
    public final int[] A14;
    public final int[] A15;
    public final int[] A16;
    public final int[] A17;

    public static String A0I(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A18, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 85);
        }
        return new String(bArrCopyOfRange);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 17 out of bounds for length 17
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x00b3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0N() {
        this.A0s.A04(4);
        A1N();
        A1O();
        this.A0s.A04 = 1;
        if (!this.A0s.A0C) {
            this.A06.A2W(this.A0r);
            this.A0s.A05 = this.A0s.A03;
            this.A0C = false;
            this.A0s.A0C = false;
            this.A0s.A0B = false;
            this.A06.A09 = false;
            if (this.A0r.A02 != null) {
            }
            if (this.A06.A08) {
            }
            this.A06.A2d(this.A0s);
            A1P();
            A1w(false);
            this.A0t.A06();
            if (A12(this.A14[0], this.A14[1])) {
            }
            A0Q();
            A0S();
            return;
        }
        for (int iA05 = this.A01.A05() - 1; iA05 >= 0; iA05--) {
            AbstractC1978jE abstractC1978jEA0F = A0F(this.A01.A09(iA05));
            if (!abstractC1978jEA0F.A0s()) {
                long jA0C = A0C(abstractC1978jEA0F);
                C1955ir c1955irA0E = this.A05.A0E(this.A0s, abstractC1978jEA0F);
                AbstractC1978jE abstractC1978jEA05 = this.A0t.A05(jA0C);
                if (abstractC1978jEA05 == null || abstractC1978jEA05.A0s()) {
                    this.A0t.A0E(abstractC1978jEA0F, c1955irA0E);
                } else {
                    boolean zA0H = this.A0t.A0H(abstractC1978jEA05);
                    C1986jM c1986jM = this.A0t;
                    if (A19[5].charAt(2) != 'Y') {
                        break;
                    }
                    A19[1] = "oIS3LUWJBkP0D1bim3OID749wsN9UxnV";
                    boolean zA0H2 = c1986jM.A0H(abstractC1978jEA0F);
                    if (zA0H && abstractC1978jEA05 == abstractC1978jEA0F) {
                        this.A0t.A0E(abstractC1978jEA0F, c1955irA0E);
                    } else {
                        C1955ir c1955irA04 = this.A0t.A04(abstractC1978jEA05);
                        this.A0t.A0E(abstractC1978jEA0F, c1955irA0E);
                        C1955ir c1955irA03 = this.A0t.A03(abstractC1978jEA0F);
                        if (c1955irA04 == null) {
                            A0m(jA0C, abstractC1978jEA0F, abstractC1978jEA05);
                        } else {
                            A0u(abstractC1978jEA05, abstractC1978jEA0F, c1955irA04, c1955irA03, zA0H, zA0H2);
                        }
                    }
                }
            }
        }
        this.A0t.A0G(this.A12);
        this.A06.A2W(this.A0r);
        this.A0s.A05 = this.A0s.A03;
        this.A0C = false;
        this.A0s.A0C = false;
        this.A0s.A0B = false;
        this.A06.A09 = false;
        if (this.A0r.A02 != null) {
            ArrayList<AbstractC1978jE> arrayList = this.A0r.A02;
            String[] strArr = A19;
            if (strArr[3].length() != strArr[0].length()) {
                A19[1] = "DxhhwSm2KO29M0snTVs4N8QFyNW6c8YZ";
                arrayList.clear();
            }
        }
        if (this.A06.A08) {
            this.A06.A00 = 0;
            this.A06.A08 = false;
            this.A0r.A0P();
        }
        this.A06.A2d(this.A0s);
        A1P();
        A1w(false);
        this.A0t.A06();
        if (A12(this.A14[0], this.A14[1])) {
            A1f(0, 0);
        }
        A0Q();
        A0S();
        return;
        throw new RuntimeException();
    }

    public static void A0W() {
        A18 = new byte[]{-74, -74, -96, -74, -20, -1, -5, 13, -74, -34, 5, 2, -6, -5, 8, -74, -56, -48, -100, -33, -35, -22, -22, -21, -16, -100, -34, -31, -100, -30, -21, -15, -22, -32, -100, -34, -15, -16, -100, -27, -16, -100, -27, -17, -100, -22, -31, -33, -31, -17, -17, -35, -18, -11, -100, -30, -21, -18, -100, 126, -57, -47, 126, -65, -54, -48, -61, -65, -62, -41, 126, -65, -46, -46, -65, -63, -58, -61, -62, 126, -46, -51, 126, -65, 126, -80, -61, -63, -41, -63, -54, -61, -48, -76, -57, -61, -43, -104, -12, 61, 71, -12, 66, 67, 72, -12, 53, -12, 56, 61, 70, 57, 55, 72, -12, 55, 60, 61, 64, 56, -12, 67, 58, -12, -93, -15, -14, -9, -93, -23, -14, -8, -15, -25, -79, -93, -57, -20, -25, -93, -28, -15, -4, -93, -48, -14, -9, -20, -14, -15, -56, -7, -24, -15, -9, -10, -93, -22, -24, -9, -93, -10, -18, -20, -13, -13, -24, -25, -62, -45, -57, 8, 11, 8, 23, 27, 12, 25, -31, -117, AbstractJsonLexerKt.TC_INVALID, -62, -50, -51, -45, -60, -41, -45, -103, -56, -68, 8, -3, 21, 11, 17, 16, -42, 9, -18, 67, 65, 55, 60, 53, -18, 50, 51, 52, 47, 67, 58, 66, -18, 68, 47, 58, 67, 51, -67, -37, -26, -26, -33, -34, -102, -20, -33, -25, -23, -16, -33, -66, -33, -18, -37, -35, -30, -33, -34, -48, -29, -33, -15, -102, -15, -29, -18, -30, -102, -37, -102, -16, -29, -33, -15, -102, -15, -30, -29, -35, -30, -102, -29, -19, -102, -24, -23, -18, -102, -32, -26, -37, -31, -31, -33, -34, -102, -37, -19, -102, -18, -25, -22, -102, -34, -33, -18, -37, -35, -30, -33, -34, -88, -80, -50, -37, -37, -36, -31, -115, -50, -47, -47, -115, -42, -31, -46, -38, -115, -47, -46, -48, -36, -33, -50, -31, -42, -36, -37, -115, -47, -30, -33, -42, -37, -44, -115, -50, -115, -32, -48, -33, -36, -39, -39, -115, -115, -36, -33, -115, -39, -50, -26, -36, -30, -31, -55, -25, -12, -12, -11, -6, -90, -23, -25, -14, -14, -90, -6, -18, -17, -7, -90, -13, -21, -6, -18, -11, -22, -90, -17, -12, -90, -25, -90, -7, -23, -8, -11, -14, -14, -90, -23, -25, -14, -14, -24, -25, -23, -15, -76, -90, -39, -23, -8, -11, -14, -14, -90, -23, -25, -14, -14, -24, -25, -23, -15, -7, -90, -13, -17, -19, -18, -6, -24, -21, -90, -8, -5, -12, -90, -22, -5, -8, -17, -12, -19, -90, -25, -90, -13, -21, -25, -7, -5, -8, -21, -90, -84, -90, -14, -25, -1, -11, -5, -6, -90, -10, -25, -7, -7, -90, -3, -18, -21, -8, -21, -90, -1, -11, -5, -90, -23, -25, -12, -12, -11, -6, -90, -23, -18, -25, -12, -19, -21, -90, -6, -18, -21, -40, -21, -23, -1, -23, -14, -21, -8, -36, -17, -21, -3, -90, -22, -25, -6, -25, -76, -90, -57, -12, -1, -90, -13, -21, -6, -18, -11, -22, -90, -23, -25, -14, -14, -90, -6, -18, -25, -6, -90, -13, -17, -19, -18, -6, -90, -23, -18, -25, -12, -19, -21, -90, -6, -18, -21, -90, -7, -6, -8, -5, -23, -6, -5, -8, -21, -11, -20, -90, -6, -18, -21, -90, -40, -21, -23, -1, -23, -14, -21, -8, -36, -17, -21, -3, -90, -11, -8, -90, -6, -18, -21, -90, -25, -22, -25, -10, -6, -21, -8, -90, -23, -11, -12, -6, -21, -12, -6, -7, -90, -7, -18, -11, -5, -14, -22, -90, -24, -21, -90, -10, -11, -7, -6, -10, -11, -12, -21, -22, -90, -6, -11, -6, -18, -21, -90, -12, -21, -2, -6, -90, -20, -8, -25, -13, -21, -76, -28, 2, 15, 15, 16, 21, -63, 4, 2, 13, 13, -63, 21, 9, 10, 20, -63, 14, 6, 21, 9, 16, 5, -63, 24, 9, 10, 13, 6, -63, -13, 6, 4, 26, 4, 13, 6, 19, -9, 10, 6, 24, -63, 10, 20, -63, 4, 16, 14, 17, 22, 21, 10, 15, 8, -63, 2, -63, 13, 2, 26, 16, 22, 21, -63, 16, 19, -63, 20, 4, 19, 16, 13, 13, 10, 15, 8, -35, -5, 8, 8, 9, 14, -70, 0, 6, 3, 8, 1, -70, 17, 3, 14, 2, 9, 15, 14, -70, -5, -70, -26, -5, 19, 9, 15, 14, -25, -5, 8, -5, 1, -1, 12, -70, 13, -1, 14, -56, -70, -35, -5, 6, 6, -70, 13, -1, 14, -26, -5, 19, 9, 15, 14, -25, -5, 8, -5, 1, -1, 12, -70, 17, 3, 14, 2, -70, -5, -70, 8, 9, 8, -57, 8, 15, 6, 6, -70, -5, 12, 1, 15, 7, -1, 8, 14, -56, -33, -3, 10, 10, 11, 16, -68, 15, -1, 14, 11, 8, 8, -68, 16, 11, -68, 12, 11, 15, 5, 16, 5, 11, 10, -68, -3, -68, -24, -3, 21, 11, 17, 16, -23, -3, 10, -3, 3, 1, 14, -68, 15, 1, 16, -54, -68, -33, -3, 8, 8, -68, 15, 1, 16, -24, -3, 21, 11, 17, 16, -23, -3, 10, -3, 3, 1, 14, -68, 19, 5, 16, 4, -68, -3, -68, 10, 11, 10, -55, 10, 17, 8, 8, -68, -3, 14, 3, 17, 9, 1, 10, 16, -54, -29, 1, 14, 14, 15, 20, -64, 19, 3, 18, 15, 12, 12, -64, 23, 9, 20, 8, 15, 21, 20, -64, 1, -64, -20, 1, 25, 15, 21, 20, -19, 1, 14, 1, 7, 5, 18, -64, 19, 5, 20, -50, -64, -29, 1, 12, 12, -64, 19, 5, 20, -20, 1, 25, 15, 21, 20, -19, 1, 14, 1, 7, 5, 18, -64, 23, 9, 20, 8, -64, 1, -64, 14, 15, 14, -51, 14, 21, 12, 12, -64, 1, 18, 7, 21, 13, 5, 14, 20, -50, -19, 11, 24, 24, 25, 30, -54, 29, 23, 25, 25, 30, 18, -54, 29, 13, 28, 25, 22, 22, -54, 33, 19, 
        30, 18, 25, 31, 30, -54, 11, -54, -10, 11, 35, 25, 31, 30, -9, 11, 24, 11, 17, 15, 28, -54, 29, 15, 30, -40, -54, -19, 11, 22, 22, -54, 29, 15, 30, -10, 11, 35, 25, 31, 30, -9, 11, 24, 11, 17, 15, 28, -54, 33, 19, 30, 18, -54, 11, -54, 24, 25, 24, -41, 24, 31, 22, 22, -54, 11, 28, 17, 31, 23, 15, 24, 30, -40, -53, -10, -89, -11, -10, -5, -89, -6, -20, -5, -45, -24, 0, -10, -4, -5, -51, -7, -10, 1, -20, -11, -89, -16, -11, -89, -13, -24, 0, -10, -4, -5, -89, -10, -7, -89, -6, -22, -7, -10, -13, -13, -14, 31, 31, 28, 31, -51, 29, 31, 28, 16, 18, 32, 32, 22, 27, 20, -51, 32, 16, 31, 28, 25, 25, -24, -51, 29, 28, 22, 27, 33, 18, 31, -51, 22, 27, 17, 18, 37, -51, 19, 28, 31, -51, 22, 17, -51, -55, -34, -10, -20, -14, -15, -54, -34, -21, -34, -28, -30, -17, -99, -52, -19, -98, -33, -30, -33, -18, -14, -29, -16, -98, -33, -14, -14, -33, -31, -26, -29, -30, -71, -98, -15, -23, -25, -18, -18, -25, -20, -27, -98, -22, -33, -9, -19, -13, -14, -3, 30, -49, 27, 16, 40, 30, 36, 35, -49, 28, 16, 29, 16, 22, 20, 33, -49, 16, 35, 35, 16, 18, 23, 20, 19, -22, -49, 34, 26, 24, 31, 31, 24, 29, 22, -49, 27, 16, 40, 30, 36, 35, 3, 37, 34, 21, 31, 24, 32, -45, 42, 27, 28, 31, 24, -45, 32, 20, 39, 22, 27, 28, 33, 26, -45, 22, 27, 20, 33, 26, 24, 23, -45, 41, 28, 24, 42, -45, 27, 34, 31, 23, 24, 37, 38, -45, 42, 28, 39, 27, -45, 39, 27, 24, -45, 33, 24, 42, 34, 33, 24, 38, -31, -45, 7, 27, 24, -45, 35, 37, 24, -32, 31, 20, 44, 34, 40, 39, -45, 28, 33, 25, 34, 37, 32, 20, 39, 28, 34, 33, -45, 25, 34, 37, -45, 39, 27, 24, -45, 22, 27, 20, 33, 26, 24, -45, 27, 34, 31, 23, 24, 37, -45, -3, 1, -53, -15, 32, 23, 23, -12, 25, 33, 12, 23, 20, 15, 12, 31, 16, -7, -3, -57, -10, 21, -13, 8, 32, 22, 28, 27, -14, -10, -64, -16, 1, 18, 20, 9, 1, 12, -23, 14, 22, 1, 12, 9, 4, 1, 20, 5, -10, -6, -60, -9, 7, 22, 19, 16, 16, 1, 20, 18, 40, 18, 27, 20, 33, 5, 24, 20, 38, -72, -53, -55, -33, -55, -46, -53, -40, -68, -49, -53, -35, -122, -54, -43, -53, -39, -122, -44, -43, -38, -122, -39, -37, -42, -42, -43, -40, -38, -122, -39, -55, -40, -43, -46, -46, -49, -44, -51, -122, -38, -43, -122, -57, -44, -122, -57, -56, -39, -43, -46, -37, -38, -53, -122, -42, -43, -39, -49, -38, -49, -43, -44, -108, -122, -69, -39, -53, -122, -39, -55, -40, -43, -46, -46, -70, -43, -74, -43, -39, -49, -38, -49, -43, -44, -122, -49, -44, -39, -38, -53, -57, -54, 27, 46, 44, 66, 44, 53, 46, 59, 31, 50, 46, 64, -23, 49, 42, 60, -23, 55, 56, -23, 21, 42, 66, 56, 62, 61, 22, 42, 55, 42, 48, 46, 59, -10, 25, 17, -62, 6, 11, 8, 8, 7, 20, 7, 16, 22, -62, -8, 11, 7, 25, -22, 17, 14, 6, 7, 20, 21, -62, 10, 3, 24, 7, -62, 22, 10, 7, -62, 21, 3, 15, 7, -62, 5, 10, 3, 16, 9, 7, -62, -21, -26, -48, -62, -10, 10, 11, 21, -62, 15, 11, 9, 10, 22, -62, 10, 3, 18, 18, 7, 16, -62, 6, 23, 7, -62, 22, 17, -62, 11, 16, 5, 17, 16, 21, 11, 21, 22, 7, 16, 22, -62, -29, 6, 3, 18, 22, 7, 20, -62, 23, 18, 6, 3, 22, 7, -62, 7, 24, 7, 16, 22, 21, -62, 17, 20, -62, 11, 8, -62, 22, 10, 7, -62, -18, 3, 27, 17, 23, 22, -17, 3, 16, 3, 9, 7, 20, -62, 14, 3, 27, 21, -62, 17, 23, 22, -62, 22, 10, 7, -62, 21, 3, 15, 7, -62, -8, 11, 7, 25, -62, 15, 23, 14, 22, 11, 18, 14, 7, -62, 22, 11, 15, 7, 21, -48, -84, -62, -8, 11, 7, 25, -22, 17, 14, 6, 7, 20, -62, -45, -36, -31, 4, -4, -83, -15, -10, -13, -13, -14, -1, -14, -5, 1, -83, -29, -10, -14, 4, -43, -4, -7, -15, -14, -1, 0, -83, -11, -18, 3, -14, -83, 1, -11, -14, -83, 0, -18, -6, -14, -83, 0, 1, -18, -17, -7, -14, -83, -42, -47, -69, -83, -32, 1, -18, -17, -7, -14, -83, -42, -47, 0, -83, -10, -5, -83, 6, -4, 2, -1, -83, -18, -15, -18, -3, 1, -14, -1, -83, -38, -30, -32, -31, -83, -49, -46, -83, 2, -5, -10, -2, 2, -14, -83, -18, -5, -15, -83, -32, -43, -36, -30, -39, -47, -83, -37, -36, -31, -83, -16, -11, -18, -5, -12, -14, -69, -105, -83, -29, -10, -14, 4, -43, -4, -7, -15, -14, -1, -83, -66, -57, -4, 15, 11, 29, -58, 28, 30, 30, 32, 46, 46, 36, 29, 36, 39, 36, 47, 52, -53, -48, -39, -52, -54, -37, -48, -42, -43, -121, -44, -36, -38, -37, -121, -55, -52, -121, -56, -55, -38, -42, -45, -36, -37, -52, -107, -121, -39, -52, -54, -52, -48, -35, -52, -53, -95, -40, -41, -84, -47, -46, -43, -51, -65, -46, -50, -32, -86, -35, -35, -54, -52, -47, -50, -51, -67, -40, -64, -46, -41, -51, -40, -32, -34, -35, -78, -41, -40, -37, -45, -59, -40, -44, -26, -77, -44, -29, -48, -46, -41, -44, -45, -75, -31, -34, -36, -58, -40, -35, -45, -34, -26, -25, -26, -65, -35, -20, -69, -32, -31, -28, -36, 
        -68, -22, -39, -17, -31, -26, -33, -57, -22, -36, -35, -22, 18, 17, -20, 17, 23, 8, 21, 6, 8, 19, 23, -9, 18, 24, 6, 11, -24, 25, 8, 17, 23, 29, 15, 30, -3, 13, 28, 25, 22, 22, 19, 24, 17, -2, 25, 31, 13, 18, -3, 22, 25, 26, -46, -45, -28, -54, 12, 11, 14, -54, 11, 28, 17, 31, 23, 15, 24, 30, -54, 13, 25, 24, 29, 30, 11, 24, 30, -54};
    }

    static {
        A0W();
        A1I = new int[]{16843830};
        A1H = new int[]{16842987};
        A1C = false;
        A1B = Build.VERSION.SDK_INT >= 23;
        A1D = true;
        A1E = true;
        A1F = false;
        A1G = false;
        Class<?> cls = Integer.TYPE;
        A1J = new Class[]{Context.class, AttributeSet.class, cls, cls};
        A1A = new InterpolatorC1947ij();
    }

    public C7O(Context context) {
        this(context, null);
    }

    public C7O(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public C7O(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.A11 = new C0992Ir(this);
        this.A0r = new C1968j4(this);
        this.A0t = new C1986jM();
        this.A0u = new RunnableC1945ih(this);
        this.A0p = new Rect();
        this.A0z = new Rect();
        this.A0q = new RectF();
        this.A0v = new ArrayList<>();
        this.A13 = new ArrayList<>();
        this.A0O = 0;
        this.A0C = false;
        this.A0U = 0;
        this.A0N = 0;
        this.A05 = new C7S();
        this.A0W = 0;
        this.A0V = -1;
        this.A0L = Float.MIN_VALUE;
        this.A0M = Float.MIN_VALUE;
        this.A0o = true;
        this.A08 = new RunnableC1977jD(this);
        this.A02 = A1E ? new JA() : null;
        this.A0s = new C1975jB();
        this.A0G = false;
        this.A0H = false;
        this.A0f = new C0995Iu(this);
        this.A0K = false;
        this.A14 = new int[2];
        this.A17 = new int[2];
        this.A16 = new int[2];
        this.A15 = new int[2];
        this.A0w = new ArrayList();
        this.A0k = new RunnableC1946ii(this);
        this.A12 = new J2(this);
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, A1H, i5, 0);
            this.A0B = typedArrayObtainStyledAttributes.getBoolean(0, true);
            typedArrayObtainStyledAttributes.recycle();
        } else {
            this.A0B = true;
        }
        setScrollContainer(true);
        setFocusableInTouchMode(true);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.A0X = viewConfiguration.getScaledTouchSlop();
        this.A0L = AbstractC1881hc.A00(viewConfiguration, context);
        this.A0M = AbstractC1881hc.A01(viewConfiguration, context);
        this.A0y = viewConfiguration.getScaledMinimumFlingVelocity();
        this.A0x = viewConfiguration.getScaledMaximumFlingVelocity();
        setWillNotDraw(getOverScrollMode() == 2);
        this.A05.A0J(this.A0f);
        A0e();
        A0O();
        if (AbstractC1880hb.A00(this) == 0) {
            AbstractC1880hb.A09(this, 1);
        }
        this.A10 = (AccessibilityManager) getContext().getSystemService(A0I(1884, 13, 102));
        setAccessibilityDelegateCompat(new C0978Ic(this));
        setDescendantFocusability(SQLiteDatabase.OPEN_PRIVATECACHE);
        setNestedScrollingEnabled(true);
    }

    private int A0B(View view) {
        int id2 = view.getId();
        while (!view.isFocused() && (view instanceof ViewGroup) && view.hasFocus()) {
            view = ((ViewGroup) view).getFocusedChild();
            int id3 = view.getId();
            if (id3 != -1) {
                id2 = view.getId();
            }
        }
        return id2;
    }

    private final long A0C(AbstractC1978jE abstractC1978jE) {
        return this.A04.A0O() ? abstractC1978jE.A0V() : abstractC1978jE.A03;
    }

    private View A0D() {
        AbstractC1978jE abstractC1978jEA1H;
        int i5 = this.A0s.A01 != -1 ? this.A0s.A01 : 0;
        int iA03 = this.A0s.A03();
        for (int i11 = i5; i11 < iA03; i11++) {
            AbstractC1978jE abstractC1978jEA1H2 = A1H(i11);
            if (abstractC1978jEA1H2 == null) {
                break;
            }
            if (abstractC1978jEA1H2.A0H.hasFocusable()) {
                return abstractC1978jEA1H2.A0H;
            }
        }
        int startFocusSearchIndex = Math.min(iA03, i5);
        for (int limit = startFocusSearchIndex - 1; limit >= 0 && (abstractC1978jEA1H = A1H(limit)) != null; limit--) {
            if (abstractC1978jEA1H.A0H.hasFocusable()) {
                return abstractC1978jEA1H.A0H;
            }
        }
        return null;
    }

    private final AbstractC1978jE A0E(long j11) {
        if (this.A04 == null || !this.A04.A0O()) {
            return null;
        }
        int iA06 = this.A01.A06();
        AbstractC1978jE abstractC1978jE = null;
        for (int i5 = 0; i5 < iA06; i5++) {
            AbstractC1978jE holder = A0F(this.A01.A0A(i5));
            if (holder != null && !holder.A0n()) {
                long jA0V = holder.A0V();
                String[] strArr = A19;
                String str = strArr[3];
                String str2 = strArr[0];
                int length = str.length();
                int childCount = str2.length();
                if (length == childCount) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A19;
                strArr2[2] = "zZZE93";
                strArr2[7] = "VhF552wVYFMR";
                if (jA0V != j11) {
                    continue;
                } else if (this.A01.A0K(holder.A0H)) {
                    abstractC1978jE = holder;
                } else {
                    return holder;
                }
            }
        }
        return abstractC1978jE;
    }

    public static AbstractC1978jE A0F(View view) {
        if (view == null) {
            return null;
        }
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (A19[1].length() != 32) {
            throw new RuntimeException();
        }
        String[] strArr = A19;
        strArr[6] = "BAOGG7B6SgQWpjs0haC4kmkQlPV7A4k9";
        strArr[4] = "PAhaNRNZ3VZ1U75Bha3wwWQKZTmx8jYI";
        return ((C1961ix) layoutParams).A00;
    }

    private final AbstractC1978jE A0G(View view) {
        View itemView = A1G(view);
        if (itemView == null) {
            return null;
        }
        return A1K(itemView);
    }

    public static C7O A0H(View view) {
        if (!(view instanceof ViewGroup)) {
            return null;
        }
        boolean z11 = view instanceof C7O;
        if (A19[5].charAt(2) != 'Y') {
            throw new RuntimeException();
        }
        A19[1] = "St3OXKQiThZ0lO5vTnfaG6NXMltPJG5W";
        if (z11) {
            return (C7O) view;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int count = viewGroup.getChildCount();
        for (int i5 = 0; i5 < count; i5++) {
            C7O c7oA0H = A0H(viewGroup.getChildAt(i5));
            if (c7oA0H != null) {
                return c7oA0H;
            }
        }
        return null;
    }

    private void A0J() {
        A0T();
        setScrollState(0);
    }

    private void A0K() {
        int i5 = this.A0P;
        this.A0P = 0;
        if (i5 != 0) {
            boolean zA1x = A1x();
            String[] strArr = A19;
            String str = strArr[2];
            String str2 = strArr[7];
            int length = str.length();
            int flags = str2.length();
            if (length == flags) {
                throw new RuntimeException();
            }
            String[] strArr2 = A19;
            strArr2[3] = "eU2cwXbbXfV7oR8qPBCYPw";
            strArr2[0] = "cj1lHsGs8Y";
            if (zA1x) {
                AccessibilityEvent event = AccessibilityEvent.obtain();
                event.setEventType(2048);
                AbstractC1898hu.A01(event, i5);
                sendAccessibilityEventUnchecked(event);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:55:0x01a1 A[PHI: r1
      0x01a1: PHI (r1v9 com.facebook.ads.redexgen.X.jE) = (r1v8 com.facebook.ads.redexgen.X.jE), (r1v12 com.facebook.ads.redexgen.X.jE) binds: [B:53:0x019e, B:50:0x0186] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0L() {
        AbstractC1978jE abstractC1978jEA0F;
        this.A0s.A04(1);
        A1q(this.A0s);
        this.A0s.A0A = false;
        A1N();
        this.A0t.A06();
        A1O();
        A0P();
        A0U();
        this.A0s.A0E = this.A0s.A0C && this.A0H;
        this.A0H = false;
        this.A0G = false;
        this.A0s.A09 = this.A0s.A0B;
        this.A0s.A03 = this.A04.A0B();
        A0y(this.A14);
        if (this.A0s.A0C) {
            int iA05 = this.A01.A05();
            for (int i5 = 0; i5 < iA05; i5++) {
                AbstractC1978jE abstractC1978jEA0F2 = A0F(this.A01.A09(i5));
                boolean zA0s = abstractC1978jEA0F2.A0s();
                String[] strArr = A19;
                String str = strArr[2];
                String str2 = strArr[7];
                int i11 = str.length();
                int count = str2.length();
                if (i11 != count) {
                    A19[5] = "UNYHKTM9Pgc2Q8zoabZHHBhpghLQMYt4";
                    if (!zA0s) {
                        boolean zA0m = abstractC1978jEA0F2.A0m();
                        String[] strArr2 = A19;
                        String str3 = strArr2[2];
                        String str4 = strArr2[7];
                        int i12 = str3.length();
                        int count2 = str4.length();
                        if (i12 != count2) {
                            A19[5] = "yAYMfY7gQPsOXL0bw1Y8FO5LYSWRNpHN";
                            if (zA0m) {
                                AbstractC1948ik abstractC1948ik = this.A04;
                                int i13 = A19[5].charAt(2);
                                if (i13 != 89) {
                                    String[] strArr3 = A19;
                                    strArr3[2] = "S1msfb";
                                    strArr3[7] = "DqMDNTpz3t0S";
                                    if (!abstractC1948ik.A0O()) {
                                        continue;
                                    }
                                } else {
                                    String[] strArr4 = A19;
                                    strArr4[6] = "3GcQR0gwPdJ7qG9NsafqkCoBzG49WZbm";
                                    strArr4[4] = "xwZbJMHEvrrw2fWE8anB3sW9hLiJiwUw";
                                    if (!abstractC1948ik.A0O()) {
                                        continue;
                                    }
                                }
                            }
                            AbstractC1956is abstractC1956is = this.A05;
                            C1975jB c1975jB = this.A0s;
                            int i14 = AbstractC1956is.A06(abstractC1978jEA0F2);
                            this.A0t.A0F(abstractC1978jEA0F2, abstractC1956is.A0F(c1975jB, abstractC1978jEA0F2, i14, abstractC1978jEA0F2.A0W()));
                            if (this.A0s.A0E && abstractC1978jEA0F2.A0q() && !abstractC1978jEA0F2.A0n() && !abstractC1978jEA0F2.A0s() && !abstractC1978jEA0F2.A0m()) {
                                long jA0C = A0C(abstractC1978jEA0F2);
                                C1986jM c1986jM = this.A0t;
                                int i15 = A19[1].length();
                                if (i15 == 32) {
                                    String[] strArr5 = A19;
                                    strArr5[3] = "VKmUie50Iu1ZqeQWLORu5w";
                                    strArr5[0] = "PYciOOvrvR";
                                    c1986jM.A08(jA0C, abstractC1978jEA0F2);
                                }
                            }
                        }
                    }
                }
                throw new RuntimeException();
            }
        }
        if (this.A0s.A0B) {
            A0i();
            boolean z11 = this.A0s.A0D;
            this.A0s.A0D = false;
            this.A06.A2Z(this.A0r, this.A0s);
            this.A0s.A0D = z11;
            for (int i16 = 0; i16 < this.A01.A05(); i16++) {
                C1924iK c1924iK = this.A01;
                int i17 = A19[1].length();
                if (i17 != 32) {
                    String[] strArr6 = A19;
                    strArr6[2] = "4lQmW8";
                    strArr6[7] = "2Uq8uzi7rIEU";
                    abstractC1978jEA0F = A0F(c1924iK.A09(i16));
                    boolean didStructureChange = abstractC1978jEA0F.A0s();
                    if (!didStructureChange) {
                        boolean didStructureChange2 = this.A0t.A0I(abstractC1978jEA0F);
                        if (!didStructureChange2) {
                            int iA06 = AbstractC1956is.A06(abstractC1978jEA0F);
                            boolean wasHidden = abstractC1978jEA0F.A0v(UserMetadata.MAX_INTERNAL_KEY_SIZE);
                            if (!wasHidden) {
                                iA06 |= androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                            }
                            C1955ir c1955irA0F = this.A05.A0F(this.A0s, abstractC1978jEA0F, iA06, abstractC1978jEA0F.A0W());
                            if (wasHidden) {
                                A1r(abstractC1978jEA0F, c1955irA0F);
                            } else {
                                this.A0t.A0D(abstractC1978jEA0F, c1955irA0F);
                            }
                        }
                    }
                } else {
                    A19[1] = "EzPEwBDGhSnYyJadD6vqsk9WPl8azgQD";
                    abstractC1978jEA0F = A0F(c1924iK.A09(i16));
                    boolean didStructureChange3 = abstractC1978jEA0F.A0s();
                    if (didStructureChange3) {
                    }
                }
            }
            A0X();
        } else {
            A0X();
        }
        A1P();
        A1w(false);
        this.A0s.A04 = 2;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x007a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0M() {
        boolean z11;
        A1N();
        A1O();
        this.A0s.A04(6);
        this.A00.A0G();
        this.A0s.A03 = this.A04.A0B();
        this.A0s.A00 = 0;
        this.A0s.A09 = false;
        this.A06.A2Z(this.A0r, this.A0s);
        this.A0s.A0D = false;
        this.A0j = null;
        C1975jB c1975jB = this.A0s;
        if (this.A0s.A0C) {
            AbstractC1956is abstractC1956is = this.A05;
            String[] strArr = A19;
            if (strArr[3].length() == strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A19;
            strArr2[6] = "QyMu0uKDVMcIUQ2WaaKkjpUJvINNzfF4";
            strArr2[4] = "jnZHkwnP1Z9tC9uQsacmbdRp3FaoK01F";
            z11 = abstractC1956is != null;
        }
        c1975jB.A0C = z11;
        C1975jB c1975jB2 = this.A0s;
        if (A19[1].length() != 32) {
            c1975jB2.A04 = 4;
            A1P();
            A1w(false);
        } else {
            A19[1] = "3IsVIAoReRfPbfS1EeUcjIwVgXkj1JVv";
            c1975jB2.A04 = 4;
            A1P();
            A1w(false);
        }
    }

    private void A0O() {
        this.A01 = new C1924iK(new J1(this));
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0039  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0057  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0P() {
        boolean animationTypeSupported;
        if (this.A0C) {
            this.A00.A0I();
            this.A06.A2e(this);
        }
        if (A10()) {
            this.A00.A0H();
        } else {
            this.A00.A0G();
        }
        boolean z11 = false;
        boolean z12 = this.A0G || this.A0H;
        C1975jB c1975jB = this.A0s;
        boolean animationTypeSupported2 = this.A0D;
        if (!animationTypeSupported2 || this.A05 == null) {
            animationTypeSupported = false;
        } else {
            boolean animationTypeSupported3 = this.A0C;
            if (animationTypeSupported3 || z12) {
                boolean z13 = this.A0C;
                if (A19[5].charAt(2) != 'Y') {
                    throw new RuntimeException();
                }
                String[] strArr = A19;
                strArr[6] = "q3lLGfTGOOnJqHZydaTklLew08TAvgTY";
                strArr[4] = "cayAc0YyiA2wrQyaXaOul4VyYlz5tKdZ";
                if (z13) {
                    boolean animationTypeSupported4 = this.A04.A0O();
                    if (animationTypeSupported4) {
                    }
                }
                animationTypeSupported = true;
            } else {
                boolean animationTypeSupported5 = this.A06.A09;
                if (animationTypeSupported5) {
                }
            }
        }
        c1975jB.A0C = animationTypeSupported;
        C1975jB c1975jB2 = this.A0s;
        boolean animationTypeSupported6 = this.A0s.A0C;
        if (animationTypeSupported6 && z12) {
            boolean animationTypeSupported7 = this.A0C;
            if (!animationTypeSupported7) {
                boolean animationTypeSupported8 = A10();
                if (animationTypeSupported8) {
                    z11 = true;
                }
            }
        }
        c1975jB2.A0B = z11;
        if (A19[1].length() == 32) {
            A19[5] = "vAY5NMbknnGVxibfJ54Fdf4KbFDo9MxQ";
            return;
        }
        String[] strArr2 = A19;
        strArr2[2] = "gWU7AH";
        strArr2[7] = "O2IXTNL1mXfE";
    }

    private void A0Q() {
        View viewToFocus;
        if (this.A0o && this.A04 != null && hasFocus() && getDescendantFocusability() != 393216) {
            if (getDescendantFocusability() == 131072 && isFocused()) {
                return;
            }
            boolean zIsFocused = isFocused();
            if (A19[5].charAt(2) != 'Y') {
                throw new RuntimeException();
            }
            A19[5] = "GSYhD7ljhsNq0QcPBhSV8ATJlhol3xt1";
            if (!zIsFocused) {
                View focusedChild = getFocusedChild();
                if (A1G && (focusedChild.getParent() == null || !focusedChild.hasFocus())) {
                    if (this.A01.A05() == 0) {
                        requestFocus();
                        return;
                    }
                } else if (!this.A01.A0K(focusedChild)) {
                    return;
                }
            }
            AbstractC1978jE abstractC1978jEA0E = null;
            if (this.A0s.A08 != -1 && this.A04.A0O()) {
                abstractC1978jEA0E = A0E(this.A0s.A08);
            }
            View viewA0D = null;
            if (abstractC1978jEA0E == null || this.A01.A0K(abstractC1978jEA0E.A0H) || !abstractC1978jEA0E.A0H.hasFocusable()) {
                if (this.A01.A05() > 0) {
                    viewA0D = A0D();
                }
            } else {
                viewA0D = abstractC1978jEA0E.A0H;
            }
            if (viewA0D != null) {
                if (this.A0s.A02 != -1 && (viewToFocus = viewA0D.findViewById(this.A0s.A02)) != null && viewToFocus.isFocusable()) {
                    viewA0D = viewToFocus;
                }
                viewA0D.requestFocus();
            }
        }
    }

    private void A0R() {
        boolean zIsFinished = false;
        if (this.A0a != null) {
            this.A0a.onRelease();
            zIsFinished = this.A0a.isFinished();
        }
        if (this.A0c != null) {
            this.A0c.onRelease();
            boolean needsInvalidate = this.A0c.isFinished();
            zIsFinished |= needsInvalidate;
        }
        if (this.A0b != null) {
            this.A0b.onRelease();
            boolean needsInvalidate2 = this.A0b.isFinished();
            zIsFinished |= needsInvalidate2;
        }
        if (this.A0Z != null) {
            this.A0Z.onRelease();
            boolean needsInvalidate3 = this.A0Z.isFinished();
            zIsFinished |= needsInvalidate3;
        }
        if (zIsFinished) {
            AbstractC1880hb.A07(this);
        }
    }

    private void A0S() {
        this.A0s.A08 = -1L;
        this.A0s.A01 = -1;
        this.A0s.A02 = -1;
    }

    private void A0T() {
        if (this.A0Y != null) {
            this.A0Y.clear();
        }
        A1b(0);
        A0R();
    }

    private void A0U() {
        int iA0R;
        View focusedChild = null;
        if (this.A0o && hasFocus() && this.A04 != null) {
            focusedChild = getFocusedChild();
        }
        AbstractC1978jE abstractC1978jEA0G = focusedChild == null ? null : A0G(focusedChild);
        if (abstractC1978jEA0G == null) {
            A0S();
            return;
        }
        this.A0s.A08 = this.A04.A0O() ? abstractC1978jEA0G.A0V() : -1L;
        C1975jB c1975jB = this.A0s;
        if (this.A0C) {
            iA0R = -1;
        } else {
            iA0R = abstractC1978jEA0G.A0n() ? abstractC1978jEA0G.A01 : abstractC1978jEA0G.A0R();
        }
        c1975jB.A01 = iA0R;
        C1975jB c1975jB2 = this.A0s;
        View child = abstractC1978jEA0G.A0H;
        c1975jB2.A02 = A0B(child);
    }

    private void A0V() {
        this.A08.A08();
        if (this.A06 != null) {
            this.A06.A27();
        }
    }

    private final void A0X() {
        int iA06 = this.A01.A06();
        for (int i5 = 0; i5 < iA06; i5++) {
            C1924iK c1924iK = this.A01;
            String[] strArr = A19;
            String str = strArr[3];
            String str2 = strArr[0];
            int i11 = str.length();
            int childCount = str2.length();
            if (i11 == childCount) {
                throw new RuntimeException();
            }
            String[] strArr2 = A19;
            strArr2[3] = "VFyFJGthyduvDNyVUqu48D";
            strArr2[0] = "uBjdUWzzez";
            AbstractC1978jE abstractC1978jEA0F = A0F(c1924iK.A0A(i5));
            if (!abstractC1978jEA0F.A0s()) {
                abstractC1978jEA0F.A0X();
            }
        }
        this.A0r.A0L();
    }

    private final void A0Y() {
        AbstractC1948ik abstractC1948ik = this.A04;
        String strA0I = A0I(1423, 12, 90);
        if (abstractC1948ik == null) {
            Log.e(strA0I, A0I(1176, 36, 41));
            return;
        }
        if (this.A06 == null) {
            Log.e(strA0I, A0I(1212, 43, 90));
            return;
        }
        this.A0s.A0A = false;
        if (this.A0s.A04 == 1) {
            A0L();
            this.A06.A2g(this);
            A0M();
        } else if (this.A00.A0K() || this.A06.A1e() != getWidth() || this.A06.A1U() != getHeight()) {
            this.A06.A2g(this);
            A0M();
        } else {
            this.A06.A2g(this);
        }
        A0N();
    }

    private final void A0Z() {
        int state;
        for (int size = this.A0w.size() - 1; size >= 0; size--) {
            AbstractC1978jE abstractC1978jE = this.A0w.get(size);
            if (abstractC1978jE.A0H.getParent() == this && !abstractC1978jE.A0s() && (state = abstractC1978jE.A02) != -1) {
                AbstractC1880hb.A09(abstractC1978jE.A0H, state);
                abstractC1978jE.A02 = -1;
            }
        }
        this.A0w.clear();
    }

    private final void A0a() {
        if (this.A0Z != null) {
            return;
        }
        this.A0Z = new EdgeEffect(getContext());
        if (this.A0B) {
            this.A0Z.setSize((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight(), (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom());
        } else {
            this.A0Z.setSize(getMeasuredWidth(), getMeasuredHeight());
        }
    }

    private final void A0b() {
        if (this.A0a != null) {
            return;
        }
        this.A0a = new EdgeEffect(getContext());
        if (this.A0B) {
            EdgeEffect edgeEffect = this.A0a;
            int measuredHeight = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
            int measuredWidth = getMeasuredWidth() - getPaddingLeft();
            String[] strArr = A19;
            if (strArr[2].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A19;
            strArr2[6] = "GMHrLIeJxdXYoHZyaa7kSwSfzExGbrBL";
            strArr2[4] = "0YT1HYXH3vPYSlLI8aOL6WZeFeHH6VHe";
            edgeEffect.setSize(measuredHeight, measuredWidth - getPaddingRight());
            return;
        }
        this.A0a.setSize(getMeasuredHeight(), getMeasuredWidth());
    }

    private final void A0c() {
        if (this.A0b != null) {
            return;
        }
        this.A0b = new EdgeEffect(getContext());
        if (this.A0B) {
            this.A0b.setSize((getMeasuredHeight() - getPaddingTop()) - getPaddingBottom(), (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight());
        } else {
            this.A0b.setSize(getMeasuredHeight(), getMeasuredWidth());
        }
    }

    private final void A0d() {
        if (this.A0c != null) {
            return;
        }
        this.A0c = new EdgeEffect(getContext());
        if (this.A0B) {
            this.A0c.setSize((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight(), (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom());
            return;
        }
        EdgeEffect edgeEffect = this.A0c;
        int measuredWidth = getMeasuredWidth();
        if (A19[1].length() != 32) {
            throw new RuntimeException();
        }
        String[] strArr = A19;
        strArr[2] = "10JS50";
        strArr[7] = "NY78MD5eAiV9";
        edgeEffect.setSize(measuredWidth, getMeasuredHeight());
    }

    private final void A0e() {
        this.A00 = new JB(new C0996Iv(this));
    }

    private final void A0f() {
        this.A0Z = null;
        this.A0c = null;
        this.A0b = null;
        this.A0a = null;
    }

    private final void A0g() {
        int iA06 = this.A01.A06();
        for (int i5 = 0; i5 < iA06; i5++) {
            ((C1961ix) this.A01.A0A(i5).getLayoutParams()).A01 = true;
        }
        this.A0r.A0N();
    }

    private final void A0h() {
        int iA06 = this.A01.A06();
        for (int i5 = 0; i5 < iA06; i5++) {
            AbstractC1978jE abstractC1978jEA0F = A0F(this.A01.A0A(i5));
            if (abstractC1978jEA0F != null && !abstractC1978jEA0F.A0s()) {
                abstractC1978jEA0F.A0e(6);
            }
        }
        A0g();
        this.A0r.A0O();
    }

    private final void A0i() {
        int iA06 = this.A01.A06();
        for (int i5 = 0; i5 < iA06; i5++) {
            AbstractC1978jE abstractC1978jEA0F = A0F(this.A01.A0A(i5));
            if (!abstractC1978jEA0F.A0s()) {
                abstractC1978jEA0F.A0c();
            }
        }
    }

    private void A0j(float f11, float f12, float f13, float f14) {
        boolean z11 = false;
        if (f12 < 0.0f) {
            A0b();
            AbstractC1915iB.A00(this.A0a, (-f12) / getWidth(), 1.0f - (f13 / getHeight()));
            z11 = true;
        } else if (f12 > 0.0f) {
            A0c();
            AbstractC1915iB.A00(this.A0b, f12 / getWidth(), f13 / getHeight());
            z11 = true;
        }
        if (f14 < 0.0f) {
            A0d();
            AbstractC1915iB.A00(this.A0c, (-f14) / getHeight(), f11 / getWidth());
            z11 = true;
        } else if (f14 > 0.0f) {
            A0a();
            AbstractC1915iB.A00(this.A0Z, f14 / getHeight(), 1.0f - (f11 / getWidth()));
            z11 = true;
        }
        if (z11 || f12 != 0.0f || f14 != 0.0f) {
            AbstractC1880hb.A07(this);
        }
    }

    private final void A0k(int i5) {
        AbstractC1960iw abstractC1960iw = this.A06;
        if (this.A0i != null) {
            this.A0i.A0P(this, i5);
        }
        List<AbstractC1965j1> list = this.A0m;
        String[] strArr = A19;
        if (strArr[2].length() == strArr[7].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A19;
        strArr2[2] = "mB2qLC";
        strArr2[7] = "mQXIqdAaLius";
        if (list != null) {
            for (int size = this.A0m.size() - 1; size >= 0; size--) {
                this.A0m.get(size).A0P(this, i5);
            }
        }
    }

    private final void A0l(int i5, int i11, Interpolator interpolator) {
        if (this.A06 == null) {
            Log.e(A0I(1423, 12, 90), A0I(977, 97, 85));
            return;
        }
        boolean z11 = this.A0I;
        if (A19[1].length() != 32) {
            throw new RuntimeException();
        }
        String[] strArr = A19;
        strArr[2] = "pqK8Y9";
        strArr[7] = "UiASdGbGWO9v";
        if (z11) {
            return;
        }
        if (!this.A06.A2v()) {
            i5 = 0;
        }
        if (!this.A06.A2w()) {
            i11 = 0;
        }
        if (i5 != 0 || i11 != 0) {
            this.A08.A0D(i5, i11, interpolator);
        }
    }

    private void A0m(long j11, AbstractC1978jE abstractC1978jE, AbstractC1978jE abstractC1978jE2) {
        int iA05 = this.A01.A05();
        for (int i5 = 0; i5 < iA05; i5++) {
            AbstractC1978jE abstractC1978jEA0F = A0F(this.A01.A09(i5));
            if (abstractC1978jEA0F != abstractC1978jE && A0C(abstractC1978jEA0F) == j11) {
                AbstractC1948ik abstractC1948ik = this.A04;
                String strA0I = A0I(1, 17, 65);
                if (abstractC1948ik != null && this.A04.A0O()) {
                    throw new IllegalStateException(A0I(1749, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 56) + abstractC1978jEA0F + strA0I + abstractC1978jE + A1L());
                }
                throw new IllegalStateException(A0I(1561, 188, 77) + abstractC1978jEA0F + strA0I + abstractC1978jE + A1L());
            }
        }
        Log.e(A0I(1423, 12, 90), A0I(1255, 111, 94) + abstractC1978jE2 + A0I(18, 41, 39) + abstractC1978jE + A1L());
    }

    private void A0n(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        int pointerId = motionEvent.getPointerId(actionIndex);
        int actionIndex2 = this.A0V;
        if (pointerId != actionIndex2) {
            return;
        }
        int i5 = actionIndex == 0 ? 1 : 0;
        int actionIndex3 = motionEvent.getPointerId(i5);
        this.A0V = actionIndex3;
        int actionIndex4 = (int) (motionEvent.getX(i5) + 0.5f);
        this.A0S = actionIndex4;
        this.A0Q = actionIndex4;
        int actionIndex5 = (int) (motionEvent.getY(i5) + 0.5f);
        this.A0T = actionIndex5;
        this.A0R = actionIndex5;
    }

    public static void A0o(View view, Rect rect) {
        C1961ix c1961ix = (C1961ix) view.getLayoutParams();
        Rect rect2 = c1961ix.A03;
        rect.set((view.getLeft() - rect2.left) - c1961ix.leftMargin, (view.getTop() - rect2.top) - c1961ix.topMargin, view.getRight() + rect2.right + c1961ix.rightMargin, view.getBottom() + rect2.bottom + c1961ix.bottomMargin);
    }

    private void A0p(View view, View view2) {
        View view3 = view2 != null ? view2 : view;
        this.A0p.set(0, 0, view3.getWidth(), view3.getHeight());
        ViewGroup.LayoutParams focusedLayoutParams = view3.getLayoutParams();
        if (focusedLayoutParams instanceof C1961ix) {
            C1961ix c1961ix = (C1961ix) focusedLayoutParams;
            if (!c1961ix.A01) {
                Rect insets = c1961ix.A03;
                this.A0p.left -= insets.left;
                this.A0p.right += insets.right;
                this.A0p.top -= insets.top;
                this.A0p.bottom += insets.bottom;
            }
        }
        if (view2 != null) {
            offsetDescendantRectToMyCoords(view2, this.A0p);
            offsetRectIntoDescendantCoords(view, this.A0p);
        }
        this.A06.A35(this, view, this.A0p, !this.A0D, view2 == null);
    }

    private void A0q(AbstractC1948ik abstractC1948ik, boolean z11, boolean z12) {
        if (this.A04 != null) {
            AbstractC1948ik abstractC1948ik2 = this.A04;
            C0992Ir c0992Ir = this.A11;
            String[] strArr = A19;
            if (strArr[2].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A19;
            strArr2[6] = "W0We85FJJqvSsXa60a6gd4EA7hDdiGkp";
            strArr2[4] = "7sp9VzUFxAlBM78ItapDbGKr6NkpOVCZ";
            abstractC1948ik2.A0J(c0992Ir);
            this.A04.A0N(this);
        }
        if (!z11 || z12) {
            A1R();
        }
        this.A00.A0I();
        AbstractC1948ik abstractC1948ik3 = this.A04;
        this.A04 = abstractC1948ik;
        if (abstractC1948ik != null) {
            abstractC1948ik.A0I(this.A11);
        }
        AbstractC1960iw abstractC1960iw = this.A06;
        C1968j4 c1968j4 = this.A0r;
        AbstractC1948ik oldAdapter = this.A04;
        c1968j4.A0Z(abstractC1948ik3, oldAdapter, z11);
        this.A0s.A0D = true;
        A1T();
    }

    private final void A0r(AbstractC1957it abstractC1957it, int i5) {
        if (this.A06 != null) {
            this.A06.A2p(A0I(294, 53, 24));
        }
        if (this.A0v.isEmpty()) {
            setWillNotDraw(false);
        }
        if (i5 < 0) {
            ArrayList<AbstractC1957it> arrayList = this.A0v;
            if (A19[1].length() != 32) {
                throw new RuntimeException();
            }
            A19[1] = "csPuyufcMVSbd4QNytjq4rBIum7WhxYp";
            arrayList.add(abstractC1957it);
        } else {
            this.A0v.add(i5, abstractC1957it);
        }
        A0g();
        requestLayout();
    }

    private void A0s(AbstractC1978jE abstractC1978jE) {
        View view = abstractC1978jE.A0H;
        boolean z11 = view.getParent() == this;
        this.A0r.A0d(A1K(view));
        if (abstractC1978jE.A0p()) {
            C1924iK c1924iK = this.A01;
            String[] strArr = A19;
            if (strArr[3].length() == strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A19;
            strArr2[6] = "yAMck033yUmsKAwrNaBuaPdrYuAtD8a4";
            strArr2[4] = "2F1g5meBaFaT8Ughfaz4Efd5BOFwzFG2";
            c1924iK.A0H(view, -1, view.getLayoutParams(), true);
            return;
        }
        if (!z11) {
            this.A01.A0J(view, true);
        } else {
            this.A01.A0E(view);
        }
    }

    public static void A0t(AbstractC1978jE abstractC1978jE) {
        if (abstractC1978jE.A09 != null) {
            WeakReference<C7O> weakReference = abstractC1978jE.A09;
            if (A19[1].length() != 32) {
                throw new RuntimeException();
            }
            String[] strArr = A19;
            strArr[6] = "Lp0Vudgnjyr9htx58aJuOXSG6zR0Rms0";
            strArr[4] = "QnOoNSP4qihOpTYseackLt73SA9jbFjz";
            C7O c7o = weakReference.get();
            while (c7o != null) {
                View item = abstractC1978jE.A0H;
                if (c7o == item) {
                    return;
                }
                Object parent = c7o.getParent();
                if (parent instanceof View) {
                    c7o = (View) parent;
                } else {
                    c7o = null;
                }
            }
            abstractC1978jE.A09 = null;
        }
    }

    private void A0u(AbstractC1978jE abstractC1978jE, AbstractC1978jE abstractC1978jE2, C1955ir c1955ir, C1955ir c1955ir2, boolean z11, boolean z12) {
        abstractC1978jE.A0k(false);
        if (z11) {
            A0s(abstractC1978jE);
        }
        if (abstractC1978jE != abstractC1978jE2) {
            if (z12) {
                A0s(abstractC1978jE2);
            }
            abstractC1978jE.A06 = abstractC1978jE2;
            A0s(abstractC1978jE);
            this.A0r.A0d(abstractC1978jE);
            abstractC1978jE2.A0k(false);
            abstractC1978jE2.A07 = abstractC1978jE;
        }
        if (this.A05.A0R(abstractC1978jE, abstractC1978jE2, c1955ir, c1955ir2)) {
            A1Q();
        }
    }

    private void A0y(int[] iArr) {
        int iA05 = this.A01.A05();
        if (iA05 == 0) {
            iArr[0] = -1;
            iArr[1] = -1;
            return;
        }
        int maxPositionPreLayout = LayoutNode.NotPlacedPlaceOrder;
        int minPositionPreLayout = Integer.MIN_VALUE;
        for (int i5 = 0; i5 < iA05; i5++) {
            AbstractC1978jE abstractC1978jEA0F = A0F(this.A01.A09(i5));
            if (!abstractC1978jEA0F.A0s()) {
                int count = abstractC1978jEA0F.A0T();
                if (count < maxPositionPreLayout) {
                    maxPositionPreLayout = count;
                }
                if (count > minPositionPreLayout) {
                    minPositionPreLayout = count;
                }
            }
        }
        iArr[0] = maxPositionPreLayout;
        iArr[1] = minPositionPreLayout;
    }

    private boolean A0z() {
        int iA05 = this.A01.A05();
        for (int i5 = 0; i5 < iA05; i5++) {
            AbstractC1978jE abstractC1978jEA0F = A0F(this.A01.A09(i5));
            if (abstractC1978jEA0F != null && !abstractC1978jEA0F.A0s() && abstractC1978jEA0F.A0q()) {
                return true;
            }
        }
        return false;
    }

    private boolean A10() {
        return this.A05 != null && this.A06.A2x();
    }

    private boolean A12(int i5, int i11) {
        A0y(this.A14);
        return (this.A14[0] == i5 && this.A14[1] == i11) ? false : true;
    }

    private final boolean A13(int i5, int i11) {
        if (this.A06 == null) {
            Log.e(A0I(1423, 12, 90), A0I(704, 89, 69));
            return false;
        }
        if (this.A0I) {
            return false;
        }
        boolean zA2v = this.A06.A2v();
        boolean canScroll = this.A06.A2w();
        if (!zA2v || Math.abs(i5) < this.A0y) {
            i5 = 0;
        }
        if (!canScroll || Math.abs(i11) < this.A0y) {
            i11 = 0;
        }
        if (i5 == 0 && i11 == 0) {
            return false;
        }
        boolean canScrollHorizontal = dispatchNestedPreFling(i5, i11);
        if (!canScrollHorizontal) {
            boolean canScrollVertical = zA2v || canScroll;
            dispatchNestedFling(i5, i11, canScrollVertical);
            if (this.A0g != null) {
                boolean canScrollHorizontal2 = this.A0g.A0B(i5, i11);
                if (canScrollHorizontal2) {
                    return true;
                }
            }
            if (canScrollVertical) {
                int i12 = 0;
                if (zA2v) {
                    i12 = 0 | 1;
                }
                if (canScroll) {
                    i12 |= 2;
                }
                A21(i12, 1);
                int nestedScrollAxis = -this.A0x;
                int iMax = Math.max(nestedScrollAxis, Math.min(i5, this.A0x));
                int nestedScrollAxis2 = -this.A0x;
                this.A08.A09(iMax, Math.max(nestedScrollAxis2, Math.min(i11, this.A0x)));
                return true;
            }
        }
        return false;
    }

    private final boolean A14(int i5, int i11, MotionEvent motionEvent) {
        int unconsumedY = 0;
        int consumedX = 0;
        int iA1g = 0;
        int unconsumedX = 0;
        A1M();
        if (this.A04 != null) {
            A1N();
            A1O();
            AbstractC1842gy.A01(A0I(1414, 9, 79));
            A1q(this.A0s);
            if (i5 != 0) {
                iA1g = this.A06.A1g(i5, this.A0r, this.A0s);
                unconsumedY = i5 - iA1g;
            }
            if (i11 != 0) {
                unconsumedX = this.A06.A1h(i11, this.A0r, this.A0s);
                consumedX = i11 - unconsumedX;
            }
            AbstractC1842gy.A00();
            A1S();
            A1P();
            A1w(false);
        }
        if (!this.A0v.isEmpty()) {
            invalidate();
        }
        if (A22(iA1g, unconsumedX, unconsumedY, consumedX, this.A17, 0)) {
            this.A0S -= this.A17[0];
            this.A0T -= this.A17[1];
            if (motionEvent != null) {
                motionEvent.offsetLocation(this.A17[0], this.A17[1]);
            }
            int[] iArr = this.A15;
            int i12 = iArr[0] + this.A17[0];
            String[] strArr = A19;
            if (strArr[6].charAt(17) != strArr[4].charAt(17)) {
                throw new RuntimeException();
            }
            A19[1] = "TzjapWGLjdNwrlMHhQTvw0KTjubTnl9R";
            iArr[0] = i12;
            int[] iArr2 = this.A15;
            iArr2[1] = iArr2[1] + this.A17[1];
        } else if (getOverScrollMode() != 2) {
            if (motionEvent != null && !AbstractC1860hH.A00(motionEvent, 8194)) {
                float x11 = motionEvent.getX();
                float f11 = unconsumedY;
                float y11 = motionEvent.getY();
                float f12 = consumedX;
                if (A19[1].length() != 32) {
                    throw new RuntimeException();
                }
                A19[1] = "Rb7Wd2rB1Bk4FJnk1H23iqiZozoKDKpI";
                A0j(x11, f11, y11, f12);
            }
            A1d(i5, i11);
        }
        if (iA1g != 0 || unconsumedX != 0) {
            A1f(iA1g, unconsumedX);
        }
        if (!awakenScrollBars()) {
            invalidate();
        }
        return (iA1g == 0 && unconsumedX == 0) ? false : true;
    }

    private boolean A15(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (0 != 0) {
            if (action == 0) {
                this.A0h = null;
            } else {
                if (action == 3 || action == 1) {
                    this.A0h = null;
                }
                return true;
            }
        }
        if (action != 0) {
            int action2 = this.A13.size();
            if (0 < action2) {
                this.A13.get(0);
                throw new NullPointerException(A0I(2012, 21, 78));
            }
            return false;
        }
        return false;
    }

    private boolean A16(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 3 || action == 0) {
            this.A0h = null;
        }
        int action2 = this.A13.size();
        if (0 < action2) {
            this.A13.get(0);
            throw new NullPointerException(A0I(2012, 21, 78));
        }
        return false;
    }

    private boolean A17(View view, View view2, int i5) {
        int absHorizontal;
        if (view2 == null || view2 == this) {
            return false;
        }
        if (view == null) {
            return true;
        }
        if (i5 == 2 || i5 == 1) {
            boolean z11 = this.A06.A1X() == 1;
            boolean rtl = i5 == 2;
            if (rtl ^ z11) {
                absHorizontal = 66;
            } else {
                absHorizontal = 17;
            }
            if (A18(view, view2, absHorizontal)) {
                return true;
            }
            if (i5 == 2) {
                return A18(view, view2, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE);
            }
            return A18(view, view2, 33);
        }
        return A18(view, view2, i5);
    }

    private boolean A18(View view, View view2, int i5) {
        this.A0p.set(0, 0, view.getWidth(), view.getHeight());
        this.A0z.set(0, 0, view2.getWidth(), view2.getHeight());
        offsetDescendantRectToMyCoords(view, this.A0p);
        offsetDescendantRectToMyCoords(view2, this.A0z);
        switch (i5) {
            case 17:
                return (this.A0p.right > this.A0z.right || this.A0p.left >= this.A0z.right) && this.A0p.left > this.A0z.left;
            case 33:
                return (this.A0p.bottom > this.A0z.bottom || this.A0p.top >= this.A0z.bottom) && this.A0p.top > this.A0z.top;
            case 66:
                int i11 = this.A0p.left;
                String[] strArr = A19;
                if (strArr[2].length() == strArr[7].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A19;
                strArr2[3] = "H3chOpt4vkJfacRirYduge";
                strArr2[0] = "3wUmDedSMI";
                return (i11 < this.A0z.left || this.A0p.right <= this.A0z.left) && this.A0p.right < this.A0z.right;
            case MRAID_DOWNLOAD_JS_ERROR_VALUE:
                return (this.A0p.top < this.A0z.top || this.A0p.bottom <= this.A0z.top) && this.A0p.bottom < this.A0z.bottom;
            default:
                throw new IllegalArgumentException(A0I(1897, 37, 18) + i5 + A1L());
        }
    }

    private final boolean A19(AccessibilityEvent accessibilityEvent) {
        if (A1z()) {
            int iA00 = 0;
            if (accessibilityEvent != null) {
                iA00 = AbstractC1898hu.A00(accessibilityEvent);
            }
            if (iA00 == 0) {
                iA00 = 0;
            }
            int type = this.A0P;
            this.A0P = type | iA00;
            return true;
        }
        return false;
    }

    public final int A1C(View view) {
        AbstractC1978jE holder = A0F(view);
        if (holder != null) {
            return holder.A0R();
        }
        return -1;
    }

    public final int A1D(View view) {
        AbstractC1978jE holder = A0F(view);
        if (holder != null) {
            return holder.A0T();
        }
        return -1;
    }

    public final int A1E(AbstractC1978jE abstractC1978jE) {
        if (!abstractC1978jE.A0v(524) && abstractC1978jE.A0l()) {
            return this.A00.A0E(abstractC1978jE.A03);
        }
        if (A19[5].charAt(2) != 'Y') {
            throw new RuntimeException();
        }
        String[] strArr = A19;
        strArr[2] = "S0wUd1";
        strArr[7] = "zF1SY7WsjbFG";
        return -1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x003f, code lost:
    
        if (r4 != false) goto L16;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Rect A1F(View view) {
        C1961ix c1961ix = (C1961ix) view.getLayoutParams();
        if (!c1961ix.A01) {
            return c1961ix.A03;
        }
        if (this.A0s.A07()) {
            if (!c1961ix.A01()) {
                boolean zA03 = c1961ix.A03();
                if (A19[5].charAt(2) != 'Y') {
                    throw new RuntimeException();
                }
                String[] strArr = A19;
                strArr[6] = "R8RZJpxNRYJLmE7KdaIYiTLeL7r3Y7bS";
                strArr[4] = "BRrnvNJfpVwihHaR5a5gEdBxu0vp26qH";
            }
            return c1961ix.A03;
        }
        Rect rect = c1961ix.A03;
        rect.set(0, 0, 0, 0);
        int i5 = this.A0v.size();
        for (int i11 = 0; i11 < i5; i11++) {
            this.A0p.set(0, 0, 0, 0);
            AbstractC1957it abstractC1957it = this.A0v.get(i11);
            Rect insets = this.A0p;
            abstractC1957it.A02(insets, view, this, this.A0s);
            rect.left += this.A0p.left;
            rect.top += this.A0p.top;
            rect.right += this.A0p.right;
            rect.bottom += this.A0p.bottom;
        }
        c1961ix.A01 = false;
        return rect;
    }

    public final View A1G(View view) {
        ViewParent parent = view.getParent();
        while (parent != null && parent != this && (parent instanceof View)) {
            view = parent;
            parent = view.getParent();
        }
        if (parent == this) {
            return view;
        }
        return null;
    }

    public final AbstractC1978jE A1H(int i5) {
        if (this.A0C) {
            return null;
        }
        int iA06 = this.A01.A06();
        AbstractC1978jE hidden = null;
        for (int i11 = 0; i11 < iA06; i11++) {
            AbstractC1978jE abstractC1978jEA0F = A0F(this.A01.A0A(i11));
            if (abstractC1978jEA0F != null && !abstractC1978jEA0F.A0n()) {
                int childCount = A1E(abstractC1978jEA0F);
                if (childCount != i5) {
                    continue;
                } else if (this.A01.A0K(abstractC1978jEA0F.A0H)) {
                    hidden = abstractC1978jEA0F;
                } else {
                    return abstractC1978jEA0F;
                }
            }
        }
        return hidden;
    }

    public final AbstractC1978jE A1I(int i5) {
        return A1J(i5, false);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final AbstractC1978jE A1J(int i5, boolean z11) {
        int iA06 = this.A01.A06();
        AbstractC1978jE hidden = null;
        for (int i11 = 0; i11 < iA06; i11++) {
            AbstractC1978jE abstractC1978jEA0F = A0F(this.A01.A0A(i11));
            if (abstractC1978jEA0F != null && !abstractC1978jEA0F.A0n()) {
                if (z11) {
                    int childCount = abstractC1978jEA0F.A03;
                    if (childCount != i5) {
                        continue;
                    } else {
                        C1924iK c1924iK = this.A01;
                        View view = abstractC1978jEA0F.A0H;
                        String[] strArr = A19;
                        String str = strArr[6];
                        String str2 = strArr[4];
                        int iCharAt = str.charAt(17);
                        int childCount2 = str2.charAt(17);
                        if (iCharAt != childCount2) {
                            throw new RuntimeException();
                        }
                        String[] strArr2 = A19;
                        strArr2[6] = "j0pgcyCAMmCuelBFBaEKhw82BLWYdvOX";
                        strArr2[4] = "bxiKg4TrHtXBSvyNTaSo7IOhyUGlGIW4";
                        if (c1924iK.A0K(view)) {
                            hidden = abstractC1978jEA0F;
                        } else {
                            return abstractC1978jEA0F;
                        }
                    }
                } else {
                    int childCount3 = abstractC1978jEA0F.A0T();
                    if (childCount3 != i5) {
                        continue;
                    }
                }
            }
        }
        return hidden;
    }

    public final AbstractC1978jE A1K(View view) {
        ViewParent parent = view.getParent();
        if (parent == null || parent == this) {
            return A0F(view);
        }
        throw new IllegalArgumentException(A0I(1879, 5, 81) + view + A0I(98, 26, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) + this);
    }

    public final String A1L() {
        return A0I(0, 1, 65) + super.toString() + A0I(169, 10, 82) + this.A04 + A0I(189, 9, 71) + this.A06 + A0I(179, 10, 10) + getContext();
    }

    public final void A1M() {
        boolean z11 = this.A0D;
        String strA0I = A0I(1366, 17, 86);
        if (!z11 || this.A0C) {
            AbstractC1842gy.A01(strA0I);
            A0Y();
            AbstractC1842gy.A00();
            return;
        }
        if (!this.A00.A0J()) {
            return;
        }
        if (this.A00.A0L(4)) {
            boolean zA0L = this.A00.A0L(11);
            if (A19[5].charAt(2) != 'Y') {
                throw new RuntimeException();
            }
            String[] strArr = A19;
            strArr[6] = "e84NaKOnn7I9zpRn8aasqpcOMtbsg9mo";
            strArr[4] = "iuEMZhfSQYSf3gJ7Ya7A7FZe771rQXKi";
            if (!zA0L) {
                AbstractC1842gy.A01(A0I(1394, 20, 75));
                A1N();
                A1O();
                this.A00.A0H();
                if (!this.A0J) {
                    if (A0z()) {
                        A0Y();
                    } else {
                        this.A00.A0F();
                    }
                }
                A1w(true);
                A1P();
                AbstractC1842gy.A00();
                return;
            }
        }
        if (this.A00.A0J()) {
            AbstractC1842gy.A01(strA0I);
            A0Y();
            AbstractC1842gy.A00();
        }
    }

    public final void A1N() {
        this.A0O++;
        if (this.A0O == 1 && !this.A0I) {
            this.A0J = false;
        }
    }

    public final void A1O() {
        this.A0U++;
    }

    public final void A1P() {
        A1v(true);
    }

    public final void A1Q() {
        if (!this.A0K && this.A0F) {
            AbstractC1880hb.A0D(this, this.A0k);
            this.A0K = true;
        }
    }

    public final void A1R() {
        if (this.A05 != null) {
            this.A05.A0H();
        }
        if (this.A06 != null) {
            this.A06.A2Y(this.A0r);
            this.A06.A2W(this.A0r);
        }
        this.A0r.A0Q();
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A1S() {
        int iA05 = this.A01.A05();
        for (int i5 = 0; i5 < iA05; i5++) {
            View view = this.A01.A09(i5);
            AbstractC1978jE abstractC1978jEA1K = A1K(view);
            if (abstractC1978jEA1K != null && abstractC1978jEA1K.A07 != null) {
                View view2 = abstractC1978jEA1K.A07.A0H;
                int left = view.getLeft();
                int top = view.getTop();
                int count = view2.getLeft();
                if (left == count) {
                    int count2 = view2.getTop();
                    if (top != count2) {
                        int width = view2.getWidth();
                        String[] strArr = A19;
                        String str = strArr[2];
                        String str2 = strArr[7];
                        int i11 = str.length();
                        int count3 = str2.length();
                        if (i11 == count3) {
                            throw new RuntimeException();
                        }
                        String[] strArr2 = A19;
                        strArr2[3] = "Uubm7UlJXcXPQblsDCbwus";
                        strArr2[0] = "kvvVMTFBun";
                        int count4 = view2.getHeight();
                        view2.layout(left, top, width + left, count4 + top);
                    } else {
                        continue;
                    }
                }
            }
        }
    }

    public final void A1T() {
        this.A0C = true;
        A0h();
    }

    public final void A1U() {
        if (this.A0m != null) {
            this.A0m.clear();
        }
    }

    public final void A1V() {
        setScrollState(0);
        A0V();
    }

    public final void A1W(int i5) {
        if (this.A06 == null) {
            return;
        }
        this.A06.A2B(i5);
        awakenScrollBars();
        if (A19[5].charAt(2) != 'Y') {
            throw new RuntimeException();
        }
        String[] strArr = A19;
        strArr[2] = "0QEBPr";
        strArr[7] = "MYIDRbA0xlXg";
    }

    public final void A1X(int i5) {
        int iA05 = this.A01.A05();
        for (int i11 = 0; i11 < iA05; i11++) {
            this.A01.A09(i11).offsetLeftAndRight(i5);
        }
    }

    public final void A1Y(int i5) {
        int iA05 = this.A01.A05();
        for (int i11 = 0; i11 < iA05; i11++) {
            this.A01.A09(i11).offsetTopAndBottom(i5);
        }
    }

    public final void A1Z(int i5) {
        if (this.A0I) {
            return;
        }
        A1V();
        if (this.A06 == null) {
            String strA0I = A0I(1423, 12, 90);
            String[] strArr = A19;
            if (strArr[6].charAt(17) != strArr[4].charAt(17)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A19;
            strArr2[6] = "bKq2dxkRCeugdKx9Xa6GvrcP2g1fh08B";
            strArr2[4] = "kU2aPHyT0THRQATybaGwdbwAtHBBu9qc";
            Log.e(strA0I, A0I(793, 94, 71));
            return;
        }
        this.A06.A2B(i5);
        awakenScrollBars();
    }

    public final void A1a(int i5) {
        if (this.A0I) {
            return;
        }
        AbstractC1960iw abstractC1960iw = this.A06;
        String[] strArr = A19;
        if (strArr[3].length() == strArr[0].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A19;
        strArr2[6] = "WdHf0lV4QkHUB6jMNa4hJVyYAF4qnaeC";
        strArr2[4] = "5gGhKJie0DBDDFfkhapEv4fZOrT4upMj";
        if (abstractC1960iw != null) {
            this.A06.A2o(this, this.A0s, i5);
            return;
        }
        String[] strArr3 = A19;
        if (strArr3[6].charAt(17) != strArr3[4].charAt(17)) {
            String[] strArr4 = A19;
            strArr4[6] = "tnW8WJDd0hyAXA7zkanproBVQy0r1bMC";
            strArr4[4] = "4Fp0w8uFB0Hn5lDXLaIQvmhL07bdVyXH";
            Log.e(A0I(1423, 10, 14), A0I(907, 46, 18));
            return;
        }
        String[] strArr5 = A19;
        strArr5[3] = "z3A7CLBHtBtrAEYqxn9jPo";
        strArr5[0] = "loKczzo2gT";
        Log.e(A0I(1423, 12, 90), A0I(977, 97, 85));
    }

    public final void A1b(int i5) {
        getScrollingChildHelper().A03(i5);
    }

    public final void A1c(int i5, int i11) {
        if (i5 < 0) {
            A0b();
            this.A0a.onAbsorb(-i5);
        } else if (i5 > 0) {
            A0c();
            this.A0b.onAbsorb(i5);
        }
        if (i11 < 0) {
            A0d();
            if (A19[5].charAt(2) != 'Y') {
                throw new RuntimeException();
            }
            A19[1] = "gyhAwDIMjNJoK3bJ2ki6wxmL7XFPannX";
            this.A0c.onAbsorb(-i11);
        } else if (i11 > 0) {
            A0a();
            this.A0Z.onAbsorb(i11);
        }
        if (i5 != 0 || i11 != 0) {
            AbstractC1880hb.A07(this);
        }
    }

    public final void A1d(int i5, int i11) {
        boolean zIsFinished = false;
        if (this.A0a != null) {
            boolean needsInvalidate = this.A0a.isFinished();
            if (!needsInvalidate && i5 > 0) {
                this.A0a.onRelease();
                zIsFinished = this.A0a.isFinished();
            }
        }
        if (this.A0b != null) {
            boolean needsInvalidate2 = this.A0b.isFinished();
            if (!needsInvalidate2 && i5 < 0) {
                this.A0b.onRelease();
                boolean needsInvalidate3 = this.A0b.isFinished();
                zIsFinished |= needsInvalidate3;
            }
        }
        if (this.A0c != null) {
            boolean needsInvalidate4 = this.A0c.isFinished();
            if (!needsInvalidate4 && i11 > 0) {
                EdgeEffect edgeEffect = this.A0c;
                if (A19[1].length() != 32) {
                    throw new RuntimeException();
                }
                String[] strArr = A19;
                strArr[3] = "CkvbraPTkuNHVjG6c5toq1";
                strArr[0] = "anwNoWvWLV";
                edgeEffect.onRelease();
                boolean needsInvalidate5 = this.A0c.isFinished();
                zIsFinished |= needsInvalidate5;
            }
        }
        if (this.A0Z != null) {
            boolean needsInvalidate6 = this.A0Z.isFinished();
            if (!needsInvalidate6 && i11 < 0) {
                this.A0Z.onRelease();
                boolean needsInvalidate7 = this.A0Z.isFinished();
                zIsFinished |= needsInvalidate7;
            }
        }
        if (zIsFinished) {
            AbstractC1880hb.A07(this);
        }
    }

    public final void A1e(int i5, int i11) {
        int iA0x = AbstractC1960iw.A0x(i5, getPaddingLeft() + getPaddingRight(), AbstractC1880hb.A03(this));
        int paddingTop = getPaddingTop();
        int width = getPaddingBottom();
        int i12 = paddingTop + width;
        int width2 = AbstractC1880hb.A02(this);
        setMeasuredDimension(iA0x, AbstractC1960iw.A0x(i11, i12, width2));
    }

    public final void A1f(int i5, int i11) {
        this.A0N++;
        int scrollY = getScrollX();
        int scrollX = getScrollY();
        onScrollChanged(scrollY, scrollX, scrollY, scrollX);
        if (this.A0i != null) {
            AbstractC1965j1 abstractC1965j1 = this.A0i;
            if (A19[5].charAt(2) != 89) {
                throw new RuntimeException();
            }
            String[] strArr = A19;
            strArr[3] = "TUQYCncggzPoC9am3CD4xS";
            strArr[0] = "5ReBiiKNLm";
            abstractC1965j1.A0Q(this, i5, i11);
        }
        if (this.A0m != null) {
            int size = this.A0m.size() - 1;
            while (size >= 0) {
                this.A0m.get(size).A0Q(this, i5, i11);
                if (A19[1].length() != 32) {
                    size--;
                } else {
                    String[] strArr2 = A19;
                    strArr2[3] = "fStj6fnOv6bW6jot34QgdO";
                    strArr2[0] = "C6zDSGp1EH";
                    size--;
                }
            }
        }
        this.A0N--;
    }

    public final void A1g(int i5, int i11) {
        int iA06 = this.A01.A06();
        for (int i12 = 0; i12 < iA06; i12++) {
            AbstractC1978jE abstractC1978jEA0F = A0F(this.A01.A0A(i12));
            if (abstractC1978jEA0F != null && !abstractC1978jEA0F.A0s()) {
                int i13 = abstractC1978jEA0F.A03;
                int i14 = A19[5].charAt(2);
                if (i14 != 89) {
                    throw new RuntimeException();
                }
                A19[1] = "WfIl2QLxhpsV1cZ5bwDa0wyCBTSIuEWm";
                if (i13 >= i5) {
                    abstractC1978jEA0F.A0h(i11, false);
                    this.A0s.A0D = true;
                }
            }
        }
        this.A0r.A0S(i5, i11);
        requestLayout();
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0078  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A1h(int i5, int i11) {
        int i12;
        int i13;
        int i14;
        int iA06 = this.A01.A06();
        if (i5 < i11) {
            i12 = i5;
            i13 = i11;
            i14 = -1;
        } else {
            i12 = i11;
            i13 = i5;
            i14 = 1;
        }
        for (int i15 = 0; i15 < iA06; i15++) {
            AbstractC1978jE abstractC1978jEA0F = A0F(this.A01.A0A(i15));
            int start = A19[5].charAt(2);
            if (start != 89) {
                throw new RuntimeException();
            }
            String[] strArr = A19;
            strArr[2] = "SA2Eyd";
            strArr[7] = "XMtlHmP9rGs3";
            if (abstractC1978jEA0F != null) {
                int childCount = abstractC1978jEA0F.A03;
                if (childCount >= i12) {
                    int childCount2 = abstractC1978jEA0F.A03;
                    if (childCount2 <= i13) {
                        int i16 = abstractC1978jEA0F.A03;
                        String[] strArr2 = A19;
                        String str = strArr2[6];
                        String str2 = strArr2[4];
                        int start2 = str.charAt(17);
                        int childCount3 = str2.charAt(17);
                        if (start2 == childCount3) {
                            String[] strArr3 = A19;
                            strArr3[6] = "BcaezuMb6aDfAWKozakh45MfYrs0kuIc";
                            strArr3[4] = "5erwLY6dW1OUzDMynaZgWLcHWlHtC3ze";
                            if (i16 == i5) {
                            }
                        } else if (i16 == i5) {
                            int childCount4 = i11 - i5;
                            abstractC1978jEA0F.A0h(childCount4, false);
                        } else {
                            abstractC1978jEA0F.A0h(i14, false);
                        }
                        this.A0s.A0D = true;
                    }
                }
            }
        }
        this.A0r.A0T(i5, i11);
        requestLayout();
    }

    public final void A1i(int i5, int i11) {
        A0l(i5, i11, null);
    }

    public final void A1j(int i5, int i11, Object obj) {
        int iA06 = this.A01.A06();
        int i12 = i5 + i11;
        for (int i13 = 0; i13 < iA06; i13++) {
            View viewA0A = this.A01.A0A(i13);
            AbstractC1978jE abstractC1978jEA0F = A0F(viewA0A);
            if (abstractC1978jEA0F != null && !abstractC1978jEA0F.A0s()) {
                int i14 = abstractC1978jEA0F.A03;
                int positionEnd = A19[1].length();
                if (positionEnd != 32) {
                    throw new RuntimeException();
                }
                String[] strArr = A19;
                strArr[2] = "87XYbE";
                strArr[7] = "GV1T0vfadOcw";
                if (i14 >= i5) {
                    int childCount = abstractC1978jEA0F.A03;
                    if (childCount < i12) {
                        abstractC1978jEA0F.A0e(2);
                        abstractC1978jEA0F.A0j(obj);
                        ((C1961ix) viewA0A.getLayoutParams()).A01 = true;
                    }
                }
            }
        }
        this.A0r.A0U(i5, i11);
    }

    public final void A1k(int i5, int i11, boolean z11) {
        int i12 = i5 + i11;
        int iA06 = this.A01.A06();
        for (int i13 = 0; i13 < iA06; i13++) {
            AbstractC1978jE abstractC1978jEA0F = A0F(this.A01.A0A(i13));
            if (abstractC1978jEA0F != null && !abstractC1978jEA0F.A0s()) {
                int positionEnd = abstractC1978jEA0F.A03;
                if (positionEnd >= i12) {
                    int positionEnd2 = -i11;
                    abstractC1978jEA0F.A0h(positionEnd2, z11);
                    this.A0s.A0D = true;
                } else {
                    int positionEnd3 = abstractC1978jEA0F.A03;
                    if (positionEnd3 >= i5) {
                        int childCount = i5 - 1;
                        int positionEnd4 = -i11;
                        abstractC1978jEA0F.A0g(childCount, positionEnd4, z11);
                        int childCount2 = A19[1].length();
                        if (childCount2 != 32) {
                            throw new RuntimeException();
                        }
                        String[] strArr = A19;
                        strArr[2] = "dcjb0S";
                        strArr[7] = "CcIDXd599Ygw";
                        this.A0s.A0D = true;
                    } else {
                        continue;
                    }
                }
            }
        }
        this.A0r.A0V(i5, i11, z11);
        requestLayout();
    }

    public final void A1l(View view) {
        int cnt;
        A0F(view);
        AbstractC1948ik abstractC1948ik = this.A04;
        List<RecyclerView.OnChildAttachStateChangeListener> list = this.A0l;
        if (A19[5].charAt(2) != 'Y') {
            throw new RuntimeException();
        }
        A19[5] = "qDYnzfveQxKkK3O0opuqDthRtcgsED9a";
        if (list != null && this.A0l.size() - 1 >= 0) {
            this.A0l.get(cnt);
            throw new NullPointerException(A0I(1934, 27, 20));
        }
    }

    public final void A1m(View view) {
        int cnt;
        A0F(view);
        AbstractC1948ik abstractC1948ik = this.A04;
        if (this.A0l != null && this.A0l.size() - 1 >= 0) {
            this.A0l.get(cnt);
            throw new NullPointerException(A0I(1961, 29, 26));
        }
    }

    public final void A1n(AbstractC1957it abstractC1957it) {
        A0r(abstractC1957it, -1);
    }

    public final void A1o(AbstractC1965j1 abstractC1965j1) {
        if (this.A0m == null) {
            this.A0m = new ArrayList();
        }
        this.A0m.add(abstractC1965j1);
    }

    public final void A1p(AbstractC1965j1 abstractC1965j1) {
        if (this.A0m != null) {
            this.A0m.remove(abstractC1965j1);
        }
    }

    public final void A1q(C1975jB c1975jB) {
        if (getScrollState() == 2) {
            OverScroller overScroller = this.A08.A01;
            c1975jB.A06 = overScroller.getFinalX() - overScroller.getCurrX();
            c1975jB.A07 = overScroller.getFinalY() - overScroller.getCurrY();
        } else {
            c1975jB.A06 = 0;
            c1975jB.A07 = 0;
        }
    }

    public final void A1r(AbstractC1978jE abstractC1978jE, C1955ir c1955ir) {
        abstractC1978jE.A0f(0, UserMetadata.MAX_INTERNAL_KEY_SIZE);
        if (this.A0s.A0E && abstractC1978jE.A0q() && !abstractC1978jE.A0n() && !abstractC1978jE.A0s()) {
            this.A0t.A08(A0C(abstractC1978jE), abstractC1978jE);
        }
        this.A0t.A0F(abstractC1978jE, c1955ir);
    }

    public final void A1s(AbstractC1978jE abstractC1978jE, C1955ir c1955ir, C1955ir c1955ir2) {
        abstractC1978jE.A0k(false);
        if (this.A05.A0O(abstractC1978jE, c1955ir, c1955ir2)) {
            A1Q();
        }
    }

    public final void A1t(AbstractC1978jE abstractC1978jE, C1955ir c1955ir, C1955ir c1955ir2) {
        A0s(abstractC1978jE);
        abstractC1978jE.A0k(false);
        if (this.A05.A0P(abstractC1978jE, c1955ir, c1955ir2)) {
            A1Q();
        }
    }

    public final void A1u(String str) {
        if (A1z()) {
            if (str == null) {
                throw new IllegalStateException(A0I(627, 77, 76) + A1L());
            }
            throw new IllegalStateException(str);
        }
        if (this.A0N > 0) {
            Log.w(A0I(1423, 12, 90), A0I(347, 280, 49), new IllegalStateException(A0I(0, 0, 62) + A1L()));
        }
    }

    public final void A1v(boolean z11) {
        this.A0U--;
        if (this.A0U < 1) {
            this.A0U = 0;
            if (z11) {
                A0K();
                if (A19[1].length() != 32) {
                    throw new RuntimeException();
                }
                String[] strArr = A19;
                strArr[6] = "clcdgLago0QzUCUQna9RqUvMnx3zufId";
                strArr[4] = "dGTmnJIudyc2xKqsUaVYnInX4VXDIHXZ";
                A0Z();
            }
        }
    }

    public final void A1w(boolean z11) {
        if (this.A0O < 1) {
            this.A0O = 1;
        }
        if (!z11) {
            this.A0J = false;
        }
        if (this.A0O == 1) {
            if (z11 && this.A0J && !this.A0I && this.A06 != null && this.A04 != null) {
                A0Y();
            }
            if (!this.A0I) {
                this.A0J = false;
            }
        }
        this.A0O--;
    }

    public final boolean A1x() {
        if (this.A10 != null) {
            AccessibilityManager accessibilityManager = this.A10;
            String[] strArr = A19;
            if (strArr[6].charAt(17) != strArr[4].charAt(17)) {
                throw new RuntimeException();
            }
            A19[5] = "qqYNnQooq1iBe19qNxONRBmcR9jcXf5d";
            if (accessibilityManager.isEnabled()) {
                return true;
            }
        }
        return false;
    }

    public final boolean A1y() {
        return !this.A0D || this.A0C || this.A00.A0J();
    }

    public final boolean A1z() {
        return this.A0U > 0;
    }

    public final boolean A20(int i5) {
        return getScrollingChildHelper().A09(i5);
    }

    public final boolean A21(int i5, int i11) {
        return getScrollingChildHelper().A0B(i5, i11);
    }

    public final boolean A22(int i5, int i11, int i12, int i13, int[] iArr, int i14) {
        return getScrollingChildHelper().A0D(i5, i11, i12, i13, iArr, i14);
    }

    public final boolean A23(int i5, int i11, int[] iArr, int[] iArr2, int i12) {
        return getScrollingChildHelper().A0F(i5, i11, iArr, iArr2, i12);
    }

    public final boolean A24(View view) {
        A1N();
        boolean zA0L = this.A01.A0L(view);
        if (zA0L) {
            AbstractC1978jE viewHolder = A0F(view);
            this.A0r.A0d(viewHolder);
            this.A0r.A0c(viewHolder);
        }
        boolean removed = !zA0L;
        A1w(removed);
        if (A19[1].length() != 32) {
            throw new RuntimeException();
        }
        String[] strArr = A19;
        strArr[3] = "2BT72D7B0XXfHPWJs3DbS8";
        strArr[0] = "RgGvPpmRJD";
        return zA0L;
    }

    public final boolean A25(AbstractC1978jE abstractC1978jE) {
        return this.A05 == null || this.A05.A0S(abstractC1978jE, abstractC1978jE.A0W());
    }

    public final boolean A26(AbstractC1978jE abstractC1978jE, int i5) {
        if (A1z()) {
            abstractC1978jE.A02 = i5;
            this.A0w.add(abstractC1978jE);
            return false;
        }
        AbstractC1880hb.A09(abstractC1978jE.A0H, i5);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addFocusables(ArrayList<View> arrayList, int i5, int i11) {
        if (this.A06 != null) {
            boolean zA37 = this.A06.A37(this, arrayList, i5, i11);
            if (A19[5].charAt(2) != 'Y') {
                throw new RuntimeException();
            }
            String[] strArr = A19;
            strArr[2] = "qzNrCd";
            strArr[7] = "bMAkXN6Kp1Dd";
            if (zA37) {
                return;
            }
        }
        super.addFocusables(arrayList, i5, i11);
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof C1961ix) && this.A06.A33((C1961ix) layoutParams);
    }

    @Override // android.view.View
    public final int computeHorizontalScrollExtent() {
        if (this.A06 != null && this.A06.A2v()) {
            return this.A06.A1r(this.A0s);
        }
        return 0;
    }

    @Override // android.view.View
    public final int computeHorizontalScrollOffset() {
        if (this.A06 != null && this.A06.A2v()) {
            return this.A06.A1s(this.A0s);
        }
        return 0;
    }

    @Override // android.view.View
    public final int computeHorizontalScrollRange() {
        if (this.A06 == null) {
            return 0;
        }
        AbstractC1960iw abstractC1960iw = this.A06;
        if (A19[5].charAt(2) != 'Y') {
            throw new RuntimeException();
        }
        A19[1] = "GzwOa56ahdwGOmec9vc3XIggLcxaXOnz";
        if (abstractC1960iw.A2v()) {
            return this.A06.A1t(this.A0s);
        }
        return 0;
    }

    @Override // android.view.View
    public final int computeVerticalScrollExtent() {
        if (this.A06 == null) {
            return 0;
        }
        AbstractC1960iw abstractC1960iw = this.A06;
        String[] strArr = A19;
        if (strArr[3].length() != strArr[0].length()) {
            String[] strArr2 = A19;
            strArr2[2] = "Wsbuah";
            strArr2[7] = "lDl9g1VSjrmk";
            if (!abstractC1960iw.A2w()) {
                return 0;
            }
            AbstractC1960iw abstractC1960iw2 = this.A06;
            String[] strArr3 = A19;
            if (strArr3[3].length() != strArr3[0].length()) {
                A19[5] = "sfYwg45p3roym5legx720iFNlg07mmUN";
                return abstractC1960iw2.A1u(this.A0s);
            }
        }
        throw new RuntimeException();
    }

    @Override // android.view.View
    public final int computeVerticalScrollOffset() {
        if (this.A06 != null && this.A06.A2w()) {
            return this.A06.A1v(this.A0s);
        }
        return 0;
    }

    @Override // android.view.View
    public final int computeVerticalScrollRange() {
        if (this.A06 == null || !this.A06.A2w()) {
            return 0;
        }
        AbstractC1960iw abstractC1960iw = this.A06;
        if (A19[5].charAt(2) != 'Y') {
            throw new RuntimeException();
        }
        String[] strArr = A19;
        strArr[6] = "NPPquBudgt65Kfhzva46C14iIBYgw5ng";
        strArr[4] = "gzaMlk0wrsXS1BjbnaI8sjsGlzE0u55w";
        return abstractC1960iw.A1w(this.A0s);
    }

    @Override // android.view.View
    public final boolean dispatchNestedFling(float f11, float f12, boolean z11) {
        return getScrollingChildHelper().A08(f11, f12, z11);
    }

    @Override // android.view.View
    public final boolean dispatchNestedPreFling(float f11, float f12) {
        return getScrollingChildHelper().A07(f11, f12);
    }

    @Override // android.view.View
    public final boolean dispatchNestedPreScroll(int i5, int i11, int[] iArr, int[] iArr2) {
        return getScrollingChildHelper().A0E(i5, i11, iArr, iArr2);
    }

    @Override // android.view.View
    public final boolean dispatchNestedScroll(int i5, int i11, int i12, int i13, int[] iArr) {
        return getScrollingChildHelper().A0C(i5, i11, i12, i13, iArr);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchRestoreInstanceState(SparseArray<Parcelable> container) {
        dispatchThawSelfOnly(container);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchSaveInstanceState(SparseArray<Parcelable> container) {
        dispatchFreezeSelfOnly(container);
    }

    /* JADX WARN: Removed duplicated region for block: B:67:0x0138  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x015f  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void draw(Canvas canvas) {
        super.draw(canvas);
        int size = this.A0v.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.A0v.get(i5);
        }
        int padding = 0;
        if (this.A0a != null && !this.A0a.isFinished()) {
            int restore = canvas.save();
            int paddingBottom = this.A0B ? getPaddingBottom() : 0;
            canvas.rotate(270.0f);
            int count = getHeight();
            canvas.translate((-count) + paddingBottom, 0.0f);
            padding = (this.A0a == null || !this.A0a.draw(canvas)) ? 0 : 1;
            canvas.restoreToCount(restore);
        }
        if (this.A0c != null && !this.A0c.isFinished()) {
            int restore2 = canvas.save();
            if (this.A0B) {
                int count2 = getPaddingLeft();
                float f11 = count2;
                int count3 = getPaddingTop();
                canvas.translate(f11, count3);
            }
            int count4 = (this.A0c == null || !this.A0c.draw(canvas)) ? 0 : 1;
            padding |= count4;
            canvas.restoreToCount(restore2);
        }
        if (this.A0b != null && !this.A0b.isFinished()) {
            int iSave = canvas.save();
            int restore3 = getWidth();
            int paddingTop = this.A0B ? getPaddingTop() : 0;
            canvas.rotate(90.0f);
            int count5 = -paddingTop;
            float f12 = count5;
            int count6 = -restore3;
            canvas.translate(f12, count6);
            if (this.A0b != null) {
                EdgeEffect edgeEffect = this.A0b;
                String[] strArr = A19;
                String str = strArr[2];
                String str2 = strArr[7];
                int length = str.length();
                int count7 = str2.length();
                if (length == count7) {
                    throw new RuntimeException();
                }
                A19[5] = "ItYbouux6ivob9pa5cwYanZ1Qwg84bbh";
                int count8 = edgeEffect.draw(canvas) ? 1 : 0;
                padding |= count8;
                canvas.restoreToCount(iSave);
            }
        }
        if (this.A0Z != null && !this.A0Z.isFinished()) {
            int restore4 = canvas.save();
            canvas.rotate(180.0f);
            if (this.A0B) {
                int count9 = getWidth();
                int i11 = -count9;
                int count10 = getPaddingRight();
                float f13 = i11 + count10;
                int count11 = getHeight();
                int i12 = -count11;
                int count12 = getPaddingBottom();
                canvas.translate(f13, i12 + count12);
            } else {
                int count13 = getWidth();
                float f14 = -count13;
                int count14 = getHeight();
                canvas.translate(f14, -count14);
            }
            padding |= (this.A0Z == null || !this.A0Z.draw(canvas)) ? 0 : 1;
            canvas.restoreToCount(restore4);
        }
        if (padding == 0 && this.A05 != null) {
            int count15 = this.A0v.size();
            if (count15 > 0) {
                AbstractC1956is abstractC1956is = this.A05;
                if (A19[5].charAt(2) != 'Y') {
                    if (abstractC1956is.A0M()) {
                        padding = 1;
                    }
                } else {
                    A19[5] = "slYCg9imVkQI2IB5irC0agqTwBjTAdyw";
                    if (abstractC1956is.A0M()) {
                    }
                }
            }
        }
        if (padding != 0) {
            AbstractC1880hb.A07(this);
        }
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View view, long j11) {
        return super.drawChild(canvas, view, j11);
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x00a2  */
    @Override // android.view.ViewGroup, android.view.ViewParent
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final View focusSearch(View view, int i5) {
        boolean z11;
        View viewFindNextFocus;
        int i11;
        View result = this.A06.A22(view, i5);
        if (result != null) {
            return result;
        }
        if (this.A04 != null) {
            AbstractC1960iw abstractC1960iw = this.A06;
            String[] strArr = A19;
            if (strArr[2].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A19;
            strArr2[3] = "RhZxCClAx00iKsBYiNgalY";
            strArr2[0] = "xpwAZ9hAV8";
            z11 = (abstractC1960iw == null || A1z() || this.A0I) ? false : true;
        }
        FocusFinder focusFinder = FocusFinder.getInstance();
        if (z11 && (i5 == 2 || i5 == 1)) {
            int i12 = 0;
            if (this.A06.A2w()) {
                int i13 = i5 == 2 ? Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE : 33;
                i12 = focusFinder.findNextFocus(this, view, i13) == null ? 1 : 0;
                if (A1F) {
                    i5 = i13;
                }
            }
            if (i12 == 0 && this.A06.A2v()) {
                boolean canRunFocusFailure = this.A06.A1X() == 1;
                if ((i5 == 2) ^ canRunFocusFailure) {
                    i11 = 66;
                } else {
                    i11 = 17;
                }
                int absDir = focusFinder.findNextFocus(this, view, i11) != null ? 0 : 1;
                i12 = absDir;
                if (A1F) {
                    i5 = i11;
                }
            }
            if (i12 != 0) {
                A1M();
                if (A1G(view) == null) {
                    return null;
                }
                A1N();
                this.A06.A23(view, i5, this.A0r, this.A0s);
                A1w(false);
            }
            viewFindNextFocus = focusFinder.findNextFocus(this, view, i5);
        } else {
            viewFindNextFocus = focusFinder.findNextFocus(this, view, i5);
            if (viewFindNextFocus == null && z11) {
                A1M();
                if (A1G(view) == null) {
                    return null;
                }
                A1N();
                viewFindNextFocus = this.A06.A23(view, i5, this.A0r, this.A0s);
                A1w(false);
            }
        }
        if (viewFindNextFocus == null || viewFindNextFocus.hasFocusable()) {
            return A17(view, viewFindNextFocus, i5) ? viewFindNextFocus : super.focusSearch(view, i5);
        }
        if (getFocusedChild() == null) {
            return super.focusSearch(view, i5);
        }
        A0p(viewFindNextFocus, null);
        return view;
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        if (this.A06 != null) {
            return this.A06.A24();
        }
        throw new IllegalStateException(A0I(1528, 33, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE) + A1L());
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        if (this.A06 != null) {
            return this.A06.A25(getContext(), attributeSet);
        }
        throw new IllegalStateException(A0I(1528, 33, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE) + A1L());
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (this.A06 != null) {
            C1961ix c1961ixA26 = this.A06.A26(layoutParams);
            if (A19[1].length() != 32) {
                throw new RuntimeException();
            }
            String[] strArr = A19;
            strArr[3] = "4uZ9QAUZcjEo06EXHPHPN1";
            strArr[0] = "ePNmh1lbEA";
            return c1961ixA26;
        }
        throw new IllegalStateException(A0I(1528, 33, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE) + A1L());
    }

    public AbstractC1948ik getAdapter() {
        return this.A04;
    }

    @Override // android.view.View
    public int getBaseline() {
        if (this.A06 != null) {
            int iA1S = this.A06.A1S();
            if (A19[1].length() != 32) {
                throw new RuntimeException();
            }
            A19[1] = "WUntfQVcja1qFzj09nDprclvV6sI7lKs";
            return iA1S;
        }
        return super.getBaseline();
    }

    @Override // android.view.ViewGroup
    public final int getChildDrawingOrder(int i5, int i11) {
        if (0 == 0) {
            return super.getChildDrawingOrder(i5, i11);
        }
        throw new NullPointerException(A0I(1990, 22, 35));
    }

    @Override // android.view.ViewGroup
    public boolean getClipToPadding() {
        return this.A0B;
    }

    public C0978Ic getCompatAccessibilityDelegate() {
        return this.A09;
    }

    public AbstractC1956is getItemAnimator() {
        return this.A05;
    }

    public AbstractC1960iw getLayoutManager() {
        return this.A06;
    }

    public int getMaxFlingVelocity() {
        return this.A0x;
    }

    public int getMinFlingVelocity() {
        return this.A0y;
    }

    public long getNanoTime() {
        if (A1E) {
            return System.nanoTime();
        }
        return 0L;
    }

    public AbstractC1963iz getOnFlingListener() {
        return this.A0g;
    }

    public boolean getPreserveFocusAfterLayout() {
        return this.A0o;
    }

    public C1967j3 getRecycledViewPool() {
        return this.A0r.A0I();
    }

    public int getScrollState() {
        return this.A0W;
    }

    private C1862hJ getScrollingChildHelper() {
        if (this.A0d == null) {
            this.A0d = new C1862hJ(this);
        }
        return this.A0d;
    }

    @Override // android.view.View
    public final boolean hasNestedScrollingParent() {
        return getScrollingChildHelper().A05();
    }

    @Override // android.view.View
    public final boolean isAttachedToWindow() {
        return this.A0F;
    }

    @Override // android.view.View
    public final boolean isNestedScrollingEnabled() {
        return getScrollingChildHelper().A06();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.A0U = 0;
        boolean z11 = true;
        this.A0F = true;
        if (!this.A0D || isLayoutRequested()) {
            z11 = false;
        }
        this.A0D = z11;
        if (this.A06 != null) {
            this.A06.A2f(this);
        }
        this.A0K = false;
        if (A1E) {
            this.A03 = RunnableC1937iX.A07.get();
            if (this.A03 == null) {
                this.A03 = new RunnableC1937iX();
                Display displayA04 = AbstractC1880hb.A04(this);
                float f11 = 60.0f;
                if (!isInEditMode() && displayA04 != null) {
                    float refreshRate = displayA04.getRefreshRate();
                    String[] strArr = A19;
                    if (strArr[2].length() == strArr[7].length()) {
                        throw new RuntimeException();
                    }
                    String[] strArr2 = A19;
                    strArr2[3] = "HPKMSTrO6rgllPECADdom7";
                    strArr2[0] = "yPSN9KqlOS";
                    if (refreshRate >= 30.0f) {
                        f11 = refreshRate;
                    }
                }
                this.A03.A00 = (long) (1.0E9f / f11);
                RunnableC1937iX.A07.set(this.A03);
            }
            this.A03.A09(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.A05 != null) {
            this.A05.A0H();
        }
        A1V();
        this.A0F = false;
        if (this.A06 != null) {
            this.A06.A2n(this, this.A0r);
        }
        this.A0w.clear();
        removeCallbacks(this.A0k);
        this.A0t.A07();
        if (A1E && this.A03 != null) {
            this.A03.A0A(this);
            this.A03 = null;
        }
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int size = this.A0v.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.A0v.get(i5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00b0  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onGenericMotionEvent(MotionEvent motionEvent) {
        float vScroll;
        float axisValue;
        if (this.A06 == null) {
            return false;
        }
        boolean z11 = this.A0I;
        if (A19[1].length() != 32) {
            throw new RuntimeException();
        }
        String[] strArr = A19;
        strArr[2] = "hfCCVZ";
        strArr[7] = "6Rxn0wTGDCgs";
        if (!z11 && motionEvent.getAction() == 8) {
            if ((motionEvent.getSource() & 2) != 0) {
                if (this.A06.A2w()) {
                    vScroll = -motionEvent.getAxisValue(9);
                } else {
                    vScroll = 0.0f;
                }
                if (this.A06.A2v()) {
                    axisValue = motionEvent.getAxisValue(10);
                } else {
                    axisValue = 0.0f;
                }
            } else {
                int source = motionEvent.getSource();
                if (A19[5].charAt(2) == 'Y') {
                    A19[5] = "SrYzqcFycO4E61WX0CCI79FBiQDWLxq8";
                    if ((source & 4194304) != 0) {
                    }
                } else if ((source & 4194304) != 0) {
                    axisValue = motionEvent.getAxisValue(26);
                    if (this.A06.A2w()) {
                        vScroll = -axisValue;
                        axisValue = 0.0f;
                    } else if (this.A06.A2v()) {
                        vScroll = 0.0f;
                    } else {
                        vScroll = 0.0f;
                        axisValue = 0.0f;
                    }
                } else {
                    vScroll = 0.0f;
                    axisValue = 0.0f;
                }
            }
            if (vScroll != 0.0f || axisValue != 0.0f) {
                float hScroll = this.A0L;
                A14((int) (hScroll * axisValue), (int) (this.A0M * vScroll), motionEvent);
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00f4 A[PHI: r1
      0x00f4: PHI (r1v16 int) = (r1v15 int), (r1v19 int) binds: [B:46:0x0129, B:33:0x00f2] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // android.view.ViewGroup
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int i5;
        if (this.A0I) {
            return false;
        }
        if (A16(motionEvent)) {
            A0J();
            return true;
        }
        if (this.A06 == null) {
            return false;
        }
        boolean zA2v = this.A06.A2v();
        boolean zA2w = this.A06.A2w();
        if (this.A0Y == null) {
            this.A0Y = VelocityTracker.obtain();
        }
        this.A0Y.addMovement(motionEvent);
        int actionMasked = motionEvent.getActionMasked();
        int actionIndex = motionEvent.getActionIndex();
        String[] strArr = A19;
        if (strArr[2].length() != strArr[7].length()) {
            String[] strArr2 = A19;
            strArr2[3] = "Oz3Y31ex0QABqFtFM6aXix";
            strArr2[0] = "OpGO9pAa6R";
            switch (actionMasked) {
                case 0:
                    boolean canScrollHorizontally = this.A0n;
                    if (canScrollHorizontally) {
                        this.A0n = false;
                    }
                    this.A0V = motionEvent.getPointerId(0);
                    int x11 = (int) (motionEvent.getX() + 0.5f);
                    this.A0S = x11;
                    this.A0Q = x11;
                    int y11 = (int) (motionEvent.getY() + 0.5f);
                    this.A0T = y11;
                    this.A0R = y11;
                    if (this.A0W == 2) {
                        getParent().requestDisallowInterceptTouchEvent(true);
                        setScrollState(1);
                    }
                    int[] iArr = this.A15;
                    this.A15[1] = 0;
                    iArr[0] = 0;
                    int i11 = 0;
                    if (zA2v) {
                        i11 = 0 | 1;
                    }
                    if (zA2w) {
                        i11 |= 2;
                    }
                    A21(i11, 0);
                    break;
                case 1:
                    VelocityTracker velocityTracker = this.A0Y;
                    String[] strArr3 = A19;
                    if (strArr3[6].charAt(17) != strArr3[4].charAt(17)) {
                        String[] strArr4 = A19;
                        strArr4[3] = "RX1lNzZl9PHDMcdVrAJc1B";
                        strArr4[0] = "i2qb1YAFuc";
                        velocityTracker.clear();
                        A1b(0);
                        break;
                    } else {
                        A19[1] = "VFVZbyoyfkMi6O34miIS2l4U7i7WEKsz";
                        velocityTracker.clear();
                        A1b(0);
                        break;
                    }
                case 2:
                    int iFindPointerIndex = motionEvent.findPointerIndex(this.A0V);
                    if (iFindPointerIndex < 0) {
                        Log.e(A0I(1423, 12, 90), A0I(1116, 46, 88) + this.A0V + A0I(Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, 45, 46));
                        return false;
                    }
                    int actionIndex2 = (int) (motionEvent.getX(iFindPointerIndex) + 0.5f);
                    float y12 = motionEvent.getY(iFindPointerIndex);
                    String[] strArr5 = A19;
                    if (strArr5[2].length() != strArr5[7].length()) {
                        String[] strArr6 = A19;
                        strArr6[3] = "bk8L2DuoR6rlGazYt8IaCt";
                        strArr6[0] = "Sc1G85HZiT";
                        i5 = (int) (y12 + 0.5f);
                        if (this.A0W != 1) {
                            int i12 = actionIndex2 - this.A0Q;
                            int index = i5 - this.A0R;
                            int y13 = 0;
                            if (zA2v && Math.abs(i12) > this.A0X) {
                                this.A0S = actionIndex2;
                                y13 = 1;
                            }
                            if (zA2w && Math.abs(index) > this.A0X) {
                                this.A0T = i5;
                                y13 = 1;
                            }
                            if (y13 != 0) {
                                setScrollState(1);
                                break;
                            }
                        }
                    } else {
                        A19[5] = "zyYUBzZDbxt5GKooJMB8Oo5URJ8cGTlk";
                        i5 = (int) (y12 + 0.5f);
                        if (this.A0W != 1) {
                        }
                    }
                    break;
                case 3:
                    A0J();
                    break;
                case 5:
                    this.A0V = motionEvent.getPointerId(actionIndex);
                    int x12 = (int) (motionEvent.getX(actionIndex) + 0.5f);
                    this.A0S = x12;
                    this.A0Q = x12;
                    int y14 = (int) (motionEvent.getY(actionIndex) + 0.5f);
                    this.A0T = y14;
                    this.A0R = y14;
                    break;
                case 6:
                    A0n(motionEvent);
                    break;
            }
            return this.A0W == 1;
        }
        throw new RuntimeException();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        AbstractC1842gy.A01(A0I(1383, 11, 82));
        A0Y();
        AbstractC1842gy.A00();
        this.A0D = true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:45:0x010c, code lost:
    
        if (r4 != false) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x010e, code lost:
    
        setMeasuredDimension(getMeasuredWidth(), getMeasuredHeight());
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0119, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0126, code lost:
    
        if (r4 != false) goto L46;
     */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onMeasure(int i5, int i11) {
        if (this.A06 == null) {
            A1e(i5, i11);
            return;
        }
        int heightMode = 0;
        if (this.A06.A06) {
            int mode = View.MeasureSpec.getMode(i5);
            int widthMode = View.MeasureSpec.getMode(i11);
            if (mode == 1073741824 && widthMode == 1073741824) {
                heightMode = 1;
            }
            this.A06.A2a(this.A0r, this.A0s, i5, i11);
            if (heightMode != 0 || this.A04 == null) {
                return;
            }
            int widthMode2 = this.A0s.A04;
            if (widthMode2 == 1) {
                A0L();
            }
            this.A06.A2C(i5, i11);
            this.A0s.A0A = true;
            A0M();
            this.A06.A2D(i5, i11);
            if (this.A06.A2u()) {
                AbstractC1960iw abstractC1960iw = this.A06;
                int widthMode3 = getMeasuredWidth();
                int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(widthMode3, 1073741824);
                int widthMode4 = getMeasuredHeight();
                abstractC1960iw.A2C(iMakeMeasureSpec, View.MeasureSpec.makeMeasureSpec(widthMode4, 1073741824));
                this.A0s.A0A = true;
                A0M();
                this.A06.A2D(i5, i11);
                return;
            }
            return;
        }
        boolean z11 = this.A0E;
        String[] strArr = A19;
        if (strArr[3].length() == strArr[0].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A19;
        strArr2[6] = "KQlS07WJlXQIeKT2EaNKgCMREedmurGg";
        strArr2[4] = "TSw2akNEB1AJctHCwaDYxiu1Uwr65JPJ";
        if (z11) {
            this.A06.A2a(this.A0r, this.A0s, i5, i11);
            return;
        }
        if (this.A0A) {
            A1N();
            A1O();
            A0P();
            A1P();
            if (this.A0s.A0B) {
                this.A0s.A09 = true;
            } else {
                this.A00.A0G();
                this.A0s.A09 = false;
            }
            this.A0A = false;
            A1w(false);
        } else {
            boolean z12 = this.A0s.A0B;
            if (A19[1].length() != 32) {
                String[] strArr3 = A19;
                strArr3[6] = "SNs0MIA5NFIkFiTpWaOkIZpcAnFttQ5E";
                strArr3[4] = "fXihHPq3ps5k4WwfOaG7U1bhyi9cbGtD";
            } else {
                String[] strArr4 = A19;
                strArr4[3] = "mxGjlxdGGYffeE2i6ToSoo";
                strArr4[0] = "9Nm63BEsB7";
            }
        }
        if (this.A04 != null) {
            this.A0s.A03 = this.A04.A0B();
        } else {
            this.A0s.A03 = 0;
        }
        A1N();
        this.A06.A2a(this.A0r, this.A0s, i5, i11);
        A1w(false);
        this.A0s.A09 = false;
    }

    @Override // android.view.ViewGroup
    public final boolean onRequestFocusInDescendants(int i5, Rect rect) {
        if (A1z()) {
            return false;
        }
        return super.onRequestFocusInDescendants(i5, rect);
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof WrappedParcelable)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        ClassLoader classLoader = getClass().getClassLoader();
        if (classLoader == null) {
            classLoader = getContext().getClassLoader();
        }
        Parcelable state = ((WrappedParcelable) parcelable).unwrap(classLoader);
        if (!(state instanceof RecyclerView$SavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        this.A0j = (RecyclerView$SavedState) state;
        super.onRestoreInstanceState(this.A0j.A04());
        if (this.A06 != null && this.A0j.A00 != null) {
            this.A06.A2J(this.A0j.A00);
        }
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        RecyclerView$SavedState recyclerView$SavedState = new RecyclerView$SavedState(super.onSaveInstanceState());
        RecyclerView$SavedState state = this.A0j;
        if (state != null) {
            RecyclerView$SavedState state2 = this.A0j;
            recyclerView$SavedState.A05(state2);
        } else if (this.A06 != null) {
            recyclerView$SavedState.A00 = this.A06.A1x();
        } else {
            recyclerView$SavedState.A00 = null;
        }
        return new WrappedParcelable(recyclerView$SavedState);
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        if (i5 != i12 || i11 != i13) {
            A0f();
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x024a  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (this.A0I || this.A0n) {
            return false;
        }
        boolean zA15 = A15(motionEvent);
        if (A19[5].charAt(2) == 'Y') {
            A19[5] = "8sYT0RnpvG2arPES2UJ12JYFoUL9IQDo";
            if (zA15) {
                A0J();
                return true;
            }
            if (this.A06 == null) {
                return false;
            }
            boolean zA2v = this.A06.A2v();
            boolean eventAddedToVelocityTracker = this.A06.A2w();
            if (this.A0Y == null) {
                this.A0Y = VelocityTracker.obtain();
            }
            boolean canScrollVertically = false;
            MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
            int actionMasked = motionEvent.getActionMasked();
            int actionIndex = motionEvent.getActionIndex();
            if (actionMasked == 0) {
                int[] iArr = this.A15;
                this.A15[1] = 0;
                String[] strArr = A19;
                if (strArr[2].length() != strArr[7].length()) {
                    A19[5] = "w9Y7A1oKaVmj8Ov6eZqRiF6tVMdmRve8";
                    iArr[0] = 0;
                } else {
                    String[] strArr2 = A19;
                    strArr2[6] = "DE62WFMw5Qbi4eBk1auhfUxeLGhnsE7e";
                    strArr2[4] = "A6rUAAhMCRWi1Exz9agrYLVLW1oNRabf";
                    iArr[0] = 0;
                }
            }
            motionEventObtain.offsetLocation(this.A15[0], this.A15[1]);
            switch (actionMasked) {
                case 0:
                    this.A0V = motionEvent.getPointerId(0);
                    int dx2 = (int) (motionEvent.getX() + 0.5f);
                    this.A0S = dx2;
                    this.A0Q = dx2;
                    int dx3 = (int) (motionEvent.getY() + 0.5f);
                    this.A0T = dx3;
                    this.A0R = dx3;
                    int nestedScrollAxis = 0;
                    if (zA2v) {
                        nestedScrollAxis = 0 | 1;
                    }
                    if (eventAddedToVelocityTracker) {
                        nestedScrollAxis |= 2;
                    }
                    A21(nestedScrollAxis, 0);
                    if (!canScrollVertically) {
                        this.A0Y.addMovement(motionEventObtain);
                    }
                    motionEventObtain.recycle();
                    return true;
                case 1:
                    this.A0Y.addMovement(motionEventObtain);
                    canScrollVertically = true;
                    this.A0Y.computeCurrentVelocity(1000, this.A0x);
                    float f11 = zA2v ? -this.A0Y.getXVelocity(this.A0V) : 0.0f;
                    float f12 = eventAddedToVelocityTracker ? -this.A0Y.getYVelocity(this.A0V) : 0.0f;
                    String[] strArr3 = A19;
                    if (strArr3[6].charAt(17) == strArr3[4].charAt(17)) {
                        A19[5] = "SfYw0o2VnAou7QhBgLkBGelaMPLfL2ni";
                        if (f11 != 0.0f || f12 != 0.0f) {
                            if (!A13((int) f11, (int) f12)) {
                                setScrollState(0);
                            }
                            A0T();
                        }
                        if (!canScrollVertically) {
                        }
                        motionEventObtain.recycle();
                        return true;
                    }
                    break;
                case 2:
                    int iFindPointerIndex = motionEvent.findPointerIndex(this.A0V);
                    if (iFindPointerIndex < 0) {
                        Log.e(A0I(1423, 12, 90), A0I(1116, 46, 88) + this.A0V + A0I(Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, 45, 46));
                        return false;
                    }
                    int x11 = (int) (motionEvent.getX(iFindPointerIndex) + 0.5f);
                    int y11 = (int) (motionEvent.getY(iFindPointerIndex) + 0.5f);
                    int actionIndex2 = this.A0S - x11;
                    int dx4 = this.A0T - y11;
                    if (A23(actionIndex2, dx4, this.A16, this.A17, 0)) {
                        actionIndex2 -= this.A16[0];
                        dx4 -= this.A16[1];
                        motionEventObtain.offsetLocation(this.A17[0], this.A17[1]);
                        int[] iArr2 = this.A15;
                        iArr2[0] = iArr2[0] + this.A17[0];
                        int[] iArr3 = this.A15;
                        iArr3[1] = iArr3[1] + this.A17[1];
                    }
                    int i5 = this.A0W;
                    String[] strArr4 = A19;
                    if (strArr4[3].length() != strArr4[0].length()) {
                        A19[1] = "vPk2qMMC5wpKDUMEcolEIRuedMAFiD5T";
                        if (i5 != 1) {
                            boolean z11 = false;
                            if (zA2v && Math.abs(actionIndex2) > this.A0X) {
                                if (actionIndex2 > 0) {
                                    actionIndex2 -= this.A0X;
                                } else {
                                    actionIndex2 += this.A0X;
                                }
                                z11 = true;
                            }
                            if (eventAddedToVelocityTracker && Math.abs(dx4) > this.A0X) {
                                if (dx4 > 0) {
                                    dx4 -= this.A0X;
                                } else {
                                    dx4 += this.A0X;
                                }
                                z11 = true;
                            }
                            if (z11) {
                                setScrollState(1);
                            }
                        }
                        if (this.A0W == 1) {
                            this.A0S = x11 - this.A17[0];
                            this.A0T = y11 - this.A17[1];
                            if (A14(zA2v ? actionIndex2 : 0, eventAddedToVelocityTracker ? dx4 : 0, motionEventObtain)) {
                                ViewParent parent = getParent();
                                int dy2 = A19[5].charAt(2);
                                if (dy2 != 89) {
                                    parent.requestDisallowInterceptTouchEvent(true);
                                } else {
                                    String[] strArr5 = A19;
                                    strArr5[3] = "9Qb2BcK3cjm46xX51a5wS3";
                                    strArr5[0] = "GdK3mOIcF6";
                                    parent.requestDisallowInterceptTouchEvent(true);
                                }
                            }
                            if (this.A03 != null && (actionIndex2 != 0 || dx4 != 0)) {
                                this.A03.A0B(this, actionIndex2, dx4);
                            }
                        }
                        if (!canScrollVertically) {
                        }
                        motionEventObtain.recycle();
                        return true;
                    }
                    throw new RuntimeException();
                case 3:
                    A0J();
                    if (!canScrollVertically) {
                    }
                    motionEventObtain.recycle();
                    return true;
                case 4:
                default:
                    if (!canScrollVertically) {
                    }
                    motionEventObtain.recycle();
                    return true;
                case 5:
                    this.A0V = motionEvent.getPointerId(actionIndex);
                    int x12 = (int) (motionEvent.getX(actionIndex) + 0.5f);
                    this.A0S = x12;
                    this.A0Q = x12;
                    int y12 = (int) (motionEvent.getY(actionIndex) + 0.5f);
                    this.A0T = y12;
                    this.A0R = y12;
                    if (!canScrollVertically) {
                    }
                    motionEventObtain.recycle();
                    return true;
                case 6:
                    A0n(motionEvent);
                    if (!canScrollVertically) {
                    }
                    motionEventObtain.recycle();
                    return true;
            }
        }
        throw new RuntimeException();
    }

    @Override // android.view.ViewGroup
    public final void removeDetachedView(View view, boolean z11) {
        AbstractC1978jE abstractC1978jEA0F = A0F(view);
        if (abstractC1978jEA0F != null) {
            if (abstractC1978jEA0F.A0p()) {
                abstractC1978jEA0F.A0a();
            } else if (!abstractC1978jEA0F.A0s()) {
                throw new IllegalArgumentException(A0I(Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, 75, 37) + abstractC1978jEA0F + A1L());
            }
        }
        view.clearAnimation();
        A1m(view);
        super.removeDetachedView(view, z11);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestChildFocus(View view, View view2) {
        if (!this.A06.A36(this, this.A0s, view, view2) && view2 != null) {
            A0p(view, view2);
        }
        super.requestChildFocus(view, view2);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z11) {
        return this.A06.A34(this, view, rect, z11);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z11) {
        int size = this.A13.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.A13.get(i5);
        }
        super.requestDisallowInterceptTouchEvent(z11);
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
        if (this.A0O == 0 && !this.A0I) {
            super.requestLayout();
        } else {
            this.A0J = true;
        }
    }

    @Override // android.view.View
    public final void scrollBy(int i5, int i11) {
        if (this.A06 == null) {
            Log.e(A0I(1423, 12, 90), A0I(887, 90, 75));
            return;
        }
        if (this.A0I) {
            return;
        }
        boolean zA2v = this.A06.A2v();
        boolean canScrollHorizontal = this.A06.A2w();
        if (zA2v || canScrollHorizontal) {
            if (!zA2v) {
                i5 = 0;
            }
            A14(i5, canScrollHorizontal ? i11 : 0, null);
        }
    }

    @Override // android.view.View
    public final void scrollTo(int i5, int i11) {
        Log.w(A0I(1423, 12, 90), A0I(1435, 93, 17));
    }

    @Override // android.view.View, android.view.accessibility.AccessibilityEventSource
    public final void sendAccessibilityEventUnchecked(AccessibilityEvent accessibilityEvent) {
        if (A19(accessibilityEvent)) {
            return;
        }
        super.sendAccessibilityEventUnchecked(accessibilityEvent);
    }

    public void setAccessibilityDelegateCompat(C0978Ic c0978Ic) {
        this.A09 = c0978Ic;
        AbstractC1880hb.A0B(this, this.A09);
    }

    public void setAdapter(AbstractC1948ik abstractC1948ik) {
        setLayoutFrozen(false);
        A0q(abstractC1948ik, false, true);
        requestLayout();
    }

    public void setChildDrawingOrderCallback(InterfaceC1951in interfaceC1951in) {
        if (interfaceC1951in == null) {
            return;
        }
        this.A0e = interfaceC1951in;
        setChildrenDrawingOrderEnabled(0 != 0);
    }

    @Override // android.view.ViewGroup
    public void setClipToPadding(boolean z11) {
        if (z11 != this.A0B) {
            A0f();
        }
        this.A0B = z11;
        super.setClipToPadding(z11);
        if (this.A0D) {
            requestLayout();
        }
    }

    public void setHasFixedSize(boolean z11) {
        this.A0E = z11;
    }

    public void setItemAnimator(AbstractC1956is abstractC1956is) {
        if (this.A05 != null) {
            this.A05.A0H();
            this.A05.A0J(null);
        }
        this.A05 = abstractC1956is;
        if (this.A05 != null) {
            AbstractC1956is abstractC1956is2 = this.A05;
            InterfaceC1954iq interfaceC1954iq = this.A0f;
            if (A19[1].length() != 32) {
                throw new RuntimeException();
            }
            String[] strArr = A19;
            strArr[3] = "lbql160khUomfa8gG92Y7q";
            strArr[0] = "AtGY6u7EZb";
            abstractC1956is2.A0J(interfaceC1954iq);
        }
    }

    public void setItemViewCacheSize(int i5) {
        this.A0r.A0R(i5);
    }

    public void setLayoutFrozen(boolean z11) {
        if (z11 != this.A0I) {
            A1u(A0I(1074, 42, 50));
            if (!z11) {
                this.A0I = false;
                if (this.A0J && this.A06 != null && this.A04 != null) {
                    requestLayout();
                }
                this.A0J = false;
                return;
            }
            long now = SystemClock.uptimeMillis();
            onTouchEvent(MotionEvent.obtain(now, now, 3, 0.0f, 0.0f, 0));
            this.A0I = true;
            this.A0n = true;
            A1V();
        }
    }

    public void setLayoutManager(AbstractC1960iw abstractC1960iw) {
        if (abstractC1960iw == this.A06) {
            return;
        }
        A1V();
        if (this.A06 != null) {
            if (this.A05 != null) {
                this.A05.A0H();
            }
            this.A06.A2Y(this.A0r);
            this.A06.A2W(this.A0r);
            this.A0r.A0Q();
            if (this.A0F) {
                this.A06.A2n(this, this.A0r);
            }
            this.A06.A2h(null);
            this.A06 = null;
        } else {
            this.A0r.A0Q();
        }
        this.A01.A0B();
        this.A06 = abstractC1960iw;
        if (abstractC1960iw != null) {
            C7O c7o = abstractC1960iw.A03;
            if (A19[1].length() != 32) {
                throw new RuntimeException();
            }
            String[] strArr = A19;
            strArr[6] = "5zwSvF43vthb6lIFeaOoDRJ244Dq07FI";
            strArr[4] = "COyIsU8he0MLuT7wFa9x9SZ5A7LzgdfA";
            if (c7o == null) {
                this.A06.A2h(this);
                if (this.A0F) {
                    this.A06.A2f(this);
                }
            } else {
                throw new IllegalArgumentException(A0I(1162, 14, 40) + abstractC1960iw + A0I(59, 39, 9) + abstractC1960iw.A03.A1L());
            }
        }
        this.A0r.A0P();
        requestLayout();
    }

    @Override // android.view.View
    public void setNestedScrollingEnabled(boolean z11) {
        getScrollingChildHelper().A04(z11);
    }

    public void setOnFlingListener(AbstractC1963iz abstractC1963iz) {
        this.A0g = abstractC1963iz;
    }

    @Deprecated
    public void setOnScrollListener(AbstractC1965j1 abstractC1965j1) {
        this.A0i = abstractC1965j1;
    }

    public void setPreserveFocusAfterLayout(boolean z11) {
        this.A0o = z11;
    }

    public void setRecycledViewPool(C1967j3 c1967j3) {
        this.A0r.A0a(c1967j3);
    }

    public void setRecyclerListener(InterfaceC1969j5 interfaceC1969j5) {
        this.A07 = interfaceC1969j5;
    }

    public void setScrollState(int i5) {
        if (i5 == this.A0W) {
            return;
        }
        this.A0W = i5;
        if (i5 != 2) {
            A0V();
        }
        A0k(i5);
    }

    public void setScrollingTouchSlop(int i5) {
        ViewConfiguration viewConfiguration = ViewConfiguration.get(getContext());
        switch (i5) {
            case 0:
                break;
            case 1:
                this.A0X = viewConfiguration.getScaledPagingTouchSlop();
                return;
            default:
                Log.w(A0I(1423, 12, 90), A0I(2033, 47, 85) + i5 + A0I(198, 21, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
                break;
        }
        this.A0X = viewConfiguration.getScaledTouchSlop();
    }

    public void setViewCacheExtension(AbstractC1976jC abstractC1976jC) {
        this.A0r.A0b(abstractC1976jC);
    }

    @Override // android.view.View
    public final boolean startNestedScroll(int i5) {
        return getScrollingChildHelper().A0A(i5);
    }

    @Override // android.view.View
    public final void stopNestedScroll() {
        getScrollingChildHelper().A02();
    }
}
