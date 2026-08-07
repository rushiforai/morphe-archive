.class public Lcom/momo/momortc/AudioVolumeInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public uid:J

.field public volume:I


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public setUid(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/AudioVolumeInfo;->uid:J

    .line 2
    .line 3
    return-void
.end method

.method public setVolume(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/AudioVolumeInfo;->volume:I

    .line 2
    .line 3
    return-void
.end method
