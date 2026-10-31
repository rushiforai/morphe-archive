package cp;

import java.lang.reflect.Field;

/* loaded from: classes4.dex */
public enum a extends h {
    public a() {
        super("IDENTITY", 0);
    }

    @Override // cp.h
    public final String b(Field field) {
        return field.getName();
    }
}
