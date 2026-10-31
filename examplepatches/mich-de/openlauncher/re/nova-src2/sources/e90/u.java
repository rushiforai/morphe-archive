package e90;

import androidx.compose.ui.node.LayoutNode;
import com.google.android.gms.internal.measurement.k2;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgression;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import m90.d0;

/* loaded from: classes.dex */
public final class u implements Closeable {

    /* renamed from: d, reason: collision with root package name */
    public static final Logger f52383d;

    /* renamed from: a, reason: collision with root package name */
    public final m90.i f52384a;

    /* renamed from: b, reason: collision with root package name */
    public final t f52385b;

    /* renamed from: c, reason: collision with root package name */
    public final b f52386c;

    static {
        Logger logger = Logger.getLogger(e.class.getName());
        Intrinsics.f(logger, "getLogger(Http2::class.java.name)");
        f52383d = logger;
    }

    public u(d0 source) {
        Intrinsics.g(source, "source");
        this.f52384a = source;
        t tVar = new t(source);
        this.f52385b = tVar;
        this.f52386c = new b(tVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:143:0x023a, code lost:
    
        throw new java.io.IOException(b.c0.h(r15, "PROTOCOL_ERROR SETTINGS_MAX_FRAME_SIZE: "));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(boolean z11, k kVar) throws IOException {
        int i5;
        int i11;
        Object[] array;
        try {
            this.f52384a.m(9L);
            int iR = y80.c.r(this.f52384a);
            if (iR > 16384) {
                throw new IOException(b.c0.h(iR, "FRAME_SIZE_ERROR: "));
            }
            int i12 = this.f52384a.readByte() & 255;
            byte b11 = this.f52384a.readByte();
            int i13 = b11 & 255;
            int i14 = this.f52384a.readInt();
            int i15 = i14 & LayoutNode.NotPlacedPlaceOrder;
            Logger logger = f52383d;
            if (logger.isLoggable(Level.FINE)) {
                logger.fine(e.a(i15, iR, i12, i13, true));
            }
            if (z11 && i12 != 4) {
                StringBuilder sb2 = new StringBuilder("Expected a SETTINGS frame but was ");
                String[] strArr = e.f52314b;
                sb2.append(i12 < strArr.length ? strArr[i12] : y80.c.g("0x%02x", Integer.valueOf(i12)));
                throw new IOException(sb2.toString());
            }
            int i16 = 3;
            switch (i12) {
                case 0:
                    b(kVar, iR, i13, i15);
                    return true;
                case 1:
                    d(kVar, iR, i13, i15);
                    return true;
                case 2:
                    if (iR != 5) {
                        throw new IOException(b.c0.i(iR, "TYPE_PRIORITY length: ", " != 5"));
                    }
                    if (i15 == 0) {
                        throw new IOException("TYPE_PRIORITY streamId == 0");
                    }
                    m90.i iVar = this.f52384a;
                    iVar.readInt();
                    iVar.readByte();
                    return true;
                case 3:
                    if (iR != 4) {
                        throw new IOException(b.c0.i(iR, "TYPE_RST_STREAM length: ", " != 4"));
                    }
                    if (i15 == 0) {
                        throw new IOException("TYPE_RST_STREAM streamId == 0");
                    }
                    int i17 = this.f52384a.readInt();
                    int[] iArr_values = k2._values();
                    int length = iArr_values.length;
                    int i18 = 0;
                    while (true) {
                        if (i18 < length) {
                            int i19 = iArr_values[i18];
                            if (b.c0.F(i19) == i17) {
                                i5 = i19;
                            } else {
                                i18++;
                            }
                        } else {
                            i5 = 0;
                        }
                    }
                    if (i5 == 0) {
                        throw new IOException(b.c0.h(i17, "TYPE_RST_STREAM unexpected error code: "));
                    }
                    q qVar = kVar.f52327b;
                    if (i15 != 0 && (i14 & 1) == 0) {
                        i = 1;
                    }
                    if (i == 0) {
                        y yVarC = qVar.c(i15);
                        if (yVarC == null) {
                            return true;
                        }
                        yVarC.j(i5);
                        return true;
                    }
                    qVar.f52354i.c(new n(qVar.f52348c + AbstractJsonLexerKt.BEGIN_LIST + i15 + "] onReset", qVar, i15, i5, 0), 0L);
                    return true;
                case 4:
                    m90.i iVar2 = this.f52384a;
                    if (i15 != 0) {
                        throw new IOException("TYPE_SETTINGS streamId != 0");
                    }
                    if ((b11 & 1) == 0) {
                        if (iR % 6 != 0) {
                            throw new IOException(b.c0.h(iR, "TYPE_SETTINGS length % 6 != 0: "));
                        }
                        c0 c0Var = new c0();
                        IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, iR), 6);
                        int i21 = intProgressionL0.f71906a;
                        int i22 = intProgressionL0.f71907b;
                        int i23 = intProgressionL0.f71908c;
                        if ((i23 > 0 && i21 <= i22) || (i23 < 0 && i22 <= i21)) {
                            while (true) {
                                short s11 = iVar2.readShort();
                                byte[] bArr = y80.c.f96853a;
                                int i24 = s11 & 65535;
                                int i25 = iVar2.readInt();
                                if (i24 != 2) {
                                    if (i24 == i16) {
                                        i24 = 4;
                                    } else if (i24 != 4) {
                                        if (i24 == 5 && (i25 < 16384 || i25 > 16777215)) {
                                            break;
                                        }
                                    } else {
                                        if (i25 < 0) {
                                            throw new IOException("PROTOCOL_ERROR SETTINGS_INITIAL_WINDOW_SIZE > 2^31 - 1");
                                        }
                                        i24 = 7;
                                    }
                                } else if (i25 != 0 && i25 != 1) {
                                    throw new IOException("PROTOCOL_ERROR SETTINGS_ENABLE_PUSH != 0 or 1");
                                }
                                c0Var.c(i24, i25);
                                if (i21 != i22) {
                                    i21 += i23;
                                    i16 = 3;
                                }
                            }
                        }
                        q qVar2 = kVar.f52327b;
                        qVar2.f52353h.c(new j(b.c0.q(new StringBuilder(), qVar2.f52348c, " applyAndAckSettings"), kVar, c0Var), 0L);
                        return true;
                    }
                    if (iR != 0) {
                        throw new IOException("FRAME_SIZE_ERROR ack frame should be empty!");
                    }
                    break;
                case 5:
                    e(kVar, iR, i13, i15);
                    return true;
                case 6:
                    if (iR != 8) {
                        throw new IOException(b.c0.h(iR, "TYPE_PING length != 8: "));
                    }
                    if (i15 != 0) {
                        throw new IOException("TYPE_PING streamId != 0");
                    }
                    int i26 = this.f52384a.readInt();
                    int i27 = this.f52384a.readInt();
                    if (((b11 & 1) != 0 ? 1 : 0) == 0) {
                        kVar.f52327b.f52353h.c(new i(b.c0.q(new StringBuilder(), kVar.f52327b.f52348c, " ping"), kVar.f52327b, i26, i27), 0L);
                        return true;
                    }
                    q qVar3 = kVar.f52327b;
                    synchronized (qVar3) {
                        try {
                            if (i26 == 1) {
                                qVar3.f52357l++;
                            } else if (i26 != 2) {
                                if (i26 == 3) {
                                    qVar3.notifyAll();
                                }
                                Unit unit = Unit.f71706a;
                            } else {
                                qVar3.n++;
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    return true;
                case 7:
                    if (iR < 8) {
                        throw new IOException(b.c0.h(iR, "TYPE_GOAWAY length < 8: "));
                    }
                    if (i15 != 0) {
                        throw new IOException("TYPE_GOAWAY streamId != 0");
                    }
                    int i28 = this.f52384a.readInt();
                    int i29 = this.f52384a.readInt();
                    int i31 = iR - 8;
                    int[] iArr_values2 = k2._values();
                    int length2 = iArr_values2.length;
                    int i32 = 0;
                    while (true) {
                        if (i32 < length2) {
                            i11 = iArr_values2[i32];
                            if (b.c0.F(i11) != i29) {
                                i32++;
                            }
                        } else {
                            i11 = 0;
                        }
                    }
                    if (i11 == 0) {
                        throw new IOException(b.c0.h(i29, "TYPE_GOAWAY unexpected error code: "));
                    }
                    m90.j debugData = m90.j.f76130d;
                    if (i31 > 0) {
                        debugData = this.f52384a.H(i31);
                    }
                    Intrinsics.g(debugData, "debugData");
                    debugData.c();
                    q qVar4 = kVar.f52327b;
                    synchronized (qVar4) {
                        array = qVar4.f52347b.values().toArray(new y[0]);
                        qVar4.f52351f = true;
                        Unit unit2 = Unit.f71706a;
                    }
                    y[] yVarArr = (y[]) array;
                    int length3 = yVarArr.length;
                    while (i < length3) {
                        y yVar = yVarArr[i];
                        if (yVar.f52398a > i28 && yVar.g()) {
                            yVar.j(8);
                            kVar.f52327b.c(yVar.f52398a);
                        }
                        i++;
                    }
                    break;
                    break;
                case 8:
                    if (iR != 4) {
                        throw new IOException(b.c0.h(iR, "TYPE_WINDOW_UPDATE length !=4: "));
                    }
                    long j11 = this.f52384a.readInt() & 2147483647L;
                    if (j11 == 0) {
                        throw new IOException("windowSizeIncrement was 0");
                    }
                    if (i15 == 0) {
                        q qVar5 = kVar.f52327b;
                        synchronized (qVar5) {
                            qVar5.f52364u += j11;
                            qVar5.notifyAll();
                            Unit unit3 = Unit.f71706a;
                        }
                        return true;
                    }
                    y yVarB = kVar.f52327b.b(i15);
                    if (yVarB != null) {
                        synchronized (yVarB) {
                            yVarB.f52403f += j11;
                            if (j11 > 0) {
                                yVarB.notifyAll();
                            }
                            Unit unit4 = Unit.f71706a;
                        }
                        return true;
                    }
                    break;
                default:
                    this.f52384a.skip(iR);
                    return true;
            }
            return true;
        } catch (EOFException unused) {
            return false;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:64:0x010d, code lost:
    
        if (r8 == false) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x010f, code lost:
    
        r4.i(y80.c.f96854b, true);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(k kVar, int i5, int i11, int i12) throws IOException {
        int i13;
        boolean z11;
        long j11;
        boolean z12;
        if (i12 == 0) {
            throw new IOException("PROTOCOL_ERROR: TYPE_DATA streamId == 0");
        }
        boolean z13 = (i11 & 1) != 0;
        if ((i11 & 32) != 0) {
            throw new IOException("PROTOCOL_ERROR: FLAG_COMPRESSED without SETTINGS_COMPRESS_DATA");
        }
        if ((i11 & 8) != 0) {
            byte b11 = this.f52384a.readByte();
            byte[] bArr = y80.c.f96853a;
            i13 = b11 & 255;
        } else {
            i13 = 0;
        }
        int iA = s.a(i5, i11, i13);
        m90.i source = this.f52384a;
        Intrinsics.g(source, "source");
        q qVar = kVar.f52327b;
        long j12 = 0;
        if (i12 == 0 || (i12 & 1) != 0) {
            y yVarB = qVar.b(i12);
            if (yVarB != null) {
                byte[] bArr2 = y80.c.f96853a;
                w wVar = yVarB.f52406i;
                long j13 = iA;
                wVar.getClass();
                long j14 = j13;
                while (true) {
                    if (j14 <= j12) {
                        y yVar = wVar.f52396f;
                        byte[] bArr3 = y80.c.f96853a;
                        yVar.f52399b.e(j13);
                        break;
                    }
                    synchronized (wVar.f52396f) {
                        z11 = wVar.f52392b;
                        j11 = j12;
                        z12 = wVar.f52394d.f76126b + j14 > wVar.f52391a;
                        Unit unit = Unit.f71706a;
                    }
                    if (z12) {
                        source.skip(j14);
                        wVar.f52396f.e(4);
                        break;
                    }
                    if (z11) {
                        source.skip(j14);
                        break;
                    }
                    long j15 = source.read(wVar.f52393c, j14);
                    if (j15 == -1) {
                        throw new EOFException();
                    }
                    j14 -= j15;
                    y yVar2 = wVar.f52396f;
                    synchronized (yVar2) {
                        try {
                            if (wVar.f52395e) {
                                wVar.f52393c.a();
                            } else {
                                m90.g gVar = wVar.f52394d;
                                boolean z14 = gVar.f76126b == j11;
                                gVar.I(wVar.f52393c);
                                if (z14) {
                                    yVar2.notifyAll();
                                }
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                    j12 = j11;
                }
            } else {
                kVar.f52327b.h(i12, 2);
                long j16 = iA;
                kVar.f52327b.e(j16);
                source.skip(j16);
            }
        } else {
            m90.g gVar2 = new m90.g();
            long j17 = iA;
            source.m(j17);
            source.read(gVar2, j17);
            qVar.f52354i.c(new l(qVar.f52348c + AbstractJsonLexerKt.BEGIN_LIST + i12 + "] onData", qVar, i12, gVar2, iA, z13), 0L);
        }
        this.f52384a.skip(i13);
    }

    public final List c(int i5, int i11, int i12, int i13) throws IOException {
        t tVar = this.f52385b;
        tVar.f52381e = i5;
        tVar.f52378b = i5;
        tVar.f52382f = i11;
        tVar.f52379c = i12;
        tVar.f52380d = i13;
        b bVar = this.f52386c;
        d0 d0Var = bVar.f52295c;
        ArrayList arrayList = bVar.f52294b;
        while (!d0Var.N()) {
            byte b11 = d0Var.readByte();
            byte[] bArr = y80.c.f96853a;
            int i14 = b11 & 255;
            if (i14 == 128) {
                throw new IOException("index == 0");
            }
            if ((b11 & 128) == 128) {
                int iE = bVar.e(i14, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                int i15 = iE - 1;
                if (i15 >= 0) {
                    a[] aVarArr = d.f52311a;
                    if (i15 <= aVarArr.length - 1) {
                        arrayList.add(aVarArr[i15]);
                    }
                }
                int length = bVar.f52297e + 1 + (i15 - d.f52311a.length);
                if (length >= 0) {
                    a[] aVarArr2 = bVar.f52296d;
                    if (length < aVarArr2.length) {
                        a aVar = aVarArr2[length];
                        Intrinsics.d(aVar);
                        arrayList.add(aVar);
                    }
                }
                throw new IOException(b.c0.h(iE, "Header index too large "));
            }
            if (i14 == 64) {
                a[] aVarArr3 = d.f52311a;
                m90.j jVarD = bVar.d();
                d.a(jVarD);
                bVar.c(new a(jVarD, bVar.d()));
            } else if ((b11 & 64) == 64) {
                bVar.c(new a(bVar.b(bVar.e(i14, 63) - 1), bVar.d()));
            } else if ((b11 & 32) == 32) {
                int iE2 = bVar.e(i14, 31);
                bVar.f52293a = iE2;
                if (iE2 < 0 || iE2 > 4096) {
                    throw new IOException("Invalid dynamic table size update " + bVar.f52293a);
                }
                int i16 = bVar.f52299g;
                if (iE2 < i16) {
                    if (iE2 == 0) {
                        a[] aVarArr4 = bVar.f52296d;
                        u90.b.B(0, aVarArr4.length, null, aVarArr4);
                        bVar.f52297e = bVar.f52296d.length - 1;
                        bVar.f52298f = 0;
                        bVar.f52299g = 0;
                    } else {
                        bVar.a(i16 - iE2);
                    }
                }
            } else if (i14 == 16 || i14 == 0) {
                a[] aVarArr5 = d.f52311a;
                m90.j jVarD2 = bVar.d();
                d.a(jVarD2);
                arrayList.add(new a(jVarD2, bVar.d()));
            } else {
                arrayList.add(new a(bVar.b(bVar.e(i14, 15) - 1), bVar.d()));
            }
        }
        List listI1 = b70.g.I1(arrayList);
        arrayList.clear();
        return listI1;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.f52384a.close();
    }

    public final void d(k kVar, int i5, int i11, int i12) throws IOException {
        if (i12 == 0) {
            throw new IOException("PROTOCOL_ERROR: TYPE_HEADERS streamId == 0");
        }
        int i13 = 0;
        int i14 = 1;
        boolean z11 = (i11 & 1) != 0;
        if ((i11 & 8) != 0) {
            byte b11 = this.f52384a.readByte();
            byte[] bArr = y80.c.f96853a;
            i13 = b11 & 255;
        }
        if ((i11 & 32) != 0) {
            m90.i iVar = this.f52384a;
            iVar.readInt();
            iVar.readByte();
            byte[] bArr2 = y80.c.f96853a;
            i5 -= 5;
        }
        List headerBlock = c(s.a(i5, i11, i13), i13, i11, i12);
        Intrinsics.g(headerBlock, "headerBlock");
        q qVar = kVar.f52327b;
        if (i12 != 0 && (i12 & 1) == 0) {
            qVar.f52354i.c(new m(qVar.f52348c + AbstractJsonLexerKt.BEGIN_LIST + i12 + "] onHeaders", qVar, i12, headerBlock, z11), 0L);
            return;
        }
        synchronized (qVar) {
            y yVarB = qVar.b(i12);
            if (yVarB != null) {
                Unit unit = Unit.f71706a;
                yVarB.i(y80.c.t(headerBlock), z11);
                return;
            }
            if (qVar.f52351f) {
                return;
            }
            if (i12 <= qVar.f52349d) {
                return;
            }
            if (i12 % 2 == qVar.f52350e % 2) {
                return;
            }
            y yVar = new y(i12, qVar, false, z11, y80.c.t(headerBlock));
            qVar.f52349d = i12;
            qVar.f52347b.put(Integer.valueOf(i12), yVar);
            qVar.f52352g.e().c(new h(qVar.f52348c + AbstractJsonLexerKt.BEGIN_LIST + i12 + "] onStream", qVar, yVar, i14), 0L);
        }
    }

    public final void e(k kVar, int i5, int i11, int i12) throws IOException {
        int i13;
        if (i12 == 0) {
            throw new IOException("PROTOCOL_ERROR: TYPE_PUSH_PROMISE streamId == 0");
        }
        if ((i11 & 8) != 0) {
            byte b11 = this.f52384a.readByte();
            byte[] bArr = y80.c.f96853a;
            i13 = b11 & 255;
        } else {
            i13 = 0;
        }
        int i14 = this.f52384a.readInt() & LayoutNode.NotPlacedPlaceOrder;
        List requestHeaders = c(s.a(i5 - 4, i11, i13), i13, i11, i12);
        Intrinsics.g(requestHeaders, "requestHeaders");
        q qVar = kVar.f52327b;
        synchronized (qVar) {
            if (qVar.f52368y.contains(Integer.valueOf(i14))) {
                qVar.h(i14, 2);
                return;
            }
            qVar.f52368y.add(Integer.valueOf(i14));
            qVar.f52354i.c(new m(qVar.f52348c + AbstractJsonLexerKt.BEGIN_LIST + i14 + "] onRequest", qVar, i14, requestHeaders), 0L);
        }
    }
}
