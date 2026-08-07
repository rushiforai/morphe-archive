.class public Ll/cdg;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/idg;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VImage;

.field public B:Lv/VImage;

.field public C:Lv/VImage;

.field public D:Landroid/widget/Space;

.field public E:Landroid/widget/TextView;

.field public F:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyViewGroup;

.field public G:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

.field public H:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

.field public I:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

.field public J:Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;

.field public K:Landroid/widget/TextView;

.field public L:Landroid/widget/Space;

.field public M:Landroid/widget/TextView;

.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Landroid/widget/Space;

.field public o:Lv/VDraweeView;

.field public p:Lv/VDraweeView;

.field public q:Lv/VImage;

.field public r:Lv/VImage;

.field public s:Lv/VImage;

.field public t:Landroid/widget/Space;

.field public u:Landroid/widget/Space;

.field public v:Landroid/view/View;

.field public w:Lv/VDraweeView;

.field public x:Landroid/view/View;

.field public y:Lv/VDraweeView;

.field public z:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/idg;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->s3:I

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic F(Ll/cdg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cdg;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/cdg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cdg;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/cdg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cdg;->M(Landroid/view/View;)V

    return-void
.end method

.method private synthetic M(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/idg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/idg;->u4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ddg;->a(Ll/cdg;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(Ll/idg;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/idg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/idg;->m4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/idg;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/idg;->m4()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 9
    .line 10
    check-cast p0, Ll/idg;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubDialog()Ll/v3f$d;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public N(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cdg;->l:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/high16 p1, -0x73000000

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const p1, 0xffffff

    .line 9
    .line 10
    .line 11
    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cdg;->r:Lv/VImage;

    .line 15
    .line 16
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cdg;->l:Landroid/view/View;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/cdg;->r:Lv/VImage;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p0, Ll/cdg;->s:Lv/VImage;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    :cond_2
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/idg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cdg;->J(Ll/idg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/cdg;->I(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 5
    .line 6
    check-cast p1, Ll/idg;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/idg;->s4()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/cdg;->l:Landroid/view/View;

    .line 12
    .line 13
    new-instance v0, Ll/zcg;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/zcg;-><init>(Ll/cdg;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/cdg;->r:Lv/VImage;

    .line 22
    .line 23
    new-instance v0, Ll/adg;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/adg;-><init>(Ll/cdg;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/cdg;->s:Lv/VImage;

    .line 32
    .line 33
    new-instance v0, Ll/bdg;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/bdg;-><init>(Ll/cdg;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/cdg;->o:Lv/VDraweeView;

    .line 42
    .line 43
    sget-object v0, Ll/zft;->l:Ljava/lang/String;

    .line 44
    .line 45
    const/high16 v1, 0x43940000    # 296.0f

    .line 46
    .line 47
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const/high16 v2, 0x43560000    # 214.0f

    .line 52
    .line 53
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    const-string v3, "context_livingAct"

    .line 58
    .line 59
    invoke-static {v3, p1, v0, v1, v2}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/cdg;->p:Lv/VDraweeView;

    .line 63
    .line 64
    sget-object p1, Ll/zft;->k:Ljava/lang/String;

    .line 65
    .line 66
    const/high16 v0, 0x436a0000    # 234.0f

    .line 67
    .line 68
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    const/high16 v1, 0x436c0000    # 236.0f

    .line 73
    .line 74
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-static {v3, p0, p1, v0, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/idg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cdg;->J(Ll/idg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
