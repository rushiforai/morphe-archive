.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/bvl;
.implements Landroid/animation/Animator$AnimatorListener;
.implements Ll/emf;


# static fields
.field public static final w:I


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;

.field public b:Lv/VRelative;

.field public c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Lv/VFrame_FlipContainer;

.field public g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

.field public j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

.field public k:Lv/VFrame_FlipContainer;

.field public l:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

.field public m:Lv/VText;

.field public n:Lv/VLinear;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;

.field public q:Ljava/lang/Boolean;

.field public r:Lcom/tantanapp/media/ttmediautils/download/Action1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final s:Ljava/util/HashMap;
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

.field public final t:Ljava/util/HashMap;
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

.field public final u:Ljava/util/HashMap;
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

.field public final v:Ljava/util/HashMap;
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
    sput v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->w:I

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
    const-string p1, "default"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "unknown"

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->p:Ljava/lang/String;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->q:Ljava/lang/Boolean;

    .line 14
    .line 15
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$1;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$1;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->s:Ljava/util/HashMap;

    .line 21
    .line 22
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$2;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$2;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->t:Ljava/util/HashMap;

    .line 28
    .line 29
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$3;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$3;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->u:Ljava/util/HashMap;

    .line 35
    .line 36
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$4;

    .line 37
    .line 38
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$4;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->v:Ljava/util/HashMap;

    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 45
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 46
    const-string p1, "unknown"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->p:Ljava/lang/String;

    const/4 p1, 0x0

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->q:Ljava/lang/Boolean;

    .line 48
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$1;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$1;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->s:Ljava/util/HashMap;

    .line 49
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$2;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$2;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->t:Ljava/util/HashMap;

    .line 50
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$3;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$3;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->u:Ljava/util/HashMap;

    .line 51
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$4;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$4;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->v:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 52
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 53
    const-string p1, "default"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 54
    const-string p1, "unknown"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->p:Ljava/lang/String;

    const/4 p1, 0x0

    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->q:Ljava/lang/Boolean;

    .line 56
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$1;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$1;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->s:Ljava/util/HashMap;

    .line 57
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$2;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$2;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->t:Ljava/util/HashMap;

    .line 58
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$3;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$3;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->u:Ljava/util/HashMap;

    .line 59
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$4;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons$4;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->v:Ljava/util/HashMap;

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->i(Landroid/view/View;)V

    return-void
.end method

.method private f()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 7
    .line 8
    invoke-static {}, Ll/spl0;->G()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->d:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    invoke-static {}, Ll/spl0;->G()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/high16 v2, 0x41a00000    # 20.0f

    .line 22
    .line 23
    const/high16 v3, 0x41400000    # 12.0f

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 40
    .line 41
    invoke-static {}, Ll/spl0;->G()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    :goto_1
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 60
    .line 61
    invoke-static {}, Ll/spl0;->G()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    goto :goto_2

    .line 72
    :cond_2
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    :goto_2
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private g()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->n:Lv/VLinear;

    .line 2
    .line 3
    new-instance v1, Ll/g6l;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/g6l;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 12
    .line 13
    new-instance v1, Ll/h6l;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/h6l;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->r:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/gra;->K1()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->r3()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    const-string p0, "\u53ea\u770b\u8ba4\u8bc1\u7528\u6237\u8bd5\u7528\u671f\u95f4\u65e0\u6cd5\u4f7f\u7528\u4e00\u952e\u914d\u5bf9\u529f\u80fd"

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->r:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 32
    .line 33
    const-string p1, "p_home,odiamond_sayhi"

    .line 34
    .line 35
    invoke-interface {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action1;->call(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->K1()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->r3()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p0, "\u53ea\u770b\u8ba4\u8bc1\u7528\u6237\u8bd5\u7528\u671f\u95f4\u65e0\u6cd5\u4f7f\u7528\u4e00\u952e\u914d\u5bf9\u529f\u80fd"

    .line 18
    .line 19
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->r:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 32
    .line 33
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->r:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 40
    .line 41
    const-string p1, "p_home,odiamond_sayhi"

    .line 42
    .line 43
    invoke-interface {p0, p1}, Lcom/tantanapp/media/ttmediautils/download/Action1;->call(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    const-string p0, "e_odiamond_sayhi"

    .line 47
    .line 48
    const-string p1, "p_suggest_users_home_view"

    .line 49
    .line 50
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method private j()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->p:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string v0, "oDiamond"

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 23
    .line 24
    sget v1, Ll/dbc0;->l7:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 30
    .line 31
    sget v1, Ll/dbc0;->m7:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 37
    .line 38
    sget v1, Ll/dbc0;->o7:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 44
    .line 45
    sget v1, Ll/dbc0;->n7:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const-string v0, "supremePartner"

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 60
    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    sget v0, Ll/dbc0;->t7:I

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 69
    .line 70
    sget v1, Ll/dbc0;->u7:I

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 76
    .line 77
    sget v1, Ll/dbc0;->v7:I

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 83
    .line 84
    sget v1, Ll/dbc0;->s7:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    sget v0, Ll/dbc0;->Vs:I

    .line 91
    .line 92
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 96
    .line 97
    sget v1, Ll/dbc0;->Ws:I

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 103
    .line 104
    sget v1, Ll/dbc0;->Xs:I

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 110
    .line 111
    sget v1, Ll/dbc0;->j7:I

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setPlaceHolderPic(I)V

    .line 114
    .line 115
    .line 116
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->u:Ljava/util/HashMap;

    .line 119
    .line 120
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    check-cast v1, Ll/pf60;

    .line 127
    .line 128
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->n(Ll/pf60;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->v:Ljava/util/HashMap;

    .line 136
    .line 137
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    check-cast v1, Ll/pf60;

    .line 144
    .line 145
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->n(Ll/pf60;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->s:Ljava/util/HashMap;

    .line 153
    .line 154
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    check-cast v1, Ll/pf60;

    .line 161
    .line 162
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 163
    .line 164
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->n(Ll/pf60;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->t:Ljava/util/HashMap;

    .line 170
    .line 171
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    check-cast v1, Ll/pf60;

    .line 178
    .line 179
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->n(Ll/pf60;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 185
    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->p:Ljava/lang/String;

    .line 187
    .line 188
    return-void
.end method

.method private k()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->q:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->q:Ljava/lang/Boolean;

    .line 12
    .line 13
    const-string v2, "oDiamond"

    .line 14
    .line 15
    if-ne v0, v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string v0, "https://auto.tancdn.com/v1/raw/d8ca1b08-eb07-467e-9084-f8649aeaa1d814.pdf"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v0, "https://auto.tancdn.com/v1/raw/882ec896-df41-439c-a0af-1e10180e7d8414.pdf"

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    const-string v0, "https://auto.tancdn.com/v1/raw/cbbe7076-35a9-49cb-b736-352be2188deb14.svga"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const-string v0, "https://auto.tancdn.com/v1/raw/e5ff8681-8576-476a-a5b7-ecb3b930261414.svga"

    .line 39
    .line 40
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/4 v1, 0x1

    .line 53
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, -0x1

    .line 58
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 67
    .line 68
    .line 69
    :cond_3
    return-void
.end method

.method private setSwipeAnimEnable(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setSwipeEnable(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setSwipeEnable(Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p1, 0x0

    .line 16
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setSwipeEnable(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setSwipeEnable(Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i6l;->a(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

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
    sget p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public getButtonsRightLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->b:Lv/VRelative;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDislikeBtn()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

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

.method public bridge synthetic getImmediatelyAndSuperLikeLayout()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/bvl;->getImmediatelyAndSuperLikeLayout()Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public getImmediatelyMatch()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->n:Lv/VLinear;

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

.method public getImmediatelyMatchTop()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLikeBtn()Ll/avl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

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

.method public getPinImage()Lv/VImage;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getPinLikeLayout()Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getPinText()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public getRootBtnLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 1

    .line 1
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-direct {p0, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 9
    .line 10
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 11
    .line 12
    const/16 v0, 0x55

    .line 13
    .line 14
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 15
    .line 16
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeComboSvga()Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeLayout()Lv/VFrame_FlipContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->f:Lv/VFrame_FlipContainer;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->h:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuperLikeWarpLayout()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->d:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUndo()Ll/avl;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->l:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUndoLayout()Lv/VFrame_FlipContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->k:Lv/VFrame_FlipContainer;

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

.method public l()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const-string v2, "bubble_odiamond_immediate_match_guide"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/high16 v1, 0x40000000    # 2.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v3, "\u65e0\u9700\u914d\u5bf9\uff0c\u76f4\u63a5\u5f00\u804a"

    .line 30
    .line 31
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget v4, Ll/c9c0;->I:I

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    filled-new-array {v3}, [I

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const/high16 v3, 0x41500000    # 13.0f

    .line 58
    .line 59
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/high16 v3, 0x40e00000    # 7.0f

    .line 64
    .line 65
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    const/16 v3, 0x4b

    .line 74
    .line 75
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const/high16 v3, -0x3f800000    # -4.0f

    .line 80
    .line 81
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 90
    .line 91
    const/high16 v4, 0x41a00000    # 20.0f

    .line 92
    .line 93
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    invoke-virtual {v1, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const-wide/16 v3, 0x1f40

    .line 102
    .line 103
    invoke-virtual {v1, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 108
    .line 109
    sget v4, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 110
    .line 111
    or-int/2addr v3, v4

    .line 112
    invoke-virtual {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 113
    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 120
    .line 121
    invoke-virtual {v1, v0, p0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    invoke-static {}, Ll/spl0;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/b;->q()Lcom/p1/mobile/putong/core/ui/match/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/match/b;->p()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x7

    .line 16
    if-gt v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    iget-object v0, v0, Ll/dkb;->A6:Ll/jxd0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->l()V

    .line 38
    .line 39
    .line 40
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    iget-object p0, p0, Ll/dkb;->A6:Ll/jxd0;

    .line 45
    .line 46
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
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
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->b:Lv/VRelative;

    .line 8
    .line 9
    const/high16 v1, 0x42ac0000    # 86.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->a:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->l:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 25
    .line 26
    const/high16 v2, 0x40000000    # 2.0f

    .line 27
    .line 28
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    int-to-float v2, v2

    .line 33
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->setShadowSize(F)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->setSwipeAnimEnable(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->i:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 41
    .line 42
    const-string v3, "\u559c\u6b22"

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setFlagName(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->j:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 48
    .line 49
    const-string v3, "\u4e0d\u559c\u6b22"

    .line 50
    .line 51
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setFlagName(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 55
    .line 56
    const-string v3, "\u8d85\u7ea7\u559c\u6b22"

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setFlagName(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->c:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 62
    .line 63
    const-string v3, "\u9ed1\u91d1"

    .line 64
    .line 65
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setFlagName(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    new-instance v2, Landroid/animation/LayoutTransition;

    .line 69
    .line 70
    invoke-direct {v2}, Landroid/animation/LayoutTransition;-><init>()V

    .line 71
    .line 72
    .line 73
    const-wide/16 v3, 0x0

    .line 74
    .line 75
    invoke-virtual {v2, v3, v4}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 76
    .line 77
    .line 78
    const-wide/16 v3, 0x96

    .line 79
    .line 80
    invoke-virtual {v2, v1, v3, v4}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, v0, v3, v4}, Landroid/animation/LayoutTransition;->setDuration(IJ)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 87
    .line 88
    .line 89
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->g()V

    .line 90
    .line 91
    .line 92
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->f()V

    .line 93
    .line 94
    .line 95
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->j()V

    .line 96
    .line 97
    .line 98
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

.method public setButtonStyleType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->j()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->k()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->m()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setImmediateleMatchClickListener(Lcom/tantanapp/media/ttmediautils/download/Action1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/media/ttmediautils/download/Action1<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->r:Lcom/tantanapp/media/ttmediautils/download/Action1;

    .line 2
    .line 3
    return-void
.end method

.method public setSuperLikeBtnGray(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->g:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget p1, Ll/dbc0;->Ts:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedOperationNewUiButton;->setCoverDrawable(I)V

    .line 12
    .line 13
    .line 14
    :cond_1
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->q:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeCardExpandedNewUiButtons;->k()V

    .line 8
    .line 9
    .line 10
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
