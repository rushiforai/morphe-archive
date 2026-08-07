.class public Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/nln<",
        "*>;>;"
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsLayerView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

.field public i:Landroid/view/View;

.field public j:Lv/VText;

.field public k:Ll/ib0;

.field public l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;

.field public m:Ll/nln;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nln<",
            "*>;"
        }
    .end annotation
.end field

.field public n:Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private synthetic B0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->v0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->m:Ll/nln;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/nln;->Y3()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private H0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->r()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsLayerView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsLayerView;->e()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->n:Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->k()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private I0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;Z)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ll/jjs;->g()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->enableComboEffect:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->t(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->v0()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private J0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;IZLcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;)V
    .locals 1

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->n:Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_2

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->E0()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->u0()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p2}, Ll/jjs;->d()Z

    .line 22
    .line 23
    .line 24
    move-result p4

    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->n:Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;

    .line 26
    .line 27
    if-eqz p4, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0, p1, p2, p3, p5}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->m(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;ILcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->h()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->u0()V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->t0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->y0()V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->w0()V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->z0()V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->B0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;Ll/ib0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->E0(Ll/ib0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;Ll/ib0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->D0(Ll/ib0;Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 2
    .line 3
    new-instance v1, Ll/uln;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/uln;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->h(Ll/x20;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->f:Landroid/widget/ImageView;

    .line 14
    .line 15
    new-instance v1, Ll/vln;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/vln;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private r0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsLayerView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ll/wln;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Ll/wln;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsLayerView;->c(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-static {v0, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private s0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsLayerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsLayerView;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private t0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->n:Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->o(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private u0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->n:Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;

    .line 2
    .line 3
    new-instance v1, Ll/yln;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/yln;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;->p(Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic y0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->u()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->r0(Z)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->u0()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->m:Ll/nln;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlGiftComboEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;->newComboVisible()Ll/v3f$d;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private synthetic z0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->m:Ll/nln;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->k:Ll/ib0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/ib0;->c()Ll/jjs;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/jjs;->f()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    long-to-int v1, v1

    .line 14
    new-instance v2, Ll/xln;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/xln;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/nln;->X3(ILl/x20;)V

    .line 20
    .line 21
    .line 22
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

.method public final synthetic D0(Ll/ib0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->m:Ll/nln;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->intlNewComboClick()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic E0(Ll/ib0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->m:Ll/nln;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->intlNewComboClick()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public G0(Ll/ib0;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/ib0;->d()Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {p1}, Ll/ib0;->c()Ll/jjs;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {p1}, Ll/ib0;->b()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-virtual {p1}, Ll/ib0;->e()Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-virtual {p1}, Ll/ib0;->a()Ll/e060;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v5, 0x0

    .line 22
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->q0(Z)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->k:Ll/ib0;

    .line 26
    .line 27
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;

    .line 28
    .line 29
    invoke-direct {p0, v1, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->I0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 33
    .line 34
    iget-object v5, v5, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;

    .line 35
    .line 36
    new-instance v6, Ll/zln;

    .line 37
    .line 38
    invoke-direct {v6, p0, p1}, Ll/zln;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;Ll/ib0;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 45
    .line 46
    iget-object v5, v5, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->i:Lv/VDraweeView;

    .line 47
    .line 48
    new-instance v6, Ll/amn;

    .line 49
    .line 50
    invoke-direct {v6, p0, p1}, Ll/amn;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;Ll/ib0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Ll/jjs;->c()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->t0()V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsLayerView;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/e060;->a()[I

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p0, v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsLayerView;->f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;[I)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->s0()V

    .line 76
    .line 77
    .line 78
    move-object v0, p0

    .line 79
    move-object v5, p2

    .line 80
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->J0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;IZLcom/p1/mobile/putong/live/livingroom/increment/gift/operation/multiple/LiveMultipleGiftView$a;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public K0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->g:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/nln;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->p0(Ll/nln;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public final o0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bmn;->a(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->o0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->r()V

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->f:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->g:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->h:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;

    .line 17
    .line 18
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlMultipleGiftItemView;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->n:Lcom/p1/mobile/putong/live/livingroom/intl/gift/a;

    .line 22
    .line 23
    return-void
.end method

.method public p0(Ll/nln;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nln<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->m:Ll/nln;

    .line 2
    .line 3
    return-void
.end method

.method public q0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->f:Landroid/widget/ImageView;

    .line 4
    .line 5
    xor-int/lit8 v1, p1, 0x1

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->g:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setAvailableCoin(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->j:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public v0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->d:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlLiveCountdownView;->s()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->r0(Z)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->t0()V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->H0()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->m:Ll/nln;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlGiftComboEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;->newComboVisible()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->m:Ll/nln;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/nln;->W3()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic w0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/gears/GiftGearsLayerView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
