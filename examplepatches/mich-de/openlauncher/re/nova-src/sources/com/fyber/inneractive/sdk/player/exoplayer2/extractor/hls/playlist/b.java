package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist;

import com.fyber.inneractive.sdk.player.exoplayer2.o;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class b extends e {

    /* renamed from: b, reason: collision with root package name */
    public final List f29294b;

    /* renamed from: c, reason: collision with root package name */
    public final List f29295c;

    /* renamed from: d, reason: collision with root package name */
    public final List f29296d;

    /* renamed from: e, reason: collision with root package name */
    public final o f29297e;

    /* renamed from: f, reason: collision with root package name */
    public final List f29298f;

    public b(String str, List list, List list2, List list3, o oVar, List list4) {
        super(str);
        this.f29294b = Collections.unmodifiableList(list);
        this.f29295c = Collections.unmodifiableList(list2);
        this.f29296d = Collections.unmodifiableList(list3);
        this.f29297e = oVar;
        this.f29298f = list4 != null ? Collections.unmodifiableList(list4) : null;
    }
}
