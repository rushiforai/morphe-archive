import com.medium.android.graphql.FullPostQuery$Data;
import com.medium.android.graphql.FullPostQuery$Post;
import nl.johninnl.medium.reader.*;
import org.junit.Test;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import static org.junit.Assert.*;

public class MediumReaderFlowTest {
    private static final String ID = "dc7f60d860e4";
    static final class Direct extends java.util.concurrent.AbstractExecutorService {
        public void shutdown() {} public List<Runnable> shutdownNow() { return Collections.emptyList(); }
        public boolean isShutdown() { return false; } public boolean isTerminated() { return false; }
        public boolean awaitTermination(long t, TimeUnit u) { return true; }
        public void execute(Runnable task) { task.run(); }
    }
    private Object envelope(boolean preview) { return new m0e(new s4b(MediumReaderModelsTest.original(preview), true)); }
    private ReaderArticle article(String text) {
        ArticleBody body = new ArticleBody(ID, "Title", URI.create("https://medium.com/p/" + ID), null,
                Collections.singletonList(new ArticleBody.Block("P", text, Collections.emptyList(), null, null)));
        return new ReaderArticle(body, false, 1000, false);
    }
    private String text(Object envelope) {
        FullPostQuery$Data data = ((s4b) ((m0e) envelope).a).a;
        return ((com.medium.android.graphql.fragment.PostBodyData$Paragraph) data.getPost().getFullPostData().getContent().getBodyModel().getPostBodyData().getParagraphs().get(0)).getParagraphData().getText();
    }
    private Object complete(CoroutineFixtures.Completion completion) throws Exception {
        Object result = completion.done.get(3, TimeUnit.SECONDS);
        CoroutineFixtures.check(result); assertEquals(1, completion.signals.get()); return result;
    }

    @Test public void replacesPreviewAndPreservesOriginalOfflineFlag() throws Exception {
        List<Object> emitted = new ArrayList<>(); List<ReaderStatus> status = new ArrayList<>();
        MediumReaderFlow flow = new MediumReaderFlow(CoroutineFixtures.series(envelope(true)), ID,
                (request, cancellation) -> article("Full text"), new Direct(), status::add);
        complete(CoroutineFixtures.start(flow, (value, continuation) -> { emitted.add(value); return tzg.a; }, new CoroutineFixtures.Context(Runnable::run)));
        assertEquals(1, emitted.size()); assertEquals("Full text", text(emitted.get(0)));
        assertTrue(((s4b) ((m0e) emitted.get(0)).a).b);
        assertEquals("READY", status.get(status.size() - 1).phase);
    }

    @Test public void completeOriginalPassesThroughWithoutMirrorRequest() throws Exception {
        Object original = envelope(false); List<Object> emitted = new ArrayList<>(); AtomicInteger loads = new AtomicInteger();
        MediumReaderFlow flow = new MediumReaderFlow(CoroutineFixtures.series(original), ID,
                (request, cancellation) -> { loads.incrementAndGet(); return article("Wrong"); }, new Direct(), status -> {});
        complete(CoroutineFixtures.start(flow, (value, continuation) -> { emitted.add(value); return tzg.a; }, new CoroutineFixtures.Context(Runnable::run)));
        assertEquals(0, loads.get()); assertSame(original, emitted.get(0));
    }

    @Test public void mirrorFailureRetainsOriginalPreviewAndReportsFailure() throws Exception {
        Object original = envelope(true); List<Object> emitted = new ArrayList<>(); List<ReaderStatus> statuses = new ArrayList<>();
        MediumReaderFlow flow = new MediumReaderFlow(CoroutineFixtures.series(original), ID,
                (request, cancellation) -> { throw new ArticleException("NETWORK", "fixture"); }, new Direct(), statuses::add);
        complete(CoroutineFixtures.start(flow, (value, continuation) -> { emitted.add(value); return tzg.a; }, new CoroutineFixtures.Context(Runnable::run)));
        assertSame(original, emitted.get(0)); assertFalse(statuses.isEmpty()); assertEquals("UNAVAILABLE", statuses.get(statuses.size()-1).phase);
        assertEquals("NETWORK", statuses.get(statuses.size()-1).code);
    }

    @Test public void laterSourceFailureDoesNotEraseAcceptedBody() throws Exception {
        List<Object> emitted = new ArrayList<>(); List<ReaderStatus> statuses = new ArrayList<>();
        Object failure = new m0e(new l0e(new IllegalStateException("fixture refresh")));
        MediumReaderFlow flow = new MediumReaderFlow(CoroutineFixtures.series(envelope(true), failure), ID,
                (request, cancellation) -> article("Accepted"), new Direct(), statuses::add);
        complete(CoroutineFixtures.start(flow, (value, continuation) -> { emitted.add(value); return tzg.a; }, new CoroutineFixtures.Context(Runnable::run)));
        assertEquals(1, emitted.size()); assertEquals("Accepted", text(emitted.get(0)));
        assertEquals("UNAVAILABLE", statuses.get(statuses.size()-1).phase);
    }

    @Test public void newNativeRefreshRestoresPreviouslyAcceptedBodyOnSourceFailure() throws Exception {
        MediumReaderSession session = new MediumReaderSession();
        List<Object> first = new ArrayList<>(), refresh = new ArrayList<>(); List<ReaderStatus> statuses = new ArrayList<>();
        complete(CoroutineFixtures.start(new MediumReaderFlow(CoroutineFixtures.series(envelope(true)), ID,
                (request, cancellation) -> article("Accepted before refresh"), new Direct(), statuses::add, session),
                (value, continuation) -> { first.add(value); return tzg.a; }, new CoroutineFixtures.Context(Runnable::run)));
        Object failure = new m0e(new l0e(new IllegalStateException("Offline native refresh")));
        complete(CoroutineFixtures.start(new MediumReaderFlow(CoroutineFixtures.series(failure), ID,
                (request, cancellation) -> { throw new AssertionError("No source metadata to load"); }, new Direct(), statuses::add, session),
                (value, continuation) -> { refresh.add(value); return tzg.a; }, new CoroutineFixtures.Context(Runnable::run)));
        assertEquals(1, refresh.size()); assertSame(first.get(0), refresh.get(0));
        assertEquals("Accepted before refresh", text(refresh.get(0)));
        assertEquals("UNAVAILABLE", statuses.get(statuses.size()-1).phase);
    }

    @Test public void equalQueriesFromIndependentReadersDoNotShareDisplayState() {
        Object first = new String("same query"), second = new String("same query");
        assertSame(MediumReaderSession.forOwner(first), MediumReaderSession.forOwner(first));
        assertNotSame(MediumReaderSession.forOwner(first), MediumReaderSession.forOwner(second));
    }

    @Test public void freshNativeQueriesShareOnlyTheirOwnArticleViewModelSession() {
        Object screen = new Object(), otherScreen = new Object(), firstQuery = new Object(), refreshedQuery = new Object(), otherQuery = new Object();
        MediumReaderFlow.bindOwner(firstQuery, screen); MediumReaderFlow.bindOwner(refreshedQuery, screen); MediumReaderFlow.bindOwner(otherQuery, otherScreen);
        assertSame(MediumReaderSession.forOwner(firstQuery), MediumReaderSession.forOwner(refreshedQuery));
        assertNotSame(MediumReaderSession.forOwner(firstQuery), MediumReaderSession.forOwner(otherQuery));
    }

    @Test public void supersededRefreshCannotCommitLateBody() throws Exception {
        MediumReaderSession session = new MediumReaderSession(); ExecutorService worker = Executors.newSingleThreadExecutor();
        CountDownLatch entered = new CountDownLatch(1), release = new CountDownLatch(1);
        List<Object> oldValues = Collections.synchronizedList(new ArrayList<>()), currentValues = new ArrayList<>();
        try {
            CoroutineFixtures.Completion old = CoroutineFixtures.start(new MediumReaderFlow(CoroutineFixtures.series(envelope(true)), ID,
                    (request, token) -> {
                        entered.countDown();
                        try { release.await(); } catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); token.check(); }
                        return article("Old");
                    }, worker, status -> {}, session),
                    (value, continuation) -> { oldValues.add(value); return tzg.a; }, new CoroutineFixtures.Context(Runnable::run));
            assertTrue(entered.await(2, TimeUnit.SECONDS));
            complete(CoroutineFixtures.start(new MediumReaderFlow(CoroutineFixtures.series(envelope(true)), ID,
                    (request, token) -> article("Current"), new Direct(), status -> {}, session),
                    (value, continuation) -> { currentValues.add(value); return tzg.a; }, new CoroutineFixtures.Context(Runnable::run)));
            release.countDown(); Object result = old.done.get(2, TimeUnit.SECONDS);
            assertTrue(result instanceof l0e); assertTrue(((l0e) result).a instanceof java.util.concurrent.CancellationException);
            assertTrue(oldValues.isEmpty()); assertEquals("Current", text(currentValues.get(0)));
        } finally { release.countDown(); worker.shutdownNow(); }
    }

    @Test public void requestedIdentityIsCheckedBeforeLoadingMirror() throws Exception {
        FullPostQuery$Data original = MediumReaderModelsTest.original(true);
        FullPostQuery$Data wrong = new FullPostQuery$Data(new FullPostQuery$Post("Post", "bf716433d4a6", original.getPost().getFullPostData()));
        List<Object> emitted = new ArrayList<>(); AtomicInteger loads = new AtomicInteger();
        MediumReaderFlow flow = new MediumReaderFlow(CoroutineFixtures.series(new m0e(new s4b(wrong, false))), ID,
                (request, cancellation) -> { loads.incrementAndGet(); return article("Wrong"); }, new Direct(), status -> {});
        complete(CoroutineFixtures.start(flow, (value, continuation) -> { emitted.add(value); return tzg.a; }, new CoroutineFixtures.Context(Runnable::run)));
        assertEquals(0, loads.get()); assertTrue(((m0e) emitted.get(0)).a instanceof l0e);
    }

    @Test public void completionReturnsToOriginalContextAndWaitsForSuspendedCollector() throws Exception {
        ExecutorService caller = Executors.newSingleThreadExecutor(r -> new Thread(r, "original-context"));
        ExecutorService worker = Executors.newSingleThreadExecutor(r -> new Thread(r, "reader-worker"));
        CoroutineFixtures.Context context = new CoroutineFixtures.Context(caller);
        AtomicReference<yl2> held = new AtomicReference<>(); CountDownLatch delivered = new CountDownLatch(1);
        try {
            MediumReaderFlow flow = new MediumReaderFlow(CoroutineFixtures.series(envelope(true)), ID,
                    (request, cancellation) -> article("Full text"), worker, status -> {});
            CoroutineFixtures.Completion completion = CoroutineFixtures.start(flow, (value, continuation) -> {
                assertEquals("original-context", Thread.currentThread().getName()); assertSame(context, continuation.getContext());
                assertEquals("Full text", text(value)); held.set(continuation); delivered.countDown(); return so2.COROUTINE_SUSPENDED;
            }, context);
            assertTrue(delivered.await(2, TimeUnit.SECONDS)); assertFalse(completion.done.isDone());
            caller.execute(() -> held.get().resumeWith(tzg.a)); assertSame(tzg.a, complete(completion));
        } finally { caller.shutdownNow(); worker.shutdownNow(); }
    }

    @Test public void parentCancellationPreventsLateBodyEmission() throws Exception {
        ExecutorService worker = Executors.newSingleThreadExecutor(); CountDownLatch entered = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1); List<Object> emitted = Collections.synchronizedList(new ArrayList<>());
        CoroutineFixtures.Context context = new CoroutineFixtures.Context(Runnable::run);
        try {
            MediumReaderFlow flow = new MediumReaderFlow(CoroutineFixtures.series(envelope(true)), ID, (request, cancellation) -> {
                entered.countDown();
                try { release.await(); } catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); }
                return article("Too late");
            }, worker, status -> {});
            CoroutineFixtures.Completion completion = CoroutineFixtures.start(flow, (value, continuation) -> { emitted.add(value); return tzg.a; }, context);
            assertTrue(entered.await(2, TimeUnit.SECONDS)); context.cancel();
            Object result = completion.done.get(2, TimeUnit.SECONDS); assertTrue(result instanceof l0e);
            assertTrue(((l0e) result).a instanceof java.util.concurrent.CancellationException);
            release.countDown(); worker.shutdown(); assertTrue(worker.awaitTermination(2, TimeUnit.SECONDS));
            assertTrue(emitted.isEmpty()); assertEquals(1, completion.signals.get());
        } finally { release.countDown(); worker.shutdownNow(); }
    }

    @Test public void repeatedRevisionReusesBodyButKeepsNewSourceMetadata() throws Exception {
        Object first = envelope(true), second = envelope(true); List<Object> emitted = new ArrayList<>(); AtomicInteger loads = new AtomicInteger();
        MediumReaderFlow flow = new MediumReaderFlow(CoroutineFixtures.series(first, second), ID,
                (request, cancellation) -> { loads.incrementAndGet(); return article("Reused"); }, new Direct(), status -> {});
        complete(CoroutineFixtures.start(flow, (value, continuation) -> { emitted.add(value); return tzg.a; }, new CoroutineFixtures.Context(Runnable::run)));
        assertEquals(1, loads.get()); assertEquals(2, emitted.size());
        assertEquals("Reused", text(emitted.get(1)));
        assertSame(((s4b) ((m0e) second).a).a.getPost().getFullPostData().getPostMetaData(),
                ((s4b) ((m0e) emitted.get(1)).a).a.getPost().getFullPostData().getPostMetaData());
    }

    @Test public void newRevisionCannotReuseOldMirrorSnapshot() throws Exception {
        FullPostQuery$Data first = MediumReaderModelsTest.original(true), second = MediumReaderModelsTest.original(true);
        java.lang.reflect.Field version = first.getPost().getFullPostData().getPostMetaData().getClass().getDeclaredField("latestPublishedVersion"); version.setAccessible(true);
        version.set(first.getPost().getFullPostData().getPostMetaData(), "v1"); version.set(second.getPost().getFullPostData().getPostMetaData(), "v2");
        List<Object> emitted = new ArrayList<>(); AtomicInteger loads = new AtomicInteger();
        MediumReaderFlow flow = new MediumReaderFlow(CoroutineFixtures.series(new m0e(new s4b(first, true)), new m0e(new s4b(second, false))), ID,
                (request, cancellation) -> { loads.incrementAndGet(); return article(request.revision); }, new Direct(), status -> {});
        complete(CoroutineFixtures.start(flow, (value, continuation) -> { emitted.add(value); return tzg.a; }, new CoroutineFixtures.Context(Runnable::run)));
        assertEquals(2, loads.get()); assertEquals("v1", text(emitted.get(0))); assertEquals("v2", text(emitted.get(1)));
    }

    @Test public void parentCancelledBeforeAwaitDoesNotSubmitArticleWork() throws Exception {
        CoroutineFixtures.Context context = new CoroutineFixtures.Context(Runnable::run); context.cancel();
        AtomicInteger loads = new AtomicInteger(); List<Object> emitted = new ArrayList<>();
        MediumReaderFlow flow = new MediumReaderFlow(CoroutineFixtures.series(envelope(true)), ID,
                (request, cancellation) -> { loads.incrementAndGet(); return article("Wrong"); }, new Direct(), status -> {});
        CoroutineFixtures.Completion completion = CoroutineFixtures.start(flow, (value, continuation) -> { emitted.add(value); return tzg.a; }, context);
        assertTrue(completion.done.get(2, TimeUnit.SECONDS) instanceof l0e); assertEquals(0, loads.get()); assertTrue(emitted.isEmpty());
    }

    @Test public void downstreamFailureIsNotMisreportedAsMirrorFailure() throws Exception {
        IllegalStateException failure = new IllegalStateException("fixture renderer"); List<ReaderStatus> statuses = new ArrayList<>();
        MediumReaderFlow flow = new MediumReaderFlow(CoroutineFixtures.series(envelope(true)), ID,
                (request, cancellation) -> article("Full text"), new Direct(), statuses::add);
        CoroutineFixtures.Completion completion = CoroutineFixtures.start(flow, (value, continuation) -> { throw failure; }, new CoroutineFixtures.Context(Runnable::run));
        Object result = completion.done.get(2, TimeUnit.SECONDS); assertTrue(result instanceof l0e); assertSame(failure, ((l0e) result).a);
        assertFalse(statuses.stream().anyMatch(status -> status.phase.equals("READY") || status.phase.equals("UNAVAILABLE")));
    }

    @Test public void cancellingOneReaderDoesNotInvalidateAnotherReaderOfSamePost() throws Exception {
        ExecutorService worker = Executors.newFixedThreadPool(2);
        CountDownLatch entered = new CountDownLatch(2), release = new CountDownLatch(1);
        CoroutineFixtures.Context firstContext = new CoroutineFixtures.Context(Runnable::run), secondContext = new CoroutineFixtures.Context(Runnable::run);
        List<Object> firstValues = Collections.synchronizedList(new ArrayList<>()), secondValues = Collections.synchronizedList(new ArrayList<>());
        ArticleLoader source = (request, cancellation) -> {
            entered.countDown();
            try { release.await(); } catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); }
            return article("Independent");
        };
        try {
            CoroutineFixtures.Completion first = CoroutineFixtures.start(new MediumReaderFlow(CoroutineFixtures.series(envelope(true)), ID, source, worker, status -> {}),
                    (value, continuation) -> { firstValues.add(value); return tzg.a; }, firstContext);
            CoroutineFixtures.Completion second = CoroutineFixtures.start(new MediumReaderFlow(CoroutineFixtures.series(envelope(true)), ID, source, worker, status -> {}),
                    (value, continuation) -> { secondValues.add(value); return tzg.a; }, secondContext);
            assertTrue(entered.await(2, TimeUnit.SECONDS)); firstContext.cancel(); release.countDown();
            assertTrue(first.done.get(2, TimeUnit.SECONDS) instanceof l0e); complete(second);
            worker.shutdown(); assertTrue(worker.awaitTermination(2, TimeUnit.SECONDS));
            assertTrue(firstValues.isEmpty()); assertEquals(1, secondValues.size()); assertEquals("Independent", text(secondValues.get(0)));
        } finally { release.countDown(); worker.shutdownNow(); }
    }
}
