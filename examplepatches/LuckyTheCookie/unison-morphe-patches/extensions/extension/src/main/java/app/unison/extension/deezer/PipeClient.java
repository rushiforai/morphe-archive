package app.unison.extension.deezer;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

/** Petit client GraphQL pour l'API « pipe » de Deezer, avec la session déjà ouverte dans l'app. */
final class PipeClient {
    static final String NO_TOKEN = "no_token";

    private static final String ENDPOINT = "https://pipe.deezer.com/api";

    private static final String Q_ME =
        "query UnisonMe { me { __typename id rawPlaylists { __typename id } } }";
    private static final String Q_PLAYLISTS =
        "query UnisonPlaylists($ids: [String!]!) { playlistsByIds(ids: $ids) { __typename id title "
            + "estimatedTracksCount isCollaborative isPrivate owner { __typename id name } } }";
    private static final String M_ADD =
        "mutation UnisonAddTracks($input: PlaylistAddTracksMutationInput!) { addTracksToPlaylist(input: $input) { "
            + "__typename ... on PlaylistAddTracksOutput { addedTrackIds duplicatedTrackIds beyondLimitTrackIds } "
            + "... on PlaylistAddTracksError { isNotAllowed } } }";

    private PipeClient() {}

    /** Playlists de l'utilisateur (les siennes + les collaboratives) : [{id,title,count,collaborative}]. */
    static JSONArray playlists() throws Exception {
        JSONObject me = request("UnisonMe", Q_ME, new JSONObject()).getJSONObject("me");
        String myId = me.getString("id");
        JSONArray raw = me.getJSONArray("rawPlaylists");
        JSONArray ids = new JSONArray();
        for (int i = 0; i < raw.length() && i < 300; i++) ids.put(raw.getJSONObject(i).getString("id"));
        JSONArray out = new JSONArray();
        if (ids.length() == 0) return out;
        JSONObject data = request("UnisonPlaylists", Q_PLAYLISTS, new JSONObject().put("ids", ids));
        JSONArray list = data.getJSONArray("playlistsByIds");
        for (int i = 0; i < list.length(); i++) {
            JSONObject p = list.optJSONObject(i);
            if (p == null) continue;
            JSONObject owner = p.optJSONObject("owner");
            boolean mine = owner != null && myId.equals(owner.optString("id"));
            boolean collab = p.optBoolean("isCollaborative", false);
            if (!mine && !collab) continue; // on ne peut écrire que dans les siennes ou les collaboratives
            out.put(new JSONObject()
                .put("id", p.getString("id"))
                .put("title", p.optString("title"))
                .put("count", p.optInt("estimatedTracksCount"))
                .put("collaborative", collab));
        }
        return out;
    }

    /** Ajoute des titres à une playlist : {added,duplicated,beyondLimit,notAllowed}. */
    static JSONObject addTracks(String playlistId, JSONArray trackIds) throws Exception {
        JSONObject input = new JSONObject().put("playlistId", playlistId).put("trackIds", trackIds);
        JSONObject r = request("UnisonAddTracks", M_ADD, new JSONObject().put("input", input))
            .getJSONObject("addTracksToPlaylist");
        JSONObject out = new JSONObject();
        out.put("notAllowed", r.optBoolean("isNotAllowed", false));
        out.put("added", r.optJSONArray("addedTrackIds") != null ? r.getJSONArray("addedTrackIds") : new JSONArray());
        out.put("duplicated", r.optJSONArray("duplicatedTrackIds") != null ? r.getJSONArray("duplicatedTrackIds") : new JSONArray());
        out.put("beyondLimit", r.optJSONArray("beyondLimitTrackIds") != null ? r.getJSONArray("beyondLimitTrackIds") : new JSONArray());
        return out;
    }

    private static JSONObject request(String operation, String query, JSONObject variables) throws Exception {
        String token = JwtStore.valid();
        if (token == null) throw new IllegalStateException(NO_TOKEN);
        JSONObject body = new JSONObject().put("operationName", operation).put("query", query).put("variables", variables);

        HttpURLConnection c = (HttpURLConnection) new URL(ENDPOINT).openConnection();
        try {
            c.setConnectTimeout(8_000);
            c.setReadTimeout(12_000);
            c.setRequestMethod("POST");
            c.setDoOutput(true);
            c.setRequestProperty("Content-Type", "application/json");
            c.setRequestProperty("Accept", "application/json");
            c.setRequestProperty("Authorization", "Bearer " + token);
            try (OutputStream os = c.getOutputStream()) {
                os.write(body.toString().getBytes("UTF-8"));
            }
            int code = c.getResponseCode();
            String text = read(code >= 400 ? c.getErrorStream() : c.getInputStream());
            if (code == 401 || code == 403) throw new IllegalStateException(NO_TOKEN);
            if (code >= 400) throw new IllegalStateException("http_" + code);
            JSONObject json = new JSONObject(text);
            JSONArray errors = json.optJSONArray("errors");
            if (errors != null && errors.length() > 0 && json.optJSONObject("data") == null) {
                throw new IllegalStateException("graphql: " + errors.getJSONObject(0).optString("message"));
            }
            return json.getJSONObject("data");
        } finally {
            c.disconnect();
        }
    }

    private static String read(InputStream in) throws Exception {
        if (in == null) return "";
        try (InputStream is = in; ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buf = new byte[8192];
            int n;
            while ((n = is.read(buf)) > 0) out.write(buf, 0, n);
            return out.toString("UTF-8");
        }
    }
}
