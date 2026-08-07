.class public Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;
    }
.end annotation


# instance fields
.field private jumpRoomType:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

.field private live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

.field private liveIdNeedToRemove:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private liveType:Ljava/lang/String;

.field private final oldAnchorName:Ljava/lang/String;

.field private final oldLiveId:Ljava/lang/String;

.field private final oldRoomId:Ljava/lang/String;

.field private oldSource:Ljava/lang/String;

.field private source:Ljava/lang/String;

.field private final toLiveId:Ljava/lang/String;

.field private final toRoomId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->liveIdNeedToRemove:Ljava/util/HashSet;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->DEFAULT:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->jumpRoomType:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->e(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldAnchorName:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->f(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldLiveId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->g(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldRoomId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->j(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->toLiveId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->k(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->toRoomId:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->i(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->source:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->b(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->d(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->liveType:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->a(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->jumpRoomType:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->liveIdNeedToRemove:Ljava/util/HashSet;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->c(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)Ljava/util/HashSet;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 76
    .line 77
    .line 78
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->h(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldSource:Ljava/lang/String;

    .line 83
    .line 84
    return-void
.end method


# virtual methods
.method public getJumpRoomType()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->jumpRoomType:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLive()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveIdNeedToRemove()Ljava/util/HashSet;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->liveIdNeedToRemove:Ljava/util/HashSet;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->liveType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOldAnchorName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldAnchorName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOldLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldLiveId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOldRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldRoomId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOldSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldSource:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->source:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->toLiveId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getToRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->toRoomId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isOldDataValid()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldLiveId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldRoomId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldAnchorName:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public setLive(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    return-void
.end method

.method public setLiveType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->liveType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOldSource(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->oldSource:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSource(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;->source:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
