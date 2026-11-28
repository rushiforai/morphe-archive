package app.yydarlinker.aicaptions;

public interface CaptionSourceControl {
    boolean isCancelled();

    void onConnection(java.net.HttpURLConnection connection);
}
