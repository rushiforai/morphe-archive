package kotlin.coroutines;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import e00.o3;
import h6.c1;
import java.io.Serializable;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@SinceKotlin
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00020\u00012\u00060\u0002j\u0002`\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/coroutines/CombinedContext;", "Lkotlin/coroutines/CoroutineContext;", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class CombinedContext implements CoroutineContext, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f71799a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext.Element f71800b;

    public CombinedContext(CoroutineContext.Element element, CoroutineContext left) {
        Intrinsics.g(left, "left");
        Intrinsics.g(element, "element");
        this.f71799a = left;
        this.f71800b = element;
    }

    public final boolean equals(Object obj) {
        boolean zB;
        if (this == obj) {
            return true;
        }
        if (obj instanceof CombinedContext) {
            CombinedContext combinedContext = (CombinedContext) obj;
            int i5 = 2;
            CombinedContext combinedContext2 = combinedContext;
            int i11 = 2;
            while (true) {
                CoroutineContext coroutineContext = combinedContext2.f71799a;
                combinedContext2 = coroutineContext instanceof CombinedContext ? (CombinedContext) coroutineContext : null;
                if (combinedContext2 == null) {
                    break;
                }
                i11++;
            }
            CombinedContext combinedContext3 = this;
            while (true) {
                CoroutineContext coroutineContext2 = combinedContext3.f71799a;
                combinedContext3 = coroutineContext2 instanceof CombinedContext ? (CombinedContext) coroutineContext2 : null;
                if (combinedContext3 == null) {
                    break;
                }
                i5++;
            }
            if (i11 == i5) {
                CombinedContext combinedContext4 = this;
                while (true) {
                    CoroutineContext.Element element = combinedContext4.f71800b;
                    if (!Intrinsics.b(combinedContext.get(element.getKey()), element)) {
                        zB = false;
                        break;
                    }
                    CoroutineContext coroutineContext3 = combinedContext4.f71799a;
                    if (!(coroutineContext3 instanceof CombinedContext)) {
                        Intrinsics.e(coroutineContext3, "null cannot be cast to non-null type kotlin.coroutines.CoroutineContext.Element");
                        CoroutineContext.Element element2 = (CoroutineContext.Element) coroutineContext3;
                        zB = Intrinsics.b(combinedContext.get(element2.getKey()), element2);
                        break;
                    }
                    combinedContext4 = (CombinedContext) coroutineContext3;
                }
                if (zB) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final Object fold(Object obj, Function2 function2) {
        return function2.invoke(this.f71799a.fold(obj, function2), this.f71800b);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext.Element get(CoroutineContext.Key key) {
        Intrinsics.g(key, "key");
        CombinedContext combinedContext = this;
        while (true) {
            CoroutineContext.Element element = combinedContext.f71800b.get(key);
            if (element != null) {
                return element;
            }
            CoroutineContext coroutineContext = combinedContext.f71799a;
            if (!(coroutineContext instanceof CombinedContext)) {
                return coroutineContext.get(key);
            }
            combinedContext = (CombinedContext) coroutineContext;
        }
    }

    public final int hashCode() {
        return this.f71800b.hashCode() + this.f71799a.hashCode();
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext minusKey(CoroutineContext.Key key) {
        Intrinsics.g(key, "key");
        CoroutineContext.Element element = this.f71800b;
        CoroutineContext.Element element2 = element.get(key);
        CoroutineContext coroutineContext = this.f71799a;
        if (element2 != null) {
            return coroutineContext;
        }
        CoroutineContext coroutineContextMinusKey = coroutineContext.minusKey(key);
        return coroutineContextMinusKey == coroutineContext ? this : coroutineContextMinusKey == EmptyCoroutineContext.f71803a ? element : new CombinedContext(element, coroutineContextMinusKey);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext plus(CoroutineContext context) {
        Intrinsics.g(context, "context");
        return context == EmptyCoroutineContext.f71803a ? this : (CoroutineContext) context.fold(this, new o3(16, (byte) 0));
    }

    public final String toString() {
        return c1.t(new StringBuilder("["), (String) fold(b.f42142b, new o3(15, (byte) 0)), AbstractJsonLexerKt.END_LIST);
    }
}
