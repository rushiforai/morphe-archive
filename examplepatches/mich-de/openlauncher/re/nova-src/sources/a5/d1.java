package a5;

import android.view.ViewGroup;
import c3.g3;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.io.LinesSequence$iterator$1;
import kotlin.sequences.Sequence;

/* loaded from: classes2.dex */
public final class d1 implements Sequence {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f270a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f271b;

    public /* synthetic */ d1(Object obj, int i5) {
        this.f270a = i5;
        this.f271b = obj;
    }

    public void b(String str, Object obj) {
        ((ArrayList) this.f271b).add(new g3(str, obj));
    }

    @Override // kotlin.sequences.Sequence
    public final Iterator iterator() {
        switch (this.f270a) {
            case 0:
                return new j0(new c1((ViewGroup) this.f271b));
            case 1:
                return ((ArrayList) this.f271b).iterator();
            default:
                return new LinesSequence$iterator$1(this);
        }
    }

    public d1() {
        this.f270a = 1;
        this.f271b = new ArrayList();
    }
}
