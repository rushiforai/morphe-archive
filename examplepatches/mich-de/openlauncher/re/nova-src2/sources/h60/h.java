package h60;

import android.os.Trace;
import b.c0;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import kl.j0;

/* loaded from: classes4.dex */
public final class h implements g, j {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f59486a;

    public h(int i5) {
        switch (i5) {
            case 1:
                this.f59486a = new HashMap();
                break;
            case 2:
                this.f59486a = new HashMap(3);
                break;
            case 3:
                this.f59486a = new HashMap();
                break;
            case 4:
            default:
                this.f59486a = new HashMap(3);
                break;
            case 5:
                this.f59486a = new HashMap(3);
                break;
        }
    }

    public static int[] c(String str) {
        try {
            if (str.isEmpty()) {
                throw new IllegalArgumentException("Version string is empty");
            }
            StringTokenizer stringTokenizer = new StringTokenizer(str, ".");
            int iCountTokens = stringTokenizer.countTokens();
            int[] iArr = new int[iCountTokens];
            for (int i5 = 0; i5 < iCountTokens; i5++) {
                iArr[i5] = Integer.parseInt(stringTokenizer.nextToken());
            }
            return iArr;
        } catch (RuntimeException e3) {
            throw new IllegalArgumentException(c0.l("Unable to parse HTTP flags version string: `", str, "`"), e3);
        }
    }

    public static h e(r90.e eVar, String str, String str2, boolean z11) {
        p90.a.a("Cronet ResolvedFlags#resolve");
        try {
            int[] iArrC = c(str2);
            HashMap map = new HashMap();
            for (Map.Entry entry : eVar.e().entrySet()) {
                try {
                    r90.g gVarA = r90.g.a((r90.b) entry.getValue(), str, iArrC, z11);
                    if (gVarA != null) {
                        map.put((String) entry.getKey(), gVarA);
                    }
                } catch (RuntimeException e3) {
                    throw new IllegalArgumentException("Unable to resolve HTTP flag `" + ((String) entry.getKey()) + "`", e3);
                }
            }
            h hVar = new h(map);
            Trace.endSection();
            return hVar;
        } catch (Throwable th2) {
            try {
                Trace.endSection();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public j0 a() {
        return new j0(this.f59486a);
    }

    public h b(Class cls, k kVar) {
        this.f59486a.put(cls, kVar);
        return this;
    }

    public void d(tl.a aVar, Object obj) throws GeneralSecurityException {
        List list;
        byte[] bArr = aVar.f89442a;
        if (bArr.length != 0 && bArr.length != 5) {
            throw new GeneralSecurityException("PrefixMap only supports 0 and 5 byte prefixes");
        }
        HashMap map = this.f59486a;
        if (map.containsKey(aVar)) {
            list = (List) map.get(aVar);
        } else {
            ArrayList arrayList = new ArrayList();
            map.put(aVar, arrayList);
            list = arrayList;
        }
        list.add(obj);
    }

    public h f(Class cls, j60.a aVar) {
        this.f59486a.put(cls, aVar);
        return this;
    }

    public h(HashMap map) {
        this.f59486a = map;
    }
}
