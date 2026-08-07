.class public final synthetic Ll/neq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/neq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;

    iput-object p2, p0, Ll/neq;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/neq;->c:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p4, p0, Ll/neq;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/neq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;

    iget-object v1, p0, Ll/neq;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/neq;->c:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/neq;->d:Lcom/p1/mobile/putong/core/data/Conversation;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemPrompt;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;Ljava/lang/Boolean;)V

    return-void
.end method
