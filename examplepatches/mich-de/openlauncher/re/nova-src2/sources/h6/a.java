package h6;

import android.os.Bundle;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes2.dex */
public abstract class a extends l1 implements j1 {

    @Nullable
    private Bundle defaultArgs;

    @Nullable
    private u lifecycle;

    @Nullable
    private a7.e savedStateRegistry;

    public a(a7.h owner) {
        Intrinsics.g(owner, "owner");
        this.savedStateRegistry = owner.getSavedStateRegistry();
        this.lifecycle = owner.getLifecycle();
        this.defaultArgs = null;
    }

    @Override // h6.j1
    @NotNull
    public <T extends f1> T create(@NotNull Class<T> modelClass, @NotNull k6.c extras) throws NoSuchMethodException, SecurityException {
        Intrinsics.g(modelClass, "modelClass");
        Intrinsics.g(extras, "extras");
        String str = (String) extras.a(m1.f59408b);
        if (str == null) {
            throw new IllegalStateException("VIEW_MODEL_KEY must always be provided by ViewModelProvider");
        }
        a7.e eVar = this.savedStateRegistry;
        if (eVar == null) {
            return (T) create(str, modelClass, y0.a(extras));
        }
        Intrinsics.d(eVar);
        u uVar = this.lifecycle;
        Intrinsics.d(uVar);
        w0 w0VarC = g1.c(eVar, uVar, str, this.defaultArgs);
        T t6 = (T) create(str, modelClass, w0VarC.f59465b);
        t6.addCloseable("androidx.lifecycle.savedstate.vm.tag", w0VarC);
        return t6;
    }

    public abstract f1 create(String str, Class cls, u0 u0Var);

    @Override // h6.l1
    public void onRequery(@NotNull f1 viewModel) {
        Intrinsics.g(viewModel, "viewModel");
        a7.e eVar = this.savedStateRegistry;
        if (eVar != null) {
            u uVar = this.lifecycle;
            Intrinsics.d(uVar);
            g1.a(viewModel, eVar, uVar);
        }
    }

    @Override // h6.j1
    @NotNull
    public <T extends f1> T create(@NotNull Class<T> modelClass) throws NoSuchMethodException, SecurityException {
        Intrinsics.g(modelClass, "modelClass");
        String canonicalName = modelClass.getCanonicalName();
        if (canonicalName != null) {
            if (this.lifecycle != null) {
                a7.e eVar = this.savedStateRegistry;
                Intrinsics.d(eVar);
                u uVar = this.lifecycle;
                Intrinsics.d(uVar);
                w0 w0VarC = g1.c(eVar, uVar, canonicalName, this.defaultArgs);
                T t6 = (T) create(canonicalName, modelClass, w0VarC.f59465b);
                t6.addCloseable("androidx.lifecycle.savedstate.vm.tag", w0VarC);
                return t6;
            }
            throw new UnsupportedOperationException("AbstractSavedStateViewModelFactory constructed with empty constructor supports only calls to create(modelClass: Class<T>, extras: CreationExtras).");
        }
        throw new IllegalArgumentException("Local and anonymous classes can not be ViewModels");
    }
}
