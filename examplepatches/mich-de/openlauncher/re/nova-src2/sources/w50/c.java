package w50;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: e, reason: collision with root package name */
    public static final ArrayList f93774e = new ArrayList();

    /* renamed from: a, reason: collision with root package name */
    public final g f93775a;

    /* renamed from: b, reason: collision with root package name */
    public final v30.e f93776b;

    /* renamed from: c, reason: collision with root package name */
    public List f93777c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f93778d;

    public c(g phase, v30.e eVar) {
        Intrinsics.g(phase, "phase");
        ArrayList arrayList = f93774e;
        Intrinsics.e(arrayList, "null cannot be cast to non-null type kotlin.collections.MutableList<@[ExtensionFunctionType] kotlin.coroutines.SuspendFunction2<io.ktor.util.pipeline.PipelineContext<TSubject of io.ktor.util.pipeline.PhaseContent, Call of io.ktor.util.pipeline.PhaseContent>, TSubject of io.ktor.util.pipeline.PhaseContent, kotlin.Unit>>");
        List interceptors = TypeIntrinsics.b(arrayList);
        Intrinsics.g(interceptors, "interceptors");
        this.f93775a = phase;
        this.f93776b = eVar;
        this.f93777c = interceptors;
        this.f93778d = true;
        if (!arrayList.isEmpty()) {
            throw new IllegalStateException("The shared empty array list has been modified");
        }
    }

    public final String toString() {
        return "Phase `" + this.f93775a.f93786b + "`, " + this.f93777c.size() + " handlers";
    }
}
