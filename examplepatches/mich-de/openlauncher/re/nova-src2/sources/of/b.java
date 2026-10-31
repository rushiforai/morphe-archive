package of;

import android.text.TextUtils;
import vk.b0;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final int f80346a;

    /* renamed from: b, reason: collision with root package name */
    public final int f80347b;

    /* renamed from: c, reason: collision with root package name */
    public final int f80348c;

    /* renamed from: d, reason: collision with root package name */
    public final int f80349d;

    /* renamed from: e, reason: collision with root package name */
    public final int f80350e;

    public b(int i5, int i11, int i12, int i13, int i14) {
        this.f80346a = i5;
        this.f80347b = i11;
        this.f80348c = i12;
        this.f80349d = i13;
        this.f80350e = i14;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0032  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static b a(String str) {
        wf.a.e(str.startsWith("Format:"));
        String[] strArrSplit = TextUtils.split(str.substring(7), ",");
        int i5 = -1;
        int i11 = -1;
        int i12 = -1;
        int i13 = -1;
        for (int i14 = 0; i14 < strArrSplit.length; i14++) {
            String strS = b0.s(strArrSplit[i14].trim());
            strS.getClass();
            switch (strS) {
                case "end":
                    i11 = i14;
                    break;
                case "text":
                    i13 = i14;
                    break;
                case "start":
                    i5 = i14;
                    break;
                case "style":
                    i12 = i14;
                    break;
            }
        }
        if (i5 == -1 || i11 == -1 || i13 == -1) {
            return null;
        }
        return new b(i5, i11, i12, i13, strArrSplit.length);
    }
}
