package defpackage;

import android.text.Editable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dx3 extends Editable.Factory {
    public static final Object a = new Object();
    public static volatile dx3 b;
    public static Class c;

    @Override // android.text.Editable.Factory
    public final Editable newEditable(CharSequence charSequence) {
        Class cls = c;
        return cls != null ? new wkc(cls, charSequence) : super.newEditable(charSequence);
    }
}
