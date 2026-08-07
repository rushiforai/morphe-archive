.class public final synthetic Ll/v4z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v4z;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;

    iput-object p2, p0, Ll/v4z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    iput-object p3, p0, Ll/v4z;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/v4z;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v4z;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;

    iget-object v1, p0, Ll/v4z;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    iget-object v2, p0, Ll/v4z;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/v4z;->d:Ljava/util/List;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->Q(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method
