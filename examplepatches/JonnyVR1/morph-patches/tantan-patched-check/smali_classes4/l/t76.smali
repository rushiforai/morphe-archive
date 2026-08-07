.class public final synthetic Ll/t76;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t76;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    iput-object p2, p0, Ll/t76;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/t76;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    iput-boolean p4, p0, Ll/t76;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t76;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;

    iget-object v1, p0, Ll/t76;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/t76;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;

    iget-boolean p0, p0, Ll/t76;->d:Z

    check-cast p1, Ll/vg60;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;->c(Lcom/p1/mobile/putong/core/newui/messages/ConversationFilterLayout;Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/messages/ConversationsList$e;ZLl/vg60;)V

    return-void
.end method
