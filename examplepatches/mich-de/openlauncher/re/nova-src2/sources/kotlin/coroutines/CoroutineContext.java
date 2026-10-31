package kotlin.coroutines;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import e00.o3;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

@SinceKotlin
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\bg\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/coroutines/CoroutineContext;", b.f42142b, "Key", "Element", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public interface CoroutineContext {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public static final class DefaultImpls {
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/coroutines/CoroutineContext$Element;", "Lkotlin/coroutines/CoroutineContext;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface Element extends CoroutineContext {

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        public static final class DefaultImpls {
            public static Object a(Element element, Object obj, Function2 operation) {
                Intrinsics.g(operation, "operation");
                return operation.invoke(obj, element);
            }

            public static Element b(Element element, Key key) {
                Intrinsics.g(key, "key");
                if (Intrinsics.b(element.getKey(), key)) {
                    return element;
                }
                return null;
            }

            public static CoroutineContext c(Element element, Key key) {
                Intrinsics.g(key, "key");
                return Intrinsics.b(element.getKey(), key) ? EmptyCoroutineContext.f71803a : element;
            }

            public static CoroutineContext d(Element element, CoroutineContext context) {
                Intrinsics.g(context, "context");
                Element element2 = element;
                return context == EmptyCoroutineContext.f71803a ? element2 : (CoroutineContext) context.fold(element2, new o3(16, (byte) 0));
            }
        }

        Key getKey();
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\bf\u0018\u0000*\b\b\u0000\u0010\u0001*\u00020\u00022\u00020\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/coroutines/CoroutineContext$Key;", "E", "Lkotlin/coroutines/CoroutineContext$Element;", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface Key<E extends Element> {
    }

    Object fold(Object obj, Function2 function2);

    Element get(Key key);

    CoroutineContext minusKey(Key key);

    CoroutineContext plus(CoroutineContext coroutineContext);
}
