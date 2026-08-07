.class public Lv/VList_Horizontal;
.super Landroid/widget/AdapterView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/VList_Horizontal$d;,
        Lv/VList_Horizontal$OnScrollStateChangedListener;,
        Lv/VList_Horizontal$e;,
        Lv/VList_Horizontal$f;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/AdapterView<",
        "Landroid/widget/ListAdapter;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Landroid/view/View$OnClickListener;

.field public B:Landroid/database/DataSetObserver;

.field public C:Ljava/lang/Runnable;

.field public a:Landroid/widget/Scroller;

.field public final b:Lv/VList_Horizontal$d;

.field public c:Landroid/view/GestureDetector;

.field public d:I

.field public e:Landroid/widget/ListAdapter;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Queue<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field public g:Z

.field public h:Landroid/graphics/Rect;

.field public i:Landroid/view/View;

.field public j:I

.field public k:Landroid/graphics/drawable/Drawable;

.field public l:I

.field public m:I

.field public n:Ljava/lang/Integer;

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:Z

.field public u:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

.field public v:Ll/mke;

.field public w:Ll/mke;

.field public x:I

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/AdapterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/widget/Scroller;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 14
    .line 15
    new-instance v0, Lv/VList_Horizontal$d;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-direct {v0, p0, v1}, Lv/VList_Horizontal$d;-><init>(Lv/VList_Horizontal;Ll/ryk0;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lv/VList_Horizontal;->b:Lv/VList_Horizontal$d;

    .line 22
    .line 23
    new-instance v2, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Lv/VList_Horizontal;->f:Ljava/util/List;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    iput-boolean v2, p0, Lv/VList_Horizontal;->g:Z

    .line 32
    .line 33
    new-instance v3, Landroid/graphics/Rect;

    .line 34
    .line 35
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v3, p0, Lv/VList_Horizontal;->h:Landroid/graphics/Rect;

    .line 39
    .line 40
    iput-object v1, p0, Lv/VList_Horizontal;->i:Landroid/view/View;

    .line 41
    .line 42
    iput v2, p0, Lv/VList_Horizontal;->j:I

    .line 43
    .line 44
    iput-object v1, p0, Lv/VList_Horizontal;->k:Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    iput-object v1, p0, Lv/VList_Horizontal;->n:Ljava/lang/Integer;

    .line 47
    .line 48
    const v1, 0x7fffffff

    .line 49
    .line 50
    .line 51
    iput v1, p0, Lv/VList_Horizontal;->o:I

    .line 52
    .line 53
    iput v2, p0, Lv/VList_Horizontal;->s:I

    .line 54
    .line 55
    iput-boolean v2, p0, Lv/VList_Horizontal;->t:Z

    .line 56
    .line 57
    sget-object v1, Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;->SCROLL_STATE_IDLE:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 58
    .line 59
    iput-object v1, p0, Lv/VList_Horizontal;->u:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 60
    .line 61
    iput-boolean v2, p0, Lv/VList_Horizontal;->y:Z

    .line 62
    .line 63
    iput-boolean v2, p0, Lv/VList_Horizontal;->z:Z

    .line 64
    .line 65
    new-instance v1, Lv/VList_Horizontal$b;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Lv/VList_Horizontal$b;-><init>(Lv/VList_Horizontal;)V

    .line 68
    .line 69
    .line 70
    iput-object v1, p0, Lv/VList_Horizontal;->B:Landroid/database/DataSetObserver;

    .line 71
    .line 72
    new-instance v1, Lv/VList_Horizontal$c;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Lv/VList_Horizontal$c;-><init>(Lv/VList_Horizontal;)V

    .line 75
    .line 76
    .line 77
    iput-object v1, p0, Lv/VList_Horizontal;->C:Ljava/lang/Runnable;

    .line 78
    .line 79
    new-instance v1, Ll/mke;

    .line 80
    .line 81
    invoke-direct {v1, p1}, Ll/mke;-><init>(Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    iput-object v1, p0, Lv/VList_Horizontal;->v:Ll/mke;

    .line 85
    .line 86
    new-instance v1, Ll/mke;

    .line 87
    .line 88
    invoke-direct {v1, p1}, Ll/mke;-><init>(Landroid/content/Context;)V

    .line 89
    .line 90
    .line 91
    iput-object v1, p0, Lv/VList_Horizontal;->w:Ll/mke;

    .line 92
    .line 93
    new-instance v1, Landroid/view/GestureDetector;

    .line 94
    .line 95
    invoke-direct {v1, p1, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 96
    .line 97
    .line 98
    iput-object v1, p0, Lv/VList_Horizontal;->c:Landroid/view/GestureDetector;

    .line 99
    .line 100
    invoke-virtual {p0}, Lv/VList_Horizontal;->n()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Lv/VList_Horizontal;->C()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, p1, p2}, Lv/VList_Horizontal;->Q(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, v2}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 110
    .line 111
    .line 112
    iget-object p2, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 113
    .line 114
    const v0, 0x3c1374bc    # 0.009f

    .line 115
    .line 116
    .line 117
    invoke-static {p2, v0}, Lv/VList_Horizontal$e;->a(Landroid/widget/Scroller;F)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->B(Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public static bridge synthetic a(Lv/VList_Horizontal;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lv/VList_Horizontal;->y:Z

    return p0
.end method

.method public static bridge synthetic b(Lv/VList_Horizontal;)Landroid/view/GestureDetector;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VList_Horizontal;->c:Landroid/view/GestureDetector;

    return-object p0
.end method

.method public static bridge synthetic c(Lv/VList_Horizontal;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/VList_Horizontal;->p:I

    return p0
.end method

.method public static bridge synthetic d(Lv/VList_Horizontal;)Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VList_Horizontal;->A:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method public static bridge synthetic e(Lv/VList_Horizontal;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/VList_Horizontal;->g:Z

    return-void
.end method

.method public static bridge synthetic f(Lv/VList_Horizontal;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/VList_Horizontal;->t:Z

    return-void
.end method

.method public static bridge synthetic g(Lv/VList_Horizontal;II)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lv/VList_Horizontal;->y(II)I

    move-result p0

    return p0
.end method

.method private getLeftmostChild()Landroid/view/View;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method private getRenderHeight()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr v0, p0

    .line 15
    return v0
.end method

.method private getRenderWidth()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sub-int/2addr v0, p0

    .line 15
    return v0
.end method

.method private getRightmostChild()Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static bridge synthetic h(Lv/VList_Horizontal;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->O(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static bridge synthetic i(Lv/VList_Horizontal;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/VList_Horizontal;->P()V

    return-void
.end method

.method public static bridge synthetic j(Lv/VList_Horizontal;Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VList_Horizontal;->setCurrentScrollState(Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;)V

    return-void
.end method

.method public static bridge synthetic k(Lv/VList_Horizontal;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/VList_Horizontal;->R()V

    return-void
.end method

.method public static bridge synthetic l(Lv/VList_Horizontal;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->S(I)V

    return-void
.end method

.method private setCurrentScrollState(Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VList_Horizontal;->u:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public final A(I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Landroid/widget/Adapter;->getItemViewType(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->F(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lv/VList_Horizontal;->f:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/util/Queue;

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Landroid/view/View;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public final B(Landroid/content/Context;)V
    .locals 0

    .line 1
    sget-boolean p1, Ll/bnl0;->b:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final C()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lv/VList_Horizontal;->p:I

    .line 3
    .line 4
    iput v0, p0, Lv/VList_Horizontal;->q:I

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lv/VList_Horizontal;->d:I

    .line 8
    .line 9
    iput v0, p0, Lv/VList_Horizontal;->l:I

    .line 10
    .line 11
    iput v0, p0, Lv/VList_Horizontal;->m:I

    .line 12
    .line 13
    const v0, 0x7fffffff

    .line 14
    .line 15
    .line 16
    iput v0, p0, Lv/VList_Horizontal;->o:I

    .line 17
    .line 18
    sget-object v0, Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;->SCROLL_STATE_IDLE:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 19
    .line 20
    invoke-direct {p0, v0}, Lv/VList_Horizontal;->setCurrentScrollState(Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final D(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    if-ge v0, p1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lv/VList_Horizontal;->f:Ljava/util/List;

    .line 10
    .line 11
    new-instance v2, Ljava/util/LinkedList;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method public final E()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-interface {v0}, Landroid/widget/Adapter;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget p0, p0, Lv/VList_Horizontal;->o:I

    .line 14
    .line 15
    if-lez p0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    return v1
.end method

.method public final F(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VList_Horizontal;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ge p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final G(I)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/widget/Adapter;->getCount()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    sub-int/2addr p0, v0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public final H(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->z(Landroid/view/View;)Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lv/VList_Horizontal;->x:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr v2, p0

    .line 16
    iget p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 17
    .line 18
    invoke-static {v1, v2, p0}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 23
    .line 24
    if-lez v0, :cond_0

    .line 25
    .line 26
    const/high16 v1, 0x40000000    # 2.0f

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 v0, 0x0

    .line 34
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    :goto_0
    invoke-virtual {p1, v0, p0}, Landroid/view/View;->measure(II)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public I(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    xor-int/2addr v0, v1

    .line 9
    iput-boolean v0, p0, Lv/VList_Horizontal;->y:Z

    .line 10
    .line 11
    iget-object v0, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;->SCROLL_STATE_IDLE:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 17
    .line 18
    invoke-direct {p0, v0}, Lv/VList_Horizontal;->setCurrentScrollState(Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lv/VList_Horizontal;->R()V

    .line 22
    .line 23
    .line 24
    iget-boolean v0, p0, Lv/VList_Horizontal;->y:Z

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    float-to-int v0, v0

    .line 33
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    float-to-int p1, p1

    .line 38
    invoke-virtual {p0, v0, p1}, Lv/VList_Horizontal;->y(II)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-ltz p1, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lv/VList_Horizontal;->i:Landroid/view/View;

    .line 49
    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Landroid/view/View;->setPressed(Z)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    .line 56
    .line 57
    .line 58
    :cond_0
    return v1
.end method

.method public J(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 9

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 2
    .line 3
    iget v1, p0, Lv/VList_Horizontal;->m:I

    .line 4
    .line 5
    neg-float p1, p3

    .line 6
    float-to-int v3, p1

    .line 7
    iget v6, p0, Lv/VList_Horizontal;->o:I

    .line 8
    .line 9
    const/4 v7, 0x0

    .line 10
    const/4 v8, 0x0

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v4, 0x0

    .line 13
    const/4 v5, 0x0

    .line 14
    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;->SCROLL_STATE_FLING:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 18
    .line 19
    invoke-direct {p0, p1}, Lv/VList_Horizontal;->setCurrentScrollState(Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0
.end method

.method public final K(I)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget v1, p0, Lv/VList_Horizontal;->d:I

    .line 8
    .line 9
    add-int/2addr v1, p1

    .line 10
    iput v1, p0, Lv/VList_Horizontal;->d:I

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    :goto_0
    if-ge p1, v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    add-int/2addr v3, v1

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    add-int/2addr v5, v3

    .line 33
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    add-int/2addr v6, v4

    .line 38
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iget v3, p0, Lv/VList_Horizontal;->j:I

    .line 46
    .line 47
    add-int/2addr v2, v3

    .line 48
    add-int/2addr v1, v2

    .line 49
    add-int/lit8 p1, p1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    return-void
.end method

.method public final L(ILandroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Landroid/widget/Adapter;->getItemViewType(I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->F(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lv/VList_Horizontal;->f:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/util/Queue;

    .line 20
    .line 21
    invoke-interface {p0, p2}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final M()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->v:Ll/mke;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mke;->i()Z

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lv/VList_Horizontal;->w:Ll/mke;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/mke;->i()Z

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public final N(I)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lv/VList_Horizontal;->getLeftmostChild()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :goto_0
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    add-int/2addr v1, p1

    .line 12
    if-gtz v1, :cond_1

    .line 13
    .line 14
    iget v1, p0, Lv/VList_Horizontal;->d:I

    .line 15
    .line 16
    iget v2, p0, Lv/VList_Horizontal;->p:I

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Lv/VList_Horizontal;->G(I)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    iget v2, p0, Lv/VList_Horizontal;->j:I

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    add-int/2addr v2, v3

    .line 36
    :goto_1
    add-int/2addr v1, v2

    .line 37
    iput v1, p0, Lv/VList_Horizontal;->d:I

    .line 38
    .line 39
    iget v1, p0, Lv/VList_Horizontal;->p:I

    .line 40
    .line 41
    invoke-virtual {p0, v1, v0}, Lv/VList_Horizontal;->L(ILandroid/view/View;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    iget v0, p0, Lv/VList_Horizontal;->p:I

    .line 48
    .line 49
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    iput v0, p0, Lv/VList_Horizontal;->p:I

    .line 52
    .line 53
    invoke-direct {p0}, Lv/VList_Horizontal;->getLeftmostChild()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-direct {p0}, Lv/VList_Horizontal;->getRightmostChild()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    :goto_2
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    add-int/2addr v1, p1

    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-lt v1, v2, :cond_2

    .line 74
    .line 75
    iget v1, p0, Lv/VList_Horizontal;->q:I

    .line 76
    .line 77
    invoke-virtual {p0, v1, v0}, Lv/VList_Horizontal;->L(ILandroid/view/View;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeViewInLayout(Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    iget v0, p0, Lv/VList_Horizontal;->q:I

    .line 84
    .line 85
    add-int/lit8 v0, v0, -0x1

    .line 86
    .line 87
    iput v0, p0, Lv/VList_Horizontal;->q:I

    .line 88
    .line 89
    invoke-direct {p0}, Lv/VList_Horizontal;->getRightmostChild()Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    goto :goto_2

    .line 94
    :cond_2
    return-void
.end method

.method public final O(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lv/VList_Horizontal;->z:Z

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eq v0, v1, :cond_2

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    :goto_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    instance-of v1, v1, Landroid/view/View;

    .line 15
    .line 16
    if-eqz v1, :cond_2

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    instance-of v1, v1, Landroid/widget/ListView;

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    instance-of v1, v1, Landroid/widget/ScrollView;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/view/View;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    :goto_1
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput-boolean p1, p0, Lv/VList_Horizontal;->z:Z

    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method public final P()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/VList_Horizontal;->C()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViewsInLayout()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final Q(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    sget-object v0, Ll/hhc0;->R3:[I

    .line 4
    .line 5
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget p2, Ll/hhc0;->T3:I

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Lv/VList_Horizontal;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    sget p2, Ll/hhc0;->S3:I

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, p2}, Lv/VList_Horizontal;->setDividerWidth(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 33
    .line 34
    .line 35
    :cond_2
    return-void
.end method

.method public final R()V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->i:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lv/VList_Horizontal;->i:Landroid/view/View;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final S(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->v:Ll/mke;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lv/VList_Horizontal;->w:Ll/mke;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget v0, p0, Lv/VList_Horizontal;->l:I

    .line 11
    .line 12
    add-int/2addr v0, p1

    .line 13
    iget-object v1, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1}, Landroid/widget/Scroller;->isFinished()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_3

    .line 22
    .line 23
    :cond_1
    if-gez v0, :cond_2

    .line 24
    .line 25
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object v0, p0, Lv/VList_Horizontal;->v:Ll/mke;

    .line 30
    .line 31
    int-to-float p1, p1

    .line 32
    invoke-direct {p0}, Lv/VList_Horizontal;->getRenderWidth()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-float v1, v1

    .line 37
    div-float/2addr p1, v1

    .line 38
    invoke-virtual {v0, p1}, Ll/mke;->g(F)Z

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lv/VList_Horizontal;->w:Ll/mke;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/mke;->d()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_3

    .line 48
    .line 49
    iget-object p0, p0, Lv/VList_Horizontal;->w:Ll/mke;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/mke;->i()Z

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    iget v1, p0, Lv/VList_Horizontal;->o:I

    .line 56
    .line 57
    if-le v0, v1, :cond_3

    .line 58
    .line 59
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    iget-object v0, p0, Lv/VList_Horizontal;->w:Ll/mke;

    .line 64
    .line 65
    int-to-float p1, p1

    .line 66
    invoke-direct {p0}, Lv/VList_Horizontal;->getRenderWidth()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    int-to-float v1, v1

    .line 71
    div-float/2addr p1, v1

    .line 72
    invoke-virtual {v0, p1}, Ll/mke;->g(F)Z

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lv/VList_Horizontal;->v:Ll/mke;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/mke;->d()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    iget-object p0, p0, Lv/VList_Horizontal;->v:Ll/mke;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/mke;->i()Z

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_0
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->t(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public dispatchSetPressed(Z)V
    .locals 0

    return-void
.end method

.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/VList_Horizontal;->getAdapter()Landroid/widget/ListAdapter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getAdapter()Landroid/widget/ListAdapter;
    .locals 0

    .line 6
    iget-object p0, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    return-object p0
.end method

.method public getFirstVisiblePosition()I
    .locals 0

    .line 1
    iget p0, p0, Lv/VList_Horizontal;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public getLastVisiblePosition()I
    .locals 0

    .line 1
    iget p0, p0, Lv/VList_Horizontal;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public getLeftFadingEdgeStrength()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHorizontalFadingEdgeLength()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Lv/VList_Horizontal;->l:I

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    if-ge p0, v0, :cond_1

    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    int-to-float v0, v0

    .line 15
    div-float/2addr p0, v0

    .line 16
    return p0

    .line 17
    :cond_1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 18
    .line 19
    return p0
.end method

.method public getRightFadingEdgeStrength()F
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHorizontalFadingEdgeLength()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lv/VList_Horizontal;->l:I

    .line 6
    .line 7
    iget p0, p0, Lv/VList_Horizontal;->o:I

    .line 8
    .line 9
    if-ne v1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    sub-int v2, p0, v1

    .line 14
    .line 15
    if-ge v2, v0, :cond_1

    .line 16
    .line 17
    sub-int/2addr p0, v1

    .line 18
    int-to-float p0, p0

    .line 19
    int-to-float v0, v0

    .line 20
    div-float/2addr p0, v0

    .line 21
    return p0

    .line 22
    :cond_1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 23
    .line 24
    return p0
.end method

.method public getSelectedView()Landroid/view/View;
    .locals 1

    .line 1
    iget v0, p0, Lv/VList_Horizontal;->r:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lv/VList_Horizontal;->x(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final m(Landroid/view/View;I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->z(Landroid/view/View;)Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, p1, p2, v0, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->H(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final n()V
    .locals 1

    .line 1
    new-instance v0, Lv/VList_Horizontal$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lv/VList_Horizontal$a;-><init>(Lv/VList_Horizontal;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final o()F
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 2
    .line 3
    invoke-static {p0}, Lv/VList_Horizontal$f;->a(Landroid/widget/Scroller;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->s(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongCall"
        }
    .end annotation

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/AdapterView;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto/16 :goto_1

    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    iget-boolean v0, p0, Lv/VList_Horizontal;->g:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget v0, p0, Lv/VList_Horizontal;->l:I

    .line 19
    .line 20
    invoke-virtual {p0}, Lv/VList_Horizontal;->C()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViewsInLayout()V

    .line 24
    .line 25
    .line 26
    iput v0, p0, Lv/VList_Horizontal;->m:I

    .line 27
    .line 28
    iput-boolean v1, p0, Lv/VList_Horizontal;->g:Z

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lv/VList_Horizontal;->n:Ljava/lang/Integer;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lv/VList_Horizontal;->m:I

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    iput-object v0, p0, Lv/VList_Horizontal;->n:Ljava/lang/Integer;

    .line 42
    .line 43
    :cond_2
    iget-object v0, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    iget-object v0, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Lv/VList_Horizontal;->m:I

    .line 58
    .line 59
    :cond_3
    iget v0, p0, Lv/VList_Horizontal;->m:I

    .line 60
    .line 61
    const/4 v2, 0x1

    .line 62
    if-gez v0, :cond_5

    .line 63
    .line 64
    iput v1, p0, Lv/VList_Horizontal;->m:I

    .line 65
    .line 66
    iget-object v0, p0, Lv/VList_Horizontal;->v:Ll/mke;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/mke;->d()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    iget-object v0, p0, Lv/VList_Horizontal;->v:Ll/mke;

    .line 75
    .line 76
    invoke-virtual {p0}, Lv/VList_Horizontal;->o()F

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    float-to-int v1, v1

    .line 81
    invoke-virtual {v0, v1}, Ll/mke;->e(I)Z

    .line 82
    .line 83
    .line 84
    :cond_4
    iget-object v0, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 87
    .line 88
    .line 89
    sget-object v0, Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;->SCROLL_STATE_IDLE:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 90
    .line 91
    invoke-direct {p0, v0}, Lv/VList_Horizontal;->setCurrentScrollState(Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_5
    iget v1, p0, Lv/VList_Horizontal;->o:I

    .line 96
    .line 97
    if-le v0, v1, :cond_7

    .line 98
    .line 99
    iput v1, p0, Lv/VList_Horizontal;->m:I

    .line 100
    .line 101
    iget-object v0, p0, Lv/VList_Horizontal;->w:Ll/mke;

    .line 102
    .line 103
    invoke-virtual {v0}, Ll/mke;->d()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_6

    .line 108
    .line 109
    iget-object v0, p0, Lv/VList_Horizontal;->w:Ll/mke;

    .line 110
    .line 111
    invoke-virtual {p0}, Lv/VList_Horizontal;->o()F

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    float-to-int v1, v1

    .line 116
    invoke-virtual {v0, v1}, Ll/mke;->e(I)Z

    .line 117
    .line 118
    .line 119
    :cond_6
    iget-object v0, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 122
    .line 123
    .line 124
    sget-object v0, Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;->SCROLL_STATE_IDLE:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 125
    .line 126
    invoke-direct {p0, v0}, Lv/VList_Horizontal;->setCurrentScrollState(Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;)V

    .line 127
    .line 128
    .line 129
    :cond_7
    :goto_0
    iget v0, p0, Lv/VList_Horizontal;->l:I

    .line 130
    .line 131
    iget v1, p0, Lv/VList_Horizontal;->m:I

    .line 132
    .line 133
    sub-int/2addr v0, v1

    .line 134
    invoke-virtual {p0, v0}, Lv/VList_Horizontal;->N(I)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lv/VList_Horizontal;->u(I)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, v0}, Lv/VList_Horizontal;->K(I)V

    .line 141
    .line 142
    .line 143
    iget v0, p0, Lv/VList_Horizontal;->m:I

    .line 144
    .line 145
    iput v0, p0, Lv/VList_Horizontal;->l:I

    .line 146
    .line 147
    invoke-virtual {p0}, Lv/VList_Horizontal;->q()Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_8

    .line 152
    .line 153
    invoke-virtual/range {p0 .. p5}, Lv/VList_Horizontal;->onLayout(ZIIII)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_8
    iget-object p1, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 158
    .line 159
    invoke-virtual {p1}, Landroid/widget/Scroller;->isFinished()Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_a

    .line 164
    .line 165
    iget-object p1, p0, Lv/VList_Horizontal;->u:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 166
    .line 167
    sget-object p2, Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;->SCROLL_STATE_FLING:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 168
    .line 169
    if-ne p1, p2, :cond_9

    .line 170
    .line 171
    sget-object p1, Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;->SCROLL_STATE_IDLE:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 172
    .line 173
    invoke-direct {p0, p1}, Lv/VList_Horizontal;->setCurrentScrollState(Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;)V

    .line 174
    .line 175
    .line 176
    :cond_9
    :goto_1
    return-void

    .line 177
    :cond_a
    iget-object p1, p0, Lv/VList_Horizontal;->C:Ljava/lang/Runnable;

    .line 178
    .line 179
    invoke-static {p0, p1}, Ll/kkl0;->b0(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lv/VList_Horizontal;->x:I

    .line 5
    .line 6
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    .line 1
    instance-of v0, p1, Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Landroid/os/Bundle;

    .line 6
    .line 7
    const-string v0, "BUNDLE_ID_CURRENT_X"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lv/VList_Horizontal;->n:Ljava/lang/Integer;

    .line 18
    .line 19
    const-string v0, "BUNDLE_ID_PARENT_STATE"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-super {p0, p1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "BUNDLE_ID_PARENT_STATE"

    .line 7
    .line 8
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "BUNDLE_ID_CURRENT_X"

    .line 16
    .line 17
    iget p0, p0, Lv/VList_Horizontal;->l:I

    .line 18
    .line 19
    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_2

    .line 7
    .line 8
    iget-object v0, p0, Lv/VList_Horizontal;->a:Landroid/widget/Scroller;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    :cond_0
    sget-object v0, Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;->SCROLL_STATE_IDLE:Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;

    .line 19
    .line 20
    invoke-direct {p0, v0}, Lv/VList_Horizontal;->setCurrentScrollState(Lv/VList_Horizontal$OnScrollStateChangedListener$ScrollState;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lv/VList_Horizontal;->O(Ljava/lang/Boolean;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lv/VList_Horizontal;->M()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/4 v1, 0x3

    .line 37
    if-ne v0, v1, :cond_3

    .line 38
    .line 39
    invoke-virtual {p0}, Lv/VList_Horizontal;->R()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lv/VList_Horizontal;->M()V

    .line 43
    .line 44
    .line 45
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lv/VList_Horizontal;->O(Ljava/lang/Boolean;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    :goto_0
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    return p0
.end method

.method public final p()V
    .locals 0

    .line 1
    return-void
.end method

.method public final q()Z
    .locals 5

    .line 1
    iget v0, p0, Lv/VList_Horizontal;->q:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lv/VList_Horizontal;->G(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-direct {p0}, Lv/VList_Horizontal;->getRightmostChild()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget v2, p0, Lv/VList_Horizontal;->o:I

    .line 17
    .line 18
    iget v3, p0, Lv/VList_Horizontal;->l:I

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    sub-int/2addr v0, v4

    .line 29
    add-int/2addr v3, v0

    .line 30
    invoke-direct {p0}, Lv/VList_Horizontal;->getRenderWidth()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sub-int/2addr v3, v0

    .line 35
    iput v3, p0, Lv/VList_Horizontal;->o:I

    .line 36
    .line 37
    if-gez v3, :cond_0

    .line 38
    .line 39
    iput v1, p0, Lv/VList_Horizontal;->o:I

    .line 40
    .line 41
    :cond_0
    iget p0, p0, Lv/VList_Horizontal;->o:I

    .line 42
    .line 43
    if-eq p0, v2, :cond_1

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    return v1
.end method

.method public final r(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->k:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lv/VList_Horizontal;->k:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final s(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lv/VList_Horizontal;->h:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    iget-object v2, p0, Lv/VList_Horizontal;->h:Landroid/graphics/Rect;

    .line 14
    .line 15
    iget v3, v2, Landroid/graphics/Rect;->top:I

    .line 16
    .line 17
    invoke-direct {p0}, Lv/VList_Horizontal;->getRenderHeight()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    add-int/2addr v3, v4

    .line 22
    iput v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    :goto_0
    if-ge v2, v0, :cond_4

    .line 26
    .line 27
    add-int/lit8 v3, v0, -0x1

    .line 28
    .line 29
    if-ne v2, v3, :cond_0

    .line 30
    .line 31
    iget v3, p0, Lv/VList_Horizontal;->q:I

    .line 32
    .line 33
    invoke-virtual {p0, v3}, Lv/VList_Horizontal;->G(I)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_3

    .line 38
    .line 39
    :cond_0
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    iput v4, v1, Landroid/graphics/Rect;->left:I

    .line 48
    .line 49
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    iget v5, p0, Lv/VList_Horizontal;->j:I

    .line 54
    .line 55
    add-int/2addr v4, v5

    .line 56
    iput v4, v1, Landroid/graphics/Rect;->right:I

    .line 57
    .line 58
    iget v4, v1, Landroid/graphics/Rect;->left:I

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-ge v4, v5, :cond_1

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    iput v4, v1, Landroid/graphics/Rect;->left:I

    .line 71
    .line 72
    :cond_1
    iget v4, v1, Landroid/graphics/Rect;->right:I

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    sub-int/2addr v5, v6

    .line 83
    if-le v4, v5, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    sub-int/2addr v4, v5

    .line 94
    iput v4, v1, Landroid/graphics/Rect;->right:I

    .line 95
    .line 96
    :cond_2
    invoke-virtual {p0, p1, v1}, Lv/VList_Horizontal;->r(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 97
    .line 98
    .line 99
    if-nez v2, :cond_3

    .line 100
    .line 101
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    if-le v4, v5, :cond_3

    .line 110
    .line 111
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    iput v4, v1, Landroid/graphics/Rect;->left:I

    .line 116
    .line 117
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    iput v3, v1, Landroid/graphics/Rect;->right:I

    .line 122
    .line 123
    invoke-virtual {p0, p1, v1}, Lv/VList_Horizontal;->r(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 124
    .line 125
    .line 126
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_4
    return-void
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    .line 35
    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lv/VList_Horizontal;->B:Landroid/database/DataSetObserver;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Landroid/widget/Adapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lv/VList_Horizontal;->t:Z

    .line 14
    .line 15
    iput-object p1, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 16
    .line 17
    iget-object v0, p0, Lv/VList_Horizontal;->B:Landroid/database/DataSetObserver;

    .line 18
    .line 19
    invoke-interface {p1, v0}, Landroid/widget/Adapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object p1, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 23
    .line 24
    invoke-interface {p1}, Landroid/widget/Adapter;->getViewTypeCount()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->D(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lv/VList_Horizontal;->P()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public setDivider(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VList_Horizontal;->k:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->setDividerWidth(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Lv/VList_Horizontal;->setDividerWidth(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setDividerWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/VList_Horizontal;->j:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VList_Horizontal;->A:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnScrollStateChangedListener(Lv/VList_Horizontal$OnScrollStateChangedListener;)V
    .locals 0

    return-void
.end method

.method public setSelection(I)V
    .locals 2

    .line 1
    iput p1, p0, Lv/VList_Horizontal;->r:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    move v0, p1

    .line 5
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, p1}, Landroid/view/View;->setActivated(Z)V

    .line 16
    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p0}, Lv/VList_Horizontal;->getSelectedView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lv/VList_Horizontal;->getSelectedView()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 p1, 0x1

    .line 32
    invoke-virtual {p0, p1}, Landroid/view/View;->setActivated(Z)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public final t(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lv/VList_Horizontal;->v:Ll/mke;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/mke;->d()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lv/VList_Horizontal;->E()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const/high16 v3, -0x3d4c0000    # -90.0f

    .line 27
    .line 28
    invoke-virtual {p1, v3, v1, v1}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 29
    .line 30
    .line 31
    neg-int v2, v2

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    add-int/2addr v2, v3

    .line 37
    int-to-float v2, v2

    .line 38
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lv/VList_Horizontal;->v:Ll/mke;

    .line 42
    .line 43
    invoke-direct {p0}, Lv/VList_Horizontal;->getRenderHeight()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-direct {p0}, Lv/VList_Horizontal;->getRenderWidth()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-virtual {v1, v2, v3}, Ll/mke;->j(II)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lv/VList_Horizontal;->v:Ll/mke;

    .line 55
    .line 56
    invoke-virtual {v1, p1}, Ll/mke;->b(Landroid/graphics/Canvas;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_0

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 63
    .line 64
    .line 65
    :cond_0
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    iget-object v0, p0, Lv/VList_Horizontal;->w:Ll/mke;

    .line 70
    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/mke;->d()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_3

    .line 78
    .line 79
    invoke-virtual {p0}, Lv/VList_Horizontal;->E()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_3

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    const/high16 v3, 0x42b40000    # 90.0f

    .line 94
    .line 95
    invoke-virtual {p1, v3, v1, v1}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    int-to-float v1, v1

    .line 103
    neg-int v2, v2

    .line 104
    int-to-float v2, v2

    .line 105
    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lv/VList_Horizontal;->w:Ll/mke;

    .line 109
    .line 110
    invoke-direct {p0}, Lv/VList_Horizontal;->getRenderHeight()I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    invoke-direct {p0}, Lv/VList_Horizontal;->getRenderWidth()I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    invoke-virtual {v1, v2, v3}, Ll/mke;->j(II)V

    .line 119
    .line 120
    .line 121
    iget-object v1, p0, Lv/VList_Horizontal;->w:Ll/mke;

    .line 122
    .line 123
    invoke-virtual {v1, p1}, Ll/mke;->b(Landroid/graphics/Canvas;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_2

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 130
    .line 131
    .line 132
    :cond_2
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 133
    .line 134
    .line 135
    :cond_3
    return-void
.end method

.method public final u(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lv/VList_Horizontal;->getRightmostChild()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v0, v1

    .line 14
    :goto_0
    invoke-virtual {p0, v0, p1}, Lv/VList_Horizontal;->w(II)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lv/VList_Horizontal;->getLeftmostChild()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    :cond_1
    invoke-virtual {p0, v1, p1}, Lv/VList_Horizontal;->v(II)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final v(II)V
    .locals 5

    .line 1
    :goto_0
    add-int v0, p1, p2

    .line 2
    .line 3
    iget v1, p0, Lv/VList_Horizontal;->j:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    if-lez v0, :cond_3

    .line 7
    .line 8
    iget v0, p0, Lv/VList_Horizontal;->p:I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-lt v0, v1, :cond_3

    .line 12
    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    iput v0, p0, Lv/VList_Horizontal;->p:I

    .line 16
    .line 17
    iget-object v2, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lv/VList_Horizontal;->A(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-interface {v2, v0, v3, p0}, Landroid/widget/Adapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget v2, p0, Lv/VList_Horizontal;->p:I

    .line 28
    .line 29
    iget v3, p0, Lv/VList_Horizontal;->r:I

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    if-ne v2, v3, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    invoke-virtual {v0, v4}, Landroid/view/View;->setActivated(Z)V

    .line 39
    .line 40
    .line 41
    :goto_1
    invoke-virtual {p0, v0, v4}, Lv/VList_Horizontal;->m(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    iget v1, p0, Lv/VList_Horizontal;->p:I

    .line 45
    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    goto :goto_2

    .line 53
    :cond_1
    iget v1, p0, Lv/VList_Horizontal;->j:I

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    add-int/2addr v1, v2

    .line 60
    :goto_2
    sub-int/2addr p1, v1

    .line 61
    iget v1, p0, Lv/VList_Horizontal;->d:I

    .line 62
    .line 63
    add-int v2, p1, p2

    .line 64
    .line 65
    if-nez v2, :cond_2

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    goto :goto_3

    .line 72
    :cond_2
    iget v2, p0, Lv/VList_Horizontal;->j:I

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr v0, v2

    .line 79
    :goto_3
    sub-int/2addr v1, v0

    .line 80
    iput v1, p0, Lv/VList_Horizontal;->d:I

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_3
    return-void
.end method

.method public final w(II)V
    .locals 5

    .line 1
    :goto_0
    add-int v0, p1, p2

    .line 2
    .line 3
    iget v1, p0, Lv/VList_Horizontal;->j:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ge v0, v1, :cond_3

    .line 11
    .line 12
    iget v0, p0, Lv/VList_Horizontal;->q:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    add-int/2addr v0, v1

    .line 16
    iget-object v2, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 17
    .line 18
    invoke-interface {v2}, Landroid/widget/Adapter;->getCount()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-ge v0, v2, :cond_3

    .line 23
    .line 24
    iget v0, p0, Lv/VList_Horizontal;->q:I

    .line 25
    .line 26
    add-int/2addr v0, v1

    .line 27
    iput v0, p0, Lv/VList_Horizontal;->q:I

    .line 28
    .line 29
    iget v2, p0, Lv/VList_Horizontal;->p:I

    .line 30
    .line 31
    if-gez v2, :cond_0

    .line 32
    .line 33
    iput v0, p0, Lv/VList_Horizontal;->p:I

    .line 34
    .line 35
    :cond_0
    iget-object v2, p0, Lv/VList_Horizontal;->e:Landroid/widget/ListAdapter;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lv/VList_Horizontal;->A(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-interface {v2, v0, v3, p0}, Landroid/widget/Adapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget v2, p0, Lv/VList_Horizontal;->q:I

    .line 46
    .line 47
    iget v3, p0, Lv/VList_Horizontal;->r:I

    .line 48
    .line 49
    const/4 v4, 0x0

    .line 50
    if-ne v2, v3, :cond_1

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {v0, v4}, Landroid/view/View;->setActivated(Z)V

    .line 57
    .line 58
    .line 59
    :goto_1
    const/4 v1, -0x1

    .line 60
    invoke-virtual {p0, v0, v1}, Lv/VList_Horizontal;->m(Landroid/view/View;I)V

    .line 61
    .line 62
    .line 63
    iget v1, p0, Lv/VList_Horizontal;->q:I

    .line 64
    .line 65
    if-nez v1, :cond_2

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_2
    iget v4, p0, Lv/VList_Horizontal;->j:I

    .line 69
    .line 70
    :goto_2
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    add-int/2addr v4, v0

    .line 75
    add-int/2addr p1, v4

    .line 76
    invoke-virtual {p0}, Lv/VList_Horizontal;->p()V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    return-void
.end method

.method public final x(I)Landroid/view/View;
    .locals 2

    .line 1
    iget v0, p0, Lv/VList_Horizontal;->p:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    iget v1, p0, Lv/VList_Horizontal;->q:I

    .line 6
    .line 7
    if-gt p1, v1, :cond_0

    .line 8
    .line 9
    sub-int/2addr p1, v0

    .line 10
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public final y(II)I
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget-object v3, p0, Lv/VList_Horizontal;->h:Landroid/graphics/Rect;

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lv/VList_Horizontal;->h:Landroid/graphics/Rect;

    .line 18
    .line 19
    invoke-virtual {v2, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    return v1

    .line 26
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p0, -0x1

    .line 30
    return p0
.end method

.method public final z(Landroid/view/View;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    const/4 p1, -0x2

    .line 10
    const/4 v0, -0x1

    .line 11
    invoke-direct {p0, p1, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object p0
.end method
