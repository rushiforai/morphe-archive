package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;

/* loaded from: classes3.dex */
public abstract class c {
    public static final int A0;
    public static final int B0;
    public static final int C0;
    public static final int D0;
    public static final int E0;
    public static final int F0;
    public static final int G0;
    public static final int H0;
    public static final int I0;
    public static final int J0;
    public static final int K0;
    public static final int L0;
    public static final int M0;
    public static final int N0;
    public static final int O0;
    public static final int P0;
    public static final int Q0;

    /* renamed from: l0, reason: collision with root package name */
    public static final int f29484l0;

    /* renamed from: m0, reason: collision with root package name */
    public static final int f29486m0;

    /* renamed from: n0, reason: collision with root package name */
    public static final int f29487n0;

    /* renamed from: o0, reason: collision with root package name */
    public static final int f29488o0;

    /* renamed from: p0, reason: collision with root package name */
    public static final int f29490p0;

    /* renamed from: q0, reason: collision with root package name */
    public static final int f29492q0;

    /* renamed from: r0, reason: collision with root package name */
    public static final int f29494r0;

    /* renamed from: s0, reason: collision with root package name */
    public static final int f29496s0;

    /* renamed from: t0, reason: collision with root package name */
    public static final int f29498t0;

    /* renamed from: u0, reason: collision with root package name */
    public static final int f29500u0;

    /* renamed from: v0, reason: collision with root package name */
    public static final int f29502v0;

    /* renamed from: w0, reason: collision with root package name */
    public static final int f29504w0;

    /* renamed from: x0, reason: collision with root package name */
    public static final int f29506x0;

    /* renamed from: y0, reason: collision with root package name */
    public static final int f29508y0;

    /* renamed from: z0, reason: collision with root package name */
    public static final int f29510z0;

    /* renamed from: a, reason: collision with root package name */
    public final int f29511a;

    /* renamed from: b, reason: collision with root package name */
    public static final int f29463b = z.a("ftyp");

    /* renamed from: c, reason: collision with root package name */
    public static final int f29465c = z.a("avc1");

    /* renamed from: d, reason: collision with root package name */
    public static final int f29467d = z.a("avc3");

    /* renamed from: e, reason: collision with root package name */
    public static final int f29469e = z.a("hvc1");

    /* renamed from: f, reason: collision with root package name */
    public static final int f29471f = z.a("hev1");

    /* renamed from: g, reason: collision with root package name */
    public static final int f29473g = z.a("s263");

    /* renamed from: h, reason: collision with root package name */
    public static final int f29475h = z.a("d263");

    /* renamed from: i, reason: collision with root package name */
    public static final int f29477i = z.a("mdat");

    /* renamed from: j, reason: collision with root package name */
    public static final int f29479j = z.a("mp4a");

    /* renamed from: k, reason: collision with root package name */
    public static final int f29481k = z.a(".mp3");

    /* renamed from: l, reason: collision with root package name */
    public static final int f29483l = z.a("wave");

    /* renamed from: m, reason: collision with root package name */
    public static final int f29485m = z.a("lpcm");
    public static final int n = z.a("sowt");
    public static final int o = z.a("ac-3");

    /* renamed from: p, reason: collision with root package name */
    public static final int f29489p = z.a("dac3");

    /* renamed from: q, reason: collision with root package name */
    public static final int f29491q = z.a("ec-3");

    /* renamed from: r, reason: collision with root package name */
    public static final int f29493r = z.a("dec3");

    /* renamed from: s, reason: collision with root package name */
    public static final int f29495s = z.a("dtsc");

    /* renamed from: t, reason: collision with root package name */
    public static final int f29497t = z.a("dtsh");

    /* renamed from: u, reason: collision with root package name */
    public static final int f29499u = z.a("dtsl");

    /* renamed from: v, reason: collision with root package name */
    public static final int f29501v = z.a("dtse");

    /* renamed from: w, reason: collision with root package name */
    public static final int f29503w = z.a("ddts");

    /* renamed from: x, reason: collision with root package name */
    public static final int f29505x = z.a("tfdt");

    /* renamed from: y, reason: collision with root package name */
    public static final int f29507y = z.a("tfhd");

    /* renamed from: z, reason: collision with root package name */
    public static final int f29509z = z.a("trex");
    public static final int A = z.a("trun");
    public static final int B = z.a("sidx");
    public static final int C = z.a("moov");
    public static final int D = z.a("mvhd");
    public static final int E = z.a("trak");
    public static final int F = z.a("mdia");
    public static final int G = z.a("minf");
    public static final int H = z.a("stbl");
    public static final int I = z.a("avcC");
    public static final int J = z.a("hvcC");
    public static final int K = z.a("esds");
    public static final int L = z.a("moof");
    public static final int M = z.a("traf");
    public static final int N = z.a("mvex");
    public static final int O = z.a("mehd");
    public static final int P = z.a("tkhd");
    public static final int Q = z.a("edts");
    public static final int R = z.a("elst");
    public static final int S = z.a("mdhd");
    public static final int T = z.a("hdlr");
    public static final int U = z.a("stsd");
    public static final int V = z.a("pssh");
    public static final int W = z.a("sinf");
    public static final int X = z.a("schm");
    public static final int Y = z.a("schi");
    public static final int Z = z.a("tenc");

    /* renamed from: a0, reason: collision with root package name */
    public static final int f29462a0 = z.a("encv");

    /* renamed from: b0, reason: collision with root package name */
    public static final int f29464b0 = z.a("enca");

    /* renamed from: c0, reason: collision with root package name */
    public static final int f29466c0 = z.a("frma");

    /* renamed from: d0, reason: collision with root package name */
    public static final int f29468d0 = z.a("saiz");

    /* renamed from: e0, reason: collision with root package name */
    public static final int f29470e0 = z.a("saio");

    /* renamed from: f0, reason: collision with root package name */
    public static final int f29472f0 = z.a("sbgp");

    /* renamed from: g0, reason: collision with root package name */
    public static final int f29474g0 = z.a("sgpd");

    /* renamed from: h0, reason: collision with root package name */
    public static final int f29476h0 = z.a("uuid");

    /* renamed from: i0, reason: collision with root package name */
    public static final int f29478i0 = z.a("senc");

    /* renamed from: j0, reason: collision with root package name */
    public static final int f29480j0 = z.a("pasp");

    /* renamed from: k0, reason: collision with root package name */
    public static final int f29482k0 = z.a("TTML");

    static {
        z.a("vmhd");
        f29484l0 = z.a("mp4v");
        f29486m0 = z.a("stts");
        f29487n0 = z.a("stss");
        f29488o0 = z.a("ctts");
        f29490p0 = z.a("stsc");
        f29492q0 = z.a("stsz");
        f29494r0 = z.a("stz2");
        f29496s0 = z.a("stco");
        f29498t0 = z.a("co64");
        f29500u0 = z.a("tx3g");
        f29502v0 = z.a("wvtt");
        f29504w0 = z.a("stpp");
        f29506x0 = z.a("c608");
        f29508y0 = z.a("samr");
        f29510z0 = z.a("sawb");
        A0 = z.a("udta");
        B0 = z.a("meta");
        C0 = z.a("ilst");
        D0 = z.a("mean");
        E0 = z.a(PendingUpgradeStore.KEY_NAME);
        F0 = z.a("data");
        G0 = z.a("emsg");
        H0 = z.a("st3d");
        I0 = z.a("sv3d");
        J0 = z.a("proj");
        K0 = z.a("vp08");
        L0 = z.a("vp09");
        M0 = z.a("vpcC");
        N0 = z.a("av01");
        O0 = z.a("av1C");
        P0 = z.a("camm");
        Q0 = z.a("alac");
    }

    public c(int i5) {
        this.f29511a = i5;
    }

    public static String a(int i5) {
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + ((char) ((i5 >> 24) & 255)) + ((char) ((i5 >> 16) & 255)) + ((char) ((i5 >> 8) & 255)) + ((char) (i5 & 255));
    }

    public String toString() {
        return a(this.f29511a);
    }
}
