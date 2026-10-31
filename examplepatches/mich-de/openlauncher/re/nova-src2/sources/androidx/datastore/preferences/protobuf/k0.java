package androidx.datastore.preferences.protobuf;

/* loaded from: classes.dex */
public final class k0 {

    /* renamed from: a, reason: collision with root package name */
    public final i50.c f14346a;

    public k0(v1 v1Var, v1 v1Var2, x5.i iVar) {
        this.f14346a = new i50.c(3, v1Var, v1Var2, iVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0104  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x010d  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0135  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x013d  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0145  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0152  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x015e  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0178  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0185  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x018e  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x01a4  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01aa  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x01b0  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x01b6  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x01c2  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01cd  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01d8  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x01df  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int a(i50.c cVar, Object obj, Object obj2) {
        int iJ0;
        int size;
        int iI0;
        v1 v1Var;
        int size2;
        int iI02;
        v1 v1Var2 = (v1) cVar.f61379b;
        int i5 = s.f14394c;
        int iJ02 = 1;
        int iH0 = m.h0(1);
        s1 s1Var = v1.f14408d;
        if (v1Var2 == s1Var) {
            iH0 *= 2;
        }
        switch (v1Var2.ordinal()) {
            case 0:
                ((Double) obj).getClass();
                iJ0 = 8;
                int i11 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH02 = m.h0(2);
                if (v1Var == s1Var) {
                    iH02 *= 2;
                }
                switch (v1Var.ordinal()) {
                    case 0:
                        ((Double) obj2).getClass();
                        iJ02 = 8;
                        return iJ02 + iH02 + i11;
                    case 1:
                        ((Float) obj2).getClass();
                        iJ02 = 4;
                        return iJ02 + iH02 + i11;
                    case 2:
                        iJ02 = m.j0(((Long) obj2).longValue());
                        return iJ02 + iH02 + i11;
                    case 3:
                        iJ02 = m.j0(((Long) obj2).longValue());
                        return iJ02 + iH02 + i11;
                    case 4:
                        iJ02 = m.j0(((Integer) obj2).intValue());
                        return iJ02 + iH02 + i11;
                    case 5:
                        ((Long) obj2).getClass();
                        iJ02 = 8;
                        return iJ02 + iH02 + i11;
                    case 6:
                        ((Integer) obj2).getClass();
                        iJ02 = 4;
                        return iJ02 + iH02 + i11;
                    case 7:
                        ((Boolean) obj2).getClass();
                        return iJ02 + iH02 + i11;
                    case 8:
                        if (!(obj2 instanceof h)) {
                            iJ02 = m.g0((String) obj2);
                            return iJ02 + iH02 + i11;
                        }
                        size2 = ((h) obj2).size();
                        iI02 = m.i0(size2);
                        iJ02 = iI02 + size2;
                        return iJ02 + iH02 + i11;
                    case 9:
                        iJ02 = ((y) ((a) obj2)).a(null);
                        return iJ02 + iH02 + i11;
                    case 10:
                        size2 = ((y) ((a) obj2)).a(null);
                        iI02 = m.i0(size2);
                        iJ02 = iI02 + size2;
                        return iJ02 + iH02 + i11;
                    case 11:
                        if (obj2 instanceof h) {
                            size2 = ((h) obj2).size();
                            iI02 = m.i0(size2);
                        } else {
                            size2 = ((byte[]) obj2).length;
                            iI02 = m.i0(size2);
                        }
                        iJ02 = iI02 + size2;
                        return iJ02 + iH02 + i11;
                    case 12:
                        iJ02 = m.i0(((Integer) obj2).intValue());
                        return iJ02 + iH02 + i11;
                    case 13:
                        iJ02 = m.j0(((Integer) obj2).intValue());
                        return iJ02 + iH02 + i11;
                    case 14:
                        ((Integer) obj2).getClass();
                        iJ02 = 4;
                        return iJ02 + iH02 + i11;
                    case 15:
                        ((Long) obj2).getClass();
                        iJ02 = 8;
                        return iJ02 + iH02 + i11;
                    case 16:
                        int iIntValue = ((Integer) obj2).intValue();
                        iJ02 = m.i0((iIntValue >> 31) ^ (iIntValue << 1));
                        return iJ02 + iH02 + i11;
                    case 17:
                        long jLongValue = ((Long) obj2).longValue();
                        iJ02 = m.j0((jLongValue >> 63) ^ (jLongValue << 1));
                        return iJ02 + iH02 + i11;
                    default:
                        throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
                }
            case 1:
                ((Float) obj).getClass();
                iJ0 = 4;
                int i112 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH022 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 2:
                iJ0 = m.j0(((Long) obj).longValue());
                int i1122 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH0222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 3:
                iJ0 = m.j0(((Long) obj).longValue());
                int i11222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH02222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 4:
                iJ0 = m.j0(((Integer) obj).intValue());
                int i112222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH022222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 5:
                ((Long) obj).getClass();
                iJ0 = 8;
                int i1122222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH0222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 6:
                ((Integer) obj).getClass();
                iJ0 = 4;
                int i11222222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH02222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 7:
                ((Boolean) obj).getClass();
                iJ0 = 1;
                int i112222222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH022222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 8:
                if (obj instanceof h) {
                    size = ((h) obj).size();
                    iI0 = m.i0(size);
                    iJ0 = size + iI0;
                    int i1122222222 = iJ0 + iH0;
                    v1Var = (v1) cVar.f61380c;
                    int iH0222222222 = m.h0(2);
                    if (v1Var == s1Var) {
                    }
                    switch (v1Var.ordinal()) {
                    }
                } else {
                    iJ0 = m.g0((String) obj);
                    int i11222222222 = iJ0 + iH0;
                    v1Var = (v1) cVar.f61380c;
                    int iH02222222222 = m.h0(2);
                    if (v1Var == s1Var) {
                    }
                    switch (v1Var.ordinal()) {
                    }
                }
            case 9:
                iJ0 = ((y) ((a) obj)).a(null);
                int i112222222222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH022222222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 10:
                size = ((y) ((a) obj)).a(null);
                iI0 = m.i0(size);
                iJ0 = size + iI0;
                int i1122222222222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH0222222222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 11:
                if (obj instanceof h) {
                    size = ((h) obj).size();
                    iI0 = m.i0(size);
                } else {
                    size = ((byte[]) obj).length;
                    iI0 = m.i0(size);
                }
                iJ0 = size + iI0;
                int i11222222222222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH02222222222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 12:
                iJ0 = m.i0(((Integer) obj).intValue());
                int i112222222222222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH022222222222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 13:
                iJ0 = m.j0(((Integer) obj).intValue());
                int i1122222222222222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH0222222222222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 14:
                ((Integer) obj).getClass();
                iJ0 = 4;
                int i11222222222222222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH02222222222222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 15:
                ((Long) obj).getClass();
                iJ0 = 8;
                int i112222222222222222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH022222222222222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 16:
                int iIntValue2 = ((Integer) obj).intValue();
                iJ0 = m.i0((iIntValue2 >> 31) ^ (iIntValue2 << 1));
                int i1122222222222222222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH0222222222222222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            case 17:
                long jLongValue2 = ((Long) obj).longValue();
                iJ0 = m.j0((jLongValue2 >> 63) ^ (jLongValue2 << 1));
                int i11222222222222222222 = iJ0 + iH0;
                v1Var = (v1) cVar.f61380c;
                int iH02222222222222222222 = m.h0(2);
                if (v1Var == s1Var) {
                }
                switch (v1Var.ordinal()) {
                }
            default:
                throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
        }
    }
}
