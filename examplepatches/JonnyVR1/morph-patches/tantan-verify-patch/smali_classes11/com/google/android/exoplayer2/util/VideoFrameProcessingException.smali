.class public final Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;
.super Ljava/lang/Exception;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final presentationTimeUs:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;-><init>(Ljava/lang/String;J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;J)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 11
    iput-wide p2, p0, Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;->presentationTimeUs:J

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 12
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;J)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;J)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 14
    iput-wide p3, p0, Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;->presentationTimeUs:J

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 2

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 15
    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;-><init>(Ljava/lang/Throwable;J)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;J)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 17
    iput-wide p2, p0, Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;->presentationTimeUs:J

    return-void
.end method

.method public static from(Ljava/lang/Exception;)Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;
    .locals 2

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 14
    invoke-static {p0, v0, v1}, Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;->from(Ljava/lang/Exception;J)Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;

    move-result-object p0

    return-object p0
.end method

.method public static from(Ljava/lang/Exception;J)Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v0, Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/exoplayer2/util/VideoFrameProcessingException;-><init>(Ljava/lang/Throwable;J)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method
