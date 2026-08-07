.class public Lcom/ss/bytertc/engine/type/AudioVolumeInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public linearVolume:I

.field public nonlinearVolume:I

.field public uid:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/InternalAudioVolumeInfo;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/ss/bytertc/engine/InternalAudioVolumeInfo;->uid:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/type/AudioVolumeInfo;->uid:Ljava/lang/String;

    .line 7
    .line 8
    iget v0, p1, Lcom/ss/bytertc/engine/InternalAudioVolumeInfo;->nonlinearVolume:I

    .line 9
    .line 10
    iput v0, p0, Lcom/ss/bytertc/engine/type/AudioVolumeInfo;->nonlinearVolume:I

    .line 11
    .line 12
    iget p1, p1, Lcom/ss/bytertc/engine/InternalAudioVolumeInfo;->linearVolume:I

    .line 13
    .line 14
    iput p1, p0, Lcom/ss/bytertc/engine/type/AudioVolumeInfo;->linearVolume:I

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/ss/bytertc/engine/type/AudioVolumeInfo;->uid:Ljava/lang/String;

    .line 19
    iput p2, p0, Lcom/ss/bytertc/engine/type/AudioVolumeInfo;->nonlinearVolume:I

    .line 20
    iput p3, p0, Lcom/ss/bytertc/engine/type/AudioVolumeInfo;->linearVolume:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioVolumeInfo{ user_id= \'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/type/AudioVolumeInfo;->uid:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\' linear_volume= \'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/type/AudioVolumeInfo;->linearVolume:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\' nonlinear_volume= \'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget p0, p0, Lcom/ss/bytertc/engine/type/AudioVolumeInfo;->nonlinearVolume:I

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, "\'}"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method
