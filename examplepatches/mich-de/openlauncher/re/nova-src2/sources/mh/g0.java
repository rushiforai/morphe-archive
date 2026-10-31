package mh;

import java.util.Comparator;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class g0 implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public static final g0 f76338a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ g0[] f76339b;

    static {
        g0 g0Var = new g0("INSTANCE", 0);
        f76338a = g0Var;
        f76339b = new g0[]{g0Var};
    }

    public static g0[] values() {
        return (g0[]) f76339b.clone();
    }

    @Override // java.util.Comparator
    public final /* bridge */ /* synthetic */ int compare(Object obj, Object obj2) {
        byte[] bArr = (byte[]) obj;
        byte[] bArr2 = (byte[]) obj2;
        int iMin = Math.min(bArr.length, bArr2.length);
        for (int i5 = 0; i5 < iMin; i5++) {
            int i11 = (bArr[i5] & 255) - (bArr2[i5] & 255);
            if (i11 != 0) {
                return i11;
            }
        }
        return bArr.length - bArr2.length;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "UnsignedBytes.lexicographicalComparator() (pure Java version)";
    }
}
