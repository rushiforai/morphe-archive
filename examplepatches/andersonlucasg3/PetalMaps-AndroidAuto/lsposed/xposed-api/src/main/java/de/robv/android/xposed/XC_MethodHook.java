package de.robv.android.xposed;

import de.robv.android.xposed.callbacks.XCallback;

import java.lang.reflect.Executable;
import java.lang.reflect.Member;

/**
 * Compile-only stub mirroring the legacy Xposed API shipped by LSPosed 1.9.x.
 * Signatures (post-erasure) must match the runtime classes exactly.
 */
public abstract class XC_MethodHook extends XCallback {

    public XC_MethodHook() {
        super();
    }

    /**
     * Called before the invocation of the method.
     */
    protected void beforeHookedMethod(MethodHookParam<?> param) throws Throwable {
    }

    /**
     * Called after the invocation of the method.
     */
    protected void afterHookedMethod(MethodHookParam<?> param) throws Throwable {
    }

    /**
     * Wraps information about the method call and allows to influence it.
     */
    public static class MethodHookParam<T extends Executable> extends XCallback.Param {

        public MethodHookParam() {
            super();
        }

        /** The hooked method/constructor. */
        public Member method;

        /** The {@code this} reference for an instance method, or {@code null} for static methods. */
        public Object thisObject;

        /** Arguments to the method call. */
        public Object[] args;

        public Object result = null;
        public Throwable throwable = null;
        public boolean returnEarly = false;

        /** Returns the result of the method call. */
        public Object getResult() {
            return result;
        }

        /**
         * Modify the result of the method call. If called from
         * {@link #beforeHookedMethod}, it prevents the call to the original method.
         */
        public void setResult(Object result) {
            this.result = result;
            this.throwable = null;
            this.returnEarly = true;
        }

        /** Returns the {@link Throwable} thrown by the method, or {@code null}. */
        public Throwable getThrowable() {
            return throwable;
        }
    }

    /** Callback class for method hooks. */
    public class Unhook {

        /** Removes the hook. */
        public void unhook() {
        }
    }
}
