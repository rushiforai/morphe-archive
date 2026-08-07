.class public Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/MatchScData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MatchBuilder"
.end annotation


# instance fields
.field private fromButton:Z

.field private isBoostResultRev:Z

.field private isFromFollow:Z

.field private isSecretCrush:Z

.field private liked:Z

.field private pageId:Ljava/lang/String;

.field private source:Ljava/lang/String;

.field private superLiked:Z

.field private userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public build()Lcom/p1/mobile/putong/data/MatchScData;
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/MatchScData;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData;-><init>(Ll/vex;)V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->userId:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MatchScData;->receiverUserId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    const-wide/16 v3, 0x3e8

    .line 16
    .line 17
    div-long/2addr v1, v3

    .line 18
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MatchScData;->createTime:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->source:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MatchScData;->updateRelationshipsSource:Ljava/lang/String;

    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->superLiked:Z

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    const-string v2, "superlike"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-boolean v2, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->liked:Z

    .line 36
    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    const-string v2, "like"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-string v2, "dislike"

    .line 43
    .line 44
    :goto_0
    iput-object v2, v0, Lcom/p1/mobile/putong/data/MatchScData;->actionname:Ljava/lang/String;

    .line 45
    .line 46
    iget-boolean v2, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->fromButton:Z

    .line 47
    .line 48
    if-eqz v2, :cond_3

    .line 49
    .line 50
    const-string v2, "click"

    .line 51
    .line 52
    iput-object v2, v0, Lcom/p1/mobile/putong/data/MatchScData;->actiontype:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    const-string v1, "e_superlikeButton"

    .line 57
    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MatchScData;->updateRelationshipsModuleId:Ljava/lang/String;

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->liked:Z

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    const-string v1, "e_likeButton"

    .line 66
    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MatchScData;->updateRelationshipsModuleId:Ljava/lang/String;

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    const-string v1, "e_card"

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MatchScData;->updateRelationshipsModuleId:Ljava/lang/String;

    .line 73
    .line 74
    const-string v1, "swipe"

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MatchScData;->actiontype:Ljava/lang/String;

    .line 77
    .line 78
    :cond_4
    :goto_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSecretCrush:Z

    .line 79
    .line 80
    if-eqz v1, :cond_5

    .line 81
    .line 82
    const-string v1, "secret_crush_sent"

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MatchScData;->updateRelationshipsModuleId:Ljava/lang/String;

    .line 85
    .line 86
    :cond_5
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromFollow:Z

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    const-string v1, "e_follow"

    .line 91
    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MatchScData;->updateRelationshipsModuleId:Ljava/lang/String;

    .line 93
    .line 94
    :cond_6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isBoostResultRev:Z

    .line 95
    .line 96
    if-eqz v1, :cond_7

    .line 97
    .line 98
    const-string v1, "e_boost_result_rev"

    .line 99
    .line 100
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MatchScData;->updateRelationshipsModuleId:Ljava/lang/String;

    .line 101
    .line 102
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId:Ljava/lang/String;

    .line 103
    .line 104
    iput-object p0, v0, Lcom/p1/mobile/putong/data/MatchScData;->pageId:Ljava/lang/String;

    .line 105
    .line 106
    return-object v0
.end method

.method public isBoostResultRev(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isBoostResultRev:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->fromButton:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public isFromFollow(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromFollow:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->liked:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public isSecretCrush(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSecretCrush:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->superLiked:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->source:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->userId:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public user(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;
    .locals 0

    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->userId:Ljava/lang/String;

    return-object p0
.end method
