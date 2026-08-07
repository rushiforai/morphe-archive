.class public Lcom/immomo/moment/mediautils/AudioMixerNative;
.super Ll/n7y;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/n7y;-><init>()V

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
    invoke-static/range {p0 .. p5}, Lcom/immomo/moment/mediautils/AudioMixerNative;->nativeMixPcmData([BF[BFI[B)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private static native nativeMixPcmData([BF[BFI[B)I
.end method

.method private static native nativeSetVolume([BIF[B)I
.end method

.method public static setVolume_Native([BIF[B)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/immomo/moment/mediautils/AudioMixerNative;->nativeSetVolume([BIF[B)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
