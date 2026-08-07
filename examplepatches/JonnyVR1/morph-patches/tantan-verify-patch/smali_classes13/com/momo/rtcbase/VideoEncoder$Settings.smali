.class public Lcom/momo/rtcbase/VideoEncoder$Settings;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/VideoEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Settings"
.end annotation


# instance fields
.field public final automaticResizeOn:Z

.field public final height:I

.field public final maxFramerate:I

.field public final numberOfCores:I

.field public final numberOfSimulcastStreams:I

.field public final startBitrate:I

.field public final useVbr:Z

.field public final width:I


# direct methods
.method public constructor <init>(IIIIIIZZ)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Settings"
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/momo/rtcbase/VideoEncoder$Settings;->numberOfCores:I

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/rtcbase/VideoEncoder$Settings;->width:I

    .line 7
    .line 8
    iput p3, p0, Lcom/momo/rtcbase/VideoEncoder$Settings;->height:I

    .line 9
    .line 10
    iput p4, p0, Lcom/momo/rtcbase/VideoEncoder$Settings;->startBitrate:I

    .line 11
    .line 12
    iput p5, p0, Lcom/momo/rtcbase/VideoEncoder$Settings;->maxFramerate:I

    .line 13
    .line 14
    iput p6, p0, Lcom/momo/rtcbase/VideoEncoder$Settings;->numberOfSimulcastStreams:I

    .line 15
    .line 16
    iput-boolean p7, p0, Lcom/momo/rtcbase/VideoEncoder$Settings;->automaticResizeOn:Z

    .line 17
    .line 18
    iput-boolean p8, p0, Lcom/momo/rtcbase/VideoEncoder$Settings;->useVbr:Z

    .line 19
    .line 20
    return-void
.end method
