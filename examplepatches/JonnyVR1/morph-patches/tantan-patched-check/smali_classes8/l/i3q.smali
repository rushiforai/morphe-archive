.class public final synthetic Ll/i3q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i3q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;

    iput-object p2, p0, Ll/i3q;->b:Ljava/util/List;

    iput-object p3, p0, Ll/i3q;->c:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p4, p0, Ll/i3q;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i3q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;

    iget-object v1, p0, Ll/i3q;->b:Ljava/util/List;

    iget-object v2, p0, Ll/i3q;->c:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/i3q;->d:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemBreakIceMessage;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Landroid/view/View;)V

    return-void
.end method
