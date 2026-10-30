// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import java.net.SocketException;
import java.net.SocketTimeoutException;

/** Safe startup diagnostics only; never changes ADB authorization, retries or reader state. */
final class VehicleReaderFailure {
    private VehicleReaderFailure() {}

    static String message(String stage, Throwable failure) {
        String phase=stage(stage), type=type(failure);
        if("connect".equals(phase)) {
            if(connectionFailure(failure))return "Waiting for local ADB (127.0.0.1:5555). Stage: connect ("+type+"). Check ADB over network, then use Authorize or retry.";
            return "Could not prepare local ADB (connect: "+type+"). Use Authorize or retry; report this status if it repeats.";
        }
        return "Reader startup failed at "+phase+" ("+type+"). Use Authorize or retry; report this status if it repeats.";
    }

    static String stage(String value) {
        if(value!=null)switch(value) {
            case "cache":case "connect":case "identity":case "recover":case "begin":case "launch":case "verify":return value;
        }
        return "setup";
    }

    static String type(Throwable failure) {
        if(failure==null)return "Exception";
        String name=failure.getClass().getSimpleName();
        switch(name) {
            case "IOException":case "SecurityException":case "IllegalArgumentException":case "IllegalStateException":
            case "JSONException":case "ConnectException":case "SocketException":case "SocketTimeoutException":
            case "NoRouteToHostException":case "EOFException":case "FileNotFoundException":case "NullPointerException":
            case "IndexOutOfBoundsException":case "ClassCastException":case "RuntimeException":case "NumberFormatException":
            case "InterruptedException":case "UnsupportedOperationException":return name;
        }
        return "Exception";
    }

    private static boolean connectionFailure(Throwable failure) {
        // The connect stage also prepares the app-private key. Storage/key failures must not be
        // presented as unreachable adbd. Only transport types or fixed handshake failures qualify.
        for(int depth=0;failure!=null&&depth<8;depth++,failure=failure.getCause()) {
            if(failure instanceof SocketException||failure instanceof SocketTimeoutException)return true;
            String reason=failure.getMessage();
            if("Invalid local ADB connection response".equals(reason)||"Invalid local ADB authentication response".equals(reason)||
               "Local ADB authentication did not finish".equals(reason)||"Invalid local ADB packet header".equals(reason)||
               "Invalid local ADB packet checksum".equals(reason)||"Local ADB connection ended".equals(reason)||
               "Local ADB timed out".equals(reason)||"Local ADB operation timed out".equals(reason))return true;
        }
        return false;
    }
}
