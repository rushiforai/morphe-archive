.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public A:Ll/wbe;

.field public B:Ll/xbe;

.field public C:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;",
            ">;"
        }
    .end annotation
.end field

.field public D:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ll/bce;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Landroid/view/View;

.field public e:Landroid/view/View;

.field public f:Lv/VText;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Lv/VImage;

.field public l:Lv/VImage;

.field public m:Lv/VImage;

.field public n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

.field public o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public p:Lv/VText;

.field public q:Landroid/view/View;

.field public r:Landroid/view/View;

.field public s:Landroid/widget/Space;

.field public t:Landroid/widget/Space;

.field public u:Lv/VText;

.field public v:Lv/VPager;

.field public w:Lv/VPagerCircleIndicator;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->D:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->D:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->D:Ljava/util/HashMap;

    return-void
.end method

.method private synthetic D0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getFirstTemple()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic E0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getSecondTemple()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic G0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getThirdTemple()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->y0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->w0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Ll/bce;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bce;->b:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/gbe;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/gbe;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic k0(Ljava/lang/Integer;Ll/y20;)V
    .locals 0

    .line 1
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->D0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->E0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n0(Ll/qbe;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/qbe;->b:Z

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o0(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->v0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->B0(Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r0(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->G0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->z0(Ljava/lang/Integer;)V

    return-void
.end method

.method private synthetic v0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->i()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic w0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->i()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->y()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic y0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->getForthTemple()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic B0(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->i()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ll/x20;->call()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public H0(Ll/qbe;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->B:Ll/xbe;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xbe;->a:Ljava/util/List;

    .line 4
    .line 5
    new-instance v0, Ll/cbe;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/cbe;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    iput-boolean p0, p1, Ll/qbe;->b:Z

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    iput p0, p1, Ll/qbe;->d:I

    .line 18
    .line 19
    return-void
.end method

.method public I0(Ll/xbe;Ll/z20;Ll/x20;Ll/x20;Ll/x20;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/xbe;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->C:Ll/z20;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->B:Ll/xbe;

    .line 4
    .line 5
    iget-object p2, p1, Ll/xbe;->b:Ll/jjs;

    .line 6
    .line 7
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->setGiftItem(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 12
    .line 13
    .line 14
    new-instance p2, Ll/wbe;

    .line 15
    .line 16
    invoke-direct {p2, p0}, Ll/wbe;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->A:Ll/wbe;

    .line 20
    .line 21
    invoke-virtual {p2, p1}, Ll/wbe;->t(Ll/xbe;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->v:Lv/VPager;

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->A:Ll/wbe;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->m:Lv/VImage;

    .line 32
    .line 33
    new-instance p2, Ll/hbe;

    .line 34
    .line 35
    invoke-direct {p2, p0}, Ll/hbe;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->u:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->W4:I

    .line 48
    .line 49
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/vwt;->g4()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->u:Lv/VText;

    .line 77
    .line 78
    const/4 p2, -0x1

    .line 79
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->l:Lv/VImage;

    .line 83
    .line 84
    new-instance v0, Ll/ibe;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/ibe;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 93
    .line 94
    new-instance v0, Ll/jbe;

    .line 95
    .line 96
    invoke-direct {v0, p0}, Ll/jbe;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->setNumberChageListener(Ll/y20;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->k:Lv/VImage;

    .line 103
    .line 104
    new-instance v0, Ll/kbe;

    .line 105
    .line 106
    invoke-direct {v0, p0, p5}, Ll/kbe;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Ll/x20;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->x:Lv/VText;

    .line 113
    .line 114
    new-instance p5, Ll/lbe;

    .line 115
    .line 116
    invoke-direct {p5, p3}, Ll/lbe;-><init>(Ll/x20;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, p5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->y:Lv/VText;

    .line 123
    .line 124
    new-instance p3, Ll/mbe;

    .line 125
    .line 126
    invoke-direct {p3, p4}, Ll/mbe;-><init>(Ll/x20;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 133
    .line 134
    new-instance p3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer$a;

    .line 135
    .line 136
    invoke-direct {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V

    .line 137
    .line 138
    .line 139
    const/4 p4, 0x1

    .line 140
    const-string p5, "https://auto.tancdn.com/v1/raw/800579c8-8a99-4f49-bd19-244e32b4fa2511.pdf"

    .line 141
    .line 142
    invoke-virtual {p1, p5, p2, p3, p4}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->i(Ljava/lang/String;ILl/wo0;Z)V

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->g:Lv/VImage;

    .line 146
    .line 147
    new-instance p2, Ll/nbe;

    .line 148
    .line 149
    invoke-direct {p2, p0}, Ll/nbe;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->h:Lv/VImage;

    .line 156
    .line 157
    new-instance p2, Ll/obe;

    .line 158
    .line 159
    invoke-direct {p2, p0}, Ll/obe;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->i:Lv/VImage;

    .line 166
    .line 167
    new-instance p2, Ll/dbe;

    .line 168
    .line 169
    invoke-direct {p2, p0}, Ll/dbe;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 173
    .line 174
    .line 175
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->j:Lv/VImage;

    .line 176
    .line 177
    new-instance p2, Ll/ebe;

    .line 178
    .line 179
    invoke-direct {p2, p0}, Ll/ebe;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public J0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->C:Ll/z20;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->z:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->getDrawParam()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {v0, v1, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->h()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->D:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->u0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setGiftItem(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawPanelView;->setGiftUrl(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->z:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 9
    .line 10
    return-void
.end method

.method public final u0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pbe;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z0(Ljava/lang/Integer;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->D:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/fbe;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/fbe;-><init>(Ljava/lang/Integer;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->m:Lv/VImage;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x1

    .line 23
    if-ge v0, v3, :cond_0

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->l:Lv/VImage;

    .line 29
    .line 30
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 34
    .line 35
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->p:Lv/VText;

    .line 39
    .line 40
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->l:Lv/VImage;

    .line 48
    .line 49
    invoke-static {v0, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 53
    .line 54
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->p:Lv/VText;

    .line 58
    .line 59
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1}, Ll/vwt;->g4()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-ge v0, v1, :cond_1

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->u:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->W4:I

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v1}, Ll/vwt;->g4()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->u:Lv/VText;

    .line 112
    .line 113
    const/4 p1, -0x1

    .line 114
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->z:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 119
    .line 120
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    invoke-static {v0, p1}, Ll/f3e;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;I)D

    .line 125
    .line 126
    .line 127
    move-result-wide v0

    .line 128
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Z4:I

    .line 133
    .line 134
    invoke-static {v0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Landroid/text/SpannableString;

    .line 139
    .line 140
    invoke-direct {v1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    add-int/2addr p1, v3

    .line 152
    new-instance v4, Landroid/text/style/ForegroundColorSpan;

    .line 153
    .line 154
    const-string v5, "#ffffffff"

    .line 155
    .line 156
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v6

    .line 160
    invoke-direct {v4, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 161
    .line 162
    .line 163
    const/16 v6, 0x11

    .line 164
    .line 165
    invoke-virtual {v1, v4, v2, v3, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 166
    .line 167
    .line 168
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 169
    .line 170
    const-string v4, "#ff8817"

    .line 171
    .line 172
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    move-result v4

    .line 176
    invoke-direct {v2, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, v2, v3, p1, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 180
    .line 181
    .line 182
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 183
    .line 184
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    invoke-virtual {v1, v2, p1, v0, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 196
    .line 197
    .line 198
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawGiftContainer;->u:Lv/VText;

    .line 199
    .line 200
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    .line 202
    .line 203
    return-void
.end method
