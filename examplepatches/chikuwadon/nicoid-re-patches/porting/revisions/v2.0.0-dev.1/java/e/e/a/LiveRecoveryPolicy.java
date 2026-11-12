package e.e.a;

import javax.crypto.BadPaddingException;

/** Pure policy for bounded recovery of HLS AES-128 segment decryption errors. */
public final class LiveRecoveryPolicy {
 public static final int MAX_ATTEMPTS=3;
 public static final long WINDOW_MS=300000L;
 private LiveRecoveryPolicy(){}
 public static boolean isAes128Failure(Throwable error){
  for(int depth=0;error!=null&&depth<12;depth++,error=error.getCause()){
   if(error instanceof BadPaddingException)return true;
   String message=error.getMessage();
   if(message!=null&&message.contains("BAD_DECRYPT"))return true;
  }
  return false;
 }
 /** Corrupted encrypted fMP4 can surface as an impossible atom size instead of BAD_DECRYPT. */
 public static boolean isCorruptedFmp4Failure(Throwable error){
  for(int depth=0;error!=null&&depth<12;depth++,error=error.getCause()){
   String message=error.getMessage();
   if(message!=null&&message.contains("Skipping atom with length > 2147483647"))return true;
  }
  return false;
 }
 public static long retryDelayMs(int attempt){
  return Math.min(5000L,Math.max(1,attempt)*1000L);
 }
}
