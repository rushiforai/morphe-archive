package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rb8 extends vb8 {
    public final Class s;

    public rb8(Class cls) {
        super(0, cls);
        if (cls.isEnum()) {
            this.s = cls;
        } else {
            rd6.f(cls, " is not an Enum type.");
            throw null;
        }
    }

    @Override // defpackage.vb8, defpackage.wb8
    public final String b() {
        return this.s.getName();
    }

    @Override // defpackage.vb8
    /* JADX INFO: renamed from: h, reason: merged with bridge method [inline-methods] */
    public final Enum c(String str) {
        Object obj;
        str.getClass();
        Class cls = this.s;
        Object[] enumConstants = cls.getEnumConstants();
        enumConstants.getClass();
        int length = enumConstants.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                obj = null;
                break;
            }
            obj = enumConstants[i];
            if (tuc.G(((Enum) obj).name(), str, true)) {
                break;
            }
            i++;
        }
        Enum r3 = (Enum) obj;
        if (r3 != null) {
            return r3;
        }
        StringBuilder sbU = lv8.u("Enum value ", str, " not found for type ");
        sbU.append(cls.getName());
        sbU.append('.');
        throw new IllegalArgumentException(sbU.toString());
    }
}
