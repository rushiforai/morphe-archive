package app.linenotifications.extension;

/** The patch binds this adapter to LINE's native coroutine continuation base. */
public final class NotificationContinuation {
    public NotificationContinuation(Object completion) { }
    public Object invokeSuspend(Object result) { return result; }
}
