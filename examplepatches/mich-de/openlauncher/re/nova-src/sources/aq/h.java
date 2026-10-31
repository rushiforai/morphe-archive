package aq;

import java.lang.reflect.Constructor;
import java.lang.reflect.Executable;
import java.lang.reflect.Method;

/* loaded from: classes4.dex */
public final class h extends m0 {

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ int f15466k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Class f15467l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Executable f15468m;

    public /* synthetic */ h(Executable executable, Class cls, int i5) {
        this.f15466k = i5;
        this.f15468m = executable;
        this.f15467l = cls;
    }

    @Override // aq.m0
    public final Object e() {
        switch (this.f15466k) {
            case 0:
                return ((Constructor) this.f15468m).newInstance(null);
            default:
                return ((Method) this.f15468m).invoke(null, this.f15467l, Object.class);
        }
    }

    public final String toString() {
        switch (this.f15466k) {
        }
        return this.f15467l.getName();
    }
}
