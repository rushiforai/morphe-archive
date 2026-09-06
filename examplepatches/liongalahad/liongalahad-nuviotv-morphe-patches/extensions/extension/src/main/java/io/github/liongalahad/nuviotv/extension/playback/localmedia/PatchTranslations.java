package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import io.github.liongalahad.nuviotv.extension.settings.MorpheTranslations;

/** Owned translation catalogue. Columns: en, es, it, de, fr, pt, ja, ko, zh-Hans, zh-Hant. */
final class PatchTranslations {
    private PatchTranslations() {}
    static void register() { MorpheTranslations.register(ENTRIES); }
    static final String[][] ENTRIES = {
        {"Playback", "Reproducción", "Riproduzione", "Wiedergabe", "Lecture", "Reprodução", "再生", "재생", "播放", "播放"},
        {"Configure playback patch settings", "Configura los parches de reproducción", "Configura le patch di riproduzione", "Wiedergabe-Patches konfigurieren", "Configurer les patchs de lecture", "Configurar patches de reprodução", "再生パッチを設定", "재생 패치 설정", "配置播放补丁设置", "設定播放修補程式"},
        {"Local Media", "Archivos locales", "Contenuti locali", "Lokale Medien", "Médias locaux", "Ficheiros locais", "ローカルメディア", "로컬 미디어", "本地媒体", "本機媒體"},
        {"Browse and play video files stored on this device", "Explora y reproduce vídeos guardados en este dispositivo", "Sfoglia e riproduci i video salvati su questo dispositivo", "Auf diesem Gerät gespeicherte Videos durchsuchen und abspielen", "Parcourir et lire les vidéos stockées sur cet appareil", "Explorar e reproduzir vídeos guardados neste dispositivo", "このデバイスに保存した動画を閲覧・再生", "이 기기에 저장된 동영상 탐색 및 재생", "浏览并播放此设备上存储的视频", "瀏覽並播放此裝置上儲存的影片"},
        {"Show local storage in Library", "Mostrar almacenamiento local en la biblioteca", "Mostra l’archiviazione locale nella libreria", "Lokalen Speicher in der Bibliothek anzeigen", "Afficher le stockage local dans la bibliothèque", "Mostrar armazenamento local na biblioteca", "ライブラリにローカルストレージを表示", "라이브러리에 로컬 저장소 표시", "在媒体库中显示本地存储", "在媒體庫中顯示本機儲存空間"},
        {"Add Storage beside Saved and Cloud. Access is requested when enabled.", "Añade Almacenamiento junto a Guardado y Nube. Se solicita acceso al abrirlo.", "Aggiunge Archiviazione accanto a Salvati e Cloud. L’accesso viene richiesto all’apertura.", "Fügt Speicher neben Gespeichert und Cloud hinzu. Der Zugriff wird beim Öffnen angefordert.", "Ajoute Stockage à côté d’Enregistrés et de Cloud. L’accès est demandé à l’ouverture.", "Adicionar Armazenamento ao lado de Guardados e Nuvem. O acesso é solicitado ao abrir.", "保存済み・クラウドの隣にストレージを追加します。開く際にアクセスを要求します。", "저장됨 및 클라우드 옆에 저장소를 추가합니다. 열 때 접근 권한을 요청합니다.", "在已保存和云端旁添加存储。打开时会请求访问权限。", "在已儲存和雲端旁新增儲存空間。開啟時會要求存取權限。"},
    };
}
