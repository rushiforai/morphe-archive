package io.github.emotionbug.patches.adot;
import java.io.*;
public final class PatchFiles {
    public static void checkInterrupted() throws InterruptedIOException {
        if(Thread.currentThread().isInterrupted())throw new InterruptedIOException("Patch cancelled");
    }
    public static byte[] read(InputStream input,int max) throws IOException {
        ByteArrayOutputStream output=new ByteArrayOutputStream();byte[] buffer=new byte[8192];int n;
        while((n=input.read(buffer))!=-1){checkInterrupted();if(output.size()+n>max)throw new IOException("Input too large");output.write(buffer,0,n);}
        return output.toByteArray();
    }
}
