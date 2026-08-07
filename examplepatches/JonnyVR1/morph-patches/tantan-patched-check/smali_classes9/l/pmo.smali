.class public final synthetic Ll/pmo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;Lcom/p1/mobile/putong/data/User;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pmo;->a:Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;

    iput-object p2, p0, Ll/pmo;->b:Lcom/p1/mobile/putong/data/User;

    iput-wide p3, p0, Ll/pmo;->c:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pmo;->a:Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;

    iget-object v1, p0, Ll/pmo;->b:Lcom/p1/mobile/putong/data/User;

    iget-wide v2, p0, Ll/pmo;->c:J

    invoke-static {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;->P(Lcom/p1/mobile/putong/core/ui/messages/view/IntlMessageReadReceiptsView;Lcom/p1/mobile/putong/data/User;J)V

    return-void
.end method
