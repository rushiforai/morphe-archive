.class Lcom/p1/mobile/putong/core/data/Conversation$75;
.super Lcom/tantanapp/common/data/orm/DoubleColumn;
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
        "Lcom/tantanapp/common/data/orm/DoubleColumn<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/tantanapp/common/data/orm/DoubleColumn;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public get(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Double;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 6
    .line 7
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestTime:D

    .line 8
    .line 9
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Conversation$75;->get(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method

.method public set(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Double;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->greetingSummaryDetail:Lcom/p1/mobile/putong/core/data/GreetingSummary;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    .line 8
    .line 9
    .line 10
    move-result-wide p1

    .line 11
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/data/GreetingSummary;->latestTime:D

    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    check-cast p2, Ljava/lang/Double;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Conversation$75;->set(Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Double;)V

    return-void
.end method
