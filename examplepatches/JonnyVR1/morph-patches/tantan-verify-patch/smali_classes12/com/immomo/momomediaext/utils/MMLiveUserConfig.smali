.class public Lcom/immomo/momomediaext/utils/MMLiveUserConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private appVersion:Ljava/lang/String;

.field private appid:Ljava/lang/String;

.field private isAudioOnly:Z

.field private momoid:Ljava/lang/String;

.field private roomid:Ljava/lang/String;

.field private secret:Ljava/lang/String;

.field public verCode:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->appid:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->secret:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->momoid:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->roomid:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->appVersion:Ljava/lang/String;

    .line 13
    .line 14
    iput-boolean p7, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->isAudioOnly:Z

    .line 15
    .line 16
    iput-object p6, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->verCode:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public getAppPatch()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->verCode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAppVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->appVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAppid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->appid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMomoid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->momoid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->roomid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSecret()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->secret:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isAudioOnly()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->isAudioOnly:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "<appid:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->appid:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",userid:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->momoid:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",roomid:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->roomid:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "appVerison"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->appVersion:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "versonCode"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->verCode:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ",isAudioOnly"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-boolean p0, p0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->isAudioOnly:Z

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const/16 p0, 0x3e

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method
