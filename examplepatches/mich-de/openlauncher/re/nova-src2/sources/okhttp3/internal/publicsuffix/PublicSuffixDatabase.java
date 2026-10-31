package okhttp3.internal.publicsuffix;

import b6.e;
import b70.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import g90.m;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.net.IDN;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.sequences.Sequence;
import kotlin.sequences.SequencesKt;
import m90.d0;
import m90.r;
import r70.k;
import x7.f;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lokhttp3/internal/publicsuffix/PublicSuffixDatabase;", b.f42142b, "<init>", "()V", "b6/e", "okhttp"}, k = 1, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class PublicSuffixDatabase {

    /* renamed from: e, reason: collision with root package name */
    public static final byte[] f80492e = {42};

    /* renamed from: f, reason: collision with root package name */
    public static final List f80493f = ul.b.P("*");

    /* renamed from: g, reason: collision with root package name */
    public static final PublicSuffixDatabase f80494g = new PublicSuffixDatabase();

    /* renamed from: a, reason: collision with root package name */
    public final AtomicBoolean f80495a = new AtomicBoolean(false);

    /* renamed from: b, reason: collision with root package name */
    public final CountDownLatch f80496b = new CountDownLatch(1);

    /* renamed from: c, reason: collision with root package name */
    public byte[] f80497c;

    /* renamed from: d, reason: collision with root package name */
    public byte[] f80498d;

    public static List c(String str) {
        List listH1 = k.h1(str, new char[]{'.'}, 6);
        return Intrinsics.b(g.h1(listH1), b.f42142b) ? g.R0(listH1) : listH1;
    }

    public final String a(String str) throws InterruptedException {
        String strC;
        String strC2;
        String strC3;
        List listH1;
        int size;
        int size2;
        String unicodeDomain = IDN.toUnicode(str);
        Intrinsics.f(unicodeDomain, "unicodeDomain");
        List listC = c(unicodeDomain);
        int i5 = 0;
        if (this.f80495a.get() || !this.f80495a.compareAndSet(false, true)) {
            try {
                this.f80496b.await();
            } catch (InterruptedException unused) {
                Thread.currentThread().interrupt();
            }
        } else {
            boolean z11 = false;
            while (true) {
                try {
                    try {
                        b();
                        break;
                    } catch (InterruptedIOException unused2) {
                        Thread.interrupted();
                        z11 = true;
                    } catch (IOException e3) {
                        m mVar = m.f57276a;
                        m.f57276a.getClass();
                        m.i(5, "Failed to read public suffix list", e3);
                        if (z11) {
                        }
                    }
                } finally {
                    if (z11) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }
        if (this.f80497c == null) {
            throw new IllegalStateException("Unable to load publicsuffixes.gz resource from the classpath.");
        }
        int size3 = listC.size();
        byte[][] bArr = new byte[size3][];
        for (int i11 = 0; i11 < size3; i11++) {
            String str2 = (String) listC.get(i11);
            Charset UTF_8 = StandardCharsets.UTF_8;
            Intrinsics.f(UTF_8, "UTF_8");
            byte[] bytes = str2.getBytes(UTF_8);
            Intrinsics.f(bytes, "this as java.lang.String).getBytes(charset)");
            bArr[i11] = bytes;
        }
        int i12 = 0;
        while (true) {
            if (i12 >= size3) {
                strC = null;
                break;
            }
            byte[] bArr2 = this.f80497c;
            if (bArr2 == null) {
                Intrinsics.m("publicSuffixListBytes");
                throw null;
            }
            strC = e.c(bArr2, bArr, i12);
            if (strC != null) {
                break;
            }
            i12++;
        }
        if (size3 > 1) {
            byte[][] bArr3 = (byte[][]) bArr.clone();
            int length = bArr3.length - 1;
            for (int i13 = 0; i13 < length; i13++) {
                bArr3[i13] = f80492e;
                byte[] bArr4 = this.f80497c;
                if (bArr4 == null) {
                    Intrinsics.m("publicSuffixListBytes");
                    throw null;
                }
                strC2 = e.c(bArr4, bArr3, i13);
                if (strC2 != null) {
                    break;
                }
            }
            strC2 = null;
        } else {
            strC2 = null;
        }
        if (strC2 != null) {
            int i14 = size3 - 1;
            for (int i15 = 0; i15 < i14; i15++) {
                byte[] bArr5 = this.f80498d;
                if (bArr5 == null) {
                    Intrinsics.m("publicSuffixExceptionListBytes");
                    throw null;
                }
                strC3 = e.c(bArr5, bArr, i15);
                if (strC3 != null) {
                    break;
                }
            }
            strC3 = null;
        } else {
            strC3 = null;
        }
        if (strC3 != null) {
            listH1 = k.h1("!".concat(strC3), new char[]{'.'}, 6);
        } else if (strC == null && strC2 == null) {
            listH1 = f80493f;
        } else {
            List listH12 = strC != null ? k.h1(strC, new char[]{'.'}, 6) : EmptyList.f71733a;
            listH1 = strC2 != null ? k.h1(strC2, new char[]{'.'}, 6) : EmptyList.f71733a;
            if (listH12.size() > listH1.size()) {
                listH1 = listH12;
            }
        }
        if (listC.size() == listH1.size() && ((String) listH1.get(0)).charAt(0) != '!') {
            return null;
        }
        if (((String) listH1.get(0)).charAt(0) == '!') {
            size = listC.size();
            size2 = listH1.size();
        } else {
            size = listC.size();
            size2 = listH1.size() + 1;
        }
        Sequence sequenceS0 = SequencesKt.s0(g.M0(c(str)), size - size2);
        StringBuilder sb2 = new StringBuilder();
        sb2.append((CharSequence) b.f42142b);
        for (Object obj : sequenceS0) {
            i5++;
            if (i5 > 1) {
                sb2.append((CharSequence) ".");
            }
            bh.g.B(sb2, obj, null);
        }
        sb2.append((CharSequence) b.f42142b);
        return sb2.toString();
    }

    public final void b() {
        try {
            Ref.ObjectRef objectRef = new Ref.ObjectRef();
            Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
            InputStream resourceAsStream = PublicSuffixDatabase.class.getResourceAsStream("publicsuffixes.gz");
            if (resourceAsStream != null) {
                d0 d0VarR = f.r(new r(f.V(resourceAsStream)));
                try {
                    long j11 = d0VarR.readInt();
                    d0VarR.m(j11);
                    objectRef.f71863a = d0VarR.f76105b.D(j11);
                    long j12 = d0VarR.readInt();
                    d0VarR.m(j12);
                    objectRef2.f71863a = d0VarR.f76105b.D(j12);
                    Unit unit = Unit.f71706a;
                    d0VarR.close();
                    synchronized (this) {
                        Object obj = objectRef.f71863a;
                        Intrinsics.d(obj);
                        this.f80497c = (byte[]) obj;
                        Object obj2 = objectRef2.f71863a;
                        Intrinsics.d(obj2);
                        this.f80498d = (byte[]) obj2;
                    }
                } finally {
                }
            }
        } finally {
            this.f80496b.countDown();
        }
    }
}
