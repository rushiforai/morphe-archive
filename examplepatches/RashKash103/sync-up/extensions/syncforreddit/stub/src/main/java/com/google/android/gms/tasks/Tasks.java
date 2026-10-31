package com.google.android.gms.tasks;

import java.util.concurrent.TimeUnit;

/** Compile only; named as the library is named in the app. */
public class Tasks {
    /** await: waits for the work to finish, or gives up after the time given. */
    public static <T> Object b(Task<T> task, long wait, TimeUnit unit) {
        throw new UnsupportedOperationException("Stub");
    }
}
