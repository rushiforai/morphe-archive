package app.voidhack.extension.applemusic.sing;

import java.util.Arrays;

/** Rational windowed-sinc conversion for interleaved stereo PCM. */
final class StereoResampler {
    private static final int BASE_RADIUS = 8;
    private static final double CUTOFF_MARGIN = 0.90;

    private final int frameStep;
    private final int phaseStep;
    private final int phaseCount;
    private final int firstTapOffset;
    private final int tapCount;
    private final float[] coefficients;

    StereoResampler(int sourceRate, int targetRate) {
        if (sourceRate <= 0 || targetRate <= 0) {
            throw new IllegalArgumentException("Sample rates must be positive");
        }
        int divisor = gcd(sourceRate, targetRate);
        int sourceStep = sourceRate / divisor;
        phaseCount = targetRate / divisor;
        frameStep = sourceStep / phaseCount;
        phaseStep = sourceStep % phaseCount;

        if (sourceRate == targetRate) {
            firstTapOffset = 0;
            tapCount = 1;
            coefficients = new float[]{1f};
        } else {
            double bandwidth = Math.min(1.0, targetRate / (double) sourceRate);
            int radius = (int) Math.ceil(BASE_RADIUS / bandwidth);
            firstTapOffset = 1 - radius;
            tapCount = 2 * radius;
            coefficients = createCoefficients(radius, bandwidth * CUTOFF_MARGIN);
        }
    }

    /**
     * Writes the requested number of output frames. Frame zero is aligned in both arrays,
     * and the first and last source frames extend the input at its boundaries.
     */
    void resample(float[] input, float[] output) {
        if ((input.length & 1) != 0 || (output.length & 1) != 0) {
            throw new IllegalArgumentException("Expected interleaved stereo frames");
        }
        if (input.length == 0) {
            Arrays.fill(output, 0f);
            return;
        }
        if (tapCount == 1 && input.length == output.length) {
            System.arraycopy(input, 0, output, 0, input.length);
            return;
        }

        int inputFrames = input.length / 2;
        long sourceFrame = 0;
        int phase = 0;
        for (int sample = 0; sample < output.length; sample += 2) {
            long firstFrame = sourceFrame + firstTapOffset;
            int coefficientOffset = phase * tapCount;
            float left = 0f;
            float right = 0f;
            if (firstFrame >= 0 && firstFrame + tapCount <= inputFrames) {
                int inputSample = 2 * (int) firstFrame;
                for (int tap = 0; tap < tapCount; tap++, inputSample += 2) {
                    float weight = coefficients[coefficientOffset + tap];
                    left += input[inputSample] * weight;
                    right += input[inputSample + 1] * weight;
                }
            } else {
                for (int tap = 0; tap < tapCount; tap++) {
                    int clamped = (int) Math.max(0, Math.min(inputFrames - 1, firstFrame + tap));
                    int inputSample = 2 * clamped;
                    float weight = coefficients[coefficientOffset + tap];
                    left += input[inputSample] * weight;
                    right += input[inputSample + 1] * weight;
                }
            }
            output[sample] = left;
            output[sample + 1] = right;

            sourceFrame += frameStep;
            phase += phaseStep;
            if (phase >= phaseCount) {
                phase -= phaseCount;
                sourceFrame++;
            }
        }
    }

    private float[] createCoefficients(int radius, double cutoff) {
        float[] table = new float[Math.multiplyExact(phaseCount, tapCount)];
        for (int phase = 0; phase < phaseCount; phase++) {
            double fraction = phase / (double) phaseCount;
            int offset = phase * tapCount;
            double gain = 0;
            for (int tap = 0; tap < tapCount; tap++) {
                double position = Math.PI * (firstTapOffset + tap - fraction);
                double angle = position / radius;
                double window = 0.42 + 0.5 * Math.cos(angle) + 0.08 * Math.cos(2 * angle);
                double sinc = position == 0 ? cutoff : Math.sin(cutoff * position) / position;
                double weight = sinc * window;
                table[offset + tap] = (float) weight;
                gain += weight;
            }
            for (int tap = 0; tap < tapCount; tap++) {
                table[offset + tap] = (float) (table[offset + tap] / gain);
            }
        }
        return table;
    }

    static int gcd(int left, int right) {
        while (right != 0) {
            int remainder = left % right;
            left = right;
            right = remainder;
        }
        return left;
    }
}
