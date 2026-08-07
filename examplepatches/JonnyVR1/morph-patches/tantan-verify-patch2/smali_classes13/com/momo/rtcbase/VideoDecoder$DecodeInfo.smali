.class public Lcom/momo/rtcbase/VideoDecoder$DecodeInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/VideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DecodeInfo"
.end annotation


# instance fields
.field public final isMissingFrames:Z

.field public final renderTimeMs:J


# direct methods
.method public constructor <init>(ZJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/momo/rtcbase/VideoDecoder$DecodeInfo;->isMissingFrames:Z

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/momo/rtcbase/VideoDecoder$DecodeInfo;->renderTimeMs:J

    .line 7
    .line 8
    return-void
.end method
