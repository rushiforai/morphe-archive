.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;,
        Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$d;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:J

.field public f:I

.field public g:Landroid/graphics/Paint;

.field public h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;",
            ">;"
        }
    .end annotation
.end field

.field public i:Landroid/graphics/RectF;

.field public j:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$d;

.field public k:Z

.field public l:I

.field public m:Landroid/animation/ValueAnimator;

.field public n:Landroid/animation/ValueAnimator;

.field public o:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

.field public p:Landroid/animation/Animator$AnimatorListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 55
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 54
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const v0, 0x4cffffff    # 1.3421772E8f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->a:I

    .line 8
    .line 9
    const v0, -0x328c3

    .line 10
    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->b:I

    .line 13
    .line 14
    const/high16 v0, -0x10000

    .line 15
    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->c:I

    .line 17
    .line 18
    const/high16 v0, -0x1000000

    .line 19
    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->d:I

    .line 21
    .line 22
    const-wide/16 v0, 0x0

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->e:J

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->f:I

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    iput v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->l:I

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->n:Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->o:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 42
    .line 43
    new-instance v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$b;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$b;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->p:Landroid/animation/Animator$AnimatorListener;

    .line 49
    .line 50
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->j(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 56
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const v0, 0x4cffffff    # 1.3421772E8f

    .line 57
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->a:I

    const v0, -0x328c3

    .line 58
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->b:I

    const/high16 v0, -0x10000

    .line 59
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->c:I

    const/high16 v0, -0x1000000

    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->d:I

    const-wide/16 v0, 0x0

    .line 61
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->e:J

    const/4 v0, 0x1

    .line 62
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->f:I

    const/4 v0, 0x0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 65
    iput v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->l:I

    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->n:Landroid/animation/ValueAnimator;

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->o:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 69
    new-instance v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$b;

    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$b;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;)V

    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->p:Landroid/animation/Animator$AnimatorListener;

    .line 70
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->j(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->n(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->e:J

    return-wide v0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->k:Z

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->f(J)V

    return-void
.end method


# virtual methods
.method public final f(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->j:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    cmp-long v2, p1, v0

    .line 20
    .line 21
    if-lez v2, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->j:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$d;

    .line 24
    .line 25
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$d;->onProgress(J)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_2

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    check-cast p2, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 46
    .line 47
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    long-to-float v0, v0

    .line 54
    invoke-virtual {p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->e()F

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    add-float/2addr v0, p2

    .line 59
    float-to-long v0, v0

    .line 60
    goto :goto_0

    .line 61
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->j:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$d;

    .line 62
    .line 63
    invoke-interface {p0, v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$d;->onProgress(J)V

    .line 64
    .line 65
    .line 66
    :cond_3
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

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

.method public getLastSliceDuration()J
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    add-int/lit8 v0, v0, -0x1

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->d()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    return-wide v0

    .line 35
    :cond_1
    :goto_0
    return-wide v1
.end method

.method public getRecordDuration()J
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    move-wide v3, v1

    .line 21
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->d()J

    .line 36
    .line 37
    .line 38
    move-result-wide v5

    .line 39
    cmp-long v5, v5, v1

    .line 40
    .line 41
    if-gtz v5, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    long-to-float v3, v3

    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->e()F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-float/2addr v3, v0

    .line 50
    float-to-long v3, v3

    .line 51
    goto :goto_0

    .line 52
    :cond_3
    return-wide v3

    .line 53
    :cond_4
    :goto_1
    return-wide v1
.end method

.method public final h(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->d:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 9
    .line 10
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->f:I

    .line 18
    .line 19
    int-to-float v1, v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, 0x0

    .line 34
    :goto_0
    if-ge v2, v1, :cond_2

    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 43
    .line 44
    if-eqz v3, :cond_0

    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->d()J

    .line 47
    .line 48
    .line 49
    move-result-wide v4

    .line 50
    const-wide/16 v6, 0x0

    .line 51
    .line 52
    cmp-long v4, v4, v6

    .line 53
    .line 54
    if-lez v4, :cond_0

    .line 55
    .line 56
    invoke-virtual {v3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->g()Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-nez v4, :cond_0

    .line 61
    .line 62
    add-int/lit8 v4, v1, -0x1

    .line 63
    .line 64
    if-ne v2, v4, :cond_1

    .line 65
    .line 66
    :cond_0
    move-object v5, p1

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    invoke-static {v3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;)F

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    invoke-static {v3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;)F

    .line 73
    .line 74
    .line 75
    move-result v8

    .line 76
    int-to-float v9, v0

    .line 77
    iget-object v10, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 78
    .line 79
    const/4 v7, 0x0

    .line 80
    move-object v5, p1

    .line 81
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 82
    .line 83
    .line 84
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 85
    .line 86
    move-object p1, v5

    .line 87
    goto :goto_0

    .line 88
    :cond_2
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->e()F

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    mul-float/2addr v0, p1

    .line 11
    iget-wide p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->e:J

    .line 12
    .line 13
    long-to-float p0, p0

    .line 14
    div-float/2addr v0, p0

    .line 15
    float-to-int p0, v0

    .line 16
    return p0
.end method

.method public final j(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget-object v0, Ll/ihc0;->M:[I

    .line 11
    .line 12
    invoke-virtual {p1, p2, v0, p3, p4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->k(Landroid/content/res/TypedArray;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public final k(Landroid/content/res/TypedArray;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget v0, Ll/ihc0;->P:I

    .line 8
    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->a:I

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->a:I

    .line 16
    .line 17
    sget v0, Ll/ihc0;->Q:I

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->b:I

    .line 20
    .line 21
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->b:I

    .line 26
    .line 27
    sget v0, Ll/ihc0;->N:I

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->c:I

    .line 30
    .line 31
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->c:I

    .line 36
    .line 37
    sget v0, Ll/ihc0;->O:I

    .line 38
    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->d:I

    .line 40
    .line 41
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->d:I

    .line 46
    .line 47
    sget v0, Ll/ihc0;->R:I

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->f:I

    .line 50
    .line 51
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->f:I

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public l()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->b(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;)F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/high16 v2, 0x3f800000    # 1.0f

    .line 36
    .line 37
    cmpl-float v0, v0, v2

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_2
    :goto_0
    return v1
.end method

.method public final synthetic m(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->l:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic n(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->o:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->i(J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    const-wide/16 v0, -0x1

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->f(J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public o()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x1

    .line 19
    sub-int/2addr v1, v2

    .line 20
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->h(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 9
    .line 10
    const/4 v7, 0x1

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    new-instance v2, Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-direct {v2, v7}, Landroid/graphics/Paint;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 19
    .line 20
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i:Landroid/graphics/RectF;

    .line 21
    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    new-instance v2, Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i:Landroid/graphics/RectF;

    .line 30
    .line 31
    :cond_1
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 32
    .line 33
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i:Landroid/graphics/RectF;

    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 42
    .line 43
    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    int-to-float v4, v4

    .line 50
    iput v4, v2, Landroid/graphics/RectF;->right:F

    .line 51
    .line 52
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i:Landroid/graphics/RectF;

    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    int-to-float v4, v4

    .line 59
    iput v4, v2, Landroid/graphics/RectF;->bottom:F

    .line 60
    .line 61
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 62
    .line 63
    iget v4, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->a:I

    .line 64
    .line 65
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 66
    .line 67
    .line 68
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i:Landroid/graphics/RectF;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    div-int/lit8 v4, v4, 0x2

    .line 75
    .line 76
    int-to-float v4, v4

    .line 77
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    div-int/lit8 v5, v5, 0x2

    .line 82
    .line 83
    int-to-float v5, v5

    .line 84
    iget-object v6, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 85
    .line 86
    invoke-virtual {v1, v2, v4, v5, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 87
    .line 88
    .line 89
    iget-wide v4, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->e:J

    .line 90
    .line 91
    const-wide/16 v8, 0x0

    .line 92
    .line 93
    cmp-long v2, v4, v8

    .line 94
    .line 95
    if-lez v2, :cond_e

    .line 96
    .line 97
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 98
    .line 99
    if-eqz v2, :cond_e

    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-eqz v2, :cond_2

    .line 106
    .line 107
    goto/16 :goto_6

    .line 108
    .line 109
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 110
    .line 111
    .line 112
    move-result v10

    .line 113
    const/4 v2, 0x0

    .line 114
    move v11, v2

    .line 115
    move v12, v11

    .line 116
    :goto_0
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 117
    .line 118
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-ge v11, v2, :cond_c

    .line 123
    .line 124
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    check-cast v2, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 131
    .line 132
    if-eqz v2, :cond_b

    .line 133
    .line 134
    invoke-virtual {v2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->d()J

    .line 135
    .line 136
    .line 137
    move-result-wide v3

    .line 138
    cmp-long v3, v3, v8

    .line 139
    .line 140
    if-gtz v3, :cond_3

    .line 141
    .line 142
    goto/16 :goto_4

    .line 143
    .line 144
    :cond_3
    invoke-virtual {v2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->f()Z

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    iget-object v4, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 149
    .line 150
    if-eqz v3, :cond_4

    .line 151
    .line 152
    iget v3, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->c:I

    .line 153
    .line 154
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_4
    iget v3, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->b:I

    .line 159
    .line 160
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 161
    .line 162
    .line 163
    :goto_1
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;)I

    .line 164
    .line 165
    .line 166
    move-result v13

    .line 167
    add-int v3, v12, v13

    .line 168
    .line 169
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    if-le v3, v4, :cond_5

    .line 174
    .line 175
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    :cond_5
    move v14, v3

    .line 180
    int-to-float v15, v14

    .line 181
    invoke-static {v2, v15}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->c(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;F)V

    .line 182
    .line 183
    .line 184
    if-nez v11, :cond_6

    .line 185
    .line 186
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 187
    .line 188
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    sub-int/2addr v2, v7

    .line 193
    if-ne v11, v2, :cond_6

    .line 194
    .line 195
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i:Landroid/graphics/RectF;

    .line 196
    .line 197
    int-to-float v3, v12

    .line 198
    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 199
    .line 200
    iput v15, v2, Landroid/graphics/RectF;->right:F

    .line 201
    .line 202
    div-int/lit8 v3, v10, 0x2

    .line 203
    .line 204
    int-to-float v3, v3

    .line 205
    iget-object v4, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 206
    .line 207
    invoke-virtual {v1, v2, v3, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 208
    .line 209
    .line 210
    goto/16 :goto_3

    .line 211
    .line 212
    :cond_6
    if-nez v11, :cond_7

    .line 213
    .line 214
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i:Landroid/graphics/RectF;

    .line 215
    .line 216
    int-to-float v3, v12

    .line 217
    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 218
    .line 219
    add-int v3, v12, v10

    .line 220
    .line 221
    int-to-float v3, v3

    .line 222
    iput v3, v2, Landroid/graphics/RectF;->right:F

    .line 223
    .line 224
    const/4 v5, 0x0

    .line 225
    iget-object v6, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 226
    .line 227
    const/high16 v3, 0x42b40000    # 90.0f

    .line 228
    .line 229
    const/high16 v4, 0x43340000    # 180.0f

    .line 230
    .line 231
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 232
    .line 233
    .line 234
    div-int/lit8 v1, v10, 0x2

    .line 235
    .line 236
    if-le v13, v1, :cond_a

    .line 237
    .line 238
    add-int/2addr v12, v1

    .line 239
    int-to-float v2, v12

    .line 240
    int-to-float v5, v10

    .line 241
    iget-object v6, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 242
    .line 243
    const/4 v3, 0x0

    .line 244
    move-object/from16 v1, p1

    .line 245
    .line 246
    move v4, v15

    .line 247
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 248
    .line 249
    .line 250
    goto :goto_3

    .line 251
    :cond_7
    move v4, v15

    .line 252
    iget-object v1, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 253
    .line 254
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    sub-int/2addr v1, v7

    .line 259
    if-eq v11, v1, :cond_9

    .line 260
    .line 261
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    div-int/lit8 v2, v10, 0x2

    .line 266
    .line 267
    sub-int/2addr v1, v2

    .line 268
    if-le v14, v1, :cond_8

    .line 269
    .line 270
    goto :goto_2

    .line 271
    :cond_8
    int-to-float v2, v12

    .line 272
    int-to-float v5, v10

    .line 273
    iget-object v6, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 274
    .line 275
    const/4 v3, 0x0

    .line 276
    move-object/from16 v1, p1

    .line 277
    .line 278
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 279
    .line 280
    .line 281
    goto :goto_3

    .line 282
    :cond_9
    :goto_2
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i:Landroid/graphics/RectF;

    .line 283
    .line 284
    sub-int v1, v14, v10

    .line 285
    .line 286
    int-to-float v1, v1

    .line 287
    iput v1, v2, Landroid/graphics/RectF;->left:F

    .line 288
    .line 289
    iput v4, v2, Landroid/graphics/RectF;->right:F

    .line 290
    .line 291
    const/4 v5, 0x0

    .line 292
    iget-object v6, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 293
    .line 294
    const/high16 v3, -0x3d4c0000    # -90.0f

    .line 295
    .line 296
    const/high16 v4, 0x43340000    # 180.0f

    .line 297
    .line 298
    move-object/from16 v1, p1

    .line 299
    .line 300
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 301
    .line 302
    .line 303
    div-int/lit8 v1, v10, 0x2

    .line 304
    .line 305
    if-le v13, v1, :cond_a

    .line 306
    .line 307
    int-to-float v2, v12

    .line 308
    sub-int v1, v14, v1

    .line 309
    .line 310
    int-to-float v4, v1

    .line 311
    int-to-float v5, v10

    .line 312
    iget-object v6, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 313
    .line 314
    const/4 v3, 0x0

    .line 315
    move-object/from16 v1, p1

    .line 316
    .line 317
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 318
    .line 319
    .line 320
    :cond_a
    :goto_3
    move v12, v14

    .line 321
    :cond_b
    :goto_4
    add-int/lit8 v11, v11, 0x1

    .line 322
    .line 323
    move-object/from16 v1, p1

    .line 324
    .line 325
    goto/16 :goto_0

    .line 326
    .line 327
    :cond_c
    iget-boolean v1, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->k:Z

    .line 328
    .line 329
    if-eqz v1, :cond_d

    .line 330
    .line 331
    iget-object v1, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 332
    .line 333
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 334
    .line 335
    .line 336
    move-result v2

    .line 337
    sub-int/2addr v2, v7

    .line 338
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object v1

    .line 342
    check-cast v1, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 343
    .line 344
    invoke-static {v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;)F

    .line 345
    .line 346
    .line 347
    move-result v1

    .line 348
    float-to-int v7, v1

    .line 349
    int-to-float v2, v12

    .line 350
    int-to-float v4, v7

    .line 351
    int-to-float v5, v10

    .line 352
    iget-object v6, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 353
    .line 354
    const/4 v3, 0x0

    .line 355
    move-object/from16 v1, p1

    .line 356
    .line 357
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 358
    .line 359
    .line 360
    move v8, v4

    .line 361
    move v9, v5

    .line 362
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i:Landroid/graphics/RectF;

    .line 363
    .line 364
    iget v1, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->l:I

    .line 365
    .line 366
    add-int v3, v7, v1

    .line 367
    .line 368
    sub-int/2addr v3, v10

    .line 369
    int-to-float v3, v3

    .line 370
    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 371
    .line 372
    add-int/2addr v1, v7

    .line 373
    int-to-float v1, v1

    .line 374
    iput v1, v2, Landroid/graphics/RectF;->right:F

    .line 375
    .line 376
    const/4 v5, 0x0

    .line 377
    iget-object v6, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 378
    .line 379
    const/high16 v3, -0x3d4c0000    # -90.0f

    .line 380
    .line 381
    const/high16 v4, 0x43340000    # 180.0f

    .line 382
    .line 383
    move-object/from16 v1, p1

    .line 384
    .line 385
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 386
    .line 387
    .line 388
    iget v1, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->l:I

    .line 389
    .line 390
    div-int/lit8 v10, v10, 0x2

    .line 391
    .line 392
    if-le v1, v10, :cond_d

    .line 393
    .line 394
    add-int/2addr v7, v1

    .line 395
    sub-int/2addr v7, v10

    .line 396
    int-to-float v4, v7

    .line 397
    iget-object v6, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 398
    .line 399
    const/4 v3, 0x0

    .line 400
    move-object/from16 v1, p1

    .line 401
    .line 402
    move v2, v8

    .line 403
    move v5, v9

    .line 404
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 405
    .line 406
    .line 407
    goto :goto_5

    .line 408
    :cond_d
    move-object/from16 v1, p1

    .line 409
    .line 410
    :goto_5
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h(Landroid/graphics/Canvas;)V

    .line 411
    .line 412
    .line 413
    return-void

    .line 414
    :cond_e
    :goto_6
    iget-boolean v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->k:Z

    .line 415
    .line 416
    if-eqz v2, :cond_f

    .line 417
    .line 418
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i:Landroid/graphics/RectF;

    .line 419
    .line 420
    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 421
    .line 422
    iget v3, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->l:I

    .line 423
    .line 424
    int-to-float v3, v3

    .line 425
    iput v3, v2, Landroid/graphics/RectF;->right:F

    .line 426
    .line 427
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 428
    .line 429
    iget v3, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->b:I

    .line 430
    .line 431
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 432
    .line 433
    .line 434
    iget-object v2, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i:Landroid/graphics/RectF;

    .line 435
    .line 436
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 437
    .line 438
    .line 439
    move-result v3

    .line 440
    div-int/lit8 v3, v3, 0x2

    .line 441
    .line 442
    int-to-float v3, v3

    .line 443
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 444
    .line 445
    .line 446
    move-result v4

    .line 447
    div-int/lit8 v4, v4, 0x2

    .line 448
    .line 449
    int-to-float v4, v4

    .line 450
    iget-object v0, v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->g:Landroid/graphics/Paint;

    .line 451
    .line 452
    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 453
    .line 454
    .line 455
    :cond_f
    return-void
.end method

.method public onFinishInflate()V
    .locals 7

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-wide/32 v0, 0xea60

    .line 11
    .line 12
    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->e:J

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;Ll/xy;)V

    .line 26
    .line 27
    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->l(J)V

    .line 31
    .line 32
    .line 33
    const-wide/16 v4, 0x2710

    .line 34
    .line 35
    invoke-virtual {v0, v4, v5}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->i(J)V

    .line 36
    .line 37
    .line 38
    iget-object v6, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    new-instance v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 44
    .line 45
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;Ll/xy;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->l(J)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v4, v5}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->i(J)V

    .line 52
    .line 53
    .line 54
    iget-object v6, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    new-instance v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 60
    .line 61
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;Ll/xy;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->l(J)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v4, v5}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->i(J)V

    .line 68
    .line 69
    .line 70
    const/4 v1, 0x1

    .line 71
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->h(Z)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    :cond_0
    return-void
.end method

.method public final p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    add-int/lit8 v1, v1, -0x1

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->f()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->h(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->j:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$d;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    add-int/lit8 v1, v1, -0x1

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    add-int/lit8 v2, v2, -0x1

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->i(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/4 v1, 0x0

    .line 42
    filled-new-array {v0, v1}, [I

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->n:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    const-wide/16 v1, 0xc8

    .line 53
    .line 54
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->n:Landroid/animation/ValueAnimator;

    .line 58
    .line 59
    new-instance v1, Ll/wy;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/wy;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->n:Landroid/animation/ValueAnimator;

    .line 68
    .line 69
    new-instance v1, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$a;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$a;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->n:Landroid/animation/ValueAnimator;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 80
    .line 81
    .line 82
    :cond_1
    :goto_0
    return-void
.end method

.method public s(F)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->getRecordDuration()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->e:J

    .line 6
    .line 7
    cmp-long v2, v0, v2

    .line 8
    .line 9
    if-ltz v2, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    :goto_0
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->p()V

    .line 30
    .line 31
    .line 32
    new-instance v2, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-direct {v2, p0, v3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;Ll/xy;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 39
    .line 40
    .line 41
    move-result-wide v3

    .line 42
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->l(J)V

    .line 43
    .line 44
    .line 45
    const/4 v3, 0x1

    .line 46
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->j(Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->k(F)V

    .line 50
    .line 51
    .line 52
    iput-object v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->o:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 53
    .line 54
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 55
    .line 56
    if-nez v3, :cond_2

    .line 57
    .line 58
    new-instance v3, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 64
    .line 65
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    long-to-int v2, v0

    .line 71
    iget-wide v3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->e:J

    .line 72
    .line 73
    long-to-int v3, v3

    .line 74
    filled-new-array {v2, v3}, [I

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iput-object v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 83
    .line 84
    iget-wide v3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->e:J

    .line 85
    .line 86
    sub-long/2addr v3, v0

    .line 87
    long-to-float v0, v3

    .line 88
    div-float/2addr v0, p1

    .line 89
    float-to-long v0, v0

    .line 90
    invoke-virtual {v2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 94
    .line 95
    new-instance v0, Ll/vy;

    .line 96
    .line 97
    invoke-direct {v0, p0}, Ll/vy;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->p:Landroid/animation/Animator$AnimatorListener;

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 111
    .line 112
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public setListener(Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->j:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$d;

    .line 2
    .line 3
    return-void
.end method

.method public setMaxDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->e:J

    .line 2
    .line 3
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->h:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    add-int/lit8 v1, v1, -0x1

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->g()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v1

    .line 36
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->i(J)V

    .line 37
    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;->j(Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->m:Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 65
    .line 66
    .line 67
    :cond_2
    const/4 v0, 0x0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView;->o:Lcom/p1/mobile/putong/account/ui/camera/view/AccountVideoRecordProgressView$c;

    .line 69
    .line 70
    :cond_3
    :goto_0
    return-void
.end method
