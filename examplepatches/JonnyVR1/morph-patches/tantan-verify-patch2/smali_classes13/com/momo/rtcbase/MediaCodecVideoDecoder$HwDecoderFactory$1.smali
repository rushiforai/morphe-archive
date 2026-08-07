.class Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory$1;
.super Lcom/momo/rtcbase/WrappedNativeVideoDecoder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;->createDecoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;

.field final synthetic val$codec:Lcom/momo/rtcbase/VideoCodecInfo;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;Lcom/momo/rtcbase/VideoCodecInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory$1;->this$0:Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory$1;->val$codec:Lcom/momo/rtcbase/VideoCodecInfo;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/momo/rtcbase/WrappedNativeVideoDecoder;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public createNativeVideoDecoder()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$HwDecoderFactory$1;->val$codec:Lcom/momo/rtcbase/VideoCodecInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/rtcbase/VideoCodecInfo;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->useSurface()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p0, v0}, Lcom/momo/rtcbase/MediaCodecVideoDecoder;->access$000(Ljava/lang/String;Z)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method
