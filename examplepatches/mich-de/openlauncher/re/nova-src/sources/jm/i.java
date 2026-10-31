package jm;

import com.google.firebase.encoders.EncodingException;

/* loaded from: classes3.dex */
public final class i implements gm.g {

    /* renamed from: a, reason: collision with root package name */
    public boolean f69610a = false;

    /* renamed from: b, reason: collision with root package name */
    public boolean f69611b = false;

    /* renamed from: c, reason: collision with root package name */
    public gm.c f69612c;

    /* renamed from: d, reason: collision with root package name */
    public final g f69613d;

    public i(g gVar) {
        this.f69613d = gVar;
    }

    @Override // gm.g
    public final gm.g a(String str) {
        if (this.f69610a) {
            throw new EncodingException("Cannot encode a second value in the ValueEncoderContext");
        }
        this.f69610a = true;
        this.f69613d.h(this.f69612c, str, this.f69611b);
        return this;
    }

    @Override // gm.g
    public final gm.g g(boolean z11) {
        if (this.f69610a) {
            throw new EncodingException("Cannot encode a second value in the ValueEncoderContext");
        }
        this.f69610a = true;
        this.f69613d.g(this.f69612c, z11 ? 1 : 0, this.f69611b);
        return this;
    }
}
