package app.tiktoklitepatches.extension;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;

import java.util.Locale;

final class ModStrings {
    enum Text {
        SETTINGS, FEED, HIDE_ADS, ADS_DESCRIPTION, ADS_COUNT, DOWNLOADS,
        CLEAN_DOWNLOADS, DOWNLOAD_DESCRIPTION, ABOUT, ABOUT_TITLE, CREATOR,
        PATCH_VERSION, GITHUB, CLOSE, BACK, NATIVE_SETTINGS, SHORTCUTS, PROFILE_ENTRY, PROFILE_DESCRIPTION,
        HIDE_LIVE, LIVE_DESCRIPTION, HIDE_PHOTO_POSTS, PHOTO_POSTS_DESCRIPTION,
        APPEARANCE, EXACT_COUNTS_TITLE, EXACT_COUNTS_DESCRIPTION, ACCENT_COLOR, ACCENT_DEFAULT, ACCENT_CUSTOM, ACCENT_INVALID,
        PLAYBACK, STOP_LOOPING_TITLE, STOP_LOOPING_DESCRIPTION, SEEKBAR_TITLE, SEEKBAR_DESCRIPTION,
        PRIVACY, PROFILE_SUGGESTIONS_TITLE, PROFILE_SUGGESTIONS_DESCRIPTION, INBOX_STORY_TRAY_TITLE, INBOX_STORY_TRAY_DESCRIPTION, STARTUP_PAUSE_TITLE, STARTUP_PAUSE_DESCRIPTION
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
                        "Accesos", "Mantener pulsado Perfil", "Mantén pulsado Perfil en la barra de navegación para abrir Ajustes del mod.",
                        "Ocultar LIVE", "Oculta emisiones en directo del feed.", "Ocultar publicaciones de fotos", "Oculta publicaciones en modo foto del feed.",
                        "Apariencia", "Mostrar contadores exactos", "Muestra cifras completas al cargar publicaciones y perfiles.", "Color de acento", "Original", "Color HEX personalizado", "Escribe 6 dígitos HEX.",
                        "Reproducción", "Detener la repetición automática", "Los videos se detienen al terminar.",
                        "Mostrar barra de progreso", "Arrastra la barra para adelantar o retroceder en los videos.",
                        "Privacidad", "Ocultar cuentas recomendadas", "Oculta la sección de cuentas recomendadas en Perfil y Mensajes.",
                        "Ocultar bandeja de historias", "Oculta la fila de historias y el botón Crea en Mensajes.",
                        "Pausar el primer video al abrir", "Arranca con el primer video de Para ti en pausa.");
            case "pt":
                return new ModStrings(locale, "Configurações do mod", "Feed", "Ocultar anúncios",
                        "Filtra publicações identificadas como anúncios.", "Anúncios filtrados nesta sessão  ·  %,d",
                        "Downloads", "Salvar sem marca-d’água", "Usa a versão sem marca quando disponível.",
                        "Sobre", "Sobre o TikTok Lite Patches", "Criador do TikTok Lite Patches",
                        "Versão do patch %s", "Ver projeto no GitHub", "Fechar", "Voltar", "Configurações e privacidade",
                        "Atalhos", "Pressionar Perfil", "Pressione e segure Perfil na barra de navegação para abrir as configurações do mod.",
                        "Ocultar LIVE", "Oculta transmissões ao vivo do feed.", "Ocultar publicações com fotos", "Oculta publicações no modo foto do feed.",
                        "Aparência", "Mostrar contagens exatas", "Mostra números completos ao carregar publicações e perfis.", "Cor de destaque", "Original", "Cor HEX personalizada", "Insira 6 dígitos HEX.",
                        "Reprodução", "Desativar repetição automática", "Os vídeos param ao chegar ao fim.",
                        "Mostrar barra de progresso", "Arraste a barra para avançar ou voltar nos vídeos.",
                        "Privacidade", "Ocultar contas sugeridas", "Oculta a seção de contas sugeridas no Perfil e em Mensagens.",
                        "Ocultar bandeja de stories", "Oculta a linha de stories e o botão Criar em Mensagens.",
                        "Pausar o primeiro vídeo ao abrir", "Abre com o primeiro vídeo de Para você em pausa.");
            case "fr":
                return new ModStrings(locale, "Paramètres du mod", "Fil", "Masquer les publicités",
                        "Filtre les publications identifiées comme publicités.", "Publicités filtrées pendant cette session  ·  %,d",
                        "Téléchargements", "Enregistrer sans filigrane", "Utilise la version sans filigrane si elle est disponible.",
                        "À propos", "À propos de TikTok Lite Patches", "Créateur de TikTok Lite Patches",
                        "Version du patch %s", "Voir le projet sur GitHub", "Fermer", "Retour", "Paramètres et confidentialité",
                        "Raccourcis", "Appui long sur Profil", "Appuyez longuement sur Profil dans la barre de navigation pour ouvrir les paramètres du mod.",
                        "Masquer les LIVE", "Masque les directs dans le fil.", "Masquer les publications photo", "Masque les publications en mode photo dans le fil.",
                        "Apparence", "Afficher les compteurs exacts", "Affiche les nombres complets au chargement des publications et des profils.", "Couleur d’accentuation", "Couleur d’origine", "Couleur HEX personnalisée", "Saisissez 6 chiffres HEX.",
                        "Lecture", "Arrêter la répétition automatique", "Les vidéos s’arrêtent à la fin.",
                        "Afficher la barre de progression", "Faites glisser la barre pour avancer ou reculer dans les vidéos.",
                        "Confidentialité", "Masquer les comptes suggérés", "Masque la section des comptes suggérés dans le profil et les messages.",
                        "Masquer le bandeau des stories", "Masque la rangée des stories et le bouton Créer dans les messages.",
                        "Mettre en pause la première vidéo", "Met la première vidéo du fil Pour toi en pause au démarrage.");
            case "de":
                return new ModStrings(locale, "Mod-Einstellungen", "Feed", "Werbung ausblenden",
                        "Filtert Beiträge, die als Werbung gekennzeichnet sind.", "Gefilterte Anzeigen in dieser Sitzung  ·  %,d",
                        "Downloads", "Ohne Wasserzeichen speichern", "Verwendet die Version ohne Wasserzeichen, wenn verfügbar.",
                        "Über", "Über TikTok Lite Patches", "Entwickler von TikTok Lite Patches",
                        "Patch-Version %s", "Projekt auf GitHub ansehen", "Schließen", "Zurück", "Einstellungen und Datenschutz",
                        "Verknüpfungen", "Profil gedrückt halten", "Halte Profil in der Navigationsleiste gedrückt, um die Mod-Einstellungen zu öffnen.",
                        "LIVE ausblenden", "Blendet Livestreams im Feed aus.", "Fotobeiträge ausblenden", "Blendet Beiträge im Fotomodus im Feed aus.",
                        "Darstellung", "Genaue Anzahlen anzeigen", "Zeigt beim Laden von Beiträgen und Profilen vollständige Zahlen an.", "Akzentfarbe", "Original", "Eigene HEX-Farbe", "Gib 6 HEX-Zeichen ein.",
                        "Wiedergabe", "Automatische Wiederholung stoppen", "Videos halten am Ende an.",
                        "Fortschrittsleiste anzeigen", "Ziehe die Leiste, um in Videos vor- oder zurückzuspringen.",
                        "Datenschutz", "Vorgeschlagene Konten ausblenden", "Blendet vorgeschlagene Konten im Profil und in Nachrichten aus.",
                        "Story-Leiste ausblenden", "Blendet die Story-Leiste und die Schaltfläche Erstellen in Nachrichten aus.",
                        "Erstes Video beim Start pausieren", "Pausiert beim Start das erste Video in Für dich.");
            case "it":
                return new ModStrings(locale, "Impostazioni del mod", "Feed", "Nascondi gli annunci",
                        "Filtra i post identificati come annunci.", "Annunci filtrati in questa sessione  ·  %,d",
                        "Download", "Salva senza filigrana", "Usa la versione senza filigrana quando disponibile.",
                        "Informazioni", "Informazioni su TikTok Lite Patches", "Creatore di TikTok Lite Patches",
                        "Versione della patch %s", "Vedi il progetto su GitHub", "Chiudi", "Indietro", "Impostazioni e privacy",
                        "Scorciatoie", "Pressione prolungata su Profilo", "Tieni premuto Profilo nella barra di navigazione per aprire le impostazioni del mod.",
                        "Nascondi LIVE", "Nasconde le dirette nel feed.", "Nascondi i post con foto", "Nasconde i post in modalità foto nel feed.",
                        "Aspetto", "Mostra conteggi esatti", "Mostra i numeri completi al caricamento di post e profili.", "Colore di accento", "Originale", "Colore HEX personalizzato", "Inserisci 6 cifre HEX.",
                        "Riproduzione", "Interrompi la ripetizione automatica", "I video si fermano alla fine.",
                        "Mostra barra di avanzamento", "Trascina la barra per avanzare o tornare indietro nei video.",
                        "Privacy", "Nascondi gli account suggeriti", "Nasconde gli account suggeriti nel profilo e nei messaggi.",
                        "Nascondi la barra delle storie", "Nasconde la riga delle storie e il pulsante Crea nei messaggi.",
                        "Metti in pausa il primo video", "All’avvio mette in pausa il primo video in Per te.");
            case "id":
            case "in":
                return new ModStrings(locale, "Pengaturan mod", "Feed", "Sembunyikan iklan",
                        "Menyaring postingan yang ditandai sebagai iklan.", "Iklan yang disaring dalam sesi ini  ·  %,d",
                        "Unduhan", "Simpan tanpa tanda air", "Gunakan versi tanpa tanda air jika tersedia.",
                        "Tentang", "Tentang TikTok Lite Patches", "Pembuat TikTok Lite Patches",
                        "Versi patch %s", "Lihat proyek di GitHub", "Tutup", "Kembali", "Pengaturan dan privasi",
                        "Pintasan", "Tekan lama Profil", "Tekan lama Profil di bilah navigasi untuk membuka pengaturan mod.",
                        "Sembunyikan LIVE", "Menyembunyikan siaran langsung dari feed.", "Sembunyikan postingan foto", "Menyembunyikan postingan mode foto dari feed.",
                        "Tampilan", "Tampilkan jumlah persis", "Menampilkan angka lengkap saat memuat postingan dan profil.", "Warna aksen", "Asli", "Warna HEX khusus", "Masukkan 6 digit HEX.",
                        "Pemutaran", "Hentikan pengulangan otomatis", "Video berhenti saat selesai.",
                        "Tampilkan bilah progres", "Geser bilah untuk maju atau mundur dalam video.",
                        "Privasi", "Sembunyikan akun yang disarankan", "Sembunyikan bagian akun yang disarankan di Profil dan Pesan.",
                        "Sembunyikan bilah cerita", "Sembunyikan baris cerita dan tombol Buat di Pesan.",
                        "Jeda video pertama saat dibuka", "Menjeda video pertama di Untuk Anda saat aplikasi dibuka.");
            case "ja":
                return new ModStrings(locale, "Mod設定", "フィード", "広告を非表示",
                        "広告として識別された投稿を除外します。", "このセッションで除外した広告  ·  %,d",
                        "ダウンロード", "透かしなしで保存", "利用可能な場合は透かしなしの動画を使用します。",
                        "このパッチについて", "TikTok Lite Patches について", "TikTok Lite Patches の制作者",
                        "パッチのバージョン %s", "GitHubでプロジェクトを見る", "閉じる", "戻る", "設定とプライバシー",
                        "ショートカット", "プロフィールを長押し", "ナビゲーションバーのプロフィールを長押ししてMod設定を開きます。",
                        "LIVEを非表示", "フィードのライブ配信を非表示にします。", "写真投稿を非表示", "フィードの写真モードの投稿を非表示にします。",
                        "外観", "正確な件数を表示", "投稿やプロフィールの読み込み時に件数を省略せず表示します。", "アクセントカラー", "既定", "カスタムHEXカラー", "HEXを6桁で入力してください。",
                        "再生", "自動リピートを停止", "動画の再生が最後で停止します。",
                        "シークバーを表示", "バーをドラッグして動画を早送りしたり巻き戻したりできます。",
                        "プライバシー", "おすすめのアカウントを非表示", "プロフィールとメッセージのおすすめアカウント欄を非表示にします。",
                        "ストーリートレイを非表示", "メッセージのストーリー欄と作成ボタンを非表示にします。",
                        "起動時に最初の動画を一時停止", "起動時に「おすすめ」の最初の動画を一時停止します。");
            default:
                return new ModStrings(Locale.ENGLISH, "Mod settings", "Feed", "Hide ads",
                        "Filters posts identified as ads.", "Ads filtered this session  ·  %,d",
                        "Downloads", "Save without a watermark", "Uses the watermark-free version when available.",
                        "About", "About TikTok Lite Patches", "Creator of TikTok Lite Patches",
                        "Patch version %s", "View project on GitHub", "Close", "Back", "Settings and privacy",
                        "Shortcuts", "Long-press Profile", "Press and hold Profile in the navigation bar to open Mod settings.",
                        "Hide LIVE", "Hides live streams from the feed.", "Hide photo posts", "Hides photo-mode posts from the feed.",
                        "Appearance", "Show exact counts", "Shows full numbers when posts and profiles load.", "Accent color", "Original", "Custom HEX color", "Enter 6 HEX digits.",
                        "Playback", "Stop automatic video looping", "Videos stop when they reach the end.",
                        "Show video seekbar", "Drag the bar to move forward or backward in videos.",
                        "Privacy", "Hide suggested accounts", "Hides the suggested accounts section in Profile and Inbox.",
                        "Hide story tray", "Hides the stories row and Create button in Inbox.",
                        "Pause first video on launch", "Pauses the first For You video at startup.");
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
