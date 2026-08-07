.class public Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public hasMediaPlayer:Z

.field public hasMic:Z

.field public hasScreenAudio:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasMic:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasScreenAudio:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasMediaPlayer:Z

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(ZZZ)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasMic:Z

    .line 14
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasScreenAudio:Z

    .line 15
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasMediaPlayer:Z

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioContentTypeConfig{hasMic=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasMic:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', hasScreenAudio=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasScreenAudio:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', hasMediaPlayer=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/data/AudioContentTypeConfig;->hasMediaPlayer:Z

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

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
