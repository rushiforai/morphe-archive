/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/80ff578e21fce1b9825f2f7820d8d910e85f8822/extensions/amznmusic/stub/src/main/java/com/amazon/digitalmusicxp/callbacks/Outcome.java
 */

package com.amazon.digitalmusicxp.callbacks;

@SuppressWarnings("unused")
public interface Outcome<T> {

    final class Success<T> implements Outcome<T> {
        private final T value;

        public Success(T value) {
            this.value = value;
        }

        public T getValue() {
            return value;
        }
    }

    final class Failure<T> implements Outcome<T> {
        private final Throwable cause;

        public Failure(Throwable cause) {
            this.cause = cause;
        }

        public Throwable getCause() {
            return cause;
        }
    }
}

