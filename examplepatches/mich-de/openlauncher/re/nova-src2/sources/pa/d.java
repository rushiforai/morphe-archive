package pa;

import android.view.View;
import com.android.launcher3.secondarydisplay.SecondaryDisplayLauncher;
import com.android.launcher3.util.ComponentKey;
import java.util.HashSet;
import java.util.Objects;
import java.util.function.Function;
import ka.t;

/* loaded from: classes2.dex */
public final class d extends t {

    /* renamed from: w, reason: collision with root package name */
    public final boolean f82480w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ e f82481x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, SecondaryDisplayLauncher secondaryDisplayLauncher, ga.e eVar2, boolean z11) {
        super(z11 ? 2131231784 : 2131231693, z11 ? 2132019387 : 2132017206, secondaryDisplayLauncher, eVar2);
        this.f82481x = eVar;
        this.f82480w = z11;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        boolean z11 = this.f82480w;
        ga.e eVar = this.f71307u;
        e eVar2 = this.f82481x;
        if (z11) {
            final HashSet hashSet = eVar2.f82488g;
            Objects.requireNonNull(hashSet);
            final int i5 = 0;
            e.a(eVar2, eVar, new Function() { // from class: pa.c
                @Override // java.util.function.Function
                public final Object apply(Object obj) {
                    boolean zRemove;
                    switch (i5) {
                        case 0:
                            zRemove = hashSet.remove((ComponentKey) obj);
                            break;
                        default:
                            zRemove = hashSet.add((ComponentKey) obj);
                            break;
                    }
                    return Boolean.valueOf(zRemove);
                }
            });
        } else {
            final HashSet hashSet2 = eVar2.f82488g;
            Objects.requireNonNull(hashSet2);
            final int i11 = 1;
            e.a(eVar2, eVar, new Function() { // from class: pa.c
                @Override // java.util.function.Function
                public final Object apply(Object obj) {
                    boolean zRemove;
                    switch (i11) {
                        case 0:
                            zRemove = hashSet2.remove((ComponentKey) obj);
                            break;
                        default:
                            zRemove = hashSet2.add((ComponentKey) obj);
                            break;
                    }
                    return Boolean.valueOf(zRemove);
                }
            });
        }
        o9.a.L(eVar2.f82482a, true);
    }
}
