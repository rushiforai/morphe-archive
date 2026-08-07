.class public Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;,
        Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;",
            ">;"
        }
    .end annotation
.end field

.field public i:Landroid/animation/Animator;

.field public j:Landroid/animation/Animator;

.field public k:Landroid/animation/Animator;

.field public l:I

.field public m:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public n:Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;

.field public o:D

.field public p:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 42
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->g:I

    .line 6
    .line 7
    const/4 p3, -0x1

    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->l:I

    .line 9
    .line 10
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->o:D

    .line 13
    .line 14
    const/16 v0, 0x7d0

    .line 15
    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->p:I

    .line 17
    .line 18
    sget-object v0, Ll/khc0;->p1:[I

    .line 19
    .line 20
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget p2, Ll/khc0;->q1:I

    .line 25
    .line 26
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->l:I

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->c()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->d()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->p:I

    return p0
.end method

.method private getNextImgUrl()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->m:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v1, Ljava/util/Random;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/util/Random;->nextInt(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->m:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/String;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->m:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    return-object v1
.end method


# virtual methods
.method public final b(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final c()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->l:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    int-to-float v0, v0

    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/high16 v0, 0x42000000    # 32.0f

    .line 15
    .line 16
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a:I

    .line 21
    .line 22
    :goto_0
    const/high16 v0, 0x41000000    # 8.0f

    .line 23
    .line 24
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->b:I

    .line 29
    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->d:I

    .line 35
    .line 36
    const/4 v1, 0x3

    .line 37
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->c:I

    .line 38
    .line 39
    const/4 v2, 0x3

    .line 40
    const/4 v3, 0x1

    .line 41
    add-int/2addr v2, v3

    .line 42
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->e:I

    .line 43
    .line 44
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a:I

    .line 45
    .line 46
    mul-int/2addr v2, v1

    .line 47
    sub-int/2addr v1, v3

    .line 48
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->b:I

    .line 49
    .line 50
    mul-int/2addr v1, v3

    .line 51
    sub-int/2addr v2, v1

    .line 52
    add-int/2addr v2, v0

    .line 53
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->f:I

    .line 54
    .line 55
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;Ll/xyb0;)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;

    .line 62
    .line 63
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->b()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->a()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->m:Ljava/util/ArrayList;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->j:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->b(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->i:Landroid/animation/Animator;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->b(Landroid/animation/Animator;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->k:Landroid/animation/Animator;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->b(Landroid/animation/Animator;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setChildrenDrawingOrderEnabled(Z)V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final e(Landroid/view/View;)V
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
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a:I

    .line 14
    .line 15
    int-to-float v2, v2

    .line 16
    new-array v0, v0, [F

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    aput v2, v0, v3

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x1

    .line 23
    aput v2, v0, v3

    .line 24
    .line 25
    const-string v2, "translationX"

    .line 26
    .line 27
    invoke-static {v2, v0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    filled-new-array {v0, v1}, [Landroid/animation/PropertyValuesHolder;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {p1, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->i:Landroid/animation/Animator;

    .line 40
    .line 41
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->o:D

    .line 42
    .line 43
    const-wide v2, 0x4072c00000000000L    # 300.0

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    mul-double/2addr v0, v2

    .line 49
    double-to-long v0, v0

    .line 50
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->i:Landroid/animation/Animator;

    .line 54
    .line 55
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->o:D

    .line 56
    .line 57
    const-wide/high16 v2, 0x4069000000000000L    # 200.0

    .line 58
    .line 59
    mul-double/2addr v0, v2

    .line 60
    double-to-long v0, v0

    .line 61
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->i:Landroid/animation/Animator;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    nop

    .line 71
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final f(Landroid/view/View;)V
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    const-string v1, "alpha"

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v0}, [Landroid/animation/PropertyValuesHolder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->k:Landroid/animation/Animator;

    .line 22
    .line 23
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->o:D

    .line 24
    .line 25
    const-wide v2, 0x4072c00000000000L    # 300.0

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    mul-double/2addr v0, v2

    .line 31
    double-to-long v0, v0

    .line 32
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->k:Landroid/animation/Animator;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final g(Landroid/view/View;)V
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
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a:I

    .line 10
    .line 11
    int-to-float v2, v2

    .line 12
    sub-float/2addr v1, v2

    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->b:I

    .line 14
    .line 15
    int-to-float v2, v2

    .line 16
    add-float/2addr v1, v2

    .line 17
    const/4 v2, 0x2

    .line 18
    new-array v2, v2, [F

    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    aput v0, v2, v3

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    aput v1, v2, v0

    .line 25
    .line 26
    const-string v0, "translationX"

    .line 27
    .line 28
    invoke-static {v0, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    filled-new-array {v0}, [Landroid/animation/PropertyValuesHolder;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p1, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->j:Landroid/animation/Animator;

    .line 41
    .line 42
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->o:D

    .line 43
    .line 44
    const-wide v2, 0x407f400000000000L    # 500.0

    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    mul-double/2addr v0, v2

    .line 50
    double-to-long v0, v0

    .line 51
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->j:Landroid/animation/Animator;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public getChildDrawingOrder(II)I
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-lt p2, p1, :cond_0

    .line 8
    .line 9
    return p2

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;

    .line 17
    .line 18
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->b:I

    .line 19
    .line 20
    return p0
.end method

.method public getViewCalculateWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public h()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->j:Landroid/animation/Animator;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->j:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_b

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->i:Landroid/animation/Animator;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->i:Landroid/animation/Animator;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    goto/16 :goto_5

    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->m:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    goto/16 :goto_5

    .line 44
    .line 45
    :cond_2
    const/4 v0, 0x1

    .line 46
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setChildrenDrawingOrderEnabled(Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->e:I

    .line 59
    .line 60
    const/high16 v3, 0x3f800000    # 1.0f

    .line 61
    .line 62
    const/4 v4, 0x0

    .line 63
    if-ge v1, v2, :cond_5

    .line 64
    .line 65
    new-instance v1, Lv/VDraweeView;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-direct {v1, v2}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 72
    .line 73
    .line 74
    sget v2, Ll/dbc0;->Eu:I

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 77
    .line 78
    .line 79
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->getNextImgUrl()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-virtual {v2, v1, v5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->g:I

    .line 89
    .line 90
    add-int/2addr v2, v0

    .line 91
    rem-int/lit8 v2, v2, 0x2

    .line 92
    .line 93
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->g:I

    .line 94
    .line 95
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 96
    .line 97
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a:I

    .line 98
    .line 99
    invoke-direct {v2, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 100
    .line 101
    .line 102
    new-instance v5, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;

    .line 103
    .line 104
    const/4 v6, 0x0

    .line 105
    invoke-direct {v5, p0, v6}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;-><init>(Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;Ll/xyb0;)V

    .line 106
    .line 107
    .line 108
    iput-object v1, v5, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->c:Lv/VDraweeView;

    .line 109
    .line 110
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 111
    .line 112
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 113
    .line 114
    .line 115
    move-result v6

    .line 116
    iput v6, v5, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->a:I

    .line 117
    .line 118
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 119
    .line 120
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    iput v6, v5, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->b:I

    .line 125
    .line 126
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 127
    .line 128
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    .line 133
    .line 134
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 135
    .line 136
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    if-ne v2, v0, :cond_3

    .line 141
    .line 142
    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 143
    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_3
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a:I

    .line 147
    .line 148
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->d:I

    .line 149
    .line 150
    add-int/2addr v2, v3

    .line 151
    int-to-float v2, v2

    .line 152
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 153
    .line 154
    .line 155
    const/4 v2, 0x0

    .line 156
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->e(Landroid/view/View;)V

    .line 160
    .line 161
    .line 162
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->e:I

    .line 169
    .line 170
    if-ne v1, v2, :cond_4

    .line 171
    .line 172
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 173
    .line 174
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    check-cast v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;

    .line 179
    .line 180
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->c:Lv/VDraweeView;

    .line 181
    .line 182
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->f(Landroid/view/View;)V

    .line 183
    .line 184
    .line 185
    :goto_1
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->c:I

    .line 186
    .line 187
    if-ge v0, v1, :cond_a

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    check-cast v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;

    .line 196
    .line 197
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->c:Lv/VDraweeView;

    .line 198
    .line 199
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->g(Landroid/view/View;)V

    .line 200
    .line 201
    .line 202
    add-int/lit8 v0, v0, 0x1

    .line 203
    .line 204
    goto :goto_1

    .line 205
    :cond_4
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 206
    .line 207
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    sub-int/2addr v1, v0

    .line 212
    if-ge v4, v1, :cond_a

    .line 213
    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 215
    .line 216
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    check-cast v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;

    .line 221
    .line 222
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->c:Lv/VDraweeView;

    .line 223
    .line 224
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->g(Landroid/view/View;)V

    .line 225
    .line 226
    .line 227
    add-int/lit8 v4, v4, 0x1

    .line 228
    .line 229
    goto :goto_2

    .line 230
    :cond_5
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 231
    .line 232
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    if-ge v4, v1, :cond_9

    .line 237
    .line 238
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->h:Ljava/util/ArrayList;

    .line 239
    .line 240
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    check-cast v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;

    .line 245
    .line 246
    iget v2, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->a:I

    .line 247
    .line 248
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->c:I

    .line 249
    .line 250
    add-int/2addr v2, v5

    .line 251
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->e:I

    .line 252
    .line 253
    rem-int/2addr v2, v6

    .line 254
    iput v2, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->a:I

    .line 255
    .line 256
    iget v7, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->b:I

    .line 257
    .line 258
    add-int/2addr v7, v0

    .line 259
    rem-int/2addr v7, v6

    .line 260
    iput v7, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->b:I

    .line 261
    .line 262
    if-ne v2, v5, :cond_7

    .line 263
    .line 264
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->c:Lv/VDraweeView;

    .line 265
    .line 266
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->f:I

    .line 267
    .line 268
    int-to-float v5, v5

    .line 269
    invoke-virtual {v2, v5}, Landroid/view/View;->setTranslationX(F)V

    .line 270
    .line 271
    .line 272
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->c:Lv/VDraweeView;

    .line 273
    .line 274
    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    .line 275
    .line 276
    .line 277
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->c:Lv/VDraweeView;

    .line 278
    .line 279
    if-eqz v2, :cond_6

    .line 280
    .line 281
    sget v5, Ll/dbc0;->Eu:I

    .line 282
    .line 283
    invoke-virtual {v2, v5}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 284
    .line 285
    .line 286
    :cond_6
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 287
    .line 288
    iget-object v5, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->c:Lv/VDraweeView;

    .line 289
    .line 290
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->getNextImgUrl()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v6

    .line 294
    invoke-virtual {v2, v5, v6}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->c:Lv/VDraweeView;

    .line 298
    .line 299
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->e(Landroid/view/View;)V

    .line 300
    .line 301
    .line 302
    goto :goto_4

    .line 303
    :cond_7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$a;->c:Lv/VDraweeView;

    .line 304
    .line 305
    if-nez v2, :cond_8

    .line 306
    .line 307
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->f(Landroid/view/View;)V

    .line 308
    .line 309
    .line 310
    goto :goto_4

    .line 311
    :cond_8
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->g(Landroid/view/View;)V

    .line 312
    .line 313
    .line 314
    :goto_4
    add-int/lit8 v4, v4, 0x1

    .line 315
    .line 316
    goto :goto_3

    .line 317
    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 318
    .line 319
    .line 320
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->m:Ljava/util/ArrayList;

    .line 321
    .line 322
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    if-eqz v0, :cond_b

    .line 327
    .line 328
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->b()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->a()Ljava/util/ArrayList;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->m:Ljava/util/ArrayList;

    .line 337
    .line 338
    :cond_b
    :goto_5
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->n:Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView$b;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 3

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
    iget p5, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->f:I

    .line 14
    .line 15
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a:I

    .line 16
    .line 17
    sub-int v1, p5, v0

    .line 18
    .line 19
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->d:I

    .line 20
    .line 21
    sub-int/2addr v1, v2

    .line 22
    sub-int/2addr p5, v2

    .line 23
    invoke-virtual {p4, v1, p2, p5, v0}, Landroid/view/View;->layout(IIII)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 p3, p3, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
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
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->f:I

    .line 5
    .line 6
    const/high16 p2, -0x80000000

    .line 7
    .line 8
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a:I

    .line 13
    .line 14
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setItemViewCount(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->c:I

    .line 2
    .line 3
    if-gtz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x3

    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->c:I

    .line 7
    .line 8
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->c:I

    .line 9
    .line 10
    add-int/lit8 v0, p1, 0x1

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->e:I

    .line 13
    .line 14
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->a:I

    .line 15
    .line 16
    mul-int/2addr v0, p1

    .line 17
    add-int/lit8 p1, p1, -0x1

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->b:I

    .line 20
    .line 21
    mul-int/2addr p1, v1

    .line 22
    sub-int/2addr v0, p1

    .line 23
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->d:I

    .line 24
    .line 25
    add-int/2addr v0, p1

    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->f:I

    .line 27
    .line 28
    return-void
.end method

.method public setSpeedUpRate(D)V
    .locals 2

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->o:D

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->p:I

    .line 4
    .line 5
    int-to-double v0, v0

    .line 6
    mul-double/2addr v0, p1

    .line 7
    double-to-int p1, v0

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/QuickChatAnimView;->p:I

    .line 9
    .line 10
    return-void
.end method
