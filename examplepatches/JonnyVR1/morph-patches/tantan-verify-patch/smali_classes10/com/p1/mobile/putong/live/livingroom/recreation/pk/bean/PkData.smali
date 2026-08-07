.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final anchorId:Ljava/lang/String;

.field private isOnceMore:Z

.field public lastState:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

.field private mHostContributors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;"
        }
    .end annotation
.end field

.field private mOtherContributors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;"
        }
    .end annotation
.end field

.field private final otherUser:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

.field public pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

.field private pkBountyData:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

.field public pkWinTimesData:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;

.field public showWinTimesTag:Z

.field public state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

.field private users:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLivePk;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLivePk;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Lcom/p1/mobile/putong/data/User;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->showWinTimesTag:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lastState:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->currentStageInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;->stage:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 20
    .line 21
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->users:Ljava/util/List;

    .line 22
    .line 23
    if-nez p3, :cond_0

    .line 24
    .line 25
    const-string p1, ""

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->anchorId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p2, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->anchorId:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 41
    .line 42
    new-instance p2, Ll/nu70;

    .line 43
    .line 44
    invoke-direct {p2, p0}, Ll/nu70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p1, p2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 54
    .line 55
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->updateContributors()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->updatePkWinTimes()V

    .line 59
    .line 60
    .line 61
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 62
    .line 63
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 64
    .line 65
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->anchorId:Ljava/lang/String;

    .line 66
    .line 67
    invoke-direct {p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;-><init>(Lcom/p1/mobile/putong/live/base/data/BLivePk;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pkBountyData:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 71
    .line 72
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)V
    .locals 2

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 74
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->showWinTimesTag:Z

    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lastState:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePk;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePk;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 78
    const-string v0, "-991"

    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 79
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->anchorId:Ljava/lang/String;

    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->users:Ljava/util/List;

    .line 82
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    invoke-direct {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;-><init>(Lcom/p1/mobile/putong/live/base/data/BLivePk;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pkBountyData:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lambda$updateContributors$1(Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lambda$updateContributors$2(Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lambda$new$0(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private contributions(Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->toJson()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lambda$otherUser$3(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lambda$updatePkWinTimes$5(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private synthetic lambda$new$0(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->anchorId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private synthetic lambda$otherUser$3(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private synthetic lambda$updateContributors$1(Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getUser(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->image:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->name:Ljava/lang/String;

    .line 22
    .line 23
    return-void
.end method

.method private synthetic lambda$updateContributors$2(Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getUser(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->image:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->name:Ljava/lang/String;

    .line 22
    .line 23
    return-void
.end method

.method private synthetic lambda$updatePkWinTimes$5(Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->anchorId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pkWinTimesData:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winTimes:J

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;->setAnchorWinTimes(J)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winTimes:J

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;->setOtherWinTimes(J)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private updateContributors()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x2

    .line 20
    if-ge v0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 33
    .line 34
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->anchorId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const/4 v2, 0x1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->contributors:Ljava/util/List;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mHostContributors:Ljava/util/List;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->contributors:Ljava/util/List;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mOtherContributors:Ljava/util/List;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->contributors:Ljava/util/List;

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mHostContributors:Ljava/util/List;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->contributors:Ljava/util/List;

    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mOtherContributors:Ljava/util/List;

    .line 81
    .line 82
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mHostContributors:Ljava/util/List;

    .line 83
    .line 84
    new-instance v1, Ll/ou70;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/ou70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mOtherContributors:Ljava/util/List;

    .line 93
    .line 94
    new-instance v1, Ll/pu70;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/pu70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_2
    :goto_1
    new-instance v0, Ljava/util/ArrayList;

    .line 104
    .line 105
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .line 107
    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mHostContributors:Ljava/util/List;

    .line 109
    .line 110
    new-instance v0, Ljava/util/ArrayList;

    .line 111
    .line 112
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mOtherContributors:Ljava/util/List;

    .line 116
    .line 117
    return-void
.end method


# virtual methods
.method public getAnchorId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->anchorId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorWinTimes()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pkWinTimesData:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;->getAnchorWinTimes()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getHostContributors()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mHostContributors:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherContributors()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mOtherContributors:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherWinTimes()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pkWinTimesData:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;->getOtherWinTimes()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pkBountyData:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUser(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->users:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/lu70;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/lu70;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    return-object p0
.end method

.method public isBountyPk()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 4
    .line 5
    const-string v0, "bounty"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public isEnded()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 2
    .line 3
    const-string v0, "ended"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isOnceMore()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isOnceMore:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPking()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 2
    .line 3
    const-string v1, "ended"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 12
    .line 13
    const-string v0, "unknown_"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public isPlaying()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 2
    .line 3
    const-string v0, "playing"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isPreparing()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 2
    .line 3
    const-string v0, "preparing"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isPunishing()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 2
    .line 3
    const-string v0, "punishing"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isRandom()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 4
    .line 5
    const-string v0, "random"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public isRankPk()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->categoryV2:Lcom/p1/mobile/putong/live/base/data/BLivePkCategory;

    .line 4
    .line 5
    const-string v0, "rank"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public isSameStatus(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)Z
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public isTargetState(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v1, "unknown_"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-le p0, p1, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public isUnknown()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 2
    .line 3
    const-string v0, "unknown_"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public lastStateIsPlaying()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lastState:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 2
    .line 3
    const-string v0, "playing"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public otherUser()Lcom/p1/mobile/putong/data/User;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->users:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/qu70;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/qu70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    return-object p0
.end method

.method public otherUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public setOnceMore(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isOnceMore:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "PkData{users="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->users:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ", pk="

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, ", otherUser=\'"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, "\', anchorId=\'"

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->anchorId:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v1, "\', state="

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v1, ", lastState="

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lastState:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v1, ", isOnceMore="

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isOnceMore:Z

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v1, ", mHostContributors="

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mHostContributors:Ljava/util/List;

    .line 93
    .line 94
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->contributions(Ljava/util/List;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v1, ", mOtherContributors="

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->mOtherContributors:Ljava/util/List;

    .line 107
    .line 108
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->contributions(Ljava/util/List;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const/16 p0, 0x7d

    .line 116
    .line 117
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    return-object p0
.end method

.method public updatePk(Lcom/p1/mobile/putong/live/base/data/BLivePk;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 4
    .line 5
    :cond_0
    return-object p0
.end method

.method public updatePkWinTimes()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pkWinTimesData:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pkWinTimesData:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkWinTimesData;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 13
    .line 14
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->showWinTimesTag:Z

    .line 15
    .line 16
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->showWinTimesTag:Z

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 19
    .line 20
    new-instance v1, Ll/mu70;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/mu70;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
