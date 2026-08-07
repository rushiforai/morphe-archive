.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/vpj<",
        "*>;>;"
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

.field public e:Lv/VText;

.field public f:Landroid/view/View;

.field public g:Landroid/widget/TextView;

.field public h:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public i:Lv/VText;

.field public j:Landroidx/constraintlayout/widget/Group;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/vpj;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    const-string v0, "liveGiftBarRechargeClick"

    .line 3
    .line 4
    invoke-virtual {p0, p1, v0}, Ll/vpj;->W3(ZLjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/qzj;->n(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic i0(Ll/vpj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vpj;->Y3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vpj;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->m0(Ll/vpj;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->l0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/opj;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/opj;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m0(Ll/vpj;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vpj<",
            "*>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/lpj;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/lpj;-><init>(Ll/vpj;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->g:Landroid/widget/TextView;

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->i:Lv/VText;

    .line 12
    .line 13
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/mpj;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/mpj;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->e:Lv/VText;

    .line 25
    .line 26
    new-instance v0, Ll/npj;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Ll/npj;-><init>(Ll/vpj;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public n0(Ll/bjs;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public o0(Ll/unj;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/unj;->c()Landroidx/viewpager/widget/ViewPager;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p1}, Ll/unj;->b()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;->a(Landroidx/viewpager/widget/ViewPager;I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/unj;->a()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v0, 0x2

    .line 21
    if-lt p1, v0, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->k0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p0(Ll/bjs;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->q0(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->g:Landroid/widget/TextView;

    .line 5
    .line 6
    xor-int/lit8 v1, p2, 0x1

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->f:Landroid/view/View;

    .line 12
    .line 13
    xor-int/lit8 v1, p2, 0x1

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->f:Landroid/view/View;

    .line 19
    .line 20
    invoke-static {}, Ll/u8n;->a()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    sget v0, Ll/obc0;->k2:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget v0, Ll/obc0;->j2:I

    .line 30
    .line 31
    :goto_0
    invoke-static {v0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 36
    .line 37
    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->showBubbleByType()Ll/v3f$d;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "firstRechargeGiftDialogBubble"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final q0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->j:Landroidx/constraintlayout/widget/Group;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->h:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p0, -0x1

    .line 11
    const/4 p1, 0x0

    .line 12
    const-string v1, "https://auto.tancdn.com/v1/raw/59f488f3-fb83-460e-bd89-828cb7dc684b10.pdf"

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->j:Landroidx/constraintlayout/widget/Group;

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setAvailableCoin(Ljava/lang/Long;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->f:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->g:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/aiv;->r0(J)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
