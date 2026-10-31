package com.facebook.ads.redexgen.X;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;

/* renamed from: com.facebook.ads.redexgen.X.aq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1465aq {
    public static String[] A00 = {"ltmF64ZweBQJPeOdif9BPyh7xrdDqMGm", "1hD4GCEv16m9ULjLseNq8NpSJScOpV4z", "cjybuzvgbX7cmH3axbx3qBHLU46", "3xOl7CJaqVAPHP1avR87ELk8GAlY0bDn", "t7u0RHWzousfLG5LtFWytgwP1DKhggaB", "Lz4xSMhIvLrTjJnzClIMi9mdhGC", "f5Kl57kllqDhIhPF", "i0IJI0KG8A89caPvqz1zLZN3nnLrP5V4"};

    public static C1464ap A00(int i5, long[] jArr, int[] iArr, long j11) {
        int chunkSamplesRemaining = UserMetadata.MAX_INTERNAL_KEY_SIZE / i5;
        int iA05 = 0;
        for (int i11 : iArr) {
            iA05 += N1.A05(i11, chunkSamplesRemaining);
        }
        long[] jArr2 = new long[iA05];
        int[] iArr2 = new int[iA05];
        int originalSampleIndex = 0;
        long[] timestamps = new long[iA05];
        int[] flags = new int[iA05];
        int i12 = 0;
        int bufferSampleCount = 0;
        int i13 = 0;
        while (true) {
            int newSampleIndex = iArr.length;
            String[] strArr = A00;
            String str = strArr[0];
            String str2 = strArr[3];
            int iCharAt = str.charAt(21);
            int maxSampleCount = str2.charAt(21);
            if (iCharAt == maxSampleCount) {
                throw new RuntimeException();
            }
            String[] strArr2 = A00;
            strArr2[5] = "wNkrlldVaUTeajb4lzLgF8WCWCG";
            strArr2[2] = "yVUP0nv1OIaEI6s3laAD0V5uevr";
            if (i13 < newSampleIndex) {
                int rechunkedSampleCount = iArr[i13];
                long j12 = jArr[i13];
                while (rechunkedSampleCount > 0) {
                    int iMin = Math.min(chunkSamplesRemaining, rechunkedSampleCount);
                    jArr2[bufferSampleCount] = j12;
                    iArr2[bufferSampleCount] = i5 * iMin;
                    originalSampleIndex = Math.max(originalSampleIndex, iArr2[bufferSampleCount]);
                    timestamps[bufferSampleCount] = i12 * j11;
                    flags[bufferSampleCount] = 1;
                    j12 += iArr2[bufferSampleCount];
                    i12 += iMin;
                    rechunkedSampleCount -= iMin;
                    bufferSampleCount++;
                }
                i13++;
            } else {
                return new C1464ap(jArr2, iArr2, originalSampleIndex, timestamps, flags, j11 * i12);
            }
        }
    }
}
