.class public final synthetic Ll/v4q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/MessageChatHeat;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/MessageChatHeat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v4q;->a:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p2, p0, Ll/v4q;->b:Lcom/p1/mobile/putong/core/data/MessageChatHeat;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v4q;->a:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/v4q;->b:Lcom/p1/mobile/putong/core/data/MessageChatHeat;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemExclusiveInviteLayout;->c(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/MessageChatHeat;Landroid/view/View;)V

    return-void
.end method
