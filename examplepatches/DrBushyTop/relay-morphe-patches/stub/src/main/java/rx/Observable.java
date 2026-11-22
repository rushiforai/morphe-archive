package rx;

import rx.functions.Action1;
import rx.functions.Func1;

/** RxJava 1 Observable as minified in Relay 10.2.40. */
public class Observable {
    /** just(value) */
    public static Observable w(Object value) {
        throw new UnsupportedOperationException();
    }

    /** onErrorReturn(Func1&lt;Throwable, T&gt;): emits the function's result, then completes. */
    public final Observable J(Func1 resume) {
        throw new UnsupportedOperationException();
    }

    /** subscribeOn(Scheduler) */
    public final Observable U(Scheduler scheduler) {
        throw new UnsupportedOperationException();
    }

    /** subscribe(onNext, onError) */
    public final Subscription T(Action1 onNext, Action1 onError) {
        throw new UnsupportedOperationException();
    }

    /** flatMap(Func1&lt;T, Observable&gt;) */
    public final Observable s(Func1 mapper) {
        throw new UnsupportedOperationException();
    }
}
