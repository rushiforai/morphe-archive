.class Lcom/p1/mobile/putong/core/data/Conversation$97;
.super Lcom/tantanapp/common/data/orm/Column;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Conversation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/Column<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
        "Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/Column;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public get(Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;
    .locals 0

    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Conversation$97;->get(Lcom/p1/mobile/putong/core/data/Conversation;)Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public set(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;)V
    .locals 0

    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Conversation$97;->set(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
