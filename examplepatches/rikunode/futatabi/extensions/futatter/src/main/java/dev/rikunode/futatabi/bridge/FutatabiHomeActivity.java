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
public class FutatabiHomeActivity extends Activity {
    private static final String STORE = "futatabi_extension_private";
    private static final int CHOOSE_IMAGE = 12;
    private static final int MEBUKI_LOGIN = 13;
    private static final int AIMOGE_LOGIN = 14;
    private final ExecutorService io = Executors.newSingleThreadExecutor();
    private LinearLayout root;
    private EditText bodyField, deleteKeyField;
    private TextView notice, count;
    private String threadId = "";
    private String selectedReplyNumber = "";
    private final List<Uri> attached = new ArrayList<>();

    private static final class Response {
        final int status;
        final String body;
        Response(int status, String body) { this.status = status; this.body = body; }
    }

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        setTitle("futatabi");
        if (directReply()) {
            String board = getIntent().getStringExtra("board");
            String id = getIntent().getStringExtra("virtualId");
            if (id != null && id.matches("[0-9]{13}")) {
                if ("aimoge".equals(board)) {
                    String uuid = new BridgeIndex(this).threadUuid(id);
                    if (uuid != null) {
                        try { compose(UUID.fromString(uuid).toString()); return; }
                        catch (IllegalArgumentException ignored) { }
                    }
                } else if ("animanch".equals(board) &&
                        getSharedPreferences("futatabi_animanch_private", MODE_PRIVATE)
                                .getString("board." + id, null) != null) {
                    composeAnimanch(id);
                    return;
                }
            }
            startPage("投稿先を確認できませんでした");
            action("スレに戻る", this::finish);
            return;
        }
        home();
    }
    private boolean directReply() { return this instanceof ThreadReplyActivity; }

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
        // Use the same verified socket for the request; no reconnect or redirect may
        // send the local token or body to another process occupying the port.
        try (java.net.Socket socket = BridgeServer.connectVerified()) {
            String token = getSharedPreferences(STORE, MODE_PRIVATE).getString("local_token", "");
            if (!token.matches("[A-Za-z0-9_-]+")) throw new java.io.IOException("Invalid local token");
            byte[] bytes = payload == null ? new byte[0] : payload.toString().getBytes(StandardCharsets.UTF_8);
            String headers = method + " " + path + " HTTP/1.1\r\nHost: 127.0.0.1:18765\r\n" +
                    "X-Futatabi-Token: " + token + "\r\nConnection: close\r\n" +
                    (payload == null ? "" : "Content-Type: application/json\r\nContent-Length: " + bytes.length + "\r\n") + "\r\n";
            OutputStream out = socket.getOutputStream();
            out.write(headers.getBytes(StandardCharsets.US_ASCII));
            out.write(bytes);
            out.flush();
            InputStream in = new java.io.BufferedInputStream(socket.getInputStream());
            String first = BridgeServer.readLine(in, 2048);
            if (first == null || !first.matches("HTTP/1\\.1 [0-9]{3} .+")) throw new java.io.IOException("Invalid bridge response");
            int code = Integer.parseInt(first.substring(9, 12));
            boolean ended = false;
            for (int i = 0; i < 50; i++) {
                String line = BridgeServer.readLine(in, 8192);
                if (line == null) throw new java.io.IOException("Incomplete bridge headers");
                if (line.isEmpty()) { ended = true; break; }
            }
            if (!ended) throw new java.io.IOException("Too many bridge headers");
            byte[] content = AimogeWriteClient.bounded(in, 2_000_000);
            return new Response(code, new String(content, StandardCharsets.UTF_8));
        }
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
                updateNotice("あいもげ：" + (loggedIn ? "ログイン中" : "未ログイン") + "\nめぶきちゃんねる：" + state.optString("mebukiSessionState", "UNVERIFIED"));
            } catch (Exception ex) { updateNotice("状態を確認できませんでした"); }
        });
        action("追加板の配色："+(BridgePalette.LIGHT.equals(BridgePalette.get(this))?"ライト":"ダーク"),()->{
            new android.app.AlertDialog.Builder(this).setTitle("追加板の配色")
                    .setSingleChoiceItems(new String[]{"ダーク（既定）","ライト"},
                            BridgePalette.LIGHT.equals(BridgePalette.get(this))?1:0,(dialog,which)->{
                        if(BridgePalette.save(this,which==0?BridgePalette.DARK:BridgePalette.LIGHT)){
                            dialog.dismiss();home();
                        }else updateNotice("配色を保存できませんでした");
                    }).setNegativeButton("キャンセル",null).show();
        });
        if (CacheMaintenanceProvider.lastReport() != null) {
            action("キャッシュ診断（起動時）", () -> new android.app.AlertDialog.Builder(this)
                    .setTitle("キャッシュ診断（起動時）")
                    .setMessage(CacheMaintenanceProvider.lastReport())
                    .setPositiveButton("閉じる", null).show());
        }
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
        addText("めぶきちゃんねる：おためしカタログは5分遅延。新規スレ・添付は未対応。");
        action("めぶきちゃんねる：X／Discordログイン（本人操作）", () ->
                startActivityForResult(new Intent(this, MebukiLoginActivity.class), MEBUKI_LOGIN));
        action("めぶきちゃんねる：本文を読む", this::mebukiReaderPicker);
        action("めぶきちゃんねる：一覧からレス投稿", () -> threadPicker("mebuki"));
        action("\u3081\u3076\u304d\uff1a\u6295\u7a3f\u8a3a\u65ad",this::mebukiPostDiagnostic);
    }

    private void mebukiPostDiagnostic() {
        startPage("\u3081\u3076\u304d\uff1a\u6700\u5f8c\u306e\u6295\u7a3f\u8a3a\u65ad");
        addText("\u5fdc\u7b54\u306e\u7a2e\u985e\u3068\u7167\u5408\u7d50\u679c\u306e\u307f\u3002Cookie\u5024\u30fb\u672c\u6587\u30fbID\u306f\u4fdd\u5b58\u3057\u307e\u305b\u3093\u3002");
        addText(MebukiPostDiagnostic.report(this));
        action("\u66f4\u65b0",this::mebukiPostDiagnostic);
        action("\u30db\u30fc\u30e0\u3078",this::home);
    }

    private void login() {
        remote("あいもげの認証URLを作成", "POST", "/ext/login/aimoge/start",
                new JSONObject(), result -> {
                    if (result.status != 200) {
                        updateNotice("ログイン開始失敗 HTTP " + result.status + ": " + PostPresentation.error(result.body));
                        return;
                    }
                    try {
                        String url = new JSONObject(result.body).getString("authorizationUrl");
                        if (AimogeLoginFlow.page(url) != AimogeLoginFlow.Page.OFFICIAL)
                            throw new IllegalArgumentException("Invalid auth URL");
                        Intent login = new Intent(this, AimogeLoginActivity.class);
                        login.putExtra(AimogeLoginActivity.AUTH_URL, url);
                        startActivityForResult(login, AIMOGE_LOGIN);
                    } catch (Exception ex) { updateNotice("認証URLを開けませんでした"); }
                });
    }

    private void mebukiReaderPicker() {
        startPage("めぶきちゃんねる • 本文を読む");
        action("戻る", this::home);
        final LinearLayout page = root;
        remote("カタログを取得", "GET", "/ext/threads?board=mebuki", null, result -> {
            if (root != page) return;
            if (result.status != 200) { updateNotice("HTTP "+result.status); return; }
            try {
                JSONArray threads = new JSONObject(result.body).getJSONArray("threads");
                updateNotice("おためしカタログでスレを選ぶ（本文は認証付き取得）");
                for(int i=0;i<threads.length();i++) {
                    JSONObject entry=threads.getJSONObject(i);
                    String id=entry.getString("id");
                    if(!id.matches("[0-9]{13}")) continue;
                    action(PostPresentation.excerpt(entry.optString("title"))+" ("+entry.optInt("replies")+")", () ->
                            startActivity(new Intent(this,MebukiReaderActivity.class).putExtra(MebukiReaderActivity.ID,id)));
                }
            } catch(Exception ignored) { updateNotice("一覧を解析できません"); }
        });
    }

    private void threadPicker(String board) {
        startPage(("animanch".equals(board) ? "あにまん" :
                "mebuki".equals(board) ? "めぶきちゃんねる" : "あいもげ") + " • 返信するスレを選ぶ");
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

    private void replySelector(String board, String id) {
        selectedReplyNumber = "";
        if (id.isEmpty()) return;
        final LinearLayout page = root;
        TextView title = addText("\u8fd4\u4fe1\u5148\u30b9\u30ec\u3092\u53d6\u5f97\u4e2d...");
        TextView target = addText("\u30b9\u30ec\u5168\u4f53\u3078\u8fd4\u4fe1");
        final JSONArray[] options = {null};
        Button choose = action("\u8fd4\u4fe1\u5148\u306e\u30ec\u30b9\u3092\u9078\u3076", () -> {
            JSONArray items = options[0];
            if (items == null) return;
            String[] labels = new String[items.length()+1];
            labels[0] = "\u30b9\u30ec\u5168\u4f53\u3078\u8fd4\u4fe1";
            for (int i=0; i<items.length(); i++) {
                JSONObject item = items.optJSONObject(i);
                labels[i+1] = ("aimoge".equals(board) ? "No." + item.optString("number") + " / " : "")
                        + "\u30ec\u30b9 " + item.optInt("seq") + "\n" + item.optString("excerpt");
            }
            new android.app.AlertDialog.Builder(this).setTitle("\u8fd4\u4fe1\u5148\u3092\u9078\u629e")
                    .setItems(labels, (dialog, index) -> {
                        selectedReplyNumber = index == 0 ? "" : items.optJSONObject(index-1).optString("number");
                        target.setText(index == 0 ? labels[index] : labels[index] + "\n"
                                + PostPresentation.quote(board, selectedReplyNumber, "").trim());
                    }).setNegativeButton("\u30ad\u30e3\u30f3\u30bb\u30eb", null).show();
        });
        choose.setEnabled(false);
        remote("\u8fd4\u4fe1\u5148\u3092\u53d6\u5f97", "GET", "/ext/reply-targets?board=" + board + "&id=" + id, null, result -> {
            if (root != page) return;
            if (result.status != 200) {
                title.setText("\u30b9\u30ec\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f");
                updateNotice("HTTP " + result.status + " " + PostPresentation.error(result.body));
                return;
            }
            try {
                JSONObject data = new JSONObject(result.body);
                String name = data.optString("title");
                title.setText("\u8fd4\u4fe1\u5148\u30b9\u30ec: " + (name.isEmpty() ? "\u672c\u6587\u306a\u3057" : name));
                options[0] = data.getJSONArray("targets");
                choose.setEnabled(options[0].length() > 0);
                updateNotice("");
            } catch (Exception ex) { updateNotice("\u8fd4\u4fe1\u5148\u30c7\u30fc\u30bf\u89e3\u6790\u5931\u6557"); }
        });
    }

    private void showPostSuccess(String board, String raw, String expectedThread) {
        String message;
        try {
            message = PostPresentation.completion(board, raw, expectedThread);
            if (message == null) {
                startPage("\u6295\u7a3f\u53d7\u7406");
                addText("\u6295\u7a3f\u306f\u53d7\u7406\u3055\u308c\u307e\u3057\u305f\u304c\u3001\u516c\u958b\u8868\u793a\u306f\u672a\u78ba\u8a8d\u3067\u3059\u3002");
                action("\u623b\u308b", directReply() ? this::finish : this::home);
                return;
            }
        } catch (Exception ex) {
            startPage("\u6295\u7a3f\u5fdc\u7b54\u3092\u53d7\u4fe1");
            addText("\u7d50\u679c\u3092\u89e3\u6790\u3067\u304d\u307e\u305b\u3093\u3002\u518d\u9001\u305b\u305a\u30b9\u30ec\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002");
            action("\u623b\u308b", directReply() ? this::finish : this::home);
            return;
        }
        if (directReply()) {
            android.widget.Toast.makeText(this, message + "\u3002\u30b9\u30ec\u3092\u66f4\u65b0\u3057\u3066\u304f\u3060\u3055\u3044", android.widget.Toast.LENGTH_LONG).show();
            finish();
        } else {
            startPage(message);
            action("\u30db\u30fc\u30e0\u3078", this::home);
        }
    }

    private void compose(String replyTo) {
        threadId = replyTo;
        attached.clear();
        startPage(replyTo.isEmpty() ? "あいもげ • 新規スレ" : "あいもげ • レス投稿");
        replySelector("aimoge", replyTo);
        action("戻る", directReply() ? this::finish : replyTo.isEmpty() ? this::home : () -> threadPicker("aimoge"));
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
            String text = PostPresentation.quote("aimoge", selectedReplyNumber, bodyField.getText().toString());
            if (bodyField.getText().length() == 0 || text.codePointCount(0, text.length()) > 4000) {
                updateNotice("本文を1〜4,000字で入力してください");
                return;
            }
            final String deleteKey = deleteKeyField.getText().toString();
            if (deleteKey.isEmpty() || deleteKey.length() > 64) {
                updateNotice("削除キーは1〜64文字で入力してください");
                return;
            }
            if (replyTo.isEmpty() && attached.isEmpty()) {
                updateNotice("新規スレには画像が1枚必要です");
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
                            showPostSuccess("aimoge", result.body, replyTo);
                        } else updateNotice("投稿失敗 HTTP " + result.status + ": " + PostPresentation.error(result.body));
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
        if (code == MEBUKI_LOGIN || code == AIMOGE_LOGIN) {
            home(); // Revalidate the saved session when the owner returns.
            return;
        }
        if (code == CHOOSE_IMAGE && result == RESULT_OK && data != null && data.getData() != null) {
            attached.add(data.getData());
            updateNotice("画像を" + attached.size() + "件選択しました");
        }
    }

    private void composeMebuki(String replyTo) {
        startPage("めぶきちゃんねる • レス投稿（契約検収前）");
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
            remote("めぶきちゃんねるへレス投稿", "POST", "/ext/mebuki/reply", body, result -> {
                if (result.status == 201) {
                    startPage("\u6295\u7a3f\u3092\u78ba\u8a8d\u3057\u307e\u3057\u305f");
                    action("\u30db\u30fc\u30e0\u3078", this::home);
                } else if (result.status == 202) {
                    startPage("\u6295\u7a3f\u7d50\u679c\u672a\u78ba\u5b9a");
                    addText("\u518d\u6295\u7a3f\u305b\u305a\u30b9\u30ec\u3092\u66f4\u65b0\u3057\u3066\u6295\u7a3f\u7d50\u679c\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044\u3002");
                    action("\u30db\u30fc\u30e0\u3078", this::home);
                } else updateNotice("レス送信できませんでした HTTP " + result.status);
            });
        });
    }

    private void composeAnimanch(String replyTo) {
        attached.clear();
        startPage(replyTo.isEmpty() ? "あにまん • 新規スレ" : "あにまん • レス投稿");
        replySelector("animanch", replyTo);
        action("戻る", directReply() ? this::finish : replyTo.isEmpty() ? this::home : () -> threadPicker("animanch"));
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
            String text = PostPresentation.quote("animanch", selectedReplyNumber, body.getText().toString());
            if (body.getText().length() == 0 || text.length() > 1000) {
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
                            showPostSuccess("animanch", result.body, replyTo);
                        } else updateNotice("投稿失敗 HTTP " + result.status + ": " + PostPresentation.error(result.body));
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
