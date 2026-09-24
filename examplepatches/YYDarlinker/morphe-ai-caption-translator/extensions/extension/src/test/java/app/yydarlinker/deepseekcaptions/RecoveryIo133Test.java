package app.yydarlinker.deepseekcaptions;
import org.junit.*;import static org.junit.Assert.*;
import java.io.*;import java.net.*;import java.util.concurrent.*;

public class RecoveryIo133Test {
    static class Connection extends HttpURLConnection {
        final CountDownLatch disconnected=new CountDownLatch(1);
        Connection()throws Exception{super(new URL("http://127.0.0.1/fixture"));}
        public void connect(){}public boolean usingProxy(){return false;}
        public void disconnect(){disconnected.countDown();}
    }
    @Test public void transientSourceReadsBackOffButNeverSpendTranslationBudget() {
        assertEquals(750,SourceRecoveryPolicy.delay(1,0));assertEquals(2000,SourceRecoveryPolicy.delay(2,0));
        assertEquals(30000,SourceRecoveryPolicy.delay(100,0));assertEquals(60000,SourceRecoveryPolicy.delay(1,60000));
        assertTrue(SourceRecoveryPolicy.classify(new IOException("closed")).retryable);
        assertTrue(SourceRecoveryPolicy.classify(new SocketTimeoutException()).retryable);
        assertFalse(SourceRecoveryPolicy.classify(new javax.net.ssl.SSLHandshakeException("certificate")).retryable);
        assertFalse(SourceRecoveryPolicy.classify(new InterruptedException()).retryable);
        assertFalse(SourceRecoveryPolicy.http(401,"").retryable);assertTrue(SourceRecoveryPolicy.http(503,"").retryable);
        assertEquals(3,AnchoredRetryPolicy.MAX_FAILURES);
    }
    @Test public void timeoutClosesAnOutstandingConnection()throws Exception {
        Connection c=new Connection();try(NetworkDeadline d=new NetworkDeadline(c,System.nanoTime()+TimeUnit.MILLISECONDS.toNanos(50))){
            assertTrue(c.disconnected.await(2,TimeUnit.SECONDS));
        }
    }
    @Test public void completedConnectionHasNoLateDisconnect()throws Exception {
        Connection c=new Connection();new NetworkDeadline(c,System.nanoTime()+TimeUnit.MILLISECONDS.toNanos(80)).close();
        assertFalse(c.disconnected.await(150,TimeUnit.MILLISECONDS));
    }
    @Test public void slowDripCannotExtendApiReadBeyondItsExistingTotalDeadline()throws Exception {
        Connection c=new Connection();InputStream input=new InputStream(){
            public int read(){return 1;}
            public int read(byte[] b,int off,int len)throws IOException {try{Thread.sleep(80);}catch(InterruptedException e){throw new InterruptedIOException();}b[off]=1;return 1;}
        };
        try{ContextualBatchApiClient.readFully(input,1000,c,System.nanoTime()+TimeUnit.MILLISECONDS.toNanos(40),null);fail();}
        catch(ContextualBatchApiClient.RetryableException expected){assertEquals("deadline",expected.category());}
    }
}
