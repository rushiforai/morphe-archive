.class public final synthetic Ll/fc6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic c:Ll/u46;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;Lcom/p1/mobile/putong/core/data/Conversation;Ll/u46;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fc6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;

    iput-object p2, p0, Ll/fc6;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p3, p0, Ll/fc6;->c:Ll/u46;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fc6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;

    iget-object v1, p0, Ll/fc6;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object p0, p0, Ll/fc6;->c:Ll/u46;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->f(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;Lcom/p1/mobile/putong/core/data/Conversation;Ll/u46;Landroid/view/View;)V

    return-void
.end method
