.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;,
        Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;
    }
.end annotation


# instance fields
.field public a:Ll/gmf;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/atl;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

.field public d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:Landroid/view/VelocityTracker;

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:Ll/kcg0;

.field public r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;",
            ">;"
        }
    .end annotation
.end field

.field public s:Z

.field public t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

.field public u:Landroid/animation/ValueAnimator;

.field public v:Landroid/animation/TimeInterpolator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->d:Lrx/subjects/a;

    .line 9
    .line 10
    const/16 p1, 0x4650

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->e:I

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->n:I

    .line 16
    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->o:I

    .line 18
    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->q:Ll/kcg0;

    .line 23
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 30
    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->s:Z

    .line 32
    .line 33
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 36
    .line 37
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;

    .line 38
    .line 39
    invoke-direct {p1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->v:Landroid/animation/TimeInterpolator;

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->Q0()V

    .line 45
    .line 46
    .line 47
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

    .line 48
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->d:Lrx/subjects/a;

    const/16 p1, 0x4650

    .line 50
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->e:I

    const/4 p1, 0x0

    .line 51
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->n:I

    .line 52
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->o:I

    .line 53
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    const/4 p2, 0x0

    .line 54
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->q:Ll/kcg0;

    .line 55
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 56
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->s:Z

    .line 57
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 58
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->v:Landroid/animation/TimeInterpolator;

    .line 59
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->Q0()V

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

    .line 60
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 61
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->d:Lrx/subjects/a;

    const/16 p1, 0x4650

    .line 62
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->e:I

    const/4 p1, 0x0

    .line 63
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->n:I

    .line 64
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->o:I

    .line 65
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    const/4 p2, 0x0

    .line 66
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->q:Ll/kcg0;

    .line 67
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 68
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->s:Z

    .line 69
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 70
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->v:Landroid/animation/TimeInterpolator;

    .line 71
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->Q0()V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;ILjava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->i1(ILjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private P0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->i:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->i:Landroid/view/VelocityTracker;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private Q0()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->f:I

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g:I

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->h:I

    .line 41
    .line 42
    new-instance v0, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b:Ljava/util/List;

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->setElevation(F)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private getItemAllHeight()I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v0, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 12
    .line 13
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Landroid/util/SparseArray;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Landroid/util/Pair;

    .line 22
    .line 23
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v2, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    add-int/2addr v1, v2

    .line 32
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return v1
.end method

.method private getRendingInfo()Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 23
    .line 24
    new-instance v3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-object v4, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v4, ","

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget v5, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 40
    .line 41
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget v4, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 48
    .line 49
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v4, " , "

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->o:I

    .line 58
    .line 59
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v2, " | "

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string v2, " \u5b57\u6570\u91cf\uff1a"

    .line 78
    .line 79
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0
.end method

.method private getTopEmptyFixHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->o:I

    .line 2
    .line 3
    return p0
.end method

.method private getTopFix()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->S0(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->R0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;)Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    return-object p0
.end method


# virtual methods
.method public final D0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->E0(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final E0(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p2, 0x0

    .line 8
    if-ltz p1, :cond_4

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-ge p1, v0, :cond_4

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 34
    .line 35
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->B(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-ge p2, p1, :cond_3

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 53
    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 57
    .line 58
    if-ne v0, v1, :cond_2

    .line 59
    .line 60
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 61
    .line 62
    if-gtz v0, :cond_2

    .line 63
    .line 64
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 65
    .line 66
    if-lez v0, :cond_2

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 69
    .line 70
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-ne v0, p2, :cond_1

    .line 75
    .line 76
    if-nez p2, :cond_1

    .line 77
    .line 78
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 79
    .line 80
    if-nez v0, :cond_1

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_1

    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 91
    .line 92
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 93
    .line 94
    .line 95
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 96
    .line 97
    invoke-static {v0, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->A(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 101
    .line 102
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 103
    .line 104
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->B(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 105
    .line 106
    .line 107
    :cond_2
    add-int/lit8 p2, p2, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_3
    return-void

    .line 111
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 112
    .line 113
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->A(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 117
    .line 118
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->B(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final F0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-lez v0, :cond_3

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    move v1, v0

    .line 25
    move v2, v1

    .line 26
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-ge v1, v3, :cond_1

    .line 33
    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 41
    .line 42
    iget-object v4, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 43
    .line 44
    sget-object v5, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 45
    .line 46
    if-ne v4, v5, :cond_0

    .line 47
    .line 48
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    if-eqz v4, :cond_0

    .line 53
    .line 54
    iget v2, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->o:I

    .line 55
    .line 56
    invoke-virtual {p0, v3, v1, v2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IIZ)V

    .line 57
    .line 58
    .line 59
    const/4 v2, 0x1

    .line 60
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    if-eqz v2, :cond_3

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->Y0()V

    .line 66
    .line 67
    .line 68
    const-string v0, "measure once"

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->D0(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->s0()V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 83
    .line 84
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-ge v0, v1, :cond_2

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->J0()V

    .line 91
    .line 92
    .line 93
    :cond_2
    const-string v0, "checkChildRequestLayout"

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->T0(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->M0()V

    .line 99
    .line 100
    .line 101
    :cond_3
    return-void
.end method

.method public final G0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 p1, 0x0

    .line 32
    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/view/View;->layout(IIII)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public final H0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->q:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->G(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->O(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->G(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c1(Z)V

    .line 20
    .line 21
    .line 22
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 29
    .line 30
    if-ge v0, p1, :cond_2

    .line 31
    .line 32
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->Z0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final J0()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    :cond_0
    :goto_0
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ge v0, v1, :cond_3

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 24
    .line 25
    iget-object v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 26
    .line 27
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 28
    .line 29
    if-ne v2, v3, :cond_1

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    add-int/lit8 v2, v2, -0x1

    .line 38
    .line 39
    if-ne v0, v2, :cond_0

    .line 40
    .line 41
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 44
    .line 45
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-gt v1, v2, :cond_0

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 53
    .line 54
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 55
    .line 56
    const/4 v5, 0x0

    .line 57
    if-ne v2, v3, :cond_2

    .line 58
    .line 59
    invoke-virtual {v4, v0}, Ll/gmf;->e(I)I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->N0(I)Ll/dmf;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    iget-object v4, v3, Ll/dmf;->a:Landroid/view/View;

    .line 68
    .line 69
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    invoke-virtual {p0, v4, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    .line 75
    .line 76
    iput-object v3, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 77
    .line 78
    const-string v3, "fill bottom idle"

    .line 79
    .line 80
    invoke-virtual {p0, v1, v0, v2, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iput v5, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->c:I

    .line 84
    .line 85
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 86
    .line 87
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    iput v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 92
    .line 93
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 94
    .line 95
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    iput v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->e:I

    .line 100
    .line 101
    iget v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 102
    .line 103
    iget v3, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 104
    .line 105
    add-int/2addr v2, v3

    .line 106
    iput v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 109
    .line 110
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->D(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 114
    .line 115
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_2
    invoke-virtual {v4, v0}, Ll/gmf;->e(I)I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    const-string v3, "fill bottom recycle"

    .line 124
    .line 125
    invoke-virtual {p0, v1, v0, v2, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IILjava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iput v5, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->c:I

    .line 129
    .line 130
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 131
    .line 132
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    iput v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 137
    .line 138
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 139
    .line 140
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    iput v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->e:I

    .line 145
    .line 146
    iget v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 147
    .line 148
    iget v3, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 149
    .line 150
    add-int/2addr v2, v3

    .line 151
    iput v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 154
    .line 155
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->D(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 156
    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 159
    .line 160
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 161
    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_3
    :goto_1
    return-void
.end method

.method public final K0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    const/16 v1, 0x11

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->R(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->L0()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->d:Lrx/subjects/a;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->R(I)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->requestLayout()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 44
    .line 45
    const/16 v0, 0x10

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->R(I)Z

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final L0()V
    .locals 12

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->z(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c1(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-ltz v1, :cond_0

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/gmf;->c()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-lt v1, v2, :cond_1

    .line 29
    .line 30
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 31
    .line 32
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->B(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 36
    .line 37
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->A(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 38
    .line 39
    .line 40
    move v1, v0

    .line 41
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 42
    .line 43
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 48
    .line 49
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-ge v2, v3, :cond_5

    .line 54
    .line 55
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 56
    .line 57
    invoke-virtual {v3}, Ll/gmf;->c()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-ge v1, v3, :cond_5

    .line 62
    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-ge v1, v3, :cond_5

    .line 70
    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 78
    .line 79
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 80
    .line 81
    .line 82
    move-result-wide v4

    .line 83
    iget-object v6, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 84
    .line 85
    sget-object v7, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 86
    .line 87
    const-string v8, "Type: "

    .line 88
    .line 89
    if-ne v6, v7, :cond_2

    .line 90
    .line 91
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 92
    .line 93
    invoke-virtual {v6, v1}, Ll/gmf;->e(I)I

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    invoke-virtual {p0, v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->N0(I)Ll/dmf;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    new-instance v9, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    new-instance v9, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v10, " crTime: "

    .line 112
    .line 113
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 117
    .line 118
    .line 119
    move-result-wide v10

    .line 120
    sub-long/2addr v10, v4

    .line 121
    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget-object v4, v7, Ll/dmf;->a:Landroid/view/View;

    .line 125
    .line 126
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    invoke-virtual {p0, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    .line 132
    .line 133
    iput-object v7, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 134
    .line 135
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 136
    .line 137
    .line 138
    move-result-wide v4

    .line 139
    const-string v7, "idle create"

    .line 140
    .line 141
    invoke-virtual {p0, v3, v1, v6, v7}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IILjava/lang/String;)V

    .line 142
    .line 143
    .line 144
    new-instance v7, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    new-instance v6, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    const-string v7, " bdTime: "

    .line 155
    .line 156
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 160
    .line 161
    .line 162
    move-result-wide v7

    .line 163
    sub-long/2addr v7, v4

    .line 164
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 168
    .line 169
    :goto_1
    add-int/2addr v2, v3

    .line 170
    goto :goto_2

    .line 171
    :cond_2
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->BE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 172
    .line 173
    if-ne v6, v4, :cond_3

    .line 174
    .line 175
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 176
    .line 177
    .line 178
    move-result-wide v4

    .line 179
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getType()I

    .line 180
    .line 181
    .line 182
    move-result v6

    .line 183
    const-string v7, "be_recycle"

    .line 184
    .line 185
    invoke-virtual {p0, v3, v1, v6, v7}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IILjava/lang/String;)V

    .line 186
    .line 187
    .line 188
    new-instance v6, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    iget v7, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->o:I

    .line 194
    .line 195
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    new-instance v6, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    const-string v7, " rdTime: "

    .line 201
    .line 202
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 206
    .line 207
    .line 208
    move-result-wide v7

    .line 209
    sub-long/2addr v7, v4

    .line 210
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    iget v3, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 214
    .line 215
    goto :goto_1

    .line 216
    :cond_3
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 217
    .line 218
    if-ne v6, v4, :cond_4

    .line 219
    .line 220
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 221
    .line 222
    invoke-virtual {v4, v1}, Ll/gmf;->e(I)I

    .line 223
    .line 224
    .line 225
    move-result v4

    .line 226
    invoke-virtual {p0, v3, v1, v4, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IIZ)V

    .line 227
    .line 228
    .line 229
    iput-boolean v0, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->b:Z

    .line 230
    .line 231
    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :cond_5
    const-string v1, "before order"

    .line 236
    .line 237
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->U0(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->Y0()V

    .line 241
    .line 242
    .line 243
    const-string v1, "after order"

    .line 244
    .line 245
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->U0(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    const-string v1, "fill list"

    .line 249
    .line 250
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->D0(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->s0()V

    .line 254
    .line 255
    .line 256
    const-string v1, "fillListInner"

    .line 257
    .line 258
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->T0(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->M0()V

    .line 262
    .line 263
    .line 264
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 265
    .line 266
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->z(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 267
    .line 268
    .line 269
    return-void
.end method

.method public final M0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    add-int/lit8 v1, v1, -0x1

    .line 22
    .line 23
    if-ne v0, v1, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-ge v0, v1, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-ltz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 48
    .line 49
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-lez v0, :cond_1

    .line 54
    .line 55
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getFixPaddingBottom()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    add-int/2addr v0, v1

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getInnerTransY()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    add-int/2addr v0, v1

    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 72
    .line 73
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-ge v0, v1, :cond_1

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 80
    .line 81
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopFix()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    add-int/2addr v0, v1

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getFixPaddingBottom()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    add-int/2addr v0, v1

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getInnerTransY()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    add-int/2addr v0, v1

    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 101
    .line 102
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    sub-int/2addr v0, v1

    .line 107
    const-string v1, "fix-notify-opt"

    .line 108
    .line 109
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->i1(ILjava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    :cond_1
    return-void
.end method

.method public final N0(I)Ll/dmf;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->W0()Ll/knf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/knf;->a(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Ll/gmf;->b(Landroid/view/ViewGroup;I)Ll/dmf;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    sget-object p0, Ll/dmf;->d:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {v0, p0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ll/dmf;

    .line 29
    .line 30
    return-object p0
.end method

.method public final O0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_3

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    iget v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopFix()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-le v2, v3, :cond_2

    .line 34
    .line 35
    iget v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 36
    .line 37
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 38
    .line 39
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-lt v2, v3, :cond_1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    iget-object v2, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 47
    .line 48
    iget v3, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 49
    .line 50
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    const/4 v5, 0x1

    .line 57
    invoke-virtual {v2, v5, v3, v1, v4}, Ll/dmf;->u(ZIII)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    :goto_1
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    const/4 v3, 0x0

    .line 68
    invoke-virtual {v1, v3, v3, v3, v2}, Ll/dmf;->u(ZIII)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    return-void
.end method

.method public final synthetic R0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->o:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->d(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic S0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->X0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final T0(Ljava/lang/String;)V
    .locals 6

    .line 1
    const/4 p1, 0x0

    .line 2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-ge p1, v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 17
    .line 18
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 19
    .line 20
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 21
    .line 22
    if-ne v1, v2, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->c:I

    .line 29
    .line 30
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->i:I

    .line 31
    .line 32
    add-int/2addr v2, v3

    .line 33
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->j:I

    .line 34
    .line 35
    add-int/2addr v2, v3

    .line 36
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 37
    .line 38
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->j:I

    .line 39
    .line 40
    add-int/2addr v3, v4

    .line 41
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopFix()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    add-int/2addr v3, v4

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getInnerTransY()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    add-int/2addr v3, v4

    .line 51
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->e:I

    .line 52
    .line 53
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->k:I

    .line 54
    .line 55
    sub-int/2addr v4, v5

    .line 56
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l:I

    .line 57
    .line 58
    sub-int/2addr v4, v5

    .line 59
    iget v5, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 60
    .line 61
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->l:I

    .line 62
    .line 63
    sub-int/2addr v5, v0

    .line 64
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopFix()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    add-int/2addr v5, v0

    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getInnerTransY()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr v5, v0

    .line 74
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/view/View;->layout(IIII)V

    .line 75
    .line 76
    .line 77
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->f1()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->O0()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final U0(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final V0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/dmf;->r()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return-void
.end method

.method public W0()Ll/knf;
    .locals 1

    .line 1
    invoke-static {}, Ll/rof;->d()Ll/rof;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Ll/rof;->c(Lcom/p1/mobile/android/app/Act;)Ll/knf;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public X(Ll/atl;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 21
    .line 22
    invoke-interface {p1, p0}, Ll/atl;->s0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public final X0()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->p(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->p(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->o(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 26
    .line 27
    invoke-virtual {v3}, Ll/gmf;->f()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    move v0, v2

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_0
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c1(Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->O(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)V

    .line 46
    .line 47
    .line 48
    move v0, v1

    .line 49
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 50
    .line 51
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 52
    .line 53
    invoke-virtual {v4}, Ll/gmf;->f()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->F(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    new-instance v3, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v4, "pre order: "

    .line 63
    .line 64
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->U0(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    if-nez v0, :cond_2

    .line 78
    .line 79
    const-string v3, "res render"

    .line 80
    .line 81
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->D0(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    new-instance v3, Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .line 88
    .line 89
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 90
    .line 91
    invoke-virtual {v4}, Ll/gmf;->c()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    move v5, v2

    .line 96
    :goto_2
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 97
    .line 98
    if-ge v5, v4, :cond_3

    .line 99
    .line 100
    invoke-virtual {v6, v5}, Ll/gmf;->e(I)I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    add-int/lit8 v5, v5, 0x1

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_3
    invoke-virtual {v6}, Ll/gmf;->c()I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    new-instance v5, Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .line 122
    .line 123
    move v6, v2

    .line 124
    :goto_3
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 125
    .line 126
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 127
    .line 128
    .line 129
    move-result v7

    .line 130
    if-ge v6, v7, :cond_5

    .line 131
    .line 132
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 133
    .line 134
    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    check-cast v7, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 139
    .line 140
    iput-boolean v2, v7, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->b:Z

    .line 141
    .line 142
    iput-boolean v2, v7, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->n:Z

    .line 143
    .line 144
    iget-object v8, v7, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 145
    .line 146
    sget-object v9, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->BE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 147
    .line 148
    if-ne v8, v9, :cond_4

    .line 149
    .line 150
    sget-object v8, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->PRE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 151
    .line 152
    iput-object v8, v7, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 153
    .line 154
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 155
    .line 156
    goto :goto_3

    .line 157
    :cond_5
    move v6, v2

    .line 158
    :goto_4
    if-ge v6, v4, :cond_b

    .line 159
    .line 160
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v7

    .line 164
    check-cast v7, Ljava/lang/Integer;

    .line 165
    .line 166
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 167
    .line 168
    .line 169
    move-result v7

    .line 170
    move v8, v2

    .line 171
    :goto_5
    iget-object v9, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 172
    .line 173
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 174
    .line 175
    .line 176
    move-result v9

    .line 177
    if-ge v8, v9, :cond_8

    .line 178
    .line 179
    iget-object v9, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 180
    .line 181
    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v9

    .line 185
    check-cast v9, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 186
    .line 187
    iget v10, v9, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->o:I

    .line 188
    .line 189
    if-ne v10, v7, :cond_7

    .line 190
    .line 191
    iget-object v10, v9, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 192
    .line 193
    sget-object v11, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 194
    .line 195
    if-eq v10, v11, :cond_6

    .line 196
    .line 197
    sget-object v11, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->PRE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 198
    .line 199
    if-ne v10, v11, :cond_7

    .line 200
    .line 201
    :cond_6
    iget-object v8, v9, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 202
    .line 203
    if-eqz v8, :cond_9

    .line 204
    .line 205
    invoke-virtual {v8}, Ll/dmf;->o()V

    .line 206
    .line 207
    .line 208
    iget-object v8, v9, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 209
    .line 210
    invoke-virtual {v8}, Ll/dmf;->s()V

    .line 211
    .line 212
    .line 213
    if-eqz v0, :cond_9

    .line 214
    .line 215
    iput-boolean v1, v9, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->n:Z

    .line 216
    .line 217
    iget-object v8, v9, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 218
    .line 219
    invoke-virtual {v8}, Ll/dmf;->t()V

    .line 220
    .line 221
    .line 222
    goto :goto_6

    .line 223
    :cond_7
    add-int/lit8 v8, v8, 0x1

    .line 224
    .line 225
    goto :goto_5

    .line 226
    :cond_8
    const/4 v9, 0x0

    .line 227
    :cond_9
    :goto_6
    if-eqz v9, :cond_a

    .line 228
    .line 229
    sget-object v7, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->BE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 230
    .line 231
    iput-object v7, v9, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 232
    .line 233
    goto :goto_7

    .line 234
    :cond_a
    new-instance v9, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 235
    .line 236
    invoke-direct {v9, v7}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;-><init>(I)V

    .line 237
    .line 238
    .line 239
    :goto_7
    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    add-int/lit8 v6, v6, 0x1

    .line 243
    .line 244
    goto :goto_4

    .line 245
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 246
    .line 247
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    :cond_c
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    if-eqz v2, :cond_d

    .line 256
    .line 257
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 262
    .line 263
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 264
    .line 265
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 266
    .line 267
    if-eq v3, v4, :cond_c

    .line 268
    .line 269
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->BE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 270
    .line 271
    if-eq v3, v4, :cond_c

    .line 272
    .line 273
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->PRE_REMOVE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 274
    .line 275
    iput-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 276
    .line 277
    goto :goto_8

    .line 278
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 279
    .line 280
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    :cond_e
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    if-eqz v2, :cond_10

    .line 289
    .line 290
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 295
    .line 296
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 297
    .line 298
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->PRE_REMOVE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 299
    .line 300
    if-ne v3, v4, :cond_e

    .line 301
    .line 302
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 303
    .line 304
    if-eqz v3, :cond_f

    .line 305
    .line 306
    iget-boolean v4, v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->n:Z

    .line 307
    .line 308
    if-nez v4, :cond_f

    .line 309
    .line 310
    invoke-virtual {v3}, Ll/dmf;->t()V

    .line 311
    .line 312
    .line 313
    :cond_f
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 314
    .line 315
    .line 316
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->Z0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;)V

    .line 317
    .line 318
    .line 319
    goto :goto_9

    .line 320
    :cond_10
    iput-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 321
    .line 322
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 323
    .line 324
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->d(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    if-ltz v0, :cond_11

    .line 329
    .line 330
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 331
    .line 332
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 333
    .line 334
    new-instance v3, Ll/lk2;

    .line 335
    .line 336
    invoke-direct {v3, p0}, Ll/lk2;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;)V

    .line 337
    .line 338
    .line 339
    invoke-static {v2, v3}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 340
    .line 341
    .line 342
    move-result v2

    .line 343
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->t(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 344
    .line 345
    .line 346
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 347
    .line 348
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->P(I)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->v0()V

    .line 352
    .line 353
    .line 354
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->K0()V

    .line 355
    .line 356
    .line 357
    return-void
.end method

.method public final Y0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

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
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-ge v2, v3, :cond_2

    .line 16
    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 24
    .line 25
    iget-object v4, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 26
    .line 27
    sget-object v5, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 28
    .line 29
    if-ne v4, v5, :cond_0

    .line 30
    .line 31
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 32
    .line 33
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-lt v2, v4, :cond_1

    .line 38
    .line 39
    iput v0, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 40
    .line 41
    iput v1, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->c:I

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->e:I

    .line 50
    .line 51
    iget v0, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 52
    .line 53
    iget v4, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 54
    .line 55
    add-int/2addr v0, v4

    .line 56
    iput v0, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_0
    sget-object v5, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->BE_RECYCLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 60
    .line 61
    if-ne v4, v5, :cond_1

    .line 62
    .line 63
    iput v1, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 64
    .line 65
    iput v1, v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 66
    .line 67
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->G0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    return-void
.end method

.method public final Z0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dmf;->s()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/dmf;->o()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->W0()Ll/knf;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p1}, Ll/knf;->c(Ll/o4m;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final a1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IIZ)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/16 v1, 0x8

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v0, v2

    .line 25
    :goto_0
    instance-of v1, p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    check-cast p3, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    iget v1, p3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 32
    .line 33
    iput v1, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->i:I

    .line 34
    .line 35
    iget v1, p3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 36
    .line 37
    iput v1, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->j:I

    .line 38
    .line 39
    iget v1, p3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 40
    .line 41
    iput v1, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->k:I

    .line 42
    .line 43
    iget p3, p3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 44
    .line 45
    iput p3, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->l:I

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iput v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->i:I

    .line 50
    .line 51
    iput v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->j:I

    .line 52
    .line 53
    iput v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->k:I

    .line 54
    .line 55
    iput v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->l:I

    .line 56
    .line 57
    :cond_1
    if-eqz p4, :cond_2

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    :cond_2
    if-nez p4, :cond_4

    .line 62
    .line 63
    if-nez v0, :cond_4

    .line 64
    .line 65
    iget-object p3, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 66
    .line 67
    iget-object p3, p3, Ll/dmf;->a:Landroid/view/View;

    .line 68
    .line 69
    invoke-virtual {p3}, Landroid/view/View;->isLayoutRequested()Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-eqz p3, :cond_4

    .line 74
    .line 75
    :cond_3
    iget-object p3, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 76
    .line 77
    iget-object p3, p3, Ll/dmf;->a:Landroid/view/View;

    .line 78
    .line 79
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 80
    .line 81
    invoke-static {p4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 82
    .line 83
    .line 84
    move-result p4

    .line 85
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->j:I

    .line 86
    .line 87
    sub-int/2addr p4, v1

    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l:I

    .line 89
    .line 90
    sub-int/2addr p4, v1

    .line 91
    iget v1, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->i:I

    .line 92
    .line 93
    sub-int/2addr p4, v1

    .line 94
    iget v1, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->k:I

    .line 95
    .line 96
    sub-int/2addr p4, v1

    .line 97
    const/high16 v1, 0x40000000    # 2.0f

    .line 98
    .line 99
    invoke-static {p4, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 100
    .line 101
    .line 102
    move-result p4

    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 104
    .line 105
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->k:I

    .line 110
    .line 111
    sub-int/2addr v1, v3

    .line 112
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->n:I

    .line 113
    .line 114
    sub-int/2addr v1, v3

    .line 115
    iget v3, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->j:I

    .line 116
    .line 117
    sub-int/2addr v1, v3

    .line 118
    iget v3, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->l:I

    .line 119
    .line 120
    sub-int/2addr v1, v3

    .line 121
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    invoke-virtual {p3, p4, v1}, Landroid/view/View;->measure(II)V

    .line 126
    .line 127
    .line 128
    :cond_4
    if-eqz v0, :cond_5

    .line 129
    .line 130
    iput v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 131
    .line 132
    iput v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->g:I

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_5
    iget-object p3, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 136
    .line 137
    iget-object p3, p3, Ll/dmf;->a:Landroid/view/View;

    .line 138
    .line 139
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    .line 140
    .line 141
    .line 142
    move-result p3

    .line 143
    iget p4, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->j:I

    .line 144
    .line 145
    add-int/2addr p3, p4

    .line 146
    iget p4, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->l:I

    .line 147
    .line 148
    add-int/2addr p3, p4

    .line 149
    iput p3, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 150
    .line 151
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 152
    .line 153
    invoke-static {p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 154
    .line 155
    .line 156
    move-result p3

    .line 157
    iget p4, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->i:I

    .line 158
    .line 159
    add-int/2addr p3, p4

    .line 160
    iget p4, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->k:I

    .line 161
    .line 162
    add-int/2addr p3, p4

    .line 163
    iput p3, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->g:I

    .line 164
    .line 165
    :goto_1
    iput-boolean v2, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->b:Z

    .line 166
    .line 167
    sget-object p3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 168
    .line 169
    iput-object p3, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 170
    .line 171
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 172
    .line 173
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Landroid/util/SparseArray;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 178
    .line 179
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 180
    .line 181
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-static {p3, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p0, p2, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public b1(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->j:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->k:I

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l:I

    .line 6
    .line 7
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->m:I

    .line 8
    .line 9
    return-void
.end method

.method public c0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getFirstShowingHolder()Ll/dmf;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dmf;->h()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c1(Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->e(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->v(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 23
    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->V()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final d0()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->i:Landroid/view/VelocityTracker;

    .line 2
    .line 3
    const/16 v1, 0x3e8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getYVelocity()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/high16 v1, 0x40200000    # 2.5f

    .line 13
    .line 14
    div-float/2addr v0, v1

    .line 15
    float-to-int v0, v0

    .line 16
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->h:I

    .line 21
    .line 22
    if-le v1, v2, :cond_0

    .line 23
    .line 24
    const/16 v1, 0x640

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g:I

    .line 32
    .line 33
    if-le v1, v2, :cond_1

    .line 34
    .line 35
    const/16 v1, 0x384

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/16 v1, 0x12c

    .line 39
    .line 40
    :goto_0
    const/16 v2, 0x4650

    .line 41
    .line 42
    if-lt v0, v2, :cond_2

    .line 43
    .line 44
    :goto_1
    move v0, v2

    .line 45
    goto :goto_2

    .line 46
    :cond_2
    const/16 v2, -0x4650

    .line 47
    .line 48
    if-gt v0, v2, :cond_3

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_3
    :goto_2
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->SCROLL_ANIM:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 52
    .line 53
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 57
    .line 58
    int-to-long v3, v1

    .line 59
    neg-int v1, v0

    .line 60
    invoke-static {v2, v3, v4, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->N(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;JI)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 68
    .line 69
    .line 70
    return v0
.end method

.method public d1()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->L(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->DRAGGING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->v(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->V()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public doFrame(J)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->e(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p1, :cond_7

    .line 11
    .line 12
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 17
    .line 18
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-ne p2, v1, :cond_0

    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 31
    .line 32
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 37
    .line 38
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-ge p2, v1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 51
    .line 52
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    const/4 v1, 0x0

    .line 57
    if-lez p2, :cond_1

    .line 58
    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 60
    .line 61
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 66
    .line 67
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    sub-int/2addr v2, v0

    .line 72
    if-ne p2, v2, :cond_1

    .line 73
    .line 74
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 89
    .line 90
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iget v2, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 95
    .line 96
    add-int/2addr v0, v2

    .line 97
    iget v2, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->l:I

    .line 98
    .line 99
    add-int/2addr v0, v2

    .line 100
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->k:I

    .line 101
    .line 102
    add-int/2addr v0, v2

    .line 103
    sub-int/2addr v0, p1

    .line 104
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 105
    .line 106
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-ge v0, v2, :cond_1

    .line 111
    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 113
    .line 114
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iget v0, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 119
    .line 120
    add-int/2addr p1, v0

    .line 121
    iget p2, p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->l:I

    .line 122
    .line 123
    add-int/2addr p1, p2

    .line 124
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->k:I

    .line 125
    .line 126
    add-int/2addr p1, p2

    .line 127
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 128
    .line 129
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->b(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    sub-int/2addr p1, p2

    .line 134
    const-string p2, "auto_scroll_case1"

    .line 135
    .line 136
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->i1(ILjava/lang/String;)Z

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 140
    .line 141
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->v(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 142
    .line 143
    .line 144
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 145
    .line 146
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_1
    const-string p2, "auto_scroll_case2"

    .line 151
    .line 152
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->i1(ILjava/lang/String;)Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 157
    .line 158
    if-eqz p1, :cond_2

    .line 159
    .line 160
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->v(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 161
    .line 162
    .line 163
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 164
    .line 165
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_2
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 174
    .line 175
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    if-ne p1, p2, :cond_3

    .line 180
    .line 181
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 182
    .line 183
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-gtz p1, :cond_3

    .line 188
    .line 189
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 190
    .line 191
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    const-string p2, "auto_scroll_case3"

    .line 196
    .line 197
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->i1(ILjava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 201
    .line 202
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->v(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 203
    .line 204
    .line 205
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 206
    .line 207
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 212
    .line 213
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 218
    .line 219
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 220
    .line 221
    .line 222
    move-result p2

    .line 223
    if-ge p1, p2, :cond_6

    .line 224
    .line 225
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 226
    .line 227
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 232
    .line 233
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 234
    .line 235
    .line 236
    move-result p2

    .line 237
    if-le p1, p2, :cond_4

    .line 238
    .line 239
    goto :goto_1

    .line 240
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 241
    .line 242
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 243
    .line 244
    .line 245
    move-result p1

    .line 246
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 247
    .line 248
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 249
    .line 250
    .line 251
    move-result p2

    .line 252
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 253
    .line 254
    if-ge p1, p2, :cond_5

    .line 255
    .line 256
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 257
    .line 258
    .line 259
    move-result p1

    .line 260
    add-int/lit8 p1, p1, 0x14

    .line 261
    .line 262
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->u(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 263
    .line 264
    .line 265
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 266
    .line 267
    const/16 p2, 0x1f4

    .line 268
    .line 269
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    .line 274
    .line 275
    .line 276
    move-result p2

    .line 277
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->u(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 278
    .line 279
    .line 280
    goto :goto_0

    .line 281
    :cond_5
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    add-int/lit8 p1, p1, -0x14

    .line 286
    .line 287
    const/16 p2, 0x32

    .line 288
    .line 289
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 290
    .line 291
    .line 292
    move-result p1

    .line 293
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->u(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 294
    .line 295
    .line 296
    :goto_0
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 301
    .line 302
    .line 303
    return-void

    .line 304
    :cond_6
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 305
    .line 306
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->v(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 307
    .line 308
    .line 309
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 310
    .line 311
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 312
    .line 313
    .line 314
    return-void

    .line 315
    :cond_7
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->L(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z

    .line 316
    .line 317
    .line 318
    move-result p1

    .line 319
    if-nez p1, :cond_9

    .line 320
    .line 321
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 322
    .line 323
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->M(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 324
    .line 325
    .line 326
    move-result p1

    .line 327
    const-string p2, "touch_anim"

    .line 328
    .line 329
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->i1(ILjava/lang/String;)Z

    .line 330
    .line 331
    .line 332
    move-result p1

    .line 333
    if-nez p1, :cond_8

    .line 334
    .line 335
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 336
    .line 337
    .line 338
    move-result-object p1

    .line 339
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 340
    .line 341
    .line 342
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->SCROLL_ANIM:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 343
    .line 344
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 345
    .line 346
    .line 347
    return-void

    .line 348
    :cond_8
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 349
    .line 350
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 351
    .line 352
    .line 353
    return-void

    .line 354
    :cond_9
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 355
    .line 356
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c1(Z)V

    .line 360
    .line 361
    .line 362
    return-void
.end method

.method public e1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/dmf;->v()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return-void
.end method

.method public f0(J)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->u:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->u:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c1(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 21
    .line 22
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopFix()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    add-int/2addr v1, v2

    .line 31
    const/high16 v2, 0x42480000    # 50.0f

    .line 32
    .line 33
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    add-int/2addr v1, v2

    .line 38
    int-to-float v2, v1

    .line 39
    const/4 v3, 0x2

    .line 40
    new-array v3, v3, [F

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    aput v2, v3, v4

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    aput v2, v3, v0

    .line 47
    .line 48
    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->u:Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    invoke-virtual {v0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->u:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->v:Landroid/animation/TimeInterpolator;

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->u:Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;

    .line 67
    .line 68
    invoke-direct {p2, p0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->u:Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final f1()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    move-object v2, v1

    .line 26
    check-cast v2, Ll/atl;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getItemAllHeight()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 43
    .line 44
    if-nez v1, :cond_1

    .line 45
    .line 46
    const-string v1, "NA"

    .line 47
    .line 48
    :goto_1
    move-object v6, v1

    .line 49
    goto :goto_2

    .line 50
    :cond_1
    invoke-virtual {v1}, Ll/gmf;->f()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    goto :goto_1

    .line 55
    :goto_2
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    .line 56
    .line 57
    invoke-interface/range {v2 .. v7}, Ll/atl;->B(IIILjava/lang/String;I)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 61
    .line 62
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-ge v1, v3, :cond_0

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 75
    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 77
    .line 78
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 87
    .line 88
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 89
    .line 90
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    iget v4, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->o:I

    .line 95
    .line 96
    iget v5, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 97
    .line 98
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    iget v6, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    invoke-interface/range {v2 .. v7}, Ll/atl;->c0(IIIILandroid/view/View;)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_2
    return-void
.end method

.method public final g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 2
    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/atl;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 37
    .line 38
    invoke-interface {v0, v1}, Ll/atl;->s0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    :goto_1
    return-void
.end method

.method public getAct()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public getFirstShowingHolder()Ll/dmf;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 26
    .line 27
    return-object p0
.end method

.method public getFixPaddingBottom()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public getInnerTransY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public getLatestRenderIndex()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getRenderObs()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->d:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRendingList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScrollH()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getTopEmptySize()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopFix()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    add-int/2addr v0, v1

    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopEmptyFixHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/2addr v0, v1

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sub-int/2addr v0, p0

    .line 20
    return v0
.end method

.method public final h1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;III)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    move-object v2, v1

    .line 26
    check-cast v2, Ll/atl;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    move-object v7, p1

    .line 35
    move v3, p2

    .line 36
    move v4, p3

    .line 37
    move v6, p4

    .line 38
    invoke-interface/range {v2 .. v7}, Ll/atl;->X(IIIILcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    return-void
.end method

.method public final i1(ILjava/lang/String;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->z(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_14

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    goto/16 :goto_b

    .line 19
    .line 20
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 21
    .line 22
    if-lez p1, :cond_a

    .line 23
    .line 24
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->n(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    move v3, v0

    .line 29
    :cond_1
    :goto_0
    if-gt v3, p1, :cond_7

    .line 30
    .line 31
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-ge v2, v4, :cond_7

    .line 38
    .line 39
    if-ltz v3, :cond_7

    .line 40
    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 48
    .line 49
    iget-object v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 50
    .line 51
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 52
    .line 53
    if-ne v5, v6, :cond_2

    .line 54
    .line 55
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    sub-int/2addr v5, v1

    .line 62
    if-ne v2, v5, :cond_4

    .line 63
    .line 64
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 65
    .line 66
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->m:I

    .line 67
    .line 68
    add-int/2addr v5, v6

    .line 69
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    .line 70
    .line 71
    add-int/2addr v5, v6

    .line 72
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 73
    .line 74
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    if-gt v5, v6, :cond_4

    .line 79
    .line 80
    move v2, v1

    .line 81
    goto/16 :goto_3

    .line 82
    .line 83
    :cond_2
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 84
    .line 85
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 86
    .line 87
    if-ne v5, v3, :cond_3

    .line 88
    .line 89
    invoke-virtual {v6, v2}, Ll/gmf;->e(I)I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->N0(I)Ll/dmf;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    iget-object v6, v5, Ll/dmf;->a:Landroid/view/View;

    .line 98
    .line 99
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    invoke-virtual {p0, v6, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    .line 105
    .line 106
    iput-object v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 107
    .line 108
    const-string v5, "trans d idle"

    .line 109
    .line 110
    invoke-virtual {p0, v4, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->c:I

    .line 114
    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 116
    .line 117
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    iput v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 122
    .line 123
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 124
    .line 125
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    iput v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->e:I

    .line 130
    .line 131
    iget v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 132
    .line 133
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 134
    .line 135
    add-int/2addr v3, v5

    .line 136
    iput v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 137
    .line 138
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 139
    .line 140
    invoke-static {v5, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->D(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 141
    .line 142
    .line 143
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 144
    .line 145
    invoke-static {v3, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 146
    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_3
    invoke-virtual {v6, v2}, Ll/gmf;->e(I)I

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    const-string v5, "trans d recycle"

    .line 154
    .line 155
    invoke-virtual {p0, v4, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IILjava/lang/String;)V

    .line 156
    .line 157
    .line 158
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->c:I

    .line 159
    .line 160
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 161
    .line 162
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->m(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    iput v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 167
    .line 168
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 169
    .line 170
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    iput v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->e:I

    .line 175
    .line 176
    iget v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 177
    .line 178
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 179
    .line 180
    add-int/2addr v3, v5

    .line 181
    iput v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 182
    .line 183
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 184
    .line 185
    invoke-static {v5, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->D(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 186
    .line 187
    .line 188
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 189
    .line 190
    invoke-static {v3, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 191
    .line 192
    .line 193
    :cond_4
    :goto_1
    iget v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 194
    .line 195
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    .line 196
    .line 197
    add-int/2addr v3, v5

    .line 198
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 199
    .line 200
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 201
    .line 202
    .line 203
    move-result v5

    .line 204
    sub-int/2addr v3, v5

    .line 205
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 206
    .line 207
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 208
    .line 209
    .line 210
    move-result v5

    .line 211
    sub-int/2addr v5, v1

    .line 212
    if-ne v2, v5, :cond_5

    .line 213
    .line 214
    iget v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 215
    .line 216
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 217
    .line 218
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 219
    .line 220
    .line 221
    move-result v5

    .line 222
    sub-int/2addr v3, v5

    .line 223
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->m:I

    .line 224
    .line 225
    add-int/2addr v3, v5

    .line 226
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    .line 227
    .line 228
    add-int/2addr v3, v5

    .line 229
    :cond_5
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 230
    .line 231
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 232
    .line 233
    .line 234
    move-result v5

    .line 235
    sub-int/2addr v5, v1

    .line 236
    if-ne v2, v5, :cond_6

    .line 237
    .line 238
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->m:I

    .line 239
    .line 240
    goto :goto_2

    .line 241
    :cond_6
    move v5, v0

    .line 242
    :goto_2
    iget v4, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 243
    .line 244
    sub-int/2addr v4, p1

    .line 245
    sub-int/2addr v4, v5

    .line 246
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    .line 247
    .line 248
    add-int/2addr v4, v5

    .line 249
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 250
    .line 251
    invoke-static {v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 252
    .line 253
    .line 254
    move-result v5

    .line 255
    if-gt v4, v5, :cond_1

    .line 256
    .line 257
    add-int/lit8 v2, v2, 0x1

    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :cond_7
    move v2, v0

    .line 262
    :goto_3
    if-ge p1, v3, :cond_8

    .line 263
    .line 264
    if-nez v3, :cond_9

    .line 265
    .line 266
    :cond_8
    move v2, v1

    .line 267
    :cond_9
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    goto/16 :goto_9

    .line 272
    .line 273
    :cond_a
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    move v3, v0

    .line 278
    :cond_b
    :goto_4
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 279
    .line 280
    .line 281
    move-result v4

    .line 282
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 283
    .line 284
    .line 285
    move-result v5

    .line 286
    if-gt v4, v5, :cond_f

    .line 287
    .line 288
    if-ltz v2, :cond_f

    .line 289
    .line 290
    if-gtz v3, :cond_f

    .line 291
    .line 292
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 293
    .line 294
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object v4

    .line 298
    check-cast v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 299
    .line 300
    iget-object v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 301
    .line 302
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 303
    .line 304
    if-ne v5, v6, :cond_c

    .line 305
    .line 306
    if-nez v2, :cond_e

    .line 307
    .line 308
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 309
    .line 310
    if-ltz v5, :cond_e

    .line 311
    .line 312
    goto/16 :goto_6

    .line 313
    .line 314
    :cond_c
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 315
    .line 316
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 317
    .line 318
    if-ne v5, v3, :cond_d

    .line 319
    .line 320
    invoke-virtual {v6, v2}, Ll/gmf;->e(I)I

    .line 321
    .line 322
    .line 323
    move-result v3

    .line 324
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->N0(I)Ll/dmf;

    .line 325
    .line 326
    .line 327
    move-result-object v5

    .line 328
    iget-object v6, v5, Ll/dmf;->a:Landroid/view/View;

    .line 329
    .line 330
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 331
    .line 332
    .line 333
    move-result-object v7

    .line 334
    invoke-virtual {p0, v6, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 335
    .line 336
    .line 337
    iput-object v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 338
    .line 339
    new-instance v5, Ljava/lang/StringBuilder;

    .line 340
    .line 341
    const-string v6, "trans t idle "

    .line 342
    .line 343
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v5

    .line 353
    invoke-virtual {p0, v4, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IILjava/lang/String;)V

    .line 354
    .line 355
    .line 356
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->c:I

    .line 357
    .line 358
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 359
    .line 360
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 361
    .line 362
    .line 363
    move-result v3

    .line 364
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 365
    .line 366
    sub-int/2addr v3, v5

    .line 367
    iput v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 368
    .line 369
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 370
    .line 371
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 372
    .line 373
    .line 374
    move-result v3

    .line 375
    iput v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->e:I

    .line 376
    .line 377
    iget v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 378
    .line 379
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 380
    .line 381
    add-int/2addr v5, v3

    .line 382
    iput v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 383
    .line 384
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 385
    .line 386
    invoke-static {v5, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->B(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 387
    .line 388
    .line 389
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 390
    .line 391
    invoke-static {v3, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 392
    .line 393
    .line 394
    goto :goto_5

    .line 395
    :cond_d
    invoke-virtual {v6, v2}, Ll/gmf;->e(I)I

    .line 396
    .line 397
    .line 398
    move-result v3

    .line 399
    new-instance v5, Ljava/lang/StringBuilder;

    .line 400
    .line 401
    const-string v6, "trans t recycle"

    .line 402
    .line 403
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v5

    .line 413
    invoke-virtual {p0, v4, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IILjava/lang/String;)V

    .line 414
    .line 415
    .line 416
    iput v0, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->c:I

    .line 417
    .line 418
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 419
    .line 420
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 421
    .line 422
    .line 423
    move-result v3

    .line 424
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 425
    .line 426
    sub-int/2addr v3, v5

    .line 427
    iput v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 428
    .line 429
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 430
    .line 431
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 432
    .line 433
    .line 434
    move-result v3

    .line 435
    iput v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->e:I

    .line 436
    .line 437
    iget v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 438
    .line 439
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 440
    .line 441
    add-int/2addr v5, v3

    .line 442
    iput v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 443
    .line 444
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 445
    .line 446
    invoke-static {v5, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->B(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 447
    .line 448
    .line 449
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 450
    .line 451
    invoke-static {v3, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 452
    .line 453
    .line 454
    :cond_e
    :goto_5
    iget v3, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 455
    .line 456
    sub-int v4, v3, p1

    .line 457
    .line 458
    if-ltz v4, :cond_b

    .line 459
    .line 460
    add-int/lit8 v2, v2, -0x1

    .line 461
    .line 462
    goto/16 :goto_4

    .line 463
    .line 464
    :cond_f
    :goto_6
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 465
    .line 466
    .line 467
    move-result v2

    .line 468
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 469
    .line 470
    .line 471
    move-result v4

    .line 472
    if-ge v2, v4, :cond_11

    .line 473
    .line 474
    if-nez v3, :cond_10

    .line 475
    .line 476
    goto :goto_7

    .line 477
    :cond_10
    move v2, v0

    .line 478
    goto :goto_8

    .line 479
    :cond_11
    :goto_7
    move v2, v1

    .line 480
    :goto_8
    invoke-static {p1, v3}, Ljava/lang/Math;->max(II)I

    .line 481
    .line 482
    .line 483
    move-result p1

    .line 484
    :goto_9
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 485
    .line 486
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 487
    .line 488
    .line 489
    move-result v4

    .line 490
    add-int/2addr v4, p1

    .line 491
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->C(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 492
    .line 493
    .line 494
    move v3, v0

    .line 495
    :goto_a
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 496
    .line 497
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 498
    .line 499
    .line 500
    move-result v4

    .line 501
    if-ge v3, v4, :cond_13

    .line 502
    .line 503
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 504
    .line 505
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 506
    .line 507
    .line 508
    move-result-object v4

    .line 509
    check-cast v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 510
    .line 511
    iget-object v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 512
    .line 513
    sget-object v6, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 514
    .line 515
    if-ne v5, v6, :cond_12

    .line 516
    .line 517
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 518
    .line 519
    sub-int/2addr v5, p1

    .line 520
    iput v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->d:I

    .line 521
    .line 522
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 523
    .line 524
    sub-int/2addr v5, p1

    .line 525
    iput v5, v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 526
    .line 527
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 528
    .line 529
    .line 530
    move-result-object v5

    .line 531
    invoke-virtual {v5}, Landroid/view/View;->isLayoutRequested()Z

    .line 532
    .line 533
    .line 534
    move-result v5

    .line 535
    if-eqz v5, :cond_12

    .line 536
    .line 537
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getType()I

    .line 538
    .line 539
    .line 540
    move-result v5

    .line 541
    invoke-virtual {p0, v4, v3, v5, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IIZ)V

    .line 542
    .line 543
    .line 544
    :cond_12
    add-int/lit8 v3, v3, 0x1

    .line 545
    .line 546
    goto :goto_a

    .line 547
    :cond_13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 548
    .line 549
    const-string v1, "tans diff_"

    .line 550
    .line 551
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 552
    .line 553
    .line 554
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    .line 556
    .line 557
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object p1

    .line 561
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->D0(Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->s0()V

    .line 565
    .line 566
    .line 567
    new-instance p1, Ljava/lang/StringBuilder;

    .line 568
    .line 569
    const-string v1, "transRendingViewByDiff_"

    .line 570
    .line 571
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 572
    .line 573
    .line 574
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 575
    .line 576
    .line 577
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 578
    .line 579
    .line 580
    move-result-object p1

    .line 581
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->T0(Ljava/lang/String;)V

    .line 582
    .line 583
    .line 584
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 585
    .line 586
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->z(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 587
    .line 588
    .line 589
    return v2

    .line 590
    :cond_14
    :goto_b
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 591
    .line 592
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->z(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 593
    .line 594
    .line 595
    return v0
.end method

.method public final l0(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IILjava/lang/String;)V
    .locals 1

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 2
    .line 3
    iput-object p4, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 4
    .line 5
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->a:Ll/dmf;

    .line 8
    .line 9
    invoke-virtual {p4, v0, p2, p3}, Ll/gmf;->a(Ll/dmf;II)V

    .line 10
    .line 11
    .line 12
    const/4 p4, 0x1

    .line 13
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;IIZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->V0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->s:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    and-int/lit16 v0, v0, 0xff

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    float-to-int v2, v2

    .line 18
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    float-to-int v3, v3

    .line 23
    if-eqz v0, :cond_6

    .line 24
    .line 25
    const/4 v4, 0x1

    .line 26
    if-eq v0, v4, :cond_5

    .line 27
    .line 28
    const/4 v5, 0x2

    .line 29
    if-eq v0, v5, :cond_1

    .line 30
    .line 31
    const/4 v4, 0x3

    .line 32
    if-eq v0, v4, :cond_5

    .line 33
    .line 34
    goto/16 :goto_1

    .line 35
    .line 36
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    return v4

    .line 45
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->g(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    sub-int v0, v3, v0

    .line 52
    .line 53
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->f:I

    .line 58
    .line 59
    if-lt v0, v5, :cond_7

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 62
    .line 63
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_3

    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_3

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->g(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-le v3, p1, :cond_3

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    if-eqz p1, :cond_4

    .line 91
    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-interface {p1, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 97
    .line 98
    .line 99
    :cond_4
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_START_SCROLL:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 100
    .line 101
    invoke-virtual {p0, p1, v2, v3, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->h1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;III)V

    .line 102
    .line 103
    .line 104
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->DRAGGING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 110
    .line 111
    invoke-static {p0, v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 112
    .line 113
    .line 114
    return v4

    .line 115
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 116
    .line 117
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->d1()V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 125
    .line 126
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 130
    .line 131
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->x(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 135
    .line 136
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->y(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 137
    .line 138
    .line 139
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    .line 140
    .line 141
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopFix()I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    add-int/2addr v0, v4

    .line 146
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopEmptyFixHeight()I

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    add-int/2addr v0, v4

    .line 151
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 152
    .line 153
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    sub-int/2addr v0, v4

    .line 158
    if-ge v3, v0, :cond_7

    .line 159
    .line 160
    return v1

    .line 161
    :cond_7
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 162
    .line 163
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->H(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 167
    .line 168
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->I(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 169
    .line 170
    .line 171
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    const-string p1, "system onLayout"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->T0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->j:I

    .line 6
    .line 7
    sub-int/2addr v0, v1

    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->l:I

    .line 9
    .line 10
    sub-int/2addr v0, v1

    .line 11
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->k:I

    .line 24
    .line 25
    sub-int/2addr v1, v2

    .line 26
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->n:I

    .line 27
    .line 28
    sub-int/2addr v1, v2

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-super {p0, v0, v1}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->s(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-ne p1, v0, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eq p2, v0, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->h(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_1

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->F0()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->v0()V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void

    .line 80
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 81
    .line 82
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->K(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 86
    .line 87
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->J(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 91
    .line 92
    const/16 p2, 0x10

    .line 93
    .line 94
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->P(I)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 98
    .line 99
    if-eqz p1, :cond_3

    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 108
    .line 109
    invoke-virtual {p2}, Ll/gmf;->c()I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    if-eq p1, p2, :cond_3

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->X0()V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->K0()V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    const/16 v1, 0x11

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->R(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->s:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->P0()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    and-int/lit16 v0, v0, 0xff

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    float-to-int v2, v2

    .line 32
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    float-to-int v3, v3

    .line 37
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->i:Landroid/view/VelocityTracker;

    .line 38
    .line 39
    invoke-virtual {v4, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x1

    .line 43
    if-eqz v0, :cond_9

    .line 44
    .line 45
    if-eq v0, p1, :cond_7

    .line 46
    .line 47
    const/4 v4, 0x2

    .line 48
    if-eq v0, v4, :cond_3

    .line 49
    .line 50
    const/4 v4, 0x3

    .line 51
    if-eq v0, v4, :cond_2

    .line 52
    .line 53
    goto/16 :goto_2

    .line 54
    .line 55
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 58
    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 63
    .line 64
    .line 65
    goto/16 :goto_2

    .line 66
    .line 67
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 74
    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->q(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    sub-int/2addr v0, v3

    .line 82
    const-string v4, "touch-move"

    .line 83
    .line 84
    invoke-virtual {p0, v0, v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->i1(ILjava/lang/String;)Z

    .line 85
    .line 86
    .line 87
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_SCROLLING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 88
    .line 89
    invoke-virtual {p0, v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->h1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;III)V

    .line 90
    .line 91
    .line 92
    goto/16 :goto_2

    .line 93
    .line 94
    :cond_4
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->g(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    sub-int v0, v3, v0

    .line 99
    .line 100
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->f:I

    .line 105
    .line 106
    if-lt v0, v4, :cond_b

    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 109
    .line 110
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_5

    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 117
    .line 118
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->j(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-nez v0, :cond_5

    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 125
    .line 126
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->g(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-le v3, v0, :cond_5

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    if-eqz v0, :cond_6

    .line 138
    .line 139
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-interface {v0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 144
    .line 145
    .line 146
    :cond_6
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 147
    .line 148
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 149
    .line 150
    .line 151
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->DRAGGING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 152
    .line 153
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 154
    .line 155
    .line 156
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_START_SCROLL:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 157
    .line 158
    invoke-virtual {p0, v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->h1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;III)V

    .line 159
    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 163
    .line 164
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->f(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-eqz v0, :cond_8

    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->d0()I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_FINISH:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 175
    .line 176
    invoke-virtual {p0, v4, v2, v3, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->h1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;III)V

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;->IDLE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;

    .line 181
    .line 182
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->g1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ScrollState;)V

    .line 183
    .line 184
    .line 185
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 186
    .line 187
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 188
    .line 189
    .line 190
    goto :goto_2

    .line 191
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->d1()V

    .line 192
    .line 193
    .line 194
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 195
    .line 196
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->w(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;Z)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 200
    .line 201
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->x(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 205
    .line 206
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->y(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 207
    .line 208
    .line 209
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->p:I

    .line 210
    .line 211
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopFix()I

    .line 212
    .line 213
    .line 214
    move-result v4

    .line 215
    add-int/2addr v0, v4

    .line 216
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopEmptyFixHeight()I

    .line 217
    .line 218
    .line 219
    move-result v4

    .line 220
    add-int/2addr v0, v4

    .line 221
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 222
    .line 223
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->l(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    sub-int/2addr v0, v4

    .line 228
    if-ge v3, v0, :cond_a

    .line 229
    .line 230
    return v1

    .line 231
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;->TOUCH_DOWN:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;

    .line 232
    .line 233
    invoke-virtual {p0, v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->h1(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;III)V

    .line 234
    .line 235
    .line 236
    :cond_b
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 237
    .line 238
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->H(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 239
    .line 240
    .line 241
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 242
    .line 243
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->I(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 244
    .line 245
    .line 246
    return p1
.end method

.method public requestLayout()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->requestLayout()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final s0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->D(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_3

    .line 19
    .line 20
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-ge v1, v0, :cond_3

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 35
    .line 36
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->m:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 37
    .line 38
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;->RENDING:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$ExpandedItemStatus;

    .line 39
    .line 40
    if-ne v2, v3, :cond_2

    .line 41
    .line 42
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 45
    .line 46
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->r(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-ge v2, v3, :cond_1

    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    add-int/lit8 v2, v2, -0x1

    .line 59
    .line 60
    if-ne v1, v2, :cond_0

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 64
    .line 65
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 69
    .line 70
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 71
    .line 72
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->D(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 77
    .line 78
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->E(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 82
    .line 83
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->f:I

    .line 84
    .line 85
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->D(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;I)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    return-void
.end method

.method public setAdapter(Ll/gmf;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->a:Ll/gmf;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->H0()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/gmf;->d()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/kk2;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/kk2;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->q:Ll/kcg0;

    .line 24
    .line 25
    return-void
.end method

.method public setBlockScroll(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->s:Z

    .line 2
    .line 3
    return-void
.end method

.method public setContentPadding(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->n:I

    .line 2
    .line 3
    return-void
.end method

.method public setTopEmptyFixHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->o:I

    .line 2
    .line 3
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->e1()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final v0()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->r:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->getView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->c:Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Landroid/util/SparseArray;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/a;->h:I

    .line 33
    .line 34
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v3, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v2, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;->k(Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView$b;)Landroid/util/SparseArray;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 51
    .line 52
    const/high16 v3, 0x42c80000    # 100.0f

    .line 53
    .line 54
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-static {v2, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v1, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    return-void
.end method
