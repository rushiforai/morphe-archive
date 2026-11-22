package app.rimixyz.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.util.Log;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Backup e restauração do save completo do New Star Soccer 4.34 (Android).
 *
 * Todo o progresso do jogo (dados globais + os 3 slots de carreira) é persistido em uma única
 * string texto-puro em {@code Activity.getPreferences(0)} sob a chave {@code ".monkeystate"}
 * (com fallback legado {@code "gxtkAppState"}).
 *
 * Usa o Storage Access Framework (ACTION_CREATE_DOCUMENT / ACTION_OPEN_DOCUMENT), funcionando
 * do Android 6 ao Android 16 sem exigir permissões de armazenamento. Antes de cada restauração,
 * grava um ponto de reversão automático em {@code getFilesDir()/nss_pre_restore_backup.txt}.
 */
@SuppressWarnings("unused")
public final class NewStarSoccerSaveBackupHelper {

    private static final String TAG = "RimiNSSBackup";
    private static final String GAME_PKG = "com.newstargames.newstarsoccer.";

    private static final String GADGET_BACKUP = "saveslot.btn_Backup";
    private static final String PREF_KEY_STATE = ".monkeystate";
    private static final String PREF_KEY_LEGACY = "gxtkAppState";
    private static final String SAFETY_BACKUP_FILE = "nss_pre_restore_backup.txt";

    private static final int REQ_EXPORT_BACKUP = 0x5253;
    private static final int REQ_IMPORT_BACKUP = 0x5254;
    private static final int MAX_BACKUP_BYTES = 20 * 1024 * 1024;

    private static volatile String pendingExportData = null;

    private NewStarSoccerSaveBackupHelper() {}

    /**
     * Chamado no início de {@code bb_sigui.g_HitGadget(String, String)}.
     * Retorna {@code true} se o clique pertence ao botão de backup e já foi tratado.
     */
    public static boolean handleHitGadget(String gadgetName) {
        if (!GADGET_BACKUP.equals(gadgetName)) {
            return false;
        }
        openBackupMenu();
        return true;
    }

    /**
     * Chamado ao final de {@code c_TScreen_SaveSlot.m_CreateScreen()} para adicionar o botão
     * "Backup" também no visual clássico (o visual moderno é injetado em {@code saveslot.uis}).
     */
    public static void addClassicSaveSlotButton() {
        try {
            Class<?> saveSlotCls = Class.forName(GAME_PKG + "c_TScreen_SaveSlot");
            Class<?> screenCls = Class.forName(GAME_PKG + "c_TScreen");
            Class<?> gadgetCls = Class.forName(GAME_PKG + "c_TGadget");
            Class<?> buttonCls = Class.forName(GAME_PKG + "c_TButton");
            Class<?> imageAssetCls = Class.forName(GAME_PKG + "c_ImageAsset");
            Class<?> imageCls = Class.forName(GAME_PKG + "c_Image");
            Class<?> siguiCls = Class.forName(GAME_PKG + "bb_sigui");
            Class<?> variousCls = Class.forName(GAME_PKG + "bb_various");

            Field screenField = saveSlotCls.getDeclaredField("m_screen");
            screenField.setAccessible(true);
            Object screen = screenField.get(null);
            if (screen == null) {
                return;
            }

            Field colButtonField = siguiCls.getDeclaredField("g_CCOL_BUTTON");
            colButtonField.setAccessible(true);
            String colButton = (String) colButtonField.get(null);

            Object iconAsset = null;
            try {
                Field defaultFlagsField = imageCls.getDeclaredField("m_DefaultFlags");
                defaultFlagsField.setAccessible(true);
                int defaultFlags = defaultFlagsField.getInt(null);

                Method loadImg = variousCls.getDeclaredMethod(
                    "g_LoadMyImageAsset",
                    String.class, int.class, int.class, boolean.class, int.class, int.class, boolean.class
                );
                loadImg.setAccessible(true);
                iconAsset = loadImg.invoke(
                    null, "Images/Icons/Refresh.png", 1, defaultFlags, false, 0, 0, false
                );
            } catch (Throwable t) {
                Log.w(TAG, "Failed to load classic backup icon", t);
            }

            Method createButton = buttonCls.getDeclaredMethod(
                "m_CreateButton",
                String.class, String.class,
                int.class, int.class, int.class, int.class, int.class, int.class,
                String.class, String.class,
                imageAssetCls, String.class, float.class, int.class, String.class,
                imageAssetCls, boolean.class, int.class
            );
            createButton.setAccessible(true);

            // Posicionado no espaço vazio entre Tutorial (x=160) e Google Play (x=496).
            Object backupButton = createButton.invoke(
                null,
                GADGET_BACKUP,
                "Backup",
                328, 816, 128, 128,
                1, 0,
                colButton != null ? colButton : "00AA00",
                "FFFFFF",
                iconAsset,
                "",
                1.0f,
                1,
                "",
                null,
                false,
                0
            );

            if (backupButton != null) {
                Method addGadget = screenCls.getDeclaredMethod("p_AddGadget", gadgetCls);
                addGadget.setAccessible(true);
                addGadget.invoke(screen, backupButton);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to add classic save slot backup button", t);
        }
    }

    /**
     * Chamado no início de {@code AndroidGame.onActivityResult(int, int, Intent)}.
     * Retorna {@code true} se o {@code requestCode} pertence ao fluxo de backup/restauração.
     */
    public static boolean onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
        if (requestCode != REQ_EXPORT_BACKUP && requestCode != REQ_IMPORT_BACKUP) {
            return false;
        }
        if (activity == null) {
            return true;
        }
        if (resultCode != Activity.RESULT_OK || data == null || data.getData() == null) {
            if (requestCode == REQ_EXPORT_BACKUP) {
                pendingExportData = null;
            }
            return true;
        }

        Uri uri = data.getData();
        if (requestCode == REQ_EXPORT_BACKUP) {
            handleExportResult(activity, uri);
        } else {
            handleImportResult(activity, uri);
        }
        return true;
    }

    private static void openBackupMenu() {
        final Activity activity = getGameActivity();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (activity.isFinishing() || activity.isDestroyed()) {
                    return;
                }
                showMainDialog(activity);
            }
        });
    }

    private static void showMainDialog(final Activity activity) {
        final boolean pt = isPortuguese();
        final String currentSave = readCurrentSave(activity);
        final File safetyFile = new File(activity.getFilesDir(), SAFETY_BACKUP_FILE);
        final boolean hasSafety = safetyFile.isFile() && safetyFile.length() > 0;

        List<String> items = new ArrayList<String>();
        items.add(pt ? "Fazer backup (Exportar arquivo)" : "Create backup (Export file)");
        items.add(pt ? "Restaurar backup (Importar arquivo)" : "Restore backup (Import file)");
        if (hasSafety) {
            items.add(pt ? "Desfazer última restauração" : "Undo last restore");
        }

        new AlertDialog.Builder(activity)
            .setTitle((pt ? "Backup do Save " : "Save Backup ") + shortSlotBadge(currentSave, pt))
            .setItems(items.toArray(new String[0]), new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    if (which == 0) {
                        startExport(activity);
                    } else if (which == 1) {
                        startImport(activity);
                    } else if (which == 2 && hasSafety) {
                        confirmSafetyRollback(activity, safetyFile);
                    }
                }
            })
            .setNegativeButton(pt ? "Fechar" : "Close", null)
            .show();
    }

    private static void startExport(Activity activity) {
        boolean pt = isPortuguese();
        String save = readCurrentSave(activity);
        if (save.isEmpty()) {
            showToast(activity, pt ? "Não há nenhum save para exportar." : "There is no save data to export.");
            return;
        }

        pendingExportData = save;
        String stamp = new SimpleDateFormat("yyyy-MM-dd_HH-mm", Locale.US).format(new Date());
        String filename = "NSS_Backup_" + stamp + ".txt";

        Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("text/plain");
        intent.putExtra(Intent.EXTRA_TITLE, filename);

        try {
            activity.startActivityForResult(intent, REQ_EXPORT_BACKUP);
        } catch (Throwable t) {
            pendingExportData = null;
            Log.e(TAG, "Failed to launch ACTION_CREATE_DOCUMENT", t);
            showErrorDialog(
                activity,
                pt ? "Erro ao exportar" : "Export error",
                pt ? "Não foi possível abrir o seletor de arquivos do sistema."
                   : "Could not open the system file picker."
            );
        }
    }

    private static void startImport(Activity activity) {
        boolean pt = isPortuguese();
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");

        try {
            activity.startActivityForResult(intent, REQ_IMPORT_BACKUP);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to launch ACTION_OPEN_DOCUMENT", t);
            showErrorDialog(
                activity,
                pt ? "Erro ao importar" : "Import error",
                pt ? "Não foi possível abrir o seletor de arquivos do sistema."
                   : "Could not open the system file picker."
            );
        }
    }

    private static void handleExportResult(Activity activity, Uri uri) {
        boolean pt = isPortuguese();
        String data = pendingExportData;
        pendingExportData = null;
        if (data == null || data.isEmpty()) {
            data = readCurrentSave(activity);
        }
        if (data.isEmpty()) {
            showToast(activity, pt ? "Save vazio; backup cancelado." : "Empty save; backup cancelled.");
            return;
        }

        OutputStream out = null;
        try {
            try {
                out = activity.getContentResolver().openOutputStream(uri, "wt");
            } catch (Throwable ignored) {
                out = activity.getContentResolver().openOutputStream(uri);
            }
            if (out == null) {
                throw new IOException("openOutputStream returned null");
            }
            out.write(data.getBytes(StandardCharsets.UTF_8));
            out.flush();
            showToast(activity, pt ? "Backup salvo com sucesso!" : "Backup saved successfully!");
        } catch (Throwable t) {
            Log.e(TAG, "Failed to write backup to " + uri, t);
            showErrorDialog(
                activity,
                pt ? "Erro ao salvar backup" : "Failed to save backup",
                (pt ? "Não foi possível gravar o arquivo:\n" : "Could not write the file:\n") + t.getMessage()
            );
        } finally {
            closeQuietly(out);
        }
    }

    private static void handleImportResult(final Activity activity, Uri uri) {
        final boolean pt = isPortuguese();
        String raw;
        try {
            raw = readUriUtf8(activity, uri);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to read backup from " + uri, t);
            showErrorDialog(
                activity,
                pt ? "Erro ao ler arquivo" : "Failed to read file",
                (pt ? "Não foi possível ler o arquivo selecionado:\n" : "Could not read the selected file:\n") + t.getMessage()
            );
            return;
        }

        final String cleaned = stripBom(raw);
        if (!isValidSaveData(cleaned)) {
            showErrorDialog(
                activity,
                pt ? "Arquivo inválido" : "Invalid backup file",
                pt ? "O arquivo selecionado não parece ser um save válido do New Star Soccer."
                   : "The selected file does not look like a valid New Star Soccer save."
            );
            return;
        }

        String summary = summarizeSave(cleaned, pt);
        String message = (pt
            ? "Conteúdo encontrado no backup:\n\n" + summary
              + "\n\nIsso vai substituir seu save atual (um ponto de reversão será salvo automaticamente) e reiniciar o jogo."
            : "Backup contents:\n\n" + summary
              + "\n\nThis will replace your current save (a safety rollback copy will be saved automatically) and restart the game.");

        new AlertDialog.Builder(activity)
            .setTitle(pt ? "Confirmar restauração" : "Confirm restore")
            .setMessage(message)
            .setPositiveButton(pt ? "Restaurar" : "Restore", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    applyRestore(activity, cleaned, true);
                }
            })
            .setNegativeButton(pt ? "Cancelar" : "Cancel", null)
            .show();
    }

    private static void confirmSafetyRollback(final Activity activity, final File safetyFile) {
        final boolean pt = isPortuguese();
        final String rollbackData;
        try {
            rollbackData = stripBom(readFileUtf8(safetyFile));
        } catch (Throwable t) {
            showErrorDialog(
                activity,
                pt ? "Erro ao ler ponto de reversão" : "Failed to read rollback backup",
                t.getMessage() != null ? t.getMessage() : "I/O error"
            );
            return;
        }

        if (!isValidSaveData(rollbackData)) {
            showErrorDialog(
                activity,
                pt ? "Ponto de reversão inválido" : "Invalid rollback backup",
                pt ? "O arquivo de reversão está corrompido." : "The rollback file is corrupted."
            );
            return;
        }

        String summary = summarizeSave(rollbackData, pt);
        String msg = (pt
            ? "Voltar para o save anterior à última restauração?\n\n" + summary + "\n\nO jogo será reiniciado."
            : "Revert to the save from before the last restore?\n\n" + summary + "\n\nThe game will restart.");

        new AlertDialog.Builder(activity)
            .setTitle(pt ? "Desfazer restauração" : "Undo restore")
            .setMessage(msg)
            .setPositiveButton(pt ? "Restaurar" : "Restore", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    applyRestore(activity, rollbackData, false);
                }
            })
            .setNegativeButton(pt ? "Cancelar" : "Cancel", null)
            .show();
    }

    private static void applyRestore(Activity activity, String newSaveData, boolean createSafetyBackup) {
        boolean pt = isPortuguese();
        try {
            if (createSafetyBackup) {
                String current = readCurrentSave(activity);
                if (!current.isEmpty()) {
                    writeFileUtf8(new File(activity.getFilesDir(), SAFETY_BACKUP_FILE), current);
                }
            }

            SharedPreferences prefs = activity.getPreferences(Context.MODE_PRIVATE);
            boolean ok = prefs.edit().putString(PREF_KEY_STATE, newSaveData).commit();
            if (!ok) {
                throw new IOException("SharedPreferences.Editor.commit() returned false");
            }

            showToast(activity, pt ? "Backup restaurado! Reiniciando..." : "Backup restored! Restarting...");
            restartApp(activity);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to restore backup", t);
            showErrorDialog(
                activity,
                pt ? "Erro ao restaurar" : "Restore failed",
                (pt ? "Não foi possível aplicar o backup:\n" : "Could not apply the backup:\n") + t.getMessage()
            );
        }
    }

    private static void restartApp(Activity activity) {
        Intent launch = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
        if (launch != null && launch.getComponent() != null) {
            ComponentName component = launch.getComponent();
            Intent restart = Intent.makeRestartActivityTask(component);
            activity.startActivity(restart);
        } else if (launch != null) {
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            activity.startActivity(launch);
        }
        Runtime.getRuntime().exit(0);
    }

    private static String readCurrentSave(Activity activity) {
        try {
            SharedPreferences prefs = activity.getPreferences(Context.MODE_PRIVATE);
            String state = prefs.getString(PREF_KEY_STATE, "");
            if (state != null && !state.isEmpty()) {
                return state;
            }
            String legacy = prefs.getString(PREF_KEY_LEGACY, "");
            if (legacy != null && !legacy.isEmpty()) {
                return legacy;
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to read SharedPreferences state", t);
        }

        // Fallback para o estado em memória se o jogo ainda não persistiu.
        try {
            Class<?> playerCls = Class.forName(GAME_PKG + "c_TPlayer");
            Method getter = playerCls.getDeclaredMethod("m_GetCompleteLoadString");
            getter.setAccessible(true);
            Object result = getter.invoke(null);
            if (result instanceof String) {
                return (String) result;
            }
        } catch (Throwable ignored) {}
        return "";
    }

    private static Activity getGameActivity() {
        try {
            Class<?> bbGameCls = Class.forName(GAME_PKG + "BBAndroidGame");
            Method getGame = bbGameCls.getDeclaredMethod("AndroidGame");
            getGame.setAccessible(true);
            Object game = getGame.invoke(null);
            if (game == null) {
                return null;
            }
            Method getAct = bbGameCls.getDeclaredMethod("GetActivity");
            getAct.setAccessible(true);
            return (Activity) getAct.invoke(game);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to obtain BBAndroidGame Activity", t);
            return null;
        }
    }

    private static boolean isPortuguese() {
        try {
            Class<?> playerCls = Class.forName(GAME_PKG + "c_TPlayer");
            Field langField = playerCls.getDeclaredField("m_opLanguage");
            langField.setAccessible(true);
            int lang = langField.getInt(null);
            // Em options.uis: 2 = BRAZILIAN, 8 = PORTUGUESE.
            if (lang == 2 || lang == 8) {
                return true;
            }
            if (lang >= 0 && lang <= 12) {
                return false;
            }
        } catch (Throwable ignored) {}
        String sysLang = Locale.getDefault().getLanguage();
        return sysLang != null && sysLang.toLowerCase(Locale.US).startsWith("pt");
    }

    private static String stripBom(String s) {
        if (s != null && !s.isEmpty() && s.charAt(0) == '\uFEFF') {
            return s.substring(1);
        }
        return s != null ? s : "";
    }

    private static String stripLeadingTweaks(String s) {
        if (s == null) {
            return "";
        }
        if (s.startsWith("#TWEAKS")) {
            int end = s.indexOf("#ENDTWEAKS");
            if (end < 0) {
                return null;
            }
            return s.substring(end + "#ENDTWEAKS".length());
        }
        return s;
    }

    private static boolean isValidSaveData(String raw) {
        if (raw == null || raw.isEmpty() || raw.length() > MAX_BACKUP_BYTES) {
            return false;
        }
        // Rejeita arquivos binários (bytes de controle além de \r, \n, \t).
        int sampleLen = Math.min(raw.length(), 4096);
        for (int i = 0; i < sampleLen; i++) {
            char c = raw.charAt(i);
            if (c < 0x20 && c != '\r' && c != '\n' && c != '\t') {
                return false;
            }
        }

        String body = stripLeadingTweaks(raw);
        if (body == null || body.isEmpty()) {
            return false;
        }

        String[] parts = body.split(";", -1);
        if (parts.length == 0 || parts[0].isEmpty()) {
            return false;
        }

        // parts[0] = dados globais (m_LoadGlobalData lê inteiros nos primeiros campos).
        String[] globalFields = parts[0].split(",", -1);
        if (globalFields.length < 5) {
            return false;
        }
        for (int i = 0; i < 5; i++) {
            if (!isInteger(globalFields[i])) {
                return false;
            }
        }

        // Verifica integridade básica de cada slot de carreira presente (stride 5: 1, 6, 11).
        for (int slot = 0; slot < 3; slot++) {
            int idx = slot * 5 + 1;
            if (parts.length > idx) {
                String slotStr = parts[idx];
                if (slotStr != null && !slotStr.trim().isEmpty()) {
                    String slotBody = stripLeadingTweaks(slotStr);
                    if (slotBody == null) {
                        return false;
                    }
                    String[] fields = slotBody.split(",", -1);
                    if (fields.length < 4 || !isInteger(fields[0])) {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    private static boolean isInteger(String s) {
        if (s == null) {
            return false;
        }
        String trimmed = s.trim();
        if (trimmed.isEmpty()) {
            return false;
        }
        try {
            Integer.parseInt(trimmed);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private static String shortSlotBadge(String raw, boolean pt) {
        if (raw == null || raw.isEmpty()) {
            return pt ? "(sem save atual)" : "(no current save)";
        }
        List<String> names = extractSlotNames(raw);
        if (names.isEmpty()) {
            return pt ? "(0 carreiras ativas)" : "(0 active careers)";
        }
        int count = names.size();
        if (pt) {
            return "(" + count + (count == 1 ? " carreira salva)" : " carreiras salvas)");
        }
        return "(" + count + (count == 1 ? " saved career)" : " saved careers)");
    }

    private static String summarizeSave(String raw, boolean pt) {
        List<String> lines = extractSlotNames(raw);
        if (lines.isEmpty()) {
            return pt ? "• Apenas configurações globais (sem carreiras)"
                      : "• Global settings only (no careers)";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < lines.size(); i++) {
            if (i > 0) {
                sb.append('\n');
            }
            sb.append("• ").append(lines.get(i));
        }
        return sb.toString();
    }

    private static List<String> extractSlotNames(String raw) {
        List<String> result = new ArrayList<String>();
        String body = stripLeadingTweaks(raw);
        if (body == null || body.isEmpty()) {
            return result;
        }
        String[] parts = body.split(";", -1);
        for (int slot = 0; slot < 3; slot++) {
            int idx = slot * 5 + 1;
            if (parts.length > idx) {
                String slotStr = parts[idx];
                if (slotStr != null && !slotStr.trim().isEmpty()) {
                    String slotBody = stripLeadingTweaks(slotStr);
                    if (slotBody == null) {
                        continue;
                    }
                    String[] fields = slotBody.split(",", -1);
                    if (fields.length > 3 && !fields[3].trim().isEmpty()) {
                        result.add("Slot " + (slot + 1) + ": " + fields[3].trim());
                    } else {
                        result.add("Slot " + (slot + 1));
                    }
                }
            }
        }
        return result;
    }

    private static String readUriUtf8(Activity activity, Uri uri) throws IOException {
        InputStream in = activity.getContentResolver().openInputStream(uri);
        if (in == null) {
            throw new IOException("openInputStream returned null");
        }
        try {
            return readStreamUtf8(in);
        } finally {
            closeQuietly(in);
        }
    }

    private static String readFileUtf8(File file) throws IOException {
        FileInputStream in = new FileInputStream(file);
        try {
            return readStreamUtf8(in);
        } finally {
            closeQuietly(in);
        }
    }

    private static String readStreamUtf8(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int total = 0;
        int read;
        while ((read = in.read(buf)) != -1) {
            total += read;
            if (total > MAX_BACKUP_BYTES) {
                throw new IOException("File exceeds maximum allowed size (20 MB)");
            }
            out.write(buf, 0, read);
        }
        return new String(out.toByteArray(), StandardCharsets.UTF_8);
    }

    private static void writeFileUtf8(File file, String content) throws IOException {
        FileOutputStream out = new FileOutputStream(file, false);
        try {
            out.write(content.getBytes(StandardCharsets.UTF_8));
            out.flush();
        } finally {
            closeQuietly(out);
        }
    }

    private static void showToast(Activity activity, String text) {
        Toast.makeText(activity, text, Toast.LENGTH_LONG).show();
    }

    private static void showErrorDialog(Activity activity, String title, String message) {
        new AlertDialog.Builder(activity)
            .setTitle(title)
            .setMessage(message)
            .setPositiveButton("OK", null)
            .show();
    }

    private static void closeQuietly(java.io.Closeable c) {
        if (c != null) {
            try {
                c.close();
            } catch (Throwable ignored) {}
        }
    }
}
