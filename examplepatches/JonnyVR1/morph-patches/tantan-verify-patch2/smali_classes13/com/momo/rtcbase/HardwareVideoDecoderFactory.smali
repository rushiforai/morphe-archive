.class public Lcom/momo/rtcbase/HardwareVideoDecoderFactory;
.super Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;
.source "SourceFile"


# static fields
.field private static final defaultAllowedPredicate:Lcom/momo/rtcbase/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/rtcbase/Predicate<",
            "Landroid/media/MediaCodecInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/rtcbase/HardwareVideoDecoderFactory$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/rtcbase/HardwareVideoDecoderFactory$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/momo/rtcbase/HardwareVideoDecoderFactory;->defaultAllowedPredicate:Lcom/momo/rtcbase/Predicate;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 17
    invoke-direct {p0, v0}, Lcom/momo/rtcbase/HardwareVideoDecoderFactory;-><init>(Lcom/momo/rtcbase/EglBase$Context;)V

    return-void
.end method

.method public constructor <init>(Lcom/momo/rtcbase/EglBase$Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, v0}, Lcom/momo/rtcbase/HardwareVideoDecoderFactory;-><init>(Lcom/momo/rtcbase/EglBase$Context;Lcom/momo/rtcbase/Predicate;)V

    return-void
.end method

.method public constructor <init>(Lcom/momo/rtcbase/EglBase$Context;Lcom/momo/rtcbase/Predicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/momo/rtcbase/EglBase$Context;",
            "Lcom/momo/rtcbase/Predicate<",
            "Landroid/media/MediaCodecInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    sget-object p2, Lcom/momo/rtcbase/HardwareVideoDecoderFactory;->defaultAllowedPredicate:Lcom/momo/rtcbase/Predicate;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v0, Lcom/momo/rtcbase/HardwareVideoDecoderFactory;->defaultAllowedPredicate:Lcom/momo/rtcbase/Predicate;

    .line 7
    .line 8
    invoke-interface {p2, v0}, Lcom/momo/rtcbase/Predicate;->and(Lcom/momo/rtcbase/Predicate;)Lcom/momo/rtcbase/Predicate;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;-><init>(Lcom/momo/rtcbase/EglBase$Context;Lcom/momo/rtcbase/Predicate;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public bridge synthetic createDecoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoDecoder;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;->createDecoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoDecoder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic getSupportedCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/momo/rtcbase/MediaCodecVideoDecoderFactory;->getSupportedCodecs()[Lcom/momo/rtcbase/VideoCodecInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
