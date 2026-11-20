package app.aidan.extension.adobescan;

interface IPdfTransformCallback {
    oneway void onProgress(long operationId, int percent);
    oneway void onComplete(long operationId, int status, int pageCount, long outputBytes, boolean encrypted);
}
