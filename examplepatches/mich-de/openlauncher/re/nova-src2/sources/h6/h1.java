package h6;

import kotlin.Lazy;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.reflect.KClass;

/* loaded from: classes2.dex */
public final class h1 implements Lazy {

    /* renamed from: a, reason: collision with root package name */
    public final KClass f59372a;

    /* renamed from: b, reason: collision with root package name */
    public final Lambda f59373b;

    /* renamed from: c, reason: collision with root package name */
    public final Function0 f59374c;

    /* renamed from: d, reason: collision with root package name */
    public final Lambda f59375d;

    /* renamed from: e, reason: collision with root package name */
    public f1 f59376e;

    /* JADX WARN: Multi-variable type inference failed */
    public h1(KClass viewModelClass, Function0 function0, Function0 function02, Function0 function03) {
        Intrinsics.g(viewModelClass, "viewModelClass");
        this.f59372a = viewModelClass;
        this.f59373b = (Lambda) function0;
        this.f59374c = function02;
        this.f59375d = (Lambda) function03;
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.Lambda] */
    /* JADX WARN: Type inference failed for: r2v0, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.Lambda] */
    @Override // kotlin.Lazy
    public final Object getValue() {
        f1 f1Var = this.f59376e;
        if (f1Var != null) {
            return f1Var;
        }
        n1 store = (n1) this.f59373b.invoke();
        j1 factory = (j1) this.f59374c.invoke();
        k6.c extras = (k6.c) this.f59375d.invoke();
        Intrinsics.g(store, "store");
        Intrinsics.g(factory, "factory");
        Intrinsics.g(extras, "extras");
        x7.n nVar = new x7.n(store, factory, extras);
        KClass modelClass = this.f59372a;
        Intrinsics.g(modelClass, "modelClass");
        String strU = android.support.v4.media.session.b.U(modelClass);
        if (strU == null) {
            throw new IllegalArgumentException("Local and anonymous classes can not be ViewModels");
        }
        f1 f1VarM = nVar.m(modelClass, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(strU));
        this.f59376e = f1VarM;
        return f1VarM;
    }

    @Override // kotlin.Lazy
    public final boolean isInitialized() {
        return this.f59376e != null;
    }
}
