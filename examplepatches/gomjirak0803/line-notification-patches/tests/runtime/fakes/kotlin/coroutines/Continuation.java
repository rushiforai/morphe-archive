package kotlin.coroutines;

public interface Continuation {
    Object getContext();
    void resumeWith(Object result);
}
