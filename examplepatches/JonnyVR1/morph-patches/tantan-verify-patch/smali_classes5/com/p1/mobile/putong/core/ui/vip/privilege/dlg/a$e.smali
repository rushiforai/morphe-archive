.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field public final e:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/app/PutongFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongFrag;Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;->g:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;->f:Ljava/util/ArrayList;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;->f:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    if-ne p1, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public m(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/lb2;->m(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeContentDlgItemView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeContentDlgItemView;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeContentDlgItemView;->R0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    sget p0, Ll/ddc0;->f:I

    .line 4
    .line 5
    invoke-virtual {p3, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/widget/FrameLayout;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    instance-of p2, p0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    check-cast p0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 21
    .line 22
    const/4 p2, 0x1

    .line 23
    invoke-virtual {p0, p2}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/pec0;->l1:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v1, v0

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeContentDlgItemView;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;->g:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;->f:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    move-object v4, p2

    .line 28
    check-cast v4, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;->g:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;->e:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 37
    .line 38
    move-object v3, p0

    .line 39
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/PrivilegeContentDlgItemView;->W(Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$e;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    return-object v1
.end method
