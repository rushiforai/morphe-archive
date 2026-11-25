package app.voidhack.extension.applemusic.sing;

import app.voidhack.extension.applemusic.sing.SingBackendPolicy.Backend;
import app.voidhack.extension.applemusic.sing.SingBackendPolicy.CacheState;
import app.voidhack.extension.applemusic.sing.SingBackendPolicy.FidelityMetrics;
import app.voidhack.extension.applemusic.sing.SingBackendPolicy.ProbeResult;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public final class SingBackendPolicyTest {
    private static FidelityMetrics cleanFidelity() {
        return new FidelityMetrics(0, 0.28, 0.28, 0.004, 0.9999, 0.01f, 3.0f);
    }

    @Test
    public void prefersGpuFreeCpuWhenCpuAlreadyMeetsRealtimeBudget() {
        ProbeResult cpuLow = ProbeResult.success(Backend.CPU_LOW_LOAD, 80, 1500, 1400, 2700, cleanFidelity());
        ProbeResult npu = ProbeResult.success(Backend.NNAPI_NPU, 350, 700, 420, 380, cleanFidelity());
        ProbeResult gpu = ProbeResult.success(Backend.WEBGPU_GPU, 220, 1800, 410, 140, cleanFidelity());

        assertFalse(SingBackendPolicy.shouldProbeHardwareAccelerators(cpuLow));
        assertEquals(Backend.CPU_LOW_LOAD, SingBackendPolicy.chooseWinner(Arrays.asList(cpuLow, npu, gpu)));

        // Even when 2-thread CPU exceeds smooth budget, 4-thread CPU <= 2600ms still wins over shared GPU.
        ProbeResult slowLow = ProbeResult.success(Backend.CPU_LOW_LOAD, 80, 2900, 2800, 5200, cleanFidelity());
        ProbeResult fastCpu = ProbeResult.success(Backend.CPU_FAST, 80, 2200, 2100, 7800, cleanFidelity());
        assertFalse(SingBackendPolicy.shouldProbeHardwareAccelerators(fastCpu));
        assertEquals(Backend.CPU_FAST, SingBackendPolicy.chooseWinner(Arrays.asList(slowLow, fastCpu, gpu)));
    }

    @Test
    public void prefersNpuOverWebGpuOnlyWhenCpuCannotSustainRealtime() {
        ProbeResult cpuLow = ProbeResult.success(Backend.CPU_LOW_LOAD, 80, 4800, 4500, 8800, cleanFidelity());
        ProbeResult cpuFast = ProbeResult.success(Backend.CPU_FAST, 80, 3400, 3100, 11000, cleanFidelity());
        ProbeResult npu = ProbeResult.success(Backend.NNAPI_NPU, 350, 700, 420, 380, cleanFidelity());
        ProbeResult gpu = ProbeResult.success(Backend.WEBGPU_GPU, 220, 1800, 410, 370, cleanFidelity());

        assertTrue(SingBackendPolicy.shouldProbeHardwareAccelerators(cpuFast));
        assertEquals(Backend.NNAPI_NPU, SingBackendPolicy.chooseWinner(Arrays.asList(cpuLow, cpuFast, npu, gpu)));
    }

    @Test
    public void selectsWebGpuOnlyAsLastResortWhenCpuTooSlowAndNpuRejected() {
        ProbeResult cpuFast = ProbeResult.success(Backend.CPU_FAST, 80, 3400, 3100, 11000, cleanFidelity());
        ProbeResult npuSlow = ProbeResult.success(Backend.NNAPI_NPU, 180, 8100, 7900, 8100, cleanFidelity());
        ProbeResult gpuFast = ProbeResult.success(Backend.WEBGPU_GPU, 220, 1600, 350, 140, cleanFidelity());

        assertEquals(Backend.WEBGPU_GPU, SingBackendPolicy.chooseWinner(Arrays.asList(cpuFast, npuSlow, gpuFast)));
    }

    @Test
    public void rejectsSlowWebGpuToProtectUiRendering() {
        ProbeResult cpuFast = ProbeResult.success(Backend.CPU_FAST, 80, 3400, 3100, 11000, cleanFidelity());
        // Low CPU time, but 1500ms on the shared mobile GPU would stutter UI / Liquid Glass.
        ProbeResult gpuHeavy = ProbeResult.success(Backend.WEBGPU_GPU, 220, 2600, 1500, 180, cleanFidelity());

        assertEquals(Backend.CPU_FAST, SingBackendPolicy.chooseWinner(Arrays.asList(cpuFast, gpuHeavy)));
    }

    @Test
    public void stereoResamplerPreservesPassbandAndDcAcrossSampleRates() {
        int frames48 = 4800;
        int frames44 = 4410;
        float[] src = new float[frames48 * 2];
        for (int i = 0; i < frames48; i++) {
            float t = i / 48000f;
            src[i * 2] = 0.5f * (float) Math.sin(2.0 * Math.PI * 1000.0 * t);
            src[i * 2 + 1] = 0.4f;
        }
        StereoResampler down = new StereoResampler(48000, 44100);
        StereoResampler up = new StereoResampler(44100, 48000);
        float[] mid = new float[frames44 * 2];
        float[] roundtrip = new float[frames48 * 2];
        down.resample(src, mid);
        up.resample(mid, roundtrip);

        double errSq = 0.0;
        double refSq = 0.0;
        for (int i = 200; i < frames48 - 200; i++) {
            double dL = roundtrip[i * 2] - src[i * 2];
            double dR = roundtrip[i * 2 + 1] - src[i * 2 + 1];
            errSq += dL * dL + dR * dR;
            refSq += (double) src[i * 2] * src[i * 2] + (double) src[i * 2 + 1] * src[i * 2 + 1];
        }
        double relRms = Math.sqrt(errSq / refSq);
        assertTrue("Expected low roundtrip error, got " + relRms, relRms < 0.01);
    }

    @Test
    public void rejectsSoftwareEmulatedAcceleratorsAndChoosesLowLoadCpu() {
        ProbeResult cpuLow = ProbeResult.success(Backend.CPU_LOW_LOAD, 83, 1622, 1436, 2775, cleanFidelity());
        ProbeResult cpuFast = ProbeResult.success(Backend.CPU_FAST, 86, 1176, 838, 3022, cleanFidelity());
        ProbeResult webgpuSw = ProbeResult.success(Backend.WEBGPU_GPU, 229, 7348, 6807, 5459, cleanFidelity());
        ProbeResult nnapiSw = ProbeResult.success(Backend.NNAPI_NPU, 181, 8031, 7894, 8115, cleanFidelity());

        assertEquals(
                Backend.CPU_LOW_LOAD,
                SingBackendPolicy.chooseWinner(Arrays.asList(cpuLow, cpuFast, webgpuSw, nnapiSw)));
    }

    @Test
    public void fallsBackToFastCpuWhenLowLoadCpuExceedsSmoothBudget() {
        ProbeResult cpuLow = ProbeResult.success(Backend.CPU_LOW_LOAD, 90, 2900, 2650, 5100, cleanFidelity());
        ProbeResult cpuFast = ProbeResult.success(Backend.CPU_FAST, 90, 1700, 1550, 5600, cleanFidelity());

        assertEquals(Backend.CPU_FAST, SingBackendPolicy.chooseWinner(Arrays.asList(cpuLow, cpuFast)));
    }

    @Test
    public void rejectsAcceleratorWithoutGenuineCpuOffloadOrSpeedup() {
        ProbeResult cpuFast = ProbeResult.success(Backend.CPU_FAST, 80, 3100, 2900, 8000, cleanFidelity());
        // Marginally faster wall (< 25% speedup) and no real CPU offload (> 70% CPU) => rejected.
        ProbeResult marginal = ProbeResult.success(Backend.NNAPI_NPU, 150, 2600, 2300, 7200, cleanFidelity());

        assertEquals(Backend.CPU_FAST, SingBackendPolicy.chooseWinner(Arrays.asList(cpuFast, marginal)));
    }

    @Test
    public void fidelityComparisonAcceptsSmallFp16DriftAndRejectsCorruption() {
        float[] reference = SingBackendPolicy.createCalibrationTensor(64, 16);
        float[] fp16Like = Arrays.copyOf(reference, reference.length);
        for (int i = 0; i < fp16Like.length; i++) {
            fp16Like[i] *= 0.992f;
        }
        FidelityMetrics ok = SingBackendPolicy.compareOutputs(reference, fp16Like);
        assertTrue(ok.isAcceptable());

        float[] withNaN = Arrays.copyOf(reference, reference.length);
        withNaN[100] = Float.NaN;
        assertFalse(SingBackendPolicy.compareOutputs(reference, withNaN).isAcceptable());

        float[] zeroed = new float[reference.length];
        assertFalse(SingBackendPolicy.compareOutputs(reference, zeroed).isAcceptable());

        float[] inverted = new float[reference.length];
        for (int i = 0; i < reference.length; i++) {
            inverted[i] = -reference[i];
        }
        assertFalse(SingBackendPolicy.compareOutputs(reference, inverted).isAcceptable());
    }

    @Test
    public void cacheStateBlocksPendingBackendAfterNativeCrashAndResetsOnEnvChange() {
        String env = "fp1|sha|1.32.0|v1";
        CacheState state = CacheState.fresh(env);
        state.selected = Backend.NNAPI_NPU;
        state.markPending(Backend.NNAPI_NPU);
        Properties saved = state.toProperties();

        CacheState reloaded = CacheState.load(saved, env);
        assertTrue(reloaded.recoveredFromCrash);
        assertTrue(reloaded.isBlocked(Backend.NNAPI_NPU));
        assertNull(reloaded.selected);
        assertNull(reloaded.pendingProbe);

        CacheState afterOta = CacheState.load(reloaded.toProperties(), "fp2|sha|1.32.0|v1");
        assertFalse(afterOta.recoveredFromCrash);
        assertFalse(afterOta.isBlocked(Backend.NNAPI_NPU));
    }

    @Test
    public void runtimeFailureEscalatesToBlockAfterThreshold() {
        CacheState state = CacheState.fresh("env");
        state.selected = Backend.WEBGPU_GPU;
        assertFalse(state.recordRuntimeFailure(Backend.WEBGPU_GPU, false));
        assertFalse(state.isBlocked(Backend.WEBGPU_GPU));

        assertTrue(state.recordRuntimeFailure(Backend.WEBGPU_GPU, false));
        assertTrue(state.isBlocked(Backend.WEBGPU_GPU));
        assertNull(state.selected);
    }

    @Test
    public void idleBypassRequiresSustainedZeroMix() {
        assertFalse(SingBackendPolicy.shouldSkipIdleInference(-50, 0L, 10_000L));
        assertFalse(SingBackendPolicy.shouldSkipIdleInference(0, 0L, 10_000L));
        assertFalse(SingBackendPolicy.shouldSkipIdleInference(0, 9_500L, 10_000L));
        assertTrue(SingBackendPolicy.shouldSkipIdleInference(0, 8_000L, 10_000L));
    }

    @Test
    public void hardwareCandidatesRequireAndroid10AndAvailableProviders() {
        assertEquals(Collections.emptyList(), SingBackendPolicy.hardwareCandidatesForSdk(28, true, true));
        assertEquals(
                Arrays.asList(Backend.NNAPI_NPU, Backend.WEBGPU_GPU),
                SingBackendPolicy.hardwareCandidatesForSdk(29, true, true));
        assertEquals(
                Collections.singletonList(Backend.WEBGPU_GPU),
                SingBackendPolicy.hardwareCandidatesForSdk(36, false, true));
    }

    @Test
    public void outputPacingDivisorBuildsLookaheadThenConservesOneToOne() {
        assertEquals(4, SingBackendPolicy.outputPacingDivisor(0, 1, false));
        assertEquals(2, SingBackendPolicy.outputPacingDivisor(0, 1, true));
        assertEquals(1, SingBackendPolicy.outputPacingDivisor(1, 1, false));
        assertEquals(1, SingBackendPolicy.outputPacingDivisor(1, 1, true));

        assertEquals(4, SingBackendPolicy.outputPacingDivisor(0, 2, false));
        assertEquals(2, SingBackendPolicy.outputPacingDivisor(0, 2, true));
        assertEquals(2, SingBackendPolicy.outputPacingDivisor(1, 2, false));
        assertEquals(1, SingBackendPolicy.outputPacingDivisor(2, 2, false));
    }

    @Test
    public void pacedPipelineAvoidsPeriodicDeadlineMissesAcrossAtmosAndAacChunkSizes() {
        // 12ch 48 kHz Dolby Atmos (1536-frame MediaCodec chunks, ~1.5s compute per 4.92s window).
        assertSteadyStateZeroDeadlineMisses(48_000, 1536, 1, 1_500L, 0);
        // Stereo 44.1 kHz AAC (1024-frame chunks, ~0.6s compute per 4.92s window).
        assertSteadyStateZeroDeadlineMisses(44_100, 1024, 2, 600L, 0);
        // Slower device (2.4s compute per 4.92s window) with 12ch Atmos still stabilizes with zero misses.
        assertSteadyStateZeroDeadlineMisses(48_000, 1536, 1, 2_400L, 1);
    }

    private static void assertSteadyStateZeroDeadlineMisses(
            int sampleRate,
            int decoderChunkFrames,
            int maxReadyWindows,
            long computeTimeMs,
            int maxAllowedEarlyMisses) {
        int modelRate = 44_100;
        int windowFrames = (int) (((long) MdxSpectrum.FRAMES * sampleRate + modelRate - 1) / modelRate);
        int alignment = modelRate / StereoResampler.gcd(modelRate, sampleRate);
        int alignedStep = (MdxSpectrum.FRAMES - modelRate) - (MdxSpectrum.FRAMES - modelRate) % alignment;
        int stepFrames = (int) ((long) alignedStep * sampleRate / modelRate);
        int overlapFrames = windowFrames - stepFrames;
        int outputChunkFrames = 4096;
        int audioTrackCapFrames = sampleRate / 4; // 250 ms AudioTrack hardware buffer

        int inputFrames = 0;
        int readyQueueCount = 0;
        boolean pendingRunning = false;
        long pendingCompleteAtMs = Long.MAX_VALUE;
        boolean pendingStillQueued = false;
        long pendingSubmittedAtMs = 0L;

        boolean hasReady = false;
        int readyPos = 0;
        int readyEnd = 0;
        boolean hasStartedOutput = false;
        int outputBudgetFrames = 0;
        int leadDrainRemainder = 0;

        int audioTrackBufferedFrames = 0;
        int underruns = 0;
        int steadyStateDeadlineMisses = 0;
        int windowsCompleted = 0;
        long totalFedFrames = 0L;
        long totalOutFrames = 0L;

        // Simulate 65 seconds of real-time playback in 10 ms ticks.
        for (long nowMs = 0L; nowMs < 65_000L; nowMs += 10L) {
            if (hasStartedOutput) {
                int played = (int) ((sampleRate * 10L) / 1000L);
                if (audioTrackBufferedFrames < played) {
                    underruns++;
                    audioTrackBufferedFrames = 0;
                } else {
                    audioTrackBufferedFrames -= played;
                }
            }

            // Up to 40 decoder chunks can be pushed per 10 ms tick if sink accepts them.
            for (int iter = 0; iter < 40; iter++) {
                // Complete finished worker task.
                if (pendingRunning && nowMs >= pendingCompleteAtMs) {
                    pendingRunning = false;
                    if (pendingStillQueued) {
                        readyQueueCount++;
                        pendingStillQueued = false;
                    }
                }
                // Promote if ready == null.
                if (!hasReady) {
                    if (readyQueueCount > 0) {
                        readyQueueCount--;
                        hasReady = true;
                        readyPos = 0;
                        readyEnd = stepFrames;
                    } else if (pendingStillQueued && (hasStartedOutput || nowMs - pendingSubmittedAtMs >= 180L)) {
                        if (hasStartedOutput && windowsCompleted >= 1) {
                            if (windowsCompleted > 1) {
                                steadyStateDeadlineMisses++;
                            } else if (maxAllowedEarlyMisses == 0) {
                                steadyStateDeadlineMisses++;
                            }
                        }
                        hasReady = true;
                        pendingStillQueued = false;
                        readyPos = 0;
                        readyEnd = stepFrames;
                    }
                }
                // Schedule full window if possible.
                if (inputFrames >= windowFrames && !pendingRunning && readyQueueCount < maxReadyWindows) {
                    inputFrames = overlapFrames;
                    pendingRunning = true;
                    pendingStillQueued = true;
                    pendingSubmittedAtMs = nowMs;
                    pendingCompleteAtMs = nowMs + computeTimeMs;
                }

                // Feed one decoder chunk if AudioTrack isn't blocking us.
                int consumed = 0;
                if (inputFrames < windowFrames) {
                    consumed = Math.min(windowFrames - inputFrames, decoderChunkFrames);
                    inputFrames += consumed;
                    totalFedFrames += consumed;
                }
                if (inputFrames >= windowFrames && !pendingRunning && readyQueueCount < maxReadyWindows) {
                    inputFrames = overlapFrames;
                    pendingRunning = true;
                    pendingStillQueued = true;
                    pendingSubmittedAtMs = nowMs;
                    pendingCompleteAtMs = nowMs + computeTimeMs;
                }
                if (!hasReady) {
                    if (readyQueueCount > 0) {
                        readyQueueCount--;
                        hasReady = true;
                        readyPos = 0;
                        readyEnd = stepFrames;
                    } else if (pendingStillQueued && (hasStartedOutput || nowMs - pendingSubmittedAtMs >= 180L)) {
                        if (hasStartedOutput && windowsCompleted >= 1) {
                            if (windowsCompleted > 1 || maxAllowedEarlyMisses == 0) {
                                steadyStateDeadlineMisses++;
                            }
                        }
                        hasReady = true;
                        pendingStillQueued = false;
                        readyPos = 0;
                        readyEnd = stepFrames;
                    }
                }

                if (hasReady && consumed > 0) {
                    int divisor = SingBackendPolicy.outputPacingDivisor(
                            readyQueueCount, maxReadyWindows, pendingRunning);
                    int total = consumed + leadDrainRemainder;
                    int delta = total / divisor;
                    leadDrainRemainder = total % divisor;
                    if (delta == 0 && outputBudgetFrames == 0) delta = 1;
                    outputBudgetFrames = Math.min(stepFrames, outputBudgetFrames + delta);
                }

                // Drain into AudioTrack if there is room.
                if (!hasReady) {
                    outputBudgetFrames = 0;
                    leadDrainRemainder = 0;
                    if (consumed == 0) break;
                    continue;
                }
                if (audioTrackBufferedFrames >= audioTrackCapFrames) {
                    break;
                }
                boolean allowFreeDrain = inputFrames >= windowFrames;
                int maxOut = allowFreeDrain ? outputChunkFrames : Math.min(outputChunkFrames, outputBudgetFrames);
                if (maxOut <= 0) {
                    if (consumed == 0) break;
                    continue;
                }
                int rendered = Math.min(readyEnd - readyPos, maxOut);
                readyPos += rendered;
                audioTrackBufferedFrames += rendered;
                totalOutFrames += rendered;
                hasStartedOutput = true;
                if (allowFreeDrain) {
                    outputBudgetFrames = 0;
                } else {
                    outputBudgetFrames = Math.max(0, outputBudgetFrames - rendered);
                }
                if (readyPos == readyEnd) {
                    hasReady = false;
                    windowsCompleted++;
                }
            }
        }

        assertTrue("Expected at least 10 windows to play, got " + windowsCompleted, windowsCompleted >= 10);
        assertEquals("Unexpected AudioTrack underruns", 0, underruns);
        assertEquals("Unexpected steady-state deadline misses", 0, steadyStateDeadlineMisses);
        assertTrue("Pipeline must maintain lookahead lead", totalFedFrames > totalOutFrames + stepFrames);
    }
}
