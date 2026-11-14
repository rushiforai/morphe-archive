package app.zeta.extension.hermes;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;

/**
 * Hermes型 Memory 管理エンジン
 * 
 * - グローバル ユーザープロファイル (USER.md 相当)
 * - キャラクター別 永続記憶 (MEMORY.md 相当)
 * - ON / OFF 切り替え機能
 * - メッセージ送信時の自動コンテキスト注入
 */
public class HermesMemoryManager {
    private static final String TAG = "HermesMemoryManager";
    private static final HermesMemoryManager INSTANCE = new HermesMemoryManager();

    private static final String PREFS_NAME = "zeta_hermes_prefs";
    private static final String KEY_ENABLED = "memory_enabled";
    private static final String KEY_USER_PROFILE = "global_user_profile";

    private Context context;
    private SharedPreferences prefs;
    private File hermesDir;

    public static HermesMemoryManager getInstance() {
        return INSTANCE;
    }

    public synchronized void init(Context context) {
        if (this.context != null) return;
        this.context = context.getApplicationContext();
        this.prefs = this.context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);

        // 内部ストレージの専用ディレクトリ
        this.hermesDir = new File(this.context.getFilesDir(), "hermes");
        if (!hermesDir.exists()) {
            boolean created = hermesDir.mkdirs();
            Log.i(TAG, "Hermes memory directory created: " + created);
        }

        // デフォルトユーザープロファイルの初期設定
        if (!prefs.contains(KEY_USER_PROFILE)) {
            String defaultProfile = "# User Profile\n- Name: User\n- Preference: 自然で親密な会話、前置きなし";
            prefs.edit().putString(KEY_USER_PROFILE, defaultProfile).apply();
        }

        Log.i(TAG, "HermesMemoryManager initialized. Enabled: " + isEnabled());
    }

    /**
     * Memory機能が有効かどうか
     */
    public boolean isEnabled() {
        if (prefs == null) return true;
        return prefs.getBoolean(KEY_ENABLED, true);
    }

    /**
     * Memory機能の有効/無効切り替え
     */
    public void setEnabled(boolean enabled) {
        if (prefs == null) return;
        prefs.edit().putBoolean(KEY_ENABLED, enabled).apply();
        Log.i(TAG, "Hermes memory set to: " + enabled);
    }

    /**
     * グローバルユーザープロファイルの取得
     */
    public String getUserProfile() {
        if (prefs == null) return "";
        return prefs.getString(KEY_USER_PROFILE, "");
    }

    /**
     * グローバルユーザープロファイルの保存
     */
    public void setUserProfile(String profile) {
        if (prefs == null) return;
        prefs.edit().putString(KEY_USER_PROFILE, profile).apply();
    }

    /**
     * キャラクター別の永続記憶を取得
     */
    public String getCharacterMemory(String characterId) {
        if (characterId == null || characterId.isEmpty()) characterId = "default";
        File file = new File(hermesDir, "char_" + sanitizeFileName(characterId) + ".md");
        if (!file.exists()) {
            return "";
        }

        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line).append("\n");
            }
        } catch (Exception e) {
            Log.e(TAG, "Failed to read character memory: " + e.getMessage());
        }
        return sb.toString().trim();
    }

    /**
     * キャラクター別の永続記憶を保存
     */
    public void setCharacterMemory(String characterId, String memory) {
        if (characterId == null || characterId.isEmpty()) characterId = "default";
        File file = new File(hermesDir, "char_" + sanitizeFileName(characterId) + ".md");
        try (OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(file), StandardCharsets.UTF_8)) {
            writer.write(memory);
        } catch (Exception e) {
            Log.e(TAG, "Failed to write character memory: " + e.getMessage());
        }
    }

    /**
     * 送信メッセージに Hermes Memory を注入するコアメソッド
     * 
     * @param originalMessage ユーザーが送信しようとしているメッセージ
     * @param characterId 現在対話中のキャラクターID
     * @return Memory注入後のメッセージ（無効時は originalMessage をそのまま返す）
     */
    public String injectMemory(String originalMessage, String characterId) {
        if (!isEnabled()) {
            return originalMessage;
        }

        String userProfile = getUserProfile();
        String charMemory = getCharacterMemory(characterId);

        if ((userProfile == null || userProfile.isEmpty()) && (charMemory == null || charMemory.isEmpty())) {
            return originalMessage;
        }

        StringBuilder injected = new StringBuilder();
        injected.append(originalMessage).append("\n\n");
        injected.append("<!-- [Hermes Persistent Memory] -->\n");
        if (userProfile != null && !userProfile.trim().isEmpty()) {
            injected.append("[User Info: ").append(userProfile.replace("\n", " | ")).append("]\n");
        }
        if (charMemory != null && !charMemory.trim().isEmpty()) {
            injected.append("[Context: ").append(charMemory.replace("\n", " | ")).append("]\n");
        }
        injected.append("<!-- [/Hermes Persistent Memory] -->");

        Log.d(TAG, "Injected memory into outgoing message: " + injected.length() + " chars");
        return injected.toString();
    }

    private String sanitizeFileName(String name) {
        return name.replaceAll("[^a-zA-Z0-9_-]", "_");
    }
}
