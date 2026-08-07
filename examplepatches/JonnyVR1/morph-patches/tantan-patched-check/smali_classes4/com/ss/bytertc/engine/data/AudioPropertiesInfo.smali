.class public Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final SPECTRUM_SIZE:I = 0x101


# instance fields
.field public linearVolume:I

.field public nonlinearVolume:I

.field public spectrum:[F

.field public vad:I

.field public voicePitch:D


# direct methods
.method public constructor <init>(II[FI)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x101

    .line 5
    .line 6
    new-array v1, v0, [F

    .line 7
    .line 8
    iput-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->spectrum:[F

    .line 9
    .line 10
    const-wide/16 v2, 0x0

    .line 11
    .line 12
    iput-wide v2, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->voicePitch:D

    .line 13
    .line 14
    iput p1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->linearVolume:I

    .line 15
    .line 16
    iput p2, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->nonlinearVolume:I

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {p3, p1, v1, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    .line 21
    .line 22
    iput p4, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->vad:I

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioPropertiesInfo{linearVolume=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->linearVolume:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\'nonlinearVolume=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->nonlinearVolume:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\'voicePitch=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-wide v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesInfo;->voicePitch:D

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

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
