package io.github.liongalahad.nuviotv.extension.settings;

import io.github.liongalahad.nuviotv.extension.settings.MorpheTranslations;

/** Owned translation catalogue. Columns: en, es, it, de, fr, pt, ja, ko, zh-Hans, zh-Hant. */
final class SettingsTranslations {
    private SettingsTranslations() {}
    static void register() { MorpheTranslations.register(ENTRIES); }
    static final String[][] ENTRIES = {
        {"About", "Acerca de", "Informazioni", "Über", "À propos", "Sobre", "情報", "정보", "关于", "關於"},
        {"Morphe Patches information and project links", "Información de Morphe Patches y enlaces del proyecto", "Informazioni su Morphe Patches e collegamenti al progetto", "Informationen zu Morphe Patches und Projektlinks", "Informations sur Morphe Patches et liens du projet", "Informações sobre Morphe Patches e links do projeto", "Morphe Patches の情報とプロジェクトへのリンク", "Morphe Patches 정보 및 프로젝트 링크", "Morphe Patches 信息和项目链接", "Morphe Patches 資訊與專案連結"},
        {"By %s · Open GitHub repository", "Por %s · Abrir repositorio de GitHub", "Di %s · Apri il repository GitHub", "Von %s · GitHub-Repository öffnen", "Par %s · Ouvrir le dépôt GitHub", "Por %s · Abrir repositório no GitHub", "%s 作成 · GitHub リポジトリを開く", "%s 제작 · GitHub 저장소 열기", "作者：%s · 打开 GitHub 仓库", "作者：%s · 開啟 GitHub 儲存庫"},
        {"Local storage path", "Ruta de almacenamiento local", "Percorso di archiviazione locale", "Lokaler Speicherpfad", "Chemin du stockage local", "Caminho do armazenamento local", "ローカル保存先", "로컬 저장 경로", "本地存储路径", "本機儲存路徑"},
        {"Internal storage", "Almacenamiento interno", "Memoria interna", "Interner Speicher", "Stockage interne", "Armazenamento interno", "内部ストレージ", "내부 저장소", "内部存储", "內部儲存空間"},
        {"Select folder", "Seleccionar carpeta", "Seleziona cartella", "Ordner auswählen", "Sélectionner un dossier", "Selecionar pasta", "フォルダーを選択", "폴더 선택", "选择文件夹", "選擇資料夾"},
        {"Use this folder", "Usar esta carpeta", "Usa questa cartella", "Diesen Ordner verwenden", "Utiliser ce dossier", "Usar esta pasta", "このフォルダーを使用", "이 폴더 사용", "使用此文件夹", "使用此資料夾"},
        {"Cancel", "Cancelar", "Annulla", "Abbrechen", "Annuler", "Cancelar", "キャンセル", "취소", "取消", "取消"},
        {"Back", "Volver", "Indietro", "Zurück", "Retour", "Voltar", "戻る", "뒤로", "返回", "返回"},
        {"Choose local storage path", "Elegir ruta de almacenamiento local", "Scegli il percorso di archiviazione locale", "Lokalen Speicherpfad wählen", "Choisir le chemin du stockage local", "Escolher caminho do armazenamento local", "ローカル保存先を選択", "로컬 저장 경로 선택", "选择本地存储路径", "選擇本機儲存路徑"},
        {"Choose a folder, then select Use this folder.", "Elige una carpeta y selecciona Usar esta carpeta.", "Scegli una cartella, poi seleziona Usa questa cartella.", "Einen Ordner wählen, dann Diesen Ordner verwenden auswählen.", "Choisissez un dossier, puis Utiliser ce dossier.", "Escolha uma pasta e selecione Usar esta pasta.", "フォルダーを選び、「このフォルダーを使用」を選択してください。", "폴더를 선택한 다음 이 폴더 사용을 선택하세요.", "选择文件夹，然后选择使用此文件夹。", "選擇資料夾，再選擇使用此資料夾。"},
        {"Storage devices", "Dispositivos de almacenamiento", "Dispositivi di archiviazione", "Speichergeräte", "Périphériques de stockage", "Dispositivos de armazenamento", "ストレージデバイス", "저장 장치", "存储设备", "儲存裝置"},
        {"Up one level", "Subir un nivel", "Sali di un livello", "Eine Ebene nach oben", "Remonter d’un niveau", "Subir um nível", "一つ上の階層へ", "상위 폴더로", "返回上一级", "返回上一層"},
        {"Use private app folder on this drive", "Usar la carpeta privada de la app en esta unidad", "Usa la cartella privata dell’app su questa unità", "Privaten App-Ordner auf diesem Laufwerk verwenden", "Utiliser le dossier privé de l’application sur ce lecteur", "Usar a pasta privada da aplicação nesta unidade", "このドライブのアプリ専用フォルダーを使用", "이 드라이브의 앱 전용 폴더 사용", "使用此驱动器上的应用专用文件夹", "使用此磁碟上的應用程式專用資料夾"},
        {"Use private app folder?", "¿Usar la carpeta privada de la app?", "Usare la cartella privata dell’app?", "Privaten App-Ordner verwenden?", "Utiliser le dossier privé de l’application ?", "Usar a pasta privada da aplicação?", "アプリ専用フォルダーを使用しますか？", "앱 전용 폴더를 사용할까요?", "使用应用专用文件夹？", "使用應用程式專用資料夾？"},
        {"Fire OS allows downloads in this folder, but Android removes them if this app is uninstalled.", "Fire OS permite descargar en esta carpeta, pero Android elimina los archivos al desinstalar esta app.", "Fire OS consente i download in questa cartella, ma Android li elimina se disinstalli l’app.", "Fire OS erlaubt Downloads in diesem Ordner. Android löscht sie beim Deinstallieren dieser App.", "Fire OS autorise les téléchargements dans ce dossier, mais Android les supprime si l’application est désinstallée.", "O Fire OS permite transferências nesta pasta, mas o Android elimina-as se desinstalar esta aplicação.", "Fire OS ではこのフォルダーにダウンロードできますが、アプリをアンインストールすると Android がファイルを削除します。", "Fire OS는 이 폴더에 다운로드를 허용하지만, 앱을 제거하면 Android가 파일도 삭제합니다.", "Fire OS 允许下载到此文件夹，但卸载此应用时 Android 会删除这些文件。", "Fire OS 允許下載至此資料夾，但解除安裝此應用程式時 Android 會刪除這些檔案。"},
        {"Continue", "Continuar", "Continua", "Weiter", "Continuer", "Continuar", "続行", "계속", "继续", "繼續"},
    };
}
