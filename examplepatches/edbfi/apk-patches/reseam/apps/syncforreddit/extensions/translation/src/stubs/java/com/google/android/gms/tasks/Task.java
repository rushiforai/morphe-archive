// SPDX-License-Identifier: AGPL-3.0-or-later

package com.google.android.gms.tasks;

public abstract class Task<T> {
    public abstract Task<T> b(OnCompleteListener<T> listener);
    public abstract Exception l();
    public abstract T m();
    public abstract boolean q();
}
