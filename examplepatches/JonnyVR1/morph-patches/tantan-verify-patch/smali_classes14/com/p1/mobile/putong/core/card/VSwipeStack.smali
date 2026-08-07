.class public Lcom/p1/mobile/putong/core/card/VSwipeStack;
.super Landroid/widget/AdapterView;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/card/VSwipeCard$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/card/VSwipeStack$c;,
        Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/p1/mobile/putong/core/card/VSwipeCard;",
        ">",
        "Landroid/widget/AdapterView<",
        "Ll/dq1;",
        ">;",
        "Lcom/p1/mobile/putong/core/card/VSwipeCard$d<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public a:Ll/dq1;

.field public b:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "TT;>;"
        }
    .end annotation
.end field

.field public c:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "TT;>;"
        }
    .end annotation
.end field

.field public d:Landroid/database/DataSetObserver;

.field public e:I

.field public f:F

.field public g:I

.field public h:F

.field public i:Landroid/graphics/Point;

.field public j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z

.field public l:Z

.field public m:I

.field public n:I

.field public o:D

.field public p:Z

.field public q:Lcom/p1/mobile/putong/core/card/VSwipeStack$c;

.field public r:I

.field public s:I

.field public t:I

.field public u:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/p1/mobile/putong/core/data/SwipeDirection;",
            ">;"
        }
    .end annotation
.end field

.field public v:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/AdapterView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/Stack;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 10
    .line 11
    new-instance p1, Ljava/util/Stack;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->c:Ljava/util/Stack;

    .line 17
    .line 18
    new-instance p1, Lcom/p1/mobile/putong/core/card/VSwipeStack$a;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack$a;-><init>(Lcom/p1/mobile/putong/core/card/VSwipeStack;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->d:Landroid/database/DataSetObserver;

    .line 24
    .line 25
    const/high16 p1, 0x40c00000    # 6.0f

    .line 26
    .line 27
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->e:I

    .line 32
    .line 33
    const p1, 0x3cb851ec    # 0.0225f

    .line 34
    .line 35
    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->f:F

    .line 37
    .line 38
    const/4 p1, 0x4

    .line 39
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->h:F

    .line 43
    .line 44
    new-instance p1, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->j:Ljava/util/ArrayList;

    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->k:Z

    .line 53
    .line 54
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->l:Z

    .line 55
    .line 56
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->m:I

    .line 57
    .line 58
    invoke-static {}, Ll/pf7;->a()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    const/4 v0, 0x3

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    .line 67
    .line 68
    :goto_0
    iput v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->n:I

    .line 69
    .line 70
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 71
    .line 72
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->o:D

    .line 73
    .line 74
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->p:Z

    .line 75
    .line 76
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 77
    .line 78
    new-instance p1, Ljava/util/ArrayDeque;

    .line 79
    .line 80
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->u:Ljava/util/Queue;

    .line 84
    .line 85
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 86
    invoke-direct {p0, p1, p2}, Landroid/widget/AdapterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 87
    new-instance p1, Ljava/util/Stack;

    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 88
    new-instance p1, Ljava/util/Stack;

    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->c:Ljava/util/Stack;

    .line 89
    new-instance p1, Lcom/p1/mobile/putong/core/card/VSwipeStack$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack$a;-><init>(Lcom/p1/mobile/putong/core/card/VSwipeStack;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->d:Landroid/database/DataSetObserver;

    const/high16 p1, 0x40c00000    # 6.0f

    .line 90
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->e:I

    const p1, 0x3cb851ec    # 0.0225f

    .line 91
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->f:F

    const/4 p1, 0x4

    .line 92
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    const/4 p1, 0x0

    .line 93
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->h:F

    .line 94
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->j:Ljava/util/ArrayList;

    const/4 p1, 0x0

    .line 95
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->k:Z

    .line 96
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->l:Z

    .line 97
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->m:I

    .line 98
    invoke-static {}, Ll/pf7;->a()Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x3

    goto :goto_0

    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    :goto_0
    iput p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->n:I

    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 99
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->o:D

    .line 100
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->p:Z

    .line 101
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 102
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->u:Ljava/util/Queue;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 103
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/AdapterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 104
    new-instance p1, Ljava/util/Stack;

    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 105
    new-instance p1, Ljava/util/Stack;

    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->c:Ljava/util/Stack;

    .line 106
    new-instance p1, Lcom/p1/mobile/putong/core/card/VSwipeStack$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack$a;-><init>(Lcom/p1/mobile/putong/core/card/VSwipeStack;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->d:Landroid/database/DataSetObserver;

    const/high16 p1, 0x40c00000    # 6.0f

    .line 107
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->e:I

    const p1, 0x3cb851ec    # 0.0225f

    .line 108
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->f:F

    const/4 p1, 0x4

    .line 109
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    const/4 p1, 0x0

    .line 110
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->h:F

    .line 111
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->j:Ljava/util/ArrayList;

    const/4 p1, 0x0

    .line 112
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->k:Z

    .line 113
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->l:Z

    .line 114
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->m:I

    .line 115
    invoke-static {}, Ll/pf7;->a()Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x3

    goto :goto_0

    :cond_0
    iget p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    :goto_0
    iput p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->n:I

    const-wide/high16 p2, -0x4010000000000000L    # -1.0

    .line 116
    iput-wide p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->o:D

    .line 117
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->p:Z

    .line 118
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 119
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->u:Ljava/util/Queue;

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/card/VSwipeStack;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->n()V

    return-void
.end method


# virtual methods
.method public b(I)Lcom/p1/mobile/putong/core/card/VSwipeCard;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 6
    .line 7
    return-object p0
.end method

.method public c(Z)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public d(I)Lcom/p1/mobile/putong/core/card/VSwipeCard;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->j:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    add-int/lit8 v0, v0, -0x1

    .line 13
    .line 14
    sub-int/2addr v0, p1

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b(I)Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public e(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->h:F

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->m()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->o()Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->v:Ll/y20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->v:Ll/y20;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 9
    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-super {p0}, Landroid/view/ViewGroup;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->getAdapter()Ll/dq1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getAdapter()Ll/dq1;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    return-object p0
.end method

.method public getBgAlpha()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->h:F

    .line 2
    .line 3
    return p0
.end method

.method public getSelectedView()Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public h(ZF)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->q:Lcom/p1/mobile/putong/core/card/VSwipeStack$c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 6
    .line 7
    invoke-interface {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/card/VSwipeStack$c;->b(ZFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/card/VSwipeCard;Lcom/p1/mobile/putong/core/data/SwipeDirection;FZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/p1/mobile/putong/core/data/SwipeDirection;",
            "FZ)V"
        }
    .end annotation

    .line 1
    const/high16 p2, 0x3f800000    # 1.0f

    .line 2
    .line 3
    sub-float/2addr p3, p2

    .line 4
    iput p3, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->h:F

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->j:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/16 p1, 0xff

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$b;->a:[I

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    throw p0
.end method

.method public j(Ljava/util/Stack;Ll/dq1;)V
    .locals 0
    .param p1    # Ljava/util/Stack;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/dq1;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Stack<",
            "TT;>;",
            "Ll/dq1;",
            ")V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->k:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 12
    .line 13
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 14
    .line 15
    if-eq p1, p0, :cond_0

    .line 16
    .line 17
    return v2

    .line 18
    :cond_0
    return v1

    .line 19
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 24
    .line 25
    iget p0, p0, Landroid/graphics/Point;->x:I

    .line 26
    .line 27
    if-eq p1, p0, :cond_2

    .line 28
    .line 29
    return v2

    .line 30
    :cond_2
    return v1
.end method

.method public final l(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/card/VSwipeCard;->d:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->c:Ljava/util/Stack;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 17
    .line 18
    add-int/lit8 p1, p1, -0x1

    .line 19
    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->n1()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const-string p0, "!!"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final m()V
    .locals 13

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->j:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->k:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->l:Z

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    iget v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    .line 21
    .line 22
    :goto_0
    int-to-float v1, v1

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    .line 25
    .line 26
    add-int/lit8 v1, v1, -0x2

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :goto_1
    const/4 v2, 0x0

    .line 30
    move v3, v2

    .line 31
    :goto_2
    if-ge v3, v0, :cond_4

    .line 32
    .line 33
    iget v4, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->s:I

    .line 34
    .line 35
    sub-int/2addr v4, v3

    .line 36
    int-to-float v4, v4

    .line 37
    iget v5, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->h:F

    .line 38
    .line 39
    sub-float/2addr v4, v5

    .line 40
    invoke-static {v4, v1}, Ljava/lang/Math;->min(FF)F

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b(I)Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    add-int/lit8 v6, v0, -0x1

    .line 49
    .line 50
    if-ge v3, v6, :cond_2

    .line 51
    .line 52
    iget v6, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->f:F

    .line 53
    .line 54
    mul-float/2addr v6, v4

    .line 55
    const/high16 v7, 0x3f800000    # 1.0f

    .line 56
    .line 57
    sub-float v6, v7, v6

    .line 58
    .line 59
    mul-float v8, v6, v6

    .line 60
    .line 61
    mul-float/2addr v8, v6

    .line 62
    float-to-double v9, v4

    .line 63
    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    .line 64
    .line 65
    .line 66
    move-result-wide v9

    .line 67
    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    .line 68
    .line 69
    .line 70
    move-result-wide v9

    .line 71
    double-to-float v4, v9

    .line 72
    mul-float v6, v4, v4

    .line 73
    .line 74
    mul-float/2addr v6, v4

    .line 75
    float-to-double v9, v6

    .line 76
    float-to-double v11, v4

    .line 77
    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    .line 78
    .line 79
    .line 80
    move-result-wide v11

    .line 81
    mul-double/2addr v9, v11

    .line 82
    double-to-float v4, v9

    .line 83
    iget v6, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->e:I

    .line 84
    .line 85
    int-to-float v6, v6

    .line 86
    mul-float/2addr v4, v6

    .line 87
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    int-to-float v6, v6

    .line 92
    sub-float/2addr v7, v8

    .line 93
    mul-float/2addr v6, v7

    .line 94
    const/high16 v7, 0x40000000    # 2.0f

    .line 95
    .line 96
    div-float/2addr v6, v7

    .line 97
    add-float/2addr v4, v6

    .line 98
    iget-boolean v6, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->k:Z

    .line 99
    .line 100
    if-eqz v6, :cond_1

    .line 101
    .line 102
    iget-boolean v6, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->l:Z

    .line 103
    .line 104
    if-nez v6, :cond_1

    .line 105
    .line 106
    const/4 v4, 0x0

    .line 107
    goto :goto_3

    .line 108
    :cond_1
    neg-float v4, v4

    .line 109
    :goto_3
    invoke-virtual {v5, v8, v4}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->V0(FF)V

    .line 110
    .line 111
    .line 112
    :cond_2
    iget v4, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    .line 113
    .line 114
    if-ne v0, v4, :cond_3

    .line 115
    .line 116
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-virtual {v4}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    if-eqz v4, :cond_3

    .line 125
    .line 126
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    invoke-virtual {v4}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    iget v5, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->h:F

    .line 135
    .line 136
    const/high16 v6, 0x437f0000    # 255.0f

    .line 137
    .line 138
    mul-float/2addr v5, v6

    .line 139
    float-to-int v5, v5

    .line 140
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 141
    .line 142
    .line 143
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_4
    return-void
.end method

.method public final n()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_9

    .line 6
    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 8
    .line 9
    if-eqz v0, :cond_12

    .line 10
    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->n:I

    .line 12
    .line 13
    invoke-interface {v0}, Landroid/widget/Adapter;->getCount()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x1

    .line 22
    sub-int/2addr v0, v1

    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->s:I

    .line 24
    .line 25
    iget v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    .line 26
    .line 27
    sub-int/2addr v2, v1

    .line 28
    sub-int/2addr v2, v0

    .line 29
    iput v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->r:I

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 32
    .line 33
    invoke-interface {v0}, Landroid/widget/Adapter;->getCount()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->n:I

    .line 38
    .line 39
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->j:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    sub-int/2addr v3, v2

    .line 54
    sub-int/2addr v3, v0

    .line 55
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    sub-int/2addr v4, v2

    .line 60
    iget v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 61
    .line 62
    sub-int/2addr v4, v2

    .line 63
    const/4 v5, 0x0

    .line 64
    if-lez v3, :cond_1

    .line 65
    .line 66
    move v2, v5

    .line 67
    :goto_0
    if-ge v2, v3, :cond_b

    .line 68
    .line 69
    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {p0, v5, v1}, Landroid/view/ViewGroup;->removeViewsInLayout(II)V

    .line 74
    .line 75
    .line 76
    check-cast v4, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 77
    .line 78
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->l(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V

    .line 79
    .line 80
    .line 81
    add-int/lit8 v2, v2, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    const/4 v6, 0x0

    .line 85
    if-gez v3, :cond_8

    .line 86
    .line 87
    move v2, v4

    .line 88
    :goto_1
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    add-int/2addr v7, v4

    .line 93
    if-ge v2, v7, :cond_b

    .line 94
    .line 95
    iget-object v7, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 96
    .line 97
    invoke-virtual {v7, v2}, Landroid/widget/BaseAdapter;->getItemViewType(I)I

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    if-nez v7, :cond_3

    .line 102
    .line 103
    iget-object v7, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 104
    .line 105
    invoke-virtual {v7}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 106
    .line 107
    .line 108
    move-result v7

    .line 109
    if-eqz v7, :cond_2

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_2
    iget-object v7, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 113
    .line 114
    invoke-virtual {v7}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v7

    .line 118
    check-cast v7, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_3
    iget-object v7, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 122
    .line 123
    invoke-virtual {v7, v2}, Landroid/widget/BaseAdapter;->getItemViewType(I)I

    .line 124
    .line 125
    .line 126
    move-result v7

    .line 127
    if-ne v7, v1, :cond_5

    .line 128
    .line 129
    iget-object v7, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->c:Ljava/util/Stack;

    .line 130
    .line 131
    invoke-virtual {v7}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 132
    .line 133
    .line 134
    move-result v7

    .line 135
    if-eqz v7, :cond_4

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_4
    iget-object v7, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->c:Ljava/util/Stack;

    .line 139
    .line 140
    invoke-virtual {v7}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    check-cast v7, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_5
    :goto_2
    move-object v7, v6

    .line 148
    :goto_3
    if-nez v7, :cond_6

    .line 149
    .line 150
    iget-object v7, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 151
    .line 152
    invoke-virtual {v7, v2}, Landroid/widget/BaseAdapter;->getItemViewType(I)I

    .line 153
    .line 154
    .line 155
    move-result v8

    .line 156
    invoke-virtual {v7, p0, v8}, Ll/dq1;->m(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v7

    .line 160
    check-cast v7, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 161
    .line 162
    :cond_6
    invoke-virtual {v7, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setSwipeCardObserver(Lcom/p1/mobile/putong/core/card/VSwipeCard$d;)V

    .line 163
    .line 164
    .line 165
    iget-boolean v8, v7, Lcom/p1/mobile/putong/core/card/VSwipeCard;->d:Z

    .line 166
    .line 167
    if-eqz v8, :cond_7

    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 170
    .line 171
    .line 172
    move-result-object v8

    .line 173
    invoke-virtual {p0, v7, v5, v8, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 174
    .line 175
    .line 176
    iget v7, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 177
    .line 178
    add-int/2addr v7, v1

    .line 179
    iput v7, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 180
    .line 181
    goto :goto_4

    .line 182
    :cond_7
    iget v8, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 183
    .line 184
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 185
    .line 186
    .line 187
    move-result-object v9

    .line 188
    invoke-virtual {p0, v7, v8, v9, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 189
    .line 190
    .line 191
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_8
    if-nez v3, :cond_b

    .line 195
    .line 196
    if-lez v2, :cond_b

    .line 197
    .line 198
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    iget-object v3, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->j:Ljava/util/ArrayList;

    .line 203
    .line 204
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    sub-int/2addr v2, v3

    .line 209
    const/4 v3, 0x4

    .line 210
    if-eq v2, v3, :cond_b

    .line 211
    .line 212
    iget-object v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 213
    .line 214
    invoke-virtual {v2}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    if-eqz v2, :cond_9

    .line 219
    .line 220
    goto :goto_5

    .line 221
    :cond_9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 222
    .line 223
    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    move-object v6, v2

    .line 228
    check-cast v6, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 229
    .line 230
    :goto_5
    if-nez v6, :cond_a

    .line 231
    .line 232
    iget-object v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 233
    .line 234
    iget v3, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 235
    .line 236
    sub-int/2addr v3, v1

    .line 237
    invoke-virtual {v2, v3}, Landroid/widget/BaseAdapter;->getItemViewType(I)I

    .line 238
    .line 239
    .line 240
    move-result v3

    .line 241
    invoke-virtual {v2, p0, v3}, Ll/dq1;->m(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    move-object v6, v2

    .line 246
    check-cast v6, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 247
    .line 248
    :cond_a
    invoke-virtual {v6, p0}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->setSwipeCardObserver(Lcom/p1/mobile/putong/core/card/VSwipeCard$d;)V

    .line 249
    .line 250
    .line 251
    iget v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 252
    .line 253
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    invoke-virtual {p0, v6, v2, v3, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 258
    .line 259
    .line 260
    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 261
    .line 262
    .line 263
    move-result-object v2

    .line 264
    invoke-virtual {p0, v5, v1}, Landroid/view/ViewGroup;->removeViewsInLayout(II)V

    .line 265
    .line 266
    .line 267
    check-cast v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 268
    .line 269
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->l(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V

    .line 270
    .line 271
    .line 272
    :cond_b
    sub-int/2addr v0, v1

    .line 273
    :goto_6
    if-ltz v0, :cond_11

    .line 274
    .line 275
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->d(I)Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 276
    .line 277
    .line 278
    move-result-object v2

    .line 279
    if-nez v0, :cond_c

    .line 280
    .line 281
    move v3, v1

    .line 282
    goto :goto_7

    .line 283
    :cond_c
    move v3, v5

    .line 284
    :goto_7
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/card/VSwipeCard;->O0(Z)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 288
    .line 289
    .line 290
    move-result v3

    .line 291
    if-eqz v3, :cond_d

    .line 292
    .line 293
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->k(Lcom/p1/mobile/putong/core/card/VSwipeCard;)Z

    .line 294
    .line 295
    .line 296
    move-result v3

    .line 297
    if-eqz v3, :cond_f

    .line 298
    .line 299
    :cond_d
    iget-object v3, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 300
    .line 301
    iget v3, v3, Landroid/graphics/Point;->x:I

    .line 302
    .line 303
    invoke-static {v3}, Ll/dox;->b(I)I

    .line 304
    .line 305
    .line 306
    move-result v3

    .line 307
    iget-object v4, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 308
    .line 309
    iget v4, v4, Landroid/graphics/Point;->y:I

    .line 310
    .line 311
    invoke-static {v4}, Ll/dox;->b(I)I

    .line 312
    .line 313
    .line 314
    move-result v4

    .line 315
    invoke-virtual {v2, v3, v4}, Landroid/view/View;->measure(II)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 319
    .line 320
    .line 321
    move-result v3

    .line 322
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 323
    .line 324
    .line 325
    move-result v4

    .line 326
    sub-int/2addr v3, v4

    .line 327
    div-int/lit8 v3, v3, 0x2

    .line 328
    .line 329
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 330
    .line 331
    .line 332
    move-result v4

    .line 333
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 334
    .line 335
    .line 336
    move-result v6

    .line 337
    sub-int/2addr v4, v6

    .line 338
    iget-boolean v6, v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;->d:Z

    .line 339
    .line 340
    if-eqz v6, :cond_e

    .line 341
    .line 342
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 343
    .line 344
    .line 345
    move-result v6

    .line 346
    sub-int v6, v4, v6

    .line 347
    .line 348
    iget-object v7, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 349
    .line 350
    iget v7, v7, Landroid/graphics/Point;->x:I

    .line 351
    .line 352
    add-int/2addr v7, v3

    .line 353
    invoke-virtual {v2, v3, v6, v7, v4}, Landroid/view/View;->layout(IIII)V

    .line 354
    .line 355
    .line 356
    goto :goto_8

    .line 357
    :cond_e
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 358
    .line 359
    .line 360
    move-result v6

    .line 361
    sub-int v6, v4, v6

    .line 362
    .line 363
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 364
    .line 365
    .line 366
    move-result v7

    .line 367
    add-int/2addr v7, v3

    .line 368
    invoke-virtual {v2, v3, v6, v7, v4}, Landroid/view/View;->layout(IIII)V

    .line 369
    .line 370
    .line 371
    :cond_f
    :goto_8
    iget-object v3, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 372
    .line 373
    invoke-interface {v3, v0}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object v4

    .line 377
    iget-object v6, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 378
    .line 379
    invoke-virtual {v6, v0}, Landroid/widget/BaseAdapter;->getItemViewType(I)I

    .line 380
    .line 381
    .line 382
    move-result v6

    .line 383
    invoke-virtual {v3, v2, v4, v6, v0}, Ll/dq1;->j(Landroid/view/View;Ljava/lang/Object;II)V

    .line 384
    .line 385
    .line 386
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 387
    .line 388
    .line 389
    move-result-object v3

    .line 390
    if-eqz v3, :cond_10

    .line 391
    .line 392
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 393
    .line 394
    .line 395
    move-result-object v2

    .line 396
    const/16 v3, 0xff

    .line 397
    .line 398
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 399
    .line 400
    .line 401
    :cond_10
    add-int/lit8 v0, v0, -0x1

    .line 402
    .line 403
    goto/16 :goto_6

    .line 404
    .line 405
    :cond_11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->m()V

    .line 406
    .line 407
    .line 408
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 409
    .line 410
    .line 411
    :cond_12
    :goto_9
    return-void
.end method

.method public o()Lcom/p1/mobile/putong/core/card/VSwipeCard;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->d(I)Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/AdapterView;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    sub-int/2addr p5, p3

    .line 5
    iget p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->m:I

    .line 6
    .line 7
    if-eq p1, p5, :cond_0

    .line 8
    .line 9
    iput p5, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->m:I

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/Stack;->empty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, p0, v1}, Ll/dq1;->m(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 27
    .line 28
    move-object v2, v0

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/core/card/VSwipeCard;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 37
    .line 38
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->j(Ljava/util/Stack;Ll/dq1;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->t:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-nez v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->b:Ljava/util/Stack;

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Landroid/view/View;

    .line 57
    .line 58
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 59
    .line 60
    if-nez v1, :cond_2

    .line 61
    .line 62
    new-instance v1, Landroid/graphics/Point;

    .line 63
    .line 64
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 68
    .line 69
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    if-nez v1, :cond_3

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->k:Z

    .line 83
    .line 84
    if-eqz v1, :cond_4

    .line 85
    .line 86
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->l:Z

    .line 87
    .line 88
    if-nez v2, :cond_4

    .line 89
    .line 90
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-static {v1}, Ll/dox;->b(I)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    invoke-static {v2}, Ll/dox;->b(I)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 110
    .line 111
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    iput v2, v1, Landroid/graphics/Point;->x:I

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 118
    .line 119
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput v0, v1, Landroid/graphics/Point;->y:I

    .line 124
    .line 125
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_4
    if-eqz v1, :cond_5

    .line 130
    .line 131
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    iget v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    .line 144
    .line 145
    add-int/lit8 v1, v1, -0x2

    .line 146
    .line 147
    iget v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->e:I

    .line 148
    .line 149
    mul-int/2addr v1, v2

    .line 150
    sub-int/2addr p2, v1

    .line 151
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    invoke-virtual {p0, v0, p1, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 156
    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_5
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    invoke-static {p1}, Ll/dox;->a(I)I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    invoke-static {p2}, Ll/dox;->d(I)I

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    iget v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    .line 172
    .line 173
    add-int/lit8 v1, v1, -0x2

    .line 174
    .line 175
    iget v2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->e:I

    .line 176
    .line 177
    mul-int/2addr v1, v2

    .line 178
    sub-int/2addr p2, v1

    .line 179
    invoke-static {p2}, Ll/dox;->a(I)I

    .line 180
    .line 181
    .line 182
    move-result p2

    .line 183
    invoke-virtual {p0, v0, p1, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 184
    .line 185
    .line 186
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 187
    .line 188
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 189
    .line 190
    .line 191
    move-result p2

    .line 192
    iput p2, p1, Landroid/graphics/Point;->x:I

    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 195
    .line 196
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    iput p2, p1, Landroid/graphics/Point;->y:I

    .line 201
    .line 202
    iget-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 203
    .line 204
    iget p1, p1, Landroid/graphics/Point;->x:I

    .line 205
    .line 206
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 207
    .line 208
    .line 209
    move-result p2

    .line 210
    add-int/2addr p1, p2

    .line 211
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 212
    .line 213
    .line 214
    move-result p2

    .line 215
    add-int/2addr p1, p2

    .line 216
    iget-object p2, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->i:Landroid/graphics/Point;

    .line 217
    .line 218
    iget p2, p2, Landroid/graphics/Point;->y:I

    .line 219
    .line 220
    iget v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    .line 221
    .line 222
    add-int/lit8 v0, v0, -0x2

    .line 223
    .line 224
    iget v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->e:I

    .line 225
    .line 226
    mul-int/2addr v0, v1

    .line 227
    add-int/2addr p2, v0

    .line 228
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    add-int/2addr p2, v0

    .line 233
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    add-int/2addr p2, v0

    .line 238
    invoke-static {p1}, Ll/dox;->b(I)I

    .line 239
    .line 240
    .line 241
    move-result p1

    .line 242
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 243
    .line 244
    .line 245
    move-result p2

    .line 246
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :cond_6
    const-string p0, "it is expected to have adapter set no to simplify measuring"

    .line 251
    .line 252
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    return-void
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    .line 23
    check-cast p1, Ll/dq1;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->setAdapter(Ll/dq1;)V

    return-void
.end method

.method public setAdapter(Ll/dq1;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->d:Landroid/database/DataSetObserver;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/BaseAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->a:Ll/dq1;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->d:Landroid/database/DataSetObserver;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/BaseAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/card/VSwipeStack;->n()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setAllowUpSwipe(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDisplayedCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setRenderCardCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/card/VSwipeStack;->n:I

    .line 2
    .line 3
    return-void
.end method

.method public setSelection(I)V
    .locals 0

    return-void
.end method
