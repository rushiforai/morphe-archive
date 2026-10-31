package c3;

import ads_mobile_sdk.bs3;
import ads_mobile_sdk.cs0;
import ads_mobile_sdk.et0;
import ads_mobile_sdk.iq3;
import ads_mobile_sdk.jn;
import ads_mobile_sdk.jr0;
import ads_mobile_sdk.jy0;
import ads_mobile_sdk.pu;
import ads_mobile_sdk.qv2;
import ads_mobile_sdk.xu0;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import androidx.compose.ui.node.LayoutNode;
import b.u4;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Set;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.math.MathKt;
import l1.x6;

/* loaded from: classes2.dex */
public final class c1 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19239j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f19240k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c1(Object obj, int i5) {
        super(0);
        this.f19239j = i5;
        this.f19240k = obj;
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:391:0x00f0 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0109  */
    @Override // kotlin.jvm.functions.Function0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke() {
        Function0 function0;
        int iW0;
        Iterator it;
        m90.d0 d0VarR;
        Pair pair;
        Pair pair2;
        o8.f fVar;
        boolean z11;
        int i5;
        int iMin;
        double dMax;
        Bitmap bitmapCreateBitmap;
        int iE;
        c6.c cVarC;
        int iE2;
        int i11;
        p1.d2 d2Var;
        int i12 = 4;
        switch (this.f19239j) {
            case 0:
                t70.k0.c(((d1) this.f19240k).f19253c, null);
                return Unit.f71706a;
            case 1:
                jr0 jr0Var = ((bs3) this.f19240k).f1522c;
                jr0Var.getClass();
                Boolean bool = (Boolean) jr0Var.a("gads:use_gma_profile:enabled", Boolean.FALSE, jn.a$10);
                bool.getClass();
                return bool;
            case 2:
                return "Creating Thread with priority offset " + ((Integer) this.f19240k);
            case 3:
                ((et0) this.f19240k).a(pu.f8385b);
                return Unit.f71706a;
            case 4:
                jr0 jr0Var2 = ((iq3) this.f19240k).f4905e;
                jr0Var2.getClass();
                Boolean bool2 = (Boolean) jr0Var2.a("gads:startup_webview_during_initialization:enabled", Boolean.FALSE, jn.a$10);
                bool2.getClass();
                return bool2;
            case 5:
                com.google.gson.r rVar = ((qv2) this.f19240k).f8849t;
                if (rVar == null) {
                    Intrinsics.m("signalJson");
                    throw null;
                }
                return "Ad Request Signals: " + rVar;
            case 6:
                return u4.h(((xu0) this.f19240k).f11834b, "Pre break glass URL result: ");
            case 7:
                return "Call to initialize WorkManager failed: " + ((Exception) this.f19240k);
            case 8:
                jy0 jy0Var = ((cs0) this.f19240k).G;
                if (jy0Var != null) {
                    return jy0Var.f5452a;
                }
                Intrinsics.m("gmaWebViewContainer");
                throw null;
            case 9:
                c4.d0 d0Var = (c4.d0) this.f19240k;
                z2.y yVar = (z2.y) ((p1.s2) d0Var.f19584j).getValue();
                return Boolean.valueOf((((yVar == null || !yVar.isAttached()) ? null : yVar) == null || ((y3.m) ((p1.s2) d0Var.f19583i).getValue()) == null) ? false : true);
            case 10:
                ((g.o) this.f19240k).reportFullyDrawn();
                return Unit.f71706a;
            case 11:
                ((g.a0) this.f19240k).d();
                return Unit.f71706a;
            case 12:
                ((g2.z) this.f19240k).D();
                return Unit.f71706a;
            case 13:
                b3.g.d((k1.b) this.f19240k);
                return Unit.f71706a;
            case 14:
                ((Function1) this.f19240k).invoke(Boolean.FALSE);
                return Unit.f71706a;
            case 15:
                ((l1.i2) this.f19240k).invoke();
                return Boolean.TRUE;
            case 16:
                return Float.valueOf(((y3.c) this.f19240k).mo102toPx0680j_4(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
            case 17:
                x6 x6Var = (x6) this.f19240k;
                if (!((Boolean) ((p1.s2) x6Var.f74251j).getValue()).booleanValue() && (function0 = x6Var.f74242a) != null) {
                    function0.invoke();
                }
                return Unit.f71706a;
            case 18:
                return Float.valueOf(((Number) ((n1.q) ((n1.o) this.f19240k)).f77679a.e()).floatValue());
            case 19:
                n90.g gVar = (n90.g) this.f19240k;
                ClassLoader classLoader = gVar.f78045b;
                m90.m mVar = gVar.f78046c;
                Enumeration<URL> resources = classLoader.getResources(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                Intrinsics.f(resources, "getResources(...)");
                ArrayList<URL> list = Collections.list(resources);
                Intrinsics.f(list, "list(this)");
                ArrayList arrayList = new ArrayList();
                for (URL url : list) {
                    Intrinsics.d(url);
                    if (Intrinsics.b(url.getProtocol(), "file")) {
                        String str = m90.z.f76176b;
                        pair2 = new Pair(mVar, br.a.v(new File(url.toURI())));
                    } else {
                        pair2 = null;
                    }
                    if (pair2 != null) {
                        arrayList.add(pair2);
                    }
                }
                Enumeration<URL> resources2 = classLoader.getResources("META-INF/MANIFEST.MF");
                Intrinsics.f(resources2, "getResources(...)");
                ArrayList list2 = Collections.list(resources2);
                Intrinsics.f(list2, "list(this)");
                ArrayList arrayList2 = new ArrayList();
                Iterator it2 = list2.iterator();
                while (it2.hasNext()) {
                    URL url2 = (URL) it2.next();
                    Intrinsics.d(url2);
                    String string = url2.toString();
                    Intrinsics.f(string, "toString(...)");
                    if (r70.j.I0(string, "jar:file:", false) && (iW0 = r70.k.W0(6, string, "!")) != -1) {
                        String str2 = m90.z.f76176b;
                        String strSubstring = string.substring(i12, iW0);
                        Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
                        m90.z zVarV = br.a.v(new File(URI.create(strSubstring)));
                        m90.t tVarK = mVar.k(zVarV);
                        try {
                            long size = tVarK.size() - 22;
                            long j11 = 0;
                            if (size < 0) {
                                throw new IOException("not a zip: size=" + tVarK.size());
                            }
                            it = it2;
                            long jMax = Math.max(size - 65536, 0L);
                            while (true) {
                                m90.d0 d0VarR2 = x7.f.r(tVarK.b(size));
                                try {
                                    long j12 = j11;
                                    if (d0VarR2.c() == 101010256) {
                                        int iE3 = d0VarR2.e() & 65535;
                                        int iE4 = d0VarR2.e() & 65535;
                                        long jE = d0VarR2.e() & 65535;
                                        if (jE != (d0VarR2.e() & 65535) || iE3 != 0 || iE4 != 0) {
                                            throw new IOException("unsupported zip: spanned");
                                        }
                                        d0VarR2.skip(4L);
                                        int iE5 = d0VarR2.e() & 65535;
                                        n90.e eVar = new n90.e(iE5, jE, d0VarR2.c() & 4294967295L);
                                        d0VarR2.f(iE5);
                                        d0VarR2.close();
                                        long j13 = size - 20;
                                        if (j13 > j12) {
                                            d0VarR2 = x7.f.r(tVarK.b(j13));
                                            try {
                                                if (d0VarR2.c() == 117853008) {
                                                    int iC = d0VarR2.c();
                                                    long jD = d0VarR2.d();
                                                    if (d0VarR2.c() != 1 || iC != 0) {
                                                        throw new IOException("unsupported zip: spanned");
                                                    }
                                                    d0VarR2 = x7.f.r(tVarK.b(jD));
                                                    try {
                                                        int iC2 = d0VarR2.c();
                                                        if (iC2 != 101075792) {
                                                            throw new IOException("bad zip: expected " + n90.k.b(101075792) + " but was " + n90.k.b(iC2));
                                                        }
                                                        d0VarR2.skip(12L);
                                                        int iC3 = d0VarR2.c();
                                                        int iC4 = d0VarR2.c();
                                                        long jD2 = d0VarR2.d();
                                                        if (jD2 != d0VarR2.d() || iC3 != 0 || iC4 != 0) {
                                                            throw new IOException("unsupported zip: spanned");
                                                        }
                                                        d0VarR2.skip(8L);
                                                        n90.e eVar2 = new n90.e(iE5, jD2, d0VarR2.d());
                                                        Unit unit = Unit.f71706a;
                                                        eVar = eVar2;
                                                    } finally {
                                                    }
                                                }
                                                Unit unit2 = Unit.f71706a;
                                            } finally {
                                            }
                                        }
                                        n90.e eVar3 = eVar;
                                        long j14 = eVar3.f78040b;
                                        ArrayList arrayList3 = new ArrayList();
                                        d0VarR = x7.f.r(tVarK.b(j14));
                                        try {
                                            long j15 = eVar3.f78039a;
                                            while (j12 < j15) {
                                                n90.h hVarC = n90.k.c(d0VarR);
                                                if (hVarC.f78054g >= j14) {
                                                    throw new IOException("bad zip: local file header offset >= central directory offset");
                                                }
                                                m90.z zVar = n90.g.f78044e;
                                                if (b6.e.e(hVarC.f78048a)) {
                                                    arrayList3.add(hVarC);
                                                }
                                                j12++;
                                            }
                                            Unit unit3 = Unit.f71706a;
                                            d0VarR.close();
                                            m90.m0 m0Var = new m90.m0(zVarV, mVar, n90.k.a(arrayList3));
                                            tVarK.close();
                                            pair = new Pair(m0Var, n90.g.f78044e);
                                        } catch (Throwable th2) {
                                            try {
                                                throw th2;
                                            } finally {
                                            }
                                        }
                                    } else {
                                        d0VarR2.close();
                                        size--;
                                        if (size < jMax) {
                                            throw new IOException("not a zip: end of central directory signature not found");
                                        }
                                        j11 = j12;
                                    }
                                } finally {
                                    d0VarR2.close();
                                }
                            }
                        } finally {
                        }
                    } else {
                        it = it2;
                        pair = null;
                    }
                    if (pair != null) {
                        arrayList2.add(pair);
                    }
                    it2 = it;
                    i12 = 4;
                }
                return b70.g.t1(arrayList2, arrayList);
            case 20:
                o8.d dVar = (o8.d) this.f19240k;
                BitmapFactory.Options options = new BitmapFactory.Options();
                x8.n nVar = dVar.f79693b;
                o8.k kVar = dVar.f79692a;
                eb0.v vVar = new eb0.v(kVar.b());
                d0VarR = x7.f.r(vVar);
                options.inJustDecodeBounds = true;
                int i13 = 5;
                BitmapFactory.decodeStream(new a60.b(d0VarR.peek(), i13), null, options);
                Exception exc = (Exception) vVar.f52656c;
                if (exc != null) {
                    throw exc;
                }
                options.inJustDecodeBounds = false;
                Paint paint = o8.h.f79702a;
                String str3 = options.outMimeType;
                Set set = o8.i.f79703a;
                int iF = b.c0.F(2);
                if (iF == 0) {
                    fVar = o8.f.f79697c;
                } else {
                    if (iF != 1) {
                        if (iF != 2) {
                            throw new NoWhenBranchMatchedException();
                        }
                    } else if (str3 == null || !o8.i.f79703a.contains(str3)) {
                    }
                    c6.g gVar2 = new c6.g(new o8.g(new a60.b(d0VarR.peek(), i13)));
                    c6.c cVarC2 = gVar2.c("Orientation");
                    if (cVarC2 == null) {
                        iE = 1;
                        boolean z12 = iE != 2 || iE == 7 || iE == 4 || iE == 5;
                        cVarC = gVar2.c("Orientation");
                        if (cVarC != null) {
                            iE2 = 1;
                            switch (iE2) {
                                case 3:
                                case 4:
                                    i11 = 180;
                                    break;
                                case 5:
                                case 8:
                                    i11 = 270;
                                    break;
                                case 6:
                                case 7:
                                    i11 = 90;
                                    break;
                                default:
                                    i11 = 0;
                                    break;
                            }
                            fVar = new o8.f(z12, i11);
                        } else {
                            try {
                                iE2 = cVarC.e(gVar2.f19740e);
                            } catch (NumberFormatException unused) {
                            }
                            switch (iE2) {
                            }
                            fVar = new o8.f(z12, i11);
                        }
                    } else {
                        try {
                            iE = cVarC2.e(gVar2.f19740e);
                        } catch (NumberFormatException unused2) {
                        }
                        if (iE != 2) {
                            cVarC = gVar2.c("Orientation");
                            if (cVarC != null) {
                            }
                        }
                    }
                }
                int i14 = fVar.f79699b;
                boolean z13 = fVar.f79698a;
                Exception exc2 = (Exception) vVar.f52656c;
                if (exc2 != null) {
                    throw exc2;
                }
                options.inMutable = false;
                nVar.getClass();
                Context context = nVar.f95352a;
                y8.f fVar2 = nVar.f95354c;
                options.inPremultiplied = nVar.f95358g;
                Bitmap.Config config = nVar.f95353b;
                if ((z13 || i14 > 0) && (config == null || config == Bitmap.Config.HARDWARE)) {
                    config = Bitmap.Config.ARGB_8888;
                }
                if (nVar.f95357f && config == Bitmap.Config.ARGB_8888 && Intrinsics.b(options.outMimeType, "image/jpeg")) {
                    config = Bitmap.Config.RGB_565;
                }
                Bitmap.Config config2 = options.outConfig;
                Bitmap.Config config3 = Bitmap.Config.RGBA_F16;
                if (config2 == config3 && config != Bitmap.Config.HARDWARE) {
                    config = config3;
                }
                options.inPreferredConfig = config;
                mk.v vVarA = kVar.a();
                if ((vVarA instanceof o8.l) && Intrinsics.b(fVar2, y8.f.f96844c)) {
                    options.inSampleSize = 1;
                    options.inScaled = true;
                    options.inDensity = ((o8.l) vVarA).f79710d;
                    options.inTargetDensity = context.getResources().getDisplayMetrics().densityDpi;
                    z11 = z13;
                } else {
                    int i15 = options.outWidth;
                    if (i15 <= 0 || (i5 = options.outHeight) <= 0) {
                        z11 = z13;
                        options.inSampleSize = 1;
                        options.inScaled = false;
                    } else {
                        int i16 = (i14 == 90 || i14 == 270) ? i5 : i15;
                        if (i14 != 90 && i14 != 270) {
                            i15 = i5;
                        }
                        int i17 = nVar.f95355d;
                        y8.f fVar3 = y8.f.f96844c;
                        int iE6 = Intrinsics.b(fVar2, fVar3) ? i16 : c9.g.e(fVar2.f96845a, i17);
                        int iE7 = Intrinsics.b(fVar2, fVar3) ? i15 : c9.g.e(fVar2.f96846b, i17);
                        int iHighestOneBit = Integer.highestOneBit(i16 / iE6);
                        int iHighestOneBit2 = Integer.highestOneBit(i15 / iE7);
                        z11 = z13;
                        int iF2 = b.c0.F(i17);
                        if (iF2 == 0) {
                            iMin = Math.min(iHighestOneBit, iHighestOneBit2);
                        } else {
                            if (iF2 != 1) {
                                throw new NoWhenBranchMatchedException();
                            }
                            iMin = Math.max(iHighestOneBit, iHighestOneBit2);
                        }
                        if (iMin < 1) {
                            iMin = 1;
                        }
                        options.inSampleSize = iMin;
                        double d5 = iMin;
                        double d11 = iE6 / (i16 / d5);
                        double d12 = iE7 / (i15 / d5);
                        int iF3 = b.c0.F(i17);
                        if (iF3 == 0) {
                            dMax = Math.max(d11, d12);
                        } else {
                            if (iF3 != 1) {
                                throw new NoWhenBranchMatchedException();
                            }
                            dMax = Math.min(d11, d12);
                        }
                        if (nVar.f95356e && dMax > 1.0d) {
                            dMax = 1.0d;
                        }
                        boolean z14 = dMax == 1.0d;
                        options.inScaled = !z14;
                        if (!z14) {
                            if (dMax > 1.0d) {
                                options.inDensity = MathKt.a(LayoutNode.NotPlacedPlaceOrder / dMax);
                                options.inTargetDensity = LayoutNode.NotPlacedPlaceOrder;
                            } else {
                                options.inDensity = LayoutNode.NotPlacedPlaceOrder;
                                options.inTargetDensity = MathKt.a(LayoutNode.NotPlacedPlaceOrder * dMax);
                            }
                        }
                    }
                }
                try {
                    Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(new a60.b(d0VarR, 5), null, options);
                    d0VarR.close();
                    Exception exc3 = (Exception) vVar.f52656c;
                    if (exc3 != null) {
                        throw exc3;
                    }
                    if (bitmapDecodeStream == null) {
                        throw new IllegalStateException("BitmapFactory returned a null bitmap. Often this means BitmapFactory could not decode the image data read from the input source (e.g. network, disk, or memory) as it's not encoded as a valid image format.");
                    }
                    bitmapDecodeStream.setDensity(context.getResources().getDisplayMetrics().densityDpi);
                    if (z11 || i14 > 0) {
                        Matrix matrix = new Matrix();
                        float width = bitmapDecodeStream.getWidth() / 2.0f;
                        float height = bitmapDecodeStream.getHeight() / 2.0f;
                        if (z11) {
                            matrix.postScale(-1.0f, 1.0f, width, height);
                        }
                        if (i14 > 0) {
                            matrix.postRotate(i14, width, height);
                        }
                        RectF rectF = new RectF(0.0f, 0.0f, bitmapDecodeStream.getWidth(), bitmapDecodeStream.getHeight());
                        matrix.mapRect(rectF);
                        float f11 = rectF.left;
                        if (f11 != 0.0f || rectF.top != 0.0f) {
                            matrix.postTranslate(-f11, -rectF.top);
                        }
                        if (i14 == 90 || i14 == 270) {
                            int height2 = bitmapDecodeStream.getHeight();
                            int width2 = bitmapDecodeStream.getWidth();
                            Bitmap.Config config4 = bitmapDecodeStream.getConfig();
                            if (config4 == null) {
                                config4 = Bitmap.Config.ARGB_8888;
                            }
                            bitmapCreateBitmap = Bitmap.createBitmap(height2, width2, config4);
                            Intrinsics.f(bitmapCreateBitmap, "createBitmap(width, height, config)");
                        } else {
                            int width3 = bitmapDecodeStream.getWidth();
                            int height3 = bitmapDecodeStream.getHeight();
                            Bitmap.Config config5 = bitmapDecodeStream.getConfig();
                            if (config5 == null) {
                                config5 = Bitmap.Config.ARGB_8888;
                            }
                            bitmapCreateBitmap = Bitmap.createBitmap(width3, height3, config5);
                            Intrinsics.f(bitmapCreateBitmap, "createBitmap(width, height, config)");
                        }
                        new Canvas(bitmapCreateBitmap).drawBitmap(bitmapDecodeStream, matrix, o8.h.f79702a);
                        bitmapDecodeStream.recycle();
                        bitmapDecodeStream = bitmapCreateBitmap;
                    }
                    return new o8.e(new BitmapDrawable(context.getResources(), bitmapDecodeStream), options.inSampleSize > 1 || options.inScaled);
                } finally {
                }
            case 21:
                p6.t tVar = (p6.t) this.f19240k;
                return new p6.m0(tVar.f82252a, tVar.f82271v);
            case 22:
                Object obj = t5.h0.f88596e;
                File file = (File) this.f19240k;
                synchronized (obj) {
                    t5.h0.f88595d.remove(file.getAbsolutePath());
                }
                return Unit.f71706a;
            case 23:
                ((t70.a1) this.f19240k).dispose();
                return Unit.f71706a;
            case 24:
                return new t7.d[((w70.m[]) this.f19240k).length];
            default:
                z2.f0 f0Var = (z2.f0) this.f19240k;
                if (!((Boolean) ((p1.s2) f0Var.f98057g).getValue()).booleanValue() && (d2Var = f0Var.f98053c) != null) {
                    ((p1.z) d2Var).o();
                }
                return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c1(l1.i2 i2Var, c3 c3Var) {
        super(0);
        this.f19239j = 15;
        this.f19240k = i2Var;
    }
}
