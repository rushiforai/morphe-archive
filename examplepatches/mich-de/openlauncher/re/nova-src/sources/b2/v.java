package b2;

import kotlin.coroutines.CoroutineContext;

/* loaded from: classes.dex */
public interface v extends CoroutineContext.Element {
    @Override // kotlin.coroutines.CoroutineContext.Element
    default CoroutineContext.Key getKey() {
        return u.f17025a;
    }

    float p();
}
