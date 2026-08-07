.class public final synthetic Ll/d76;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d76;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    iput-object p2, p0, Ll/d76;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d76;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    iget-object p0, p0, Ll/d76;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->e(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Ljava/util/List;)V

    return-void
.end method
