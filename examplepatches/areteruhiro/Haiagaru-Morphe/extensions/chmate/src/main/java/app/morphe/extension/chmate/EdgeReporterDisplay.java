package app.morphe.extension.chmate;

import java.lang.reflect.Field;
import java.util.concurrent.ConcurrentHashMap;

/** Display-only fallback; never edits a native title, NG rule, matcher or hidden state. */
public final class EdgeReporterDisplay {
    private static final ThreadLocal<Long> THREAD = new ThreadLocal<>();
    private static final ThreadLocal<Boolean> EDGE = new ThreadLocal<>();
    private static final ThreadLocal<String> SCOPE = new ThreadLocal<>();
    private static final ThreadLocal<String> FUTABA_TAG = new ThreadLocal<>();
    private static final ConcurrentHashMap<Class<?>, Field> FIELDS = new ConcurrentHashMap<>();
    private EdgeReporterDisplay() {}

    private static Field field(Object object, String name) throws ReflectiveOperationException {
        Field cached = FIELDS.get(object.getClass());
        if (cached != null) return cached;
        Field found = object.getClass().getDeclaredField(name);
        found.setAccessible(true);
        FIELDS.put(object.getClass(), found);
        return found;
    }

    public static void begin(Object adapter) {
        end();
        SiteThreadMetadata.begin(adapter);
        ThreadListThumbnail.begin(adapter);
        if (adapter == null) return;
        String name = adapter.getClass().getName();
        String boardField = name.equals("o.m8a") ? "r"
                : name.equals("o.getWriteBytesTotal") ? "g"
                : name.equals("o.zzavb") ? "c" : null;
        if (boardField == null) return;
        try {
            Object url = field(adapter, boardField).get(adapter);
            ThreadListThumbnailRules.Board mirror=ThreadListThumbnailRules.board(String.valueOf(url));
            if(mirror!=null&&mirror.host.equals("die-or.work"))FUTABA_TAG.set(mirror.name.startsWith("img/")?"(img)":"(may)");
            String scope=EdgeReporterId.scope(url);
            if(scope!=null){
                EDGE.set(true);SCOPE.set(scope);
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Unknown native state must leave the original text unchanged.
        }
    }

    public static void subject(Object subject) {
        SiteThreadMetadata.subject(subject);
        ThreadListThumbnail.subject(subject);
        THREAD.remove();
        if (!Boolean.TRUE.equals(EDGE.get()) || subject == null) return;
        String name = subject.getClass().getName();
        String key = name.equals("o.MaxAdViewImplExternalSyntheticLambda1") ? "e"
                : name.equals("o.CertificateChainCleaner") ? "b"
                : name.equals("o.setSkipText") ? "d" : null;
        if (key == null) return;
        try {
            long thread = field(subject, key).getLong(subject);
            if (thread > 0 && thread < 9_240_000_000L) THREAD.set(thread);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Do not guess a thread from a title or another board.
        }
    }

    public static String title(String original) {
        String tag=FUTABA_TAG.get();
        if(original!=null&&tag!=null&&!original.endsWith(tag))original+=" "+tag;
        Long thread = THREAD.get();
        THREAD.remove();
        if (!Boolean.TRUE.equals(EDGE.get()) || thread == null) return original;
        if(!EdgeReporterOptions.board())return EdgeReporterId.titleForNextThreadMatch(original);
        return EdgeReporterHistory.displayTitle(SCOPE.get(),thread, original);
    }

    public static void end() { endRow(null); }
    public static void endRow(Object row) { ThreadListThumbnail.end(row); SiteThreadMetadata.end(); THREAD.remove(); EDGE.remove(); SCOPE.remove(); FUTABA_TAG.remove(); }
}
