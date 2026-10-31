package h6;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class o implements a7.c {
    public final void a(a7.h hVar) throws NoSuchMethodException, SecurityException {
        if (!(hVar instanceof o1)) {
            throw new IllegalStateException(("Internal error: OnRecreation should be registered only on components that implement ViewModelStoreOwner. Received owner: " + hVar).toString());
        }
        n1 viewModelStore = ((o1) hVar).getViewModelStore();
        a7.e savedStateRegistry = hVar.getSavedStateRegistry();
        viewModelStore.getClass();
        LinkedHashMap linkedHashMap = viewModelStore.f59410a;
        Iterator it = new HashSet(linkedHashMap.keySet()).iterator();
        while (it.hasNext()) {
            String key = (String) it.next();
            Intrinsics.g(key, "key");
            f1 f1Var = (f1) linkedHashMap.get(key);
            if (f1Var != null) {
                g1.a(f1Var, savedStateRegistry, hVar.getLifecycle());
            }
        }
        if (new HashSet(linkedHashMap.keySet()).isEmpty()) {
            return;
        }
        savedStateRegistry.c();
    }
}
