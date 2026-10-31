package com.google.mlkit.nl.translate;

import com.google.android.gms.tasks.Task;
import com.google.mlkit.common.model.DownloadConditions;

/** Compile only; named as the library is named in the app. */
public interface Translator extends java.io.Closeable {
    /** translate: the work that answers with the translated text. */
    Task<String> A(String text);

    /** downloadModelIfNeeded: fetches what is needed to translate the pair, if it is not here. */
    Task<Void> G(DownloadConditions conditions);

    @Override
    void close();
}
