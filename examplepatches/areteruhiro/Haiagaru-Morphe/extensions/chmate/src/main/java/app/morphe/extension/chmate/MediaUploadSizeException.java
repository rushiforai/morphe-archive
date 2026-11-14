package app.morphe.extension.chmate;

import java.io.IOException;

/** A server rejected this upload's size; no inferred or hard-coded size limit. */
final class MediaUploadSizeException extends IOException {
    MediaUploadSizeException() { super("ファイルの容量が大きすぎます"); }
}
