import nl.johninnl.medium.reader.ArticleLoader;
import nl.johninnl.medium.reader.ReaderRuntime;
import nl.johninnl.medium.reader.ReaderStatus;
import java.util.concurrent.ExecutorService;

/** App-ABI flow boundary. Caller and loader ownership are scoped to one requested post. */
public final class MediumReaderFlow implements jd5 {
    private final jd5 upstream;
    private final String expectedPostId;
    private final ArticleLoader source;
    private final ExecutorService workers;
    private final ReaderStatus.Sink status;
    private final MediumReaderSession session;
    public MediumReaderFlow(jd5 upstream, String expectedPostId, ArticleLoader source, ExecutorService workers, ReaderStatus.Sink status) {
        this(upstream, expectedPostId, source, workers, status, new MediumReaderSession());
    }
    MediumReaderFlow(jd5 upstream, String expectedPostId, ArticleLoader source, ExecutorService workers, ReaderStatus.Sink status, MediumReaderSession session) {
        this.upstream = upstream; this.expectedPostId = expectedPostId; this.source = source; this.workers = workers; this.status = status; this.session = session;
    }
    public static jd5 wrap(jd5 upstream, String expectedPostId, Object nativeQuery) {
        return new MediumReaderFlow(upstream, expectedPostId, ReaderRuntime.loader(), ReaderRuntime.workers(), ReaderRuntime::publish, MediumReaderSession.forOwner(nativeQuery));
    }
    public static void bindOwner(Object nativeQuery, Object articleViewModel) {
        MediumReaderSession.bind(nativeQuery, articleViewModel);
    }
    @Override public Object b(ld5 downstream, yl2 continuation) {
        return upstream.b(new MediumReaderCollector(downstream, expectedPostId, source, workers, status, session), continuation);
    }
}
