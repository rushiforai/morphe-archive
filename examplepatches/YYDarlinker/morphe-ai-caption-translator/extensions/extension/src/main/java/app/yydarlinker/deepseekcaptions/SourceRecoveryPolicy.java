package app.yydarlinker.deepseekcaptions;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.SocketTimeoutException;
import javax.net.ssl.SSLException;

/** Retry only idempotent YouTube source reads here, never paid translation POSTs. */
final class SourceRecoveryPolicy {
    static final class Failure extends IOException {
        final String category;
        final boolean retryable;
        final long retryAfterMs;
        Failure(String category, boolean retryable, long retryAfterMs, Throwable cause) {
            super(category, cause); this.category=category; this.retryable=retryable;
            this.retryAfterMs=Math.max(0,Math.min(120_000,retryAfterMs));
        }
    }
    static Failure classify(Throwable error) {
        for(Throwable e=error;e!=null;e=e.getCause()) {
            if(e instanceof Failure)return (Failure)e;
            if(e instanceof SSLException)return new Failure("tls",false,0,error);
        }
        for(Throwable e=error;e!=null;e=e.getCause()) {
            if(e instanceof SocketTimeoutException)return new Failure("timeout",true,0,error);
            if(e instanceof InterruptedException || e instanceof InterruptedIOException)
                return new Failure("cancelled",false,0,error);
            if(e instanceof IOException)return new Failure("network",true,0,error);
        }
        return new Failure("source_format",false,0,error);
    }
    static Failure http(int status, String retryAfter) {
        long wait=0;
        try{wait=Math.min(120,Math.max(0,Long.parseLong(retryAfter)))*1000;}catch(Exception ignored){}
        return new Failure("http_"+status,status==408||status==425||status==429||status>=500,wait,null);
    }
    static boolean formatFallback(Throwable error) {
        Failure f=classify(error);
        return f.category.equals("source_format") || f.category.equals("source_empty") ||
                f.category.equals("empty_response") || f.category.equals("http_400") ||
                f.category.equals("http_403") || f.category.equals("http_404");
    }
    static long delay(int failures,long serverDelay) {
        // Quick recovery from one dropped connection; at most two loader attempts/minute in an outage.
        long[] delays={750,2_000,5_000,15_000,30_000};
        return Math.max(delays[Math.min(delays.length-1,Math.max(0,failures-1))],serverDelay);
    }
    private SourceRecoveryPolicy(){}
}
