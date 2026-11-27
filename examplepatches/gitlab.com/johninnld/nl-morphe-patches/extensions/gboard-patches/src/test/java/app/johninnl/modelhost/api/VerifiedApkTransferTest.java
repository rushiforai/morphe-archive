package app.johninnl.modelhost.api;

import java.io.InputStream;
import java.io.OutputStream;
import org.junit.Test;
import static org.junit.Assert.*;

public class VerifiedApkTransferTest {
    private static final class Zeroes extends InputStream {
        long remaining;
        Zeroes(long count){remaining=count;}
        @Override public int read(){if(remaining==0)return -1;remaining--;return 0;}
        @Override public int read(byte[] data,int offset,int length){
            if(remaining==0)return -1;int count=(int)Math.min(remaining,length);
            java.util.Arrays.fill(data,offset,offset+count,(byte)0);remaining-=count;return count;
        }
    }
    private static final class Counter extends OutputStream {
        long bytes;
        @Override public void write(int value){bytes++;}
        @Override public void write(byte[] data,int offset,int count){bytes+=count;}
    }
    @Test public void currentHostSizedApkIsFullyCopiedAndHashedWithoutBufferingIt()throws Exception {
        long size=167502289L;Zeroes input=new Zeroes(size);Counter output=new Counter();
        assertEquals("afdeeef1857d09b62f6f58c83e95708c833a32b1b4058f7013e5b577aea0c60f",VerifiedApk.copyAndHash(input,output));
        assertEquals(size,output.bytes);assertEquals(0,input.remaining);
    }
    @Test public void oversizedApkIsRejectedBeforeWritingPastTheBound()throws Exception {
        Counter output=new Counter();
        try{VerifiedApk.copyAndHash(new Zeroes(VerifiedApk.MAX_APK_BYTES+1),output);fail("Oversized APK accepted");}
        catch(HostException expected){assertEquals("APK_TOO_LARGE",expected.code);}
        assertEquals(VerifiedApk.MAX_APK_BYTES,output.bytes);
    }
}
