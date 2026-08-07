.class public Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Ll/j4m;
.implements Landroid/view/Choreographer$FrameCallback;
.implements Ll/n4m;


# instance fields
.field public a:Ll/oqc0;

.field public b:Ll/uqc0;

.field public c:Ll/nqc0;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/lam;",
            ">;"
        }
    .end annotation
.end field

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:Landroid/graphics/Paint;

.field public l:F

.field public m:F

.field public n:Landroid/graphics/RectF;

.field public o:[I

.field public p:I

.field public q:J

.field public r:Ll/i4m;

.field public s:Landroid/view/View;

.field public t:F

.field public u:F

.field public v:Landroid/animation/ValueAnimator;

.field public w:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->g:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->h:I

    .line 8
    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->i:I

    .line 10
    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->j:I

    .line 12
    .line 13
    filled-new-array {p1, p1, p1, p1}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->o:[I

    .line 18
    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->p:I

    .line 20
    .line 21
    const-wide/16 v0, -0x1

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->q:J

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->r:Ll/i4m;

    .line 27
    .line 28
    const/high16 v0, -0x40800000    # -1.0f

    .line 29
    .line 30
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->t:F

    .line 31
    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->u:F

    .line 33
    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->w:Z

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->i()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 40
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->g:I

    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->h:I

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->i:I

    .line 44
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->j:I

    .line 45
    filled-new-array {p1, p1, p1, p1}, [I

    move-result-object p2

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->o:[I

    .line 46
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->p:I

    const-wide/16 v0, -0x1

    .line 47
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->q:J

    const/4 p2, 0x0

    .line 48
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->r:Ll/i4m;

    const/high16 p2, -0x40800000    # -1.0f

    .line 49
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->t:F

    .line 50
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->u:F

    .line 51
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->w:Z

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->i()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 53
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->g:I

    .line 55
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->h:I

    .line 56
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->i:I

    .line 57
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->j:I

    .line 58
    filled-new-array {p1, p1, p1, p1}, [I

    move-result-object p2

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->o:[I

    .line 59
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->p:I

    const-wide/16 p2, -0x1

    .line 60
    iput-wide p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->q:J

    const/4 p2, 0x0

    .line 61
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->r:Ll/i4m;

    const/high16 p2, -0x40800000    # -1.0f

    .line 62
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->t:F

    .line 63
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->u:F

    .line 64
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->w:Z

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->i()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->w:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->g:I

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->g:I

    return-void
.end method

.method private setInputAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->s:Landroid/view/View;

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
    const/16 v0, 0xff

    .line 10
    .line 11
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->s:Landroid/view/View;

    .line 21
    .line 22
    int-to-float p1, p1

    .line 23
    const/high16 v0, 0x437f0000    # 255.0f

    .line 24
    .line 25
    div-float/2addr p1, v0

    .line 26
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)V
    .locals 4

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
    move-result v1

    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->t:F

    .line 10
    .line 11
    const/high16 v3, -0x40800000    # -1.0f

    .line 12
    .line 13
    cmpl-float v2, v2, v3

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->u:F

    .line 18
    .line 19
    cmpl-float v2, v2, v3

    .line 20
    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    :cond_0
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->t:F

    .line 24
    .line 25
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->u:F

    .line 26
    .line 27
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/4 v1, 0x2

    .line 32
    const/4 v2, 0x1

    .line 33
    if-eq p1, v2, :cond_4

    .line 34
    .line 35
    if-eq p1, v1, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    if-eq p1, v0, :cond_4

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->g:I

    .line 42
    .line 43
    if-nez p1, :cond_3

    .line 44
    .line 45
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->l:F

    .line 46
    .line 47
    cmpg-float p1, v0, p1

    .line 48
    .line 49
    if-gez p1, :cond_6

    .line 50
    .line 51
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->n(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->q()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    if-ne p1, v2, :cond_6

    .line 59
    .line 60
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->m:F

    .line 61
    .line 62
    cmpl-float p1, v0, p1

    .line 63
    .line 64
    if-lez p1, :cond_6

    .line 65
    .line 66
    const/4 p1, 0x0

    .line 67
    invoke-virtual {p0, v2, p1, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->o(IIZ)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_4
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->g:I

    .line 72
    .line 73
    if-ne p1, v2, :cond_5

    .line 74
    .line 75
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->n(I)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->r:Ll/i4m;

    .line 79
    .line 80
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_6

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->r:Ll/i4m;

    .line 87
    .line 88
    invoke-interface {p0}, Ll/i4m;->b()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_5
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->n(I)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->r:Ll/i4m;

    .line 96
    .line 97
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_6

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->r:Ll/i4m;

    .line 104
    .line 105
    invoke-interface {p0}, Ll/i4m;->a()V

    .line 106
    .line 107
    .line 108
    :cond_6
    :goto_0
    return-void
.end method

.method public doFrame(J)V
    .locals 0

    .line 1
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->n(I)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->r:Ll/i4m;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->r:Ll/i4m;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/i4m;->a()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public f(I)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 14
    .line 15
    int-to-float p1, p1

    .line 16
    mul-float/2addr p0, p1

    .line 17
    const/high16 p1, 0x3f000000    # 0.5f

    .line 18
    .line 19
    add-float/2addr p0, p1

    .line 20
    float-to-int p0, p0

    .line 21
    return p0
.end method

.method public final g(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/lam;

    .line 17
    .line 18
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->g:I

    .line 19
    .line 20
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->i:I

    .line 21
    .line 22
    invoke-virtual {v1, p1, v2, v3}, Ll/lam;->g(Landroid/graphics/Canvas;II)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method public getRecordStartTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->q:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSoundLevel()I
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->p:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    move v0, v1

    .line 8
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->o:[I

    .line 9
    .line 10
    array-length v3, v2

    .line 11
    if-ge v1, v3, :cond_1

    .line 12
    .line 13
    aget v2, v2, v1

    .line 14
    .line 15
    add-int/2addr v0, v2

    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    array-length p0, v2

    .line 20
    div-int/2addr v0, p0

    .line 21
    return v0
.end method

.method public h()V
    .locals 1

    .line 1
    const/high16 v0, -0x40800000    # -1.0f

    .line 2
    .line 3
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->t:F

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->u:F

    .line 6
    .line 7
    return-void
.end method

.method public final i()V
    .locals 2

    .line 1
    new-instance v0, Ll/oqc0;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/oqc0;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->a:Ll/oqc0;

    .line 11
    .line 12
    new-instance v0, Ll/uqc0;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Ll/uqc0;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->b:Ll/uqc0;

    .line 22
    .line 23
    new-instance v0, Ll/nqc0;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Ll/nqc0;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->c:Ll/nqc0;

    .line 33
    .line 34
    new-instance v0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->b:Ll/uqc0;

    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->a:Ll/oqc0;

    .line 49
    .line 50
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->c:Ll/nqc0;

    .line 56
    .line 57
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_0

    .line 78
    .line 79
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    check-cast v1, Ll/lam;

    .line 84
    .line 85
    invoke-virtual {v1, p0}, Ll/lam;->k(Ll/n4m;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    new-instance v0, Landroid/graphics/Paint;

    .line 90
    .line 91
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->k:Landroid/graphics/Paint;

    .line 95
    .line 96
    const/4 v1, -0x1

    .line 97
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->k:Landroid/graphics/Paint;

    .line 101
    .line 102
    const/4 v1, 0x1

    .line 103
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 104
    .line 105
    .line 106
    const/16 v0, 0x4b

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->f(I)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    int-to-float v0, v0

    .line 113
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->l:F

    .line 114
    .line 115
    const/16 v0, 0x5f

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->f(I)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    int-to-float v0, v0

    .line 122
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->m:F

    .line 123
    .line 124
    return-void
.end method

.method public final j(II)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->e:I

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->f:I

    .line 14
    .line 15
    if-ne p2, v0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->e:I

    .line 19
    .line 20
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->f:I

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-ge v0, v1, :cond_1

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Ll/lam;

    .line 42
    .line 43
    invoke-virtual {v1, p1, p2}, Ll/lam;->h(II)V

    .line 44
    .line 45
    .line 46
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    :goto_1
    return-void
.end method

.method public k(II)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x2

    .line 3
    const/16 v2, 0xff

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    mul-int/lit16 v3, p2, 0xff

    .line 8
    .line 9
    div-int/lit8 v3, v3, 0x64

    .line 10
    .line 11
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->j:I

    .line 12
    .line 13
    mul-int/2addr v3, v1

    .line 14
    sub-int/2addr v2, v3

    .line 15
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->setInputAlpha(I)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v3, 0x1

    .line 20
    if-ne p1, v3, :cond_1

    .line 21
    .line 22
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->j:I

    .line 23
    .line 24
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->setInputAlpha(I)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    if-ne p1, v1, :cond_3

    .line 29
    .line 30
    mul-int/lit16 v3, p2, 0xff

    .line 31
    .line 32
    div-int/lit8 v3, v3, 0x64

    .line 33
    .line 34
    rsub-int v3, v3, 0xff

    .line 35
    .line 36
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->j:I

    .line 37
    .line 38
    const/16 v4, 0x7f

    .line 39
    .line 40
    if-le v3, v4, :cond_2

    .line 41
    .line 42
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->setInputAlpha(I)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    mul-int/2addr v3, v1

    .line 47
    sub-int/2addr v2, v3

    .line 48
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->setInputAlpha(I)V

    .line 49
    .line 50
    .line 51
    :cond_3
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-ge v0, v1, :cond_4

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Ll/lam;

    .line 66
    .line 67
    invoke-virtual {v1, p1, p2}, Ll/lam;->f(II)V

    .line 68
    .line 69
    .line 70
    add-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    invoke-static {}, Ll/vqc0;->c()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 9
    .line 10
    .line 11
    const-wide/16 v0, -0x1

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->q:J

    .line 14
    .line 15
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->n(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public n(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->o(IIZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final o(IIZ)V
    .locals 5

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->g:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    if-ne p1, v1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->g:I

    .line 10
    .line 11
    const/16 v0, 0x64

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz p3, :cond_1

    .line 15
    .line 16
    move v3, v0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v3, v2

    .line 19
    :goto_0
    if-eqz p3, :cond_2

    .line 20
    .line 21
    move v0, v2

    .line 22
    :cond_2
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->v:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    if-eqz v4, :cond_4

    .line 25
    .line 26
    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-eqz v4, :cond_4

    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->v:Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-nez p1, :cond_3

    .line 45
    .line 46
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->h:I

    .line 47
    .line 48
    if-ne v4, v1, :cond_3

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->w:Z

    .line 52
    .line 53
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->v:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 56
    .line 57
    .line 58
    :cond_4
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->h:I

    .line 59
    .line 60
    filled-new-array {v3, v0}, [I

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-wide/16 v3, 0x12c

    .line 69
    .line 70
    invoke-virtual {v0, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->v:Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$a;

    .line 77
    .line 78
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->v:Landroid/animation/ValueAnimator;

    .line 85
    .line 86
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;

    .line 87
    .line 88
    invoke-direct {v1, p0, p1, p3, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;IZI)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 92
    .line 93
    .line 94
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->w:Z

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->v:Landroid/animation/ValueAnimator;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p0}, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->e:I

    .line 5
    .line 6
    if-ltz v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->f:I

    .line 9
    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->g(Landroid/graphics/Canvas;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/high16 v0, 0x43040000    # 132.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    const/high16 v0, -0x80000000

    .line 16
    .line 17
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->j(II)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/lam;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/lam;->i()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->n(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final q()V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const-string v0, "vibrator"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/os/Vibrator;

    .line 10
    .line 11
    const-wide/16 v0, 0x64

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Landroid/os/Vibrator;->vibrate(J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setInputRect(Landroid/graphics/RectF;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->n:Landroid/graphics/RectF;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->d:Ljava/util/List;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/lam;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/lam;->j(Landroid/graphics/RectF;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public setInputRootLayout(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->s:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public setRecordActionCallback(Ll/i4m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->r:Ll/i4m;

    .line 2
    .line 3
    return-void
.end method

.method public setRecordStartTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->q:J

    .line 2
    .line 3
    return-void
.end method

.method public setSoundLevel(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->o:[I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->p:I

    .line 4
    .line 5
    array-length v2, v0

    .line 6
    rem-int v2, v1, v2

    .line 7
    .line 8
    aput p1, v0, v2

    .line 9
    .line 10
    add-int/lit8 v1, v1, 0x1

    .line 11
    .line 12
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->p:I

    .line 13
    .line 14
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
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->l()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
