package io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles;

import io.github.liongalahad.nuviotv.extension.settings.MorpheTranslations;

/** Owned translation catalogue. Columns: en, es, it, de, fr, pt, ja, ko, zh-Hans, zh-Hant. */
final class PatchTranslations {
    private PatchTranslations() {}
    static void register() { MorpheTranslations.register(ENTRIES); }
    static final String[][] ENTRIES = {
        {"Subtitles", "Subtítulos", "Sottotitoli", "Untertitel", "Sous-titres", "Legendas", "字幕", "자막", "字幕", "字幕"},
        {"Configure subtitle patch settings", "Configura los parches de subtítulos", "Configura le patch dei sottotitoli", "Untertitel-Patches konfigurieren", "Configurer les patchs de sous-titres", "Configurar patches de legendas", "字幕パッチを設定", "자막 패치 설정", "配置字幕补丁设置", "設定字幕修補程式"},
        {"Allow Importing Subs from Local Storage", "Permitir importar subtítulos del almacenamiento local", "Consenti l’importazione di sottotitoli dalla memoria locale", "Untertitel aus lokalem Speicher importieren", "Autoriser l’importation de sous-titres locaux", "Permitir importar legendas do armazenamento local", "ローカルストレージからの字幕読み込みを許可", "로컬 저장소에서 자막 가져오기 허용", "允许从本地存储导入字幕", "允許從本機儲存空間匯入字幕"},
        {"Show Local Storage in ExoPlayer's subtitle menu.", "Muestra Almacenamiento local en el menú de subtítulos de ExoPlayer.", "Mostra Memoria locale nel menu dei sottotitoli di ExoPlayer.", "Zeigt Lokaler Speicher im Untertitelmenü von ExoPlayer an.", "Affiche Stockage local dans le menu des sous-titres d’ExoPlayer.", "Mostrar Armazenamento local no menu de legendas do ExoPlayer.", "ExoPlayer の字幕メニューにローカルストレージを表示します。", "ExoPlayer 자막 메뉴에 로컬 저장소를 표시합니다.", "在 ExoPlayer 的字幕菜单中显示本地存储。", "在 ExoPlayer 的字幕選單中顯示本機儲存空間。"},
    };
}
