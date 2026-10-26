package io.github.pengusto.stubs.feeder;
/** Compile-only shape. Rebound to the exact shipped R8 ContinuationImpl. */
public abstract class ContinuationBase {
    public ContinuationBase(Object completion) { throw new AssertionError("compile stub"); }
    public abstract Object invokeSuspend(Object result);
}
