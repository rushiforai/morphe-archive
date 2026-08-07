.class public final synthetic Ll/d7q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemInviteMessage;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemInviteMessage;Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d7q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemInviteMessage;

    iput-object p2, p0, Ll/d7q;->b:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d7q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemInviteMessage;

    iget-object p0, p0, Ll/d7q;->b:Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemInviteMessage;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemInviteMessage;Lcom/p1/mobile/putong/core/data/PictureTxtDeeplinkMsgData;Landroid/view/View;)V

    return-void
.end method
