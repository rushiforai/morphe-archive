package app.morphe.extension.chmate;

import java.net.URI;
import java.util.regex.Pattern;

/** URL-only handoff contract; independent of the installed package name. */
final class ExternalCheckerLinks {
    private static final Pattern SHORT=Pattern.compile("^/liveedge/\\d{9,20}(?:/[^/?#]*)?/?$");
    static String normalizeEdge(String value) {
        try {
            URI uri=URI.create(value);
            String host=uri.getHost(),scheme=uri.getScheme();
            if(!("http".equalsIgnoreCase(scheme)||"https".equalsIgnoreCase(scheme))
                    ||!("bbs.eddibb.cc".equalsIgnoreCase(host)||"v1ch.cc".equalsIgnoreCase(host))
                    ||uri.getRawUserInfo()!=null||uri.getPort()!=-1
                    ||!SHORT.matcher(uri.getRawPath()).matches())return value;
            // Insert a path prefix without decoding/re-encoding the query or response selector.
            int path=value.indexOf('/',value.indexOf("://")+3);
            return value.substring(0,path)+"/test/read.cgi"+value.substring(path);
        } catch(IllegalArgumentException invalid) { return value; }
    }
    private ExternalCheckerLinks() {}
}
