package app.tiktoklitepatches.extension;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;

import java.util.Locale;

final class ModStrings {
    enum Text {
        SETTINGS, FEED, HIDE_ADS, ADS_DESCRIPTION, ADS_COUNT, DOWNLOADS,
        CLEAN_DOWNLOADS, DOWNLOAD_DESCRIPTION, ABOUT, ABOUT_TITLE, CREATOR,
        PATCH_VERSION, GITHUB, CLOSE, BACK, NATIVE_SETTINGS, SHORTCUTS, PROFILE_ENTRY, PROFILE_DESCRIPTION
    }

    private final Locale locale;
    private final String[] strings;

    private ModStrings(Locale locale, String... strings) {
        this.locale = locale;
        this.strings = strings;
    }

    static ModStrings forContext(Context context) {
        Locale locale = appLocale(context);
        switch (locale.getLanguage()) {
            case "es":
                return new ModStrings(locale, "Ajustes del mod", "Feed", "Ocultar anuncios",
                        "Filtra publicaciones identificadas como publicidad.", "Anuncios filtrados en esta sesión  ·  %,d",
                        "Descargas", "Guardar sin marca de agua", "Usa la versión limpia cuando esté disponible.",
                        "Acerca de", "Acerca de TikTok Lite Patches", "Creador de TikTok Lite Patches",
                        "Versión del parche %s", "Ver proyecto en GitHub", "Cerrar", "Volver", "Ajustes y privacidad",
                        "Accesos", "Mantener pulsado Perfil", "Mantén pulsado Perfil en la barra de navegación para abrir Ajustes del mod.");
            case "pt":
                return new ModStrings(locale, "Configurações do mod", "Feed", "Ocultar anúncios",
                        "Filtra publicações identificadas como anúncios.", "Anúncios filtrados nesta sessão  ·  %,d",
                        "Downloads", "Salvar sem marca-d’água", "Usa a versão sem marca quando disponível.",
                        "Sobre", "Sobre o TikTok Lite Patches", "Criador do TikTok Lite Patches",
                        "Versão do patch %s", "Ver projeto no GitHub", "Fechar", "Voltar", "Configurações e privacidade",
                        "Atalhos", "Pressionar Perfil", "Pressione e segure Perfil na barra de navegação para abrir as configurações do mod.");
            case "fr":
                return new ModStrings(locale, "Paramètres du mod", "Fil", "Masquer les publicités",
                        "Filtre les publications identifiées comme publicités.", "Publicités filtrées pendant cette session  ·  %,d",
                        "Téléchargements", "Enregistrer sans filigrane", "Utilise la version sans filigrane si elle est disponible.",
                        "À propos", "À propos de TikTok Lite Patches", "Créateur de TikTok Lite Patches",
                        "Version du patch %s", "Voir le projet sur GitHub", "Fermer", "Retour", "Paramètres et confidentialité",
                        "Raccourcis", "Appui long sur Profil", "Appuyez longuement sur Profil dans la barre de navigation pour ouvrir les paramètres du mod.");
            case "de":
                return new ModStrings(locale, "Mod-Einstellungen", "Feed", "Werbung ausblenden",
                        "Filtert Beiträge, die als Werbung gekennzeichnet sind.", "Gefilterte Anzeigen in dieser Sitzung  ·  %,d",
                        "Downloads", "Ohne Wasserzeichen speichern", "Verwendet die Version ohne Wasserzeichen, wenn verfügbar.",
                        "Über", "Über TikTok Lite Patches", "Entwickler von TikTok Lite Patches",
                        "Patch-Version %s", "Projekt auf GitHub ansehen", "Schließen", "Zurück", "Einstellungen und Datenschutz",
                        "Verknüpfungen", "Profil gedrückt halten", "Halte Profil in der Navigationsleiste gedrückt, um die Mod-Einstellungen zu öffnen.");
            case "it":
                return new ModStrings(locale, "Impostazioni del mod", "Feed", "Nascondi gli annunci",
                        "Filtra i post identificati come annunci.", "Annunci filtrati in questa sessione  ·  %,d",
                        "Download", "Salva senza filigrana", "Usa la versione senza filigrana quando disponibile.",
                        "Informazioni", "Informazioni su TikTok Lite Patches", "Creatore di TikTok Lite Patches",
                        "Versione della patch %s", "Vedi il progetto su GitHub", "Chiudi", "Indietro", "Impostazioni e privacy",
                        "Scorciatoie", "Pressione prolungata su Profilo", "Tieni premuto Profilo nella barra di navigazione per aprire le impostazioni del mod.");
            case "id":
            case "in":
                return new ModStrings(locale, "Pengaturan mod", "Feed", "Sembunyikan iklan",
                        "Menyaring postingan yang ditandai sebagai iklan.", "Iklan yang disaring dalam sesi ini  ·  %,d",
                        "Unduhan", "Simpan tanpa tanda air", "Gunakan versi tanpa tanda air jika tersedia.",
                        "Tentang", "Tentang TikTok Lite Patches", "Pembuat TikTok Lite Patches",
                        "Versi patch %s", "Lihat proyek di GitHub", "Tutup", "Kembali", "Pengaturan dan privasi",
                        "Pintasan", "Tekan lama Profil", "Tekan lama Profil di bilah navigasi untuk membuka pengaturan mod.");
            case "ja":
                return new ModStrings(locale, "Mod設定", "フィード", "広告を非表示",
                        "広告として識別された投稿を除外します。", "このセッションで除外した広告  ·  %,d",
                        "ダウンロード", "透かしなしで保存", "利用可能な場合は透かしなしの動画を使用します。",
                        "このパッチについて", "TikTok Lite Patches について", "TikTok Lite Patches の制作者",
                        "パッチのバージョン %s", "GitHubでプロジェクトを見る", "閉じる", "戻る", "設定とプライバシー",
                        "ショートカット", "プロフィールを長押し", "ナビゲーションバーのプロフィールを長押ししてMod設定を開きます。");
            default:
                return new ModStrings(Locale.ENGLISH, "Mod settings", "Feed", "Hide ads",
                        "Filters posts identified as ads.", "Ads filtered this session  ·  %,d",
                        "Downloads", "Save without a watermark", "Uses the watermark-free version when available.",
                        "About", "About TikTok Lite Patches", "Creator of TikTok Lite Patches",
                        "Patch version %s", "View project on GitHub", "Close", "Back", "Settings and privacy",
                        "Shortcuts", "Long-press Profile", "Press and hold Profile in the navigation bar to open Mod settings.");
        }
    }

    String get(Text key, Object... values) {
        String text = strings[key.ordinal()];
        return values.length == 0 ? text : String.format(locale, text, values);
    }

    private static Locale appLocale(Context context) {
        try {
            Class<?> keva = Class.forName("com.bytedance.keva.Keva", false, context.getClassLoader());
            Class<?> impl = Class.forName("com.bytedance.keva.KevaImpl", false, context.getClassLoader());
            Object repo = impl.getMethod("getRepo", String.class, int.class)
                    .invoke(null, "key_language_sp_key", 0);
            String tag = (String) keva.getMethod("getString", String.class, String.class)
                    .invoke(repo, "key_current_locale", "");
            Locale selected = Locale.forLanguageTag(tag.replace('_', '-'));
            if (!selected.getLanguage().isEmpty()) return selected;
        } catch (ReflectiveOperationException | LinkageError ignored) {
            // Older or unsupported builds can still use the application's resource locale.
        }
        Configuration config = context.getApplicationContext().getResources().getConfiguration();
        if (Build.VERSION.SDK_INT >= 24 && !config.getLocales().isEmpty()) {
            return config.getLocales().get(0);
        }
        return config.locale == null ? Locale.getDefault() : config.locale;
    }
}
