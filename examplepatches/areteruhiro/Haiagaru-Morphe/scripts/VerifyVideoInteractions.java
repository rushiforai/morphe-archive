import app.morphe.extension.chmate.VideoPlaybackMath;
import app.morphe.extension.chmate.YouTubeUrls;
import app.morphe.extension.chmate.VideoSeekState;

public final class VerifyVideoInteractions {
    static int count;
    static void check(boolean value) { count++; if (!value) throw new AssertionError("case " + count); }
    public static void main(String[] args) {
        String id = "aB_-0123456";
        for (String url : new String[]{"https://www.youtube.com/watch?v=" + id,
                "http://youtube.com/watch?list=123&v=" + id + "&t=30", "https://m.youtube.com/watch?v=" + id,
                "https://youtu.be/" + id + "?si=123", "https://youtu.be/" + id + "/",
                "https://www.youtube.com/shorts/" + id, "https://youtube.com/live/" + id + "/",
                "https://www.youtube.com/embed/" + id, "https://music.youtube.com/watch?v=" + id}) {
            check(id.equals(YouTubeUrls.videoId(url)));
        }
        for (String url : new String[]{null, "", "file:///watch?v=" + id,
                "https://youtube.com.evil.invalid/watch?v=" + id, "https://youtube.com@evil.invalid/watch?v=" + id,
                "https://evil.invalid@youtube.com/watch?v=" + id, "https://www.youtube.com/watch?v=short",
                "https://www.youtube.com/playlist?list=" + id, "https://youtu.be/" + id + "/evil",
                "https://www.youtube.com/watch?v=" + id + "&v=" + id, "https://youtube.com:444/watch?v=" + id,
                "javascript:alert(1)", "https://www.youtube.com/embed/%27%3E%3Cscript%3E"}) {
            check(YouTubeUrls.videoId(url) == null);
        }
        check(VideoPlaybackMath.seekTarget(15000, 60000, -10) == 5000);
        check(VideoPlaybackMath.seekTarget(5000, 60000, -10) == 0);
        check(VideoPlaybackMath.seekTarget(55000, 60000, 10) == 59999);
        check(VideoPlaybackMath.seekTarget(0, 1, 10) == 0);
        check(VideoPlaybackMath.seekTarget(123, 0, 10) == 123);
        check(VideoPlaybackMath.seekTarget(Integer.MAX_VALUE - 100, Integer.MAX_VALUE, 60) == Integer.MAX_VALUE - 1);
        check(VideoPlaybackMath.seekTarget(0, Integer.MAX_VALUE, Integer.MAX_VALUE) == Integer.MAX_VALUE - 1);
        VideoSeekState seeks = new VideoSeekState();
        check(seeks.position(1000) == 1000);
        check(seeks.request(6000) == 6000);
        check(seeks.request(VideoPlaybackMath.seekTarget(seeks.position(1000), 60000, 5)) == -1);
        check(seeks.position(1000) == 11000);
        check(seeks.completed() == 11000);
        check(seeks.completed() == -1);
        check(seeks.position(11200) == 11200);
        check(seeks.completed() == -1);
        check(seeks.request(20000) == 20000);
        check(seeks.request(5000) == -1);
        check(seeks.completed() == 5000);
        seeks.reset();
        check(seeks.completed() == -1);
        check(seeks.position(0) == 0);
        System.out.println("PASS " + count + " video seeking and YouTube URL cases");
    }
}
