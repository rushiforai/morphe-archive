package defpackage;

import java.lang.reflect.Field;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rf6 extends s42 {
    public final Field o;

    public rf6(Field field) {
        this.o = field;
    }

    @Override // defpackage.s42
    public final String I() {
        Field field = this.o;
        String name = field.getName();
        name.getClass();
        StringBuilder sb = new StringBuilder(ce6.a(name));
        sb.append("()");
        Class<?> type = field.getType();
        type.getClass();
        sb.append(e0b.b(type));
        return sb.toString();
    }
}
