package a5;

import android.view.ViewGroup;
import java.util.Iterator;
import kotlin.sequences.Sequence;

/* loaded from: classes.dex */
public final class b1 implements Sequence {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ViewGroup f260a;

    public b1(ViewGroup viewGroup) {
        this.f260a = viewGroup;
    }

    @Override // kotlin.sequences.Sequence
    public final Iterator iterator() {
        return new c1(this.f260a);
    }
}
