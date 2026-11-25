package dev.abotmaker.ramblerenhancements;

/**
 * Faithful 240 Hz braided dual-trace dot-matrix oscilloscope simulation ported from
 * Hex by Anomaly ({@code src/rune_hud/spring.rs}, {@code src/rune_hud/dot_scope.rs},
 * {@code src/rune_hud/dot_scope/scope.rs}, and {@code ios/HEXShared/DotScope.swift}).
 *
 * <p>All per-frame buffers are pre-allocated when grid dimensions change so stepping and
 * rendering incur zero heap allocations during live voice dictation.
 */
public final class HexDotScopeSimulation {
    public enum Stage {
        RECORDING,
        PROCESSING,
        DONE,
        FAILED
    }

    public enum ProcessingMode {
        FLOW,
        PULSE,
        SWEEP
    }

    static final float STEP = 1.0f / 240.0f;
    static final float TAU = (float) (2.0 * Math.PI);
    static final float PI = (float) Math.PI;

    private static final int MAX_COLUMNS = 160;
    private static final int MAX_ROWS = 13;
    private static final int MAX_DOTS = 2048;
    private static final int HISTORY = 512;
    private static final int SAMPLES_PER_COLUMN = 3;

    private static final float[] SPEEDS = {0.8f, 1.25f, 1.85f, 2.6f};
    private static final float[] BASE = {0.55f, 0.42f, 0.30f, 0.20f};
    private static final float[] SPATIAL = {1.4f, 2.4f, 3.8f, 5.6f};

    private static final float ENTER = 0.42f;
    private static final float WIPE = 0.30f;
    private static final float PASS_INSET = 9.0f;
    private static final float PHOSPHOR_HEAD = 0.15f;
    private static final float PHOSPHOR_TAIL = 0.60f;
    private static final float BREATH_PERIOD = 5.5f;
    private static final float HIDDEN_SCALE = 0.90f;
    private static final float HIDDEN_SOFTNESS = 3.0f;
    private static final float WORK_HELIX = 2.6f;
    private static final float FLOW_SPACING = 0.70f;
    private static final float CARRIER_REST = 0.14f;
    private static final float RING_BIRTH = 0.15f;
    private static final float BEAM_FADE = 0.14f;

    private static final float RESPONSE_HZ = 6.5f;
    private static final float RELEASE_S = 0.15f;
    private static final float SHIMMER_PASS_S = 0.55f;
    private static final float SHIMMER = 1.0f;
    private static final float GAIN = 1.18f;
    private static final float AUTO_RELEASE_S = 3.0f;
    private static final float NOISE_FLOOR_DB = -60.0f;
    private static final float TRANSITION_S = 0.28f;
    private static final float REDUCED_FADE_S = 0.16f;
    private static final float DEFAULT_SPACING_DP = 3.5f;
    static final float MIN_SPACING_DP = 2.2f;
    static final float MAX_SPACING_DP = 4.5f;

    // Bar layout metrics (in dp)
    private int columns;
    private int rows;
    private float spacingDp = DEFAULT_SPACING_DP;
    private float widthDp = 340.0f;
    private float heightDp = 44.0f;
    private float helixCycles = 2.1f;
    private float historySpeed = 210.0f;
    private float voiceResponse = 1.0f;
    private ProcessingMode processingMode = ProcessingMode.FLOW;

    // Stage & timing state
    private Stage stage = Stage.RECORDING;
    private float elapsed = 0.0f;
    private float speedAtDone = 0.0f;
    private float doneFrom = 0.0f;
    private float flowOffset = 0.0f;
    private float flowTurn = 0.0f;

    // Voice, traces, and envelopes
    private final AutoLevel autoLevel = new AutoLevel();
    private float level = 0.0f;
    private final Voice[] voices = {new Voice(), new Voice()};
    private final Trace[] traces = {
            new Trace(0.1f, 1.7f, 3.3f, 4.6f),
            new Trace(2.4f, 0.6f, 5.1f, 1.9f)
    };
    private float live = 0.0f;
    private float carrier = 0.0f;
    private float time = 0.0f;
    private long steps = 0L;
    private float pending = 0.0f;
    private boolean reduceMotion = false;
    private float grid = 0.0f;

    // Analytical springs
    private final Spring opacity = Spring.at(0.0f);
    private final Spring scale = Spring.at(HIDDEN_SCALE);
    private final Spring softness = Spring.at(HIDDEN_SOFTNESS);
    private final Spring cool = Spring.at(0.0f);
    private final Spring fail = Spring.at(0.0f);

    // Pre-allocated simulation buffers
    private float[] head0 = new float[0];
    private float[] head1 = new float[0];
    private float[] tail0 = new float[0];
    private float[] tail1 = new float[0];
    private float[] dotPower = new float[0];
    private float[] dotFresh = new float[0];
    private float[] ys0 = new float[0];
    private float[] ys1 = new float[0];
    private float[] bright0 = new float[0];
    private float[] bright1 = new float[0];

    // Reusable scan state (zero-allocation per beam pass)
    private final ScanState scan = new ScanState();
    private final float[] scanEval = new float[3];

    public HexDotScopeSimulation() {
        configureForBounds(1020, 132, 3.0f);
    }

    /**
     * Maps Gboard's 0..100 speech level integer into Hex's dBFS loudness scale.
     * Levels 0..7 remain below the -60 dB noise floor so silence displays Hex's
     * calm breathing resting braid; speech levels 10..100 drive adaptive AutoLevel.
     */
    public static float loudnessFromSpeechLevel(int speechLevel) {
        float normalized = clamp(speechLevel / 100.0f, 0.0f, 1.0f);
        return -64.0f + 54.0f * normalized;
    }

    /**
     * Hex's synthetic spoken-syllable phrase generator (from {@code scope.rs::demo_level})
     * used for live settings previews.
     */
    public static float demoLevel(float timeSeconds) {
        final float phraseLen = 2.4f;
        final float spokenLen = 1.7f;
        float phrase = (float) Math.floor(timeSeconds / phraseLen);
        float t = timeSeconds - phrase * phraseLen;
        if (t > spokenLen) {
            return 0.04f;
        }
        float shape = (float) Math.pow(Math.max(0.0f, (float) Math.sin(PI * t / spokenLen)), 0.4);
        float rate = TAU * (4.3f + 0.6f * (float) Math.sin(phrase * 1.7f));
        float syllable = 0.5f + 0.5f * (float) Math.sin(rate * t + phrase);
        float stress = 0.75f + 0.25f * (float) Math.sin(TAU * 1.1f * t + 2.0f * phrase);
        return clamp(0.08f + 0.82f * shape * (float) Math.pow(syllable, 1.6) * stress, 0.0f, 1.0f);
    }

    public static float demoLoudness(float timeSeconds) {
        return -58.0f + 28.0f * demoLevel(timeSeconds);
    }

    public void setProcessingMode(ProcessingMode mode) {
        if (mode != null) {
            this.processingMode = mode;
        }
    }

    public ProcessingMode getProcessingMode() {
        return processingMode;
    }

    /**
     * Scales Hex's voice input gain and spring responsiveness ({@code dot-gain} and
     * {@code dot-response} from {@code dot_scope.rs}).
     */
    public void setVoiceResponse(float responseScale) {
        this.voiceResponse = clamp(responseScale, 0.5f, 2.0f);
    }

    public float getVoiceResponse() {
        return voiceResponse;
    }

    /**
     * Primes the spring opacity/scale when handing off from Hex Android Wave into
     * Processing or Done so the transition has no pop-in fade delay.
     */
    public void primeVisibleForHandoff() {
        this.opacity.jump(1.0f);
        this.scale.jump(1.0f);
        this.softness.jump(0.0f);
        this.grid = 1.0f;
    }

    /**
     * Fits the dot lattice pixel-cleanly to the host View bounds, mirroring
     * {@code DotScopeTuning.bar} + {@code fitted(pixelWidth:pixelHeight:scale:)}.
     */
    public void configureForBounds(int pixelWidth, int pixelHeight, float rawDensity) {
        configureForBounds(pixelWidth, pixelHeight, rawDensity, DEFAULT_SPACING_DP);
    }

    public void configureForBounds(
            int pixelWidth, int pixelHeight, float rawDensity, float requestedSpacingDp) {
        if (pixelWidth <= 8 || pixelHeight <= 8) {
            return;
        }
        float density = Math.max(1.0f, rawDensity);
        float baseSpacingDp = clamp(requestedSpacingDp, MIN_SPACING_DP, MAX_SPACING_DP);
        float targetSpacingDp = (pixelWidth / density) < 200.0f
                ? Math.min(baseSpacingDp, 3.0f)
                : baseSpacingDp;
        float pxPitch = Math.max(3.0f, Math.round(targetSpacingDp * density));
        float pitchDp = pxPitch / density;
        float wDp = pixelWidth / density;
        float hDp = pixelHeight / density;

        int rawRows = Math.min(MAX_ROWS,
                Math.max(5, (int) Math.floor(pixelHeight / pxPitch) - 1));
        int oddRows = (rawRows % 2 == 0) ? Math.max(5, rawRows - 1) : rawRows;
        int maxCols = Math.min(MAX_COLUMNS, MAX_DOTS / Math.max(oddRows, 1));
        int cols = Math.max(11, Math.min(maxCols, (int) Math.floor(pixelWidth / pxPitch) - 1));

        this.spacingDp = pitchDp;
        this.widthDp = wDp;
        this.heightDp = hDp;
        this.helixCycles = wDp >= 220.0f ? 2.1f : 1.6f;
        this.historySpeed = wDp >= 220.0f ? 210.0f : 150.0f;

        if (cols != this.columns || oddRows != this.rows) {
            resize(cols, oddRows);
        }
    }

    public void resetForNewSession(boolean reduceMotion) {
        this.stage = Stage.RECORDING;
        this.elapsed = 0.0f;
        this.speedAtDone = 0.0f;
        this.doneFrom = 0.0f;
        this.flowOffset = 0.0f;
        this.flowTurn = 0.0f;
        this.level = 0.0f;
        this.voices[0].reset();
        this.voices[1].reset();
        this.traces[0].reset(0.1f, 1.7f, 3.3f, 4.6f);
        this.traces[1].reset(2.4f, 0.6f, 5.1f, 1.9f);
        this.live = 0.0f;
        this.carrier = 0.0f;
        this.time = 0.0f;
        this.steps = 0L;
        this.pending = 0.0f;
        this.reduceMotion = reduceMotion;
        this.grid = 0.0f;
        this.opacity.jump(0.0f);
        this.scale.jump(reduceMotion ? 1.0f : HIDDEN_SCALE);
        this.softness.jump(reduceMotion ? 0.0f : HIDDEN_SOFTNESS);
        this.cool.jump(0.0f);
        this.fail.jump(0.0f);
        java.util.Arrays.fill(head0, 0.0f);
        java.util.Arrays.fill(head1, 0.0f);
        java.util.Arrays.fill(tail0, 0.0f);
        java.util.Arrays.fill(tail1, 0.0f);
        java.util.Arrays.fill(dotPower, 0.0f);
        java.util.Arrays.fill(dotFresh, 0.0f);
    }

    public void advance(
            float dtSeconds,
            Stage targetStage,
            boolean visible,
            float loudnessDb,
            boolean reduceMotion) {
        Stage nextStage = targetStage == null ? Stage.RECORDING : targetStage;
        if (nextStage != this.stage) {
            if (nextStage == Stage.DONE) {
                armDone();
            }
            if (nextStage == Stage.PROCESSING) {
                this.flowOffset = -this.widthDp * 0.5f - 4.0f;
            }
            this.stage = nextStage;
            this.elapsed = 0.0f;
        }
        this.reduceMotion = reduceMotion;
        float clampedDt = clamp(dtSeconds, 0.0f, 0.06f);
        this.pending += clampedDt;
        while (this.pending >= STEP) {
            this.pending -= STEP;
            step(visible, loudnessDb, reduceMotion);
        }
    }

    public int getColumns() {
        return columns;
    }

    public int getRows() {
        return rows;
    }

    public float getSpacingDp() {
        return spacingDp;
    }

    public float getWidthDp() {
        return widthDp;
    }

    public float getHeightDp() {
        return heightDp;
    }

    public float[] getDotPower() {
        return dotPower;
    }

    public float[] getDotFresh() {
        return dotFresh;
    }

    public float getOpacity() {
        return clamp(opacity.x, 0.0f, 1.0f);
    }

    public float getCool() {
        return clamp(cool.x, 0.0f, 1.0f);
    }

    public float getFail() {
        return clamp(fail.x, 0.0f, 1.0f);
    }

    public float getGlow() {
        return (traces[0].glow + traces[1].glow) * 0.5f;
    }

    public float getGrid() {
        return grid;
    }

    public float getLive() {
        return live;
    }

    public float getVoiceLevel() {
        return clamp(voices[0].level, 0.0f, 1.0f);
    }

    public Stage getStage() {
        return stage;
    }

    private void resize(int newCols, int newRows) {
        int oldCols = this.columns;
        int oldRows = this.rows;
        int across = Math.floorDiv(newCols - oldCols, 2);
        int down = Math.floorDiv(newRows - oldRows, 2);
        int count = newCols * newRows;

        this.head0 = remapGrid(this.head0, oldCols, oldRows, newCols, newRows, across, down, count);
        this.head1 = remapGrid(this.head1, oldCols, oldRows, newCols, newRows, across, down, count);
        this.tail0 = remapGrid(this.tail0, oldCols, oldRows, newCols, newRows, across, down, count);
        this.tail1 = remapGrid(this.tail1, oldCols, oldRows, newCols, newRows, across, down, count);
        this.dotPower = remapGrid(this.dotPower, oldCols, oldRows, newCols, newRows, across, down, count);
        this.dotFresh = remapGrid(this.dotFresh, oldCols, oldRows, newCols, newRows, across, down, count);

        this.columns = newCols;
        this.rows = newRows;
        int samples = (newCols - 1) * SAMPLES_PER_COLUMN + 1;
        this.ys0 = new float[samples];
        this.ys1 = new float[samples];
        this.bright0 = new float[samples];
        this.bright1 = new float[samples];
    }

    private static float[] remapGrid(
            float[] oldGrid,
            int oldCols,
            int oldRows,
            int newCols,
            int newRows,
            int across,
            int down,
            int count) {
        float[] next = new float[count];
        if (oldGrid == null || oldGrid.length == 0 || oldCols <= 0 || oldRows <= 0) {
            return next;
        }
        for (int n = 0; n < count; n++) {
            int i = (n % newCols) - across;
            int j = (n / newCols) - down;
            if (i >= 0 && i < oldCols && j >= 0 && j < oldRows) {
                next[n] = oldGrid[j * oldCols + i];
            }
        }
        return next;
    }

    private void step(boolean visible, float loudnessDb, boolean reduceMotionFlag) {
        float h = STEP;
        boolean recording = (this.stage == Stage.RECORDING) && visible;
        float inputLevel;
        if (recording) {
            this.level = this.autoLevel.step(loudnessDb, h, AUTO_RELEASE_S, NOISE_FLOOR_DB);
            inputLevel = clamp(this.level * (GAIN * this.voiceResponse), 0.0f, 1.0f);
        } else {
            this.level = 0.0f;
            inputLevel = 0.0f;
        }
        voices[0].step(inputLevel, h);
        voices[1].step(inputLevel * 0.85f, h);

        float liveTarget = recording ? 1.0f : 0.0f;
        this.live += (liveTarget - this.live) * (1.0f - (float) Math.exp(-h / 0.55f));

        float speed = reduceMotionFlag ? 0.0f : 1.0f;
        float responseHz = clamp(RESPONSE_HZ * this.voiceResponse, 3.0f, 14.0f);
        traces[0].tick(voices[0], this.live, speed, responseHz, h);
        traces[1].tick(voices[1], this.live, speed, responseHz, h);

        float energy = Math.max(voices[0].energy, voices[1].energy);
        boolean working = (this.stage == Stage.PROCESSING || this.stage == Stage.DONE);
        boolean flowing = working && this.processingMode == ProcessingMode.FLOW;
        this.flowTurn += ((flowing ? 1.0f : 0.0f) - this.flowTurn)
                * (1.0f - (float) Math.exp(-h / 0.25f));
        if (working) {
            this.flowOffset += flowSpeed() * h;
        }
        float restTurn = CARRIER_REST + 0.22f * energy;
        float turn = restTurn + (flowTurnHz() - restTurn) * this.flowTurn;
        this.carrier = (this.carrier + h * TAU * turn * speed) % TAU;

        float coolTarget = working ? 1.0f : 0.0f;
        float failTarget = (this.stage == Stage.FAILED) ? 1.0f : 0.0f;
        float shownTarget = visible ? 1.0f : 0.0f;

        if (reduceMotionFlag) {
            scale.jump(1.0f);
            softness.jump(0.0f);
            opacity.stepTo(shownTarget, REDUCED_FADE_S, 0.0f, h);
            cool.stepTo(coolTarget, REDUCED_FADE_S, 0.0f, h);
            fail.stepTo(failTarget, REDUCED_FADE_S, 0.0f, h);
        } else {
            opacity.stepTo(shownTarget, TRANSITION_S, 0.0f, h);
            scale.stepTo(visible ? 1.0f : HIDDEN_SCALE, TRANSITION_S, 0.08f, h);
            softness.stepTo(visible ? 0.0f : HIDDEN_SOFTNESS, TRANSITION_S, 0.0f, h);
            cool.stepTo(coolTarget, TRANSITION_S, 0.0f, h);
            fail.stepTo(failTarget, TRANSITION_S, 0.0f, h);
        }

        this.elapsed += h;
        this.time += h;
        this.steps++;
        if ((this.steps & 1L) == 0L) {
            beam(2.0f * h);
        }
    }

    private float workPeriod() {
        return 2.0f * Math.max(SHIMMER_PASS_S, 0.05f);
    }

    private float flowSpacing() {
        return FLOW_SPACING * this.widthDp;
    }

    private float flowSpeed() {
        return flowSpacing() / workPeriod();
    }

    private float flowTurnHz() {
        return flowSpeed() * this.helixCycles / Math.max(this.widthDp, 1.0f);
    }

    private float pulseSpeed() {
        return (this.widthDp * 0.5f + 12.0f) / (1.4f * workPeriod());
    }

    private void armDone() {
        this.speedAtDone = 1.5f * pulseSpeed();
        this.doneFrom = (this.stage == Stage.PROCESSING) ? this.elapsed : 0.0f;
    }

    private float processHead(float elapsedSec) {
        float pass = Math.max(SHIMMER_PASS_S, 0.05f);
        return (2.2f + Math.abs((float) Math.sin(PI * (elapsedSec / pass + 0.5f))))
                * smoothstep(0.0f, 0.14f, elapsedSec)
                * SHIMMER;
    }

    private float processFront(float elapsedSec, float width) {
        float pass = Math.max(SHIMMER_PASS_S, 0.05f);
        float position = 0.5f - 0.5f * (float) Math.cos(PI * (elapsedSec / pass + 0.5f));
        return -width * 0.5f + PASS_INSET + (width - 2.0f * PASS_INSET) * position;
    }

    private void populateScan(float width) {
        float e = this.elapsed;
        if (this.stage == Stage.FAILED || this.reduceMotion) {
            scan.kind = ScanState.ENTER;
            scan.helix = 1.0f;
            scan.decay = 1.0f;
            scan.tail = 1.0f;
            scan.grid = 1.0f;
            scan.reach = 1e4f;
            scan.head = 0.0f;
            scan.unfold = 1.0f;
            return;
        }
        if (this.stage == Stage.RECORDING) {
            scan.kind = ScanState.ENTER;
            scan.helix = 1.0f;
            scan.decay = 1.0f;
            scan.tail = 1.0f;
            scan.grid = Math.min(e / 0.3f, 1.0f);
            scan.reach = (width * 0.5f + 12.0f) * passPosition(e / ENTER);
            scan.head = 2.8f * (1.0f - smoothstep(0.08f, ENTER, e));
            scan.unfold = smoothstep(0.0f, 0.1f, e);
            return;
        }
        if (this.stage == Stage.PROCESSING && this.processingMode != ProcessingMode.SWEEP) {
            float enter = smoothstep(0.0f, 0.35f, e);
            scan.kind = ScanState.WORK;
            scan.helix = 1.0f + (WORK_HELIX - 1.0f) * enter;
            scan.decay = 1.0f;
            scan.tail = 1.0f;
            scan.grid = 1.0f;
            scan.isPulse = (this.processingMode == ProcessingMode.PULSE);
            scan.workTime = e;
            scan.workPeriod = workPeriod();
            scan.workSpeed = pulseSpeed();
            scan.flowOffset = this.flowOffset;
            scan.flowSpacing = flowSpacing();
            scan.head = 2.5f * smoothstep(0.05f, 0.3f, e) * SHIMMER;
            scan.swell = 0.9f * enter;
            scan.halfWidth = width * 0.5f;
            return;
        }
        if (this.stage == Stage.DONE) {
            float target = width * 0.5f + 8.0f;
            float front = hermite(0.0f, this.speedAtDone, target, e / WIPE);
            boolean sweep = (this.processingMode == ProcessingMode.SWEEP);
            scan.kind = ScanState.CLEAR;
            scan.helix = sweep ? 0.0f : WORK_HELIX;
            scan.decay = 1.0f - 0.6f * smoothstep(0.0f, 0.12f, e);
            scan.tail = 1.0f - smoothstep(0.0f, 0.15f, e);
            scan.grid = 1.0f - smoothstep(0.2f, 0.4f, e);
            scan.front = front;
            scan.head = 2.8f * smoothstep(0.0f, 0.04f, e) * (1.0f - smoothstep(0.22f, 0.32f, e));
            scan.beam = (sweep && this.doneFrom > 0.0f)
                    ? processHead(this.doneFrom + e) * (1.0f - smoothstep(0.0f, BEAM_FADE, e))
                    : 0.0f;
            scan.beamAt = processFront(this.doneFrom + e, width);
            scan.field = sweep ? 0.0f : 1.0f;
            scan.isPulse = (this.processingMode == ProcessingMode.PULSE);
            scan.workTime = this.doneFrom + e;
            scan.workPeriod = workPeriod();
            scan.workSpeed = pulseSpeed();
            scan.flowOffset = this.flowOffset;
            scan.flowSpacing = flowSpacing();
            scan.glow = (sweep ? 0.0f : 2.5f) * SHIMMER * (1.0f - smoothstep(0.0f, 0.18f, e));
            scan.swell = 0.9f;
            scan.halfWidth = width * 0.5f;
            return;
        }
        // Stage.PROCESSING + ProcessingMode.SWEEP
        float iron = 1.0f - smoothstep(0.0f, 0.28f, e);
        scan.kind = ScanState.PROCESS;
        scan.helix = iron;
        scan.decay = 1.0f;
        scan.tail = 1.0f;
        scan.grid = 1.0f;
        scan.iron = iron;
        scan.front = processFront(e, width);
        scan.head = processHead(e);
    }

    private void beam(float hb) {
        int cols = this.columns;
        int rws = this.rows;
        if (cols < 2 || rws < 2) {
            return;
        }
        int sub = SAMPLES_PER_COLUMN;
        int samples = (cols - 1) * sub + 1;
        float pitch = this.spacingDp;
        float width = Math.max(this.widthDp, this.heightDp);
        populateScan(width);
        this.grid = scan.grid;

        float mid = (rws - 1.0f) * 0.5f;
        float half = mid - 0.55f;
        float breath = this.reduceMotion
                ? 0.5f
                : 0.5f + 0.5f * (float) Math.sin(this.time * TAU / BREATH_PERIOD);
        float rest = (0.55f + 0.35f * breath) * (0.4f + 0.6f * this.live) * scan.helix;
        float halfWidth = width * 0.5f;
        float halfCols = (cols - 1.0f) * 0.5f;

        for (int k = 0; k < 2; k++) {
            Trace trace = traces[k];
            float sign = (k == 0) ? 1.0f : -1.0f;
            float[] ys = (k == 0) ? ys0 : ys1;
            float[] bright = (k == 0) ? bright0 : bright1;
            for (int s = 0; s < samples; s++) {
                float x = ((float) s / sub - halfCols) * pitch;
                float own = Math.abs(x);
                if (own > halfWidth) {
                    ys[s] = mid;
                    bright[s] = 0.0f;
                    continue;
                }
                scan.evalAt(x, scanEval);
                float amplitude = scanEval[0];
                float scanBright = scanEval[1];
                float swell = scanEval[2];

                float xn = (x + halfWidth) / width;
                float ends = Math.min(
                        smoothstep(-halfWidth + 3.0f, -halfWidth + 17.0f, x),
                        smoothstep(-halfWidth + 3.0f, -halfWidth + 17.0f, -x));
                float reach = 1.0f - 0.8f * smoothstep(14.0f, halfWidth, own);
                float delay = own / this.historySpeed;
                float a = trace.past(delay, 0);
                float spread = 0.0f;
                for (int c = 0; c < 4; c++) {
                    spread += trace.past(delay, 1 + c)
                            * (float) Math.sin(TAU * SPATIAL[c] * xn - trace.phases[c]);
                }
                float helix = (rest + swell + half * 0.55f * a * reach)
                        * (float) Math.sin(TAU * this.helixCycles * xn - this.carrier);
                float y = half
                        * (float) Math.tanh((helix + half * 0.7f * spread * reach) / Math.max(half, 0.1f))
                        * ends * amplitude;
                ys[s] = mid - sign * y;
                float spatial = (0.3f + 0.7f * Math.min(a * 1.8f, 1.0f)) * (0.45f + 0.55f * ends);
                bright[s] = spatial * amplitude + 0.36f * Math.max(scanBright - amplitude, 0.0f);
            }
            for (int s = 0; s < samples; s++) {
                int sNext = Math.min(s + 1, samples - 1);
                int sPrev = Math.max(s - 1, 0);
                float slope = (ys[sNext] - ys[sPrev]) * sub * 0.5f;
                bright[s] *= 0.45f + 0.55f / (float) Math.sqrt(1.0f + 0.22f * slope * slope);
            }
        }

        float headKeep = (float) Math.exp(-hb / Math.max(PHOSPHOR_HEAD * scan.decay, 1e-4f));
        float tailKeep = (float) Math.exp(-hb / Math.max(PHOSPHOR_TAIL * scan.decay, 1e-4f));
        float dx = 1.0f / sub;
        float dx2 = dx * dx;

        for (int i = 0; i < cols; i++) {
            int s0 = Math.max(0, i - 3) * sub;
            int s1 = Math.min((i + 3) * sub, samples - 1);
            for (int j = 0; j < rws; j++) {
                int n = j * cols + i;
                float now = 0.0f;
                float total = 0.0f;

                float lit0 = sampleTraceDot(
                        i, j, n, s0, s1, dx, dx2, ys0, bright0, head0, tail0,
                        headKeep, tailKeep, scan.tail);
                float now0 = lastInstant;
                now += now0;
                total += lit0;

                float lit1 = sampleTraceDot(
                        i, j, n, s0, s1, dx, dx2, ys1, bright1, head1, tail1,
                        headKeep, tailKeep, scan.tail);
                float now1 = lastInstant;
                now += now1;
                total += lit1;

                float p0 = Math.min(lit0, 1.0f);
                float p1 = Math.min(lit1, 1.0f);
                float power = 1.0f - (1.0f - p0) * (1.0f - p1);
                dotPower[n] = clamp(power, 0.0f, 1.0f);
                dotFresh[n] = Math.min(now / Math.max(total, 1e-4f), 1.0f);
            }
        }
    }

    private float lastInstant;

    private float sampleTraceDot(
            int i,
            int j,
            int n,
            int s0,
            int s1,
            float dx,
            float dx2,
            float[] ys,
            float[] bright,
            float[] headBuf,
            float[] tailBuf,
            float headKeep,
            float tailKeep,
            float scanTail) {
        float best = Float.MAX_VALUE;
        int nearest = i * SAMPLES_PER_COLUMN;
        for (int s = s0; s < s1; s++) {
            float ay = ys[s];
            float dy = ys[s + 1] - ay;
            float px = i - s * dx;
            float py = j - ay;
            float t = clamp((px * dx + py * dy) / (dx2 + dy * dy), 0.0f, 1.0f);
            float ex = px - t * dx;
            float ey = py - t * dy;
            float d2 = ex * ex + ey * ey;
            if (d2 < best) {
                best = d2;
                nearest = s;
            }
        }
        float b = bright[nearest];
        float onBeam = (float) Math.exp(-best / 0.25f);
        float instant = Math.min(onBeam + 0.5f * (float) Math.exp(-Math.sqrt(best) / 0.8f), 1.2f) * b;
        float core = onBeam * b;
        float hVal = Math.max(headBuf[n] * headKeep, core);
        headBuf[n] = hVal;
        float tVal = Math.max(tailBuf[n] * tailKeep, core);
        tailBuf[n] = tVal;
        lastInstant = instant;
        return Math.max(Math.max(instant, hVal), 0.55f * scanTail * tVal);
    }

    static float smoothstep(float a, float b, float x) {
        float denom = b - a;
        if (Math.abs(denom) < 1e-6f) {
            return x >= b ? 1.0f : 0.0f;
        }
        float t = clamp((x - a) / denom, 0.0f, 1.0f);
        return t * t * (3.0f - 2.0f * t);
    }

    private static float bump(float d, float w) {
        float r = d / w;
        return (float) Math.exp(-(r * r));
    }

    private static float hermite(float start, float speed, float end, float tIn) {
        float t = clamp(tIn, 0.0f, 1.0f);
        float t2 = t * t;
        float t3 = t2 * t;
        return (2.0f * t3 - 3.0f * t2 + 1.0f) * start
                + (t3 - 2.0f * t2 + t) * WIPE * speed
                + (3.0f * t2 - 2.0f * t3) * end;
    }

    private static float passPosition(float p) {
        return 0.5f - 0.5f * (float) Math.cos(PI * clamp(p, 0.0f, 1.0f));
    }

    private static float remEuclid(float x, float mod) {
        float r = x % mod;
        return r < 0.0f ? r + mod : r;
    }

    static float clamp(float value, float min, float max) {
        return Math.max(min, Math.min(max, value));
    }

    private static final class AutoLevel {
        private static final float MIN_SPAN = 16.0f;
        private static final float RANGE = 24.0f;
        private static final float ROOM_MARGIN = 5.0f;
        private static final float ATTACK = 0.04f;
        private static final float ROOM_FALL = 0.30f;
        private static final float ROOM_RISE = 6.0f;

        private float peak = -30.0f;
        private float room = -55.0f;

        float step(float loudnessDb, float dt, float release, float noiseFloor) {
            float db = Math.max(loudnessDb, -120.0f);
            float roomTime = db < room ? ROOM_FALL : ROOM_RISE;
            room += (db - room) * (1.0f - (float) Math.exp(-dt / Math.max(roomTime, 1e-3f)));
            float lowest = Math.max(room, noiseFloor) + MIN_SPAN;
            if (db > peak) {
                peak += (db - peak) * (1.0f - (float) Math.exp(-dt / ATTACK));
            } else {
                peak += (lowest - peak) * (1.0f - (float) Math.exp(-dt / Math.max(release, 1e-3f)));
            }
            peak = Math.max(peak, lowest);
            float low = Math.max(Math.max(room, noiseFloor) + ROOM_MARGIN, peak - RANGE);
            return clamp((db - low) / Math.max(peak - low, 1.0f), 0.0f, 1.0f);
        }
    }

    private static final class Voice {
        float level;
        float reservoir;
        float energy;
        float kick;
        float kickVelocity;
        float band;

        void reset() {
            level = 0.0f;
            reservoir = 0.0f;
            energy = 0.0f;
            kick = 0.0f;
            kickVelocity = 0.0f;
            band = 0.0f;
        }

        void step(float raw, float h) {
            float previous = level;
            float tLevel = raw > level ? 0.035f : 0.095f;
            level += (raw - level) * (1.0f - (float) Math.exp(-h / tLevel));
            float rise = Math.max((level - previous) / h, 0.0f);
            reservoir += (1.75f * level * level - reservoir / 1.8f) * h;
            energy = 1.0f - (float) Math.exp(-reservoir * 1.45f);
            float w = TAU * 1.3f;
            float z = 0.22f;
            kickVelocity += (-w * w * kick - 2.0f * z * w * kickVelocity
                    + 15.0f * rise + 2.2f * level) * h;
            kick += kickVelocity * h;
            float tBand = raw > band ? 0.025f : 0.14f;
            band += (raw - band) * (1.0f - (float) Math.exp(-h / tBand));
        }
    }

    private static final class Trace {
        float envelope;
        float amplitude;
        float amplitudeVelocity;
        float glowFast;
        float glowSpring;
        float glowSpringVelocity;
        float glowSlow;
        float glow;
        final float[] phases = new float[4];
        final float[] history = new float[HISTORY * 5];
        int head;

        Trace(float p0, float p1, float p2, float p3) {
            reset(p0, p1, p2, p3);
        }

        void reset(float p0, float p1, float p2, float p3) {
            envelope = 0.0f;
            amplitude = 0.0f;
            amplitudeVelocity = 0.0f;
            glowFast = 0.0f;
            glowSpring = 0.0f;
            glowSpringVelocity = 0.0f;
            glowSlow = 0.0f;
            glow = 0.0f;
            phases[0] = p0;
            phases[1] = p1;
            phases[2] = p2;
            phases[3] = p3;
            java.util.Arrays.fill(history, 0.0f);
            head = 0;
        }

        void tick(Voice voice, float live, float speed, float responseHz, float h) {
            envelope = follow(envelope, voice.level, 0.022f, RELEASE_S, h);
            float w = TAU * responseHz;
            float z = 0.52f;
            amplitudeVelocity += (-w * w * (amplitude - envelope) - 2.0f * z * w * amplitudeVelocity) * h;
            amplitude += amplitudeVelocity * h;

            glowFast = follow(glowFast, voice.level, 0.045f, 0.13f, h);
            float gw = TAU * 3.6f;
            float gz = 0.50f;
            glowSpringVelocity += (-gw * gw * (glowSpring - glowFast)
                    - 2.0f * gz * gw * glowSpringVelocity) * h;
            glowSpring += glowSpringVelocity * h;
            glowSlow = follow(glowSlow, voice.level, 0.15f, 0.70f, h);

            float swell = 0.8f * Math.max(glowSpring - 0.25f, 0.0f)
                    + 0.04f * Math.max(voice.kick, -0.5f);
            glow = Math.min(Math.max(swell, 0.0f) + 0.42f * glowSlow + 0.20f * voice.energy, 1.15f)
                    * live;

            float go = 0.6f + 1.1f * Math.min(envelope * 1.6f, 1.0f);
            for (int c = 0; c < 4; c++) {
                phases[c] = (phases[c] + h * TAU * SPEEDS[c] * go * speed) % TAU;
            }
            float emphasis = 0.35f + 0.65f * Math.min(voice.band / (voice.band + 0.06f), 2.0f);
            int offset = head * 5;
            float amp = Math.max(amplitude, 0.0f) * live;
            history[offset] = amp;
            for (int c = 0; c < 4; c++) {
                history[offset + 1 + c] = amp * BASE[c] * emphasis;
            }
            head = (head + 1) % HISTORY;
        }

        float past(float delay, int channel) {
            float d = Math.min(delay / STEP, HISTORY - 2);
            int i = (int) Math.floor(d);
            float k = d - i;
            int a = (head + 2 * HISTORY - 1 - i) % HISTORY;
            int b = (a + HISTORY - 1) % HISTORY;
            return history[a * 5 + channel] * (1.0f - k) + history[b * 5 + channel] * k;
        }

        private static float follow(float current, float target, float rise, float fall, float h) {
            float t = target > current ? rise : fall;
            return current + (target - current) * (1.0f - (float) Math.exp(-h / Math.max(t, 1e-4f)));
        }
    }

    private static final class Spring {
        private static final float CRITICAL_TOLERANCE = 1e-4f;
        float x;
        float v;
        float target;

        static Spring at(float value) {
            Spring s = new Spring();
            s.x = value;
            s.v = 0.0f;
            s.target = value;
            return s;
        }

        void jump(float value) {
            x = value;
            v = 0.0f;
            target = value;
        }

        void stepTo(float nextTarget, float duration, float bounce, float dt) {
            target = nextTarget;
            if (dt <= 0.0f || !Float.isFinite(dt)) {
                return;
            }
            float omega = TAU / Math.max(duration, 0.01f);
            float zeta = bounce >= 0.0f
                    ? Math.max(1.0f - bounce, 0.0f)
                    : 1.0f / Math.max(1.0f + bounce, 0.01f);
            float x0 = x - target;
            float v0 = v;

            if (zeta < 1.0f - CRITICAL_TOLERANCE) {
                float decay = zeta * omega;
                float omegaD = omega * (float) Math.sqrt(1.0f - zeta * zeta);
                float exp = (float) Math.exp(-decay * dt);
                float sin = (float) Math.sin(omegaD * dt);
                float cos = (float) Math.cos(omegaD * dt);
                float sinOverD = sin / omegaD;
                x = target + exp * (x0 * (cos + decay * sinOverD) + v0 * sinOverD);
                v = exp * (-x0 * omega * omega * sinOverD + v0 * (cos - decay * sinOverD));
            } else if (zeta > 1.0f + CRITICAL_TOLERANCE) {
                float root = (float) Math.sqrt(zeta * zeta - 1.0f);
                float rootSum = zeta + root;
                float slowRoot = -omega / rootSum;
                float fastRoot = -omega * rootSum;
                float denom = slowRoot - fastRoot;
                float slowExp = (float) Math.exp(slowRoot * dt);
                float fastExp = (float) Math.exp(fastRoot * dt);
                float p00 = (-fastRoot * slowExp + slowRoot * fastExp) / denom;
                float p01 = (slowExp - fastExp) / denom;
                float p10 = slowRoot * fastRoot * (fastExp - slowExp) / denom;
                float p11 = (slowRoot * slowExp - fastRoot * fastExp) / denom;
                x = target + p00 * x0 + p01 * v0;
                v = p10 * x0 + p11 * v0;
            } else {
                float exp = (float) Math.exp(-omega * dt);
                float c = v0 + omega * x0;
                x = target + (x0 + c * dt) * exp;
                v = (v0 - omega * c * dt) * exp;
            }
        }
    }

    private static final class ScanState {
        static final int ENTER = 0;
        static final int PROCESS = 1;
        static final int WORK = 2;
        static final int CLEAR = 3;

        int kind;
        float helix;
        float decay;
        float tail;
        float grid;
        float reach;
        float head;
        float unfold;
        float iron;
        float front;
        float beam;
        float beamAt;
        float field;
        float glow;
        float swell;
        float halfWidth;
        boolean isPulse;
        float workTime;
        float workPeriod;
        float workSpeed;
        float flowOffset;
        float flowSpacing;

        void evalAt(float x, float[] out) {
            if (kind == ENTER) {
                float d = Math.abs(x);
                float drawn = unfold * (1.0f - smoothstep(
                        Math.max(reach - 14.0f, 0.0f), Math.max(reach, 0.001f), d));
                float amp = drawn * (1.0f - smoothstep(
                        Math.max(reach - 22.0f, 0.0f), Math.max(reach - 3.0f, 0.001f), d));
                float b = head * bump(d - reach, 6.0f);
                float sw = 1.8f * unfold * (head / 2.8f)
                        * bump(d - Math.max(reach - 14.0f, 0.0f), 14.0f);
                out[0] = amp;
                out[1] = amp + b;
                out[2] = sw;
                return;
            }
            if (kind == PROCESS) {
                out[0] = iron;
                out[1] = iron + head * bump(x - front, 5.0f);
                out[2] = 0.0f;
                return;
            }
            if (kind == WORK) {
                float light = evalWorkingLight(x);
                out[0] = 1.0f;
                out[1] = 1.0f + head * light;
                out[2] = swell * light;
                return;
            }
            // CLEAR
            float d = Math.abs(x);
            float keep = field * smoothstep(front - 12.0f, front - 2.0f, d);
            float light = evalWorkingLight(x);
            out[0] = keep;
            out[1] = keep * (1.0f + glow * light)
                    + head * bump(d - front, 6.0f)
                    + beam * bump(x - beamAt, 5.0f);
            out[2] = keep * swell * light;
        }

        private float evalWorkingLight(float x) {
            if (!isPulse) {
                float sp = Math.max(flowSpacing, 1.0f);
                float d = remEuclid(x - flowOffset + sp * 0.5f, sp) - sp * 0.5f;
                return bump(d, 7.0f);
            }
            float d = Math.abs(x);
            float light = 0.0f;
            float age = remEuclid(workTime, Math.max(workPeriod, 0.05f));
            while (age * workSpeed < halfWidth + 12.0f && age <= workTime + 1e-4f) {
                float radius = age * workSpeed;
                float fade = smoothstep(0.0f, RING_BIRTH, age)
                        * (1.0f - 0.6f * smoothstep(0.3f * halfWidth, halfWidth, radius));
                light += bump(d - radius, 6.0f) * fade;
                age += workPeriod;
            }
            return Math.min(light, 1.0f);
        }
    }
}
