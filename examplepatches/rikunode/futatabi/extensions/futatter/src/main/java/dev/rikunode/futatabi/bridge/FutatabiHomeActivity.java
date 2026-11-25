package dev.rikunode.futatabi.bridge;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.graphics.Color;
import android.graphics.Typeface;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Self-contained Android UI; does not modify Futatter's existing Flutter screens. */
public final class FutatabiHomeActivity extends Activity {
    private static final String STORE = "futatabi_extension_private";
    private static final int CHOOSE_IMAGE = 12;
    private static final int MEBUKI_LOGIN = 13;
    private final ExecutorService io = Executors.newSingleThreadExecutor();
    private LinearLayout root;
    private EditText bodyField, deleteKeyField;
    private TextView notice, count;
    private String threadId = "";
    private final List<Uri> attached = new ArrayList<>();

    private static final class Response {
        final int status;
        final String body;
        Response(int status, String body) { this.status = status; this.body = body; }
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        setTitle("futatabi");
        home();
    }
    @Override protected void onDestroy() {
        io.shutdownNow();
        super.onDestroy();
    }

    private void startPage(String heading) {
        ScrollView scroll = new ScrollView(this);
        root = new LinearLayout(this);
        root.setPadding(dp(18), dp(20), dp(18), dp(28));
        root.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(root);
        setContentView(scroll);
        TextView title = new TextView(this);
        title.setText(heading);
        title.setTextSize(23);
        title.setTextColor(Color.rgb(22, 35, 50));
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        root.addView(title);
        notice = addText("");
    }
    private int dp(int v) { return Math.round(getResources().getDisplayMetrics().density * v); }

    private TextView addText(String label) {
        TextView text = new TextView(this);
        text.setText(label);
        text.setTextColor(Color.DKGRAY);
        text.setTextSize(15);
        text.setPadding(0, dp(9), 0, dp(9));
        root.addView(text);
        return text;
    }

    private Button action(String title, Runnable onTap) {
        Button button = new Button(this);
        button.setText(title);
        root.addView(button);
        button.setOnClickListener(v -> onTap.run());
        return button;
    }

    private EditText input(String hint, String defaultValue, boolean multi) {
        EditText text = new EditText(this);
        text.setHint(hint);
        text.setText(defaultValue);
        if (multi) {
            text.setSingleLine(false);
            text.setMinLines(5);
            text.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        } else text.setSingleLine(true);
        root.addView(text);
        return text;
    }

    private void updateNotice(String value) {
        if (notice != null) notice.setText(value);
    }

    private void remote(String label, String method, String path, JSONObject payload,
                        java.util.function.Consumer<Response> done) {
        updateNotice(label + "…");
        io.execute(() -> {
            Response result;
            try { result = invoke(method, path, payload); }
            catch (Exception ex) { result = new Response(503, "通信エラー: " + ex.getClass().getSimpleName()); }
            final Response value = result;
            runOnUiThread(() -> {
                if (isFinishing() || isDestroyed()) return;
                done.accept(value);
            });
        });
    }

    private Response invoke(String method, String path, JSONObject payload) throws Exception {
        URL url = new URL("http://127.0.0.1:18765" + path);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setConnectTimeout(2500);
        conn.setReadTimeout(25000);
        conn.setRequestMethod(method);
        conn.setInstanceFollowRedirects(false);
        String token = getSharedPreferences(STORE, MODE_PRIVATE).getString("local_token", "");
        conn.setRequestProperty("X-Futatabi-Token", token);
        if (payload != null) {
            byte[] bytes = payload.toString().getBytes(StandardCharsets.UTF_8);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);
            conn.setFixedLengthStreamingMode(bytes.length);
            try (OutputStream out = conn.getOutputStream()) { out.write(bytes); }
        }
        try {
            int code = conn.getResponseCode();
            InputStream stream = code < 400 ? conn.getInputStream() : conn.getErrorStream();
            if (stream == null) return new Response(code, "");
            try (InputStream in = stream) {
                byte[] content = AimogeWriteClient.bounded(in, 2_000_000);
                return new Response(code, new String(content, StandardCharsets.UTF_8));
            }
        } finally { conn.disconnect(); }
    }

    private void home() {
        startPage("futatabi • 投稿");
        addText("通常のふたったーの閲覧画面・ふたば板の投稿には干渉しません。");
        remote("ログイン状態を取得", "GET", "/ext/status", null, result -> {
            if (result.status != 200) {
                updateNotice("Bridge接続不可: HTTP " + result.status);
                return;
            }
            try {
                JSONObject state = new JSONObject(result.body);
                boolean loggedIn = state.optBoolean("aimoge");
                updateNotice("あいもげ：" + (loggedIn ? "ログイン中" : "未ログイン") + "\nめぶき：" + state.optString("mebukiSessionState", "UNVERIFIED"));
            } catch (Exception ex) { updateNotice("状態を確認できませんでした"); }
        });
        addText("あいもげ");
        action("新しいスレを立てる", () -> compose(""));
        action("スレ一覧から返信", () -> threadPicker("aimoge"));
        action("ログイン（PKCE）", this::login);
        action("ログアウト", () -> remote("ログアウト", "POST",
                "/ext/login/aimoge/logout", new JSONObject(), result -> home()));
        action("自分の投稿履歴", this::history);
        addText("あにまん（ログイン画面なし／PHPセッションを保持）");
        action("あにまん：新規スレ", () -> composeAnimanch(""));
        action("あにまん：スレ一覧から返信", () -> threadPicker("animanch"));
        addText("めぶき：おためしカタログは5分遅延。新規スレ・添付は未対応。");
        action("めぶき：X／Discordログイン（本人操作）", () ->
                startActivityForResult(new Intent(this, MebukiLoginActivity.class), MEBUKI_LOGIN));
        action("めぶき：一覧からレス投稿", () -> threadPicker("mebuki"));
    }

    private void login() {
        remote("あいもげの認証URLを作成", "POST", "/ext/login/aimoge/start",
                new JSONObject(), result -> {
                    if (result.status != 200) {
                        updateNotice("ログイン開始失敗 HTTP " + result.status + ": " + result.body);
                        return;
                    }
                    try {
                        String url = new JSONObject(result.body).getString("authorizationUrl");
                        if (!url.startsWith("https://")) throw new IllegalArgumentException("Invalid auth URL");
                        startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
                        updateNotice("ブラウザの承認後、この画面に戻ってください。");
                    } catch (Exception ex) { updateNotice("認証URLを開けませんでした"); }
                });
    }

    private void threadPicker(String board) {
        startPage(("animanch".equals(board) ? "あにまん" :
                "mebuki".equals(board) ? "めぶき（おためし／遅延）" : "あいもげ") + " • 返信するスレを選ぶ");
        action("戻る", this::home);
        remote("スレ一覧を取得", "GET", "/ext/threads?board=" + board, null, result -> {
            if (result.status != 200) { updateNotice("取得失敗 HTTP " + result.status); return; }
            updateNotice("返信先を選択");
            try {
                JSONArray threads = new JSONObject(result.body).getJSONArray("threads");
                for (int i = 0; i < threads.length(); i++) {
                    JSONObject entry = threads.getJSONObject(i);
                    String id = entry.getString("id");
                    if ("aimoge".equals(board)) id = UUID.fromString(id).toString();
                    else if (!id.matches("[0-9]{13}")) continue;
                    String title = entry.optString("title", "スレ");
                    if (title.length() > 90) title = title.substring(0, 90);
                    final String selection = id;
                    action(title + " (レス " + entry.optInt("replies") + ")",
                            () -> { if ("animanch".equals(board)) composeAnimanch(selection);
                                else if ("mebuki".equals(board)) composeMebuki(selection);
                                else compose(selection); });
                }
            } catch (Exception ex) { updateNotice("スレ一覧を解析できませんでした"); }
        });
    }

    private void compose(String replyTo) {
        threadId = replyTo;
        attached.clear();
        startPage(replyTo.isEmpty() ? "あいもげ • 新規スレ" : "あいもげ • レス投稿");
        action("戻る", replyTo.isEmpty() ? this::home : () -> threadPicker("aimoge"));
        addText("本文（最大4,000字）");
        bodyField = input("本文", "", true);
        count = addText("0 / 4000");
        bodyField.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence s,int start,int c,int a) {}
            public void onTextChanged(CharSequence s,int start,int before,int c) {
                count.setText(s.toString().codePointCount(0,s.length()) + " / 4000");
            }
            public void afterTextChanged(Editable s) {}
        });
        addText("削除キー（投稿ごとに保存します）");
        deleteKeyField = input("削除キー", randomKey(), false);
        final int maxFiles = replyTo.isEmpty() ? 1 : 3;
        TextView files = addText("添付：0 / " + maxFiles);
        action("画像を追加", () -> {
            if (attached.size() >= maxFiles) { updateNotice("添付上限に達しました"); return; }
            Intent pick = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            pick.addCategory(Intent.CATEGORY_OPENABLE);
            pick.setType("image/*");
            startActivityForResult(pick, CHOOSE_IMAGE);
        });
        action("投稿内容を送信", () -> {
            String text = bodyField.getText().toString();
            if (text.isEmpty() || text.codePointCount(0, text.length()) > 4000) {
                updateNotice("本文を1〜4,000字で入力してください");
                return;
            }
            final String deleteKey = deleteKeyField.getText().toString();
            if (deleteKey.isEmpty() || deleteKey.length() > 64) {
                updateNotice("削除キーは1〜64文字で入力してください");
                return;
            }
            final List<Uri> picks = new ArrayList<>(attached);
            updateNotice("送信内容を準備中…");
            io.execute(() -> {
                try {
                    JSONObject payload = new JSONObject();
                    payload.put("body", text);
                    payload.put("deleteKey", deleteKey);
                    if (!replyTo.isEmpty()) payload.put("threadId", replyTo);
                    JSONArray attachments = new JSONArray();
                    int totalSize = 0;
                    for (Uri uri : picks) {
                        byte[] bytes;
                        try (InputStream stream = getContentResolver().openInputStream(uri)) {
                            if (stream == null) throw new IllegalArgumentException("画像を開けません");
                            bytes = AimogeWriteClient.bounded(stream, 20_971_520);
                        }
                        totalSize += bytes.length;
                        if (totalSize > 20_971_520) throw new IllegalArgumentException("添付の合計は20MiB以下");
                        String mime = getContentResolver().getType(uri);
                        JSONObject file = new JSONObject();
                        file.put("mime", mime == null ? "application/octet-stream" : mime);
                        file.put("name", "attachment");
                        file.put("base64", android.util.Base64.encodeToString(bytes, android.util.Base64.NO_WRAP));
                        attachments.put(file);
                    }
                    if (attachments.length() > 0) payload.put("attachments", attachments);
                    Response result = invoke("POST", "/ext/aimoge/post", payload);
                    runOnUiThread(() -> {
                        if (isFinishing() || isDestroyed()) return;
                        if (result.status == 201) {
                            startPage("投稿成功");
                            addText(result.body);
                            action("ホームへ", this::home);
                        } else updateNotice("投稿失敗 HTTP " + result.status + ": " + result.body);
                    });
                } catch (Exception ex) {
                    runOnUiThread(() -> updateNotice("投稿準備失敗: " + ex.getMessage()));
                }
            });
        });
        addText(replyTo.isEmpty() ? "スレ立て後60秒のクールダウン・1時間60スレまで。"
                : "レス送信後10秒のクールダウン。");
    }

    @Override protected void onActivityResult(int code, int result, Intent data) {
        super.onActivityResult(code, result, data);
        if (code == MEBUKI_LOGIN) {
            home(); // Revalidate the saved session when the owner returns.
            return;
        }
        if (code == CHOOSE_IMAGE && result == RESULT_OK && data != null && data.getData() != null) {
            attached.add(data.getData());
            updateNotice("画像を" + attached.size() + "件選択しました");
        }
    }

    private void composeMebuki(String replyTo) {
        startPage("めぶき • レス投稿（契約検収前）");
        action("戻る", () -> threadPicker("mebuki"));
        addText("おためしカタログのスレです。実サイト側での返信可否は本人検収待ち。");
        final EditText content = input("本文（最大5,000文字／100行）", "", true);
        final EditText parent = input("返信先メッセージID（任意）", "", false);
        final CheckBox username = new CheckBox(this);
        username.setText("投稿者IDを表示");
        root.addView(username);
        final CheckBox threadOwner = new CheckBox(this);
        threadOwner.setText("スレ主表示");
        root.addView(threadOwner);
        action("レス投稿を送信（本人検収向け）", () -> {
            String text = content.getText().toString();
            if (text.isEmpty() || text.codePointCount(0, text.length()) > 5000 ||
                    text.split("\\r?\\n", -1).length > 100) {
                updateNotice("本文は1〜5,000文字・100行以内にしてください");
                return;
            }
            JSONObject body = new JSONObject();
            try {
                body.put("threadId", replyTo);
                body.put("content", text);
                if (parent.getText().length() > 0)
                    body.put("replyToId", parent.getText().toString());
                body.put("showUsername", username.isChecked());
                body.put("showThreadOwner", threadOwner.isChecked());
            } catch (Exception ex) { updateNotice("入力内容を作成できませんでした"); return; }
            remote("めぶきへレス投稿", "POST", "/ext/mebuki/reply", body, result -> {
                if (result.status == 202) {
                    startPage("送信応答を受信・成功未確定");
                    addText("サーバーから応答がありましたが、投稿成功の正式な判定は未検証です。");
                    action("ホームへ", this::home);
                } else updateNotice("レス送信できませんでした HTTP " + result.status);
            });
        });
    }

    private void composeAnimanch(String replyTo) {
        attached.clear();
        startPage(replyTo.isEmpty() ? "あにまん • 新規スレ" : "あにまん • レス投稿");
        action("戻る", replyTo.isEmpty() ? this::home : () -> threadPicker("animanch"));
        final EditText title = replyTo.isEmpty() ? input("スレタイトル", "", false) : null;
        final EditText category = replyTo.isEmpty() ? input("カテゴリID（掲示板のカテゴリ番号）", "", false) : null;
        final EditText name = input("名前（省略可）", "", false);
        final EditText body = input("本文（1,000字まで）", "", true);
        addText(replyTo.isEmpty() ? "新規スレには画像が必須です。" : "レスは画像なしでも投稿できます。");
        action("画像を1件選ぶ", () -> {
            Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            picker.addCategory(Intent.CATEGORY_OPENABLE);
            picker.setType("image/*");
            startActivityForResult(picker, CHOOSE_IMAGE);
        });
        action("あにまんへ送信", () -> {
            String text = body.getText().toString();
            if (text.isEmpty() || text.length() > 1000) {
                updateNotice("本文は1〜1,000字で入力してください");
                return;
            }
            if (replyTo.isEmpty() &&
                    (title.getText().length() == 0 || category.getText().length() == 0 || attached.isEmpty())) {
                updateNotice("新規スレにはタイトル・カテゴリ・画像が必須です");
                return;
            }
            final List<Uri> files = new ArrayList<>(attached);
            final String textValue = text;
            final String titleValue = title == null ? "" : title.getText().toString();
            final String categoryValue = category == null ? "" : category.getText().toString();
            final String nameValue = name.getText().toString();
            updateNotice("送信内容を準備中…");
            io.execute(() -> {
                try {
                    JSONObject payload = new JSONObject();
                    payload.put("threadId", replyTo);
                    payload.put("title", titleValue);
                    payload.put("category", categoryValue);
                    payload.put("name", nameValue);
                    payload.put("body", textValue);
                    JSONArray imageArray = new JSONArray();
                    if (!files.isEmpty()) {
                        Uri picked = files.get(0);
                        byte[] bytes;
                        try (InputStream stream = getContentResolver().openInputStream(picked)) {
                            if (stream == null) throw new IllegalArgumentException("画像が読めません");
                            bytes = AimogeWriteClient.bounded(stream, 8_000_000);
                        }
                        JSONObject file = new JSONObject();
                        String type = getContentResolver().getType(picked);
                        file.put("mime", type == null ? "" : type);
                        file.put("name", "image.jpg");
                        file.put("base64", android.util.Base64.encodeToString(bytes, android.util.Base64.NO_WRAP));
                        imageArray.put(file);
                    }
                    if (imageArray.length() > 0) payload.put("attachments", imageArray);
                    Response result = invoke("POST", "/ext/animanch/post", payload);
                    runOnUiThread(() -> {
                        if (isFinishing() || isDestroyed()) return;
                        if (result.status == 201) {
                            startPage("あにまん • 投稿完了");
                            addText(result.body);
                            action("ホームへ", this::home);
                        } else updateNotice("投稿失敗 HTTP " + result.status + ": " + result.body);
                    });
                } catch (Exception ex) {
                    runOnUiThread(() -> updateNotice("送信準備失敗: " + ex.getMessage()));
                }
            });
        });
    }

    private String randomKey() {
        byte[] b = new byte[24];
        new SecureRandom().nextBytes(b);
        return android.util.Base64.encodeToString(b,
                android.util.Base64.URL_SAFE | android.util.Base64.NO_WRAP | android.util.Base64.NO_PADDING);
    }

    private void history() {
        startPage("自分の投稿履歴");
        action("戻る", this::home);
        SharedPreferences prefs = getSharedPreferences(STORE, MODE_PRIVATE);
        int count = 0;
        for (java.util.Map.Entry<String,?> entry : prefs.getAll().entrySet()) {
            if (!entry.getKey().startsWith("history_")) continue;
            try {
                JSONObject obj = new JSONObject(String.valueOf(entry.getValue()));
                JSONObject result = obj.getJSONObject("result");
                addText("投稿結果: " + result.toString() +
                        "\n削除キー: " + obj.optString("deleteKey", ""));
                count++;
            } catch (Exception ignored) {}
        }
        if (count == 0) addText("まだ投稿履歴がありません。");
    }
}
