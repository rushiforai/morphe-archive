package com.nuvio.tv.data.local;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import software.santodan.extension.nuviomerged.NuvioLocalWriteContinuation;

/** Mirrors beta.12's native suspended store re-entry, including its exact state class names. */
public final class NativeLocalWriteFixture {
    public static void run(String method, Function1<Continuation<Object>, Object> saved, Throwable failure) {
        Object[] completed = new Object[1];
        Continuation<Object> receiver = new Continuation<>() {
            public CoroutineContext getContext() { return EmptyCoroutineContext.INSTANCE; }
            public void resumeWith(Object result) { completed[0] = result; }
        };
        Continuation<Object> observed = NuvioLocalWriteContinuation.observe(method, receiver, saved);
        ResumeState state;
        switch (method) {
            case "C": state = new xb(observed, method); break;
            case "D": state = new yb(observed, method); break;
            case "A": state = new vb(observed, method); break;
            case "B": state = new wb(observed, method); break;
            default: throw new AssertionError(method);
        }
        ((NuvioLocalWriteContinuation) observed).inlineResult(IntrinsicsKt.getCOROUTINE_SUSPENDED());
        state.resumeWith(failure == null ? Unit.INSTANCE : ResultKt.createFailure(failure));
        if (completed[0] == null) throw new AssertionError("Native continuation did not complete");
        ResultKt.throwOnFailure(completed[0]);
    }
}

abstract class ResumeState extends ContinuationImpl {
    private final String method;
    ResumeState(Continuation<Object> completion, String method) { super(completion); this.method = method; }
    protected Object invokeSuspend(Object result) {
        ResultKt.throwOnFailure(result);
        // Native invokeSuspend re-enters the public wrapper with null/zero arguments.
        // Wrapping this state again makes the cloned body start a new write instead of resume.
        Continuation<Object> resumed = NuvioLocalWriteContinuation.observe(method, this, ignored -> {
            throw new AssertionError("Placeholder arguments reached the overlay");
        });
        if (resumed != this) throw new AssertionError("Native resume was wrapped as a new local write");
        return Unit.INSTANCE;
    }
}
final class xb extends ResumeState { xb(Continuation<Object> c, String m) { super(c, m); } }
final class yb extends ResumeState { yb(Continuation<Object> c, String m) { super(c, m); } }
final class vb extends ResumeState { vb(Continuation<Object> c, String m) { super(c, m); } }
final class wb extends ResumeState { wb(Continuation<Object> c, String m) { super(c, m); } }
