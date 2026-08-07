.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/ImageView;

.field public b:Landroid/widget/ImageView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/AutoVDraweeView;

.field public g:Lv/VImage;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lv/AutoVDraweeView;

.field public j:Landroid/widget/FrameLayout;

.field public k:Lv/AutoVDraweeView;

.field public l:Landroid/widget/FrameLayout;

.field public m:Lv/AutoVDraweeView;

.field public n:Landroid/widget/FrameLayout;

.field public o:Lv/AutoVDraweeView;

.field public p:[Landroid/widget/ImageView;

.field public q:[Landroid/view/View;

.field public r:[Lv/VDraweeView;

.field public s:[I

.field public t:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->u:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->v:Z

    .line 8
    .line 9
    const/high16 p1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->y:F

    .line 12
    .line 13
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

    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->u:Z

    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->v:Z

    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->y:F

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

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->u:Z

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->v:Z

    const/high16 p1, 0x3f800000    # 1.0f

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->y:F

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->s:[I

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;)[Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->p:[Landroid/widget/ImageView;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->v:Z

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;Landroid/view/View;I)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->f(Landroid/view/View;I)Landroid/animation/ObjectAnimator;

    move-result-object p0

    return-object p0
.end method

.method private getSeeHazyResource()[I
    .locals 6

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const-string p0, "unknown_"

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    const-string v0, "female"

    .line 25
    .line 26
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x3

    .line 31
    const/4 v2, 0x2

    .line 32
    const/4 v3, 0x1

    .line 33
    const/4 v4, 0x0

    .line 34
    const/4 v5, 0x4

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    new-array p0, v5, [I

    .line 38
    .line 39
    sget v0, Ll/jbc0;->Nb:I

    .line 40
    .line 41
    aput v0, p0, v4

    .line 42
    .line 43
    sget v0, Ll/jbc0;->Ob:I

    .line 44
    .line 45
    aput v0, p0, v3

    .line 46
    .line 47
    sget v0, Ll/jbc0;->Pb:I

    .line 48
    .line 49
    aput v0, p0, v2

    .line 50
    .line 51
    sget v0, Ll/jbc0;->Qb:I

    .line 52
    .line 53
    aput v0, p0, v1

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_1
    const-string v0, "male"

    .line 57
    .line 58
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    new-array p0, v5, [I

    .line 65
    .line 66
    sget v0, Ll/jbc0;->Rb:I

    .line 67
    .line 68
    aput v0, p0, v4

    .line 69
    .line 70
    sget v0, Ll/jbc0;->Sb:I

    .line 71
    .line 72
    aput v0, p0, v3

    .line 73
    .line 74
    sget v0, Ll/jbc0;->Tb:I

    .line 75
    .line 76
    aput v0, p0, v2

    .line 77
    .line 78
    sget v0, Ll/jbc0;->Ub:I

    .line 79
    .line 80
    aput v0, p0, v1

    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_2
    new-array p0, v5, [I

    .line 84
    .line 85
    sget v0, Ll/jbc0;->Nb:I

    .line 86
    .line 87
    aput v0, p0, v4

    .line 88
    .line 89
    sget v0, Ll/jbc0;->Sb:I

    .line 90
    .line 91
    aput v0, p0, v3

    .line 92
    .line 93
    sget v0, Ll/jbc0;->Tb:I

    .line 94
    .line 95
    aput v0, p0, v2

    .line 96
    .line 97
    sget v0, Ll/jbc0;->Qb:I

    .line 98
    .line 99
    aput v0, p0, v1

    .line 100
    .line 101
    return-object p0
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vof;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f(Landroid/view/View;I)Landroid/animation/ObjectAnimator;
    .locals 4

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
    const-string v2, "alpha"

    .line 8
    .line 9
    invoke-static {v2, v1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-array v2, v0, [F

    .line 14
    .line 15
    fill-array-data v2, :array_1

    .line 16
    .line 17
    .line 18
    const-string v3, "scaleX"

    .line 19
    .line 20
    invoke-static {v3, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    new-array v0, v0, [F

    .line 25
    .line 26
    fill-array-data v0, :array_2

    .line 27
    .line 28
    .line 29
    const-string v3, "scaleY"

    .line 30
    .line 31
    invoke-static {v3, v0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    filled-new-array {v1, v2, v0}, [Landroid/animation/PropertyValuesHolder;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {p1, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-wide/16 v1, 0x1f4

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget-object v1, Ll/gt0;->f:Landroid/view/animation/Interpolator;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 52
    .line 53
    .line 54
    int-to-long v1, p2

    .line 55
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 56
    .line 57
    .line 58
    new-instance p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$a;

    .line 59
    .line 60
    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 64
    .line 65
    .line 66
    return-object v0

    .line 67
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->e:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->h:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->j:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->l:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->n:Landroid/widget/FrameLayout;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    move v0, v1

    .line 28
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->p:[Landroid/widget/ImageView;

    .line 29
    .line 30
    array-length v3, v2

    .line 31
    if-ge v0, v3, :cond_0

    .line 32
    .line 33
    aget-object v2, v2, v0

    .line 34
    .line 35
    invoke-static {v2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->p:[Landroid/widget/ImageView;

    .line 39
    .line 40
    aget-object v2, v2, v0

    .line 41
    .line 42
    const/4 v3, 0x0

    .line 43
    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->p:[Landroid/widget/ImageView;

    .line 47
    .line 48
    aget-object v2, v2, v0

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 51
    .line 52
    .line 53
    add-int/lit8 v0, v0, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    return-void
.end method

.method public final h(Landroid/widget/ImageView;Landroid/view/View;Ll/g4c;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x2

    .line 10
    div-int/2addr v0, v1

    .line 11
    add-int/2addr p0, v0

    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    div-int/2addr v2, v1

    .line 21
    add-int/2addr v0, v2

    .line 22
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    div-int/2addr v3, v1

    .line 31
    add-int/2addr v2, v3

    .line 32
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    div-int/2addr p2, v1

    .line 41
    add-int/2addr v3, p2

    .line 42
    new-instance p2, Ljava/math/BigDecimal;

    .line 43
    .line 44
    sub-int/2addr v3, v0

    .line 45
    invoke-direct {p2, v3}, Ljava/math/BigDecimal;-><init>(I)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Ljava/math/BigDecimal;

    .line 49
    .line 50
    sub-int/2addr v2, p0

    .line 51
    invoke-direct {v0, v2}, Ljava/math/BigDecimal;-><init>(I)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x4

    .line 55
    invoke-virtual {p2, v0, v1, p0}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;II)Ljava/math/BigDecimal;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ljava/math/BigDecimal;->floatValue()F

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {p3, p0}, Ll/g4c;->c(F)V

    .line 64
    .line 65
    .line 66
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final i()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->p:[Landroid/widget/ImageView;

    .line 3
    .line 4
    array-length v1, v1

    .line 5
    if-ge v0, v1, :cond_1

    .line 6
    .line 7
    new-instance v1, Ll/g4c;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/g4c;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/bnl0;->w0()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/16 v3, 0x3c0

    .line 17
    .line 18
    if-ge v2, v3, :cond_0

    .line 19
    .line 20
    const/high16 v2, 0x40000000    # 2.0f

    .line 21
    .line 22
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {v1, v2}, Ll/g4c;->b(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->p:[Landroid/widget/ImageView;

    .line 30
    .line 31
    aget-object v2, v2, v0

    .line 32
    .line 33
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->q:[Landroid/view/View;

    .line 34
    .line 35
    aget-object v3, v3, v0

    .line 36
    .line 37
    invoke-virtual {p0, v2, v3, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->h(Landroid/widget/ImageView;Landroid/view/View;Ll/g4c;)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->p:[Landroid/widget/ImageView;

    .line 41
    .line 42
    aget-object v2, v2, v0

    .line 43
    .line 44
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 45
    .line 46
    .line 47
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void
.end method

.method public final j()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->i:Lv/AutoVDraweeView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->k:Lv/AutoVDraweeView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->m:Lv/AutoVDraweeView;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->o:Lv/AutoVDraweeView;

    .line 8
    .line 9
    const/4 v4, 0x4

    .line 10
    new-array v5, v4, [Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v6, 0x0

    .line 13
    aput-object v0, v5, v6

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    aput-object v1, v5, v0

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    aput-object v2, v5, v1

    .line 20
    .line 21
    const/4 v2, 0x3

    .line 22
    aput-object v3, v5, v2

    .line 23
    .line 24
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->r:[Lv/VDraweeView;

    .line 25
    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->a:Landroid/widget/ImageView;

    .line 27
    .line 28
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->b:Landroid/widget/ImageView;

    .line 29
    .line 30
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->c:Landroid/widget/ImageView;

    .line 31
    .line 32
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->d:Landroid/widget/ImageView;

    .line 33
    .line 34
    filled-new-array {v3, v5, v7, v8}, [Landroid/widget/ImageView;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->p:[Landroid/widget/ImageView;

    .line 39
    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->h:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->j:Landroid/widget/FrameLayout;

    .line 43
    .line 44
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->l:Landroid/widget/FrameLayout;

    .line 45
    .line 46
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->n:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    new-array v9, v4, [Landroid/view/View;

    .line 49
    .line 50
    aput-object v3, v9, v6

    .line 51
    .line 52
    aput-object v5, v9, v0

    .line 53
    .line 54
    aput-object v7, v9, v1

    .line 55
    .line 56
    aput-object v8, v9, v2

    .line 57
    .line 58
    iput-object v9, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->q:[Landroid/view/View;

    .line 59
    .line 60
    const/16 v0, 0x28

    .line 61
    .line 62
    const/16 v1, -0x32

    .line 63
    .line 64
    const/16 v2, 0x3c

    .line 65
    .line 66
    const/16 v3, -0x3c

    .line 67
    .line 68
    filled-new-array {v2, v3, v0, v1}, [I

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->s:[I

    .line 73
    .line 74
    new-instance v0, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->t:Ljava/util/List;

    .line 80
    .line 81
    const/16 v1, 0x59

    .line 82
    .line 83
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const/16 v2, -0x1e

    .line 88
    .line 89
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->t:Ljava/util/List;

    .line 101
    .line 102
    const/16 v1, -0x41

    .line 103
    .line 104
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const/16 v2, -0xd

    .line 109
    .line 110
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->t:Ljava/util/List;

    .line 122
    .line 123
    const/16 v1, 0x50

    .line 124
    .line 125
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    const/16 v2, 0x4c

    .line 130
    .line 131
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->t:Ljava/util/List;

    .line 143
    .line 144
    const/16 v1, -0x28

    .line 145
    .line 146
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    const/16 v2, 0x41

    .line 151
    .line 152
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    invoke-static {}, Ll/bnl0;->w0()I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    const/16 v1, 0x3c0

    .line 168
    .line 169
    if-ge v0, v1, :cond_0

    .line 170
    .line 171
    const v0, 0x3f19999a    # 0.6f

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->setScale(F)V

    .line 175
    .line 176
    .line 177
    :cond_0
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->l(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public l(Z)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->w:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->x:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->v:Z

    .line 10
    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->u:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    if-eqz v0, :cond_2

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->g()V

    .line 25
    .line 26
    .line 27
    :cond_2
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 28
    .line 29
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->e:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    const/4 v2, 0x2

    .line 43
    new-array v3, v2, [F

    .line 44
    .line 45
    fill-array-data v3, :array_0

    .line 46
    .line 47
    .line 48
    const-string v4, "alpha"

    .line 49
    .line 50
    invoke-static {v4, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    new-array v4, v2, [F

    .line 55
    .line 56
    fill-array-data v4, :array_1

    .line 57
    .line 58
    .line 59
    const-string v5, "scaleX"

    .line 60
    .line 61
    invoke-static {v5, v4}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    new-array v2, v2, [F

    .line 66
    .line 67
    fill-array-data v2, :array_2

    .line 68
    .line 69
    .line 70
    const-string v5, "scaleY"

    .line 71
    .line 72
    invoke-static {v5, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    filled-new-array {v3, v4, v2}, [Landroid/animation/PropertyValuesHolder;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-static {v0, v2}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const-wide/16 v2, 0x1f4

    .line 85
    .line 86
    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sget-object v2, Ll/gt0;->f:Landroid/view/animation/Interpolator;

    .line 91
    .line 92
    invoke-virtual {v0, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 93
    .line 94
    .line 95
    const-wide/16 v2, 0x64

    .line 96
    .line 97
    invoke-virtual {v0, v2, v3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 98
    .line 99
    .line 100
    new-instance v2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;

    .line 101
    .line 102
    invoke-direct {v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$c;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;Landroid/animation/AnimatorSet;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 109
    .line 110
    .line 111
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->v:Z

    .line 112
    .line 113
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->u:Z

    .line 114
    .line 115
    :cond_3
    :goto_0
    return-void

    .line 116
    nop

    .line 117
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->f:Lv/AutoVDraweeView;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->j()V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->getSeeHazyResource()[I

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->setUpResource([I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 2

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    move p2, p1

    .line 6
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->q:[Landroid/view/View;

    .line 7
    .line 8
    array-length p3, p3

    .line 9
    if-ge p2, p3, :cond_0

    .line 10
    .line 11
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->e:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->t:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    check-cast p4, Ll/pf60;

    .line 24
    .line 25
    iget-object p4, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p4, Ljava/lang/Integer;

    .line 28
    .line 29
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 30
    .line 31
    .line 32
    move-result p4

    .line 33
    int-to-float p4, p4

    .line 34
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    add-int/2addr p3, p4

    .line 39
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->e:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {p4}, Landroid/view/View;->getTop()I

    .line 42
    .line 43
    .line 44
    move-result p4

    .line 45
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->t:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {p5, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p5

    .line 51
    check-cast p5, Ll/pf60;

    .line 52
    .line 53
    iget-object p5, p5, Ll/pf60;->b:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast p5, Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result p5

    .line 61
    int-to-float p5, p5

    .line 62
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result p5

    .line 66
    add-int/2addr p4, p5

    .line 67
    iget-object p5, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->q:[Landroid/view/View;

    .line 68
    .line 69
    aget-object p5, p5, p2

    .line 70
    .line 71
    invoke-virtual {p5}, Landroid/view/View;->getMeasuredWidth()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr v0, p3

    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->q:[Landroid/view/View;

    .line 77
    .line 78
    aget-object v1, v1, p2

    .line 79
    .line 80
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    add-int/2addr v1, p4

    .line 85
    invoke-virtual {p5, p3, p4, v0, v1}, Landroid/view/View;->layout(IIII)V

    .line 86
    .line 87
    .line 88
    add-int/lit8 p2, p2, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->i()V

    .line 92
    .line 93
    .line 94
    const/4 p2, 0x1

    .line 95
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->w:Z

    .line 96
    .line 97
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->x:Z

    .line 98
    .line 99
    if-eqz p2, :cond_1

    .line 100
    .line 101
    new-instance p2, Ll/uof;

    .line 102
    .line 103
    invoke-direct {p2, p0}, Ll/uof;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 107
    .line 108
    .line 109
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->x:Z

    .line 110
    .line 111
    :cond_1
    return-void
.end method

.method public setCenterAvatarBackgroundDrawable(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->e:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setCenterIcon(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->g:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setScale(F)V
    .locals 6

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->y:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->y:F

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->e:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 18
    .line 19
    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 20
    .line 21
    int-to-float v1, v1

    .line 22
    mul-float/2addr v1, p1

    .line 23
    float-to-int v1, v1

    .line 24
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 25
    .line 26
    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 27
    .line 28
    int-to-float v1, v1

    .line 29
    mul-float/2addr v1, p1

    .line 30
    float-to-int v1, v1

    .line 31
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->e:Landroid/widget/FrameLayout;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->f:Lv/AutoVDraweeView;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 45
    .line 46
    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 47
    .line 48
    int-to-float v1, v1

    .line 49
    mul-float/2addr v1, p1

    .line 50
    float-to-int v1, v1

    .line 51
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 52
    .line 53
    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 54
    .line 55
    int-to-float v1, v1

    .line 56
    mul-float/2addr v1, p1

    .line 57
    float-to-int v1, v1

    .line 58
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->f:Lv/AutoVDraweeView;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->f:Lv/AutoVDraweeView;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    int-to-float v1, v1

    .line 72
    mul-float/2addr v1, p1

    .line 73
    float-to-int v1, v1

    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->f:Lv/AutoVDraweeView;

    .line 75
    .line 76
    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    int-to-float v2, v2

    .line 81
    mul-float/2addr v2, p1

    .line 82
    float-to-int v2, v2

    .line 83
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->f:Lv/AutoVDraweeView;

    .line 84
    .line 85
    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    int-to-float v3, v3

    .line 90
    mul-float/2addr v3, p1

    .line 91
    float-to-int v3, v3

    .line 92
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->f:Lv/AutoVDraweeView;

    .line 93
    .line 94
    invoke-virtual {v4}, Landroid/view/View;->getPaddingBottom()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    int-to-float v4, v4

    .line 99
    mul-float/2addr v4, p1

    .line 100
    float-to-int v4, v4

    .line 101
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->g:Lv/VImage;

    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 111
    .line 112
    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 113
    .line 114
    int-to-float v1, v1

    .line 115
    mul-float/2addr v1, p1

    .line 116
    float-to-int v1, v1

    .line 117
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 118
    .line 119
    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 120
    .line 121
    int-to-float v1, v1

    .line 122
    mul-float/2addr v1, p1

    .line 123
    float-to-int v1, v1

    .line 124
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 125
    .line 126
    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 127
    .line 128
    int-to-float v1, v1

    .line 129
    mul-float/2addr v1, p1

    .line 130
    float-to-int v1, v1

    .line 131
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->g:Lv/VImage;

    .line 134
    .line 135
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 136
    .line 137
    .line 138
    const/4 v0, 0x0

    .line 139
    :goto_0
    const/4 v1, 0x4

    .line 140
    if-ge v0, v1, :cond_1

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->q:[Landroid/view/View;

    .line 143
    .line 144
    aget-object v1, v1, v0

    .line 145
    .line 146
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 151
    .line 152
    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 153
    .line 154
    int-to-float v2, v2

    .line 155
    mul-float/2addr v2, p1

    .line 156
    float-to-int v2, v2

    .line 157
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 158
    .line 159
    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 160
    .line 161
    int-to-float v2, v2

    .line 162
    mul-float/2addr v2, p1

    .line 163
    float-to-int v2, v2

    .line 164
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 165
    .line 166
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->q:[Landroid/view/View;

    .line 167
    .line 168
    aget-object v2, v2, v0

    .line 169
    .line 170
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 171
    .line 172
    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->r:[Lv/VDraweeView;

    .line 174
    .line 175
    aget-object v1, v1, v0

    .line 176
    .line 177
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 182
    .line 183
    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 184
    .line 185
    int-to-float v2, v2

    .line 186
    mul-float/2addr v2, p1

    .line 187
    float-to-int v2, v2

    .line 188
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 189
    .line 190
    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 191
    .line 192
    int-to-float v2, v2

    .line 193
    mul-float/2addr v2, p1

    .line 194
    float-to-int v2, v2

    .line 195
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 196
    .line 197
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->r:[Lv/VDraweeView;

    .line 198
    .line 199
    aget-object v2, v2, v0

    .line 200
    .line 201
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 202
    .line 203
    .line 204
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->r:[Lv/VDraweeView;

    .line 205
    .line 206
    aget-object v1, v1, v0

    .line 207
    .line 208
    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    int-to-float v2, v2

    .line 213
    mul-float/2addr v2, p1

    .line 214
    float-to-int v2, v2

    .line 215
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->r:[Lv/VDraweeView;

    .line 216
    .line 217
    aget-object v3, v3, v0

    .line 218
    .line 219
    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    int-to-float v3, v3

    .line 224
    mul-float/2addr v3, p1

    .line 225
    float-to-int v3, v3

    .line 226
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->r:[Lv/VDraweeView;

    .line 227
    .line 228
    aget-object v4, v4, v0

    .line 229
    .line 230
    invoke-virtual {v4}, Landroid/view/View;->getPaddingRight()I

    .line 231
    .line 232
    .line 233
    move-result v4

    .line 234
    int-to-float v4, v4

    .line 235
    mul-float/2addr v4, p1

    .line 236
    float-to-int v4, v4

    .line 237
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->r:[Lv/VDraweeView;

    .line 238
    .line 239
    aget-object v5, v5, v0

    .line 240
    .line 241
    invoke-virtual {v5}, Landroid/view/View;->getPaddingBottom()I

    .line 242
    .line 243
    .line 244
    move-result v5

    .line 245
    int-to-float v5, v5

    .line 246
    mul-float/2addr v5, p1

    .line 247
    float-to-int v5, v5

    .line 248
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 249
    .line 250
    .line 251
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->p:[Landroid/widget/ImageView;

    .line 252
    .line 253
    aget-object v1, v1, v0

    .line 254
    .line 255
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 260
    .line 261
    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 262
    .line 263
    int-to-float v2, v2

    .line 264
    mul-float/2addr v2, p1

    .line 265
    float-to-int v2, v2

    .line 266
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 267
    .line 268
    iget v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 269
    .line 270
    int-to-float v2, v2

    .line 271
    mul-float/2addr v2, p1

    .line 272
    float-to-int v2, v2

    .line 273
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 274
    .line 275
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->p:[Landroid/widget/ImageView;

    .line 276
    .line 277
    aget-object v2, v2, v0

    .line 278
    .line 279
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 280
    .line 281
    .line 282
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->s:[I

    .line 283
    .line 284
    aget v2, v1, v0

    .line 285
    .line 286
    int-to-float v2, v2

    .line 287
    mul-float/2addr v2, p1

    .line 288
    float-to-int v2, v2

    .line 289
    aput v2, v1, v0

    .line 290
    .line 291
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->t:Ljava/util/List;

    .line 292
    .line 293
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    check-cast v2, Ll/pf60;

    .line 298
    .line 299
    iget-object v2, v2, Ll/pf60;->a:Ljava/lang/Object;

    .line 300
    .line 301
    check-cast v2, Ljava/lang/Integer;

    .line 302
    .line 303
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 304
    .line 305
    .line 306
    move-result v2

    .line 307
    int-to-float v2, v2

    .line 308
    mul-float/2addr v2, p1

    .line 309
    float-to-int v2, v2

    .line 310
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->t:Ljava/util/List;

    .line 315
    .line 316
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    move-result-object v3

    .line 320
    check-cast v3, Ll/pf60;

    .line 321
    .line 322
    iget-object v3, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 323
    .line 324
    check-cast v3, Ljava/lang/Integer;

    .line 325
    .line 326
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 327
    .line 328
    .line 329
    move-result v3

    .line 330
    int-to-float v3, v3

    .line 331
    mul-float/2addr v3, p1

    .line 332
    float-to-int v3, v3

    .line 333
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 334
    .line 335
    .line 336
    move-result-object v3

    .line 337
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 338
    .line 339
    .line 340
    move-result-object v2

    .line 341
    invoke-interface {v1, v0, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    add-int/lit8 v0, v0, 0x1

    .line 345
    .line 346
    goto/16 :goto_0

    .line 347
    .line 348
    :cond_1
    :goto_1
    return-void
.end method

.method public setUpResource([I)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->r:[Lv/VDraweeView;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_0

    .line 6
    .line 7
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    aget-object v1, v1, v0

    .line 10
    .line 11
    aget v3, p1, v0

    .line 12
    .line 13
    invoke-virtual {v2, v1, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 14
    .line 15
    .line 16
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method
