.class public abstract Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/atl;
.implements Ll/inf$b;


# instance fields
.field public A:F

.field public B:F

.field public a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public b:F

.field public c:Ll/inf$a;

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:Landroid/graphics/Paint;

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:Landroid/graphics/RectF;

.field public q:Landroid/graphics/Xfermode;

.field public r:F

.field public s:Landroid/graphics/Path;

.field public t:Z

.field public u:F

.field public v:Landroid/animation/ValueAnimator;

.field public w:Z

.field public x:F

.field public y:Ll/inf;

.field public z:Ll/jnf;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->a:Lrx/subjects/b;

    .line 9
    .line 10
    new-instance p1, Ll/inf$a;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/inf$a;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->c:Ll/inf$a;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->d:I

    .line 19
    .line 20
    const/4 v0, -0x1

    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->e:I

    .line 22
    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->f:I

    .line 24
    .line 25
    const/high16 v0, 0x42700000    # 60.0f

    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->g:I

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->h:I

    .line 39
    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->t:Z

    .line 41
    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->w:Z

    .line 46
    .line 47
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->x:F

    .line 48
    .line 49
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->A:F

    .line 50
    .line 51
    const/high16 p1, 0x42c80000    # 100.0f

    .line 52
    .line 53
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    int-to-float p1, p1

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->B:F

    .line 59
    .line 60
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->P0()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 64
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 65
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->a:Lrx/subjects/b;

    .line 66
    new-instance p1, Ll/inf$a;

    invoke-direct {p1}, Ll/inf$a;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->c:Ll/inf$a;

    const/4 p1, 0x0

    .line 67
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->d:I

    const/4 p2, -0x1

    .line 68
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->e:I

    .line 69
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->f:I

    const/high16 p2, 0x42700000    # 60.0f

    .line 70
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->g:I

    const/4 p2, 0x0

    .line 71
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->h:I

    .line 72
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->t:Z

    .line 73
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    const/4 p1, 0x1

    .line 74
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->w:Z

    .line 75
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->x:F

    .line 76
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->A:F

    const/high16 p1, 0x42c80000    # 100.0f

    .line 77
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->B:F

    .line 78
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->P0()V

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

    .line 79
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 80
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->a:Lrx/subjects/b;

    .line 81
    new-instance p1, Ll/inf$a;

    invoke-direct {p1}, Ll/inf$a;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->c:Ll/inf$a;

    const/4 p1, 0x0

    .line 82
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->d:I

    const/4 p2, -0x1

    .line 83
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->e:I

    .line 84
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->f:I

    const/high16 p2, 0x42700000    # 60.0f

    .line 85
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->g:I

    const/4 p2, 0x0

    .line 86
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->h:I

    .line 87
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->t:Z

    .line 88
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    const/4 p1, 0x1

    .line 89
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->w:Z

    .line 90
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->x:F

    .line 91
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->A:F

    const/high16 p1, 0x42c80000    # 100.0f

    .line 92
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->B:F

    .line 93
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->P0()V

    return-void
.end method

.method public static synthetic E0(Landroid/view/View;Landroid/view/View;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic F0(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method private K0(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->v:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    new-array v0, v1, [F

    .line 11
    .line 12
    fill-array-data v0, :array_0

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->v:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-array v0, v1, [F

    .line 23
    .line 24
    fill-array-data v0, :array_1

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->v:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->v:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot$a;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 41
    .line 42
    .line 43
    if-eqz p1, :cond_4

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->O0()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_4

    .line 50
    .line 51
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->S0()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 61
    .line 62
    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->O0()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->S0()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->v:Landroid/animation/ValueAnimator;

    .line 81
    .line 82
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 83
    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_3
    const/4 v2, 0x0

    .line 88
    :goto_1
    new-array p1, v1, [F

    .line 89
    .line 90
    const/4 v1, 0x0

    .line 91
    aput v3, p1, v1

    .line 92
    .line 93
    const/4 v1, 0x1

    .line 94
    aput v2, p1, v1

    .line 95
    .line 96
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 97
    .line 98
    .line 99
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->v:Landroid/animation/ValueAnimator;

    .line 100
    .line 101
    const-wide/16 v0, 0x96

    .line 102
    .line 103
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->v:Landroid/animation/ValueAnimator;

    .line 107
    .line 108
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    nop

    .line 113
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private P0()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    int-to-float v0, v0

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->b:F

    .line 15
    .line 16
    const/high16 v0, 0x41000000    # 8.0f

    .line 17
    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->l:I

    .line 23
    .line 24
    const/high16 v1, 0x41200000    # 10.0f

    .line 25
    .line 26
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->m:I

    .line 31
    .line 32
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->n:I

    .line 37
    .line 38
    const/high16 v0, 0x41400000    # 12.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->o:I

    .line 45
    .line 46
    new-instance v0, Landroid/graphics/Paint;

    .line 47
    .line 48
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->i:Landroid/graphics/Paint;

    .line 52
    .line 53
    const/4 v1, 0x1

    .line 54
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->i:Landroid/graphics/Paint;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->i:Landroid/graphics/Paint;

    .line 63
    .line 64
    const/high16 v1, -0x10000

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->i:Landroid/graphics/Paint;

    .line 70
    .line 71
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 74
    .line 75
    .line 76
    new-instance v0, Landroid/graphics/Path;

    .line 77
    .line 78
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 82
    .line 83
    new-instance v0, Landroid/graphics/RectF;

    .line 84
    .line 85
    const/4 v1, 0x0

    .line 86
    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 87
    .line 88
    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->p:Landroid/graphics/RectF;

    .line 90
    .line 91
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    .line 92
    .line 93
    sget-object v1, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 94
    .line 95
    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->q:Landroid/graphics/Xfermode;

    .line 99
    .line 100
    const/high16 v0, 0x41a00000    # 20.0f

    .line 101
    .line 102
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    int-to-float v0, v0

    .line 107
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->r:F

    .line 108
    .line 109
    const/4 v0, 0x2

    .line 110
    const/4 v1, 0x0

    .line 111
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 112
    .line 113
    .line 114
    new-instance v2, Ll/jnf;

    .line 115
    .line 116
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->l:I

    .line 117
    .line 118
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->m:I

    .line 119
    .line 120
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->n:I

    .line 121
    .line 122
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->o:I

    .line 123
    .line 124
    const/high16 v1, 0x42600000    # 56.0f

    .line 125
    .line 126
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    add-int v6, v0, v1

    .line 131
    .line 132
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->r:F

    .line 133
    .line 134
    const/high16 v0, 0x42480000    # 50.0f

    .line 135
    .line 136
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 137
    .line 138
    .line 139
    move-result v9

    .line 140
    move v8, v7

    .line 141
    invoke-direct/range {v2 .. v9}, Ll/jnf;-><init>(IIIIFFI)V

    .line 142
    .line 143
    .line 144
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->z:Ll/jnf;

    .line 145
    .line 146
    new-instance v0, Ll/inf;

    .line 147
    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->z:Ll/jnf;

    .line 149
    .line 150
    invoke-direct {v0, v1, p0}, Ll/inf;-><init>(Ll/jnf;Ll/inf$b;)V

    .line 151
    .line 152
    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 154
    .line 155
    return-void
.end method


# virtual methods
.method public B(IIILjava/lang/String;I)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Ll/atl;->B(IIILjava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public G0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->v:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->t:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 13
    .line 14
    return-void
.end method

.method public H0()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, v1}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public I0()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, v1}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public J0(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->t:Z

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->t:Z

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->K0(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public L0(ILcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;ZFF)V
    .locals 6

    .line 1
    if-nez p1, :cond_6

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->SWIPE:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 4
    .line 5
    if-eq p2, p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->ANIM:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 8
    .line 9
    if-eq p2, p1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ll/gra;->Z2()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_6

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->r3()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    if-nez p3, :cond_1

    .line 30
    .line 31
    goto/16 :goto_1

    .line 32
    .line 33
    :cond_1
    const/4 p1, 0x0

    .line 34
    cmpl-float p2, p4, p1

    .line 35
    .line 36
    iget p3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->A:F

    .line 37
    .line 38
    if-lez p2, :cond_3

    .line 39
    .line 40
    mul-float/2addr p3, p4

    .line 41
    cmpg-float p1, p3, p1

    .line 42
    .line 43
    if-gtz p1, :cond_2

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 46
    .line 47
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->c:Ll/inf$a;

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Ll/inf;->c(Ll/inf$a;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->getCardViewInner()Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getScrollH()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->getCardViewInner()Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getInnerTransY()I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    sub-int/2addr p2, p1

    .line 69
    int-to-float p1, p2

    .line 70
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->c:Ll/inf$a;

    .line 71
    .line 72
    iget p3, p2, Ll/inf$a;->b:F

    .line 73
    .line 74
    cmpl-float p3, p1, p3

    .line 75
    .line 76
    if-lez p3, :cond_2

    .line 77
    .line 78
    iput p1, p2, Ll/inf$a;->b:F

    .line 79
    .line 80
    const/high16 p1, 0x41a00000    # 20.0f

    .line 81
    .line 82
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    int-to-float p1, p1

    .line 87
    iput p1, p2, Ll/inf$a;->e:F

    .line 88
    .line 89
    :cond_2
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->B:F

    .line 90
    .line 91
    div-float v1, p4, p1

    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 94
    .line 95
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->FLING_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 96
    .line 97
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->c:Ll/inf$a;

    .line 98
    .line 99
    const/high16 v4, 0x3f800000    # 1.0f

    .line 100
    .line 101
    const-string v5, "swipe size"

    .line 102
    .line 103
    invoke-virtual/range {v0 .. v5}, Ll/inf;->b(FLcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Ll/inf$a;FLjava/lang/String;)V

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    mul-float/2addr p3, p4

    .line 108
    cmpl-float p1, p3, p1

    .line 109
    .line 110
    if-lez p1, :cond_4

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_4
    invoke-static {}, Ll/gra;->N3()Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    const/4 p2, 0x1

    .line 118
    if-eqz p1, :cond_5

    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-eqz p1, :cond_5

    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 131
    .line 132
    sget-object p3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 133
    .line 134
    invoke-virtual {p1, p3, p2}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 139
    .line 140
    sget-object p3, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 141
    .line 142
    invoke-virtual {p1, p3, p2}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 143
    .line 144
    .line 145
    :goto_0
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->A:F

    .line 146
    .line 147
    :cond_6
    :goto_1
    return-void
.end method

.method public M0(Ll/ner;Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/ner;",
            "Lrx/c<",
            "TV;>;)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->N0(Ll/ner;Lrx/c;Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public N0(Ll/ner;Lrx/c;Z)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/ner;",
            "Lrx/c<",
            "TV;>;Z)",
            "Lrx/c<",
            "TV;>;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/ner;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {}, Ll/psd0;->E()Lrx/c$d;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->a:Lrx/subjects/b;

    .line 14
    .line 15
    new-instance v1, Ll/xgk0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/xgk0;-><init>(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p1, Ll/ygk0;

    .line 29
    .line 30
    invoke-direct {p1, p2}, Ll/ygk0;-><init>(Lrx/c;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, p0, p3}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public final O0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->getExpandedCard()Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->getExpandedCard()Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getScrollH()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public Q0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->a:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R0(ILcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->w:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p2, :cond_3

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->SWIPE_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Ll/gra;->N3()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 21
    .line 22
    const/4 p2, 0x1

    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->s()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_PROFILE:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 39
    .line 40
    :goto_0
    invoke-virtual {p0, p1, p2}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->EXPANDED_CARD:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 45
    .line 46
    invoke-virtual {p0, p1, p2}, Ll/inf;->i(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;Z)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    if-eqz p1, :cond_4

    .line 51
    .line 52
    const/high16 p1, 0x3f800000    # 1.0f

    .line 53
    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 55
    .line 56
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->t:Z

    .line 57
    .line 58
    return-void

    .line 59
    :cond_4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->J0(Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public S0()V
    .locals 0

    .line 1
    return-void
.end method

.method public X(IIIILcom/p1/mobile/putong/core/newui/home/card/expanded/base/ExpandedTouchType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v4, v0

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    int-to-float v5, v0

    .line 11
    const/4 v6, 0x0

    .line 12
    const/16 v7, 0x1f

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    move-object v1, p1

    .line 17
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    new-instance v0, Landroid/graphics/PaintFlagsDrawFilter;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x3

    .line 25
    invoke-direct {v0, v2, v3}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 29
    .line 30
    .line 31
    invoke-super {p0, v1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->j:I

    .line 35
    .line 36
    if-lez v0, :cond_0

    .line 37
    .line 38
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->k:I

    .line 39
    .line 40
    if-lez v2, :cond_0

    .line 41
    .line 42
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 43
    .line 44
    const/4 v3, 0x0

    .line 45
    cmpl-float v2, v2, v3

    .line 46
    .line 47
    if-lez v2, :cond_0

    .line 48
    .line 49
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->w:Z

    .line 50
    .line 51
    if-nez v2, :cond_0

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 59
    .line 60
    sget-object v2, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 63
    .line 64
    .line 65
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 66
    .line 67
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->j:I

    .line 68
    .line 69
    add-int/lit8 v0, v0, 0x2

    .line 70
    .line 71
    int-to-float v7, v0

    .line 72
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->k:I

    .line 73
    .line 74
    add-int/lit8 v0, v0, 0x2

    .line 75
    .line 76
    int-to-float v8, v0

    .line 77
    sget-object v9, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 78
    .line 79
    const/high16 v5, -0x40000000    # -2.0f

    .line 80
    .line 81
    move v6, v5

    .line 82
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->i:Landroid/graphics/Paint;

    .line 86
    .line 87
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->q:Landroid/graphics/Xfermode;

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->p:Landroid/graphics/RectF;

    .line 93
    .line 94
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->l:I

    .line 95
    .line 96
    int-to-float v2, v2

    .line 97
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 98
    .line 99
    mul-float/2addr v2, v4

    .line 100
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->m:I

    .line 101
    .line 102
    int-to-float v5, v5

    .line 103
    mul-float/2addr v5, v4

    .line 104
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    int-to-float v3, v3

    .line 109
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 110
    .line 111
    mul-float/2addr v3, v4

    .line 112
    add-float/2addr v5, v3

    .line 113
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->j:I

    .line 114
    .line 115
    int-to-float v3, v3

    .line 116
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->n:I

    .line 117
    .line 118
    int-to-float v6, v6

    .line 119
    mul-float/2addr v6, v4

    .line 120
    sub-float/2addr v3, v6

    .line 121
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->k:I

    .line 122
    .line 123
    int-to-float v6, v6

    .line 124
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->o:I

    .line 125
    .line 126
    int-to-float v7, v7

    .line 127
    mul-float/2addr v7, v4

    .line 128
    sub-float/2addr v6, v7

    .line 129
    const/high16 v4, 0x42600000    # 56.0f

    .line 130
    .line 131
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v4

    .line 135
    int-to-float v4, v4

    .line 136
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 137
    .line 138
    mul-float/2addr v4, v7

    .line 139
    sub-float/2addr v6, v4

    .line 140
    invoke-virtual {v0, v2, v5, v3, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 144
    .line 145
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->p:Landroid/graphics/RectF;

    .line 146
    .line 147
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->r:F

    .line 148
    .line 149
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->u:F

    .line 150
    .line 151
    mul-float v5, v3, v4

    .line 152
    .line 153
    mul-float/2addr v3, v4

    .line 154
    invoke-virtual {v0, v2, v5, v3, v9}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 158
    .line 159
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 163
    .line 164
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->i:Landroid/graphics/Paint;

    .line 165
    .line 166
    invoke-virtual {v1, v0, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 167
    .line 168
    .line 169
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->i:Landroid/graphics/Paint;

    .line 170
    .line 171
    const/4 v0, 0x0

    .line 172
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 173
    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_0
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->w:Z

    .line 177
    .line 178
    if-eqz v2, :cond_1

    .line 179
    .line 180
    if-lez v0, :cond_1

    .line 181
    .line 182
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->k:I

    .line 183
    .line 184
    if-lez v0, :cond_1

    .line 185
    .line 186
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 187
    .line 188
    invoke-virtual {v0}, Ll/inf;->d()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-eqz v0, :cond_1

    .line 193
    .line 194
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 195
    .line 196
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 200
    .line 201
    sget-object v2, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 202
    .line 203
    invoke-virtual {v0, v2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 204
    .line 205
    .line 206
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 207
    .line 208
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->j:I

    .line 209
    .line 210
    add-int/lit8 v0, v0, 0x2

    .line 211
    .line 212
    int-to-float v6, v0

    .line 213
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->k:I

    .line 214
    .line 215
    add-int/lit8 v0, v0, 0x2

    .line 216
    .line 217
    int-to-float v7, v0

    .line 218
    sget-object v8, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 219
    .line 220
    const/high16 v4, -0x40000000    # -2.0f

    .line 221
    .line 222
    move v5, v4

    .line 223
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 224
    .line 225
    .line 226
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->i:Landroid/graphics/Paint;

    .line 227
    .line 228
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->q:Landroid/graphics/Xfermode;

    .line 229
    .line 230
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 234
    .line 235
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 236
    .line 237
    invoke-virtual {v0, v2}, Ll/inf;->e(Landroid/graphics/Path;)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 241
    .line 242
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 243
    .line 244
    .line 245
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->s:Landroid/graphics/Path;

    .line 246
    .line 247
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->i:Landroid/graphics/Paint;

    .line 248
    .line 249
    invoke-virtual {v1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 250
    .line 251
    .line 252
    :cond_1
    :goto_0
    invoke-virtual {v1, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 253
    .line 254
    .line 255
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->getExpandedCard()Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->getTopEmptySize()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    int-to-float v0, v0

    .line 20
    cmpg-float v0, v1, v0

    .line 21
    .line 22
    if-gez v0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public abstract getCardViewInner()Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;
.end method

.method public abstract getClipAvatarView()Lcom/facebook/drawee/view/SimpleDraweeView;
.end method

.method public abstract getExpandedCard()Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->j:I

    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->k:I

    .line 13
    .line 14
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->j:I

    .line 25
    .line 26
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->k:I

    .line 31
    .line 32
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->w:Z

    .line 33
    .line 34
    if-eqz p2, :cond_1

    .line 35
    .line 36
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->y:Ll/inf;

    .line 37
    .line 38
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->j:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, p1}, Ll/inf;->g(II)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;->FLING_CLIP:Lcom/p1/mobile/putong/core/newui/home/card/expanded/anim/ExpandedCardClipStatus;

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    const p1, 0x3f666666    # 0.9f

    .line 9
    .line 10
    .line 11
    cmpl-float v0, p2, p1

    .line 12
    .line 13
    if-ltz v0, :cond_0

    .line 14
    .line 15
    sub-float/2addr p2, p1

    .line 16
    const p1, 0x3dccccd0    # 0.100000024f

    .line 17
    .line 18
    .line 19
    div-float/2addr p2, p1

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->getClipAvatarView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->getClipAvatarView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    const/high16 p1, 0x40000000    # 2.0f

    .line 36
    .line 37
    sub-float/2addr p1, p2

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->getClipAvatarView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleY(F)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->getClipAvatarView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardBaseRoot;->getClipAvatarView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/4 p1, 0x0

    .line 58
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
