package app.morphe.extension.instants;

import android.content.Context;
import android.content.res.Configuration;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * User-visible texts added by the Instants patches, in the language the app is using.
 *
 * The language comes from the app's own resources configuration (which follows the in-app or
 * device language), not from a fixed choice. Unknown languages fall back to English.
 */
public final class InstantsStrings {
    // Index of each text inside the arrays below.
    private static final int SAVE_TO_GALLERY = 0;
    private static final int SAVED_TO = 1; // %s = folder
    private static final int SAVE_FAILED = 2;
    private static final int NO_PHOTO = 3;
    private static final int NEEDS_ANDROID_10 = 4;
    private static final int IMAGE_SELECTED = 5;
    private static final int VIDEO_SELECTED = 6;
    private static final int VIDEO_TOO_LONG = 7;
    private static final int VIDEO_FAILED = 8;
    private static final int VIDEO_SAVED_TO = 9; // %s = folder
    private static final int VIDEO_SAVE_FAILED = 10;

    private static final String[] EN = {
            "Save to gallery",
            "Photo saved to %s",
            "Couldn't save the photo.",
            "No photo found to save.",
            "Saving to the gallery requires Android 10 or later.",
            "Image selected. Tap the shutter to send.",
            "Video selected. Hold the shutter to send.",
            "The video is longer than 6 seconds.",
            "Couldn't load the video.",
            "Video saved to %s",
            "Couldn't save the video.",
    };

    private static final Map<String, String[]> TRANSLATIONS = new HashMap<>();

    static {
        TRANSLATIONS.put("pt", new String[]{
                "Salvar na galeria",
                "Foto salva em %s",
                "Não foi possível salvar a foto.",
                "Nenhuma foto encontrada para salvar.",
                "Salvar na galeria exige Android 10 ou superior.",
                "Imagem selecionada. Toque no obturador para enviar.",
                "Vídeo selecionado. Segure o obturador para enviar.",
                "O vídeo tem mais de 6 segundos.",
                "Não foi possível carregar o vídeo.",
                "Vídeo salvo em %s",
                "Não foi possível salvar o vídeo.",
        });
        TRANSLATIONS.put("es", new String[]{
                "Guardar en la galería",
                "Foto guardada en %s",
                "No se pudo guardar la foto.",
                "No se encontró ninguna foto para guardar.",
                "Guardar en la galería requiere Android 10 o superior.",
                "Imagen seleccionada. Toca el obturador para enviarla.",
                "Video seleccionado. Mantén pulsado el obturador para enviarlo.",
                "El video dura más de 6 segundos.",
                "No se pudo cargar el video.",
                "Video guardado en %s",
                "No se pudo guardar el video.",
        });
        TRANSLATIONS.put("fr", new String[]{
                "Enregistrer dans la galerie",
                "Photo enregistrée dans %s",
                "Impossible d'enregistrer la photo.",
                "Aucune photo à enregistrer.",
                "L'enregistrement dans la galerie nécessite Android 10 ou version ultérieure.",
                "Image sélectionnée. Appuyez sur le déclencheur pour l'envoyer.",
                "Vidéo sélectionnée. Maintenez le déclencheur pour l'envoyer.",
                "La vidéo dure plus de 6 secondes.",
                "Impossible de charger la vidéo.",
                "Vidéo enregistrée dans %s",
                "Impossible d'enregistrer la vidéo.",
        });
        TRANSLATIONS.put("de", new String[]{
                "In Galerie speichern",
                "Foto gespeichert in %s",
                "Das Foto konnte nicht gespeichert werden.",
                "Kein Foto zum Speichern gefunden.",
                "Zum Speichern in der Galerie ist Android 10 oder höher erforderlich.",
                "Bild ausgewählt. Tippe auf den Auslöser, um es zu senden.",
                "Video ausgewählt. Halte den Auslöser gedrückt, um es zu senden.",
                "Das Video ist länger als 6 Sekunden.",
                "Das Video konnte nicht geladen werden.",
                "Video gespeichert in %s",
                "Das Video konnte nicht gespeichert werden.",
        });
        TRANSLATIONS.put("it", new String[]{
                "Salva nella galleria",
                "Foto salvata in %s",
                "Impossibile salvare la foto.",
                "Nessuna foto da salvare.",
                "Il salvataggio nella galleria richiede Android 10 o versione successiva.",
                "Immagine selezionata. Tocca l'otturatore per inviarla.",
                "Video selezionato. Tieni premuto l'otturatore per inviarlo.",
                "Il video dura più di 6 secondi.",
                "Impossibile caricare il video.",
                "Video salvato in %s",
                "Impossibile salvare il video.",
        });
        TRANSLATIONS.put("ru", new String[]{
                "Сохранить в галерею",
                "Фото сохранено в %s",
                "Не удалось сохранить фото.",
                "Не найдено фото для сохранения.",
                "Для сохранения в галерею нужен Android 10 или новее.",
                "Изображение выбрано. Нажмите кнопку затвора, чтобы отправить.",
                "Видео выбрано. Удерживайте кнопку затвора, чтобы отправить.",
                "Видео длиннее 6 секунд.",
                "Не удалось загрузить видео.",
                "Видео сохранено в %s",
                "Не удалось сохранить видео.",
        });
        TRANSLATIONS.put("tr", new String[]{
                "Galeriye kaydet",
                "Fotoğraf %s klasörüne kaydedildi",
                "Fotoğraf kaydedilemedi.",
                "Kaydedilecek fotoğraf bulunamadı.",
                "Galeriye kaydetmek için Android 10 veya üstü gerekir.",
                "Görsel seçildi. Göndermek için deklanşöre dokunun.",
                "Video seçildi. Göndermek için deklanşöre basılı tutun.",
                "Video 6 saniyeden uzun.",
                "Video yüklenemedi.",
                "Video %s klasörüne kaydedildi",
                "Video kaydedilemedi.",
        });
        TRANSLATIONS.put("in", new String[]{ // Android reports Indonesian as "in"
                "Simpan ke galeri",
                "Foto disimpan di %s",
                "Foto tidak dapat disimpan.",
                "Tidak ada foto untuk disimpan.",
                "Menyimpan ke galeri memerlukan Android 10 atau lebih baru.",
                "Gambar dipilih. Ketuk rana untuk mengirim.",
                "Video dipilih. Tahan rana untuk mengirim.",
                "Video lebih dari 6 detik.",
                "Video tidak dapat dimuat.",
                "Video disimpan di %s",
                "Video tidak dapat disimpan.",
        });
        TRANSLATIONS.put("nl", new String[]{
                "Opslaan in galerij",
                "Foto opgeslagen in %s",
                "De foto kon niet worden opgeslagen.",
                "Geen foto gevonden om op te slaan.",
                "Opslaan in de galerij vereist Android 10 of hoger.",
                "Afbeelding geselecteerd. Tik op de sluiter om te verzenden.",
                "Video geselecteerd. Houd de sluiter ingedrukt om te verzenden.",
                "De video is langer dan 6 seconden.",
                "De video kon niet worden geladen.",
                "Video opgeslagen in %s",
                "De video kon niet worden opgeslagen.",
        });
        TRANSLATIONS.put("pl", new String[]{
                "Zapisz w galerii",
                "Zdjęcie zapisano w %s",
                "Nie udało się zapisać zdjęcia.",
                "Nie znaleziono zdjęcia do zapisania.",
                "Zapis w galerii wymaga Androida 10 lub nowszego.",
                "Wybrano obraz. Dotknij spustu migawki, aby wysłać.",
                "Wybrano film. Przytrzymaj spust migawki, aby wysłać.",
                "Film jest dłuższy niż 6 sekund.",
                "Nie udało się wczytać filmu.",
                "Film zapisano w %s",
                "Nie udało się zapisać filmu.",
        });
        TRANSLATIONS.put("ja", new String[]{
                "ギャラリーに保存",
                "写真を %s に保存しました",
                "写真を保存できませんでした。",
                "保存する写真が見つかりません。",
                "ギャラリーへの保存には Android 10 以降が必要です。",
                "画像を選択しました。シャッターをタップして送信します。",
                "動画を選択しました。シャッターを長押しして送信します。",
                "動画が6秒を超えています。",
                "動画を読み込めませんでした。",
                "動画を %s に保存しました",
                "動画を保存できませんでした。",
        });
        TRANSLATIONS.put("ko", new String[]{
                "갤러리에 저장",
                "사진을 %s에 저장했습니다",
                "사진을 저장하지 못했습니다.",
                "저장할 사진을 찾을 수 없습니다.",
                "갤러리에 저장하려면 Android 10 이상이 필요합니다.",
                "이미지를 선택했습니다. 셔터를 눌러 전송하세요.",
                "동영상을 선택했습니다. 셔터를 길게 눌러 전송하세요.",
                "동영상이 6초보다 깁니다.",
                "동영상을 불러오지 못했습니다.",
                "동영상을 %s에 저장했습니다",
                "동영상을 저장하지 못했습니다.",
        });
        TRANSLATIONS.put("zh", new String[]{
                "保存到相册",
                "照片已保存到 %s",
                "无法保存照片。",
                "未找到可保存的照片。",
                "保存到相册需要 Android 10 或更高版本。",
                "已选择图片。点按快门即可发送。",
                "已选择视频。长按快门即可发送。",
                "视频时长超过 6 秒。",
                "无法加载视频。",
                "视频已保存到 %s",
                "无法保存视频。",
        });
        TRANSLATIONS.put("ar", new String[]{
                "حفظ في المعرض",
                "تم حفظ الصورة في %s",
                "تعذّر حفظ الصورة.",
                "لم يتم العثور على صورة لحفظها.",
                "يتطلب الحفظ في المعرض Android 10 أو أحدث.",
                "تم اختيار الصورة. اضغط على الغالق للإرسال.",
                "تم اختيار الفيديو. اضغط مطولًا على الغالق للإرسال.",
                "مدة الفيديو أطول من 6 ثوانٍ.",
                "تعذّر تحميل الفيديو.",
                "تم حفظ الفيديو في %s",
                "تعذّر حفظ الفيديو.",
        });
        TRANSLATIONS.put("hi", new String[]{
                "गैलरी में सहेजें",
                "फ़ोटो %s में सहेजी गई",
                "फ़ोटो सहेजी नहीं जा सकी।",
                "सहेजने के लिए कोई फ़ोटो नहीं मिली।",
                "गैलरी में सहेजने के लिए Android 10 या उसके बाद का संस्करण चाहिए।",
                "छवि चुनी गई। भेजने के लिए शटर पर टैप करें।",
                "वीडियो चुना गया। भेजने के लिए शटर को दबाए रखें।",
                "वीडियो 6 सेकंड से लंबा है।",
                "वीडियो लोड नहीं हो सका।",
                "वीडियो %s में सहेजा गया",
                "वीडियो सहेजा नहीं जा सका।",
        });
        TRANSLATIONS.put("vi", new String[]{
                "Lưu vào thư viện",
                "Đã lưu ảnh vào %s",
                "Không thể lưu ảnh.",
                "Không tìm thấy ảnh để lưu.",
                "Lưu vào thư viện yêu cầu Android 10 trở lên.",
                "Đã chọn hình ảnh. Chạm vào nút chụp để gửi.",
                "Đã chọn video. Nhấn giữ nút chụp để gửi.",
                "Video dài hơn 6 giây.",
                "Không thể tải video.",
                "Đã lưu video vào %s",
                "Không thể lưu video.",
        });
    }

    private InstantsStrings() {
    }

    /** Menu row label; called from patched code, which has no Context at hand. */
    public static String saveToGallery() {
        return get(InstantsGalleryHelper.getActivity(), SAVE_TO_GALLERY);
    }

    static String saved(Context context, String folder) {
        return String.format(Locale.ROOT, get(context, SAVED_TO), folder);
    }

    static String saveFailed(Context context) {
        return get(context, SAVE_FAILED);
    }

    static String noPhoto(Context context) {
        return get(context, NO_PHOTO);
    }

    static String needsAndroid10(Context context) {
        return get(context, NEEDS_ANDROID_10);
    }

    static String imageSelected(Context context) {
        return get(context, IMAGE_SELECTED);
    }

    static String videoSelected(Context context) {
        return get(context, VIDEO_SELECTED);
    }

    static String videoTooLong(Context context) {
        return get(context, VIDEO_TOO_LONG);
    }

    static String videoFailed(Context context) {
        return get(context, VIDEO_FAILED);
    }

    static String videoSaved(Context context, String folder) {
        return String.format(Locale.ROOT, get(context, VIDEO_SAVED_TO), folder);
    }

    static String videoSaveFailed(Context context) {
        return get(context, VIDEO_SAVE_FAILED);
    }

    private static String get(Context context, int index) {
        String[] texts = TRANSLATIONS.get(languageOf(context));
        return (texts != null ? texts : EN)[index];
    }

    // The app's own configuration, so an in-app language choice is respected; the device default
    // is the fallback.
    private static String languageOf(Context context) {
        Locale locale = null;
        if (context != null) {
            Configuration configuration = context.getResources().getConfiguration();
            if (!configuration.getLocales().isEmpty()) locale = configuration.getLocales().get(0);
        }
        if (locale == null) locale = Locale.getDefault();
        return locale.getLanguage();
    }
}
