package defpackage;

import java.lang.reflect.Constructor;
import java.lang.reflect.Member;
import java.lang.reflect.TypeVariable;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t0b extends y0b implements x96 {
    public final Constructor a;

    public t0b(Constructor constructor) {
        this.a = constructor;
    }

    @Override // defpackage.y0b
    public final Member b() {
        return this.a;
    }

    @Override // defpackage.x96
    public final ArrayList getTypeParameters() {
        TypeVariable[] typeParameters = this.a.getTypeParameters();
        typeParameters.getClass();
        ArrayList arrayList = new ArrayList(typeParameters.length);
        for (TypeVariable typeVariable : typeParameters) {
            arrayList.add(new e1b(typeVariable));
        }
        return arrayList;
    }
}
