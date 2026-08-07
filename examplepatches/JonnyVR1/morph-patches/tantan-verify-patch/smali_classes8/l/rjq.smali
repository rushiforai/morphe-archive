.class public final synthetic Ll/rjq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rjq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;

    iput-object p2, p0, Ll/rjq;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/rjq;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rjq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;

    iget-object v1, p0, Ll/rjq;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/rjq;->c:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;->e(Lcom/p1/mobile/putong/core/ui/messages/ItemVisitorHideFootPrint;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V

    return-void
.end method
