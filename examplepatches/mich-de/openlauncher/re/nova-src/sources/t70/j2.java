package t70;

import kotlin.coroutines.CoroutineContext;

/* loaded from: classes.dex */
public interface j2 extends CoroutineContext.Element {
    void restoreThreadContext(CoroutineContext coroutineContext, Object obj);

    Object updateThreadContext(CoroutineContext coroutineContext);
}
