.class public Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static final o:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final p:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public static final q:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public static final r:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public static final s:Landroid/widget/FrameLayout$LayoutParams;


# instance fields
.field public final a:Landroid/app/Activity;

.field public final b:Landroid/view/View;

.field public c:I

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:I

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

.field public i:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public j:Landroid/view/ViewGroup$LayoutParams;

.field public k:Z

.field public l:Ll/x20;

.field public m:Ll/c3m;

.field public n:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/opf0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/opf0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->o:Ll/pcj;

    .line 7
    .line 8
    new-instance v0, Ll/ppf0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/ppf0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->p:Ll/qcj;

    .line 14
    .line 15
    new-instance v0, Ll/qpf0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/qpf0;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->q:Ll/qcj;

    .line 21
    .line 22
    new-instance v0, Ll/rpf0;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/rpf0;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->r:Ll/qcj;

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
    sput-object v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s:Landroid/widget/FrameLayout$LayoutParams;

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
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->c:I

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->o:Ll/pcj;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->d:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "default"

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->e:Ljava/lang/String;

    .line 20
    .line 21
    const/16 v0, 0xbb8

    .line 22
    .line 23
    iput v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->f:I

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->p:Ll/qcj;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->g:Ll/qcj;

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->q:Ll/qcj;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->h:Ll/qcj;

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->r:Ll/qcj;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->i:Ll/qcj;

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s:Landroid/widget/FrameLayout$LayoutParams;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->j:Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->k:Z

    .line 43
    .line 44
    const/4 v0, 0x2

    .line 45
    iput v0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->n:I

    .line 46
    .line 47
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->a:Landroid/app/Activity;

    .line 48
    .line 49
    iput-object p2, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->b:Landroid/view/View;

    .line 50
    .line 51
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)Landroid/animation/Animator;
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
    invoke-static {}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->H()I

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
    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    .line 40
    .line 41
    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 45
    .line 46
    .line 47
    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    .line 48
    .line 49
    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 53
    .line 54
    .line 55
    new-array v1, v1, [Landroid/animation/Animator;

    .line 56
    .line 57
    aput-object v2, v1, v5

    .line 58
    .line 59
    aput-object p0, v1, v3

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 62
    .line 63
    .line 64
    const-wide/16 v1, 0x12c

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 67
    .line 68
    .line 69
    return-object v0

    .line 70
    nop

    .line 71
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic b(Landroid/view/View;)Landroid/animation/Animator;
    .locals 8

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    new-array v2, v1, [F

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/4 v4, 0x0

    .line 11
    aput v4, v2, v3

    .line 12
    .line 13
    const-string v5, "alpha"

    .line 14
    .line 15
    invoke-static {p0, v5, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->H()I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    neg-int v5, v5

    .line 24
    int-to-float v5, v5

    .line 25
    const/4 v6, 0x2

    .line 26
    new-array v7, v6, [F

    .line 27
    .line 28
    aput v4, v7, v3

    .line 29
    .line 30
    aput v5, v7, v1

    .line 31
    .line 32
    const-string v4, "translationY"

    .line 33
    .line 34
    invoke-static {p0, v4, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    .line 39
    .line 40
    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 44
    .line 45
    .line 46
    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    .line 47
    .line 48
    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 52
    .line 53
    .line 54
    new-array v4, v6, [Landroid/animation/Animator;

    .line 55
    .line 56
    aput-object v2, v4, v3

    .line 57
    .line 58
    aput-object p0, v4, v1

    .line 59
    .line 60
    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 61
    .line 62
    .line 63
    const-wide/16 v1, 0x12c

    .line 64
    .line 65
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 66
    .line 67
    .line 68
    return-object v0
.end method

.method public static synthetic c(Landroid/view/View;)Landroid/animation/Animator;
    .locals 5

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->H()I

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

.method public static synthetic d()Ljava/lang/String;
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

.method public static bridge synthetic e(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/app/Activity;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->a:Landroid/app/Activity;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->e:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->d:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->b:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->f:I

    return p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/qcj;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->h:Ll/qcj;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->j:Landroid/view/ViewGroup$LayoutParams;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/c3m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->m:Ll/c3m;

    return-object p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->n:I

    return p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->c:I

    return p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/qcj;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->g:Ll/qcj;

    return-object p0
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->k:Z

    return p0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/qcj;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->i:Ll/qcj;

    return-object p0
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->l:Ll/x20;

    return-object p0
.end method


# virtual methods
.method public A(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->n:I

    .line 2
    .line 3
    return-object p0
.end method

.method public B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, -0x2

    .line 3
    if-eq p1, v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s:Landroid/widget/FrameLayout$LayoutParams;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->j:Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 17
    .line 18
    const/high16 v0, 0x42c00000    # 96.0f

    .line 19
    .line 20
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-direct {p1, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->j:Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    const/high16 v0, 0x42900000    # 72.0f

    .line 33
    .line 34
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-direct {p1, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->j:Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_2
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 45
    .line 46
    const/high16 v0, 0x42500000    # 52.0f

    .line 47
    .line 48
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-direct {p1, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->j:Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    return-object p0
.end method

.method public C(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public D(Ll/qcj;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 0
    .param p1    # Ll/qcj;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;)",
            "Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->g:Ll/qcj;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Z)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->k:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public F(Ll/x20;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->l:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;-><init>(Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;Ll/tpf0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public t()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->m:Ll/c3m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/c3m;->getOnlyName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "unknown"

    .line 11
    .line 12
    return-object p0
.end method

.method public u(Ljava/lang/String;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public v(Ljava/lang/String;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Ll/qcj;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 0
    .param p1    # Ll/qcj;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Landroid/view/View;",
            "Landroid/animation/Animator;",
            ">;)",
            "Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->h:Ll/qcj;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Landroid/view/ViewGroup$LayoutParams;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 0
    .param p1    # Landroid/view/ViewGroup$LayoutParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->j:Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;
    .locals 0
    .param p1    # Ll/c3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->m:Ll/c3m;

    .line 2
    .line 3
    return-object p0
.end method
