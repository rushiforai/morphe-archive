// SPDX-License-Identifier: AGPL-3.0-or-later

package com.google.mlkit.nl.languageid;

import com.google.android.gms.tasks.Task;

public interface LanguageIdentifier {
    Task<String> q0(String text);
    void close();
}
