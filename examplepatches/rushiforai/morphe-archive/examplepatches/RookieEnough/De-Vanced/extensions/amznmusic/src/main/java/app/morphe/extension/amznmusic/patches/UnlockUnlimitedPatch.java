/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/80ff578e21fce1b9825f2f7820d8d910e85f8822/extensions/amznmusic/src/main/java/app/revanced/extension/amznmusic/patches/UnlockUnlimitedPatch.java
 */

package app.morphe.extension.amznmusic.patches;

import com.amazon.music.account.User;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@SuppressWarnings("unused")
public class UnlockUnlimitedPatch {
    public static Set createBenefitSet() {
        return new HashSet<>(Arrays.asList(User.Benefit.values()));
    }
}

