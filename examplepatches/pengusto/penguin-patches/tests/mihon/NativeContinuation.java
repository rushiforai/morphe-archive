package io.github.pengusto.patches.mihon.tests;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/** Bridge real R8-narrowed suspend APIs without shipping a second Kotlin runtime. */
final class NativeContinuation extends ContinuationImpl {
    static final class Completion implements Continuation {
        final CountDownLatch done = new CountDownLatch(1);
        final CoroutineContext context;
        volatile Object value;
        Completion(CoroutineContext context) { this.context = context; }
        public CoroutineContext getContext() { return context; }
        public void resumeWith(Object value) { this.value = value; done.countDown(); }
    }
    final Completion completion;
    NativeContinuation(Completion completion) { super(completion, completion.context); this.completion = completion; }
    protected Object invokeSuspend(Object result) { return result; }
    Object await() throws Exception {
        if (!completion.done.await(30, TimeUnit.SECONDS)) throw new AssertionError("Suspend API did not complete");
        return completion.value;
    }
}
