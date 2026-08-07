.class public Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/bvl;
.implements Landroid/animation/Animator$AnimatorListener;


# static fields
.field public static H:I


# instance fields
.field public A:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public B:Ljava/lang/String;

.field public C:Ljava/lang/Boolean;

.field public D:Z

.field public E:Ll/x20;

.field public F:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public G:I

.field public a:Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;

.field public b:Lv/VFrame;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Lv/VFrame_FlipContainer;

.field public f:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

.field public i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

.field public j:Lv/VFrame_FlipContainer;

.field public k:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public l:Lv/VText;

.field public m:Lv/VFrame;

.field public n:Lv/VImage;

.field public o:Lv/VFrame_Shadow;

.field public p:Lv/VLinear;

.field public q:Lv/VImage;

.field public r:Lv/VText;

.field public s:Lv/VLinear;

.field public t:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

.field public u:Lv/VLinear;

.field public v:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public w:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public x:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public y:Lv/VLinear;

.field public z:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x42a00000    # 80.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->H:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$1;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$1;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->z:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$2;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$2;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->A:Ljava/util/HashMap;

    .line 17
    .line 18
    const-string p1, "default"

    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->B:Ljava/lang/String;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->C:Ljava/lang/Boolean;

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->D:Z

    .line 27
    .line 28
    const/4 p1, -0x1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->G:I

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 32
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$1;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$1;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->z:Ljava/util/HashMap;

    .line 34
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$2;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$2;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->A:Ljava/util/HashMap;

    .line 35
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->B:Ljava/lang/String;

    const/4 p1, 0x0

    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->C:Ljava/lang/Boolean;

    const/4 p1, 0x1

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->D:Z

    const/4 p1, -0x1

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->G:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 39
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$1;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$1;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->z:Ljava/util/HashMap;

    .line 41
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$2;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$2;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->A:Ljava/util/HashMap;

    .line 42
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->B:Ljava/lang/String;

    const/4 p1, 0x0

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->C:Ljava/lang/Boolean;

    const/4 p1, 0x1

    .line 44
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->D:Z

    const/4 p1, -0x1

    .line 45
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->G:I

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->r(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->o(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->n(Landroid/view/View;)V

    return-void
.end method

.method private k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->w:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    new-instance v1, Ll/w7l;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/w7l;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->o:Lv/VFrame_Shadow;

    .line 12
    .line 13
    new-instance v1, Ll/x7l;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/x7l;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->y:Lv/VLinear;

    .line 22
    .line 23
    new-instance v1, Ll/y7l;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/y7l;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->s:Lv/VLinear;

    .line 32
    .line 33
    new-instance v1, Ll/z7l;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/z7l;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->x:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 42
    .line 43
    new-instance v1, Ll/a8l;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/a8l;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->v:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 52
    .line 53
    new-instance v1, Ll/b8l;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/b8l;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private l()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->x:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    const/high16 v1, 0x40400000    # 3.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->setShadowSize(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->w:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->setShadowSize(F)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->v:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->setShadowSize(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "e_superlikebutton_bottom"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->f:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic o(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "e_superlikebutton_mid"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->f:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "e_odiamond_sayhi_bottom"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->E:Ll/x20;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->E:Ll/x20;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private synthetic r(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->h:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private t()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->w()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->j(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private u()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->C:Ljava/lang/Boolean;

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
    sget-object v0, Ll/a6l;->INSTANCE:Ll/a6l;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->B:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->C:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v0, v1, v2, v3, p0}, Ll/a6l;->a(Landroid/content/Context;Lcom/tantan/library/svga/SVGAnimationView;Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public getButtonRadius()I
    .locals 0

    .line 1
    const/high16 p0, 0x41d80000    # 27.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getButtonRootLayout()Landroid/view/ViewGroup;
    .locals 0

    return-object p0
.end method

.method public getButtonScrolledDistance()I
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->H:I

    .line 2
    .line 3
    return p0
.end method

.method public getButtonsRightLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->b:Lv/VFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDislikeBtn()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDislikePressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->j4:I

    .line 2
    .line 3
    return p0
.end method

.method public getFourButtonsLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->u:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImmediatelyAndSuperLikeLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->m:Lv/VFrame;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImmediatelyMatch()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->s:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic getImmediatelyMatchButton()Ll/avl;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getImmediatelyMatchButton()Ll/avl;

    move-result-object p0

    return-object p0
.end method

.method public getLikeBtn()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->h:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLikePressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->u2:I

    .line 2
    .line 3
    return p0
.end method

.method public getNormalBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->Z1:I

    .line 2
    .line 3
    return p0
.end method

.method public getOperationBtnBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->Z1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic getPinImage()Lv/VImage;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getPinImage()Lv/VImage;

    move-result-object p0

    return-object p0
.end method

.method public getPinLikeLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public bridge synthetic getPinText()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getPinText()Lv/VText;

    move-result-object p0

    return-object p0
.end method

.method public getRootBtnLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 2

    .line 1
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    const/4 v1, -0x2

    .line 5
    invoke-direct {p0, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 10
    .line 11
    const/16 v0, 0x55

    .line 12
    .line 13
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 14
    .line 15
    return-object p0
.end method

.method public bridge synthetic getSayHiNewLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getSayHiNewLayout()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public getSuperLike()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->f:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeLayout()Lv/VFrame_FlipContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->e:Lv/VFrame_FlipContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikePressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->q3:I

    .line 2
    .line 3
    return p0
.end method

.method public getSuperLikeRemaining()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->g:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeWarpLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUndo()Ll/avl;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->k:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUndoLayout()Lv/VFrame_FlipContainer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->j:Lv/VFrame_FlipContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUndoPressBg()I
    .locals 0

    .line 1
    sget p0, Ll/dbc0;->j4:I

    .line 2
    .line 3
    return p0
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/c8l;->a(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->u:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final m()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->F:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    sget-object v0, Ll/f760;->Companion:Ll/f760$a;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->F:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ll/f760$a;->k(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->F:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->getRenderUser()Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->F:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, p0}, Ll/f760$a;->i(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_2

    .line 41
    .line 42
    :cond_1
    const/4 p0, 0x1

    .line 43
    return p0

    .line 44
    :cond_2
    return v1
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/16 p1, 0x8

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->a:Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Landroid/animation/LayoutTransition;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 16
    .line 17
    .line 18
    const-wide/16 v2, 0x0

    .line 19
    .line 20
    invoke-virtual {v0, v2, v3}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 21
    .line 22
    .line 23
    const-wide/16 v2, 0x96

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2, v3}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 26
    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {v0, v1, v2, v3}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->t()V

    .line 36
    .line 37
    .line 38
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->l()V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->k()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    cmpl-float v0, v0, v1

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "e_odiamond_sayhi_mid"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->E:Ll/x20;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->E:Ll/x20;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/x20;->call()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public setButtonStyleType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->B:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->t()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->u()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setImmediatelyMatchClickCallBack(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->E:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setSuperLikeBtnGray(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->c:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->m()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v1, 0x0

    .line 14
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->h:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 18
    .line 19
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->q:Lv/VImage;

    .line 23
    .line 24
    const/high16 v1, 0x3f800000    # 1.0f

    .line 25
    .line 26
    const v2, 0x3e99999a    # 0.3f

    .line 27
    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    move v3, v2

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    move v3, v1

    .line 34
    :goto_1
    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->r:Lv/VText;

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    move v3, v2

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v3, v1

    .line 44
    :goto_2
    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->w:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 48
    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    move v1, v2

    .line 52
    :cond_3
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->setIconAlpha(F)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public setSuperLikeComboIsSlowly(Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->C:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->u()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setUserInfo(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->F:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setVisibility(I)V
    .locals 5

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    cmpl-float v1, v1, v0

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/16 v2, 0x8

    .line 22
    .line 23
    if-ne p1, v2, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    :cond_1
    const/4 v3, 0x2

    .line 27
    new-array v3, v3, [F

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    aput v1, v3, v4

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    aput v0, v3, v1

    .line 34
    .line 35
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 36
    .line 37
    invoke-static {p0, v0, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-wide/16 v3, 0x96

    .line 42
    .line 43
    invoke-virtual {v0, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    if-ne p1, v2, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final v(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0xe

    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->f(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x0

    .line 21
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->t:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 49
    .line 50
    float-to-int v1, v2

    .line 51
    const/high16 v2, 0x40000000    # 2.0f

    .line 52
    .line 53
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    add-int/2addr v1, v2

    .line 58
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->t:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->t:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->i()V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->t:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setTextList(Ljava/util/List;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->t:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 76
    .line 77
    const/high16 v0, 0x3f000000    # 0.5f

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setOutTranslateY(F)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->t:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setAnimateDirection(Z)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->t:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 89
    .line 90
    const-wide/16 v0, 0x12c

    .line 91
    .line 92
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setInOutAnimation(J)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->t:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->h()V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public final w()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->D:Z

    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "\u4e00\u952e\u914d\u5bf9"

    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->v(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->n:Lv/VImage;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->B:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const v2, -0x2f7ed21b

    .line 30
    .line 31
    .line 32
    if-eq v1, v2, :cond_2

    .line 33
    .line 34
    const v2, -0x2a0373d1

    .line 35
    .line 36
    .line 37
    if-eq v1, v2, :cond_1

    .line 38
    .line 39
    const v2, 0x5c13d641

    .line 40
    .line 41
    .line 42
    if-eq v1, v2, :cond_0

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    const-string v1, "default"

    .line 46
    .line 47
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    const-string v1, "supremePartner"

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const-string v1, "oDiamond"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_3

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->p:Lv/VLinear;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    sget v2, Ll/dbc0;->R2:I

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->q:Lv/VImage;

    .line 79
    .line 80
    sget v1, Ll/dbc0;->wi:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->q:Lv/VImage;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const/high16 v1, 0x41a00000    # 20.0f

    .line 92
    .line 93
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->q:Lv/VImage;

    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->q:Lv/VImage;

    .line 112
    .line 113
    const/high16 v1, 0x40000000    # 2.0f

    .line 114
    .line 115
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->r:Lv/VText;

    .line 123
    .line 124
    const/high16 v1, 0x41000000    # 8.0f

    .line 125
    .line 126
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->r:Lv/VText;

    .line 134
    .line 135
    const-string v0, "#E8CA8A"

    .line 136
    .line 137
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->p:Lv/VLinear;

    .line 146
    .line 147
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    sget v2, Ll/dbc0;->Lr:I

    .line 152
    .line 153
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->q:Lv/VImage;

    .line 161
    .line 162
    sget v1, Ll/dbc0;->vi:I

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->q:Lv/VImage;

    .line 168
    .line 169
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    const/high16 v1, 0x41c00000    # 24.0f

    .line 174
    .line 175
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 180
    .line 181
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->q:Lv/VImage;

    .line 182
    .line 183
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 192
    .line 193
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->q:Lv/VImage;

    .line 194
    .line 195
    const/4 v1, 0x0

    .line 196
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->r:Lv/VText;

    .line 204
    .line 205
    const/high16 v1, 0x40c00000    # 6.0f

    .line 206
    .line 207
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 212
    .line 213
    .line 214
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->r:Lv/VText;

    .line 215
    .line 216
    const-string v0, "#ffffff"

    .line 217
    .line 218
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 223
    .line 224
    .line 225
    return-void
.end method

.method public x(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->b:Lv/VFrame;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->b:Lv/VFrame;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const/4 p1, 0x4

    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final y(Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p0, "p_suggest_users_home_view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final z()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->h:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->z:Ljava/util/HashMap;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->B:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ll/pf60;

    .line 12
    .line 13
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, Ljava/lang/String;

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->z:Ljava/util/HashMap;

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->B:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ll/pf60;

    .line 26
    .line 27
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v2, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->f:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->A:Ljava/util/HashMap;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->B:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Ll/pf60;

    .line 45
    .line 46
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v1, Ljava/lang/String;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->A:Ljava/util/HashMap;

    .line 51
    .line 52
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->B:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Ll/pf60;

    .line 59
    .line 60
    iget-object v2, v2, Ll/pf60;->b:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast v2, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationButton;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->m()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    xor-int/lit8 v0, v0, 0x1

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;->x(Z)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
