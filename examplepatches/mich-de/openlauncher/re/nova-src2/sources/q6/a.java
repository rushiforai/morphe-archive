package q6;

import h6.f1;
import h6.u0;
import java.lang.ref.WeakReference;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes2.dex */
public final class a extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final UUID f83689a;

    /* renamed from: b, reason: collision with root package name */
    public WeakReference f83690b;

    public a(@NotNull u0 u0Var) {
        UUID uuidRandomUUID = (UUID) u0Var.a("SaveableStateHolder_BackStackEntryKey");
        if (uuidRandomUUID == null) {
            uuidRandomUUID = UUID.randomUUID();
            u0Var.d("SaveableStateHolder_BackStackEntryKey", uuidRandomUUID);
        }
        this.f83689a = uuidRandomUUID;
    }

    @Override // h6.f1
    public final void onCleared() {
        super.onCleared();
        WeakReference weakReference = this.f83690b;
        if (weakReference == null) {
            Intrinsics.m("saveableStateHolderRef");
            throw null;
        }
        y1.c cVar = (y1.c) weakReference.get();
        if (cVar != null) {
            cVar.b(this.f83689a);
        }
        WeakReference weakReference2 = this.f83690b;
        if (weakReference2 != null) {
            weakReference2.clear();
        } else {
            Intrinsics.m("saveableStateHolderRef");
            throw null;
        }
    }
}
