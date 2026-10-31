package x4;

import android.util.Base64;
import com.amplitude.core.events.Identify;
import java.util.List;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f95067a;

    /* renamed from: b, reason: collision with root package name */
    public final String f95068b;

    /* renamed from: c, reason: collision with root package name */
    public final String f95069c;

    /* renamed from: d, reason: collision with root package name */
    public final List f95070d;

    /* renamed from: e, reason: collision with root package name */
    public final String f95071e;

    public c(String str, String str2, List list, String str3) {
        this.f95067a = str;
        this.f95068b = str2;
        this.f95069c = str3;
        list.getClass();
        this.f95070d = list;
        this.f95071e = str + Identify.UNSET_VALUE + str2 + Identify.UNSET_VALUE + str3;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append("FontRequest {mProviderAuthority: " + this.f95067a + ", mProviderPackage: " + this.f95068b + ", mQuery: " + this.f95069c + ", mCertificates:");
        int i5 = 0;
        while (true) {
            List list = this.f95070d;
            if (i5 >= list.size()) {
                sb2.append("}mCertificatesArray: 0");
                return sb2.toString();
            }
            sb2.append(" [");
            List list2 = (List) list.get(i5);
            for (int i11 = 0; i11 < list2.size(); i11++) {
                sb2.append(" \"");
                sb2.append(Base64.encodeToString((byte[]) list2.get(i11), 0));
                sb2.append("\"");
            }
            sb2.append(" ]");
            i5++;
        }
    }
}
