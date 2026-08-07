.class public final synthetic Ll/p96;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p96;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;

    iput-object p2, p0, Ll/p96;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p96;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;

    iget-object p0, p0, Ll/p96;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V

    return-void
.end method
