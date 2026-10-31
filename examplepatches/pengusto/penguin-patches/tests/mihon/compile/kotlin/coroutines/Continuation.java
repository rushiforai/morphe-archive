package kotlin.coroutines;
/** Compile-only: never bundled; target APK supplies Kotlin. */
public interface Continuation {
    CoroutineContext getContext();
    void resumeWith(Object result);
}
