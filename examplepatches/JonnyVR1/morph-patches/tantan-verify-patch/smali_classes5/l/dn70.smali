.class public final synthetic Ll/dn70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/PicksUser;

.field public final synthetic d:Ll/y20;

.field public final synthetic e:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;ZLcom/p1/mobile/putong/core/data/PicksUser;Ll/y20;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dn70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;

    iput-boolean p2, p0, Ll/dn70;->b:Z

    iput-object p3, p0, Ll/dn70;->c:Lcom/p1/mobile/putong/core/data/PicksUser;

    iput-object p4, p0, Ll/dn70;->d:Ll/y20;

    iput-object p5, p0, Ll/dn70;->e:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/dn70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;

    iget-boolean v1, p0, Ll/dn70;->b:Z

    iget-object v2, p0, Ll/dn70;->c:Lcom/p1/mobile/putong/core/data/PicksUser;

    iget-object v3, p0, Ll/dn70;->d:Ll/y20;

    iget-object v4, p0, Ll/dn70;->e:Lcom/p1/mobile/putong/data/User;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;->a(Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksItemView;ZLcom/p1/mobile/putong/core/data/PicksUser;Ll/y20;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
