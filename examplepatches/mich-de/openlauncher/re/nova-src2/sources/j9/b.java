package j9;

import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    public byte[] f69160b;

    /* renamed from: d, reason: collision with root package name */
    public final ByteOrder f69162d;

    /* renamed from: a, reason: collision with root package name */
    public final i[] f69159a = new i[5];

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f69161c = new ArrayList();

    public b(ByteOrder byteOrder) {
        this.f69162d = byteOrder;
    }

    public final boolean equals(Object obj) {
        if (this != obj) {
            if (obj != null && (obj instanceof b)) {
                b bVar = (b) obj;
                ArrayList arrayList = bVar.f69161c;
                if (bVar.f69162d == this.f69162d) {
                    int size = arrayList.size();
                    ArrayList arrayList2 = this.f69161c;
                    if (size == arrayList2.size() && Arrays.equals(bVar.f69160b, this.f69160b)) {
                        int i5 = 0;
                        while (true) {
                            if (i5 >= arrayList2.size()) {
                                int i11 = 0;
                                while (i11 < 5) {
                                    Charset charset = h.f69257h;
                                    i iVar = (i11 == 0 || i11 == 1 || i11 == 2 || i11 == 3 || i11 == 4) ? bVar.f69159a[i11] : null;
                                    i iVar2 = (i11 == 0 || i11 == 1 || i11 == 2 || i11 == 3 || i11 == 4) ? this.f69159a[i11] : null;
                                    if (iVar == iVar2 || iVar == null || iVar.equals(iVar2)) {
                                        i11++;
                                    }
                                }
                            } else {
                                if (!Arrays.equals((byte[]) arrayList.get(i5), (byte[]) arrayList2.get(i5))) {
                                    break;
                                }
                                i5++;
                            }
                        }
                    }
                }
            }
            return false;
        }
        return true;
    }
}
