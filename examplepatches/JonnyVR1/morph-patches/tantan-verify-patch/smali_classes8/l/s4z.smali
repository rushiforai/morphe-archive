.class public final synthetic Ll/s4z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/yxz;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public final synthetic e:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s4z;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;

    iput-object p2, p0, Ll/s4z;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/s4z;->c:Ll/yxz;

    iput-object p4, p0, Ll/s4z;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    iput-object p5, p0, Ll/s4z;->e:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/s4z;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;

    iget-object v1, p0, Ll/s4z;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/s4z;->c:Ll/yxz;

    iget-object v3, p0, Ll/s4z;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    iget-object v4, p0, Ll/s4z;->e:Ljava/util/List;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;->P(Lcom/p1/mobile/putong/core/ui/messages/MessageChatPrologueLayout;Ljava/lang/String;Ll/yxz;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method
