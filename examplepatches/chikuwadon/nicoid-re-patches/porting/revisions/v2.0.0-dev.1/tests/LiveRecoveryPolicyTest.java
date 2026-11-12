package e.e.a;

import java.io.IOException;
import javax.crypto.BadPaddingException;

public final class LiveRecoveryPolicyTest {
 static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
 public static void main(String[] args){
  check(LiveRecoveryPolicy.isAes128Failure(new IOException(
    new BadPaddingException("BAD_DECRYPT"))),"nested AES failure");
  check(LiveRecoveryPolicy.isAes128Failure(new IOException(
    "javax.crypto.BadPaddingException: OPENSSL_internal:BAD_DECRYPT")),"wrapped OpenSSL error");
  check(!LiveRecoveryPolicy.isAes128Failure(new IOException("HTTP 404")),"unrelated HTTP error");
  check(!LiveRecoveryPolicy.isAes128Failure(new IllegalStateException("BAD_PLAYER")),"unrelated state error");
  check(LiveRecoveryPolicy.isCorruptedFmp4Failure(new IOException(
    new IllegalArgumentException("Skipping atom with length > 2147483647 (unsupported)"))),"encrypted fMP4 atom");
  check(!LiveRecoveryPolicy.isCorruptedFmp4Failure(new IOException("HTTP 403")),"unrelated network error");
  check(LiveRecoveryPolicy.retryDelayMs(1)==1000L,"first retry");
  check(LiveRecoveryPolicy.retryDelayMs(3)==3000L,"third retry");
  check(LiveRecoveryPolicy.retryDelayMs(100)==5000L,"maximum delay");
  check(LiveRecoveryPolicy.MAX_ATTEMPTS==3,"bounded attempts");
  check(LiveRecoveryPolicy.WINDOW_MS==300000L,"retry window");
  System.out.println("PASS: HLS AES-128 bounded recovery policy");
 }
}
