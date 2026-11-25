import com.medium.android.graphql.FullPostQuery$Data;
import com.medium.android.graphql.FullPostQuery$Post;
import com.medium.android.graphql.fragment.FullPostData;
import nl.johninnl.medium.reader.*;
import java.util.Objects;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;

/** A collector owns one refresh generation within its native query display session. */
final class MediumReaderCollector implements ld5 {
    final ld5 downstream;
    final String expectedPostId;
    final ArticleLoader source;
    final ExecutorService workers;
    final ReaderStatus.Sink status;
    final MediumReaderSession session;
    final long generation;
    boolean readable;
    boolean emittedReadable;
    Object lastEnvelope;
    ReaderArticle lastArticle;
    String lastRevision;
    Long lastUpdatedAt;

    MediumReaderCollector(ld5 downstream, String expectedPostId, ArticleLoader source, ExecutorService workers, ReaderStatus.Sink status, MediumReaderSession session) {
        this.downstream = downstream; this.expectedPostId = expectedPostId; this.source = source; this.workers = workers; this.status = status;
        this.session = session; this.generation = session.begin();
        MediumReaderSession.Accepted prior = session.accepted();
        if (prior != null) {
            readable = true; lastEnvelope = prior.envelope; lastArticle = prior.article;
            lastRevision = prior.revision; lastUpdatedAt = prior.updatedAt;
        }
    }
    @Override public Object a(Object value, yl2 continuation) {
        return new Emit(this, value, continuation).invokeSuspend(tzg.a);
    }

    private static final class Resolved {
        final Object envelope;
        final ReaderArticle article;
        Resolved(Object envelope, ReaderArticle article) { this.envelope = envelope; this.article = article; }
    }
    private static final class Emit extends am2 {
        final MediumReaderCollector owner;
        final Object original;
        Object fallback;
        int label;
        Cancellation cancellation;
        ArticleRequest request;
        ReaderStatus pendingStatus;
        ReaderArticle pendingArticle;
        boolean pendingReadable;
        boolean originalFull;
        Object emittedValue;

        Emit(MediumReaderCollector owner, Object original, yl2 continuation) { super(continuation); this.owner = owner; this.original = original; this.fallback = original; }

        @Override public Object invokeSuspend(Object result) {
            checkFailure(result);
            owner.session.check(owner.generation);
            switch (label) {
                case 0: return begin();
                case 1: return loaded((ReaderTask.Result<?>) result);
                case 2: return accepted();
                default: throw new IllegalStateException("Reader continuation resumed in invalid state");
            }
        }

        private Object begin() {
            if (!(original instanceof m0e)) return emit(original);
            Object value = ((m0e) original).a;
            if (value instanceof l0e) return unavailable("SOURCE", original);
            if (!(value instanceof s4b)) return emit(original);
            s4b source = (s4b) value;
            FullPostQuery$Post post = source.a == null ? null : source.a.getPost();
            if (post == null) return unavailable("MISSING_SOURCE", original);
            if (!owner.expectedPostId.equals(post.getId())) {
                return unavailable("IDENTITY", new m0e(new l0e(new ArticleException("IDENTITY", "Received another article"))));
            }
            try {
                FullPostQuery$Data safe = MediumReaderModels.staticEmbeds(source.a);
                if (safe != source.a) { source = new s4b(safe, source.b); fallback = new m0e(source); post = safe.getPost(); }
            } catch (ArticleException failure) { return unavailable(failure.code, original); }
            final s4b safeSource = source;
            FullPostData full = post.getFullPostData();
            if (!full.getContent().isLockedPreviewOnly() && !full.getContent().getBodyModel().getPostBodyData().getParagraphs().isEmpty()) {
                MediumReaderOfflineSnapshots.remember(safeSource.a, owner.source);
                pendingReadable = true; originalFull = true;
                pendingStatus = new ReaderStatus(owner.expectedPostId, "ORIGINAL", null, null);
                return emit(fallback);
            }
            request = new ArticleRequest(owner.expectedPostId, full.getPostMetaData().getLatestPublishedVersion(), full.getPostMetaData().getUpdatedAt(), full.getPostMetaData().getMediumUrl());
            ReaderArticle reusable = owner.lastArticle != null && owner.lastArticle.cacheEpoch == owner.source.cacheEpoch() && Objects.equals(owner.lastRevision, request.revision) &&
                    Objects.equals(owner.lastUpdatedAt, request.mediumUpdatedAt) ? owner.lastArticle : null;
            cancellation = new Cancellation();
            owner.status.publish(new ReaderStatus(owner.expectedPostId, "LOADING", null, owner.lastArticle));
            label = 1;
            Object awaited = MediumReaderAwait.run(owner.workers, token -> {
                ReaderArticle article = reusable != null ? reusable : owner.source.load(request, token);
                token.check();
                if (article == null || article.body == null) throw new ArticleException("MISSING_BODY", "Reader did not return an article");
                FullPostQuery$Data updated = MediumReaderModels.replace(safeSource.a, article.body);
                token.check();
                return new Resolved(new m0e(new s4b(updated, safeSource.b)), article);
            }, cancellation, this);
            if (awaited == so2.COROUTINE_SUSPENDED) return awaited;
            return loaded((ReaderTask.Result<?>) awaited);
        }

        private Object loaded(ReaderTask.Result<?> result) {
            if (cancellation.isCancelled()) throw new CancellationException("Reader operation cancelled");
            if (result.failure != null) {
                Throwable failure = result.failure;
                if (failure instanceof VirtualMachineError || failure instanceof ThreadDeath) MediumReaderCollector.<RuntimeException>raise(failure);
                if (failure instanceof ArticleException && ((ArticleException) failure).code.equals("CANCELLED")) throw new CancellationException();
                String code = failure instanceof ArticleException ? ((ArticleException) failure).code :
                        failure instanceof RejectedExecutionException ? "BUSY" : failure instanceof LinkageError ? "INCOMPATIBLE" : "INTERNAL";
                return unavailable(code, fallback);
            }
            Resolved resolved = (Resolved) result.value;
            pendingArticle = resolved.article; pendingReadable = true;
            pendingStatus = new ReaderStatus(owner.expectedPostId, "READY", null, pendingArticle);
            return emit(resolved.envelope);
        }

        private Object unavailable(String code, Object fallback) {
            ReaderStatus failed = new ReaderStatus(owner.expectedPostId, "UNAVAILABLE", code, owner.lastArticle);
            if (owner.readable) {
                if (owner.emittedReadable) { owner.status.publish(failed); return tzg.a; }
                // A new native refresh may already have emitted a loading state.
                // Restore the accepted body once instead of forwarding its error/preview.
                pendingReadable = true; pendingStatus = failed;
                return emit(owner.lastEnvelope);
            }
            pendingStatus = failed;
            return emit(fallback);
        }
        private Object emit(Object value) {
            owner.session.check(owner.generation);
            emittedValue = value;
            label = 2;
            Object emitted = owner.downstream.a(value, this);
            if (emitted == so2.COROUTINE_SUSPENDED) return emitted;
            checkFailure(emitted);
            return accepted();
        }
        private Object accepted() {
            owner.session.check(owner.generation);
            if (pendingReadable) { owner.readable = true; owner.emittedReadable = true; owner.lastEnvelope = emittedValue; }
            if (originalFull) { owner.lastArticle = null; owner.lastRevision = null; owner.lastUpdatedAt = null; }
            if (pendingArticle != null) {
                owner.lastArticle = pendingArticle;
                owner.lastRevision = request.revision; owner.lastUpdatedAt = request.mediumUpdatedAt;
            }
            if (pendingReadable) owner.session.accept(owner.generation, new MediumReaderSession.Accepted(
                owner.lastEnvelope, owner.lastArticle, owner.lastRevision, owner.lastUpdatedAt));
            if (pendingStatus != null) owner.status.publish(pendingStatus);
            return tzg.a;
        }
    }

    static void checkFailure(Object value) { if (value instanceof l0e) MediumReaderCollector.<RuntimeException>raise(((l0e) value).a); }
    @SuppressWarnings("unchecked") private static <T extends Throwable> void raise(Throwable failure) throws T { throw (T) failure; }
}
