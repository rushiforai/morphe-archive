package io.github.emotionbug.summaryengine;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.Arrays;
import java.util.Collections;
import static org.junit.Assert.*;

/** These lifecycle paths must not require JNI or allocate/load a model on the host JVM. */
public class WhisperAsrTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    @Test public void cancellationBeforeFirstChunkNeverInitializesNativeState() {
        for (boolean useGpu : new boolean[]{false, true}) {
            try (WhisperAsr asr = new WhisperAsr("", useGpu)) {
                assertThrows(CancellationException.class,
                        () -> asr.transcribe(new File("unused.wav"), new AtomicBoolean(true)));
            }
        }
    }

    @Test public void interruptedFirstChunkDoesNotLoadEitherBackend() {
        for (boolean useGpu : new boolean[]{false, true}) {
            try (WhisperAsr asr = new WhisperAsr("", useGpu)) {
                Thread.currentThread().interrupt();
                assertThrows(CancellationException.class,
                        () -> asr.transcribe(new File("unused.wav"), new AtomicBoolean(false)));
            } finally {
                Thread.interrupted();
            }
        }
    }

    @Test public void missingModelFailsOnlyWhenTranscriptionIsRequested() {
        for (boolean useGpu : new boolean[]{false, true}) {
            try (WhisperAsr asr = new WhisperAsr(new File(temporary.getRoot(), "absent.bin").getPath(), useGpu)) {
                assertThrows(IOException.class,
                        () -> asr.transcribe(new File("unused.wav"), new AtomicBoolean(false)));
            }
        }
    }

    private static byte[] encode(WhisperAsr.Result result) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (DataOutputStream output = new DataOutputStream(bytes)) { result.write(output); }
        return bytes.toByteArray();
    }

    @Test public void segmentWireRoundTripPreservesTextAndEstimatedTimes() throws Exception {
        WhisperAsr.Result original = new WhisperAsr.Result(Arrays.asList(
                new WhisperAsr.Segment(0, 1250, " 안녕하세요."),
                new WhisperAsr.Segment(1500, 2700, " 확인했습니다.")));
        WhisperAsr.Result decoded = WhisperAsr.decode(encode(original), 2700);
        assertEquals("안녕하세요. 확인했습니다.", decoded.text);
        assertEquals(2, decoded.segments.size());
        assertEquals(1500, decoded.segments.get(1).startMs);
        assertEquals(2700, decoded.segments.get(1).endMs);
        assertEquals(" 확인했습니다.", decoded.segments.get(1).text);
        assertThrows(UnsupportedOperationException.class, () -> decoded.segments.clear());
    }

    @Test public void emptyRecognitionStaysEmptyAndInvalidBoundsFail() throws Exception {
        WhisperAsr.Result empty = WhisperAsr.decode(encode(new WhisperAsr.Result(Collections.emptyList())), 100);
        assertEquals("", empty.text);
        assertTrue(empty.segments.isEmpty());
        for (long[] bounds : new long[][]{{-1, 10}, {10, 9}, {0, 101}}) {
            byte[] bytes = encode(new WhisperAsr.Result(Collections.singletonList(
                    new WhisperAsr.Segment(bounds[0], bounds[1], " text"))));
            assertThrows(IOException.class, () -> WhisperAsr.decode(bytes, 100));
        }
    }

    @Test public void malformedTruncatedOversizedAndUnorderedSegmentsFail() throws Exception {
        byte[] valid = encode(new WhisperAsr.Result(Collections.singletonList(
                new WhisperAsr.Segment(0, 100, " text"))));
        assertThrows(IOException.class, () -> WhisperAsr.decode(Arrays.copyOf(valid, valid.length - 1), 100));
        assertThrows(IOException.class, () -> WhisperAsr.decode(Arrays.copyOf(valid, valid.length + 1), 100));
        byte[] oversized = encode(new WhisperAsr.Result(Collections.singletonList(
                new WhisperAsr.Segment(0, 100, new String(new char[12001])))));
        assertThrows(IOException.class, () -> WhisperAsr.decode(oversized, 100));
        byte[] unordered = encode(new WhisperAsr.Result(Arrays.asList(
                new WhisperAsr.Segment(50, 100, " one"), new WhisperAsr.Segment(0, 50, " two"))));
        assertThrows(IOException.class, () -> WhisperAsr.decode(unordered, 100));
        valid[valid.length - 1] = (byte) 0xff;
        assertThrows(IOException.class, () -> WhisperAsr.decode(valid, 100));
    }
}
