package nl.johninnl.eclipse.app;

/**
 * Kotlin's BaseContinuationImpl (R8 name cr0). The stub reproduces its final resumeWith loop so
 * JVM tests can drive the extension's Suspend classes; the app's real class is the one that runs.
 */
public abstract class cr0 implements tz1 {
    private final tz1 completion;

    public cr0(tz1 completion) { this.completion = completion; }

    public final tz1 getCompletion() { return completion; }

    public abstract Object invokeSuspend(Object result);

    @Override public final void resumeWith(Object result) {
        Object outcome;
        try {
            outcome = invokeSuspend(result);
        } catch (Throwable failure) {
            outcome = new zv8(failure);
        }
        if (outcome == q12.COROUTINE_SUSPENDED) return;
        completion.resumeWith(outcome);
    }
}
