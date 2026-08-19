package de.robv.android.xposed.callbacks;

/**
 * Compile-only stub mirroring the legacy Xposed API shipped by LSPosed 1.9.x.
 * Only what this module needs to compile against is declared.
 */
public abstract class XCallback {

    protected XCallback() {
    }

    protected XCallback(int priority) {
    }

    /**
     * Base class for Xposed callback parameters.
     */
    public static abstract class Param {

        /** @hide */
        public final XCallback[] callbacks;

        protected Param() {
            callbacks = null;
        }

        protected Param(XCallback[] callbacks) {
            this.callbacks = callbacks;
        }
    }
}
