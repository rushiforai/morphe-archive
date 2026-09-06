package io.github.liongalahad.nuviotv.extension.subtitles.sdhmarking;

import io.github.liongalahad.nuviotv.extension.settings.MorpheTranslations;

/** Owned translation catalogue. Columns: en, es, it, de, fr, pt, ja, ko, zh-Hans, zh-Hant. */
final class PatchTranslations {
    private PatchTranslations() {}
    static void register() { MorpheTranslations.register(ENTRIES); }
    static final String[][] ENTRIES = {
        {"Subtitles", "Subtítulos", "Sottotitoli", "Untertitel", "Sous-titres", "Legendas", "字幕", "자막", "字幕", "字幕"},
        {"Configure subtitle patch settings", "Configura los parches de subtítulos", "Configura le patch dei sottotitoli", "Untertitel-Patches konfigurieren", "Configurer les patchs de sous-titres", "Configurar patches de legendas", "字幕パッチを設定", "자막 패치 설정", "配置字幕补丁设置", "設定字幕修補程式"},
        {"Mark SDH subtitles", "Marcar subtítulos SDH", "Contrassegna i sottotitoli SDH", "SDH-Untertitel kennzeichnen", "Marquer les sous-titres SDH", "Identificar legendas SDH", "SDH 字幕を識別表示", "SDH 자막 표시", "标记 SDH 字幕", "標記 SDH 字幕"},
        {"Add SDH to English subtitle titles using metadata and repeated annotation patterns.", "Añade SDH a los títulos de subtítulos en inglés a partir de metadatos y anotaciones repetidas.", "Aggiunge SDH ai titoli dei sottotitoli inglesi usando metadati e annotazioni ripetute.", "Ergänzt englische Untertiteltitel anhand von Metadaten und wiederholten Anmerkungen um SDH.", "Ajoute SDH aux titres des sous-titres anglais à partir des métadonnées et des annotations répétées.", "Adicionar SDH aos títulos das legendas em inglês com base em metadados e padrões de anotações repetidos.", "メタデータと繰り返される注釈パターンに基づいて、英語字幕のタイトルに SDH を追加します。", "메타데이터와 반복되는 주석 패턴을 사용하여 영어 자막 제목에 SDH를 추가합니다.", "根据元数据和重复的注释模式，在英语字幕标题中添加 SDH。", "根據中繼資料與重複的註解模式，在英語字幕標題中新增 SDH。"},
    };
}
