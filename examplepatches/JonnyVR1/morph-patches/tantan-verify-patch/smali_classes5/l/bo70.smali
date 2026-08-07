.class public final synthetic Ll/bo70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PicksUser;

.field public final synthetic c:Ll/eo70;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;Lcom/p1/mobile/putong/core/data/PicksUser;Ll/eo70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bo70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;

    iput-object p2, p0, Ll/bo70;->b:Lcom/p1/mobile/putong/core/data/PicksUser;

    iput-object p3, p0, Ll/bo70;->c:Ll/eo70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bo70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;

    iget-object v1, p0, Ll/bo70;->b:Lcom/p1/mobile/putong/core/data/PicksUser;

    iget-object p0, p0, Ll/bo70;->c:Ll/eo70;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Ll/eo70;->E(Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;Lcom/p1/mobile/putong/core/data/PicksUser;Ll/eo70;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
