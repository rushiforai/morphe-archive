package com.waze.gw;

import java.io.IOException;

/** Reports a partial serial write that exceeded its caller-provided timeout. */
final class SerialTimeoutException extends IOException {
    final int bytesTransferred;
    SerialTimeoutException(String message, int bytesTransferred) {
        super(message);
        this.bytesTransferred = bytesTransferred;
    }
}
