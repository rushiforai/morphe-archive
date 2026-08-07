.class public Lcom/ss/bytertc/engine/data/RecordingProgress;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public duration:J

.field public fileSize:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/ss/bytertc/engine/data/RecordingProgress;->duration:J

    .line 5
    .line 6
    iput-wide p3, p0, Lcom/ss/bytertc/engine/data/RecordingProgress;->fileSize:J

    .line 7
    .line 8
    return-void
.end method

.method public static create(JJ)Lcom/ss/bytertc/engine/data/RecordingProgress;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/RecordingProgress;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/ss/bytertc/engine/data/RecordingProgress;-><init>(JJ)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
