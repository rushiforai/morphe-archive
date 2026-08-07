.class public Lcom/immomo/mediabase/AudioMixerNative;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "mediabase"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static mixPcmData_Native([BF[BFILjava/nio/ByteBuffer;)I
    .locals 0

    .line 1
    invoke-virtual {p5}, Ljava/nio/ByteBuffer;->array()[B

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    invoke-static/range {p0 .. p5}, Lcom/immomo/mediabase/AudioMixerNative;->nativeMixPcmData([BF[BFI[B)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static monoToStereo([BI[B)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/immomo/mediabase/AudioMixerNative;->nativeMonoToStereo([BI[B)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static native nativeMixPcmData([BF[BFI[B)I
.end method

.method private static native nativeMonoToStereo([BI[B)I
.end method

.method private static native nativeSetVolume([BIF[B)I
.end method

.method private static native nativeStereoToMono([BI[B)I
.end method

.method public static setVolume_Native([BIF[B)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/immomo/mediabase/AudioMixerNative;->nativeSetVolume([BIF[B)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static stereoToMono([BI[B)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/immomo/mediabase/AudioMixerNative;->nativeStereoToMono([BI[B)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
