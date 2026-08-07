.class public Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momomediaext/utils/MMLivePlayerConfig$MMLivePlayerMode;
    }
.end annotation


# static fields
.field public static final DEMAND_BROADCAST:I = 0x1

.field public static final LIVE_BROADCAST:I


# instance fields
.field public businessType:I

.field public cdnType:I

.field public ipv6Url:Ljava/lang/String;

.field public mediaConfig:Ljava/lang/String;

.field public mode:Lcom/immomo/momomediaext/utils/MMLivePlayerConfig$MMLivePlayerMode;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->url:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->mediaConfig:Ljava/lang/String;

    .line 9
    .line 10
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig$MMLivePlayerMode;->MMLivePlayerModeLive:Lcom/immomo/momomediaext/utils/MMLivePlayerConfig$MMLivePlayerMode;

    .line 11
    .line 12
    iput-object v1, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->mode:Lcom/immomo/momomediaext/utils/MMLivePlayerConfig$MMLivePlayerMode;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput v1, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->cdnType:I

    .line 16
    .line 17
    iput v1, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->businessType:I

    .line 18
    .line 19
    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->ipv6Url:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MMLivePlayerConfig{url=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->url:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', mediaConfig=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->mediaConfig:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\', mode="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->mode:Lcom/immomo/momomediaext/utils/MMLivePlayerConfig$MMLivePlayerMode;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", cdnType="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->cdnType:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", businessType="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->businessType:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", ipv6Url=\'"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->ipv6Url:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p0, "\'}"

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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
