.class public Lio/agora/musiccontentcenter/Music;
.super Ljava/lang/Object;


# instance fields
.field public climaxSegments:[Lio/agora/musiccontentcenter/ClimaxSegment;

.field public durationS:I

.field public lyricTypes:[I

.field public mvProperties:[Lio/agora/musiccontentcenter/MvProperty;

.field public name:Ljava/lang/String;

.field public pitchType:I

.field public poster:Ljava/lang/String;

.field public releaseTime:Ljava/lang/String;

.field public singer:Ljava/lang/String;

.field public songCode:J

.field public type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;III[I[Lio/agora/musiccontentcenter/MvProperty;[Lio/agora/musiccontentcenter/ClimaxSegment;)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lio/agora/musiccontentcenter/Music;->songCode:J

    iput-object p3, p0, Lio/agora/musiccontentcenter/Music;->name:Ljava/lang/String;

    iput-object p4, p0, Lio/agora/musiccontentcenter/Music;->singer:Ljava/lang/String;

    iput-object p5, p0, Lio/agora/musiccontentcenter/Music;->poster:Ljava/lang/String;

    iput-object p6, p0, Lio/agora/musiccontentcenter/Music;->releaseTime:Ljava/lang/String;

    iput p7, p0, Lio/agora/musiccontentcenter/Music;->type:I

    iput p8, p0, Lio/agora/musiccontentcenter/Music;->pitchType:I

    iput p9, p0, Lio/agora/musiccontentcenter/Music;->durationS:I

    iput-object p10, p0, Lio/agora/musiccontentcenter/Music;->lyricTypes:[I

    iput-object p11, p0, Lio/agora/musiccontentcenter/Music;->mvProperties:[Lio/agora/musiccontentcenter/MvProperty;

    iput-object p12, p0, Lio/agora/musiccontentcenter/Music;->climaxSegments:[Lio/agora/musiccontentcenter/ClimaxSegment;

    return-void
.end method


# virtual methods
.method public getClimaxSegments()[Lio/agora/musiccontentcenter/ClimaxSegment;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/musiccontentcenter/Music;->climaxSegments:[Lio/agora/musiccontentcenter/ClimaxSegment;

    return-object p0
.end method

.method public getDurationS()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/musiccontentcenter/Music;->durationS:I

    return p0
.end method

.method public getLyricTypes()[I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/musiccontentcenter/Music;->lyricTypes:[I

    return-object p0
.end method

.method public getMvProperties()[Lio/agora/musiccontentcenter/MvProperty;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/musiccontentcenter/Music;->mvProperties:[Lio/agora/musiccontentcenter/MvProperty;

    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/musiccontentcenter/Music;->name:Ljava/lang/String;

    return-object p0
.end method

.method public getPitchType()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/musiccontentcenter/Music;->pitchType:I

    return p0
.end method

.method public getPoster()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/musiccontentcenter/Music;->poster:Ljava/lang/String;

    return-object p0
.end method

.method public getReleaseTime()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/musiccontentcenter/Music;->releaseTime:Ljava/lang/String;

    return-object p0
.end method

.method public getSinger()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/musiccontentcenter/Music;->singer:Ljava/lang/String;

    return-object p0
.end method

.method public getSongCode()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/musiccontentcenter/Music;->songCode:J

    return-wide v0
.end method

.method public getType()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/musiccontentcenter/Music;->type:I

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Music{songCode="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/agora/musiccontentcenter/Music;->songCode:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", name=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/musiccontentcenter/Music;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', singer=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/musiccontentcenter/Music;->singer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', poster=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/musiccontentcenter/Music;->poster:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', releaseTime=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/musiccontentcenter/Music;->releaseTime:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/musiccontentcenter/Music;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", pitchType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/musiccontentcenter/Music;->pitchType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", durationS="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/musiccontentcenter/Music;->durationS:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", lyricTypes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/musiccontentcenter/Music;->lyricTypes:[I

    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mvProperties="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/musiccontentcenter/Music;->mvProperties:[Lio/agora/musiccontentcenter/MvProperty;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", climaxSegments="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lio/agora/musiccontentcenter/Music;->climaxSegments:[Lio/agora/musiccontentcenter/ClimaxSegment;

    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
