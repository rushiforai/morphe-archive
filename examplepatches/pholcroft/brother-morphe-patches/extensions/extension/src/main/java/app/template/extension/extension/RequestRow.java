package app.template.extension.extension;

import java.util.Locale;

/** Formats values and timings for display in request lists. */
public final class RequestRow {
    static String name(String oid) {
        OidDictionary.Entry entry = OidDictionary.lookup(oid);
        if (entry == null) return "Unknown request";
        if (oid.length() == entry.oid.length()) return entry.name;
        String suffix = oid.substring(entry.oid.length() + 1);
        int separator = suffix.indexOf('.');
        switch (entry.symbol) {
            case "brotherPaperSize":
            case "brotherPdlLanguage":
            case "brotherCdLabelLanguage":
            case "ifPhysAddress":
            case "hrDeviceDescr":
                if (separator < 0) return entry.name + " #" + suffix;
                break;
            case "prtInputName":
            case "prtInputMediaName":
            case "prtInputMediaType":
            case "prtInputType":
            case "prtOutputName":
            case "prtMediaPathType":
            case "prtInterpreterLangFamily":
            case "prtInterpreterLangLevel":
            case "prtInterpreterLangVersion":
            case "prtMarkerMarkTech":
            case "prtMarkerLifeCount":
            case "prtMarkerProcessColorants":
                if (separator > 0 && separator == suffix.lastIndexOf('.')) {
                    // Single-printer agents normally use device index 1.
                    String index = suffix.startsWith("1.") ? suffix.substring(separator + 1) : suffix;
                    return entry.name + " #" + index;
                }
                break;
            default:
                break;
        }
        return entry.name;
    }

    static String response(RequestRecord request) {
        if (request.outcome == RequestRecord.Outcome.TIMEOUT) return "Timed out";
        if (request.outcome == RequestRecord.Outcome.CANCELLED) return "Cancelled";
        byte[] response = request.response();
        if (request.outcome == RequestRecord.Outcome.ERROR && response == null) return "Request failed";
        String value = SnmpValueFormatter.format(response, request.oid);
        return value.trim().isEmpty() ? "Empty response" : value;
    }

    static String offset(long nanos) {
        return nanos < 0 ? "time unavailable" : String.format(Locale.ROOT, "%.3f s", nanos / 1e9);
    }

    static String duration(long nanos, boolean estimated) {
        return nanos < 0 ? "duration unavailable" :
                String.format(Locale.ROOT, "%s%.0f ms", estimated ? "~" : "", nanos / 1e6);
    }

    public static String format(RequestRecord request, long offsetNanos, long durationNanos, boolean estimated) {
        return offset(offsetNanos) + " · " + duration(durationNanos, estimated) + " · " +
                name(request.oid) + "\n" + response(request);
    }

    private RequestRow() {}
}
