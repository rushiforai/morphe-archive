/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.feeder;

/** The patch binds the superclass and constructor to the shipped coroutine ABI. */
public final class ImageContinuation extends io.github.pengusto.stubs.feeder.ContinuationBase {
    public ImageContinuation(Object completion) { super(completion); }
    @Override public Object invokeSuspend(Object result) { return result; }
}
