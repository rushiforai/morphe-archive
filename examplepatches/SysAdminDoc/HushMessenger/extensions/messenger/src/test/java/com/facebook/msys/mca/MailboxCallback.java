package com.facebook.msys.mca;

/** Messenger's msys callback, as far as the pinned message bar's proxy needs it. */
public interface MailboxCallback {
    void onCompletion(Object result);
}
