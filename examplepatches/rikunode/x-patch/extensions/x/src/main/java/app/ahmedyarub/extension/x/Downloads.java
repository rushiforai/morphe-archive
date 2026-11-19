package app.ahmedyarub.extension.x;

import android.app.DownloadManager;

/** Where the app saves downloaded media. */
@SuppressWarnings("unused")
public final class Downloads {

    /** The app's own folder, relative to shared storage. */
    private static final String APP_FOLDER = "Download/X";

    /**
     * The folder downloads go to, relative to shared storage, starting with a standard directory
     * such as Download, Pictures or Movies. Rewritten by Custom download folder.
     */
    private static String folder() {
        return APP_FOLDER;
    }

    /** The MediaStore path a photo is saved under. Only the app's own folder is moved. */
    public static String remapRelativePath(String path) {
        return APP_FOLDER.equals(path) ? folder() : path;
    }

    /** Sets where a video download goes: in the chosen folder rather than Download/X. */
    public static DownloadManager.Request setPublicDestination(DownloadManager.Request request, String directory, String subPath) {
        String name = subPath.startsWith("X/") ? subPath.substring(2) : subPath;

        String folder = folder();
        int slash = folder.indexOf('/');
        String top = slash < 0 ? folder : folder.substring(0, slash);
        String rest = slash < 0 ? "" : folder.substring(slash + 1);

        return request.setDestinationInExternalPublicDir(top, rest.isEmpty() ? name : rest + "/" + name);
    }
}
