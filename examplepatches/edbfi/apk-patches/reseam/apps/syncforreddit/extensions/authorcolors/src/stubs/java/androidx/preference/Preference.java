// SPDX-License-Identifier: AGPL-3.0-or-later

package androidx.preference;

import android.content.Context;

public abstract class Preference {
    public interface d {
        boolean a(Preference preference);
    }

    public abstract void A0(d listener);
    public abstract Context k();
}
