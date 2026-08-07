.class public Lcom/ss/bytertc/engine/VideoCaptureConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;
    }
.end annotation


# instance fields
.field public capturePreference:Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;

.field public frameRate:I

.field public height:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    sget-object v0, Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;->AUTO:Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;

    iput-object v0, p0, Lcom/ss/bytertc/engine/VideoCaptureConfig;->capturePreference:Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;

    return-void
.end method

.method public constructor <init>(III)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;->AUTO:Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/VideoCaptureConfig;->capturePreference:Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;

    .line 7
    .line 8
    sget-object v0, Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;->MANUAL:Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/engine/VideoCaptureConfig;->capturePreference:Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;

    .line 11
    .line 12
    iput p1, p0, Lcom/ss/bytertc/engine/VideoCaptureConfig;->width:I

    .line 13
    .line 14
    iput p2, p0, Lcom/ss/bytertc/engine/VideoCaptureConfig;->height:I

    .line 15
    .line 16
    iput p3, p0, Lcom/ss/bytertc/engine/VideoCaptureConfig;->frameRate:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "VideoCaptureConfig{capturePreference="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/VideoCaptureConfig;->capturePreference:Lcom/ss/bytertc/engine/VideoCaptureConfig$CapturePreference;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "width="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/VideoCaptureConfig;->width:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", height="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/VideoCaptureConfig;->height:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", frameRate="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget p0, p0, Lcom/ss/bytertc/engine/VideoCaptureConfig;->frameRate:I

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x7d

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method
