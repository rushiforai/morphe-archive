.class public Landroidx/recyclerview/widget/k;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$q;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/recyclerview/widget/k$g;,
        Landroidx/recyclerview/widget/k$f;,
        Landroidx/recyclerview/widget/k$e;,
        Landroidx/recyclerview/widget/k$h;
    }
.end annotation


# instance fields
.field public final A:Landroidx/recyclerview/widget/RecyclerView$s;

.field public B:Landroid/graphics/Rect;

.field public C:J

.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final b:[F

.field public c:Landroidx/recyclerview/widget/RecyclerView$e0;

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:F

.field public l:I

.field public m:Landroidx/recyclerview/widget/k$e;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public n:I

.field public o:I

.field public p:Ljava/util/List;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/k$g;",
            ">;"
        }
    .end annotation
.end field

.field public q:I

.field public r:Landroidx/recyclerview/widget/RecyclerView;

.field public final s:Ljava/lang/Runnable;

.field public t:Landroid/view/VelocityTracker;

.field public u:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/RecyclerView$e0;",
            ">;"
        }
    .end annotation
.end field

.field public v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public w:Landroid/view/View;

.field public x:I

.field public y:Ll/lmj;

.field public z:Landroidx/recyclerview/widget/k$f;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/k$e;)V
    .locals 3
    .param p1    # Landroidx/recyclerview/widget/k$e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

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
    iput-object v0, p0, Landroidx/recyclerview/widget/k;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [F

    .line 13
    .line 14
    iput-object v0, p0, Landroidx/recyclerview/widget/k;->b:[F

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 18
    .line 19
    const/4 v1, -0x1

    .line 20
    iput v1, p0, Landroidx/recyclerview/widget/k;->l:I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    iput v2, p0, Landroidx/recyclerview/widget/k;->n:I

    .line 24
    .line 25
    new-instance v2, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v2, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 31
    .line 32
    new-instance v2, Landroidx/recyclerview/widget/k$a;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Landroidx/recyclerview/widget/k$a;-><init>(Landroidx/recyclerview/widget/k;)V

    .line 35
    .line 36
    .line 37
    iput-object v2, p0, Landroidx/recyclerview/widget/k;->s:Ljava/lang/Runnable;

    .line 38
    .line 39
    iput-object v0, p0, Landroidx/recyclerview/widget/k;->w:Landroid/view/View;

    .line 40
    .line 41
    iput v1, p0, Landroidx/recyclerview/widget/k;->x:I

    .line 42
    .line 43
    new-instance v0, Landroidx/recyclerview/widget/k$b;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/k$b;-><init>(Landroidx/recyclerview/widget/k;)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Landroidx/recyclerview/widget/k;->A:Landroidx/recyclerview/widget/RecyclerView$s;

    .line 49
    .line 50
    iput-object p1, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 51
    .line 52
    return-void
.end method

.method public static s(Landroid/view/View;FFFF)Z
    .locals 1

    .line 1
    cmpl-float v0, p1, p3

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v0, v0

    .line 10
    add-float/2addr p3, v0

    .line 11
    cmpg-float p1, p1, p3

    .line 12
    .line 13
    if-gtz p1, :cond_0

    .line 14
    .line 15
    cmpl-float p1, p2, p4

    .line 16
    .line 17
    if-ltz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    int-to-float p0, p0

    .line 24
    add-float/2addr p4, p0

    .line 25
    cmpg-float p0, p2, p4

    .line 26
    .line 27
    if-gtz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method


# virtual methods
.method public final A()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Landroidx/recyclerview/widget/k;->q:I

    .line 16
    .line 17
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->A:Landroidx/recyclerview/widget/RecyclerView$s;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnItemTouchListener(Landroidx/recyclerview/widget/RecyclerView$s;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$q;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroidx/recyclerview/widget/k;->B()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final B()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/k$f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/k$f;-><init>(Landroidx/recyclerview/widget/k;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Landroidx/recyclerview/widget/k;->z:Landroidx/recyclerview/widget/k$f;

    .line 7
    .line 8
    new-instance v0, Ll/lmj;

    .line 9
    .line 10
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Landroidx/recyclerview/widget/k;->z:Landroidx/recyclerview/widget/k$f;

    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ll/lmj;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Landroidx/recyclerview/widget/k;->y:Ll/lmj;

    .line 22
    .line 23
    return-void
.end method

.method public final C()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->z:Landroidx/recyclerview/widget/k$f;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroidx/recyclerview/widget/k$f;->a()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Landroidx/recyclerview/widget/k;->z:Landroidx/recyclerview/widget/k$f;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->y:Ll/lmj;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iput-object v1, p0, Landroidx/recyclerview/widget/k;->y:Ll/lmj;

    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public final D(Landroidx/recyclerview/widget/RecyclerView$e0;)I
    .locals 5

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/k;->n:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return v2

    .line 8
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 9
    .line 10
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    invoke-virtual {v0, v1, p1}, Landroidx/recyclerview/widget/k$e;->k(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 17
    .line 18
    iget-object v3, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    .line 20
    invoke-static {v3}, Ll/kkl0;->x(Landroid/view/View;)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-virtual {v1, v0, v3}, Landroidx/recyclerview/widget/k$e;->d(II)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const v3, 0xff00

    .line 29
    .line 30
    .line 31
    and-int/2addr v1, v3

    .line 32
    shr-int/lit8 v1, v1, 0x8

    .line 33
    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    return v2

    .line 37
    :cond_1
    and-int/2addr v0, v3

    .line 38
    shr-int/lit8 v0, v0, 0x8

    .line 39
    .line 40
    iget v3, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 41
    .line 42
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    iget v4, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 47
    .line 48
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    cmpl-float v3, v3, v4

    .line 53
    .line 54
    if-lez v3, :cond_4

    .line 55
    .line 56
    invoke-virtual {p0, p1, v1}, Landroidx/recyclerview/widget/k;->h(Landroidx/recyclerview/widget/RecyclerView$e0;I)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-lez v3, :cond_3

    .line 61
    .line 62
    and-int p1, v0, v3

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iget-object p0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 67
    .line 68
    invoke-static {p0}, Ll/kkl0;->x(Landroid/view/View;)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    invoke-static {v3, p0}, Landroidx/recyclerview/widget/k$e;->e(II)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    return p0

    .line 77
    :cond_2
    return v3

    .line 78
    :cond_3
    invoke-virtual {p0, p1, v1}, Landroidx/recyclerview/widget/k;->j(Landroidx/recyclerview/widget/RecyclerView$e0;I)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-lez p0, :cond_7

    .line 83
    .line 84
    return p0

    .line 85
    :cond_4
    invoke-virtual {p0, p1, v1}, Landroidx/recyclerview/widget/k;->j(Landroidx/recyclerview/widget/RecyclerView$e0;I)I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    if-lez v3, :cond_5

    .line 90
    .line 91
    return v3

    .line 92
    :cond_5
    invoke-virtual {p0, p1, v1}, Landroidx/recyclerview/widget/k;->h(Landroidx/recyclerview/widget/RecyclerView$e0;I)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-lez p1, :cond_7

    .line 97
    .line 98
    and-int/2addr v0, p1

    .line 99
    if-nez v0, :cond_6

    .line 100
    .line 101
    iget-object p0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 102
    .line 103
    invoke-static {p0}, Ll/kkl0;->x(Landroid/view/View;)I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    invoke-static {p1, p0}, Landroidx/recyclerview/widget/k$e;->e(II)I

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    return p0

    .line 112
    :cond_6
    return p1

    .line 113
    :cond_7
    return v2
.end method

.method public E(Landroid/view/MotionEvent;II)V
    .locals 1

    .line 1
    invoke-virtual {p1, p3}, Landroid/view/MotionEvent;->getX(I)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, p3}, Landroid/view/MotionEvent;->getY(I)F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget p3, p0, Landroidx/recyclerview/widget/k;->d:F

    .line 10
    .line 11
    sub-float/2addr v0, p3

    .line 12
    iput v0, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 13
    .line 14
    iget p3, p0, Landroidx/recyclerview/widget/k;->e:F

    .line 15
    .line 16
    sub-float/2addr p1, p3

    .line 17
    iput p1, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 18
    .line 19
    and-int/lit8 p1, p2, 0x4

    .line 20
    .line 21
    const/4 p3, 0x0

    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    invoke-static {p3, v0}, Ljava/lang/Math;->max(FF)F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iput p1, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 29
    .line 30
    :cond_0
    and-int/lit8 p1, p2, 0x8

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    iget p1, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 35
    .line 36
    invoke-static {p3, p1}, Ljava/lang/Math;->min(FF)F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput p1, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 41
    .line 42
    :cond_1
    and-int/lit8 p1, p2, 0x1

    .line 43
    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    iget p1, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 47
    .line 48
    invoke-static {p3, p1}, Ljava/lang/Math;->max(FF)F

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iput p1, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 53
    .line 54
    :cond_2
    and-int/lit8 p1, p2, 0x2

    .line 55
    .line 56
    if-nez p1, :cond_3

    .line 57
    .line 58
    iget p1, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 59
    .line 60
    invoke-static {p3, p1}, Ljava/lang/Math;->min(FF)F

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iput p1, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 65
    .line 66
    :cond_3
    return-void
.end method

.method public b(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/k;->x(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    if-ne p1, v0, :cond_1

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1, v1}, Landroidx/recyclerview/widget/k;->z(Landroidx/recyclerview/widget/RecyclerView$e0;I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {p0, p1, v1}, Landroidx/recyclerview/widget/k;->l(Landroidx/recyclerview/widget/RecyclerView$e0;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->a:Ljava/util/List;

    .line 29
    .line 30
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 31
    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 39
    .line 40
    iget-object p0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    .line 42
    invoke-virtual {v0, p0, p1}, Landroidx/recyclerview/widget/k$e;->c(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    return-void
.end method

.method public d(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public final f()V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/k;->k()V

    .line 9
    .line 10
    .line 11
    :cond_1
    iput-object p1, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget v0, Ll/qac0;->f:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Landroidx/recyclerview/widget/k;->f:F

    .line 26
    .line 27
    sget v0, Ll/qac0;->e:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Landroidx/recyclerview/widget/k;->g:F

    .line 34
    .line 35
    invoke-virtual {p0}, Landroidx/recyclerview/widget/k;->A()V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void
.end method

.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UnknownNullness"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/RecyclerView$e0;I)I
    .locals 7

    .line 1
    and-int/lit8 v0, p2, 0xc

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget v0, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    const/4 v2, 0x4

    .line 11
    const/16 v3, 0x8

    .line 12
    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    move v0, v3

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v2

    .line 18
    :goto_0
    iget-object v4, p0, Landroidx/recyclerview/widget/k;->t:Landroid/view/VelocityTracker;

    .line 19
    .line 20
    if-eqz v4, :cond_2

    .line 21
    .line 22
    iget v5, p0, Landroidx/recyclerview/widget/k;->l:I

    .line 23
    .line 24
    const/4 v6, -0x1

    .line 25
    if-le v5, v6, :cond_2

    .line 26
    .line 27
    iget-object v5, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 28
    .line 29
    iget v6, p0, Landroidx/recyclerview/widget/k;->g:F

    .line 30
    .line 31
    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/k$e;->n(F)F

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    const/16 v6, 0x3e8

    .line 36
    .line 37
    invoke-virtual {v4, v6, v5}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 38
    .line 39
    .line 40
    iget-object v4, p0, Landroidx/recyclerview/widget/k;->t:Landroid/view/VelocityTracker;

    .line 41
    .line 42
    iget v5, p0, Landroidx/recyclerview/widget/k;->l:I

    .line 43
    .line 44
    invoke-virtual {v4, v5}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    iget-object v5, p0, Landroidx/recyclerview/widget/k;->t:Landroid/view/VelocityTracker;

    .line 49
    .line 50
    iget v6, p0, Landroidx/recyclerview/widget/k;->l:I

    .line 51
    .line 52
    invoke-virtual {v5, v6}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    cmpl-float v1, v4, v1

    .line 57
    .line 58
    if-lez v1, :cond_1

    .line 59
    .line 60
    move v2, v3

    .line 61
    :cond_1
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    and-int v3, v2, p2

    .line 66
    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    if-ne v0, v2, :cond_2

    .line 70
    .line 71
    iget-object v3, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 72
    .line 73
    iget v4, p0, Landroidx/recyclerview/widget/k;->f:F

    .line 74
    .line 75
    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/k$e;->l(F)F

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    cmpl-float v3, v1, v3

    .line 80
    .line 81
    if-ltz v3, :cond_2

    .line 82
    .line 83
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    cmpl-float v1, v1, v3

    .line 88
    .line 89
    if-lez v1, :cond_2

    .line 90
    .line 91
    return v2

    .line 92
    :cond_2
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 93
    .line 94
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    int-to-float v1, v1

    .line 99
    iget-object v2, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 100
    .line 101
    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/k$e;->m(Landroidx/recyclerview/widget/RecyclerView$e0;)F

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    mul-float/2addr v1, p1

    .line 106
    and-int p1, p2, v0

    .line 107
    .line 108
    if-eqz p1, :cond_3

    .line 109
    .line 110
    iget p0, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 111
    .line 112
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    cmpl-float p0, p0, v1

    .line 117
    .line 118
    if-lez p0, :cond_3

    .line 119
    .line 120
    return v0

    .line 121
    :cond_3
    const/4 p0, 0x0

    .line 122
    return p0
.end method

.method public i(ILandroid/view/MotionEvent;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 2
    .line 3
    if-nez v0, :cond_9

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-ne p1, v0, :cond_9

    .line 7
    .line 8
    iget p1, p0, Landroidx/recyclerview/widget/k;->n:I

    .line 9
    .line 10
    if-eq p1, v0, :cond_9

    .line 11
    .line 12
    iget-object p1, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroidx/recyclerview/widget/k$e;->q()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getScrollState()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    const/4 v1, 0x1

    .line 29
    if-ne p1, v1, :cond_1

    .line 30
    .line 31
    goto/16 :goto_0

    .line 32
    .line 33
    :cond_1
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/k;->p(Landroid/view/MotionEvent;)Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    goto/16 :goto_0

    .line 40
    .line 41
    :cond_2
    iget-object v2, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 42
    .line 43
    iget-object v3, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 44
    .line 45
    invoke-virtual {v2, v3, p1}, Landroidx/recyclerview/widget/k$e;->f(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    const v3, 0xff00

    .line 50
    .line 51
    .line 52
    and-int/2addr v2, v3

    .line 53
    shr-int/lit8 v2, v2, 0x8

    .line 54
    .line 55
    if-nez v2, :cond_3

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    invoke-virtual {p2, p3}, Landroid/view/MotionEvent;->getX(I)F

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-virtual {p2, p3}, Landroid/view/MotionEvent;->getY(I)F

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    iget v4, p0, Landroidx/recyclerview/widget/k;->d:F

    .line 67
    .line 68
    sub-float/2addr v3, v4

    .line 69
    iget v4, p0, Landroidx/recyclerview/widget/k;->e:F

    .line 70
    .line 71
    sub-float/2addr p3, v4

    .line 72
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    iget v6, p0, Landroidx/recyclerview/widget/k;->q:I

    .line 81
    .line 82
    int-to-float v7, v6

    .line 83
    cmpg-float v7, v4, v7

    .line 84
    .line 85
    if-gez v7, :cond_4

    .line 86
    .line 87
    int-to-float v6, v6

    .line 88
    cmpg-float v6, v5, v6

    .line 89
    .line 90
    if-gez v6, :cond_4

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_4
    cmpl-float v4, v4, v5

    .line 94
    .line 95
    const/4 v5, 0x0

    .line 96
    if-lez v4, :cond_6

    .line 97
    .line 98
    cmpg-float p3, v3, v5

    .line 99
    .line 100
    if-gez p3, :cond_5

    .line 101
    .line 102
    and-int/lit8 p3, v2, 0x4

    .line 103
    .line 104
    if-nez p3, :cond_5

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_5
    cmpl-float p3, v3, v5

    .line 108
    .line 109
    if-lez p3, :cond_8

    .line 110
    .line 111
    and-int/lit8 p3, v2, 0x8

    .line 112
    .line 113
    if-nez p3, :cond_8

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_6
    cmpg-float v3, p3, v5

    .line 117
    .line 118
    if-gez v3, :cond_7

    .line 119
    .line 120
    and-int/lit8 v3, v2, 0x1

    .line 121
    .line 122
    if-nez v3, :cond_7

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_7
    cmpl-float p3, p3, v5

    .line 126
    .line 127
    if-lez p3, :cond_8

    .line 128
    .line 129
    and-int/lit8 p3, v2, 0x2

    .line 130
    .line 131
    if-nez p3, :cond_8

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_8
    iput v5, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 135
    .line 136
    iput v5, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 137
    .line 138
    const/4 p3, 0x0

    .line 139
    invoke-virtual {p2, p3}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    iput p2, p0, Landroidx/recyclerview/widget/k;->l:I

    .line 144
    .line 145
    invoke-virtual {p0, p1, v1}, Landroidx/recyclerview/widget/k;->z(Landroidx/recyclerview/widget/RecyclerView$e0;I)V

    .line 146
    .line 147
    .line 148
    :cond_9
    :goto_0
    return-void
.end method

.method public final j(Landroidx/recyclerview/widget/RecyclerView$e0;I)I
    .locals 7

    .line 1
    and-int/lit8 v0, p2, 0x3

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget v0, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v0, v0, v1

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x2

    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    move v0, v3

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v2

    .line 17
    :goto_0
    iget-object v4, p0, Landroidx/recyclerview/widget/k;->t:Landroid/view/VelocityTracker;

    .line 18
    .line 19
    if-eqz v4, :cond_2

    .line 20
    .line 21
    iget v5, p0, Landroidx/recyclerview/widget/k;->l:I

    .line 22
    .line 23
    const/4 v6, -0x1

    .line 24
    if-le v5, v6, :cond_2

    .line 25
    .line 26
    iget-object v5, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 27
    .line 28
    iget v6, p0, Landroidx/recyclerview/widget/k;->g:F

    .line 29
    .line 30
    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/k$e;->n(F)F

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    const/16 v6, 0x3e8

    .line 35
    .line 36
    invoke-virtual {v4, v6, v5}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 37
    .line 38
    .line 39
    iget-object v4, p0, Landroidx/recyclerview/widget/k;->t:Landroid/view/VelocityTracker;

    .line 40
    .line 41
    iget v5, p0, Landroidx/recyclerview/widget/k;->l:I

    .line 42
    .line 43
    invoke-virtual {v4, v5}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    iget-object v5, p0, Landroidx/recyclerview/widget/k;->t:Landroid/view/VelocityTracker;

    .line 48
    .line 49
    iget v6, p0, Landroidx/recyclerview/widget/k;->l:I

    .line 50
    .line 51
    invoke-virtual {v5, v6}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    cmpl-float v1, v5, v1

    .line 56
    .line 57
    if-lez v1, :cond_1

    .line 58
    .line 59
    move v2, v3

    .line 60
    :cond_1
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    and-int v3, v2, p2

    .line 65
    .line 66
    if-eqz v3, :cond_2

    .line 67
    .line 68
    if-ne v2, v0, :cond_2

    .line 69
    .line 70
    iget-object v3, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 71
    .line 72
    iget v5, p0, Landroidx/recyclerview/widget/k;->f:F

    .line 73
    .line 74
    invoke-virtual {v3, v5}, Landroidx/recyclerview/widget/k$e;->l(F)F

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    cmpl-float v3, v1, v3

    .line 79
    .line 80
    if-ltz v3, :cond_2

    .line 81
    .line 82
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    cmpl-float v1, v1, v3

    .line 87
    .line 88
    if-lez v1, :cond_2

    .line 89
    .line 90
    return v2

    .line 91
    :cond_2
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 92
    .line 93
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    int-to-float v1, v1

    .line 98
    iget-object v2, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 99
    .line 100
    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/k$e;->m(Landroidx/recyclerview/widget/RecyclerView$e0;)F

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    mul-float/2addr v1, p1

    .line 105
    and-int p1, p2, v0

    .line 106
    .line 107
    if-eqz p1, :cond_3

    .line 108
    .line 109
    iget p0, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 110
    .line 111
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    cmpl-float p0, p0, v1

    .line 116
    .line 117
    if-lez p0, :cond_3

    .line 118
    .line 119
    return v0

    .line 120
    :cond_3
    const/4 p0, 0x0

    .line 121
    return p0
.end method

.method public final k()V
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->removeItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    .line 8
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->A:Landroidx/recyclerview/widget/RecyclerView$s;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->removeOnItemTouchListener(Landroidx/recyclerview/widget/RecyclerView$s;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$q;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    add-int/lit8 v0, v0, -0x1

    .line 25
    .line 26
    :goto_0
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 27
    .line 28
    if-ltz v0, :cond_0

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroidx/recyclerview/widget/k$g;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroidx/recyclerview/widget/k$g;->a()V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 41
    .line 42
    iget-object v3, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 43
    .line 44
    iget-object v1, v1, Landroidx/recyclerview/widget/k$g;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 45
    .line 46
    invoke-virtual {v2, v3, v1}, Landroidx/recyclerview/widget/k$e;->c(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 47
    .line 48
    .line 49
    add-int/lit8 v0, v0, -0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    iput-object v0, p0, Landroidx/recyclerview/widget/k;->w:Landroid/view/View;

    .line 57
    .line 58
    const/4 v0, -0x1

    .line 59
    iput v0, p0, Landroidx/recyclerview/widget/k;->x:I

    .line 60
    .line 61
    invoke-virtual {p0}, Landroidx/recyclerview/widget/k;->w()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Landroidx/recyclerview/widget/k;->C()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public l(Landroidx/recyclerview/widget/RecyclerView$e0;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_2

    .line 10
    .line 11
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroidx/recyclerview/widget/k$g;

    .line 18
    .line 19
    iget-object v2, v1, Landroidx/recyclerview/widget/k$g;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 20
    .line 21
    if-ne v2, p1, :cond_1

    .line 22
    .line 23
    iget-boolean p1, v1, Landroidx/recyclerview/widget/k$g;->l:Z

    .line 24
    .line 25
    or-int/2addr p1, p2

    .line 26
    iput-boolean p1, v1, Landroidx/recyclerview/widget/k$g;->l:Z

    .line 27
    .line 28
    iget-boolean p1, v1, Landroidx/recyclerview/widget/k$g;->m:Z

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v1}, Landroidx/recyclerview/widget/k$g;->a()V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p0, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    return-void
.end method

.method public m(Landroid/view/MotionEvent;)Landroidx/recyclerview/widget/k$g;
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/k;->n(Landroid/view/MotionEvent;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/lit8 v0, v0, -0x1

    .line 22
    .line 23
    :goto_0
    if-ltz v0, :cond_2

    .line 24
    .line 25
    iget-object v2, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Landroidx/recyclerview/widget/k$g;

    .line 32
    .line 33
    iget-object v3, v2, Landroidx/recyclerview/widget/k$g;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 34
    .line 35
    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 36
    .line 37
    if-ne v3, p1, :cond_1

    .line 38
    .line 39
    return-object v2

    .line 40
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    return-object v1
.end method

.method public n(Landroid/view/MotionEvent;)Landroid/view/View;
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 14
    .line 15
    iget v2, p0, Landroidx/recyclerview/widget/k;->j:F

    .line 16
    .line 17
    iget v3, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 18
    .line 19
    add-float/2addr v2, v3

    .line 20
    iget v3, p0, Landroidx/recyclerview/widget/k;->k:F

    .line 21
    .line 22
    iget v4, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 23
    .line 24
    add-float/2addr v3, v4

    .line 25
    invoke-static {v1, v0, p1, v2, v3}, Landroidx/recyclerview/widget/k;->s(Landroid/view/View;FFFF)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    return-object v1

    .line 32
    :cond_0
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    add-int/lit8 v1, v1, -0x1

    .line 39
    .line 40
    :goto_0
    if-ltz v1, :cond_2

    .line 41
    .line 42
    iget-object v2, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Landroidx/recyclerview/widget/k$g;

    .line 49
    .line 50
    iget-object v3, v2, Landroidx/recyclerview/widget/k$g;->e:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 51
    .line 52
    iget-object v3, v3, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 53
    .line 54
    iget v4, v2, Landroidx/recyclerview/widget/k$g;->j:F

    .line 55
    .line 56
    iget v2, v2, Landroidx/recyclerview/widget/k$g;->k:F

    .line 57
    .line 58
    invoke-static {v3, v0, p1, v4, v2}, Landroidx/recyclerview/widget/k;->s(Landroid/view/View;FFFF)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    return-object v3

    .line 65
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    iget-object p0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 69
    .line 70
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method public final o(Landroidx/recyclerview/widget/RecyclerView$e0;)Ljava/util/List;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView$e0;",
            ")",
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/RecyclerView$e0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Landroidx/recyclerview/widget/k;->u:Ljava/util/List;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    new-instance v2, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v2, v0, Landroidx/recyclerview/widget/k;->u:Ljava/util/List;

    .line 15
    .line 16
    new-instance v2, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v2, v0, Landroidx/recyclerview/widget/k;->v:Ljava/util/List;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 25
    .line 26
    .line 27
    iget-object v2, v0, Landroidx/recyclerview/widget/k;->v:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object v2, v0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroidx/recyclerview/widget/k$e;->h()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iget v3, v0, Landroidx/recyclerview/widget/k;->j:F

    .line 39
    .line 40
    iget v4, v0, Landroidx/recyclerview/widget/k;->h:F

    .line 41
    .line 42
    add-float/2addr v3, v4

    .line 43
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    sub-int/2addr v3, v2

    .line 48
    iget v4, v0, Landroidx/recyclerview/widget/k;->k:F

    .line 49
    .line 50
    iget v5, v0, Landroidx/recyclerview/widget/k;->i:F

    .line 51
    .line 52
    add-float/2addr v4, v5

    .line 53
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    sub-int/2addr v4, v2

    .line 58
    iget-object v5, v1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    add-int/2addr v5, v3

    .line 65
    mul-int/lit8 v2, v2, 0x2

    .line 66
    .line 67
    add-int/2addr v5, v2

    .line 68
    iget-object v6, v1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 69
    .line 70
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result v6

    .line 74
    add-int/2addr v6, v4

    .line 75
    add-int/2addr v6, v2

    .line 76
    add-int v2, v3, v5

    .line 77
    .line 78
    div-int/lit8 v2, v2, 0x2

    .line 79
    .line 80
    add-int v7, v4, v6

    .line 81
    .line 82
    div-int/lit8 v7, v7, 0x2

    .line 83
    .line 84
    iget-object v8, v0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 85
    .line 86
    invoke-virtual {v8}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 87
    .line 88
    .line 89
    move-result-object v8

    .line 90
    invoke-virtual {v8}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    const/4 v11, 0x0

    .line 95
    :goto_1
    if-ge v11, v9, :cond_5

    .line 96
    .line 97
    invoke-virtual {v8, v11}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v12

    .line 101
    iget-object v13, v1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 102
    .line 103
    if-ne v12, v13, :cond_1

    .line 104
    .line 105
    goto/16 :goto_3

    .line 106
    .line 107
    :cond_1
    invoke-virtual {v12}, Landroid/view/View;->getBottom()I

    .line 108
    .line 109
    .line 110
    move-result v13

    .line 111
    if-lt v13, v4, :cond_4

    .line 112
    .line 113
    invoke-virtual {v12}, Landroid/view/View;->getTop()I

    .line 114
    .line 115
    .line 116
    move-result v13

    .line 117
    if-gt v13, v6, :cond_4

    .line 118
    .line 119
    invoke-virtual {v12}, Landroid/view/View;->getRight()I

    .line 120
    .line 121
    .line 122
    move-result v13

    .line 123
    if-lt v13, v3, :cond_4

    .line 124
    .line 125
    invoke-virtual {v12}, Landroid/view/View;->getLeft()I

    .line 126
    .line 127
    .line 128
    move-result v13

    .line 129
    if-le v13, v5, :cond_2

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_2
    iget-object v13, v0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 133
    .line 134
    invoke-virtual {v13, v12}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 135
    .line 136
    .line 137
    move-result-object v13

    .line 138
    iget-object v14, v0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 139
    .line 140
    iget-object v15, v0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 141
    .line 142
    iget-object v10, v0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 143
    .line 144
    invoke-virtual {v14, v15, v10, v13}, Landroidx/recyclerview/widget/k$e;->a(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/RecyclerView$e0;)Z

    .line 145
    .line 146
    .line 147
    move-result v10

    .line 148
    if-eqz v10, :cond_4

    .line 149
    .line 150
    invoke-virtual {v12}, Landroid/view/View;->getLeft()I

    .line 151
    .line 152
    .line 153
    move-result v10

    .line 154
    invoke-virtual {v12}, Landroid/view/View;->getRight()I

    .line 155
    .line 156
    .line 157
    move-result v14

    .line 158
    add-int/2addr v10, v14

    .line 159
    div-int/lit8 v10, v10, 0x2

    .line 160
    .line 161
    sub-int v10, v2, v10

    .line 162
    .line 163
    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    .line 164
    .line 165
    .line 166
    move-result v10

    .line 167
    invoke-virtual {v12}, Landroid/view/View;->getTop()I

    .line 168
    .line 169
    .line 170
    move-result v14

    .line 171
    invoke-virtual {v12}, Landroid/view/View;->getBottom()I

    .line 172
    .line 173
    .line 174
    move-result v12

    .line 175
    add-int/2addr v14, v12

    .line 176
    div-int/lit8 v14, v14, 0x2

    .line 177
    .line 178
    sub-int v12, v7, v14

    .line 179
    .line 180
    invoke-static {v12}, Ljava/lang/Math;->abs(I)I

    .line 181
    .line 182
    .line 183
    move-result v12

    .line 184
    mul-int/2addr v10, v10

    .line 185
    mul-int/2addr v12, v12

    .line 186
    add-int/2addr v10, v12

    .line 187
    iget-object v12, v0, Landroidx/recyclerview/widget/k;->u:Ljava/util/List;

    .line 188
    .line 189
    invoke-interface {v12}, Ljava/util/List;->size()I

    .line 190
    .line 191
    .line 192
    move-result v12

    .line 193
    const/4 v14, 0x0

    .line 194
    const/4 v15, 0x0

    .line 195
    :goto_2
    if-ge v14, v12, :cond_3

    .line 196
    .line 197
    iget-object v1, v0, Landroidx/recyclerview/widget/k;->v:Ljava/util/List;

    .line 198
    .line 199
    invoke-interface {v1, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    check-cast v1, Ljava/lang/Integer;

    .line 204
    .line 205
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    if-le v10, v1, :cond_3

    .line 210
    .line 211
    add-int/lit8 v15, v15, 0x1

    .line 212
    .line 213
    add-int/lit8 v14, v14, 0x1

    .line 214
    .line 215
    move-object/from16 v1, p1

    .line 216
    .line 217
    goto :goto_2

    .line 218
    :cond_3
    iget-object v1, v0, Landroidx/recyclerview/widget/k;->u:Ljava/util/List;

    .line 219
    .line 220
    invoke-interface {v1, v15, v13}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 221
    .line 222
    .line 223
    iget-object v1, v0, Landroidx/recyclerview/widget/k;->v:Ljava/util/List;

    .line 224
    .line 225
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 226
    .line 227
    .line 228
    move-result-object v10

    .line 229
    invoke-interface {v1, v15, v10}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 230
    .line 231
    .line 232
    :cond_4
    :goto_3
    add-int/lit8 v11, v11, 0x1

    .line 233
    .line 234
    move-object/from16 v1, p1

    .line 235
    .line 236
    goto/16 :goto_1

    .line 237
    .line 238
    :cond_5
    iget-object v0, v0, Landroidx/recyclerview/widget/k;->u:Ljava/util/List;

    .line 239
    .line 240
    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 9
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UnknownNullness"
        }
    .end annotation

    .line 1
    const/4 p3, -0x1

    .line 2
    iput p3, p0, Landroidx/recyclerview/widget/k;->x:I

    .line 3
    .line 4
    iget-object p3, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    iget-object p3, p0, Landroidx/recyclerview/widget/k;->b:[F

    .line 9
    .line 10
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/k;->q([F)V

    .line 11
    .line 12
    .line 13
    iget-object p3, p0, Landroidx/recyclerview/widget/k;->b:[F

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    aget v0, p3, v0

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    aget p3, p3, v1

    .line 20
    .line 21
    move v8, p3

    .line 22
    move v7, v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    move v7, v0

    .line 26
    move v8, v7

    .line 27
    :goto_0
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 28
    .line 29
    iget-object v4, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 30
    .line 31
    iget-object v5, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 32
    .line 33
    iget v6, p0, Landroidx/recyclerview/widget/k;->n:I

    .line 34
    .line 35
    move-object v2, p1

    .line 36
    move-object v3, p2

    .line 37
    invoke-virtual/range {v1 .. v8}, Landroidx/recyclerview/widget/k$e;->w(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Ljava/util/List;IFF)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 9
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroidx/recyclerview/widget/RecyclerView$a0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p3, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    iget-object p3, p0, Landroidx/recyclerview/widget/k;->b:[F

    .line 6
    .line 7
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/k;->q([F)V

    .line 8
    .line 9
    .line 10
    iget-object p3, p0, Landroidx/recyclerview/widget/k;->b:[F

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    aget v0, p3, v0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    aget p3, p3, v1

    .line 17
    .line 18
    move v8, p3

    .line 19
    move v7, v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    move v7, v0

    .line 23
    move v8, v7

    .line 24
    :goto_0
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 25
    .line 26
    iget-object v4, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 27
    .line 28
    iget-object v5, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 29
    .line 30
    iget v6, p0, Landroidx/recyclerview/widget/k;->n:I

    .line 31
    .line 32
    move-object v2, p1

    .line 33
    move-object v3, p2

    .line 34
    invoke-virtual/range {v1 .. v8}, Landroidx/recyclerview/widget/k$e;->x(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Ljava/util/List;IFF)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final p(Landroid/view/MotionEvent;)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Landroidx/recyclerview/widget/k;->l:I

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    const/4 v3, 0x0

    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    return-object v3

    .line 14
    :cond_0
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iget v4, p0, Landroidx/recyclerview/widget/k;->d:F

    .line 23
    .line 24
    sub-float/2addr v2, v4

    .line 25
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget v4, p0, Landroidx/recyclerview/widget/k;->e:F

    .line 30
    .line 31
    sub-float/2addr v1, v4

    .line 32
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget v4, p0, Landroidx/recyclerview/widget/k;->q:I

    .line 41
    .line 42
    int-to-float v5, v4

    .line 43
    cmpg-float v5, v2, v5

    .line 44
    .line 45
    if-gez v5, :cond_1

    .line 46
    .line 47
    int-to-float v4, v4

    .line 48
    cmpg-float v4, v1, v4

    .line 49
    .line 50
    if-gez v4, :cond_1

    .line 51
    .line 52
    return-object v3

    .line 53
    :cond_1
    cmpl-float v4, v2, v1

    .line 54
    .line 55
    if-lez v4, :cond_2

    .line 56
    .line 57
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz v4, :cond_2

    .line 62
    .line 63
    return-object v3

    .line 64
    :cond_2
    cmpl-float v1, v1, v2

    .line 65
    .line 66
    if-lez v1, :cond_3

    .line 67
    .line 68
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollVertically()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    return-object v3

    .line 75
    :cond_3
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/k;->n(Landroid/view/MotionEvent;)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    if-nez p1, :cond_4

    .line 80
    .line 81
    return-object v3

    .line 82
    :cond_4
    iget-object p0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0
.end method

.method public final q([F)V
    .locals 3

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/k;->o:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0xc

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Landroidx/recyclerview/widget/k;->j:F

    .line 9
    .line 10
    iget v2, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 11
    .line 12
    add-float/2addr v0, v2

    .line 13
    iget-object v2, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 14
    .line 15
    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v2, v2

    .line 22
    sub-float/2addr v0, v2

    .line 23
    aput v0, p1, v1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 27
    .line 28
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    aput v0, p1, v1

    .line 35
    .line 36
    :goto_0
    iget v0, p0, Landroidx/recyclerview/widget/k;->o:I

    .line 37
    .line 38
    and-int/lit8 v0, v0, 0x3

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget v0, p0, Landroidx/recyclerview/widget/k;->k:F

    .line 44
    .line 45
    iget v2, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 46
    .line 47
    add-float/2addr v0, v2

    .line 48
    iget-object p0, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 49
    .line 50
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    int-to-float p0, p0

    .line 57
    sub-float/2addr v0, p0

    .line 58
    aput v0, p1, v1

    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    iget-object p0, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 62
    .line 63
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    aput p0, p1, v1

    .line 70
    .line 71
    return-void
.end method

.method public r()Z
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_1

    .line 10
    .line 11
    iget-object v3, p0, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Landroidx/recyclerview/widget/k$g;

    .line 18
    .line 19
    iget-boolean v3, v3, Landroidx/recyclerview/widget/k$g;->m:Z

    .line 20
    .line 21
    if-nez v3, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return v1
.end method

.method public t(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 10

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->isLayoutRequested()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget v0, p0, Landroidx/recyclerview/widget/k;->n:I

    .line 12
    .line 13
    const/4 v1, 0x2

    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/k$e;->j(Landroidx/recyclerview/widget/RecyclerView$e0;)F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget v1, p0, Landroidx/recyclerview/widget/k;->j:F

    .line 25
    .line 26
    iget v2, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 27
    .line 28
    add-float/2addr v1, v2

    .line 29
    float-to-int v8, v1

    .line 30
    iget v1, p0, Landroidx/recyclerview/widget/k;->k:F

    .line 31
    .line 32
    iget v2, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 33
    .line 34
    add-float/2addr v1, v2

    .line 35
    float-to-int v9, v1

    .line 36
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    sub-int v1, v9, v1

    .line 43
    .line 44
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    int-to-float v1, v1

    .line 49
    iget-object v2, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    int-to-float v2, v2

    .line 56
    mul-float/2addr v2, v0

    .line 57
    cmpg-float v1, v1, v2

    .line 58
    .line 59
    if-gez v1, :cond_2

    .line 60
    .line 61
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    sub-int v1, v8, v1

    .line 68
    .line 69
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    int-to-float v1, v1

    .line 74
    iget-object v2, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 75
    .line 76
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    int-to-float v2, v2

    .line 81
    mul-float/2addr v2, v0

    .line 82
    cmpg-float v0, v1, v2

    .line 83
    .line 84
    if-gez v0, :cond_2

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/k;->o(Landroidx/recyclerview/widget/RecyclerView$e0;)Ljava/util/List;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-nez v1, :cond_3

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_3
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 99
    .line 100
    invoke-virtual {v1, p1, v0, v8, v9}, Landroidx/recyclerview/widget/k$e;->b(Landroidx/recyclerview/widget/RecyclerView$e0;Ljava/util/List;II)Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    if-nez v6, :cond_4

    .line 105
    .line 106
    iget-object p1, p0, Landroidx/recyclerview/widget/k;->u:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Landroidx/recyclerview/widget/k;->v:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_4
    invoke-virtual {v6}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAbsoluteAdapterPosition()I

    .line 118
    .line 119
    .line 120
    move-result v7

    .line 121
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAbsoluteAdapterPosition()I

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 126
    .line 127
    iget-object v1, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 128
    .line 129
    invoke-virtual {v0, v1, p1, v6}, Landroidx/recyclerview/widget/k$e;->y(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/RecyclerView$e0;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_5

    .line 134
    .line 135
    iget-object v2, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 136
    .line 137
    iget-object v3, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 138
    .line 139
    move-object v4, p1

    .line 140
    invoke-virtual/range {v2 .. v9}, Landroidx/recyclerview/widget/k$e;->z(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;ILandroidx/recyclerview/widget/RecyclerView$e0;III)V

    .line 141
    .line 142
    .line 143
    :cond_5
    :goto_0
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->t:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Landroidx/recyclerview/widget/k;->t:Landroid/view/VelocityTracker;

    .line 13
    .line 14
    return-void
.end method

.method public v(Landroidx/recyclerview/widget/k$g;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    new-instance v1, Landroidx/recyclerview/widget/k$d;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Landroidx/recyclerview/widget/k$d;-><init>(Landroidx/recyclerview/widget/k;Landroidx/recyclerview/widget/k$g;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final w()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->t:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Landroidx/recyclerview/widget/k;->t:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public x(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->w:Landroid/view/View;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, Landroidx/recyclerview/widget/k;->w:Landroid/view/View;

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public y()Z
    .locals 15

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-wide/high16 v2, -0x8000000000000000L

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iput-wide v2, p0, Landroidx/recyclerview/widget/k;->C:J

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v4

    .line 15
    iget-wide v6, p0, Landroidx/recyclerview/widget/k;->C:J

    .line 16
    .line 17
    cmp-long v0, v6, v2

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const-wide/16 v6, 0x0

    .line 22
    .line 23
    :goto_0
    move-wide v13, v6

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    sub-long v6, v4, v6

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :goto_1
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 29
    .line 30
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v6, p0, Landroidx/recyclerview/widget/k;->B:Landroid/graphics/Rect;

    .line 35
    .line 36
    if-nez v6, :cond_2

    .line 37
    .line 38
    new-instance v6, Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v6, p0, Landroidx/recyclerview/widget/k;->B:Landroid/graphics/Rect;

    .line 44
    .line 45
    :cond_2
    iget-object v6, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 46
    .line 47
    iget-object v6, v6, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 48
    .line 49
    iget-object v7, p0, Landroidx/recyclerview/widget/k;->B:Landroid/graphics/Rect;

    .line 50
    .line 51
    invoke-virtual {v0, v6, v7}, Landroidx/recyclerview/widget/RecyclerView$o;->calculateItemDecorationsForChild(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    const/4 v7, 0x0

    .line 59
    if-eqz v6, :cond_4

    .line 60
    .line 61
    iget v6, p0, Landroidx/recyclerview/widget/k;->j:F

    .line 62
    .line 63
    iget v8, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 64
    .line 65
    add-float/2addr v6, v8

    .line 66
    float-to-int v6, v6

    .line 67
    iget-object v8, p0, Landroidx/recyclerview/widget/k;->B:Landroid/graphics/Rect;

    .line 68
    .line 69
    iget v8, v8, Landroid/graphics/Rect;->left:I

    .line 70
    .line 71
    sub-int v8, v6, v8

    .line 72
    .line 73
    iget-object v9, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 74
    .line 75
    invoke-virtual {v9}, Landroid/view/View;->getPaddingLeft()I

    .line 76
    .line 77
    .line 78
    move-result v9

    .line 79
    sub-int/2addr v8, v9

    .line 80
    iget v9, p0, Landroidx/recyclerview/widget/k;->h:F

    .line 81
    .line 82
    cmpg-float v10, v9, v7

    .line 83
    .line 84
    if-gez v10, :cond_3

    .line 85
    .line 86
    if-gez v8, :cond_3

    .line 87
    .line 88
    :goto_2
    move v11, v8

    .line 89
    goto :goto_3

    .line 90
    :cond_3
    cmpl-float v8, v9, v7

    .line 91
    .line 92
    if-lez v8, :cond_4

    .line 93
    .line 94
    iget-object v8, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 95
    .line 96
    iget-object v8, v8, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 97
    .line 98
    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    .line 99
    .line 100
    .line 101
    move-result v8

    .line 102
    add-int/2addr v6, v8

    .line 103
    iget-object v8, p0, Landroidx/recyclerview/widget/k;->B:Landroid/graphics/Rect;

    .line 104
    .line 105
    iget v8, v8, Landroid/graphics/Rect;->right:I

    .line 106
    .line 107
    add-int/2addr v6, v8

    .line 108
    iget-object v8, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 109
    .line 110
    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    .line 111
    .line 112
    .line 113
    move-result v8

    .line 114
    iget-object v9, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 115
    .line 116
    invoke-virtual {v9}, Landroid/view/View;->getPaddingRight()I

    .line 117
    .line 118
    .line 119
    move-result v9

    .line 120
    sub-int/2addr v8, v9

    .line 121
    sub-int v8, v6, v8

    .line 122
    .line 123
    if-lez v8, :cond_4

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_4
    move v11, v1

    .line 127
    :goto_3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollVertically()Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_6

    .line 132
    .line 133
    iget v0, p0, Landroidx/recyclerview/widget/k;->k:F

    .line 134
    .line 135
    iget v6, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 136
    .line 137
    add-float/2addr v0, v6

    .line 138
    float-to-int v0, v0

    .line 139
    iget-object v6, p0, Landroidx/recyclerview/widget/k;->B:Landroid/graphics/Rect;

    .line 140
    .line 141
    iget v6, v6, Landroid/graphics/Rect;->top:I

    .line 142
    .line 143
    sub-int v6, v0, v6

    .line 144
    .line 145
    iget-object v8, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 146
    .line 147
    invoke-virtual {v8}, Landroid/view/View;->getPaddingTop()I

    .line 148
    .line 149
    .line 150
    move-result v8

    .line 151
    sub-int/2addr v6, v8

    .line 152
    iget v8, p0, Landroidx/recyclerview/widget/k;->i:F

    .line 153
    .line 154
    cmpg-float v9, v8, v7

    .line 155
    .line 156
    if-gez v9, :cond_5

    .line 157
    .line 158
    if-gez v6, :cond_5

    .line 159
    .line 160
    goto :goto_4

    .line 161
    :cond_5
    cmpl-float v6, v8, v7

    .line 162
    .line 163
    if-lez v6, :cond_6

    .line 164
    .line 165
    iget-object v6, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 166
    .line 167
    iget-object v6, v6, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 168
    .line 169
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    .line 170
    .line 171
    .line 172
    move-result v6

    .line 173
    add-int/2addr v0, v6

    .line 174
    iget-object v6, p0, Landroidx/recyclerview/widget/k;->B:Landroid/graphics/Rect;

    .line 175
    .line 176
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 177
    .line 178
    add-int/2addr v0, v6

    .line 179
    iget-object v6, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 180
    .line 181
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    .line 182
    .line 183
    .line 184
    move-result v6

    .line 185
    iget-object v7, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 186
    .line 187
    invoke-virtual {v7}, Landroid/view/View;->getPaddingBottom()I

    .line 188
    .line 189
    .line 190
    move-result v7

    .line 191
    sub-int/2addr v6, v7

    .line 192
    sub-int v6, v0, v6

    .line 193
    .line 194
    if-lez v6, :cond_6

    .line 195
    .line 196
    goto :goto_4

    .line 197
    :cond_6
    move v6, v1

    .line 198
    :goto_4
    if-eqz v11, :cond_7

    .line 199
    .line 200
    iget-object v8, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 201
    .line 202
    iget-object v9, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 203
    .line 204
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 205
    .line 206
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 207
    .line 208
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 209
    .line 210
    .line 211
    move-result v10

    .line 212
    iget-object v0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 213
    .line 214
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 215
    .line 216
    .line 217
    move-result v12

    .line 218
    invoke-virtual/range {v8 .. v14}, Landroidx/recyclerview/widget/k$e;->p(Landroidx/recyclerview/widget/RecyclerView;IIIJ)I

    .line 219
    .line 220
    .line 221
    move-result v11

    .line 222
    :cond_7
    move v0, v11

    .line 223
    if-eqz v6, :cond_8

    .line 224
    .line 225
    iget-object v8, p0, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 226
    .line 227
    iget-object v9, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 228
    .line 229
    iget-object v7, p0, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 230
    .line 231
    iget-object v7, v7, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 232
    .line 233
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    .line 234
    .line 235
    .line 236
    move-result v10

    .line 237
    iget-object v7, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 238
    .line 239
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    .line 240
    .line 241
    .line 242
    move-result v12

    .line 243
    move v11, v6

    .line 244
    invoke-virtual/range {v8 .. v14}, Landroidx/recyclerview/widget/k$e;->p(Landroidx/recyclerview/widget/RecyclerView;IIIJ)I

    .line 245
    .line 246
    .line 247
    move-result v6

    .line 248
    goto :goto_5

    .line 249
    :cond_8
    move v11, v6

    .line 250
    :goto_5
    if-nez v0, :cond_a

    .line 251
    .line 252
    if-eqz v6, :cond_9

    .line 253
    .line 254
    goto :goto_6

    .line 255
    :cond_9
    iput-wide v2, p0, Landroidx/recyclerview/widget/k;->C:J

    .line 256
    .line 257
    return v1

    .line 258
    :cond_a
    :goto_6
    iget-wide v7, p0, Landroidx/recyclerview/widget/k;->C:J

    .line 259
    .line 260
    cmp-long v1, v7, v2

    .line 261
    .line 262
    if-nez v1, :cond_b

    .line 263
    .line 264
    iput-wide v4, p0, Landroidx/recyclerview/widget/k;->C:J

    .line 265
    .line 266
    :cond_b
    iget-object p0, p0, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 267
    .line 268
    invoke-virtual {p0, v0, v6}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 269
    .line 270
    .line 271
    const/4 p0, 0x1

    .line 272
    return p0
.end method

.method public z(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 18
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v11, p1

    .line 4
    .line 5
    move/from16 v12, p2

    .line 6
    .line 7
    iget-object v0, v1, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 8
    .line 9
    if-ne v11, v0, :cond_0

    .line 10
    .line 11
    iget v0, v1, Landroidx/recyclerview/widget/k;->n:I

    .line 12
    .line 13
    if-ne v12, v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-wide/high16 v2, -0x8000000000000000L

    .line 17
    .line 18
    iput-wide v2, v1, Landroidx/recyclerview/widget/k;->C:J

    .line 19
    .line 20
    iget v4, v1, Landroidx/recyclerview/widget/k;->n:I

    .line 21
    .line 22
    const/4 v13, 0x1

    .line 23
    invoke-virtual {v1, v11, v13}, Landroidx/recyclerview/widget/k;->l(Landroidx/recyclerview/widget/RecyclerView$e0;Z)V

    .line 24
    .line 25
    .line 26
    iput v12, v1, Landroidx/recyclerview/widget/k;->n:I

    .line 27
    .line 28
    const/4 v14, 0x2

    .line 29
    if-ne v12, v14, :cond_2

    .line 30
    .line 31
    if-eqz v11, :cond_1

    .line 32
    .line 33
    iget-object v0, v11, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 34
    .line 35
    iput-object v0, v1, Landroidx/recyclerview/widget/k;->w:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroidx/recyclerview/widget/k;->f()V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const-string v0, "Must pass a ViewHolder when dragging"

    .line 42
    .line 43
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    :goto_0
    mul-int/lit8 v0, v12, 0x8

    .line 48
    .line 49
    const/16 v15, 0x8

    .line 50
    .line 51
    add-int/2addr v0, v15

    .line 52
    shl-int v0, v13, v0

    .line 53
    .line 54
    add-int/lit8 v16, v0, -0x1

    .line 55
    .line 56
    iget-object v2, v1, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    if-eqz v2, :cond_9

    .line 60
    .line 61
    iget-object v3, v2, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    if-eqz v3, :cond_8

    .line 68
    .line 69
    if-ne v4, v14, :cond_3

    .line 70
    .line 71
    move v9, v0

    .line 72
    goto :goto_1

    .line 73
    :cond_3
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/k;->D(Landroidx/recyclerview/widget/RecyclerView$e0;)I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    move v9, v3

    .line 78
    :goto_1
    invoke-virtual {v1}, Landroidx/recyclerview/widget/k;->w()V

    .line 79
    .line 80
    .line 81
    const/4 v3, 0x4

    .line 82
    const/4 v5, 0x0

    .line 83
    if-eq v9, v13, :cond_5

    .line 84
    .line 85
    if-eq v9, v14, :cond_5

    .line 86
    .line 87
    if-eq v9, v3, :cond_4

    .line 88
    .line 89
    if-eq v9, v15, :cond_4

    .line 90
    .line 91
    const/16 v6, 0x10

    .line 92
    .line 93
    if-eq v9, v6, :cond_4

    .line 94
    .line 95
    const/16 v6, 0x20

    .line 96
    .line 97
    if-eq v9, v6, :cond_4

    .line 98
    .line 99
    move v7, v5

    .line 100
    move v8, v7

    .line 101
    goto :goto_2

    .line 102
    :cond_4
    iget v6, v1, Landroidx/recyclerview/widget/k;->h:F

    .line 103
    .line 104
    invoke-static {v6}, Ljava/lang/Math;->signum(F)F

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    iget-object v7, v1, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 109
    .line 110
    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    int-to-float v7, v7

    .line 115
    mul-float/2addr v6, v7

    .line 116
    move v8, v5

    .line 117
    move v7, v6

    .line 118
    goto :goto_2

    .line 119
    :cond_5
    iget v6, v1, Landroidx/recyclerview/widget/k;->i:F

    .line 120
    .line 121
    invoke-static {v6}, Ljava/lang/Math;->signum(F)F

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    iget-object v7, v1, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 126
    .line 127
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    .line 128
    .line 129
    .line 130
    move-result v7

    .line 131
    int-to-float v7, v7

    .line 132
    mul-float/2addr v6, v7

    .line 133
    move v7, v5

    .line 134
    move v8, v6

    .line 135
    :goto_2
    if-ne v4, v14, :cond_6

    .line 136
    .line 137
    move v3, v15

    .line 138
    goto :goto_3

    .line 139
    :cond_6
    if-lez v9, :cond_7

    .line 140
    .line 141
    move v3, v14

    .line 142
    :cond_7
    :goto_3
    iget-object v5, v1, Landroidx/recyclerview/widget/k;->b:[F

    .line 143
    .line 144
    invoke-virtual {v1, v5}, Landroidx/recyclerview/widget/k;->q([F)V

    .line 145
    .line 146
    .line 147
    iget-object v5, v1, Landroidx/recyclerview/widget/k;->b:[F

    .line 148
    .line 149
    move-object v6, v5

    .line 150
    aget v5, v6, v0

    .line 151
    .line 152
    aget v6, v6, v13

    .line 153
    .line 154
    move v10, v0

    .line 155
    new-instance v0, Landroidx/recyclerview/widget/k$c;

    .line 156
    .line 157
    move/from16 v17, v10

    .line 158
    .line 159
    move-object v10, v2

    .line 160
    move/from16 v13, v17

    .line 161
    .line 162
    invoke-direct/range {v0 .. v10}, Landroidx/recyclerview/widget/k$c;-><init>(Landroidx/recyclerview/widget/k;Landroidx/recyclerview/widget/RecyclerView$e0;IIFFFFILandroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 163
    .line 164
    .line 165
    iget-object v2, v1, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 166
    .line 167
    iget-object v4, v1, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 168
    .line 169
    sub-float/2addr v7, v5

    .line 170
    sub-float/2addr v8, v6

    .line 171
    invoke-virtual {v2, v4, v3, v7, v8}, Landroidx/recyclerview/widget/k$e;->g(Landroidx/recyclerview/widget/RecyclerView;IFF)J

    .line 172
    .line 173
    .line 174
    move-result-wide v2

    .line 175
    invoke-virtual {v0, v2, v3}, Landroidx/recyclerview/widget/k$g;->b(J)V

    .line 176
    .line 177
    .line 178
    iget-object v2, v1, Landroidx/recyclerview/widget/k;->p:Ljava/util/List;

    .line 179
    .line 180
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    invoke-virtual {v0}, Landroidx/recyclerview/widget/k$g;->d()V

    .line 184
    .line 185
    .line 186
    const/4 v0, 0x1

    .line 187
    goto :goto_4

    .line 188
    :cond_8
    move v13, v0

    .line 189
    iget-object v0, v2, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 190
    .line 191
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/k;->x(Landroid/view/View;)V

    .line 192
    .line 193
    .line 194
    iget-object v0, v1, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 195
    .line 196
    iget-object v3, v1, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 197
    .line 198
    invoke-virtual {v0, v3, v2}, Landroidx/recyclerview/widget/k$e;->c(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 199
    .line 200
    .line 201
    move v0, v13

    .line 202
    :goto_4
    const/4 v2, 0x0

    .line 203
    iput-object v2, v1, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 204
    .line 205
    goto :goto_5

    .line 206
    :cond_9
    move v13, v0

    .line 207
    :goto_5
    if-eqz v11, :cond_a

    .line 208
    .line 209
    iget-object v2, v1, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 210
    .line 211
    iget-object v3, v1, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 212
    .line 213
    invoke-virtual {v2, v3, v11}, Landroidx/recyclerview/widget/k$e;->f(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$e0;)I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    and-int v2, v2, v16

    .line 218
    .line 219
    iget v3, v1, Landroidx/recyclerview/widget/k;->n:I

    .line 220
    .line 221
    mul-int/2addr v3, v15

    .line 222
    shr-int/2addr v2, v3

    .line 223
    iput v2, v1, Landroidx/recyclerview/widget/k;->o:I

    .line 224
    .line 225
    iget-object v2, v11, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 226
    .line 227
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    int-to-float v2, v2

    .line 232
    iput v2, v1, Landroidx/recyclerview/widget/k;->j:F

    .line 233
    .line 234
    iget-object v2, v11, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 235
    .line 236
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    .line 237
    .line 238
    .line 239
    move-result v2

    .line 240
    int-to-float v2, v2

    .line 241
    iput v2, v1, Landroidx/recyclerview/widget/k;->k:F

    .line 242
    .line 243
    iput-object v11, v1, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 244
    .line 245
    if-ne v12, v14, :cond_a

    .line 246
    .line 247
    iget-object v2, v11, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 248
    .line 249
    invoke-virtual {v2, v13}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 250
    .line 251
    .line 252
    :cond_a
    iget-object v2, v1, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 253
    .line 254
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    if-eqz v2, :cond_c

    .line 259
    .line 260
    iget-object v3, v1, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 261
    .line 262
    if-eqz v3, :cond_b

    .line 263
    .line 264
    const/4 v13, 0x1

    .line 265
    :cond_b
    invoke-interface {v2, v13}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 266
    .line 267
    .line 268
    :cond_c
    if-nez v0, :cond_d

    .line 269
    .line 270
    iget-object v0, v1, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 271
    .line 272
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->requestSimpleAnimationsInNextLayout()V

    .line 277
    .line 278
    .line 279
    :cond_d
    iget-object v0, v1, Landroidx/recyclerview/widget/k;->m:Landroidx/recyclerview/widget/k$e;

    .line 280
    .line 281
    iget-object v2, v1, Landroidx/recyclerview/widget/k;->c:Landroidx/recyclerview/widget/RecyclerView$e0;

    .line 282
    .line 283
    iget v3, v1, Landroidx/recyclerview/widget/k;->n:I

    .line 284
    .line 285
    invoke-virtual {v0, v2, v3}, Landroidx/recyclerview/widget/k$e;->A(Landroidx/recyclerview/widget/RecyclerView$e0;I)V

    .line 286
    .line 287
    .line 288
    iget-object v0, v1, Landroidx/recyclerview/widget/k;->r:Landroidx/recyclerview/widget/RecyclerView;

    .line 289
    .line 290
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 291
    .line 292
    .line 293
    return-void
.end method
