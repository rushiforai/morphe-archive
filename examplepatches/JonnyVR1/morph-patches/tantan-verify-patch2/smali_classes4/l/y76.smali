.class public final synthetic Ll/y76;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;

.field public final synthetic b:Ll/u46;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;Ll/u46;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y76;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;

    iput-object p2, p0, Ll/y76;->b:Ll/u46;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y76;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;

    iget-object p0, p0, Ll/y76;->b:Ll/u46;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;->Q(Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;Ll/u46;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method
