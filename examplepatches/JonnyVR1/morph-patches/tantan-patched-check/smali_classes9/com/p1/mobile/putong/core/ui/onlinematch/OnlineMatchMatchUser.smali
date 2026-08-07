.class public Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final TAG:Ljava/lang/String; = "OnlineMatchMatchUser"


# instance fields
.field public isSpeedMatch:Z

.field public isSquareMatch:Z

.field public tracker:Ljava/lang/String;

.field public user:Lcom/p1/mobile/putong/data/User;

.field public userId:Ljava/lang/String;


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
.method public transDataFromPush(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    const-string v1, "quickchat.speed-match"

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "quickchat_state.match"

    .line 12
    .line 13
    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 32
    .line 33
    :goto_1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->userId:Ljava/lang/String;

    .line 34
    .line 35
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->isSpeedMatch:Z

    .line 36
    .line 37
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->isSquareMatch:Z

    .line 38
    .line 39
    iget-object p1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchMatchUser;->tracker:Ljava/lang/String;

    .line 42
    .line 43
    return-void
.end method
