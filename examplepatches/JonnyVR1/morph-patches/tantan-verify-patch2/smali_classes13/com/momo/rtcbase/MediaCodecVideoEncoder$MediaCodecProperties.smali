.class Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/MediaCodecVideoEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaCodecProperties"
.end annotation


# instance fields
.field public final bitrateAdjustmentType:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

.field public final codecPrefix:Ljava/lang/String;

.field public final minSdk:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;->codecPrefix:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;->minSdk:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$MediaCodecProperties;->bitrateAdjustmentType:Lcom/momo/rtcbase/MediaCodecVideoEncoder$BitrateAdjustmentType;

    .line 9
    .line 10
    return-void
.end method
