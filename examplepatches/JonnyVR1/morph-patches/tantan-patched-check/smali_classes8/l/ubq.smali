.class public final synthetic Ll/ubq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInvite;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInvite;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ubq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInvite;

    iput-object p2, p0, Ll/ubq;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/ubq;->c:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ubq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInvite;

    iget-object v1, p0, Ll/ubq;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/ubq;->c:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInvite;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageWCInvite;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;Landroid/view/View;)V

    return-void
.end method
