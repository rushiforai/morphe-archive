package q70;

import java.util.Iterator;
import kotlin.collections.EmptyIterator;
import kotlin.sequences.DropTakeSequence;
import kotlin.sequences.Sequence;

/* loaded from: classes5.dex */
public final class a implements Sequence, DropTakeSequence {

    /* renamed from: a, reason: collision with root package name */
    public static final a f83782a = new a();

    @Override // kotlin.sequences.DropTakeSequence
    public final /* bridge */ /* synthetic */ Sequence a(int i5) {
        return f83782a;
    }

    @Override // kotlin.sequences.Sequence
    public final Iterator iterator() {
        return EmptyIterator.f71732a;
    }

    @Override // kotlin.sequences.DropTakeSequence
    public final /* bridge */ /* synthetic */ Sequence take() {
        return f83782a;
    }
}
