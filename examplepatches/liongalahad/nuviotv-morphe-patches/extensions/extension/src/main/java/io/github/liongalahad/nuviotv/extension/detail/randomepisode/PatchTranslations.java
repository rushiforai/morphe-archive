package io.github.liongalahad.nuviotv.extension.detail.randomepisode;

import io.github.liongalahad.nuviotv.extension.settings.MorpheTranslations;

/** Owned translation catalogue. Columns: en, es, it, de, fr, pt, ja, ko, zh-Hans, zh-Hant. */
final class PatchTranslations {
    private PatchTranslations() {}
    static void register() { MorpheTranslations.register(ENTRIES); }
    static final String[][] ENTRIES = {
        {"Episodes included", "Episodios incluidos", "Episodi inclusi", "Enthaltene Episoden", "Épisodes inclus", "Episódios incluídos", "対象エピソード", "포함할 에피소드", "包含的单集", "包含的單集"},
        {"Include every aired regular episode.", "Incluye todos los episodios regulares ya emitidos.", "Include tutti gli episodi regolari già trasmessi.", "Alle bereits ausgestrahlten regulären Episoden einschließen.", "Inclure tous les épisodes réguliers déjà diffusés.", "Incluir todos os episódios regulares já transmitidos.", "放送済みの通常エピソードをすべて含めます。", "방영된 모든 정규 에피소드를 포함합니다.", "包含所有已播出的常规单集。", "包含所有已播出的常規單集。"},
        {"Exclude completed episodes; partially watched episodes remain available.", "Excluye los episodios terminados; los vistos parcialmente siguen disponibles.", "Esclude gli episodi completati; quelli visti in parte restano disponibili.", "Abgeschlossene Episoden ausschließen; teilweise gesehene bleiben verfügbar.", "Exclure les épisodes terminés ; ceux partiellement vus restent disponibles.", "Excluir episódios concluídos; os parcialmente vistos continuam disponíveis.", "視聴済みのエピソードを除外します。途中まで視聴したものは引き続き選択できます。", "끝까지 시청한 에피소드는 제외하며, 일부만 시청한 에피소드는 계속 포함합니다.", "排除已看完的单集；只看了一部分的单集仍可播放。", "排除已看完的單集；僅觀看部分內容的單集仍可播放。"},
        {"Detail Page", "Página de detalles", "Pagina dei dettagli", "Detailseite", "Page de détails", "Página de detalhes", "詳細ページ", "상세 페이지", "详情页", "詳細資訊頁面"},
        {"Configure detail page patch settings", "Configura los parches de la página de detalles", "Configura le patch della pagina dei dettagli", "Patches für die Detailseite konfigurieren", "Configurer les patchs de la page de détails", "Configurar patches da página de detalhes", "詳細ページのパッチを設定", "상세 페이지 패치 설정", "配置详情页补丁设置", "設定詳細資訊頁面的修補程式"},
        {"Enable Per-Show Random Playback", "Activar reproducción aleatoria por serie", "Abilita la riproduzione casuale per serie", "Zufallswiedergabe pro Serie aktivieren", "Activer la lecture aléatoire par série", "Ativar reprodução aleatória por série", "シリーズごとのランダム再生を有効にする", "시리즈별 무작위 재생 활성화", "启用每部剧集的随机播放", "啟用各影集的隨機播放"},
        {"Show a persistent random playback toggle on each series detail page.", "Muestra un interruptor de reproducción aleatoria que conserva su estado para cada serie.", "Mostra un interruttore di riproduzione casuale che mantiene la scelta per ogni serie.", "Zeigt auf jeder Seriendetailseite einen Schalter mit gespeicherter Auswahl für die Zufallswiedergabe.", "Affiche un interrupteur de lecture aléatoire dont le choix est conservé pour chaque série.", "Mostrar em cada série um botão de reprodução aleatória que mantém a escolha.", "各シリーズの詳細ページに、選択を保持するランダム再生スイッチを表示します。", "각 시리즈 상세 페이지에 선택 상태가 저장되는 무작위 재생 스위치를 표시합니다.", "在每部剧集的详情页显示随机播放开关，并保存各自的选择。", "在各影集的詳細資訊頁面顯示隨機播放開關，並儲存各自的選擇。"},
        {"All", "Todos", "Tutti", "Alle", "Tous", "Todos", "すべて", "전체", "全部", "全部"},
        {"Unwatched only", "Solo no vistos", "Solo non visti", "Nur ungesehene", "Non vus uniquement", "Apenas não vistos", "未視聴のみ", "미시청만", "仅未观看", "僅未觀看"},
    };
}
