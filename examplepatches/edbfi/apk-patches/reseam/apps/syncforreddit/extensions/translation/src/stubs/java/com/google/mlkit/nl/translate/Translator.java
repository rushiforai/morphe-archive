// SPDX-License-Identifier: AGPL-3.0-or-later

package com.google.mlkit.nl.translate;

import com.google.android.gms.tasks.Task;
import com.google.mlkit.common.model.DownloadConditions;

public interface Translator {
    Task<Void> G(DownloadConditions conditions);
    Task<String> A(String text);
    void close();
}
