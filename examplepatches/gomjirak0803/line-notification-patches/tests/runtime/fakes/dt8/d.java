package dt8;

import kotlin.coroutines.Continuation;

public class d implements Continuation {
    private final Continuation completion;

    public d(Continuation completion) {
        this.completion = completion;
    }

    protected Object invokeSuspend(Object result) {
        return result;
    }

    @Override public Object getContext() {
        return completion.getContext();
    }

    @Override public void resumeWith(Object result) {
        completion.resumeWith(result);
    }
}
