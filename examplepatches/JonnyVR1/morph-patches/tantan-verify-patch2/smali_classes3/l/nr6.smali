.class public Ll/nr6;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;Landroid/view/View;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->S:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 5
    .line 6
    sget v0, Ll/adc0;->e7:I

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/anim/view/PullQuickChatLayout;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->T:Lcom/p1/mobile/putong/core/newui/messages/anim/view/PullQuickChatLayout;

    .line 15
    .line 16
    sget v0, Ll/adc0;->f7:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/widget/FrameLayout;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->U:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    sget v0, Ll/adc0;->d7:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 35
    .line 36
    sget v0, Ll/adc0;->n4:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->W:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    .line 45
    .line 46
    return-void
.end method
