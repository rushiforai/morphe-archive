package ey;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class e implements u {

    /* renamed from: b, reason: collision with root package name */
    public final String f53150b;

    /* renamed from: c, reason: collision with root package name */
    public final y20.b f53151c;

    /* renamed from: d, reason: collision with root package name */
    public final Function0 f53152d;

    /* renamed from: e, reason: collision with root package name */
    public final x1.e f53153e = new x1.e(new d(this, 0), true, 1231831752);

    public e(String str, y20.b bVar, Function0 function0) {
        this.f53150b = str;
        this.f53151c = bVar;
        this.f53152d = function0;
    }

    @Override // ey.u
    public final Function0 a() {
        return this.f53152d;
    }

    @Override // ey.u
    public final Function1 b() {
        return null;
    }

    @Override // ey.u
    public final x1.e getIcon() {
        return this.f53153e;
    }

    @Override // ey.u
    public final x1.e getText() {
        return new x1.e(new d(this, 1), true, -1590661397);
    }

    @Override // ey.u
    public final String getTitle() {
        return this.f53150b;
    }
}
