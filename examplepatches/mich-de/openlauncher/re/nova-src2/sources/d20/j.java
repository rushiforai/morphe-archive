package d20;

import android.content.Context;
import java.util.LinkedHashSet;

/* loaded from: classes4.dex */
public final class j extends ab.o {
    public final a D;

    public j(Context context, a aVar) {
        super(context);
        this.D = aVar;
        setExecutor(null);
    }

    @Override // ab.o, android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        a aVar = this.D;
        aVar.f48876c.add(this);
        if (aVar.f48877d) {
            return;
        }
        aVar.startListening();
    }

    @Override // ab.o, android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        a aVar = this.D;
        LinkedHashSet linkedHashSet = aVar.f48876c;
        linkedHashSet.remove(this);
        if (linkedHashSet.isEmpty()) {
            aVar.stopListening();
        }
    }
}
