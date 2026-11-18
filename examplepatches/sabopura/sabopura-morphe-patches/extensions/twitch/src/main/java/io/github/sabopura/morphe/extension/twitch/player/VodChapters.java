package io.github.sabopura.morphe.extension.twitch.player;

import android.app.Dialog;
import android.content.Context;
import android.widget.TextView;

import io.github.sabopura.morphe.extension.twitch.chat.PublicApi;
import io.github.sabopura.morphe.extension.twitch.ui.Notice;
import io.github.sabopura.morphe.extension.twitch.ui.Ui;

import org.json.*;

import java.util.*;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

public final class VodChapters {
    public static void show(Context c) {
        String id = PlayerTools.vodId();
        if (!id.matches("[0-9]{1,20}")) {
            Notice.show(c, label("VODを開いてください", "Open a VOD first"));
            return;
        }
        Ui ui = Ui.of(c);
        TextView status = ui.text(c, label("チャプターを取得中…", "Loading chapters…"), 14, ui.secondary, false);
        Dialog wait = ui.modal(c, label("VODチャプター", "VOD chapters"), null, status,
                null, (Runnable) null, label("キャンセル", "Cancel"));
        Ui.show(wait, c);
        if (!PublicApi.submit(
                () -> {
                    try {
                        JSONObject body =
                                new JSONObject()
                                        .put(
                                                "query",
                                                "query($id:ID!){video(id:$id){moments(momentRequestType:VIDEO_CHAPTER_MARKERS,types:[GAME_CHANGE]){edges{node{positionMilliseconds"
                                                    + " description}}}}}")
                                        .put("variables", new JSONObject().put("id", id));
                        List<Chapter> chapters =
                                parse(new JSONObject(PublicApi.twitchMetadata(body.toString())));
                        PublicApi.UI.post(() -> {
                            if (!wait.isShowing()) return;
                            if (chapters.isEmpty()) {
                                status.setText(label("公開チャプターがありません", "No public chapters"));
                                return;
                            }
                            wait.dismiss();
                            showList(c, ui, id, chapters);
                        });
                    } catch (Exception e) {
                        PublicApi.UI.post(() -> {
                            if (wait.isShowing())
                                status.setText(label("チャプターを取得できません", "Unable to load chapters"));
                        });
                    }
                })) status.setText(label("取得待ちが多いため再度お試しください", "Please try again later"));
    }

    private static String clock(long millis) {
        long s = millis / 1000;
        return String.format(Locale.ROOT, "%d:%02d:%02d", s / 3600, s / 60 % 60, s % 60);
    }

    /** The chapter being played is the one marked in the list. */
    private static void showList(Context c, Ui ui, String id, List<Chapter> chapters) {
        long position = PlayerTools.position();
        int current = -1;
        for (int i = 0; i < chapters.size(); i++) if (chapters.get(i).millis <= position) current = i;
        String[] titles = new String[chapters.size()];
        for (int i = 0; i < titles.length; i++) {
            Chapter p = chapters.get(i);
            titles[i] = clock(p.millis) + "  " + p.title;
        }
        ui.choose(c, label("VODチャプター", "VOD chapters"), titles, current, picked -> {
            if (id.equals(PlayerTools.vodId()))
                PlayerTools.run(c, () -> PlayerTools.seek(chapters.get(picked).millis));
        });
    }

    public static List<Chapter> parse(JSONObject response) throws JSONException {
        if (response.has("errors")) throw new JSONException("Metadata API rejected query");
        List<Chapter> result = new ArrayList<>();
        JSONObject data = response.optJSONObject("data"),
                video = data == null ? null : data.optJSONObject("video"),
                moments = video == null ? null : video.optJSONObject("moments");
        JSONArray edges = moments == null ? null : moments.optJSONArray("edges");
        if (edges != null)
            for (int i = 0; i < edges.length() && i < 1000; i++) {
                JSONObject edge = edges.optJSONObject(i),
                        n = edge == null ? null : edge.optJSONObject("node");
                if (n == null) continue;
                long position = n.optLong("positionMilliseconds", -1);
                if (position >= 0)
                    result.add(new Chapter(position, n.optString("description", "")));
            }
        result.sort(Comparator.comparingLong(p -> p.millis));
        return result;
    }

    public static final class Chapter {
        public final long millis;
        public final String title;

        Chapter(long p, String t) {
            millis = p;
            title = t;
        }
    }
}
