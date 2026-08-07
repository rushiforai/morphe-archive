.class public Ll/dyf0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dyf0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static final j:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final k:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public static final l:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public static final m:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public static final n:Landroid/widget/FrameLayout$LayoutParams;


# instance fields
.field public final a:Landroid/app/Activity;

.field public final b:Landroid/view/View;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:I

.field public f:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public i:Landroid/view/ViewGroup$LayoutParams;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/zxf0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zxf0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/dyf0$a;->j:Ll/pcj;

    .line 7
    .line 8
    new-instance v0, Ll/ayf0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/ayf0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/dyf0$a;->k:Ll/qcj;

    .line 14
    .line 15
    new-instance v0, Ll/byf0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/byf0;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ll/dyf0$a;->l:Ll/qcj;

    .line 21
    .line 22
    new-instance v0, Ll/cyf0;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/cyf0;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Ll/dyf0$a;->m:Ll/qcj;

    .line 28
    .line 29
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    const/4 v1, -0x2

    .line 32
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Ll/dyf0$a;->n:Landroid/widget/FrameLayout$LayoutParams;

    .line 36
    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/dyf0$a;->j:Ll/pcj;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Ll/dyf0$a;->c:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "default"

    .line 15
    .line 16
    iput-object v0, p0, Ll/dyf0$a;->d:Ljava/lang/String;

    .line 17
    .line 18
    const/16 v0, 0xbb8

    .line 19
    .line 20
    iput v0, p0, Ll/dyf0$a;->e:I

    .line 21
    .line 22
    sget-object v0, Ll/dyf0$a;->k:Ll/qcj;

    .line 23
    .line 24
    iput-object v0, p0, Ll/dyf0$a;->f:Ll/qcj;

    .line 25
    .line 26
    sget-object v0, Ll/dyf0$a;->l:Ll/qcj;

    .line 27
    .line 28
    iput-object v0, p0, Ll/dyf0$a;->g:Ll/qcj;

    .line 29
    .line 30
    sget-object v0, Ll/dyf0$a;->m:Ll/qcj;

    .line 31
    .line 32
    iput-object v0, p0, Ll/dyf0$a;->h:Ll/qcj;

    .line 33
    .line 34
    sget-object v0, Ll/dyf0$a;->n:Landroid/widget/FrameLayout$LayoutParams;

    .line 35
    .line 36
    iput-object v0, p0, Ll/dyf0$a;->i:Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    iput-object p1, p0, Ll/dyf0$a;->a:Landroid/app/Activity;

    .line 39
    .line 40
    iput-object p2, p0, Ll/dyf0$a;->b:Landroid/view/View;

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)Landroid/animation/Animator;
    .locals 3

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v1, v1, [F

    .line 8
    .line 9
    fill-array-data v1, :array_0

    .line 10
    .line 11
    .line 12
    const-string v2, "alpha"

    .line 13
    .line 14
    invoke-static {p0, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v1, 0x1

    .line 19
    new-array v1, v1, [Landroid/animation/Animator;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    aput-object p0, v1, v2

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 25
    .line 26
    .line 27
    const-wide/16 v1, 0x12c

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    .line 32
    return-object v0

    .line 33
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static synthetic b(Landroid/view/View;)Landroid/animation/Animator;
    .locals 7

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v2, v1, [F

    .line 8
    .line 9
    fill-array-data v2, :array_0

    .line 10
    .line 11
    .line 12
    const-string v3, "alpha"

    .line 13
    .line 14
    invoke-static {p0, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {}, Ll/dyf0;->C()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    neg-int v3, v3

    .line 23
    int-to-float v3, v3

    .line 24
    new-array v4, v1, [F

    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    aput v3, v4, v5

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    const/4 v6, 0x0

    .line 31
    aput v6, v4, v3

    .line 32
    .line 33
    const-string v6, "translationY"

    .line 34
    .line 35
    invoke-static {p0, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance v4, Landroid/view/animation/OvershootInterpolator;

    .line 40
    .line 41
    invoke-direct {v4}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 45
    .line 46
    .line 47
    new-array v1, v1, [Landroid/animation/Animator;

    .line 48
    .line 49
    aput-object v2, v1, v5

    .line 50
    .line 51
    aput-object p0, v1, v3

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 54
    .line 55
    .line 56
    const-wide/16 v1, 0x12c

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 59
    .line 60
    .line 61
    return-object v0

    .line 62
    nop

    .line 63
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic c()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static synthetic d(Landroid/view/View;)Landroid/animation/Animator;
    .locals 5

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/dyf0;->C()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    neg-int v1, v1

    .line 11
    int-to-float v1, v1

    .line 12
    const/4 v2, 0x2

    .line 13
    new-array v2, v2, [F

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    const/4 v4, 0x0

    .line 17
    aput v4, v2, v3

    .line 18
    .line 19
    const/4 v4, 0x1

    .line 20
    aput v1, v2, v4

    .line 21
    .line 22
    const-string v1, "translationY"

    .line 23
    .line 24
    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-array v1, v4, [Landroid/animation/Animator;

    .line 29
    .line 30
    aput-object p0, v1, v3

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 33
    .line 34
    .line 35
    const-wide/16 v1, 0x12c

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public static bridge synthetic e(Ll/dyf0$a;)Landroid/app/Activity;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyf0$a;->a:Landroid/app/Activity;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/dyf0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyf0$a;->d:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/dyf0$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyf0$a;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/dyf0$a;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyf0$a;->b:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/dyf0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/dyf0$a;->e:I

    return p0
.end method

.method public static bridge synthetic j(Ll/dyf0$a;)Ll/qcj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyf0$a;->g:Ll/qcj;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/dyf0$a;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyf0$a;->i:Landroid/view/ViewGroup$LayoutParams;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/dyf0$a;)Ll/qcj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyf0$a;->f:Ll/qcj;

    return-object p0
.end method


# virtual methods
.method public m()Ll/dyf0;
    .locals 2

    .line 1
    new-instance v0, Ll/dyf0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/dyf0;-><init>(Ll/dyf0$a;Ll/fyf0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
