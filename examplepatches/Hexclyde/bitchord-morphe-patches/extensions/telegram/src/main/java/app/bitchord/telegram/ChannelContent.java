package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;

import java.io.IOException;
import java.util.*;

/** Typed, non-HTML descriptions for the read-only channel and official sponsor cards. */
public final class ChannelContent {
    private ChannelContent() {}

    public static String text(TdApi.FormattedText text) {
        return text == null || text.text == null ? "" : text.text;
    }

    public static TdApi.FormattedText caption(TdApi.MessageContent content) {
        if (content instanceof TdApi.MessageText) return ((TdApi.MessageText) content).text;
        if (content instanceof TdApi.MessageAudio) return ((TdApi.MessageAudio) content).caption;
        if (content instanceof TdApi.MessageDocument)
            return ((TdApi.MessageDocument) content).caption;
        if (content instanceof TdApi.MessagePhoto) return ((TdApi.MessagePhoto) content).caption;
        if (content instanceof TdApi.MessageVideo) return ((TdApi.MessageVideo) content).caption;
        if (content instanceof TdApi.MessageAnimation)
            return ((TdApi.MessageAnimation) content).caption;
        return null;
    }

    public static String description(TdApi.Message message) {
        if (message == null || message.content == null) return "Message unavailable";
        TdApi.MessageContent content = message.content;
        String caption = text(caption(content));
        if (content instanceof TdApi.MessageText) return caption;
        String label;
        if (content instanceof TdApi.MessageAudio) {
            TdApi.Audio audio = ((TdApi.MessageAudio) content).audio;
            label =
                    audio == null
                            ? "Audio"
                            : value(audio.title).isEmpty() ? value(audio.fileName) : audio.title;
            if (audio != null && !value(audio.performer).isEmpty()) label += "\n" + audio.performer;
        } else if (content instanceof TdApi.MessageDocument) {
            TdApi.Document doc = ((TdApi.MessageDocument) content).document;
            label = doc == null ? "Document" : value(doc.fileName);
        } else if (content instanceof TdApi.MessagePhoto) label = "Photo";
        else if (content instanceof TdApi.MessageVideo) label = "Video · open in Telegram to watch";
        else if (content instanceof TdApi.MessageAnimation)
            label = "Animation · open in Telegram to view";
        else label = "Message · open in Telegram";
        return label + (caption.isEmpty() ? "" : "\n\n" + caption);
    }

    public static String value(String value) {
        return value == null ? "" : value;
    }

    public static TdApi.File photo(TdApi.Photo photo) {
        TdApi.PhotoSize best = null;
        if (photo != null && photo.sizes != null)
            for (TdApi.PhotoSize size : photo.sizes)
                if (size != null
                        && size.photo != null
                        && (best == null
                                || (long) size.width * size.height
                                        > (long) best.width * best.height)) best = size;
        return best == null ? null : best.photo;
    }

    public static final class Media {
        public final TdApi.File file;
        public final String kind;

        Media(TdApi.File file, String kind) throws IOException {
            if (file == null || file.id == 0) throw new IOException("Missing sponsored media");
            this.file = file;
            this.kind = kind;
        }
    }

    public static Media media(TdApi.MessageContent content) throws IOException {
        if (content instanceof TdApi.MessageText) {
            TdApi.LinkPreview preview = ((TdApi.MessageText) content).linkPreview;
            if (preview == null) return null;
            if (preview.type instanceof TdApi.LinkPreviewTypePhoto)
                return new Media(photo(((TdApi.LinkPreviewTypePhoto) preview.type).photo), "photo");
            if (preview.type instanceof TdApi.LinkPreviewTypeVideo) {
                TdApi.Video video = ((TdApi.LinkPreviewTypeVideo) preview.type).video;
                return new Media(video == null ? null : video.video, "video");
            }
            if (preview.type instanceof TdApi.LinkPreviewTypeAnimation) {
                TdApi.Animation animation =
                        ((TdApi.LinkPreviewTypeAnimation) preview.type).animation;
                return animation(animation);
            }
            return null;
        }
        if (content instanceof TdApi.MessagePhoto)
            return new Media(photo(((TdApi.MessagePhoto) content).photo), "photo");
        if (content instanceof TdApi.MessageVideo) {
            TdApi.Video video = ((TdApi.MessageVideo) content).video;
            return new Media(video == null ? null : video.video, "video");
        }
        if (content instanceof TdApi.MessageAnimation)
            return animation(((TdApi.MessageAnimation) content).animation);
        throw new IOException("Unsupported official sponsored-message content");
    }

    private static Media animation(TdApi.Animation animation) throws IOException {
        if (animation == null) throw new IOException("Missing sponsored animation");
        return new Media(
                animation.animation,
                value(animation.mimeType).startsWith("video/")
                        ? "animation-video"
                        : "animation-image");
    }

    public static List<TdApi.File> files(TdApi.SponsoredMessage message) throws IOException {
        LinkedHashMap<Integer, TdApi.File> result = new LinkedHashMap<>();
        Media media = media(message.content);
        if (media != null) result.put(media.file.id, media.file);
        TdApi.File avatar = message.sponsor == null ? null : photo(message.sponsor.photo);
        if (avatar != null) result.put(avatar.id, avatar);
        return new ArrayList<>(result.values());
    }
}
