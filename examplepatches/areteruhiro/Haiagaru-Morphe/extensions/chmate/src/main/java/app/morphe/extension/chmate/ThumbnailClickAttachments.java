package app.morphe.extension.chmate;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

/** Keep a 242 thumbnail click aligned with the URLs actually bound to its row. */
public final class ThumbnailClickAttachments {
    private ThumbnailClickAttachments() {}

    public static boolean openThread(Object clicked){
        if(!(clicked instanceof android.view.View))return false;
        try{
            String selected=url(clicked);if(selected==null)return false;
            return MediaViewerNavigation.openThreadThumbnail(((android.view.View)clicked).getContext(),selected);
        }catch(ReflectiveOperationException|RuntimeException error){return false;}
    }

    public static CharSequence[] links(Object row, Object clicked, CharSequence[] original) {
        if (row == null || clicked == null || original == null) return original;
        try {
            Field field = row.getClass().getDeclaredField("e");
            field.setAccessible(true);
            Object value = field.get(row);
            if (!(value instanceof List<?>)) return original;
            List<?> thumbnails = (List<?>) value;
            int selected = thumbnails.indexOf(clicked);
            if (selected < 0) return original;
            String selectedUrl = url(clicked);
            if (selectedUrl == null || selectedUrl.isEmpty()) return original;
            if (selected < original.length && original[selected] != null
                    && selectedUrl.equals(original[selected].toString())) return original;

            CharSequence[] visible = new CharSequence[thumbnails.size()];
            for (int index = 0; index < thumbnails.size(); index++) {
                String bound = url(thumbnails.get(index));
                if (bound == null || bound.isEmpty()) return original;
                // Retain native media objects (video etc.) whenever available.
                CharSequence media = null;
                for (CharSequence candidate : original) {
                    if (candidate != null && bound.equals(candidate.toString())) {
                        media = candidate;
                        break;
                    }
                }
                if (media == null) {
                    // Only synthesize normal HTTP(S) image URLs. Other media
                    // require ChMate's native typed projection and must not be
                    // reinterpreted as images.
                    if (!bound.matches("(?i)^https?://[^\\s]+\\.(?:png|jpe?g|gif|webp|bmp|avif)(?:[?#].*)?$"))
                        return original;
                    media = bound;
                }
                visible[index] = media;
            }
            return visible;
        } catch (ReflectiveOperationException | RuntimeException error) {
            return original;
        }
    }

    private static String url(Object thumbnail) throws ReflectiveOperationException {
        Method getter = thumbnail.getClass().getMethod("getImageUrl");
        Object value = getter.invoke(thumbnail);
        return value instanceof String ? (String) value : null;
    }
}
