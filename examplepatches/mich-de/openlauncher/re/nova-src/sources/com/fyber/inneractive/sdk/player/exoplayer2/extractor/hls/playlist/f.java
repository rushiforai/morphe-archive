package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.LinkedList;
import java.util.Queue;

/* loaded from: classes3.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final BufferedReader f29321a;

    /* renamed from: b, reason: collision with root package name */
    public final Queue f29322b;

    /* renamed from: c, reason: collision with root package name */
    public String f29323c;

    public f(LinkedList linkedList, BufferedReader bufferedReader) {
        this.f29322b = linkedList;
        this.f29321a = bufferedReader;
    }

    public final boolean a() throws IOException {
        String strTrim;
        if (this.f29323c != null) {
            return true;
        }
        if (!this.f29322b.isEmpty()) {
            this.f29323c = (String) this.f29322b.poll();
            return true;
        }
        do {
            String line = this.f29321a.readLine();
            this.f29323c = line;
            if (line == null) {
                return false;
            }
            strTrim = line.trim();
            this.f29323c = strTrim;
        } while (strTrim.isEmpty());
        return true;
    }
}
