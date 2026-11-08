package android.media;
public class MediaMetadata {
    public static final String METADATA_KEY_TITLE="title", METADATA_KEY_ARTIST="artist";
    private String title,artist;
    public MediaMetadata(String t,String a){title=t;artist=a;}
    public String getString(String key){return key.equals(METADATA_KEY_TITLE)?title:artist;}
}
