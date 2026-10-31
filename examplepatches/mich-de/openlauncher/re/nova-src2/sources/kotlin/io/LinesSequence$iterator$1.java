package kotlin.io;

import a5.d1;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0010(\n\u0002\u0010\u000e\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"kotlin/io/LinesSequence$iterator$1", b.f42142b, b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class LinesSequence$iterator$1 implements Iterator<String>, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public String f71831a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f71832b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ d1 f71833c;

    public LinesSequence$iterator$1(d1 d1Var) {
        this.f71833c = d1Var;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() throws IOException {
        if (this.f71831a == null && !this.f71832b) {
            String line = ((BufferedReader) this.f71833c.f271b).readLine();
            this.f71831a = line;
            if (line == null) {
                this.f71832b = true;
            }
        }
        return this.f71831a != null;
    }

    @Override // java.util.Iterator
    public final String next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        String str = this.f71831a;
        this.f71831a = null;
        Intrinsics.d(str);
        return str;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
