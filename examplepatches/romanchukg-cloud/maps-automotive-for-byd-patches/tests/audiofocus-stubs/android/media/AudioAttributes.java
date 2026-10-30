package android.media;
public final class AudioAttributes {
 public static final int USAGE_ASSISTANT=16, CONTENT_TYPE_SPEECH=1;
 public final int usage,content;
 private AudioAttributes(int usage,int content){this.usage=usage;this.content=content;}
 public static final class Builder {
  int usage,content;
  public Builder setUsage(int value){usage=value;return this;}
  public Builder setContentType(int value){content=value;return this;}
  public AudioAttributes build(){return new AudioAttributes(usage,content);}
 }
}
