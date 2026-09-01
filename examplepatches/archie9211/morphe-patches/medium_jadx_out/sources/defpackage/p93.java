package defpackage;

import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class p93 extends er7 {
    public final /* synthetic */ int d;
    public final /* synthetic */ AbstractCollection e;

    public /* synthetic */ p93(AbstractCollection abstractCollection, int i) {
        this.d = i;
        this.e = abstractCollection;
    }

    @Override // defpackage.er7
    public final void u(f41 f41Var) {
        int i = this.d;
        AbstractCollection abstractCollection = this.e;
        switch (i) {
            case 0:
                f41Var.getClass();
                cx8.r(f41Var, null);
                ((ArrayList) abstractCollection).add(f41Var);
                return;
            default:
                if (f41Var == null) {
                    throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", "fakeOverride", "kotlin/reflect/jvm/internal/impl/descriptors/impl/EnumEntrySyntheticClassDescriptor$EnumEntryScope$4", "addFakeOverride"));
                }
                cx8.r(f41Var, null);
                ((LinkedHashSet) abstractCollection).add(f41Var);
                return;
        }
    }

    @Override // defpackage.er7
    public final void v(f41 f41Var, f41 f41Var2) {
        switch (this.d) {
            case 0:
                if (f41Var2 instanceof u55) {
                    u55 u55Var = (u55) f41Var2;
                    Map linkedHashMap = u55Var.D;
                    if (linkedHashMap == null) {
                        linkedHashMap = new LinkedHashMap();
                        u55Var.D = linkedHashMap;
                    }
                    linkedHashMap.put(v93.a, f41Var);
                }
                break;
        }
    }

    private final void P(f41 f41Var, f41 f41Var2) {
    }
}
