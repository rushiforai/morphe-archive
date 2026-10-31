package kotlin.sequences;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010(\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001¨\u0006\u0002"}, d2 = {"kotlin/sequences/GeneratorSequence$iterator$1", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class GeneratorSequence$iterator$1 implements Iterator<Object>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public Object f71964a;

    /* renamed from: b, reason: collision with root package name */
    public int f71965b = -2;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ q70.b f71966c;

    public GeneratorSequence$iterator$1(q70.b bVar) {
        this.f71966c = bVar;
    }

    public final void a() {
        Object objInvoke;
        int i5 = this.f71965b;
        q70.b bVar = this.f71966c;
        if (i5 == -2) {
            objInvoke = bVar.f83783a.invoke();
        } else {
            Function1 function1 = bVar.f83784b;
            Object obj = this.f71964a;
            Intrinsics.d(obj);
            objInvoke = function1.invoke(obj);
        }
        this.f71964a = objInvoke;
        this.f71965b = objInvoke == null ? 0 : 1;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        if (this.f71965b < 0) {
            a();
        }
        return this.f71965b == 1;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (this.f71965b < 0) {
            a();
        }
        if (this.f71965b == 0) {
            throw new NoSuchElementException();
        }
        Object obj = this.f71964a;
        Intrinsics.e(obj, "null cannot be cast to non-null type T of kotlin.sequences.GeneratorSequence");
        this.f71965b = -1;
        return obj;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
