package app.morphe.extension.chmate;

/** Pure parser regression checks; no Android runtime or public posting. */
public final class ThreadListThumbnailRulesTest {
    private static int checks;
    private static void check(boolean ok) {
        checks++;
        if (!ok) throw new AssertionError("thumbnail rule " + checks);
    }

    public static void main(String[] args) {
        var board = ThreadListThumbnailRules.board("https://egg.5ch.io/android/");
        check(board != null && board.name.equals("android") && board.host.equals("egg.5ch.io"));
        check(board.settingsKey().equals("5ch:egg.5ch.io/android"));
        check(board.legacySettingsKey().equals("5ch:android"));
        var sameFromThread = ThreadListThumbnailRules.board("https://egg.5ch.io/test/read.cgi/android/1790000000/");
        check(sameFromThread != null && sameFromThread.settingsKey().equals(board.settingsKey()));
        var differentHost = ThreadListThumbnailRules.board("https://eagle.5ch.net/android/");
        check(differentHost != null && !differentHost.settingsKey().equals(board.settingsKey()));
        check(board.threadUrl("1790000000").equals("https://egg.5ch.io/test/read.cgi/android/1790000000/"));
        var thread = ThreadListThumbnailRules.board("https://egg.5ch.io/test/read.cgi/android/1790000000/");
        check(thread != null && thread.name.equals("android"));
        var diagnostic = ThreadListThumbnailRules.board("{server:egg.5ch.io, name:android, created:123456}");
        check(diagnostic != null && diagnostic.name.equals("android"));
        check(ThreadListThumbnailRules.board("https://example.com/android/") == null);
        check(ThreadListThumbnailRules.board("https://fake5ch.io/android/") == null);
        check(ThreadListThumbnailRules.board("https://egg.5ch.io/android/?x=1") == null);
        check(ThreadListThumbnailRules.board("https://egg.5ch.io/test/read.cgi/android/not-a-thread/") == null);
        var edge = ThreadListThumbnailRules.board("https://bbs.eddibb.cc/liveedge/");
        check(edge != null && edge.host.equals("bbs.eddibb.cc") && edge.name.equals("liveedge"));
        check(edge.threadUrl("1790000000").equals("https://bbs.eddibb.cc/liveedge/1790000000"));
        check(ThreadListThumbnailRules.board("https://bbs.eddibb.cc/test/read.cgi/liveedge/1790000000/") != null);
        check(ThreadListThumbnailRules.board("http://bbs.eddibb.cc/liveedge/") != null);
        check(ThreadListThumbnailRules.board("https://bbs.eddibb.cc/liveedge/1790000000") != null);
        check(ThreadListThumbnailRules.board("https://bbs.eddibb.cc/test/read.cgi/other/1790000000/") == null);
        check(ThreadListThumbnailRules.board("https://bbs.eddibb.cc.evil.test/liveedge/") == null);
        check(ThreadListThumbnailRules.board("https://bbs.eddibb.cc/liveedge/?foo=1") == null);
        check(ThreadListThumbnailRules.publicImage("https://cdn.example.org/picture.jpeg"));
        check(!ThreadListThumbnailRules.publicImage("http://cdn.example.org/picture.jpeg"));
        check(!ThreadListThumbnailRules.publicImage("https://127.0.0.1/picture.jpeg"));
        check(!ThreadListThumbnailRules.publicImage("https://server.local/picture.jpeg"));
        String html = "<div class='thread'><div class='post'><div class='message'>"
            + "<a href='https://cdn.example.org/first.jpg'>first</a></div></div>"
            + "<div class='post'><div class='message'>"
            + "<a href='https://cdn.example.org/second.png'>second</a></div></div></div>";
        check("https://cdn.example.org/first.jpg".equals(
            ThreadListThumbnailRules.firstFiveChImage(html, board.threadUrl("1790000000"))));
        String multiple = "<div class='thread'><div class='post'><div class='message'>"
            + "<a href='https://cdn.example.org/a.jpg'>one</a>"
            + "<a href='https://cdn.example.org/a.jpg'>repeat</a>"
            + "<img src='https://cdn.example.org/b.png'>"
            + "<a href='https://cdn.example.org/c.webp'>three</a></div></div>"
            + "<div class='post'><div class='message'><a href='https://cdn.example.org/d.jpg'>four</a></div></div></div>";
        check(ThreadListThumbnailRules.firstFiveChImages(multiple,board.threadUrl("1790000000"),2)
            .equals(java.util.List.of("https://cdn.example.org/a.jpg","https://cdn.example.org/b.png")));
        check(ThreadListThumbnailRules.firstFiveChImages(multiple,board.threadUrl("1790000000"),4).size()==3);
        check(ThreadListThumbnailRules.firstFiveChImages(multiple,board.threadUrl("1790000000"),0).isEmpty());
        String linkedPreview = "<div class='post'><div class='message'>"
            + "<a href='https://cdn.example.org/full.jpg'><img src='https://cdn.example.org/preview.jpg'></a>"
            + "<a href='https://cdn.example.org/other.png'>other</a></div></div>";
        check(ThreadListThumbnailRules.firstFiveChImages(linkedPreview,board.threadUrl("1790000000"),3)
            .equals(java.util.List.of("https://cdn.example.org/full.jpg","https://cdn.example.org/other.png")));
        String secondOnly = "<div class='thread'><div class='post'><div class='message'>text</div></div>"
            + "<div class='post'><div class='message'><a href='https://cdn.example.org/second.png'>2</a></div></div></div>";
        check(ThreadListThumbnailRules.firstFiveChImage(secondOnly, board.threadUrl("1790000000")) == null);
        check("https://cdn.example.org/relative.webp".equals(
            ThreadListThumbnailRules.firstFiveChImage("<div class='post'><div class='message'>"
                + "<a href='https://cdn.example.org/relative.webp'>image</a></div></div>",board.threadUrl("1790000000"))));
        String edgeHtml="<div data-ng-target='body' data-ng-response-id='1'>"
                + "<span><span> https://i.imgur.com/IMje0I0.jpeg </span></span></div>"
                + "<div data-ng-target='body' data-ng-response-id='2'>https://cdn.example.org/second.png</div>";
        check("https://i.imgur.com/IMje0I0.jpeg".equals(
                ThreadListThumbnailRules.firstFiveChImage(edgeHtml,edge.threadUrl("1790000000"))));
        String edgeMultiple="<div data-ng-target='body' data-ng-response-id='1'>"
                + "https://i.imgur.com/IMje0I0.jpeg https://cdn.example.org/second.png</div>"
                + "<div data-ng-target='body' data-ng-response-id='2'>https://cdn.example.org/ignored.png</div>";
        check(ThreadListThumbnailRules.firstFiveChImages(edgeMultiple,edge.threadUrl("1790000000"),3)
                .equals(java.util.List.of("https://i.imgur.com/IMje0I0.jpeg","https://cdn.example.org/second.png")));
        check(ThreadListThumbnailRules.firstFiveChImage(
                "<div data-ng-target='body' data-ng-response-id='1'>No image</div>"
                + "<div data-ng-target='body' data-ng-response-id='2'>https://cdn.example.org/second.png</div>",
                edge.threadUrl("1790000000"))==null);
        check("https://cdn.example.org/opening.webp".equals(ThreadListThumbnailRules.firstFiveChImage(
                "<div data-ng-target='body' data-ng-response-id='1'>"
                + "<a href='https://cdn.example.org/opening.webp'>image</a></div>",edge.threadUrl("1790000000"))));
        String videoHtml="<div class='post'><div class='message'>"
                + "<a href='https://cdn.example.org/clip.mp4?token=123'>video</a>"
                + "<a href='https://youtu.be/AbC123xYz_9?t=30'>YouTube</a>"
                + "<a href='https://cdn.example.org/still.webp'>image</a>"
                + "<a href='http://localhost/blocked.mp4'>private</a></div></div>";
        check(ThreadListThumbnailRules.firstFiveChImages(videoHtml,board.threadUrl("1790000000"),2)
                .equals(java.util.List.of("https://cdn.example.org/clip.mp4?token=123",
                        "https://i.ytimg.com/vi/AbC123xYz_9/hqdefault.jpg")));
        check(ThreadListThumbnailRules.firstFiveChImages(videoHtml,board.threadUrl("1790000000"),4).size()==3);
        check(ThreadListThumbnailRules.openingTextMedia(
                "<iframe src='https://www.youtube.com/embed/AbC123xYz_9'></iframe>",
                "https://example.org/post/",1).equals(java.util.List.of(
                    "https://i.ytimg.com/vi/AbC123xYz_9/hqdefault.jpg")));
        check(ThreadListThumbnailRules.openingTextMedia(
                "<iframe data-src='https://www.youtube.com/embed/AbC123xYz_9'></iframe>",
                "https://example.org/post/",1).size()==1);
        check(ThreadListThumbnailRules.videoUrl("https://cdn.example.org/clip.webm"));
        check(!ThreadListThumbnailRules.videoUrl("https://cdn.example.org/playlist.m3u8"));
        check(!ThreadListThumbnailRules.videoUrl("https://127.0.0.1/private.mp4"));
        String poster="<video poster='https://cdn.example.org/poster.jpg'>"
                + "<source src='https://cdn.example.org/clip.webm' type='video/webm'></video>";
        check(ThreadListThumbnailRules.openingTextMedia(poster,"https://cdn.example.org/",4)
                .equals(java.util.List.of("https://cdn.example.org/poster.jpg")));
        check(ThreadListThumbnailRules.openingTextMedia("<video><source src='/clip.webm'></video>",
                "https://cdn.example.org/board/",2).equals(java.util.List.of("https://cdn.example.org/clip.webm")));
        check(ThreadListThumbnailRules.openingTextMedia("https://www.youtube.com/watch?v=AbC123xYz_9&amp;t=30 "
                +"https://cdn.example.org/clip.mov", "https://cdn.example.org/board/",2)
                .equals(java.util.List.of("https://i.ytimg.com/vi/AbC123xYz_9/hqdefault.jpg",
                        "https://cdn.example.org/clip.mov")));
        check(ThreadListThumbnailRules.openingTextMedia("https://www.youtube.com.evil.example/watch?v=AbC123xYz_9",
                "https://cdn.example.org/",1).isEmpty());
        System.out.println("PASS " + checks + " thumbnail source checks");
    }
}
