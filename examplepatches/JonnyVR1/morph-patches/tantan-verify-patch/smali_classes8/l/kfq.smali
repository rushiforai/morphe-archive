.class public final synthetic Ll/kfq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kfq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;

    iput-object p2, p0, Ll/kfq;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/kfq;->c:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p4, p0, Ll/kfq;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/kfq;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/kfq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;

    iget-object v1, p0, Ll/kfq;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/kfq;->c:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v3, p0, Ll/kfq;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/kfq;->e:Ljava/lang/String;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;->c(Lcom/p1/mobile/putong/core/ui/messages/ItemRedPacket;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
