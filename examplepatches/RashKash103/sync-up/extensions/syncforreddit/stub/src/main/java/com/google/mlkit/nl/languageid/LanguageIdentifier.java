package com.google.mlkit.nl.languageid;

import com.google.android.gms.tasks.Task;

/** Compile only; named as the library is named in the app. */
public interface LanguageIdentifier extends java.io.Closeable {
    /** identifyLanguage: answers with the language of the text, or "und" where it cannot tell. */
    Task<String> q0(String text);

    @Override
    void close();
}
