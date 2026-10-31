package o50;

import java.io.IOException;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: k, reason: collision with root package name */
    public static final f0 f79529k = ab.e0.i("http://localhost");

    /* renamed from: a, reason: collision with root package name */
    public String f79530a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f79531b;

    /* renamed from: c, reason: collision with root package name */
    public int f79532c;

    /* renamed from: d, reason: collision with root package name */
    public c0 f79533d;

    /* renamed from: e, reason: collision with root package name */
    public String f79534e;

    /* renamed from: f, reason: collision with root package name */
    public String f79535f;

    /* renamed from: g, reason: collision with root package name */
    public String f79536g;

    /* renamed from: h, reason: collision with root package name */
    public List f79537h;

    /* renamed from: i, reason: collision with root package name */
    public x f79538i;

    /* renamed from: j, reason: collision with root package name */
    public aa.h f79539j;

    public a0() throws CharacterCodingException {
        EmptyList<String> pathSegments = EmptyList.f71733a;
        w.f79608b.getClass();
        Intrinsics.g(pathSegments, "pathSegments");
        this.f79530a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f79531b = false;
        this.f79532c = 0;
        this.f79533d = null;
        this.f79534e = null;
        this.f79535f = null;
        Set set = a.f79524a;
        Charset charset = Charsets.f72000b;
        Intrinsics.g(charset, "charset");
        StringBuilder sb2 = new StringBuilder();
        CharsetEncoder charsetEncoderNewEncoder = charset.newEncoder();
        Intrinsics.f(charsetEncoderNewEncoder, "newEncoder(...)");
        a.f(w20.e.i(charsetEncoderNewEncoder, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, 0, 0), new b00.t(sb2, 28));
        this.f79536g = sb2.toString();
        ArrayList arrayList = new ArrayList(b70.c.u0(pathSegments, 10));
        for (String str : pathSegments) {
            Intrinsics.g(str, "<this>");
            StringBuilder sb3 = new StringBuilder();
            Charset charset2 = Charsets.f72000b;
            int i5 = 0;
            while (i5 < str.length()) {
                char cCharAt = str.charAt(i5);
                if (a.f79525b.contains(Character.valueOf(cCharAt)) || a.f79527d.contains(Character.valueOf(cCharAt))) {
                    sb3.append(cCharAt);
                    i5++;
                } else {
                    int i11 = (55296 > cCharAt || cCharAt >= 57344) ? 1 : 2;
                    CharsetEncoder charsetEncoderNewEncoder2 = charset2.newEncoder();
                    Intrinsics.f(charsetEncoderNewEncoder2, "newEncoder(...)");
                    int i12 = i11 + i5;
                    e80.a aVarI = w20.e.i(charsetEncoderNewEncoder2, str, i5, i12);
                    while (!aVarI.N()) {
                        while (ps.k.h(aVarI)) {
                            sb3.append(a.g(aVarI.readByte()));
                            Unit unit = Unit.f71706a;
                        }
                    }
                    i5 = i12;
                }
            }
            arrayList.add(sb3.toString());
        }
        this.f79537h = arrayList;
        y yVar = new y();
        for (String name : EmptySet.f71734a) {
            Intrinsics.g(name, "name");
            EmptyList<String> emptyList = EmptyList.f71733a;
            String strE = a.e(name, false);
            ArrayList arrayList2 = new ArrayList(b70.c.u0(emptyList, 10));
            for (String str2 : emptyList) {
                Intrinsics.g(str2, "<this>");
                arrayList2.add(a.e(str2, true));
            }
            yVar.c(strE, arrayList2);
        }
        this.f79538i = yVar;
        this.f79539j = new aa.h(yVar);
    }

    public final void a() {
        if (this.f79530a.length() <= 0 && !Intrinsics.b(c().f79547a, "file")) {
            f0 f0Var = f79529k;
            this.f79530a = f0Var.f79556a;
            if (this.f79533d == null) {
                this.f79533d = f0Var.f79562g;
            }
            if (this.f79532c == 0) {
                e(f0Var.f79557b);
            }
        }
    }

    public final f0 b() throws IOException {
        a();
        c0 c0Var = this.f79533d;
        String str = this.f79530a;
        int i5 = this.f79532c;
        List list = this.f79537h;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(a.c((String) it.next()));
        }
        w wVarJ = bh.g.J((x) this.f79539j.f593b);
        String strD = a.d(0, 0, 15, this.f79536g);
        String str2 = this.f79534e;
        String strC = str2 != null ? a.c(str2) : null;
        String str3 = this.f79535f;
        String strC2 = str3 != null ? a.c(str3) : null;
        boolean z11 = this.f79531b;
        a();
        StringBuilder sb2 = new StringBuilder(256);
        x7.f.m(this, sb2);
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return new f0(c0Var, str, i5, arrayList, wVarJ, strD, strC, strC2, z11, string);
    }

    public final c0 c() {
        c0 c0Var = this.f79533d;
        if (c0Var != null) {
            return c0Var;
        }
        c0 c0Var2 = c0.f79545c;
        return c0.f79545c;
    }

    public final void d(List list) {
        Intrinsics.g(list, "<set-?>");
        this.f79537h = list;
    }

    public final void e(int i5) {
        if (i5 < 0 || i5 >= 65536) {
            throw new IllegalArgumentException(b.c0.h(i5, "Port must be between 0 and 65535, or 0 if not set. Provided: ").toString());
        }
        this.f79532c = i5;
    }

    public final String toString() throws IOException {
        StringBuilder sb2 = new StringBuilder(256);
        x7.f.m(this, sb2);
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
