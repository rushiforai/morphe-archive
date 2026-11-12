package app.morphe.extension.chmate;

import java.lang.reflect.Field;
import java.util.Arrays;

/** Regression: Animanch /arc/img proxy returns a new array from the native getter. */
public final class AttachmentCacheFieldsTest {
    static final class Multiple {
        String[] thumbnails = {"elsewhere"};
        String[] images;
        static String[] global = {"untouched"};
        Multiple(String[] images) { this.images = images; }
    }
    static final class Ambiguous {
        String[] images, related;
        Ambiguous(String[] src) { images = src.clone(); related = src.clone(); }
    }
    static final class Single {
        String[] images;
    }
    private static void check(boolean condition) { if (!condition) throw new AssertionError("attachment cache reconnect"); }
    public static void main(String[] unused) throws Exception {
        String[] source = {"https://bbs.animanch.com/arc/img/7557374/98"};
        String[] proxy = {"http://127.0.0.1:1234/m/board/arc/img/7557374/98.jpg"};
        Multiple two = new Multiple(source);
        Field selected = AttachmentCacheFields.reconnect(two, source, proxy);
        check(selected != null && selected.getName().equals("images"));
        check(two.images == proxy && two.thumbnails.length == 1
                && two.thumbnails[0].equals("elsewhere") && Multiple.global[0].equals("untouched"));
        String[] equal = source.clone();
        Multiple copiedGetter = new Multiple(equal);
        check(AttachmentCacheFields.reconnect(copiedGetter, source, proxy) != null);
        check(copiedGetter.images == proxy);
        Ambiguous ambiguous = new Ambiguous(source);
        check(AttachmentCacheFields.reconnect(ambiguous, source, proxy) == null);
        check(Arrays.equals(ambiguous.images, source) && Arrays.equals(ambiguous.related, source));
        Single single = new Single();
        check(AttachmentCacheFields.reconnect(single, source, proxy) != null && single.images == proxy);
        check(AttachmentCacheFields.reconnect(two, proxy, proxy) != null);
        System.out.println("AttachmentCacheFieldsTest OK");
    }
}
