package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOverlay;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.AdClosedListener;
import com.facebook.ads.AdSettings;
import com.facebook.ads.ExtraHints;
import com.facebook.ads.MediaView;
import com.facebook.ads.NativeAd;
import com.facebook.ads.NativeAdBase;
import com.facebook.ads.NativeAdLayout;
import com.facebook.ads.NativeAdListener;
import com.facebook.ads.NativeBannerAd;
import com.facebook.ads.internal.api.AdNativeComponentView;
import com.facebook.ads.internal.api.NativeAdBaseApi;
import com.facebook.ads.internal.api.NativeAdImageApi;
import com.facebook.ads.internal.context.Repairable;
import com.facebook.ads.internal.protocol.AdErrorType;
import com.facebook.ads.internal.protocol.AdPlacementType;
import com.facebook.ads.internal.settings.AdInternalSettings;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import java.util.WeakHashMap;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class GT implements com.facebook.ads.Ad, NativeAdBaseApi, Repairable, InterfaceC2259np {
    public static C2086kz A0p;
    public static byte[] A0q;
    public static String[] A0r = {"Bl7Z7O36thNMsAQG86cT5hXAswukL2TU", "w0l3kgVUfrf8f1EzcfbBJ9JqF1JIQyF1", "3FYeVZ4P9Hva0brxRfDXnSutu97odoaf", "TkemScCQ72wM3yeu7V5OcaIZTlgQuG0T", "aV5nfdXEnoj7uvLi", "brDFWAS69jf159nGVdOYVvf", "WGIwYSb5Wjcv", "W7skGFSknqdZoaqu210O1mF"};
    public static final String A0s;
    public static final WeakHashMap<View, WeakReference<GT>> A0t;
    public long A00;
    public Drawable A01;
    public View.OnTouchListener A02;
    public View A03;
    public View A04;
    public View A05;
    public View A06;
    public ViewTreeObserver.OnWindowFocusChangeListener A07;
    public AdClosedListener A08;
    public NativeAdLayout A09;
    public EnumC1721f0 A0A;
    public LL A0B;
    public C07117d A0C;
    public KC A0D;
    public l5 A0E;
    public C2146lz A0F;
    public C2232nO A0G;
    public EnumC2246nc A0H;
    public GV A0I;
    public GS A0J;
    public C2254nk A0K;
    public EnumC2255nl A0L;
    public EnumC2265nx A0M;
    public C2514s2 A0N;
    public InterfaceC2523sB A0O;
    public C2615tf A0P;
    public C1245Tb A0Q;
    public C1908i4 A0R;
    public AbstractC1540c3 A0S;
    public AbstractC1540c3 A0T;
    public C1539c2 A0U;
    public C1539c2 A0V;
    public String A0W;
    public String A0X;
    public WeakReference<IW> A0Y;
    public WeakReference<AbstractC1540c3> A0Z;
    public boolean A0a;
    public boolean A0b;
    public boolean A0c;
    public boolean A0d;
    public boolean A0e;
    public C1056Lh A0f;
    public final C2086kz A0g;
    public final C0958Hi A0h;
    public final InterfaceC2251nh A0i;
    public final C2261nr A0j;
    public final C2417qT A0k;
    public final String A0l;
    public final String A0m;
    public final List<View> A0n;
    public volatile boolean A0o;

    public static String A0W(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0q, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 40);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0e() {
        A0q = new byte[]{86, -112, -100, -107, -108, -91, -84, -42, -41, -39, -89, -42, -39, -74, -29, -73, -79, -79, -30, -25, -78, -36, 11, -34, 12, -39, -35, 10, -33, 125, -96, 92, -86, -85, -80, 92, -88, -85, -99, -96, -95, -96, -67, -32, -48, -31, -23, -20, -24, -35, -16, -31, -100, -93, -95, -17, -93, -100, -27, -17, -100, -22, -21, -16, -100, -35, -100, -22, -35, -16, -27, -14, -31, -100, -35, -32, -105, -109, -110, -58, -75, -70, -74, -65, -76, -74, -97, -74, -59, -56, -64, -61, -68, -83, -56, -48, -45, -52, -53, -121, -37, -42, -121, -45, -42, -56, -53, -121, -76, -52, -53, -48, -56, -107, -96, -69, -61, -58, -65, -66, 122, -50, -55, 122, -55, -68, -50, -69, -61, -56, 122, -50, -65, -57, -54, -58, -69, -50, -65, 122, -93, -98, 122, -64, -52, -55, -57, 122, -68, -61, -66, 122, -54, -69, -45, -58, -55, -69, -66, 122, -127, AbstractJsonLexerKt.TC_INVALID, -51, -127, -79, -42, -36, -51, -38, -42, -55, -44, -120, -51, -38, -38, -41, -38, -106, 114, -47, -10, -2, -23, -12, -15, -20, -88, -5, -19, -4, -88, -9, -18, -88, -21, -12, -15, -21, -13, -23, -22, -12, -19, -88, -2, -15, -19, -1, -5, -73, -49, -50, -45, -53, -64, -45, -49, -31, -118, -48, -39, -36, -118, -45, -51, -39, -40, -118, -45, -35, -118, -45, -35, -118, -41, -45, -35, -35, -45, -40, -47, -104, -71, -47, -48, -43, -51, -62, -43, -47, -29, -116, -43, -33, -116, -39, -43, -33, -33, -43, -38, -45, -102, -117, -77, -79, -78, 94, -82, -80, -83, -76, -89, -94, -93, 94, -97, 94, -108, -89, -93, -75, -49, -30, -11, -22, -9, -26, -95, -62, -27, -95, -8, -30, -12, -95, -30, -19, -13, -26, -30, -27, -6, -95, -13, -26, -24, -22, -12, -11, -26, -13, -26, -27, -95, -8, -22, -11, -23, -95, -30, -95, -41, -22, -26, -8, -81, -95, -62, -10, -11, -16, -95, -10, -17, -13, -26, -24, -22, -12, -11, -26, -13, -22, -17, -24, -95, -30, -17, -27, -95, -15, -13, -16, -28, -26, -26, -27, -22, -17, -24, -81, -115, -96, -77, -88, -75, -92, 95, -96, -93, 95, -93, -92, -78, -77, -79, -82, -72, -92, -93, -40, -21, -2, -13, 0, -17, -86, -21, -18, -86, -10, -7, -21, -18, -86, -4, -17, -5, -1, -17, -3, -2, -17, -18, -115, -96, -100, -82, 87, -104, -93, -87, -100, -104, -101, -80, 87, -87, -100, -98, -96, -86, -85, -100, -87, -100, -101, 87, -82, -96, -85, -97, 87, -104, 87, -123, -104, -85, -96, -83, -100, 120, -101, 101, 87, 120, -84, -85, -90, 87, -84, -91, -87, -100, -98, -96, -86, -85, -100, -87, -96, -91, -98, 87, -104, -91, -101, 87, -89, -87, -90, -102, -100, -100, -101, -96, -91, -98, 101, -58, -39, -43, -25, -112, -34, -33, -28, -112, -30, -43, -41, -39, -29, -28, -43, -30, -43, -44, -112, -25, -39, -28, -40, -112, -28, -40, -39, -29, -112, -66, -47, -28, -39, -26, -43, -79, -44, -104, -101, 87, -92, -100, -101, -96, -104, 87, -85, -80, -89, -100, 87, -96, -86, 87, -91, -90, -85, 87, -86, -84, -89, -89, -90, -87, -85, -100, -101, 101, -116, -101, -108, -109, -108, -94, -93, -95, -98, -88, -94, -91, -105, -102, 119, -102, 7, 10, -4, -1, -36, -1, -61, -60, -69, -2, -4, 7, 7, 0, -1, -69, 8, 10, 13, 0, -69, 15, 3, -4, 9, -69, 10, 9, -2, 0, -17, -30, -11, -22, -9, -26};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 24 out of bounds for length 17
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private void A0g(View view, View view2, List<View> list, boolean z11) {
        if (!A0r()) {
            this.A0h.A0F().AIo();
        }
        if (view == null) {
            String strA0W = A0W(264, 19, 22);
            if (!A0r()) {
                this.A0h.A0F().AIn(strA0W);
            }
            throw new IllegalArgumentException(strA0W);
        }
        if (list == null || list.size() == 0) {
            String strA0W2 = A0W(180, 30, 96);
            if (!A0r()) {
                this.A0h.A0F().AIn(strA0W2);
            }
            throw new IllegalArgumentException(strA0W2);
        }
        C1056Lh c1056LhA0C = A0C();
        if (c1056LhA0C == null) {
            String strA0W3 = A0W(29, 13, 20);
            if (!A0r()) {
                this.A0h.A0F().AIn(strA0W3);
            }
            Log.e(A0s, strA0W3);
            C2262nt c2262nt = new C2262nt(AdErrorType.NATIVE_AD_IS_NOT_LOADED, strA0W3);
            A16().A0F().A3j(C2416qS.A01(this.A00), c2262nt.A03().getErrorCode(), c2262nt.A04());
            if (!C2203mv.A2q(this.A0h) || this.A0J == null) {
                return;
            }
            this.A0J.AEr(c2262nt);
            return;
        }
        String str = this.A0X;
        boolean z12 = view instanceof FrameLayout;
        String[] strArr = A0r;
        if (strArr[7].length() == strArr[5].length()) {
            String[] strArr2 = A0r;
            strArr2[0] = "EctJGKY0XxsuqG0UQd3u1zsk6i1LiKEB";
            strArr2[2] = "xfmrtxxFdZMJNwdY4ICwqytBKlocc6OO";
            if (z12 && str != null) {
                A0h((FrameLayout) view, str);
            }
            if (this.A09 != null) {
                IB ib2 = (IB) this.A09.getNativeAdLayoutApi();
                ib2.A03();
                ib2.A02();
            }
            IW iw2 = this.A0Y.get();
            if (iw2 != null && c1056LhA0C.A08() == 1) {
                iw2.A0E(EnumC2437qn.AN_INFO_ICON);
            }
            if (view2 == null) {
                if (this.A0M == EnumC2265nx.A05) {
                    AdErrorType adErrorType = AdErrorType.NO_MEDIAVIEW_IN_NATIVEAD;
                    String strA0W4 = A0W(243, 21, 68);
                    C2262nt c2262nt2 = new C2262nt(adErrorType, strA0W4);
                    A16().A0F().A3j(C2416qS.A01(this.A00), c2262nt2.A03().getErrorCode(), c2262nt2.A04());
                    if (this.A0J != null) {
                        this.A0J.AEr(c2262nt2);
                    }
                    if (AdInternalSettings.isDebugBuild()) {
                        Log.e(A0s, strA0W4);
                        return;
                    }
                    return;
                }
                AdErrorType adErrorType2 = AdErrorType.NO_MEDIAVIEW_IN_NATIVEBANNERAD;
                String strA0W5 = A0W(Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, 33, 66);
                C2262nt c2262nt3 = new C2262nt(adErrorType2, strA0W5);
                A16().A0F().A3j(C2416qS.A01(this.A00), c2262nt3.A03().getErrorCode(), c2262nt3.A04());
                if (this.A0J != null) {
                    GS gs2 = this.A0J;
                    String[] strArr3 = A0r;
                    if (strArr3[1].charAt(16) != strArr3[3].charAt(16)) {
                        String[] strArr4 = A0r;
                        strArr4[4] = "nsWl0Hk5Msmp3zmH";
                        strArr4[6] = "oYitqb4l5O5w";
                        gs2.AEr(c2262nt3);
                    } else {
                        gs2.AEr(c2262nt3);
                    }
                }
                if (AdInternalSettings.isDebugBuild()) {
                    Log.e(A0s, strA0W5);
                    return;
                }
                return;
            }
            boolean z13 = (view2 instanceof AdNativeComponentView) && ((AdNativeComponentView) view2).getAdContentsView() != null;
            boolean z14 = z11 && (view2 instanceof ImageView);
            if (z13 || z14) {
                if (this.A04 != null) {
                    Log.w(A0s, A0W(283, 80, 89));
                    unregisterView();
                }
                if (A0t.containsKey(view) && A0t.get(view).get() != null) {
                    Log.w(A0s, A0W(TTAdConstant.LANDING_PAGE_TYPE_CODE, 75, 15));
                    A0t.get(view).get().unregisterView();
                }
                this.A0I = new GV(this, this.A0h, null);
                this.A04 = view;
                this.A06 = view2;
                if (view instanceof ViewGroup) {
                    this.A0N = new C2514s2(this.A0h, new GZ(this));
                    ((ViewGroup) view).addView(this.A0N);
                }
                if (c1056LhA0C.A0S()) {
                    this.A0S = new GY(this);
                    this.A0U = new C1539c2(view, 1, new WeakReference(this.A0S), this.A0h);
                    this.A0U.A0Y(false);
                    this.A0U.A0X(c1056LhA0C.A09());
                    this.A0U.A0U();
                    this.A0h.A0F().ADP();
                }
                ArrayList<View> arrayList = new ArrayList(list);
                if (this.A05 != null) {
                    arrayList.add(this.A05);
                }
                for (View view3 : arrayList) {
                    String[] strArr5 = A0r;
                    if (strArr5[7].length() != strArr5[5].length()) {
                        String[] strArr6 = A0r;
                        strArr6[1] = "9p8eAJslnqkcQfVFkX2NaZpGo2NogEID";
                        strArr6[3] = "Fdj5aRKmThGOYGM4NU7VADNdisgLrlPk";
                        A1Q(view3);
                    } else {
                        String[] strArr7 = A0r;
                        strArr7[4] = "ta8ztpz9PQU6TWHh";
                        strArr7[6] = "10z3LgKps5EE";
                        A1Q(view3);
                    }
                }
                LA laA13 = A13();
                if (z11 && laA13 != null && laA13.A2P()) {
                    A1Q(view);
                    arrayList.add(view);
                }
                int iA00 = A00();
                this.A0T = new GX(this, view2, z14, c1056LhA0C);
                if (view2 instanceof AdNativeComponentView) {
                    View adContentsView = ((AdNativeComponentView) view2).getAdContentsView();
                    String[] strArr8 = A0r;
                    if (strArr8[0].charAt(5) == strArr8[2].charAt(5)) {
                        throw new RuntimeException();
                    }
                    String[] strArr9 = A0r;
                    strArr9[1] = "AmKQ97fBLt8v65PXaWQ2lzp6X6hOVLLZ";
                    strArr9[3] = "rJ6ED8esGipYo16AZCwywliOWw3nCSVU";
                    this.A03 = adContentsView;
                } else {
                    this.A03 = view2;
                }
                if (C2203mv.A1z(this.A0h)) {
                    String strA1H = A1H();
                    InterfaceC2236nS interfaceC2236nSA0B = A16().A0B();
                    View view4 = this.A03;
                    if (strA1H == null) {
                        strA1H = A0W(0, 0, 21);
                    }
                    interfaceC2236nSA0B.AM8(view4, strA1H, this.A03 instanceof C1678eI, true);
                }
                this.A0V = new C1539c2(this.A03, iA00, A03(), true, new WeakReference(this.A0T), this.A0h);
                this.A0V.A0Y(!A0r());
                this.A0V.A0W(A01());
                this.A0V.A0X(A02());
                if (this.A03 instanceof C2605tV) {
                    ((C2605tV) this.A03).A06(this.A0V);
                }
                this.A0B = new LL(this.A0h, new GU(this, null), this.A0V, this.A0f);
                this.A0B.A0J(arrayList);
                A0t.put(view, new WeakReference<>(this));
                this.A07 = new ViewTreeObserverOnWindowFocusChangeListenerC2249nf(this);
                ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
                if (viewTreeObserver.isAlive()) {
                    viewTreeObserver.addOnWindowFocusChangeListener(this.A07);
                } else {
                    this.A07 = null;
                }
                if (C2203mv.A1B(this.A0h)) {
                    this.A0P = new C2615tf();
                    this.A0P.A0C(this.A0l);
                    this.A0P.A0B(this.A0h.getPackageName());
                    this.A0P.A0A(this.A0V);
                    if (this.A0f != null) {
                        int iA03 = this.A0f.A0E().A03();
                        String[] strArr10 = A0r;
                        if (strArr10[0].charAt(5) == strArr10[2].charAt(5)) {
                            throw new RuntimeException();
                        }
                        String[] strArr11 = A0r;
                        strArr11[1] = "6w9E4u0Xv7t0VT7M4ZQhfT6x3NS05tXG";
                        strArr11[3] = "Knc01yER6LmtVSGtvouwbTa6HiolQ6pK";
                        if (iA03 > 0) {
                            LK lkA0E = this.A0f.A0E();
                            this.A0P.A08(lkA0E.A03(), lkA0E.A04());
                        }
                    }
                    if (this.A0F != null) {
                        this.A0P.A09(this.A0F.A0C());
                    } else if (this.A0C != null && this.A0C.A0I() != null) {
                        this.A0P.A09(this.A0C.A0I().A0C());
                    }
                    ViewOverlay overlay = this.A04.getOverlay();
                    String[] strArr12 = A0r;
                    if (strArr12[4].length() != strArr12[6].length()) {
                        String[] strArr13 = A0r;
                        strArr13[1] = "PlOUkHRjTfP1TLMsEQIjm7lmTF3o2gjY";
                        strArr13[3] = "CcUrimv3R6YWMUNgDXBxsbVafZnEkOT4";
                        overlay.add(this.A0P);
                        return;
                    }
                    String[] strArr14 = A0r;
                    strArr14[0] = "9xtIvycKuGD3X9dlb3eDnO0wOMDHezVB";
                    strArr14[2] = "tgJaSFUkb3OvVdiBqmqS5kHs3fuvF8Xm";
                    overlay.add(this.A0P);
                    return;
                }
                return;
            }
            GS gs3 = this.A0J;
            String[] strArr15 = A0r;
            if (strArr15[7].length() == strArr15[5].length()) {
                String[] strArr16 = A0r;
                strArr16[7] = "NZUYEyoiQJdMJgH58rRyVIN";
                strArr16[5] = "lIJySsauvCfug7psMQHpLAW";
                if (gs3 != null) {
                    C2262nt c2262nt4 = new C2262nt(AdErrorType.UNSUPPORTED_AD_ASSET_NATIVEAD, A0W(519, 31, 15));
                    A16().A0F().A3j(C2416qS.A01(this.A00), c2262nt4.A03().getErrorCode(), c2262nt4.A04());
                    this.A0J.AEr(c2262nt4);
                    return;
                }
                return;
            }
        }
        throw new RuntimeException();
    }

    static {
        A0e();
        A0s = GT.class.getSimpleName();
        A0t = new WeakHashMap<>();
    }

    public GT(Context context, String str, InterfaceC2251nh interfaceC2251nh, boolean z11) {
        this.A0m = UUID.randomUUID().toString();
        this.A0M = EnumC2265nx.A05;
        this.A0H = EnumC2246nc.A04;
        this.A0A = EnumC1721f0.A03;
        this.A0Y = new WeakReference<>(null);
        this.A0n = new ArrayList();
        this.A0k = new C2417qT();
        this.A0e = false;
        this.A0d = false;
        this.A00 = -1L;
        this.A0a = false;
        if (context instanceof C0958Hi) {
            this.A0h = (C0958Hi) context;
        } else if (!z11) {
            this.A0h = C2013jn.A04(context);
        } else {
            this.A0h = C2013jn.A03(context);
        }
        this.A0h.A0O(this);
        this.A0l = str;
        this.A0i = interfaceC2251nh;
        if (A0p != null) {
            this.A0g = A0p;
        } else {
            this.A0g = new C2086kz(this.A0h);
        }
        this.A05 = new View(context);
        this.A0j = new C2261nr(this.A0h, this);
    }

    public GT(GT gt2) {
        this((Context) gt2.A0h, (String) null, gt2.A0i, true);
        this.A0F = gt2.A0F;
        this.A0f = gt2.A0f;
        this.A0D = gt2.A0D;
        this.A0o = true;
        this.A05 = new View(this.A0h);
    }

    public GT(C0958Hi c0958Hi, C1056Lh c1056Lh, C2146lz c2146lz, InterfaceC2251nh interfaceC2251nh) {
        this((Context) c0958Hi, (String) null, interfaceC2251nh, true);
        this.A0f = c1056Lh;
        this.A0F = c2146lz;
        this.A0o = true;
        this.A05 = new View(c0958Hi);
    }

    public GT(C0958Hi c0958Hi, C1056Lh c1056Lh, C2146lz c2146lz, InterfaceC2251nh interfaceC2251nh, KC kc2) {
        this(c0958Hi, c1056Lh, c2146lz, interfaceC2251nh);
        this.A0D = kc2;
    }

    private int A00() {
        if (this.A0F != null) {
            return this.A0F.A04();
        }
        if (this.A0C == null || this.A0C.A0I() == null) {
            return 1;
        }
        return this.A0C.A0I().A04();
    }

    private int A01() {
        if (this.A0F != null) {
            return this.A0F.A07();
        }
        if (this.A0f != null) {
            C1056Lh c1056Lh = this.A0f;
            String[] strArr = A0r;
            if (strArr[1].charAt(16) == strArr[3].charAt(16)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[7] = "EUscbuPuA5cZxxPx7y6ncGc";
            strArr2[5] = "07NrZ6juCFttxvE5hiFlF8c";
            return c1056Lh.A0C();
        }
        if (this.A0C != null && this.A0C.A0I() != null) {
            return this.A0C.A0I().A07();
        }
        return 0;
    }

    private int A02() {
        if (this.A0F != null) {
            return this.A0F.A08();
        }
        if (this.A0f != null) {
            int iA0D = this.A0f.A0D();
            String[] strArr = A0r;
            if (strArr[0].charAt(5) == strArr[2].charAt(5)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[1] = "wlXrbCoONy6aNPfJSLZ4JGG9g8lWOQWJ";
            strArr2[3] = "zMDzXw8vWIk5v34E7N5RdIcOKoPIh5je";
            return iA0D;
        }
        C07117d c07117d = this.A0C;
        String[] strArr3 = A0r;
        if (strArr3[4].length() != strArr3[6].length()) {
            String[] strArr4 = A0r;
            strArr4[7] = "IJhE7OuQr9AUmHg0gZAU0NE";
            strArr4[5] = "Tpbr9nnLmrgR8Cas3OKWnYo";
            if (c07117d == null) {
                return 1000;
            }
        } else {
            String[] strArr5 = A0r;
            strArr5[0] = "x7i9CQzVOJPdqJX1dHOWNRL80PPtBuUS";
            strArr5[2] = "xh5QtfSCbDAINUU48h4MV8p0ljd4aaCa";
            if (c07117d == null) {
                return 1000;
            }
        }
        if (this.A0C.A0I() != null) {
            return this.A0C.A0I().A08();
        }
        return 1000;
    }

    private int A03() {
        if (this.A0F != null) {
            return this.A0F.A09();
        }
        if (this.A0C == null || this.A0C.A0I() == null) {
            return 0;
        }
        return this.A0C.A0I().A09();
    }

    public static Drawable A05(C0958Hi c0958Hi, Bitmap bitmap, boolean z11, String str) {
        BitmapDrawable bitmapDrawableA00;
        BitmapDrawable bitmapDrawable = new BitmapDrawable(c0958Hi.getResources(), bitmap);
        if (z11 && (bitmapDrawableA00 = AbstractC1909i5.A00(c0958Hi, str)) != null) {
            Drawable iconViewDrawable = new LayerDrawable(new Drawable[]{bitmapDrawable, bitmapDrawableA00});
            return iconViewDrawable;
        }
        return bitmapDrawable;
    }

    public static NativeAdBase A0A(Context context, String str, String str2) throws C2263nu {
        EnumC2265nx enumC2265nxA00 = C2269o1.A00(str2);
        if (enumC2265nxA00 != null) {
            EnumC2265nx enumC2265nx = EnumC2265nx.A04;
            String[] strArr = A0r;
            if (strArr[7].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[0] = "9sjWaS9CbZxjWOFrlYfgckD2h0ahWze6";
            strArr2[2] = "CgLfFBC4KJYZcdRIWMiGUMQeYT9XpqO1";
            if (enumC2265nxA00 == enumC2265nx) {
                return new NativeBannerAd(context, str);
            }
            EnumC2265nx template = EnumC2265nx.A05;
            if (enumC2265nxA00 == template) {
                return new NativeAd(context, str);
            }
            throw new C2263nu(AdErrorType.BID_PAYLOAD_ERROR, String.format(Locale.US, A0W(42, 34, 84), enumC2265nxA00));
        }
        throw new C2263nu(AdErrorType.BID_PAYLOAD_ERROR, String.format(Locale.US, A0W(114, 50, 50), str2));
    }

    private final C1056Lh A0C() {
        C1056Lh c1056Lh = this.A0f;
        if (c1056Lh != null && c1056Lh.A0R()) {
            return c1056Lh;
        }
        return null;
    }

    private LK A0F() {
        return A0G(false);
    }

    private LK A0G(boolean z11) {
        if (this.A0f != null && this.A0f.A0R()) {
            if (z11) {
                this.A0f.A0I();
            }
            C1056Lh c1056Lh = this.A0f;
            String[] strArr = A0r;
            if (strArr[0].charAt(5) == strArr[2].charAt(5)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[7] = "bGIdjP48JCmqHZjd8yMcvy0";
            strArr2[5] = "TixE3qv3ULKos9kbBUakVg1";
            return c1056Lh.A0E();
        }
        return new LK();
    }

    public static GW A0K() {
        return new GW();
    }

    public static GT A0L(NativeAdBaseApi nativeAdBaseApi) {
        if (nativeAdBaseApi instanceof Proxy) {
            return (GT) ((C1993jT) Proxy.getInvocationHandler(nativeAdBaseApi)).A04();
        }
        return (GT) nativeAdBaseApi;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    /* renamed from: A0M, reason: merged with bridge method [inline-methods] */
    public final C2252ni getAdChoicesIcon() {
        return A0F().A0G();
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    /* renamed from: A0O, reason: merged with bridge method [inline-methods] */
    public final C2253nj getAdStarRating() {
        return A0F().A0J();
    }

    private AdPlacementType A0R() {
        if (this.A0M == EnumC2265nx.A05) {
            return AdPlacementType.NATIVE;
        }
        return AdPlacementType.NATIVE_BANNER;
    }

    private void A0a() {
        for (View v11 : this.A0n) {
            v11.setOnClickListener(null);
            v11.setOnTouchListener(null);
            v11.setOnLongClickListener(null);
        }
        this.A0n.clear();
    }

    private void A0b() {
        if (!TextUtils.isEmpty(getAdChoicesLinkUrl())) {
            C2347pK.A0P(new C2347pK(), this.A0h, AbstractC2351pP.A00(getAdChoicesLinkUrl()), A1H());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0c() {
        this.A0k.A05();
        this.A0j.A05();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0d() {
        if (this.A0U != null) {
            this.A0U.A0V();
            this.A0h.A0F().ADQ();
            this.A0U = null;
        }
    }

    public static void A0f(Drawable drawable, ImageView imageView) {
        imageView.setScaleType(ImageView.ScaleType.FIT_XY);
        if (drawable != null) {
            imageView.setImageDrawable(drawable);
        }
        imageView.setBackground(null);
    }

    private void A0h(FrameLayout frameLayout, String str) {
        if (this.A0R != null) {
            C1908i4 c1908i4 = this.A0R;
            String[] strArr = A0r;
            if (strArr[0].charAt(5) == strArr[2].charAt(5)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[1] = "04W9af4JxjBHh0zFEdhxpJnrTxkqUHEu";
            strArr2[3] = "fTNta9LQ6rCDJI7HlapgEKn0696NnVDg";
            frameLayout.removeView(c1908i4);
        }
        this.A0R = AbstractC1909i5.A01(C2013jn.A03(this.A0h), str);
        if (this.A0R != null) {
            frameLayout.addView(this.A0R, new FrameLayout.LayoutParams(-1, -1));
            frameLayout.bringChildToFront(this.A0R);
        }
    }

    private void A0i(C1056Lh c1056Lh, boolean z11) {
        if (c1056Lh == null) {
            return;
        }
        boolean zEquals = this.A0H.equals(EnumC2246nc.A04);
        String strA0W = A0W(596, 6, 89);
        if (zEquals) {
            LK lkA0E = c1056Lh.A0E();
            LA laA0F = lkA0E.A0F();
            if (laA0F != null) {
                AbstractC1774fr.A00(laA0F, this.A0g, strA0W);
            }
            String strA7z = c1056Lh.A7z();
            if (!TextUtils.isEmpty(strA7z)) {
                this.A0G = new C2232nO(strA7z, this.A0h.A0A());
                this.A0g.A0e(this.A0G);
            }
            if (lkA0E.A0I() != null) {
                C2084kx c2084kx = new C2084kx(lkA0E.A0I().getUrl(), lkA0E.A0I().getHeight(), lkA0E.A0I().getWidth(), c1056Lh.A0G(), A0W(596, 6, 89));
                c2084kx.A01 = this.A0E;
                this.A0g.A0W();
                this.A0g.A0c(c2084kx);
            }
            if (!this.A0M.equals(EnumC2265nx.A04)) {
                C2252ni c2252niA0H = lkA0E.A0H();
                String[] strArr = A0r;
                String clientToken = strArr[1];
                if (clientToken.charAt(16) == strArr[3].charAt(16)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0r;
                strArr2[1] = "BiVeVWtUTguxpSjeMqAkCwQXeKWOVTz4";
                strArr2[3] = "8sdR9nWPZ664Gt9BvBocaDJi5It1hBkX";
                if (c2252niA0H != null) {
                    this.A0g.A0c(new C2084kx(lkA0E.A0H().getUrl(), lkA0E.A0H().getHeight(), lkA0E.A0H().getWidth(), c1056Lh.A0G(), A0W(596, 6, 89)));
                }
                if (c1056Lh.A0H() != null) {
                    for (GT gt2 : c1056Lh.A0H()) {
                        if (gt2.getAdCoverImage() != null) {
                            this.A0g.A0c(new C2084kx(gt2.getAdCoverImage().getUrl(), gt2.getAdCoverImage().getHeight(), gt2.getAdCoverImage().getWidth(), c1056Lh.A0G(), A0W(596, 6, 89)));
                        }
                    }
                }
                String strA0e = lkA0E.A0e();
                if (!TextUtils.isEmpty(strA0e)) {
                    this.A0g.A0b(new C2082kv(strA0e, c1056Lh.A0G(), A0W(596, 6, 89), lkA0E.A0D()));
                }
            }
            if (laA0F != null && laA0F.A2Q()) {
                C2082kv cacheFileData = new C2082kv(laA0F.A1Y(), laA0F.A1r(), strA0W);
                cacheFileData.A04 = true;
                cacheFileData.A03 = A0W(0, 5, 0);
                this.A0g.A0Y(cacheFileData);
            }
        }
        this.A0g.A0X(new C0924Ga(this, c1056Lh, z11), new C2079ks(c1056Lh.A0G(), strA0W));
    }

    private void A0j(InterfaceC1723f2 interfaceC1723f2) {
        if (this.A0f == null) {
            return;
        }
        this.A0f.A0K(interfaceC1723f2);
    }

    public static void A0k(NativeAdImageApi nativeAdImageApi, ImageView imageView, C0958Hi c0958Hi) {
        if (nativeAdImageApi != null && imageView != null) {
            new AsyncTaskC0892Et(imageView, c0958Hi).A05(nativeAdImageApi.getHeight(), nativeAdImageApi.getWidth()).A07(nativeAdImageApi.getUrl());
        }
    }

    private final void A0n(GS gs2) {
        this.A0J = gs2;
    }

    private final void A0o(String str) {
        this.A0W = str;
    }

    private void A0p(List<View> list, View view) {
        if (this.A0i != null && this.A0i.ALF(view)) {
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
                View childAt = viewGroup.getChildAt(i5);
                String[] strArr = A0r;
                String str = strArr[7];
                String str2 = strArr[5];
                int i11 = str.length();
                if (i11 != str2.length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0r;
                strArr2[1] = "SQxDsveS3BVeMl0nUnJayKxDlwKiSRwM";
                strArr2[3] = "CPUPH8uU8pe6dd8URnD7AGDEQ4lKFlLs";
                A0p(list, childAt);
            }
            return;
        }
        list.add(view);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0q() {
        return A1D() == EnumC2256nm.A05 || A1D() == EnumC2256nm.A03;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0r() {
        return A0F().A0j();
    }

    public final int A0y() {
        return A0F().A06();
    }

    public final int A0z() {
        return A0F().A07();
    }

    public final int A10() {
        if (this.A0f != null && !TextUtils.isEmpty(this.A0f.A0E().A0e())) {
            return this.A0f.A0E().A0A();
        }
        return -1;
    }

    public final long A11() {
        return this.A00;
    }

    public final C1056Lh A12() {
        return this.A0f;
    }

    public final LA A13() {
        return A0F().A0F();
    }

    public final C2086kz A14() {
        return this.A0g;
    }

    public final C0958Hi A15() {
        return this.A0h;
    }

    public final C0958Hi A16() {
        return this.A0h;
    }

    public final GV A17() {
        return this.A0I;
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    /* renamed from: A18, reason: merged with bridge method [inline-methods] */
    public final C2252ni getAdCoverImage() {
        return A0F().A0H();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    /* renamed from: A19, reason: merged with bridge method [inline-methods] */
    public final C2252ni getAdIcon() {
        return A0F().A0I();
    }

    public final GS A1A() {
        return this.A0J;
    }

    public final C2254nk A1B() {
        return this.A0K;
    }

    public final EnumC2255nl A1C() {
        return this.A0L;
    }

    public final EnumC2256nm A1D() {
        return A0F().A0K();
    }

    public final C2417qT A1E() {
        return this.A0k;
    }

    public final C2552se A1F() {
        if (A13() == null || !A13().A3S()) {
            return null;
        }
        C2552se c2552se = new C2552se(this.A0h, EnumC2569sv.A05);
        c2552se.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.ne
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.A00.A1R(view);
            }
        });
        return c2552se;
    }

    public final C1539c2 A1G() {
        return this.A0V;
    }

    public final String A1H() {
        if (this.A0f == null || !isAdLoaded()) {
            return null;
        }
        return this.A0f.A7z();
    }

    public final String A1I() {
        return this.A0X;
    }

    public final String A1J() {
        return A0G(true).A0Q();
    }

    public final String A1K() {
        return A0G(true).A0R();
    }

    public final String A1L() {
        return A0F().A0d();
    }

    public final String A1M() {
        if (this.A0f == null || TextUtils.isEmpty(this.A0f.A0E().A0e())) {
            return null;
        }
        return this.A0g.A0T(this.A0f.A0E().A0e());
    }

    public final List<GT> A1N() {
        if (this.A0f == null || !isAdLoaded()) {
            return null;
        }
        return this.A0f.A0H();
    }

    public final void A1O() {
        if (!AbstractC1820gb.A00(this.A0h.A02()).A0O(this.A0h, false)) {
            A0b();
            return;
        }
        AbstractC2524sC abstractC2524sCA01 = AbstractC2525sD.A01(this.A0h, this.A0h.A0A(), A1H(), this.A09);
        if (abstractC2524sCA01 == null) {
            A0b();
            return;
        }
        if (this.A09 == null) {
            A0b();
            return;
        }
        ((IB) this.A09.getNativeAdLayoutApi()).A05(abstractC2524sCA01);
        if (!C2203mv.A22(this.A0h)) {
            A15().A0F().ACK();
            abstractC2524sCA01.setOnAdClosedListener(this.A08);
        }
        abstractC2524sCA01.setAdReportingCallbackListener(this.A0O);
        abstractC2524sCA01.A0N();
    }

    public final void A1P(Drawable drawable) {
        this.A01 = drawable;
        A1o(drawable != null, true);
        String[] strArr = A0r;
        if (strArr[4].length() == strArr[6].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0r;
        strArr2[4] = "Q96JEqttX0oIb74l";
        strArr2[6] = "mqYIcYUMJzEb";
    }

    public final void A1Q(View view) {
        this.A0n.add(view);
        view.setOnClickListener(this.A0I);
        view.setOnTouchListener(this.A0I);
        if (C2203mv.A1B(view.getContext())) {
            GV gv2 = this.A0I;
            String[] strArr = A0r;
            if (strArr[1].charAt(16) == strArr[3].charAt(16)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[4] = "GeTsVetQiODT9yUx";
            strArr2[6] = "UPeG8QvAHkrx";
            view.setOnLongClickListener(gv2);
        }
    }

    public final /* synthetic */ void A1R(View view) {
        this.A0h.A0F().ABj(EnumC2569sv.A05.name().toLowerCase(Locale.US));
        A1O();
    }

    public final void A1S(View view, ImageView imageView) {
        ArrayList arrayList = new ArrayList();
        A0p(arrayList, view);
        A0g(view, imageView, arrayList, true);
    }

    public final void A1T(View view, ImageView imageView, List<View> clickableViews) {
        A0g(view, imageView, clickableViews, true);
    }

    public final void A1U(View view, AdNativeComponentView adNativeComponentView) {
        ArrayList arrayList = new ArrayList();
        A0p(arrayList, view);
        A0g(view, adNativeComponentView, arrayList, false);
    }

    public final void A1V(View view, AdNativeComponentView adNativeComponentView, List<View> clickableViews) {
        A0g(view, adNativeComponentView, clickableViews, false);
    }

    public final void A1W(View view, AdNativeComponentView adNativeComponentView, List<View> clickableViews, boolean z11) {
        A0g(view, adNativeComponentView, clickableViews, z11);
    }

    public final void A1X(View view, AdNativeComponentView adNativeComponentView, boolean z11) {
        List<View> clickableViews = new ArrayList<>();
        A0p(clickableViews, view);
        A0g(view, adNativeComponentView, clickableViews, z11);
    }

    public final void A1Y(AdClosedListener adClosedListener) {
        A15().A0F().ACL();
        this.A08 = adClosedListener;
    }

    public final void A1Z(MediaView mediaView) {
        if (mediaView != null) {
            this.A0d = true;
        }
    }

    public final void A1a(MediaView mediaView) {
        if (mediaView != null) {
            this.A0e = true;
        }
    }

    public final void A1b(NativeAdBase nativeAdBase, NativeAdListener nativeAdListener) {
        if (nativeAdListener == null) {
            return;
        }
        A0n(new AnonymousClass79(nativeAdListener, nativeAdBase));
    }

    public final void A1c(NativeAdLayout nativeAdLayout) {
        this.A09 = nativeAdLayout;
    }

    public final void A1d(C1056Lh c1056Lh) {
        A0i(c1056Lh, true);
        if (this.A0J != null) {
            List<GT> listA0H = c1056Lh.A0H();
            String[] strArr = A0r;
            if (strArr[7].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[0] = "OfB2JsewzcYgCxMvn97l0AOaUV28WOmd";
            strArr2[2] = "fN7XzjPm8qHCAEGwTiZWrbsVWAwnjwvJ";
            if (listA0H != null) {
                C0926Gc c0926Gc = new C0926Gc(this);
                Iterator<GT> it = c1056Lh.A0H().iterator();
                while (it.hasNext()) {
                    it.next().A0j(c0926Gc);
                }
            }
        }
    }

    public final void A1e(IW iw2) {
        this.A0Y = new WeakReference<>(iw2);
    }

    public final void A1f(EnumC2246nc enumC2246nc, String str, l5 l5Var) {
        if (str == null) {
            this.A0h.A0F().A3m();
        } else {
            this.A0h.A0F().A3l();
        }
        this.A00 = System.currentTimeMillis();
        if (this.A0o) {
            AdSettings.IntegrationErrorMode integrationErrorModeA00 = AbstractC1784g1.A00(this.A0h);
            String strA0W = A0W(566, 30, 115);
            AdSettings.IntegrationErrorMode integrationErrorMode = AdSettings.IntegrationErrorMode.INTEGRATION_ERROR_CRASH_DEBUG_MODE;
            if (!integrationErrorMode.equals(integrationErrorModeA00)) {
                C2262nt c2262nt = new C2262nt(AdErrorType.LOAD_AD_CALLED_MORE_THAN_ONCE, A0W(566, 30, 115));
                A16().A0F().A3j(C2416qS.A01(this.A00), c2262nt.A03().getErrorCode(), c2262nt.A04());
                if (this.A0J != null) {
                    this.A0J.AEr(c2262nt);
                } else {
                    Log.e(A0W(76, 17, 41), strA0W);
                }
                C2127lg c2127lg = new C2127lg(strA0W);
                A16().A08().ABz(A0W(550, 3, 3), AbstractC2126lf.A0c, c2127lg);
            } else {
                throw new C1789g6(strA0W);
            }
        }
        this.A0o = true;
        this.A0H = enumC2246nc;
        if (enumC2246nc.equals(EnumC2246nc.A05)) {
            this.A0A = EnumC1721f0.A05;
        }
        this.A0E = l5Var;
        C1781fy c1781fy = new C1781fy(this.A0l, this.A0M, A0R(), null, 1, new K5());
        c1781fy.A05(enumC2246nc);
        c1781fy.A06(this.A0W);
        c1781fy.A07(this.A0X);
        this.A0C = new C07117d(this.A0h, c1781fy);
        this.A0C.A0R(new C0927Gd(this));
        this.A0C.A0V(str);
        this.A0h.A0F().A3k();
    }

    public final void A1g(C2254nk c2254nk) {
        this.A0K = c2254nk;
    }

    public final void A1h(EnumC2255nl enumC2255nl) {
        this.A0L = enumC2255nl;
    }

    public final void A1i(EnumC2265nx enumC2265nx) {
        if (!A0r()) {
            if (EnumC2265nx.A04.equals(enumC2265nx)) {
                C0958Hi c0958Hi = this.A0h;
                String[] strArr = A0r;
                if (strArr[7].length() != strArr[5].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0r;
                strArr2[7] = "er71GFUENUkH6mVEmd80tsw";
                strArr2[5] = "eRFgtOOg0hnVr16Te1PNaNs";
                c0958Hi.A0F().A3p(AdPlacementType.NATIVE_BANNER.toString(), this.A0l);
            } else {
                this.A0h.A0F().A3p(AdPlacementType.NATIVE.toString(), this.A0l);
            }
        }
        this.A0M = enumC2265nx;
    }

    public final void A1j(InterfaceC2523sB interfaceC2523sB) {
        this.A0O = interfaceC2523sB;
    }

    public final void A1k(AbstractC1540c3 abstractC1540c3) {
        this.A0Z = new WeakReference<>(abstractC1540c3);
    }

    public final void A1l(boolean z11) {
        this.A0b = z11;
    }

    public final void A1m(boolean z11) {
        this.A0a = z11;
    }

    public final void A1n(boolean z11) {
        this.A0c = z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00eb  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A1o(boolean z11, boolean z12) {
        String strA0W;
        if (z11) {
            boolean zEquals = this.A0H.equals(EnumC2246nc.A05);
            String[] strArr = A0r;
            if (strArr[0].charAt(5) == strArr[2].charAt(5)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[7] = "JLY2qeoxINM9b6rKgxvdoo5";
            strArr2[5] = "SO3TgjdXtMDnoN5cYw5MldE";
            if (zEquals && !A0r() && this.A0J != null) {
                this.A0J.AFu();
            }
            if (this.A0V != null) {
                this.A0V.A0U();
                this.A0j.A09();
                return;
            }
            return;
        }
        if (this.A0V != null) {
            C1056Lh c1056LhA12 = A12();
            String[] strArr3 = A0r;
            if (strArr3[7].length() != strArr3[5].length()) {
                String[] strArr4 = A0r;
                strArr4[7] = "USSBWMStI3ylD2K7nffeYBb";
                strArr4[5] = "raKwme25MGMDEpiUbEFBbTJ";
                if (c1056LhA12 != null) {
                    strA0W = c1056LhA12.A0G();
                } else {
                    strA0W = A0W(0, 0, 21);
                }
            } else {
                String[] strArr5 = A0r;
                strArr5[0] = "bG4PdUDVMluUNyK8pZyXt2dq2VQBZyfQ";
                strArr5[2] = "sHMyAJzOe9OYyidAIXRm3TyTiII6Suie";
                if (c1056LhA12 != null) {
                }
            }
            this.A0j.A0C(this.A0h, strA0W);
            this.A0V.A0V();
        }
        GS gs2 = this.A0J;
        String[] strArr6 = A0r;
        if (strArr6[4].length() != strArr6[6].length()) {
            String[] strArr7 = A0r;
            strArr7[0] = "FypWWsEn8bqXdPqUiIsc7hG8qhiMqauF";
            strArr7[2] = "IXlSBRmtDoTZUwhzIwgkgymkT50eT72S";
            if (gs2 == null) {
                return;
            }
        } else if (gs2 == null) {
            return;
        }
        if (!z12) {
            return;
        }
        C2262nt c2262ntA01 = C2262nt.A01(AdErrorType.BROKEN_MEDIA_ERROR, A0W(93, 21, 63));
        A16().A0F().A3j(C2416qS.A01(this.A00), c2262ntA01.A03().getErrorCode(), c2262ntA01.A04());
        this.A0J.AEr(c2262ntA01);
    }

    public final boolean A1p() {
        return this.A0Y.get() != null;
    }

    public final boolean A1q() {
        return this.A0a;
    }

    public final boolean A1r() {
        return A0F().A0h();
    }

    public final boolean A1s() {
        return A0F().A0g();
    }

    public final boolean A1t() {
        return this.A0M == EnumC2265nx.A04;
    }

    public final boolean A1u() {
        return this.A09 == null;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2259np
    public final int A8E() {
        View view = this.A06;
        if (view instanceof AdNativeComponentView) {
            View videoView = ((AdNativeComponentView) view).getAdContentsView();
            if (videoView instanceof C1678eI) {
                return ((C1678eI) videoView).getCurrentPosition();
            }
            return -1;
        }
        return -1;
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final NativeAdBase.NativeAdLoadConfigBuilder buildLoadAdConfig(NativeAdBase nativeAdBase) {
        return new C2257nn(this, nativeAdBase);
    }

    @Override // com.facebook.ads.Ad
    public final void destroy() {
        AbstractC2273o5.A05(A0W(553, 7, 7), A0W(363, 19, 23), A0W(13, 8, 89));
        if (C2203mv.A1z(this.A0h)) {
            A16().A0B().ALo(this.A03);
        }
        if (!A0r()) {
            this.A0h.A0F().A3q();
        }
        if (this.A0C != null) {
            this.A0C.A0X(true);
            this.A0C.A0J();
            this.A0C = null;
        }
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final void downloadMedia() {
        if (this.A0H.equals(EnumC2246nc.A05)) {
            this.A0A = EnumC1721f0.A04;
        }
        this.A0H = EnumC2246nc.A04;
        A0i(this.A0f, false);
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getAdBodyText() {
        return A0G(true).A0L();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getAdCallToAction() {
        return A0G(true).A0Z();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getAdChoicesImageUrl() {
        if (getAdChoicesIcon() == null) {
            return null;
        }
        C2252ni adChoicesIcon = getAdChoicesIcon();
        String[] strArr = A0r;
        if (strArr[0].charAt(5) == strArr[2].charAt(5)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0r;
        strArr2[7] = "MRTmAh7YnfwjJHGdoro5GGF";
        strArr2[5] = "5NAjexdbITBZf7E7VHPXfXw";
        return adChoicesIcon.getUrl();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getAdChoicesLinkUrl() {
        return A0F().A0M();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getAdChoicesText() {
        return A0F().A0N();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getAdHeadline() {
        return A0G(true).A0O();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getAdLinkDescription() {
        return A0G(true).A0P();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getAdSocialContext() {
        return A0G(true).A0T();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getAdTranslation() {
        return A0G(true).A0W();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getAdUntrimmedBodyText() {
        return A0G(true).A0X();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getAdvertiserName() {
        return A0G(true).A0Y();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final float getAspectRatio() {
        if (this.A0f != null) {
            LK lkA0E = this.A0f.A0E();
            String[] strArr = A0r;
            if (strArr[7].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[1] = "Gk0JtmCCXYpL8dPDyrRdSPBqQO7pSw2M";
            strArr2[3] = "hZFl2ZrFl9W40ZKmdwMt57qcTxbjzHrP";
            C2252ni nativeAdImage = lkA0E.A0H();
            if (nativeAdImage != null) {
                int width = nativeAdImage.getWidth();
                int height = nativeAdImage.getHeight();
                if (height > 0) {
                    return width / height;
                }
                return 0.0f;
            }
        }
        return 0.0f;
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getId() {
        if (!isAdLoaded()) {
            return null;
        }
        String str = this.A0m;
        String[] strArr = A0r;
        if (strArr[4].length() == strArr[6].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0r;
        strArr2[7] = "iawtn5ImZtHDfKUJHK1ePg9";
        strArr2[5] = "61vZsTsWUXSHOR043CjOsZn";
        return str;
    }

    @Override // com.facebook.ads.Ad
    public final String getPlacementId() {
        return this.A0l;
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final Drawable getPreloadedIconViewDrawable() {
        C2252ni c2252niA0I;
        Bitmap bitmapA0N;
        C1056Lh adapter = this.A0f;
        if (adapter != null && (c2252niA0I = A0F().A0I()) != null && (bitmapA0N = this.A0g.A0N(c2252niA0I.getUrl())) != null) {
            C0958Hi c0958HiA16 = A16();
            boolean zA1u = A1u();
            String[] strArr = A0r;
            if (strArr[0].charAt(5) == strArr[2].charAt(5)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[4] = "5rXv1LFjMRKkpcU7";
            strArr2[6] = "SFgDKFOuseBk";
            return A05(c0958HiA16, bitmapA0N, zA1u, A1I());
        }
        return null;
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getPromotedTranslation() {
        return A0G(true).A0S();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final String getSponsoredTranslation() {
        return A0G(true).A0U();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final boolean hasCallToAction() {
        return this.A0f != null && this.A0f.A0Q();
    }

    @Override // com.facebook.ads.Ad
    public final boolean isAdInvalidated() {
        boolean zA0A = true;
        if (this.A0C != null) {
            zA0A = this.A0C.A0Y();
        } else {
            KC kc2 = this.A0D;
            String[] strArr = A0r;
            if (strArr[1].charAt(16) == strArr[3].charAt(16)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[7] = "v5uFzvuQ32LyebguaenlI2Y";
            strArr2[5] = "nsJGpwd0QPZOfVeZMyNRGWR";
            if (kc2 != null) {
                zA0A = this.A0D.A0A();
            }
        }
        this.A0h.A0F().A6E(zA0A);
        return zA0A;
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final boolean isAdLoaded() {
        return this.A0f != null && this.A0f.A0R();
    }

    @Override // com.facebook.ads.Ad
    public final void loadAd() {
        AbstractC2273o5.A05(A0W(560, 6, 14), A0W(382, 24, 98), A0W(21, 8, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
        A1f(EnumC2246nc.A00(NativeAdBase.MediaCacheFlag.ALL), null, new l5(false, -1, -1));
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final void loadAd(NativeAdBase.NativeLoadAdConfig nativeLoadAdConfig) {
        AbstractC2273o5.A05(A0W(560, 6, 14), A0W(382, 24, 98), A0W(5, 8, 76));
        ((C2257nn) nativeLoadAdConfig).A00();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final void onCtaBroadcast() {
        if (this.A05 != null) {
            this.A05.performClick();
        }
    }

    @Override // com.facebook.ads.internal.context.Repairable
    public final void repair(Throwable th2) {
        if (this.A04 != null) {
            this.A04.post(new C0928Ge(this));
        }
        String str = A0W(164, 16, 64) + AbstractC2408qK.A03(this.A0h, th2);
        A16().A0F().A3j(C2416qS.A01(this.A00), 2001, str);
        if (this.A0J != null) {
            this.A0J.AEr(new C2262nt(2001, str));
        }
    }

    @Override // com.facebook.ads.Ad
    public final void setExtraHints(ExtraHints extraHints) {
        if (extraHints == null) {
            return;
        }
        A0o(extraHints.getHints());
        this.A0X = extraHints.getMediationData();
    }

    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    public final void setOnTouchListener(View.OnTouchListener onTouchListener) {
        this.A02 = onTouchListener;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00bd  */
    @Override // com.facebook.ads.internal.api.NativeAdBaseApi
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void unregisterView() {
        C1908i4 c1908i4 = this.A0R;
        if (c1908i4 != null) {
            ViewParent parent = c1908i4.getParent();
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(c1908i4);
            }
            this.A0R = null;
        }
        if (this.A04 == null || this.A06 == null) {
            return;
        }
        if (!A0r()) {
            InterfaceC1640df interfaceC1640dfA0F = this.A0h.A0F();
            String[] strArr = A0r;
            if (strArr[4].length() == strArr[6].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0r;
            strArr2[1] = "cYEHlIHF7Qe4IYNxEGisZavvdYqfT1NQ";
            strArr2[3] = "IvkWoeS5LcA5RnG3xI5yLmU1spuVl7qW";
            interfaceC1640dfA0F.unregisterView();
        }
        C0958Hi c0958Hi = this.A0h;
        String[] strArr3 = A0r;
        if (strArr3[1].charAt(16) != strArr3[3].charAt(16)) {
            String[] strArr4 = A0r;
            strArr4[0] = "MOnirYFFQGBOpDM1usFuy9dITQXNjsmg";
            strArr4[2] = "BENjy9ISBGpLCtRbprsy2gYEceZw0rIm";
            if (C2203mv.A1z(c0958Hi)) {
                A16().A0B().ALo(this.A03);
            }
        } else if (C2203mv.A1z(c0958Hi)) {
        }
        if (A0t.containsKey(this.A04) && A0t.get(this.A04).get() == this) {
            boolean z11 = this.A04 instanceof ViewGroup;
            String[] strArr5 = A0r;
            if (strArr5[4].length() != strArr5[6].length()) {
                String[] strArr6 = A0r;
                strArr6[0] = "lVWmVGygxw0UbRbggHe19cSptvLLteak";
                strArr6[2] = "yD1YSLWVotW9RM3Ng5RpEu8J61bKeSm7";
                if (z11) {
                    if (this.A0N != null) {
                        ((ViewGroup) this.A04).removeView(this.A0N);
                        this.A0N = null;
                    }
                }
            } else if (z11) {
            }
            if (this.A0f != null) {
                this.A0f.A0J();
            }
            if (this.A0P != null && C2203mv.A1B(this.A0h)) {
                this.A0P.A07();
                this.A04.getOverlay().remove(this.A0P);
            }
            if (this.A07 != null) {
                ViewTreeObserver viewTreeObserver = this.A04.getViewTreeObserver();
                if (viewTreeObserver.isAlive()) {
                    viewTreeObserver.removeOnWindowFocusChangeListener(this.A07);
                }
                this.A07 = null;
            }
            A0t.remove(this.A04);
            A0a();
            this.A04 = null;
            this.A06 = null;
            if (this.A0V != null) {
                this.A0V.A0V();
                this.A0V = null;
            }
            A0d();
            this.A0B = null;
            this.A0a = false;
            return;
        }
        throw new IllegalStateException(A0W(481, 38, 72));
    }
}
