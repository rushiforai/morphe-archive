package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import android.media.AudioTrack;
import android.os.SystemClock;

/* loaded from: classes3.dex */
public class k {

    /* renamed from: a, reason: collision with root package name */
    public AudioTrack f29001a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f29002b;

    /* renamed from: c, reason: collision with root package name */
    public int f29003c;

    /* renamed from: d, reason: collision with root package name */
    public long f29004d;

    /* renamed from: e, reason: collision with root package name */
    public long f29005e;

    /* renamed from: f, reason: collision with root package name */
    public long f29006f;

    /* renamed from: g, reason: collision with root package name */
    public long f29007g;

    /* renamed from: h, reason: collision with root package name */
    public long f29008h;

    /* renamed from: i, reason: collision with root package name */
    public long f29009i;

    public void a(AudioTrack audioTrack, boolean z11) {
        this.f29001a = audioTrack;
        this.f29002b = z11;
        this.f29007g = -9223372036854775807L;
        this.f29004d = 0L;
        this.f29005e = 0L;
        this.f29006f = 0L;
        if (audioTrack != null) {
            this.f29003c = audioTrack.getSampleRate();
        }
    }

    public long b() {
        throw new UnsupportedOperationException();
    }

    public long c() {
        throw new UnsupportedOperationException();
    }

    public final void d() throws IllegalStateException {
        if (this.f29007g != -9223372036854775807L) {
            return;
        }
        this.f29001a.pause();
    }

    public boolean e() {
        return false;
    }

    public final void a(long j11) throws IllegalStateException {
        this.f29008h = a();
        this.f29007g = SystemClock.elapsedRealtime() * 1000;
        this.f29009i = j11;
        this.f29001a.stop();
    }

    public final long a() {
        if (this.f29007g != -9223372036854775807L) {
            return Math.min(this.f29009i, this.f29008h + ((((SystemClock.elapsedRealtime() * 1000) - this.f29007g) * this.f29003c) / 1000000));
        }
        int playState = this.f29001a.getPlayState();
        if (playState == 1) {
            return 0L;
        }
        long playbackHeadPosition = this.f29001a.getPlaybackHeadPosition() & 4294967295L;
        if (this.f29002b) {
            if (playState == 2 && playbackHeadPosition == 0) {
                this.f29006f = this.f29004d;
            }
            playbackHeadPosition += this.f29006f;
        }
        if (this.f29004d > playbackHeadPosition) {
            this.f29005e++;
        }
        this.f29004d = playbackHeadPosition;
        return playbackHeadPosition + (this.f29005e << 32);
    }
}
