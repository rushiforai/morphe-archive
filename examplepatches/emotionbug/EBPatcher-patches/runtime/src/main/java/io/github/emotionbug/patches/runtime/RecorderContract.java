package io.github.emotionbug.patches.runtime;

/** Wire values match the original 14.4.0 recorder client, not an invented success API. */
public final class RecorderContract {
    public static final String RECORDER = "com.skt.prod.tphonerecorder.ITPhoneRecorder";
    public static final String CALLBACK = "com.skt.prod.tphonerecorder.IRecordCallback";
    public static final String SHELL = "io.github.emotionbug.patches.runtime.IShellRecorder";
    public static final String SHELL_CALLBACK = "io.github.emotionbug.patches.runtime.IShellCallback";
    public static final int START = 1, STOP = 2, STATE = 3;
    public static final int STARTED = 1, COMPLETED = 2, FAILED = 3;
    private RecorderContract() {}
    public interface CallbackWriter {
        void token(String value);
        void string(String value);
        void duration(long value);
    }
    public static void writeStarted(CallbackWriter out, String request) {
        displayName(request);
        out.token(CALLBACK); out.string(request);
    }
    public static void writeCompleted(CallbackWriter out, String request, String uri, long durationMs) {
        if (uri == null || !uri.startsWith("content://media/") || durationMs < 2000)
            throw new IllegalArgumentException("Completion requires a finalized MediaStore recording");
        writeStarted(out, request); out.string(uri); out.duration(durationMs);
    }

    public static String displayName(String request) {
        if (request == null || request.isEmpty() || request.length() > 200 || request.indexOf('/') >= 0
                || request.indexOf('\\') >= 0 || request.indexOf('\0') >= 0 || request.equals(".") || request.equals("..")) {
            throw new IllegalArgumentException("Invalid recording filename");
        }
        // Keep the original number/time stem. The output is genuinely AAC in an MPEG-4 container.
        int dot = request.lastIndexOf('.');
        String stem = dot > 0 ? request.substring(0, dot) : request;
        return stem + ".m4a";
    }

    public static void requireCompletion(long durationMs, long frames, long bytes) {
        if (durationMs < 2000 || frames <= 0 || bytes <= 0 || durationMs != RecorderMath.durationMs(frames, RecorderMath.SAMPLE_RATE)) {
            throw new IllegalArgumentException("Incomplete recording metadata");
        }
    }

    public enum Phase { IDLE, CONNECTING, RECORDING, STOPPING, FINISHED }
    public static final class Lifecycle {
        private volatile Phase phase = Phase.IDLE;
        public Phase phase() { return phase; }
        public void begin() { transition(Phase.IDLE, Phase.CONNECTING); }
        public void started() { transition(Phase.CONNECTING, Phase.RECORDING); }
        public void stop() { transition(Phase.RECORDING, Phase.STOPPING); }
        public void complete() { transition(Phase.STOPPING, Phase.FINISHED); }
        public boolean fail() {
            if (phase == Phase.IDLE || phase == Phase.FINISHED) return false;
            phase = Phase.FINISHED;
            return true;
        }
        private void transition(Phase expected, Phase next) {
            if (phase != expected) throw new IllegalStateException("Unexpected recorder state: " + phase);
            phase = next;
        }
    }
}
