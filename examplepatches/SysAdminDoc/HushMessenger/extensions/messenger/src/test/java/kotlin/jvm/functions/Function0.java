package kotlin.jvm.functions;

/** Stand-in for Kotlin's callback type, which Messenger hands its chat preview. */
public interface Function0<R> {
    R invoke();
}
