package b6;

import android.text.Editable;

/* loaded from: classes2.dex */
public final class a extends Editable.Factory {

    /* renamed from: a, reason: collision with root package name */
    public static final Object f17560a = new Object();

    /* renamed from: b, reason: collision with root package name */
    public static volatile a f17561b;

    /* renamed from: c, reason: collision with root package name */
    public static Class f17562c;

    @Override // android.text.Editable.Factory
    public final Editable newEditable(CharSequence charSequence) {
        Class cls = f17562c;
        return cls != null ? new a6.d(cls, charSequence) : super.newEditable(charSequence);
    }
}
