package android.content;
public class Context {
 public static final String AUDIO_SERVICE="audio";
 private final Object audio;
 public Context(Object audio){this.audio=audio;}
 public Context getApplicationContext(){return this;}
 public Object getSystemService(String name){if(!AUDIO_SERVICE.equals(name))throw new AssertionError(name);return audio;}
}
