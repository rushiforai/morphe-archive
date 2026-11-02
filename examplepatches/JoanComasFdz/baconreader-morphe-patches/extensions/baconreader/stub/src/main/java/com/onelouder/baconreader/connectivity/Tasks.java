// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package com.onelouder.baconreader.connectivity;

public class Tasks {
    public static abstract class OnCompleteListener<T> {
        public abstract void onCancel(String str);

        public abstract void onComplete(T t);

        public void processInBackground(T t) {
        }
    }
}
