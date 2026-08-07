.class public Lcom/p1/mobile/putong/live/base/view/RollAnimView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;,
        Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lv/VFrame;"
    }
.end annotation


# instance fields
.field public a:I

.field public final b:F

.field public c:I

.field public d:I

.field public e:F

.field public f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/view/RollAnimView$a<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public g:Landroid/animation/Animator;

.field public h:Landroid/animation/Animator;

.field public i:Landroid/animation/Animator;

.field public final j:F

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/nsv<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public l:Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/live/base/view/RollAnimView<",
            "TT;>.b;"
        }
    .end annotation
.end field

.field public m:D

.field public n:I

.field public final o:Z

.field public final p:Z

.field public q:I

.field public r:I

.field public s:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public t:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Ll/nsv<",
            "TT;>;",
            "Lcom/p1/mobile/putong/live/base/view/RollItemView<",
            "TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 90
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 89
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->k:Ljava/util/List;

    .line 10
    .line 11
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->m:D

    .line 14
    .line 15
    const/16 p3, 0x7d0

    .line 16
    .line 17
    iput p3, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->n:I

    .line 18
    .line 19
    const/4 p3, 0x0

    .line 20
    iput p3, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->q:I

    .line 21
    .line 22
    sget-object v0, Ll/thc0;->O:[I

    .line 23
    .line 24
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget p2, Ll/thc0;->S:I

    .line 29
    .line 30
    const/4 v0, 0x3

    .line 31
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->c:I

    .line 36
    .line 37
    sget p2, Ll/thc0;->T:I

    .line 38
    .line 39
    const/high16 v0, 0x41000000    # 8.0f

    .line 40
    .line 41
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    int-to-float p2, p2

    .line 50
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->b:F

    .line 51
    .line 52
    sget p2, Ll/thc0;->R:I

    .line 53
    .line 54
    const/16 v0, 0x1e

    .line 55
    .line 56
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    int-to-float p2, p2

    .line 61
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->j:F

    .line 62
    .line 63
    sget p2, Ll/thc0;->Q:I

    .line 64
    .line 65
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->o:Z

    .line 70
    .line 71
    sget p2, Ll/thc0;->P:I

    .line 72
    .line 73
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->p:Z

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->B()V

    .line 83
    .line 84
    .line 85
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->r()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method private getNextUser()Ll/nsv;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/nsv<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->k:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->q:I

    .line 8
    .line 9
    add-int/lit8 v1, v1, 0x1

    .line 10
    .line 11
    iput v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->q:I

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lt v1, v0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->q:I

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->s:Ll/z20;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->s:Ll/z20;

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->q:I

    .line 33
    .line 34
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->k:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v0, v1, v2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->k:Ljava/util/List;

    .line 52
    .line 53
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->q:I

    .line 54
    .line 55
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Ll/nsv;

    .line 60
    .line 61
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/base/view/RollAnimView;Lcom/p1/mobile/putong/live/base/view/RollItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->F(Lcom/p1/mobile/putong/live/base/view/RollItemView;)V

    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->h:Landroid/animation/Animator;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->g:Landroid/animation/Animator;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->i:Landroid/animation/Animator;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->w([Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setChildrenDrawingOrderEnabled(Z)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic s(ILcom/p1/mobile/putong/live/base/view/RollAnimView$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->a:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/live/base/view/RollAnimView;ILcom/p1/mobile/putong/live/base/view/RollAnimView$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->E(ILcom/p1/mobile/putong/live/base/view/RollAnimView$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/live/base/view/RollAnimView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->n:I

    return p0
.end method


# virtual methods
.method public final B()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->j:F

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->a:I

    .line 8
    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->c:I

    .line 10
    .line 11
    add-int/lit8 v2, v1, 0x1

    .line 12
    .line 13
    iput v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->d:I

    .line 14
    .line 15
    mul-int/2addr v0, v1

    .line 16
    int-to-float v0, v0

    .line 17
    add-int/lit8 v2, v1, -0x1

    .line 18
    .line 19
    int-to-float v2, v2

    .line 20
    iget v3, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->b:F

    .line 21
    .line 22
    mul-float/2addr v2, v3

    .line 23
    sub-float/2addr v0, v2

    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->e:F

    .line 25
    .line 26
    add-int/lit8 v1, v1, -0x1

    .line 27
    .line 28
    iput v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->q:I

    .line 29
    .line 30
    new-instance v0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;-><init>(Lcom/p1/mobile/putong/live/base/view/RollAnimView;Ll/ldd0;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->l:Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;

    .line 37
    .line 38
    return-void
.end method

.method public C()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public final synthetic E(ILcom/p1/mobile/putong/live/base/view/RollAnimView$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->c:I

    .line 2
    .line 3
    iget p2, p2, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->a:I

    .line 4
    .line 5
    sub-int/2addr p0, p2

    .line 6
    if-ne p0, p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic F(Lcom/p1/mobile/putong/live/base/view/RollItemView;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->p:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setChildrenDrawingOrderEnabled(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public G(Ll/nsv;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "TT;>;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->d:I

    .line 8
    .line 9
    if-ge v0, v1, :cond_4

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->t:Ll/qcj;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/p1/mobile/putong/live/base/view/RollItemView;

    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;-><init>(Ll/ldd0;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->c:Lcom/p1/mobile/putong/live/base/view/RollItemView;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput v1, v0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->a:I

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput v1, v0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->b:I

    .line 42
    .line 43
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 44
    .line 45
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->a:I

    .line 46
    .line 47
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    const/4 v2, 0x1

    .line 65
    if-ne v1, v2, :cond_0

    .line 66
    .line 67
    const/high16 v0, 0x3f800000    # 1.0f

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    const/4 v1, 0x0

    .line 74
    if-eqz p2, :cond_1

    .line 75
    .line 76
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->K(Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    iget v4, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->d:I

    .line 90
    .line 91
    if-ne v3, v4, :cond_2

    .line 92
    .line 93
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    iget v0, v0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->a:I

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->z(I)F

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 104
    .line 105
    .line 106
    :goto_0
    if-eqz p2, :cond_4

    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 109
    .line 110
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    iget p2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->d:I

    .line 115
    .line 116
    const/4 v0, 0x0

    .line 117
    if-ne p1, p2, :cond_3

    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    check-cast p1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;

    .line 126
    .line 127
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->c:Lcom/p1/mobile/putong/live/base/view/RollItemView;

    .line 128
    .line 129
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->L(Lcom/p1/mobile/putong/live/base/view/RollItemView;)V

    .line 130
    .line 131
    .line 132
    :goto_1
    iget p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->c:I

    .line 133
    .line 134
    if-ge v2, p1, :cond_4

    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    check-cast p1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;

    .line 143
    .line 144
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->c:Lcom/p1/mobile/putong/live/base/view/RollItemView;

    .line 145
    .line 146
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->M(Landroid/view/View;)V

    .line 147
    .line 148
    .line 149
    add-int/lit8 v2, v2, 0x1

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_3
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    sub-int/2addr p1, v2

    .line 159
    if-ge v0, p1, :cond_4

    .line 160
    .line 161
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 162
    .line 163
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    check-cast p1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;

    .line 168
    .line 169
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->c:Lcom/p1/mobile/putong/live/base/view/RollItemView;

    .line 170
    .line 171
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->M(Landroid/view/View;)V

    .line 172
    .line 173
    .line 174
    add-int/lit8 v0, v0, 0x1

    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_4
    return-void
.end method

.method public final K(Landroid/view/View;)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->d:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    sub-int/2addr v0, v1

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->z(I)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->m:D

    .line 10
    .line 11
    const-wide/high16 v4, 0x4079000000000000L    # 400.0

    .line 12
    .line 13
    mul-double/2addr v2, v4

    .line 14
    double-to-long v2, v2

    .line 15
    const/4 v4, 0x2

    .line 16
    new-array v5, v4, [F

    .line 17
    .line 18
    fill-array-data v5, :array_0

    .line 19
    .line 20
    .line 21
    sget-object v6, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 22
    .line 23
    invoke-static {p1, v6, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    iget v6, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->a:I

    .line 28
    .line 29
    int-to-float v6, v6

    .line 30
    sub-float v6, v0, v6

    .line 31
    .line 32
    iget v7, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->b:F

    .line 33
    .line 34
    add-float/2addr v6, v7

    .line 35
    new-array v4, v4, [F

    .line 36
    .line 37
    const/4 v7, 0x0

    .line 38
    aput v0, v4, v7

    .line 39
    .line 40
    aput v6, v4, v1

    .line 41
    .line 42
    sget-object v0, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 43
    .line 44
    invoke-static {p1, v0, v4}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    filled-new-array {v5, p1}, [Landroid/animation/Animator;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {v2, v3, p1}, Ll/gt0;->x(J[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->g:Landroid/animation/Animator;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    nop

    .line 63
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final L(Lcom/p1/mobile/putong/live/base/view/RollItemView;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/view/RollItemView<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [F

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 8
    .line 9
    invoke-static {p1, v2, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->i:Landroid/animation/Animator;

    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->o:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->a:I

    .line 20
    .line 21
    neg-int v1, v1

    .line 22
    int-to-float v1, v1

    .line 23
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->b:F

    .line 24
    .line 25
    add-float/2addr v1, v2

    .line 26
    new-array v2, v0, [F

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    const/4 v4, 0x0

    .line 30
    aput v3, v2, v4

    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    aput v1, v2, v3

    .line 34
    .line 35
    sget-object v1, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 36
    .line 37
    invoke-static {p1, v1, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->i:Landroid/animation/Animator;

    .line 42
    .line 43
    filled-new-array {v2, v1}, [Landroid/animation/Animator;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->i:Landroid/animation/Animator;

    .line 52
    .line 53
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->p:Z

    .line 54
    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 58
    .line 59
    new-array v0, v0, [F

    .line 60
    .line 61
    fill-array-data v0, :array_1

    .line 62
    .line 63
    .line 64
    invoke-static {p1, v1, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->i:Landroid/animation/Animator;

    .line 69
    .line 70
    filled-new-array {v1, v0}, [Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->i:Landroid/animation/Animator;

    .line 79
    .line 80
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->i:Landroid/animation/Animator;

    .line 81
    .line 82
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->m:D

    .line 83
    .line 84
    const-wide v3, 0x4072c00000000000L    # 300.0

    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    mul-double/2addr v1, v3

    .line 90
    double-to-long v1, v1

    .line 91
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->i:Landroid/animation/Animator;

    .line 95
    .line 96
    new-instance v1, Ll/kdd0;

    .line 97
    .line 98
    invoke-direct {v1, p0, p1}, Ll/kdd0;-><init>(Lcom/p1/mobile/putong/live/base/view/RollAnimView;Lcom/p1/mobile/putong/live/base/view/RollItemView;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f3851ec    # 0.72f
    .end array-data
.end method

.method public final M(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->a:I

    .line 10
    .line 11
    int-to-float v2, v2

    .line 12
    sub-float/2addr v1, v2

    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->b:F

    .line 14
    .line 15
    add-float/2addr v1, v2

    .line 16
    const/4 v2, 0x2

    .line 17
    new-array v2, v2, [F

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    aput v0, v2, v3

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    aput v1, v2, v0

    .line 24
    .line 25
    sget-object v0, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 26
    .line 27
    invoke-static {p1, v0, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->h:Landroid/animation/Animator;

    .line 32
    .line 33
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->m:D

    .line 34
    .line 35
    const-wide/high16 v2, 0x4079000000000000L    # 400.0

    .line 36
    .line 37
    mul-double/2addr v0, v2

    .line 38
    double-to-long v0, v0

    .line 39
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->h:Landroid/animation/Animator;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public N()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->h:Landroid/animation/Animator;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->h:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_6

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->g:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->g:Landroid/animation/Animator;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_6

    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->k:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_2
    const/4 v0, 0x0

    .line 43
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setChildrenDrawingOrderEnabled(Z)V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-ge v0, v1, :cond_6

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;

    .line 61
    .line 62
    iget v2, v1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->a:I

    .line 63
    .line 64
    iget v3, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->c:I

    .line 65
    .line 66
    add-int/2addr v2, v3

    .line 67
    iget v4, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->d:I

    .line 68
    .line 69
    rem-int/2addr v2, v4

    .line 70
    iput v2, v1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->a:I

    .line 71
    .line 72
    if-ne v2, v3, :cond_3

    .line 73
    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->c:Lcom/p1/mobile/putong/live/base/view/RollItemView;

    .line 75
    .line 76
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->L(Lcom/p1/mobile/putong/live/base/view/RollItemView;)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    add-int/lit8 v3, v3, -0x1

    .line 81
    .line 82
    if-ne v2, v3, :cond_4

    .line 83
    .line 84
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->getNextUser()Ll/nsv;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    if-eqz v3, :cond_5

    .line 93
    .line 94
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->c:Lcom/p1/mobile/putong/live/base/view/RollItemView;

    .line 95
    .line 96
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/live/base/view/RollItemView;->a(Ll/nsv;)V

    .line 97
    .line 98
    .line 99
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->c:Lcom/p1/mobile/putong/live/base/view/RollItemView;

    .line 100
    .line 101
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->K(Landroid/view/View;)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->c:Lcom/p1/mobile/putong/live/base/view/RollItemView;

    .line 106
    .line 107
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->M(Landroid/view/View;)V

    .line 108
    .line 109
    .line 110
    :cond_5
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_6
    :goto_2
    return-void
.end method

.method public O()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->reset()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->B()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    move v1, v0

    .line 9
    :goto_0
    iget v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->d:I

    .line 10
    .line 11
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->k:Ljava/util/List;

    .line 12
    .line 13
    if-ge v1, v2, :cond_1

    .line 14
    .line 15
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ge v1, v2, :cond_0

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->k:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ll/nsv;

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    const/4 v2, 0x0

    .line 31
    :goto_1
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->G(Ll/nsv;Z)V

    .line 32
    .line 33
    .line 34
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->c:I

    .line 42
    .line 43
    if-le v0, v1, :cond_3

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->l:Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;

    .line 46
    .line 47
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->r:I

    .line 48
    .line 49
    if-lez v1, :cond_2

    .line 50
    .line 51
    :goto_2
    int-to-long v1, v1

    .line 52
    goto :goto_3

    .line 53
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->n:I

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :goto_3
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 57
    .line 58
    .line 59
    :cond_3
    return-void
.end method

.method public P()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->l:Lcom/p1/mobile/putong/live/base/view/RollAnimView$b;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getChildDrawingOrder(II)I
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-le p2, p1, :cond_0

    .line 8
    .line 9
    return p2

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->C()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    new-instance p0, Ll/idd0;

    .line 19
    .line 20
    invoke-direct {p0, p2}, Ll/idd0;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;

    .line 28
    .line 29
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->b:I

    .line 30
    .line 31
    return p0

    .line 32
    :cond_1
    new-instance p1, Ll/jdd0;

    .line 33
    .line 34
    invoke-direct {p1, p0, p2}, Ll/jdd0;-><init>(Lcom/p1/mobile/putong/live/base/view/RollAnimView;I)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, p1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;

    .line 42
    .line 43
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView$a;->b:I

    .line 44
    .line 45
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->reset()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    move p3, p2

    .line 7
    :goto_0
    if-ge p3, p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    iget p5, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->a:I

    .line 14
    .line 15
    invoke-virtual {p4, p2, p2, p5, p5}, Landroid/view/View;->layout(IIII)V

    .line 16
    .line 17
    .line 18
    add-int/lit8 p3, p3, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->e:F

    .line 5
    .line 6
    float-to-int p1, p1

    .line 7
    const/high16 p2, -0x80000000

    .line 8
    .line 9
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->a:I

    .line 14
    .line 15
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public reset()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->f:Ljava/util/ArrayList;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->h:Landroid/animation/Animator;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->g:Landroid/animation/Animator;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->i:Landroid/animation/Animator;

    .line 16
    .line 17
    filled-new-array {v0, v1, v2}, [Landroid/animation/Animator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->w([Landroid/animation/Animator;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->P()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setDelay(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->r:I

    .line 2
    .line 3
    return-void
.end method

.method public setItemViewFunc(Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Ll/nsv<",
            "TT;>;",
            "Lcom/p1/mobile/putong/live/base/view/RollItemView<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->t:Ll/qcj;

    .line 2
    .line 3
    return-void
.end method

.method public setNextAction(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->s:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public setSpeedUpRate(D)V
    .locals 2

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->m:D

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->n:I

    .line 4
    .line 5
    int-to-double v0, v0

    .line 6
    mul-double/2addr v0, p1

    .line 7
    double-to-int p1, v0

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->n:I

    .line 9
    .line 10
    return-void
.end method

.method public setUsers(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/nsv<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->k:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public final varargs w([Landroid/animation/Animator;)V
    .locals 3

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x0

    .line 3
    :goto_0
    if-ge v0, p0, :cond_1

    .line 4
    .line 5
    aget-object v1, p1, v0

    .line 6
    .line 7
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/animation/Animator;->isRunning()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    return-void
.end method

.method public final z(I)F
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->a:I

    .line 2
    .line 3
    mul-int/2addr v0, p1

    .line 4
    int-to-float v0, v0

    .line 5
    int-to-float p1, p1

    .line 6
    iget p0, p0, Lcom/p1/mobile/putong/live/base/view/RollAnimView;->b:F

    .line 7
    .line 8
    mul-float/2addr p1, p0

    .line 9
    sub-float/2addr v0, p1

    .line 10
    return v0
.end method
