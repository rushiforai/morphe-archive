/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.ProviderInfo;
import android.content.res.AssetFileDescriptor;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.rules.TemporaryFolder;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowContentResolver;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;

import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class PinTransferTest {
    private static final String SOURCE = "https://i.pinimg.com/originals/pin.jpg";
    private static final Uri DESTINATION = Uri.parse("content://test.transfer/document/created-pin");
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private Context context;
    private DocumentProvider provider;

    @Before public void documents() throws IOException {
        context = RuntimeEnvironment.getApplication();
        provider = new DocumentProvider(temporary.newFile("pin.jpg"));
        ProviderInfo info = new ProviderInfo();
        info.authority = DESTINATION.getAuthority();
        provider.attachInfo(context, info);
        ShadowContentResolver.registerProviderInternal(info.authority, provider);
    }

    @After public void clearInterruption() {
        Thread.interrupted();
        PauseForTests.resume();
    }

    static class Response extends HttpURLConnection {
        final int status;
        final String redirect;
        volatile boolean disconnected;
        long length = -1;
        InputStream input = new ByteArrayInputStream(new byte[0]);
        int inputOpens;

        Response(URI uri, int status, String redirect) throws IOException {
            super(uri.toURL()); this.status = status; this.redirect = redirect;
        }

        @Override public int getResponseCode() { return status; }
        @Override public String getHeaderField(String name) { return "Location".equals(name) ? redirect : null; }
        @Override public long getContentLengthLong() { return length; }
        @Override public InputStream getInputStream() { inputOpens++; return input; }
        @Override public void disconnect() { disconnected = true; }
        @Override public boolean usingProxy() { return false; }
        @Override public void connect() {}
    }

    @Test public void followsOnlyValidatedCdnRedirectsAndClosesIntermediateConnections() throws Exception {
        List<Response> opened = new ArrayList<>();
        HttpURLConnection last = PinTransfer.connect("https://v.pinimg.com/start.mp4", uri -> {
            Response response = new Response(uri, opened.isEmpty() ? 302 : 200, "/final.mp4");
            opened.add(response);
            return response;
        });
        assertEquals(2, opened.size());
        assertTrue(opened.get(0).disconnected);
        assertFalse(opened.get(1).disconnected);
        assertEquals("https://v.pinimg.com/final.mp4", last.getURL().toString());
        assertFalse(last.getInstanceFollowRedirects());
        assertEquals(20000, last.getConnectTimeout());
        assertEquals(30000, last.getReadTimeout());
        last.disconnect();
    }

    @Test public void rejectsRedirectOffCdnBeforeAnotherConnectionAndBoundsLoops() throws Exception {
        List<Response> opened = new ArrayList<>();
        try {
            PinTransfer.connect("https://i.pinimg.com/start.jpg", uri -> {
                Response response = new Response(uri, 302, "https://evil.test/steal");
                opened.add(response); return response;
            });
            fail("off-CDN redirect accepted");
        } catch (IOException expected) { assertTrue(expected.getMessage().contains("CDN")); }
        assertEquals(1, opened.size());
        assertTrue(opened.get(0).disconnected);
        opened.clear();
        try {
            PinTransfer.connect("https://i.pinimg.com/start.jpg", uri -> {
                Response response = new Response(uri, 307, "/loop.jpg");
                opened.add(response); return response;
            });
            fail("redirect loop accepted");
        } catch (IOException expected) { assertTrue(expected.getMessage().contains("redirects")); }
        assertEquals(6, opened.size());
        for (Response response : opened) assertTrue(response.disconnected);
    }

    @Test public void rejectsInvalidSourceWithoutConnectingAndDisconnectsServerErrors() throws Exception {
        try {
            PinTransfer.connect("file:///private", uri -> { throw new AssertionError("connection attempted"); });
            fail("invalid source accepted");
        } catch (IOException expected) { assertTrue(expected.getMessage().contains("Pinterest")); }
        Response response = new Response(new URI("https://i.pinimg.com/missing.jpg"), 404, null);
        try {
            PinTransfer.connect(response.getURL().toString(), ignored -> response);
            fail("server error accepted");
        } catch (IOException expected) { assertTrue(expected.getMessage().contains("404")); }
        assertTrue(response.disconnected);
    }

    @Test public void copiesLargeMediaInChunksWithoutChangingBytes() throws Exception {
        byte[] source = new byte[2 * 1024 * 1024 + 11];
        for (int index = 0; index < source.length; index++) source[index] = (byte) (index % 251);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        assertEquals(source.length, PinTransfer.copy(new ByteArrayInputStream(source), output));
        assertArrayEquals(source, output.toByteArray());
    }

    @Test public void savesTheFullBodyThroughTheChosenProviderAndClosesResources() throws Exception {
        byte[] bytes = new byte[2 * 1024 * 1024 + 11];
        for (int index = 0; index < bytes.length; index++) bytes[index] = (byte) (index % 251);
        ClosingInput input = new ClosingInput(bytes);
        Response response = response(200, input, bytes.length);
        save(response);
        assertArrayEquals(bytes, Files.readAllBytes(provider.file.toPath()));
        assertEquals("w", provider.mode);
        assertEquals(1, provider.opens);
        assertTrue(input.closed);
        assertTrue(response.disconnected);
        assertEquals("identity", response.getRequestProperty("Accept-Encoding"));
        assertNull(response.getRequestProperty("Range"));
    }

    @Test public void acceptsUnknownLengthOnlyAfterNonemptyEofAndAllowsTheExactByteLimit() throws Exception {
        for (long declared : new long[]{-1, 4}) {
            ClosingOutput output = output();
            Response response = response(200, new ClosingInput(new byte[]{1, 2, 3, 4}), declared);
            PinTransfer.save(context, DESTINATION, SOURCE, ignored -> response, System::nanoTime,
                    PinTransfer.TIME_LIMIT_MS, 4);
            assertArrayEquals(new byte[]{1, 2, 3, 4}, output.toByteArray());
            assertTrue(output.closed);
            assertTrue(response.disconnected);
        }
    }

    @Test public void refusesNonemptyPartialAndNoContentBeforeOpeningTheDestination() throws Exception {
        for (int status : new int[]{206, 204}) {
            Response response = response(status, new ClosingInput(new byte[]{1, 2, 3}), 3);
            PinTransfer.SaveFailure failure = failure(response);
            assertTrue(failure.incomplete);
            assertTrue(failure.getMessage().contains(Integer.toString(status)));
            assertEquals(0, response.inputOpens);
            assertEquals(0, provider.opens);
            assertTrue(response.disconnected);
        }
    }

    @Test public void refusesEmptyShortAndExcessBodiesAndClosesBothStreams() throws Exception {
        for (int actual : new int[]{0, 2, 4}) {
            ClosingInput input = new ClosingInput(new byte[actual]);
            ClosingOutput output = output();
            Response response = response(200, input, 3);
            PinTransfer.SaveFailure failure = failure(response);
            assertTrue(failure.incomplete);
            assertTrue(input.closed);
            assertTrue(output.closed);
            assertTrue(response.disconnected);
            assertTrue(output.size() <= 3);
        }
    }

    @Test public void missingAndDeniedProviderOutputsStillCloseTheNetworkInput() throws Exception {
        for (boolean denied : new boolean[]{false, true}) {
            provider.nullOutput = !denied;
            provider.denyWrite = denied;
            ClosingInput input = new ClosingInput(new byte[]{1, 2, 3});
            Response response = response(200, input, 3);
            PinTransfer.SaveFailure failure = failure(response);
            assertTrue(failure.incomplete);
            assertTrue(input.closed);
            assertTrue(response.disconnected);
            assertEquals(0, Files.size(provider.file.toPath()));
            if (denied) assertTrue(failure.getCause() instanceof SecurityException);
            else assertTrue(failure.getMessage().contains("unavailable"));
        }
        assertEquals(2, provider.opens);
    }

    @Test public void preservesPossiblyCompleteOutputOnCloseOrFlushFailure() throws Exception {
        for (boolean close : new boolean[]{false, true}) {
            ClosingOutput output = output();
            output.failClose = close;
            output.failFlush = !close;
            ClosingInput input = new ClosingInput(new byte[]{1, 2, 3});
            Response response = response(200, input, 3);
            PinTransfer.SaveFailure failure = failure(response);
            assertFalse(failure.incomplete);
            assertArrayEquals(new byte[]{1, 2, 3}, output.toByteArray());
            assertTrue(input.closed);
            assertTrue(output.closed);
            assertTrue(response.disconnected);
        }
    }

    @Test public void aThrowingFinalWriteDoesNotProveTheDocumentIsIncomplete() throws Exception {
        ClosingOutput output = output();
        output.failWrite = true;
        Response response = response(200, new ClosingInput(new byte[]{1, 2, 3}), 3);
        PinTransfer.SaveFailure failure = failure(response);
        assertFalse(failure.incomplete);
        assertArrayEquals(new byte[]{1, 2, 3}, output.toByteArray());
        assertTrue(output.closed);
        assertTrue(response.disconnected);
    }

    @Test public void inputCloseFailureAfterCompleteBodyAlsoPreservesTheDocument() throws Exception {
        ClosingInput input = new ClosingInput(new byte[]{1, 2, 3});
        input.failClose = true;
        ClosingOutput output = output();
        Response response = response(200, input, -1);
        assertFalse(failure(response).incomplete);
        assertArrayEquals(new byte[]{1, 2, 3}, output.toByteArray());
        assertTrue(input.closed);
        assertTrue(output.closed);
        assertTrue(response.disconnected);
    }

    @Test public void aNetworkFailurePreservesUnknownCompletionButProvesAShortDeclaredBodyIncomplete() throws Exception {
        for (long declared : new long[]{-1, 9}) {
            ClosingInput input = new ClosingInput(new byte[]{1}) {
                private boolean delivered;
                @Override public synchronized int read(byte[] buffer, int offset, int length) throws IOException {
                    if (delivered) throw new IOException("connection lost");
                    delivered = true;
                    return super.read(buffer, offset, length);
                }
            };
            ClosingOutput output = output();
            Response response = response(200, input, declared);
            assertEquals(declared > 0, failure(response).incomplete);
            assertArrayEquals(new byte[]{1}, output.toByteArray());
            assertTrue(input.closed);
            assertTrue(output.closed);
            assertTrue(response.disconnected);
        }
    }

    @Test public void declaredAndStreamingByteLimitsStopBeforeWritingExcessBytes() throws Exception {
        for (long declared : new long[]{-1, 5}) {
            ClosingInput input = new ClosingInput(new byte[]{1, 2, 3, 4, 5});
            ClosingOutput output = output();
            Response response = response(200, input, declared);
            try {
                PinTransfer.save(context, DESTINATION, SOURCE, ignored -> response, System::nanoTime,
                        PinTransfer.TIME_LIMIT_MS, 4);
                fail("oversized media accepted");
            } catch (PinTransfer.SaveFailure expected) {
                assertTrue(expected.incomplete);
                assertTrue(expected.getMessage().contains("limit"));
            }
            assertEquals(0, output.size());
            assertTrue(response.disconnected);
            if (declared == -1) assertTrue(input.closed);
            else assertEquals(0, response.inputOpens);
        }
    }

    @Test public void tricklingReadsCannotRestartTheTotalDeadline() throws Exception {
        AtomicLong elapsed = new AtomicLong();
        ClosingInput input = new ClosingInput(new byte[10]) {
            @Override public synchronized int read(byte[] buffer, int offset, int length) throws IOException {
                elapsed.addAndGet(TimeUnit.MINUTES.toNanos(1));
                return super.read(buffer, offset, Math.min(1, length));
            }
        };
        ClosingOutput output = output();
        Response response = response(200, input, 10);
        try {
            PinTransfer.save(context, DESTINATION, SOURCE, ignored -> response, elapsed::get,
                    PinTransfer.TIME_LIMIT_MS, PinTransfer.BYTE_LIMIT);
            fail("trickle exceeded the total deadline");
        } catch (PinTransfer.SaveFailure expected) {
            assertTrue(expected.incomplete);
            assertTrue(expected.getMessage().contains("time limit"));
        }
        assertEquals(4, output.size());
        assertTrue(input.closed);
        assertTrue(output.closed);
        assertTrue(response.disconnected);
    }

    @Test public void redirectsUseTheSameDeadlineAndSocketTimeoutsUseOnlyTheRemainingBudget() throws Exception {
        AtomicLong elapsed = new AtomicLong();
        List<Response> opened = new ArrayList<>();
        try {
            PinTransfer.save(context, DESTINATION, SOURCE, uri -> {
                Response response = new Response(uri, 302, "/next.jpg") {
                    @Override public int getResponseCode() {
                        elapsed.addAndGet(TimeUnit.MINUTES.toNanos(3));
                        return status;
                    }
                };
                opened.add(response);
                return response;
            }, elapsed::get, PinTransfer.TIME_LIMIT_MS, PinTransfer.BYTE_LIMIT);
            fail("redirects restarted the deadline");
        } catch (PinTransfer.SaveFailure expected) {
            assertTrue(expected.incomplete);
            assertTrue(expected.getMessage().contains("time limit"));
        }
        assertEquals(2, opened.size());
        for (Response response : opened) assertTrue(response.disconnected);

        elapsed.set(0);
        Response response = new Response(new URI(SOURCE), 200, null) {
            @Override public int getResponseCode() { elapsed.set(TimeUnit.SECONDS.toNanos(2)); return status; }
        };
        response.input = new ClosingInput(new byte[]{1});
        response.length = 1;
        output();
        PinTransfer.save(context, DESTINATION, SOURCE, ignored -> response, elapsed::get, 5000, 4);
        assertEquals(5000, response.getConnectTimeout());
        assertEquals(3000, response.getReadTimeout());
    }

    @Test public void cancellationBeforeConnectAndDuringCopyPreservesTheInterruptFlag() throws Exception {
        Thread.currentThread().interrupt();
        try {
            PinTransfer.save(context, DESTINATION, SOURCE, ignored -> { throw new AssertionError("connected after cancel"); },
                    System::nanoTime, PinTransfer.TIME_LIMIT_MS, PinTransfer.BYTE_LIMIT);
            fail("cancelled transfer connected");
        } catch (PinTransfer.SaveFailure expected) {
            assertTrue(expected.incomplete);
            assertTrue(Thread.currentThread().isInterrupted());
        } finally { Thread.interrupted(); }

        ClosingInput input = new ClosingInput(new byte[6]) {
            @Override public synchronized int read(byte[] buffer, int offset, int length) throws IOException {
                return super.read(buffer, offset, Math.min(2, length));
            }
        };
        ClosingOutput output = output();
        output.interruptWrite = true;
        Response response = response(200, input, 6);
        try {
            assertTrue(failure(response).incomplete);
            assertTrue(Thread.currentThread().isInterrupted());
            assertEquals(2, output.size());
            assertTrue(input.closed);
            assertTrue(output.closed);
            assertTrue(response.disconnected);
        } finally { Thread.interrupted(); }
    }

    @Test public void watchdogDisconnectsAResponseThatIgnoresReadTimeoutAndInterruption() throws Exception {
        CountDownLatch reading = new CountDownLatch(1);
        CountDownLatch disconnectionLatch = new CountDownLatch(1);
        Response response = new Response(new URI(SOURCE), 200, null) {
            @Override public int getResponseCode() {
                reading.countDown();
                while (!this.disconnected) {
                    try { disconnectionLatch.await(); }
                    catch (InterruptedException ignored) { /* A misbehaving transport keeps waiting. */ }
                }
                throw new IllegalStateException("response disconnected");
            }
            @Override public void disconnect() { super.disconnect(); disconnectionLatch.countDown(); }
        };
        FutureTask<PinTransfer.SaveFailure> task = new FutureTask<>(() -> {
            try {
                PinTransfer.save(context, DESTINATION, SOURCE, ignored -> response, System::nanoTime, 500, 4);
                throw new AssertionError("blocked response succeeded");
            } catch (PinTransfer.SaveFailure expected) { return expected; }
        });
        Thread worker = new Thread(task, "test pin response");
        worker.setDaemon(true);
        worker.start();
        try {
            assertTrue(reading.await(2, TimeUnit.SECONDS));
            PinTransfer.SaveFailure failure = task.get(3, TimeUnit.SECONDS);
            assertTrue(failure.incomplete);
            assertTrue(failure.getMessage().contains("time limit"));
            assertTrue(response.disconnected);
            assertEquals(0, provider.opens);
        } finally {
            response.disconnect();
            worker.interrupt();
            worker.join(1000);
        }
        assertFalse(worker.isAlive());
    }

    @Test public void watchdogAlsoUnblocksAStalledBodyAndClosesItsProviderStream() throws Exception {
        CountDownLatch reading = new CountDownLatch(1);
        CountDownLatch disconnectionLatch = new CountDownLatch(1);
        ClosingInput input = new ClosingInput(new byte[4]) {
            private boolean delivered;
            @Override public synchronized int read(byte[] buffer, int offset, int length) throws IOException {
                if (!delivered) { delivered = true; return super.read(buffer, offset, 1); }
                reading.countDown();
                while (disconnectionLatch.getCount() != 0) {
                    try { disconnectionLatch.await(); }
                    catch (InterruptedException ignored) { /* The transport waits for disconnect. */ }
                }
                throw new IOException("body disconnected");
            }
        };
        Response response = new Response(URI.create(SOURCE), 200, null) {
            @Override public void disconnect() { super.disconnect(); disconnectionLatch.countDown(); }
        };
        response.input = input;
        response.length = 4;
        ClosingOutput output = output();
        FutureTask<PinTransfer.SaveFailure> task = new FutureTask<>(() -> {
            try {
                PinTransfer.save(context, DESTINATION, SOURCE, ignored -> response, System::nanoTime, 1000, 4);
                throw new AssertionError("stalled body succeeded");
            } catch (PinTransfer.SaveFailure expected) { return expected; }
        });
        Thread worker = new Thread(task, "test pin body");
        worker.setDaemon(true);
        worker.start();
        try {
            assertTrue(reading.await(2, TimeUnit.SECONDS));
            PinTransfer.SaveFailure failure = task.get(3, TimeUnit.SECONDS);
            assertTrue(failure.incomplete);
            assertTrue(failure.getMessage().contains("time limit"));
            assertEquals(1, output.size());
            assertTrue(input.closed);
            assertTrue(output.closed);
        } finally {
            response.disconnect();
            worker.interrupt();
            worker.join(1000);
        }
        assertFalse(worker.isAlive());
    }

    @Test public void pauseDuringAnActiveCopyDoesNotCancelTheChosenSave() throws Exception {
        ClosingInput input = new ClosingInput(new byte[]{1, 2, 3}) {
            @Override public synchronized int read(byte[] buffer, int offset, int length) throws IOException {
                PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
                return super.read(buffer, offset, length);
            }
        };
        ClosingOutput output = output();
        Response response = response(200, input, 3);
        save(response);
        assertArrayEquals(new byte[]{1, 2, 3}, output.toByteArray());
        assertTrue(output.closed);
        assertTrue(response.disconnected);
    }

    private Response response(int status, InputStream input, long length) throws IOException {
        Response response = new Response(URI.create(SOURCE), status, null);
        response.input = input;
        response.length = length;
        return response;
    }

    private void save(Response response) throws PinTransfer.SaveFailure {
        PinTransfer.save(context, DESTINATION, SOURCE, ignored -> response, System::nanoTime,
                PinTransfer.TIME_LIMIT_MS, PinTransfer.BYTE_LIMIT);
    }

    private PinTransfer.SaveFailure failure(Response response) throws Exception {
        try { save(response); fail("invalid save succeeded"); }
        catch (PinTransfer.SaveFailure expected) { return expected; }
        throw new AssertionError();
    }

    private ClosingOutput output() {
        ClosingOutput output = new ClosingOutput();
        Shadows.shadowOf(context.getContentResolver()).registerOutputStream(DESTINATION, output);
        return output;
    }

    static class ClosingInput extends InputStream {
        private final ByteArrayInputStream body;
        boolean closed, failClose;
        ClosingInput(byte[] body) { this.body = new ByteArrayInputStream(body); }
        @Override public int read() throws IOException { return body.read(); }
        @Override public synchronized int read(byte[] buffer, int offset, int length) throws IOException {
            return body.read(buffer, offset, length);
        }
        @Override public void close() throws IOException {
            closed = true;
            if (failClose) throw new IOException("input close failed");
            super.close();
        }
    }

    static class ClosingOutput extends ByteArrayOutputStream {
        boolean closed, failClose, failFlush, failWrite, interruptWrite;
        @Override public synchronized void write(byte[] buffer, int offset, int length) {
            super.write(buffer, offset, length);
            if (interruptWrite) Thread.currentThread().interrupt();
            if (failWrite) throw new IllegalStateException("provider write failed after accepting bytes");
        }
        @Override public void flush() throws IOException {
            if (failFlush) throw new IOException("provider flush failed");
            super.flush();
        }
        @Override public void close() throws IOException {
            closed = true;
            if (failClose) throw new IOException("provider close failed");
            super.close();
        }
    }

    private static final class DocumentProvider extends ContentProvider {
        final File file;
        int opens;
        String mode;
        boolean nullOutput, denyWrite;
        DocumentProvider(File file) { this.file = file; }
        @Override public boolean onCreate() { return true; }
        @Override public AssetFileDescriptor openAssetFile(Uri uri, String mode) throws FileNotFoundException {
            opens++;
            this.mode = mode;
            if (denyWrite) throw new SecurityException("provider write denied");
            if (nullOutput) return null;
            return new AssetFileDescriptor(ParcelFileDescriptor.open(file,
                    ParcelFileDescriptor.MODE_CREATE | ParcelFileDescriptor.MODE_TRUNCATE | ParcelFileDescriptor.MODE_WRITE_ONLY),
                    0, AssetFileDescriptor.UNKNOWN_LENGTH);
        }
        @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String sort) { return null; }
        @Override public String getType(Uri uri) { return "image/jpeg"; }
        @Override public Uri insert(Uri uri, ContentValues values) { return null; }
        @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
        @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
    }
}
