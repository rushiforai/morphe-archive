.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {}, Ll/gra;->G0()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->z:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;->V:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/widget/ListView;->getHeaderViewsCount()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-int/2addr v0, v1

    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->f5(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x1

    .line 39
    if-ne v0, v1, :cond_1

    .line 40
    .line 41
    move v0, v2

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const/4 v0, 0x0

    .line 44
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag$a;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;

    .line 45
    .line 46
    xor-int/2addr v0, v2

    .line 47
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;->g5(Lcom/p1/mobile/putong/core/newui/messages/ConversationListFrag;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
