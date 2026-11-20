package app.aidan.extension.adobescan;

public final class NativePdfEngine {

    public static final int COMPRESS = 1;
    public static final int PROTECT = 2;
    public static final int UNPROTECT = 3;
    public static final int COMBINE = 4;
    public static final int EXPORT_DOCX = 5;
    public static final int EXPORT_XLSX = 6;
    public static final int EXPORT_PPTX = 7;

    public static final int OK = 0;
    public static final int NO_SAVINGS = 1;
    public static final int CANCELLED = 2;
    public static final int INVALID_PDF = 3;
    public static final int PASSWORD_REQUIRED = 4;
    public static final int WRONG_PASSWORD = 5;
    public static final int UNSUPPORTED_PDF = 6;
    public static final int IO_ERROR = 7;
    public static final int ENGINE_FAILURE = 8;
    public static final int ALREADY_UNPROTECTED = 9;

    public static final int HIGH = 0;
    public static final int LOW = 1;

    static {
        try {
            System.loadLibrary("aidanscanpdf");
        } catch (final UnsatisfiedLinkError e) {
            // Can occur in JVM unit tests or if native library is staged separately
        }
    }

    private NativePdfEngine() {}

    public interface NativeCallbacks {
        void onProgress(int percent);
        void onComplete(int status, int pageCount, long outputBytes, boolean encrypted);
    }

    public static native void transform(
            int inputFd,
            int outputFd,
            int operation,
            int compressionLevel,
            byte[] passwordUtf8,
            NativeCallbacks callbacks);

    public static native void combine(
            int[] inputFds,
            byte[][] passwordsUtf8,
            int outputFd,
            NativeCallbacks callbacks);

    public static native PdfPageLayout.Word[] recognize(
            android.graphics.Bitmap page,
            int modelFd);
}
