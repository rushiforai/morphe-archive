package dev.rikunode.futatabi.bridge;

import android.os.ParcelFileDescriptor;
import android.system.Os;
import java.io.File;
import java.net.InetSocketAddress;
import java.net.Socket;

/** Proof of a live client endpoint owned by this exact process. Never trust headers. */
final class ProcessSocketAuth {
    private ProcessSocketAuth() {}

    static boolean ownsPeer(Socket accepted) {
        try {
            if (!(accepted.getRemoteSocketAddress() instanceof InetSocketAddress) ||
                    !(accepted.getLocalSocketAddress() instanceof InetSocketAddress)) return false;
            InetSocketAddress peer = (InetSocketAddress) accepted.getRemoteSocketAddress();
            InetSocketAddress local = (InetSocketAddress) accepted.getLocalSocketAddress();
            if (!peer.getAddress().isLoopbackAddress() || !local.getAddress().isLoopbackAddress()
                    || peer.equals(local)) return false;
            File[] entries = new File("/proc/self/fd").listFiles();
            if (entries == null || entries.length > 8192) return false;
            for (File entry : entries) {
                try {
                    if (!Os.readlink(entry.getAbsolutePath()).startsWith("socket:[")) continue;
                    int fd = Integer.parseInt(entry.getName());
                    // Dup the candidate, so a concurrent close/reuse cannot alter the inspected socket.
                    try (ParcelFileDescriptor copy = ParcelFileDescriptor.fromFd(fd)) {
                        java.io.FileDescriptor descriptor = copy.getFileDescriptor();
                        if (peer.equals(Os.getsockname(descriptor)) &&
                                local.equals(Os.getpeername(descriptor))) return true;
                    }
                } catch (Exception ignored) { /* closed/non-socket/unsupported descriptor */ }
            }
        } catch (Exception ignored) { /* fail closed */ }
        return false;
    }
}
