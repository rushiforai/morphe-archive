package h30;

import com.fyber.inneractive.sdk.external.NativeAdContent;
import io.sentry.e3;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: e, reason: collision with root package name */
    public static final i f59070e = new i(null, NativeAdContent.ViewTag.ROOT);

    /* renamed from: a, reason: collision with root package name */
    public final i f59071a;

    /* renamed from: b, reason: collision with root package name */
    public final String f59072b;

    /* renamed from: c, reason: collision with root package name */
    public WeakReference f59073c;

    /* renamed from: d, reason: collision with root package name */
    public e3 f59074d;

    public i(i iVar, String str) {
        this.f59071a = iVar;
        this.f59072b = str;
    }

    public static String[] c(String str) {
        int length = str.length();
        if (length == 0) {
            return new String[0];
        }
        if (str.charAt(0) != '/') {
            throw new RuntimeException("malformed path:".concat(str));
        }
        ArrayList arrayList = new ArrayList();
        int i5 = 1;
        while (i5 < length) {
            int i11 = 0;
            int i12 = i5;
            while (i12 < length) {
                char cCharAt = str.charAt(i12);
                if (cCharAt != '{') {
                    if (cCharAt != '}') {
                        if (i11 == 0 && cCharAt == '/') {
                            break;
                        }
                    } else {
                        i11--;
                    }
                } else {
                    i11++;
                }
                i12++;
            }
            if (i11 != 0) {
                throw new RuntimeException("unbalanced brace in path:".concat(str));
            }
            arrayList.add(str.substring(i5, i12));
            i5 = i12 + 1;
        }
        String[] strArr = new String[arrayList.size()];
        arrayList.toArray(strArr);
        return strArr;
    }

    public final i a(String str) {
        Object obj;
        synchronized (i.class) {
            try {
                e3 e3Var = this.f59074d;
                if (e3Var == null) {
                    this.f59074d = new e3(23, (byte) 0);
                } else {
                    synchronized (e3Var) {
                        ReferenceQueue referenceQueue = (ReferenceQueue) e3Var.f67209c;
                        for (j30.b bVar = (j30.b) referenceQueue.poll(); bVar != null; bVar = (j30.b) referenceQueue.poll()) {
                            ((HashMap) e3Var.f67208b).remove(bVar.f68880a);
                        }
                        j30.b bVar2 = (j30.b) ((HashMap) e3Var.f67208b).get(str);
                        obj = bVar2 == null ? null : bVar2.get();
                    }
                    i iVar = (i) obj;
                    if (iVar != null) {
                        return iVar;
                    }
                }
                i iVar2 = new i(this, str);
                e3 e3Var2 = this.f59074d;
                synchronized (e3Var2) {
                    ReferenceQueue referenceQueue2 = (ReferenceQueue) e3Var2.f67209c;
                    for (j30.b bVar3 = (j30.b) referenceQueue2.poll(); bVar3 != null; bVar3 = (j30.b) referenceQueue2.poll()) {
                        ((HashMap) e3Var2.f67208b).remove(bVar3.f68880a);
                    }
                    HashMap map = (HashMap) e3Var2.f67208b;
                    j30.b bVar4 = new j30.b(iVar2, (ReferenceQueue) e3Var2.f67209c);
                    bVar4.f68880a = str;
                    j30.b bVar5 = (j30.b) map.put(str, bVar4);
                    if (bVar5 != null) {
                        bVar5.get();
                    }
                }
                return iVar2;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final String[] b() {
        String[] strArr;
        synchronized (i.class) {
            int i5 = 0;
            for (i iVar = this; iVar != f59070e; iVar = iVar.f59071a) {
                try {
                    i5++;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            strArr = new String[i5];
            int i11 = i5 - 1;
            i iVar2 = this;
            while (iVar2 != f59070e) {
                strArr[i11] = iVar2.f59072b;
                iVar2 = iVar2.f59071a;
                i11--;
            }
        }
        return strArr;
    }

    public final String toString() {
        String string;
        synchronized (i.class) {
            try {
                StringBuilder sb2 = new StringBuilder();
                for (String str : b()) {
                    sb2.append("/");
                    sb2.append(str);
                }
                string = sb2.toString();
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return string;
    }
}
