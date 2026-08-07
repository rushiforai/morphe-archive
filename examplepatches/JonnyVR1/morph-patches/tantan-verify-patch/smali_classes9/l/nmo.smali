.class public final synthetic Ll/nmo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nmo;->a:Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;

    iput-object p2, p0, Ll/nmo;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nmo;->a:Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;

    iget-object p0, p0, Ll/nmo;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->R(Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V

    return-void
.end method
