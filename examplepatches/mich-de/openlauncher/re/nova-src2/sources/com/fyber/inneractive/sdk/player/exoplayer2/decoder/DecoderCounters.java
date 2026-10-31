package com.fyber.inneractive.sdk.player.exoplayer2.decoder;

/* loaded from: classes3.dex */
public final class DecoderCounters {
    public int decoderInitCount;
    public int decoderReleaseCount;
    public int droppedOutputBufferCount;
    public int inputBufferCount;
    public int maxConsecutiveDroppedOutputBufferCount;
    public int renderedOutputBufferCount;
    public int skippedOutputBufferCount;

    public synchronized void ensureUpdated() {
    }

    public void merge(DecoderCounters decoderCounters) {
        this.decoderInitCount += decoderCounters.decoderInitCount;
        this.decoderReleaseCount += decoderCounters.decoderReleaseCount;
        this.inputBufferCount += decoderCounters.inputBufferCount;
        this.renderedOutputBufferCount += decoderCounters.renderedOutputBufferCount;
        this.skippedOutputBufferCount += decoderCounters.skippedOutputBufferCount;
        this.droppedOutputBufferCount += decoderCounters.droppedOutputBufferCount;
        this.maxConsecutiveDroppedOutputBufferCount = Math.max(this.maxConsecutiveDroppedOutputBufferCount, decoderCounters.maxConsecutiveDroppedOutputBufferCount);
    }
}
