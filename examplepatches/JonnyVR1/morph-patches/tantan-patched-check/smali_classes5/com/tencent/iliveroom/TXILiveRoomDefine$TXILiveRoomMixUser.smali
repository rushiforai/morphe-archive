.class public Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/iliveroom/TXILiveRoomDefine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TXILiveRoomMixUser"
.end annotation


# instance fields
.field public height:I

.field public isMuteAudio:Z

.field public roomId:Ljava/lang/String;

.field public userId:J

.field public width:I

.field public x:I

.field public y:I

.field public zOrder:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 49
    iput-wide v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->userId:J

    const/4 v0, 0x0

    .line 50
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->x:I

    .line 51
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->y:I

    .line 52
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->width:I

    .line 53
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->height:I

    .line 54
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->zOrder:I

    .line 55
    iput-boolean v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->isMuteAudio:Z

    return-void
.end method

.method public constructor <init>(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    iget-object v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->roomId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->roomId:Ljava/lang/String;

    .line 9
    .line 10
    iget-wide v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->userId:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->userId:J

    .line 13
    .line 14
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->x:I

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->x:I

    .line 17
    .line 18
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->y:I

    .line 19
    .line 20
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->y:I

    .line 21
    .line 22
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->width:I

    .line 23
    .line 24
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->width:I

    .line 25
    .line 26
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->height:I

    .line 27
    .line 28
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->height:I

    .line 29
    .line 30
    iget v0, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->zOrder:I

    .line 31
    .line 32
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->zOrder:I

    .line 33
    .line 34
    iget-boolean p1, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->isMuteAudio:Z

    .line 35
    .line 36
    iput-boolean p1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->isMuteAudio:Z

    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JIIIII)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->roomId:Ljava/lang/String;

    .line 41
    iput-wide p2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->userId:J

    .line 42
    iput p4, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->x:I

    .line 43
    iput p5, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->y:I

    .line 44
    iput p6, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->width:I

    .line 45
    iput p7, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->height:I

    .line 46
    iput p8, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->zOrder:I

    const/4 p1, 0x0

    .line 47
    iput-boolean p1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->isMuteAudio:Z

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "TXILiveRoomMixUser{userId=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->userId:J

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', x="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->x:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", y="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->y:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", width="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->width:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", height="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->height:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", zOrder="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->zOrder:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ", isMuteAudio="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-boolean p0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomMixUser;->isMuteAudio:Z

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const/16 p0, 0x7d

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method
