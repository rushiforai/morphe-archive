
package android.media.session;
public class MediaSession {
  public static class Token {}
  private final Token token=new Token();
  public Token getSessionToken(){return token;}
}
