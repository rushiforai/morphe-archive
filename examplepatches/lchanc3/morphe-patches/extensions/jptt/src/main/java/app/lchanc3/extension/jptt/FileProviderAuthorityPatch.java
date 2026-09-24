package app.lchanc3.extension.jptt;

import android.content.Context;

/**
 * JPTT hardcodes its FileProvider authority as "com.joshua.jptt.provider" when
 * building the camera capture intent, while the manifest declares it as
 * {@code <package>.provider}. Cloning the app rewrites the manifest but not the
 * string, and taking a photo to upload then fails with "Couldn't find meta-data
 * for provider with authority com.joshua.jptt.provider".
 *
 * <p>Deriving it from the running package keeps both installs correct: a normal
 * install still resolves to com.joshua.jptt.provider.
 */
@SuppressWarnings("unused")
public final class FileProviderAuthorityPatch {

    public static String getFileProviderAuthority(Context context) {
        return context.getPackageName() + ".provider";
    }

    private FileProviderAuthorityPatch() {
    }
}
