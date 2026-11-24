package app.voidhack.extension.applemusic.sing;

import java.util.Arrays;

/**
 * Stereo STFT and inverse STFT for UVR-MDX-NET 3. Uses a periodic Hann window,
 * a 6144-point transform and a 1024-sample hop.
 * Model compatibility reference: https://github.com/22cms/sing-for-android/tree/v1.2
 * Instances reuse scratch space and belong to a single inference worker.
 */
final class MdxSpectrum {
    private static final int HOP = 1024;

    static final int BINS = 2048;
    static final int TIME_STEPS = 256;
    static final int TENSOR_SIZE = 4 * BINS * TIME_STEPS;
    static final int FRAMES = (TIME_STEPS - 1) * HOP;

    private static final int CHANNELS = 2;
    private static final int RADIX_TWO_SIZE = 2048;
    private static final int FFT_SIZE = 3 * RADIX_TWO_SIZE;
    private static final int HALF_FFT = FFT_SIZE / 2;
    private static final int PLANE_SIZE = BINS * TIME_STEPS;
    private static final int LOW_BINS = 3;
    private static final float COMPENSATION = 1.035f;
    private static final float SIN_120 = 0.8660254f;

    private static final float[] WINDOW = new float[FFT_SIZE];
    private static final float[] NORMALIZATION = new float[FRAMES];
    private static final float[] COS = new float[FFT_SIZE];
    private static final float[] NEGATIVE_SIN = new float[FFT_SIZE];
    private static final int[] INPUT_INDEX = new int[FFT_SIZE];
    private static final int[] TRANSFORM_SLOT = new int[FFT_SIZE];
    private static final float[] ORDERED_WINDOW = new float[FFT_SIZE];

    static {
        for (int index = 0; index < FFT_SIZE; index++) {
            double angle = 2 * Math.PI * index / FFT_SIZE;
            COS[index] = (float) Math.cos(angle);
            NEGATIVE_SIN[index] = -(float) Math.sin(angle);
            float windowAngle = (float) (2 * Math.PI) * index / FFT_SIZE;
            WINDOW[index] = 0.5f * (1.0f - (float) Math.cos(windowAngle));
        }
        int bitCount = Integer.numberOfTrailingZeros(RADIX_TWO_SIZE);
        for (int residue = 0; residue < 3; residue++) {
            int start = residue * RADIX_TWO_SIZE;
            for (int index = 0; index < RADIX_TWO_SIZE; index++) {
                int reversed = Integer.reverse(index) >>> (Integer.SIZE - bitCount);
                int input = 3 * reversed + residue;
                int slot = start + index;
                INPUT_INDEX[slot] = input;
                TRANSFORM_SLOT[input] = slot;
                ORDERED_WINDOW[slot] = WINDOW[input];
            }
        }

        float[] windowPower = new float[FRAMES + FFT_SIZE];
        for (int time = 0; time < TIME_STEPS; time++) {
            int offset = time * HOP;
            for (int index = 0; index < FFT_SIZE; index++) {
                windowPower[offset + index] += WINDOW[index] * WINDOW[index];
            }
        }
        for (int frame = 0; frame < FRAMES; frame++) {
            // Undo both overlap-add windowing and the unnormalized inverse FFT.
            NORMALIZATION[frame] = COMPENSATION / (FFT_SIZE * windowPower[frame + HALF_FFT]);
        }
    }

    private final float[] real = new float[FFT_SIZE];
    private final float[] imaginary = new float[FFT_SIZE];

    void forward(float[] interleaved, float[] tensor) {
        requireWindowAndTensor(interleaved, tensor);
        for (int plane = 0; plane < 4; plane++) {
            int start = plane * PLANE_SIZE;
            Arrays.fill(tensor, start, start + LOW_BINS * TIME_STEPS, 0f);
        }
        for (int time = 0; time < TIME_STEPS; time++) {
            loadWindowedPcm(interleaved, time * HOP - HALF_FFT);
            transform();

            // Two real channels share one complex FFT. Recover each channel using X[k] and X[-k].
            for (int bin = LOW_BINS; bin < BINS; bin++) {
                int index = bin * TIME_STEPS + time;
                int mirror = FFT_SIZE - bin;
                tensor[index] = 0.5f * (real[bin] + real[mirror]);
                tensor[PLANE_SIZE + index] = 0.5f * (imaginary[bin] - imaginary[mirror]);
                tensor[2 * PLANE_SIZE + index] = 0.5f * (imaginary[bin] + imaginary[mirror]);
                tensor[3 * PLANE_SIZE + index] = 0.5f * (real[mirror] - real[bin]);
            }
        }
    }

    void inverse(float[] tensor, float[] interleaved) {
        requireWindowAndTensor(interleaved, tensor);
        Arrays.fill(interleaved, 0f);
        for (int time = 0; time < TIME_STEPS; time++) {
            loadInverseSpectrum(tensor, time);
            transform();

            int offset = time * HOP - HALF_FFT;
            int start = Math.max(0, -offset);
            int end = Math.min(FFT_SIZE, FRAMES - offset);
            for (int index = start; index < end; index++) {
                int sample = CHANNELS * (offset + index);
                interleaved[sample] += real[index] * WINDOW[index];
                interleaved[sample + 1] -= imaginary[index] * WINDOW[index];
            }
        }
        for (int frame = 0; frame < FRAMES; frame++) {
            interleaved[CHANNELS * frame] *= NORMALIZATION[frame];
            interleaved[CHANNELS * frame + 1] *= NORMALIZATION[frame];
        }
    }

    private void loadWindowedPcm(float[] interleaved, int offset) {
        // Most windows are fully inside the PCM. Only the edges need reflection.
        if (offset >= 0 && offset + FFT_SIZE <= FRAMES) {
            int start = CHANNELS * offset;
            for (int slot = 0; slot < FFT_SIZE; slot++) {
                int sample = start + CHANNELS * INPUT_INDEX[slot];
                float coefficient = ORDERED_WINDOW[slot];
                real[slot] = interleaved[sample] * coefficient;
                imaginary[slot] = interleaved[sample + 1] * coefficient;
            }
            return;
        }

        for (int slot = 0; slot < FFT_SIZE; slot++) {
            int sample = CHANNELS * reflect(offset + INPUT_INDEX[slot]);
            float coefficient = ORDERED_WINDOW[slot];
            real[slot] = interleaved[sample] * coefficient;
            imaginary[slot] = interleaved[sample + 1] * coefficient;
        }
    }

    private void loadInverseSpectrum(float[] tensor, int time) {
        Arrays.fill(real, 0f);
        Arrays.fill(imaginary, 0f);
        real[0] = tensor[time];
        imaginary[0] = -tensor[2 * PLANE_SIZE + time];
        // Write both halves of the conjugated stereo spectrum from each model bin.
        for (int bin = 1; bin < BINS; bin++) {
            int feature = bin * TIME_STEPS + time;
            float leftReal = tensor[feature];
            float leftImaginary = tensor[PLANE_SIZE + feature];
            float rightReal = tensor[2 * PLANE_SIZE + feature];
            float rightImaginary = tensor[3 * PLANE_SIZE + feature];
            int positive = TRANSFORM_SLOT[bin];
            int negative = TRANSFORM_SLOT[FFT_SIZE - bin];
            real[positive] = leftReal - rightImaginary;
            imaginary[positive] = -(leftImaginary + rightReal);
            real[negative] = leftReal + rightImaginary;
            imaginary[negative] = -(-leftImaginary + rightReal);
        }
    }

    private void transform() {
        // The input is arranged as three bit-reversed sequences, one for each index modulo 3.
        for (int width = 2; width <= RADIX_TWO_SIZE; width *= 2) {
            int half = width / 2;
            int twiddleStep = FFT_SIZE / width;
            for (int block = 0; block < FFT_SIZE; block += width) {
                for (int step = 0, twiddle = 0; step < half; step++, twiddle += twiddleStep) {
                    int low = block + step;
                    int high = low + half;
                    float twiddleReal = COS[twiddle];
                    float twiddleImaginary = NEGATIVE_SIN[twiddle];
                    float highReal = real[high] * twiddleReal - imaginary[high] * twiddleImaginary;
                    float highImaginary = real[high] * twiddleImaginary + imaginary[high] * twiddleReal;
                    real[high] = real[low] - highReal;
                    imaginary[high] = imaginary[low] - highImaginary;
                    real[low] += highReal;
                    imaginary[low] += highImaginary;
                }
            }
        }

        // Combine the three 2048-point FFTs into bins k, k + 2048, and k + 4096 of the 6144-point FFT.
        for (int first = 0; first < RADIX_TWO_SIZE; first++) {
            int second = first + RADIX_TWO_SIZE;
            int third = second + RADIX_TWO_SIZE;
            int twice = first * 2;
            float secondReal = real[second] * COS[first] - imaginary[second] * NEGATIVE_SIN[first];
            float secondImaginary = real[second] * NEGATIVE_SIN[first] + imaginary[second] * COS[first];
            float thirdReal = real[third] * COS[twice] - imaginary[third] * NEGATIVE_SIN[twice];
            float thirdImaginary = real[third] * NEGATIVE_SIN[twice] + imaginary[third] * COS[twice];

            float sumReal = secondReal + thirdReal;
            float sumImaginary = secondImaginary + thirdImaginary;
            float baseReal = real[first] - 0.5f * sumReal;
            float baseImaginary = imaginary[first] - 0.5f * sumImaginary;
            float diffReal = SIN_120 * (secondReal - thirdReal);
            float diffImaginary = SIN_120 * (secondImaginary - thirdImaginary);

            real[first] += sumReal;
            imaginary[first] += sumImaginary;
            real[second] = baseReal + diffImaginary;
            imaginary[second] = baseImaginary - diffReal;
            real[third] = baseReal - diffImaginary;
            imaginary[third] = baseImaginary + diffReal;
        }
    }

    private static int reflect(int frame) {
        if (frame < 0) return -frame;
        if (frame >= FRAMES) return 2 * FRAMES - 2 - frame;
        return frame;
    }

    private static void requireWindowAndTensor(float[] interleaved, float[] tensor) {
        if (interleaved.length != CHANNELS * FRAMES || tensor.length != TENSOR_SIZE) {
            throw new IllegalArgumentException("Expected one stereo model window and a full MDX tensor");
        }
    }
}
