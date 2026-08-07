.class public Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper$QuickChatCardType;
    }
.end annotation


# instance fields
.field private broadcastCard:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

.field public cardType:I

.field private insertCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

.field public insertTime:J

.field private isOneside:Z

.field private mConsumed:Z

.field private mRunnable:Ljava/lang/Runnable;

.field public rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

.field public userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertTime:J

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->userId:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->rsState:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->biz:Lcom/p1/mobile/putong/core/data/QuickChatType;

    .line 22
    .line 23
    const-string v0, "card-dau"

    .line 24
    .line 25
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->isOneside:Z

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V
    .locals 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 33
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertTime:J

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    const/4 v0, 0x2

    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->userId:Ljava/lang/String;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->userId:Ljava/lang/String;

    .line 37
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 38
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->oneside:Z

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->isOneside:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->lambda$consume$0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private synthetic lambda$consume$0(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isInitiateQuickChat()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isPassiveQuickChat()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method


# virtual methods
.method public consume()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->markAsConsumed()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 7
    .line 8
    new-instance v1, Ll/j1c0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/j1c0;-><init>(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->F8(Ll/qcj;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public consumeRunnable()Ljava/lang/Runnable;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->mRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/k1c0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/k1c0;-><init>(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->mRunnable:Ljava/lang/Runnable;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->mRunnable:Ljava/lang/Runnable;

    .line 13
    .line 14
    return-object p0
.end method

.method public getBroadcastCard()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFitReason()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->fitReason:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-ne v0, v1, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->fitReason:Ljava/lang/String;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public getFriendPurpose()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->friendPurpose:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-ne v0, v1, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->friendPurpose:Ljava/lang/String;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public getInsertCard()Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUser()Lcom/p1/mobile/putong/data/User;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->userID:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    if-eq v0, v1, :cond_1

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    if-ne v0, v1, :cond_2

    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->user:Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_2
    const/4 p0, 0x0

    .line 49
    return-object p0
.end method

.method public getZodiacFitPercent()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->insertCard:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;->zodiacFitPercent:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-ne v0, v1, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->zodiacFitPercent:Ljava/lang/String;

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public isConsumed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->mConsumed:Z

    .line 2
    .line 3
    return p0
.end method

.method public isOneside()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->isOneside:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPeiLiao()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public markAsConsumed()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->mConsumed:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->mRunnable:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
