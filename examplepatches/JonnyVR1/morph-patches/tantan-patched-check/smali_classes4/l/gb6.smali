.class public final synthetic Ll/gb6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gb6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;

    iput-object p2, p0, Ll/gb6;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gb6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;

    iget-object p0, p0, Ll/gb6;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;->b(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
