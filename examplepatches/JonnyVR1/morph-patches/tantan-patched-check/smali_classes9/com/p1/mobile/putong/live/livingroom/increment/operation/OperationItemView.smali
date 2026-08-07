.class public Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/v1m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/RelativeLayout;",
        "Ll/iam<",
        "Ll/u060;",
        ">;",
        "Ll/v1m;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VMarqueeText;

.field public h:Ll/u060;

.field public i:Ll/bnl0$g;

.field public final j:I

.field public k:Landroid/animation/Animator;

.field public l:Landroid/animation/Animator;

.field public m:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x96

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->j:I

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x96

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->j:I

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->y(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->w(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->A(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->x(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->v(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V

    return-void
.end method

.method private getOperationLeftMargin()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->b:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    sub-int/2addr v0, p0

    .line 14
    div-int/lit8 v0, v0, 0x2

    .line 15
    .line 16
    return v0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->z()V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->s()V

    return-void
.end method

.method private synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u060;->l4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic A(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->messageOpen()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/q260$a;

    .line 14
    .line 15
    const/16 v1, 0x1fa4

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/q260$a;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/q260$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ll/q260$a;->a()Ll/q260;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public B(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/u060;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-static {v1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v2, 0x1

    .line 17
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;->getTheRemainingTime()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->setDuration(I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;

    .line 30
    .line 31
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v2, Ljava/lang/Float;

    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v0, Ljava/lang/Float;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->e(FF)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;

    .line 51
    .line 52
    new-instance v1, Ll/a160;

    .line 53
    .line 54
    invoke-direct {v1, p0, p1}, Ll/a160;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->setOnEnd(Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->f()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final C(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->icon:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;->iconUrl:Ljava/lang/String;

    .line 6
    .line 7
    const/high16 v2, 0x42000000    # 32.0f

    .line 8
    .line 9
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const-string v3, "context_livingAct"

    .line 14
    .line 15
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->icon:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;->iconType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationIconType;

    .line 21
    .line 22
    const-string v1, "countdown"

    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->icon:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;->countdown:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->B(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final E(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->icon:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;->label:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->f:Lv/VText;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance v0, Ll/c160;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Ll/c160;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final F(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->icon:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemIcon;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance v0, Ll/b160;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Ll/b160;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public G()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;->d()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->k:Landroid/animation/Animator;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->l:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->m:Landroid/animation/Animator;

    .line 17
    .line 18
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public H()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ll/u060;->G4(Z)V

    .line 5
    .line 6
    .line 7
    const v0, 0x3dcccccd    # 0.1f

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Ll/bnl0$g;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 6
    .line 7
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->c:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iput-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->i:Ll/bnl0$g;

    .line 17
    .line 18
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->c:Lv/VDraweeView;

    .line 19
    .line 20
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 21
    .line 22
    const/4 v10, 0x2

    .line 23
    new-array v9, v10, [F

    .line 24
    .line 25
    fill-array-data v9, :array_0

    .line 26
    .line 27
    .line 28
    const-wide/16 v4, 0x0

    .line 29
    .line 30
    const-wide/16 v6, -0x1

    .line 31
    .line 32
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    move-result-object v11

    .line 36
    iget-object v12, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->g:Lv/VMarqueeText;

    .line 37
    .line 38
    new-instance v18, Landroid/view/animation/LinearInterpolator;

    .line 39
    .line 40
    invoke-direct/range {v18 .. v18}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 41
    .line 42
    .line 43
    new-array v2, v10, [F

    .line 44
    .line 45
    fill-array-data v2, :array_1

    .line 46
    .line 47
    .line 48
    const-string v13, "alpha"

    .line 49
    .line 50
    const-wide/16 v14, 0x0

    .line 51
    .line 52
    const-wide/16 v16, -0x1

    .line 53
    .line 54
    move-object/from16 v19, v2

    .line 55
    .line 56
    invoke-static/range {v12 .. v19}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object v12

    .line 60
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->c:Lv/VDraweeView;

    .line 61
    .line 62
    iget v3, v1, Ll/bnl0$g;->a:I

    .line 63
    .line 64
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->i:Ll/bnl0$g;

    .line 65
    .line 66
    iget v4, v4, Ll/bnl0$g;->a:I

    .line 67
    .line 68
    sub-int/2addr v3, v4

    .line 69
    int-to-float v3, v3

    .line 70
    new-array v9, v10, [F

    .line 71
    .line 72
    const/4 v13, 0x0

    .line 73
    const/4 v14, 0x0

    .line 74
    aput v14, v9, v13

    .line 75
    .line 76
    const/4 v15, 0x1

    .line 77
    aput v3, v9, v15

    .line 78
    .line 79
    const-string v3, "translationX"

    .line 80
    .line 81
    const-wide/16 v4, 0x0

    .line 82
    .line 83
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 84
    .line 85
    .line 86
    move-result-object v9

    .line 87
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->c:Lv/VDraweeView;

    .line 88
    .line 89
    iget v1, v1, Ll/bnl0$g;->b:I

    .line 90
    .line 91
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->i:Ll/bnl0$g;

    .line 92
    .line 93
    iget v3, v3, Ll/bnl0$g;->b:I

    .line 94
    .line 95
    sub-int/2addr v1, v3

    .line 96
    int-to-float v1, v1

    .line 97
    new-array v3, v10, [F

    .line 98
    .line 99
    aput v14, v3, v13

    .line 100
    .line 101
    aput v1, v3, v15

    .line 102
    .line 103
    move-object v1, v2

    .line 104
    const-string v2, "translationY"

    .line 105
    .line 106
    move-object v7, v8

    .line 107
    move-object v8, v3

    .line 108
    const-wide/16 v3, 0x0

    .line 109
    .line 110
    const-wide/16 v5, -0x1

    .line 111
    .line 112
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    filled-new-array {v11, v12, v9, v1}, [Landroid/animation/Animator;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    const-wide/16 v2, 0x96

    .line 121
    .line 122
    invoke-static {v2, v3, v1}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    new-instance v2, Ll/y060;

    .line 127
    .line 128
    move-object/from16 v3, p1

    .line 129
    .line 130
    invoke-direct {v2, v0, v3}, Ll/y060;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->k:Landroid/animation/Animator;

    .line 138
    .line 139
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f400000    # 0.75f
    .end array-data

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public J(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->g:Lv/VMarqueeText;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->C(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->F(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->E(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/u060;->C4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    .line 13
    .line 14
    .line 15
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->isForPrepare:Z

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->H()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/u060;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->n(Ll/u060;)V

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

.method public final l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f160;->a(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m(Ll/bnl0$g;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->i:Ll/bnl0$g;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->c:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-static {v2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iput-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->i:Ll/bnl0$g;

    .line 16
    .line 17
    :cond_0
    new-instance v9, Landroid/view/animation/LinearInterpolator;

    .line 18
    .line 19
    invoke-direct {v9}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->c:Lv/VDraweeView;

    .line 23
    .line 24
    sget-object v4, Ll/gt0;->i:Landroid/util/Property;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    new-array v10, v2, [F

    .line 28
    .line 29
    fill-array-data v10, :array_0

    .line 30
    .line 31
    .line 32
    const-wide/16 v5, 0x0

    .line 33
    .line 34
    const-wide/16 v7, -0x1

    .line 35
    .line 36
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    move-result-object v11

    .line 40
    iget-object v12, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->g:Lv/VMarqueeText;

    .line 41
    .line 42
    new-instance v18, Landroid/view/animation/LinearInterpolator;

    .line 43
    .line 44
    invoke-direct/range {v18 .. v18}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 45
    .line 46
    .line 47
    new-array v3, v2, [F

    .line 48
    .line 49
    fill-array-data v3, :array_1

    .line 50
    .line 51
    .line 52
    const-string v13, "alpha"

    .line 53
    .line 54
    const-wide/16 v14, 0x0

    .line 55
    .line 56
    const-wide/16 v16, -0x1

    .line 57
    .line 58
    move-object/from16 v19, v3

    .line 59
    .line 60
    invoke-static/range {v12 .. v19}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 61
    .line 62
    .line 63
    move-result-object v12

    .line 64
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->c:Lv/VDraweeView;

    .line 65
    .line 66
    iget v4, v1, Ll/bnl0$g;->a:I

    .line 67
    .line 68
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->i:Ll/bnl0$g;

    .line 69
    .line 70
    iget v5, v5, Ll/bnl0$g;->a:I

    .line 71
    .line 72
    sub-int/2addr v4, v5

    .line 73
    int-to-float v4, v4

    .line 74
    new-array v10, v2, [F

    .line 75
    .line 76
    const/4 v13, 0x0

    .line 77
    aput v4, v10, v13

    .line 78
    .line 79
    const/4 v14, 0x1

    .line 80
    const/4 v15, 0x0

    .line 81
    aput v15, v10, v14

    .line 82
    .line 83
    const-string v4, "translationX"

    .line 84
    .line 85
    const-wide/16 v5, 0x0

    .line 86
    .line 87
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    move-object v4, v3

    .line 92
    iget-object v3, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->c:Lv/VDraweeView;

    .line 93
    .line 94
    iget v1, v1, Ll/bnl0$g;->b:I

    .line 95
    .line 96
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->i:Ll/bnl0$g;

    .line 97
    .line 98
    iget v5, v5, Ll/bnl0$g;->b:I

    .line 99
    .line 100
    sub-int/2addr v1, v5

    .line 101
    int-to-float v1, v1

    .line 102
    new-array v10, v2, [F

    .line 103
    .line 104
    aput v1, v10, v13

    .line 105
    .line 106
    aput v15, v10, v14

    .line 107
    .line 108
    move-object v1, v4

    .line 109
    const-string v4, "translationY"

    .line 110
    .line 111
    const-wide/16 v5, 0x0

    .line 112
    .line 113
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    filled-new-array {v11, v12, v1, v2}, [Landroid/animation/Animator;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const-wide/16 v2, 0x96

    .line 122
    .line 123
    invoke-static {v2, v3, v1}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    new-instance v2, Ll/z060;

    .line 128
    .line 129
    invoke-direct {v2, v0}, Ll/z060;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;)V

    .line 130
    .line 131
    .line 132
    invoke-static {v1, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->l:Landroid/animation/Animator;

    .line 137
    .line 138
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    nop

    .line 143
    :array_0
    .array-data 4
        0x3f400000    # 0.75f
        0x3f800000    # 1.0f
    .end array-data

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public n(Ll/u060;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 2
    .line 3
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->l(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/x060;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/x060;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u060;->n()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->refreshOperationMessage()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/q260$a;

    .line 14
    .line 15
    const/16 v1, 0x1fa4

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/q260$a;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/q260$a;->a()Ll/q260;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setCountDownText(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->g:Lv/VMarqueeText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->g:Lv/VMarqueeText;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setViewForReady(Z)V
    .locals 8

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 4
    .line 5
    sget-object v6, Ll/gt0;->d:Landroid/view/animation/Interpolator;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    new-array v7, p1, [F

    .line 9
    .line 10
    fill-array-data v7, :array_0

    .line 11
    .line 12
    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    const-wide/16 v4, 0x12c

    .line 16
    .line 17
    move-object v0, p0

    .line 18
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 23
    .line 24
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 25
    .line 26
    .line 27
    new-array v7, p1, [F

    .line 28
    .line 29
    fill-array-data v7, :array_1

    .line 30
    .line 31
    .line 32
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 33
    .line 34
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    filled-new-array {p0, p1}, [Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance p1, Ll/w060;

    .line 47
    .line 48
    invoke-direct {p1, v0}, Ll/w060;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iput-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->m:Landroid/animation/Animator;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    move-object v0, p0

    .line 62
    const/high16 p0, 0x3f800000    # 1.0f

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Landroid/view/View;->setScaleX(F)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, p0}, Landroid/view/View;->setScaleY(F)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, p0}, Landroid/view/View;->setAlpha(F)V

    .line 71
    .line 72
    .line 73
    iget-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 74
    .line 75
    const/4 p1, 0x0

    .line 76
    invoke-virtual {p0, p1}, Ll/u060;->G4(Z)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    nop

    .line 81
    :array_0
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f800000    # 1.0f
    .end array-data

    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    :array_1
    .array-data 4
        0x0
        0x437f0000    # 255.0f
    .end array-data
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->d:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationCountDownCircleView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/u060;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 10
    .line 11
    new-instance v1, Ll/d160;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/d160;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V

    .line 14
    .line 15
    .line 16
    const-wide/16 p0, 0xc8

    .line 17
    .line 18
    invoke-virtual {v0, p0, p1, v1}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 23
    .line 24
    const-string p1, "OperationItemView: renderCircleCountDown presenter null"

    .line 25
    .line 26
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->f:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->f:Lv/VText;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;->content:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;->foreColor:Ljava/lang/String;

    .line 15
    .line 16
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;->foreTransparency:I

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/ynp0;->o(Ljava/lang/String;I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->f:Lv/VText;

    .line 23
    .line 24
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;->backColor:Ljava/lang/String;

    .line 32
    .line 33
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;->backTransparency:I

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/ynp0;->o(Ljava/lang/String;I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/4 v1, 0x5

    .line 40
    invoke-static {v0, v1}, Ll/gc2;->b(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->f:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->getOperationLeftMargin()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->f:Lv/VText;

    .line 54
    .line 55
    const/4 v2, 0x0

    .line 56
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemLabel;->isTopLeft()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->f:Lv/VText;

    .line 64
    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    sget p1, Ll/qa00;->e:I

    .line 68
    .line 69
    sub-int/2addr v0, p1

    .line 70
    invoke-static {p0, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    const/high16 p1, 0x41980000    # 19.0f

    .line 75
    .line 76
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    add-int/2addr v0, p1

    .line 81
    invoke-static {p0, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;->size:I

    .line 8
    .line 9
    int-to-float v0, v0

    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 15
    .line 16
    new-array v1, v1, [Landroid/view/View;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    aput-object v2, v1, v3

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    int-to-float v1, v0

    .line 30
    const/high16 v2, 0x40000000    # 2.0f

    .line 31
    .line 32
    div-float/2addr v1, v2

    .line 33
    invoke-static {v1}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 38
    .line 39
    invoke-virtual {v2}, Ll/am2;->l()Ll/xlj;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2, v1}, Ll/xlj;->K(Lcom/facebook/drawee/generic/RoundingParams;)Ll/xlj;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Ll/xlj;->a()Ll/wlj;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-virtual {v2, v1}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 57
    .line 58
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;->maskUrl:Ljava/lang/String;

    .line 59
    .line 60
    const-string v4, "context_livingAct"

    .line 61
    .line 62
    invoke-static {v4, v1, v2, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->getOperationLeftMargin()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;->isTopLeft()Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-eqz v2, :cond_0

    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 76
    .line 77
    sget v0, Ll/qa00;->e:I

    .line 78
    .line 79
    sub-int/2addr v1, v0

    .line 80
    invoke-static {p1, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-static {p0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;->isTopRight()Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_1

    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 96
    .line 97
    const/high16 v2, 0x42100000    # 36.0f

    .line 98
    .line 99
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    add-int/2addr v1, v2

    .line 104
    sub-int/2addr v1, v0

    .line 105
    invoke-static {p1, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 109
    .line 110
    invoke-static {p0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;->isTopMiddle()Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 119
    .line 120
    const/high16 v4, 0x41800000    # 16.0f

    .line 121
    .line 122
    if-eqz p1, :cond_2

    .line 123
    .line 124
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    add-int/2addr v1, p1

    .line 129
    div-int/lit8 v0, v0, 0x2

    .line 130
    .line 131
    sub-int/2addr v1, v0

    .line 132
    invoke-static {v2, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 136
    .line 137
    invoke-static {p0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_2
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    add-int/2addr v1, p1

    .line 146
    div-int/lit8 v0, v0, 0x2

    .line 147
    .line 148
    sub-int/2addr v1, v0

    .line 149
    invoke-static {v2, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->e:Lv/VDraweeView;

    .line 153
    .line 154
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->b:Landroid/widget/RelativeLayout;

    .line 155
    .line 156
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    div-int/lit8 p0, p0, 0x2

    .line 161
    .line 162
    sub-int/2addr p0, v0

    .line 163
    invoke-static {p1, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public final synthetic z()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Ll/u060;->G4(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 11
    .line 12
    new-instance v1, Ll/a260;

    .line 13
    .line 14
    const/16 v2, 0x1fa4

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ll/a260;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/u060;->p4()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->enableEntranceAnim()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->h:Ll/u060;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/u060;->H4()V

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_0
    return-void
.end method
