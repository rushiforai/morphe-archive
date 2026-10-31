package z2;

import java.util.Map;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class w implements s0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f98165a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f98166b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Map f98167c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function1 f98168d;

    public w(int i5, int i11, Map map, Function1 function1) {
        this.f98165a = i5;
        this.f98166b = i11;
        this.f98167c = map;
        this.f98168d = function1;
    }

    @Override // z2.s0
    public final Map a() {
        return this.f98167c;
    }

    @Override // z2.s0
    public final void b() {
    }

    @Override // z2.s0
    public final Function1 c() {
        return this.f98168d;
    }

    @Override // z2.s0
    public final int getHeight() {
        return this.f98166b;
    }

    @Override // z2.s0
    public final int getWidth() {
        return this.f98165a;
    }
}
