.class public Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public chat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

.field public isFromWindow:Z

.field public live:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

.field public randomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

.field public recallId:Ljava/lang/String;

.field public source:Ljava/lang/String;

.field public type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Ljava/lang/String;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->source:Ljava/lang/String;

    const/4 p1, 0x0

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->type:I

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->source:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->recallId:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->type:I

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;Ljava/lang/String;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->randomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    .line 20
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->source:Ljava/lang/String;

    const/4 p1, 0x2

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->type:I

    return-void
.end method


# virtual methods
.method public isFakeCall()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->type:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isRandomMatch()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->type:I

    .line 2
    .line 3
    const/4 v0, 0x2

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
