.class Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/video/EglRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoFrameInternal"
.end annotation


# instance fields
.field public frame:Lio/agora/base/VideoFrame;

.field public frameDrawStartTimeNs:J


# direct methods
.method public constructor <init>(Lio/agora/base/VideoFrame;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frame:Lio/agora/base/VideoFrame;

    .line 5
    .line 6
    iput-wide p2, p0, Lio/agora/base/internal/video/EglRenderer$VideoFrameInternal;->frameDrawStartTimeNs:J

    .line 7
    .line 8
    return-void
.end method
