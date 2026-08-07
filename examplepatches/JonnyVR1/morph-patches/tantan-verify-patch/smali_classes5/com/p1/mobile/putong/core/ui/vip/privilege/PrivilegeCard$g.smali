.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$g;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->K0()Lcom/tantan/library/svga/AnimListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$g;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$g;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->u:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$g;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->u:Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/k190;->a()Ll/k190;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, v0, Ll/k190;->b:Z

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$g;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->u:Lcom/tantan/library/svga/SVGAnimationView;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$g;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->l:Lv/VImage;

    .line 22
    .line 23
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
