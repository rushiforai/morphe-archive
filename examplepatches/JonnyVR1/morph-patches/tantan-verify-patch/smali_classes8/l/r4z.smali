.class public final synthetic Ll/r4z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/yxz;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r4z;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;

    iput-object p2, p0, Ll/r4z;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/r4z;->c:Ll/yxz;

    iput-object p4, p0, Ll/r4z;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r4z;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;

    iget-object v1, p0, Ll/r4z;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/r4z;->c:Ll/yxz;

    iget-object p0, p0, Ll/r4z;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->T(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V

    return-void
.end method
