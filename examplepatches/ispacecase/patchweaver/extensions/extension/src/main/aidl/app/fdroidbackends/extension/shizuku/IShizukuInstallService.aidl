package app.fdroidbackends.extension.shizuku;

// Runs in the Shizuku (shell UID) process. Installs an APK streamed from the caller's process
// via a pipe, using `pm install`, so no user-facing installer UI is shown.
interface IShizukuInstallService {
    // pfd is the read end of a pipe; the caller writes the APK bytes to the write end.
    // Returns null on success, or a human-readable error message on failure.
    String installFromDescriptor(in ParcelFileDescriptor pfd, long size, String packageName);

    void destroy();
}
