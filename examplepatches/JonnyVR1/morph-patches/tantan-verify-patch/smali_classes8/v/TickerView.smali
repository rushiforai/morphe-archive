.class public Lv/TickerView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/TickerView$ActionMode;
    }
.end annotation


# static fields
.field public static final x:I

.field public static final y:Landroid/view/animation/Interpolator;


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Landroid/graphics/Paint;

.field public final c:Landroid/graphics/Paint;

.field public final d:Landroid/graphics/Paint;

.field public final e:Landroid/animation/ValueAnimator;

.field public f:Ljava/lang/String;

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:F

.field public p:I

.field public q:F

.field public r:F

.field public s:F

.field public t:J

.field public u:J

.field public v:Z

.field public w:Lv/TickerView$ActionMode;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41600000    # 14.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lv/TickerView;->x:I

    .line 8
    .line 9
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lv/TickerView;->y:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/text/TextPaint;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-direct {p1, v0}, Landroid/text/TextPaint;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 11
    .line 12
    new-instance p1, Landroid/text/TextPaint;

    .line 13
    .line 14
    invoke-direct {p1, v0}, Landroid/text/TextPaint;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 18
    .line 19
    new-instance p1, Landroid/text/TextPaint;

    .line 20
    .line 21
    invoke-direct {p1, v0}, Landroid/text/TextPaint;-><init>(I)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 25
    .line 26
    new-instance p1, Landroid/text/TextPaint;

    .line 27
    .line 28
    invoke-direct {p1, v0}, Landroid/text/TextPaint;-><init>(I)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 32
    .line 33
    new-array p1, v0, [F

    .line 34
    .line 35
    const/high16 v0, 0x3f800000    # 1.0f

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    aput v0, p1, v1

    .line 39
    .line 40
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    invoke-virtual {p0}, Lv/TickerView;->g()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 50
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    new-instance p1, Landroid/text/TextPaint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p1, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 52
    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1, p2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p1, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 53
    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1, p2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p1, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 54
    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1, p2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p1, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 55
    new-array p1, p2, [F

    const/high16 p2, 0x3f800000    # 1.0f

    const/4 v0, 0x0

    aput p2, p1, v0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 56
    invoke-virtual {p0}, Lv/TickerView;->g()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 57
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 58
    new-instance p1, Landroid/text/TextPaint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p1, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 59
    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1, p2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p1, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 60
    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1, p2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p1, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 61
    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1, p2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p1, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 62
    new-array p1, p2, [F

    const/high16 p2, 0x3f800000    # 1.0f

    const/4 p3, 0x0

    aput p2, p1, p3

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 63
    invoke-virtual {p0}, Lv/TickerView;->g()V

    return-void
.end method

.method public static synthetic a(Lv/TickerView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/TickerView;->i(Ll/x20;)V

    return-void
.end method

.method public static synthetic b(Lv/TickerView;Ll/x20;Ll/x20;JFIIIFF[I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p11}, Lv/TickerView;->l(Ll/x20;Ll/x20;JFIIIFF[I)V

    return-void
.end method

.method public static synthetic c(Lv/TickerView;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/TickerView;->h([I)V

    return-void
.end method

.method public static synthetic d(Lv/TickerView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/TickerView;->j(Ll/x20;)V

    return-void
.end method

.method public static synthetic e(Lv/TickerView;JFIIIFFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p9}, Lv/TickerView;->k(JFIIIFFLandroid/animation/ValueAnimator;)V

    return-void
.end method

.method private getAnimEndString()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lv/TickerView;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    iget p0, p0, Lv/TickerView;->i:I

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, "+"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    iget p0, p0, Lv/TickerView;->h:I

    .line 28
    .line 29
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method


# virtual methods
.method public f()V
    .locals 1

    .line 1
    sget-object v0, Lv/TickerView$ActionMode;->clear:Lv/TickerView$ActionMode;

    .line 2
    .line 3
    iput-object v0, p0, Lv/TickerView;->w:Lv/TickerView$ActionMode;

    .line 4
    .line 5
    invoke-virtual {p0}, Lv/TickerView;->o()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final g()V
    .locals 5

    .line 1
    iget-object v0, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    sget v1, Lv/TickerView;->x:I

    .line 4
    .line 5
    int-to-float v2, v1

    .line 6
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 16
    .line 17
    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 18
    .line 19
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 23
    .line 24
    int-to-float v4, v1

    .line 25
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 39
    .line 40
    int-to-float v4, v1

    .line 41
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 55
    .line 56
    int-to-float v1, v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 71
    .line 72
    sget-object v1, Lv/TickerView;->y:Landroid/view/animation/Interpolator;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput v0, p0, Lv/TickerView;->q:F

    .line 84
    .line 85
    const-wide/16 v0, 0xa28

    .line 86
    .line 87
    iput-wide v0, p0, Lv/TickerView;->u:J

    .line 88
    .line 89
    const-wide/16 v0, 0x3e8

    .line 90
    .line 91
    iput-wide v0, p0, Lv/TickerView;->t:J

    .line 92
    .line 93
    const/16 v0, 0x63

    .line 94
    .line 95
    iput v0, p0, Lv/TickerView;->i:I

    .line 96
    .line 97
    const/4 v0, 0x1

    .line 98
    iput-boolean v0, p0, Lv/TickerView;->v:Z

    .line 99
    .line 100
    return-void
.end method

.method public getDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final synthetic h([I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/TickerView;->p()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic i(Ll/x20;)V
    .locals 1

    .line 1
    iget v0, p0, Lv/TickerView;->j:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lv/TickerView;->k:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ll/x20;->call()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic j(Ll/x20;)V
    .locals 1

    .line 1
    iget v0, p0, Lv/TickerView;->j:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lv/TickerView;->k:I

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ll/x20;->call()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic k(JFIIIFFLandroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    iget v0, p0, Lv/TickerView;->k:I

    .line 2
    .line 3
    iget v1, p0, Lv/TickerView;->j:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_9

    .line 6
    .line 7
    invoke-virtual {p9}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-virtual {p9}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    iget v1, p0, Lv/TickerView;->k:I

    .line 18
    .line 19
    if-ltz v0, :cond_0

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    iput v1, p0, Lv/TickerView;->k:I

    .line 24
    .line 25
    goto/16 :goto_5

    .line 26
    .line 27
    :cond_0
    iget v0, p0, Lv/TickerView;->j:I

    .line 28
    .line 29
    const/16 v2, 0xff

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    if-ge v1, v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p9}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    iget p9, p0, Lv/TickerView;->l:I

    .line 39
    .line 40
    int-to-long v4, p9

    .line 41
    mul-long/2addr v4, p1

    .line 42
    cmp-long p1, v0, v4

    .line 43
    .line 44
    if-ltz p1, :cond_1

    .line 45
    .line 46
    iget p1, p0, Lv/TickerView;->k:I

    .line 47
    .line 48
    add-int/lit8 p1, p1, 0x1

    .line 49
    .line 50
    iput p1, p0, Lv/TickerView;->k:I

    .line 51
    .line 52
    add-int/lit8 p9, p9, 0x1

    .line 53
    .line 54
    iput p9, p0, Lv/TickerView;->l:I

    .line 55
    .line 56
    iput v3, p0, Lv/TickerView;->p:I

    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    iput p1, p0, Lv/TickerView;->r:F

    .line 60
    .line 61
    iget p1, p0, Lv/TickerView;->q:F

    .line 62
    .line 63
    iput p1, p0, Lv/TickerView;->s:F

    .line 64
    .line 65
    iget-object p1, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 71
    .line 72
    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 73
    .line 74
    .line 75
    goto/16 :goto_5

    .line 76
    .line 77
    :cond_1
    invoke-virtual {p0}, Lv/TickerView;->s()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_3

    .line 82
    .line 83
    iget-object p1, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/graphics/Paint;->getTextScaleX()F

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    add-float/2addr p1, p3

    .line 90
    const/high16 p2, 0x3f800000    # 1.0f

    .line 91
    .line 92
    cmpg-float p3, p1, p2

    .line 93
    .line 94
    iget-object p5, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 95
    .line 96
    if-gez p3, :cond_2

    .line 97
    .line 98
    invoke-virtual {p5, p1}, Landroid/graphics/Paint;->setTextScaleX(F)V

    .line 99
    .line 100
    .line 101
    goto :goto_5

    .line 102
    :cond_2
    invoke-virtual {p5, p2}, Landroid/graphics/Paint;->setTextScaleX(F)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 106
    .line 107
    invoke-virtual {p1}, Landroid/graphics/Paint;->getAlpha()I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    add-int/2addr p2, p4

    .line 112
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 113
    .line 114
    .line 115
    goto :goto_5

    .line 116
    :cond_3
    iget p1, p0, Lv/TickerView;->k:I

    .line 117
    .line 118
    iget p2, p0, Lv/TickerView;->j:I

    .line 119
    .line 120
    if-ne p1, p2, :cond_4

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_4
    move p5, p6

    .line 124
    :goto_0
    if-ne p1, p2, :cond_5

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_5
    move p7, p8

    .line 128
    :goto_1
    iget-object p1, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/graphics/Paint;->getAlpha()I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    sub-int/2addr p1, p5

    .line 135
    iget-object p2, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 136
    .line 137
    invoke-virtual {p2}, Landroid/graphics/Paint;->getAlpha()I

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    add-int/2addr p2, p5

    .line 142
    iget-object p3, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 143
    .line 144
    if-ge p1, p5, :cond_6

    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_6
    move v3, p1

    .line 148
    :goto_2
    invoke-virtual {p3, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 152
    .line 153
    rsub-int p3, p2, 0xff

    .line 154
    .line 155
    if-ge p3, p5, :cond_7

    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_7
    move v2, p2

    .line 159
    :goto_3
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 160
    .line 161
    .line 162
    iget p1, p0, Lv/TickerView;->p:I

    .line 163
    .line 164
    add-int/lit8 p2, p1, 0x1

    .line 165
    .line 166
    iput p2, p0, Lv/TickerView;->p:I

    .line 167
    .line 168
    int-to-float p1, p1

    .line 169
    mul-float/2addr p1, p7

    .line 170
    iput p1, p0, Lv/TickerView;->r:F

    .line 171
    .line 172
    iget p2, p0, Lv/TickerView;->q:F

    .line 173
    .line 174
    sub-float p3, p2, p1

    .line 175
    .line 176
    cmpl-float p3, p3, p7

    .line 177
    .line 178
    if-lez p3, :cond_8

    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_8
    move p1, p2

    .line 182
    :goto_4
    iput p1, p0, Lv/TickerView;->r:F

    .line 183
    .line 184
    sub-float/2addr p2, p1

    .line 185
    iput p2, p0, Lv/TickerView;->s:F

    .line 186
    .line 187
    :goto_5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 188
    .line 189
    .line 190
    :cond_9
    return-void
.end method

.method public final synthetic l(Ll/x20;Ll/x20;JFIIIFF[I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lv/TickerView;->q()V

    .line 2
    .line 3
    .line 4
    iget-object p11, p0, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    new-instance v0, Ll/jzi0;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Ll/jzi0;-><init>(Lv/TickerView;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/kzi0;

    .line 12
    .line 13
    invoke-direct {p1, p0, p2}, Ll/kzi0;-><init>(Lv/TickerView;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p11, v0, p1}, Ll/gt0;->g(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    new-instance p2, Ll/lzi0;

    .line 22
    .line 23
    move p11, p10

    .line 24
    move p10, p9

    .line 25
    move p9, p8

    .line 26
    move p8, p7

    .line 27
    move p7, p6

    .line 28
    move p6, p5

    .line 29
    move-wide p4, p3

    .line 30
    move-object p3, p0

    .line 31
    invoke-direct/range {p2 .. p11}, Ll/lzi0;-><init>(Lv/TickerView;JFIIIFF)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p3, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public m(IILl/x20;Ll/x20;)V
    .locals 13

    .line 1
    sget-object v3, Lv/TickerView$ActionMode;->scroll:Lv/TickerView$ActionMode;

    .line 2
    .line 3
    iput-object v3, p0, Lv/TickerView;->w:Lv/TickerView$ActionMode;

    .line 4
    .line 5
    iget v3, p0, Lv/TickerView;->i:I

    .line 6
    .line 7
    if-lez v3, :cond_1

    .line 8
    .line 9
    if-gt p1, v3, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "start or division is wrong! start should be less than division."

    .line 13
    .line 14
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    if-gt p1, p2, :cond_8

    .line 19
    .line 20
    iput p1, p0, Lv/TickerView;->g:I

    .line 21
    .line 22
    iput p2, p0, Lv/TickerView;->h:I

    .line 23
    .line 24
    invoke-virtual {p0}, Lv/TickerView;->u()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-eqz v3, :cond_2

    .line 29
    .line 30
    iget v3, p0, Lv/TickerView;->i:I

    .line 31
    .line 32
    add-int/lit8 v3, v3, 0x1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    move v3, p2

    .line 36
    :goto_1
    iput v3, p0, Lv/TickerView;->j:I

    .line 37
    .line 38
    iget-boolean v4, p0, Lv/TickerView;->v:Z

    .line 39
    .line 40
    if-eqz v4, :cond_5

    .line 41
    .line 42
    sub-int/2addr v3, p1

    .line 43
    iget-object v4, p0, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    const/16 v5, 0xa

    .line 46
    .line 47
    if-ge v3, v5, :cond_4

    .line 48
    .line 49
    iget-wide v5, p0, Lv/TickerView;->t:J

    .line 50
    .line 51
    const-wide/16 v7, 0x2

    .line 52
    .line 53
    mul-long v9, v5, v7

    .line 54
    .line 55
    iget-wide v11, p0, Lv/TickerView;->u:J

    .line 56
    .line 57
    cmp-long v3, v9, v11

    .line 58
    .line 59
    if-gez v3, :cond_3

    .line 60
    .line 61
    mul-long v11, v5, v7

    .line 62
    .line 63
    :cond_3
    invoke-virtual {v4, v11, v12}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_4
    iget-wide v5, p0, Lv/TickerView;->u:J

    .line 68
    .line 69
    invoke-virtual {v4, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    .line 72
    :cond_5
    :goto_2
    iget-object v3, p0, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->getDuration()J

    .line 75
    .line 76
    .line 77
    move-result-wide v3

    .line 78
    iget-wide v5, p0, Lv/TickerView;->t:J

    .line 79
    .line 80
    sub-long/2addr v3, v5

    .line 81
    iget v7, p0, Lv/TickerView;->j:I

    .line 82
    .line 83
    sub-int/2addr v7, p1

    .line 84
    int-to-long v7, v7

    .line 85
    div-long/2addr v3, v7

    .line 86
    long-to-int v7, v3

    .line 87
    div-int/lit8 v7, v7, 0x10

    .line 88
    .line 89
    long-to-int v5, v5

    .line 90
    div-int/lit8 v5, v5, 0x10

    .line 91
    .line 92
    div-int/lit8 v6, v5, 0x2

    .line 93
    .line 94
    if-eqz v7, :cond_7

    .line 95
    .line 96
    if-eqz v5, :cond_6

    .line 97
    .line 98
    if-eqz v6, :cond_6

    .line 99
    .line 100
    const/16 v0, 0xff

    .line 101
    .line 102
    div-int v9, v0, v7

    .line 103
    .line 104
    iget v2, p0, Lv/TickerView;->q:F

    .line 105
    .line 106
    int-to-float v7, v7

    .line 107
    div-float v11, v2, v7

    .line 108
    .line 109
    div-int v8, v0, v5

    .line 110
    .line 111
    int-to-float v5, v5

    .line 112
    div-float v10, v2, v5

    .line 113
    .line 114
    const/high16 v2, 0x3f800000    # 1.0f

    .line 115
    .line 116
    int-to-float v5, v6

    .line 117
    div-float/2addr v2, v5

    .line 118
    div-int v7, v0, v6

    .line 119
    .line 120
    new-instance v0, Ll/izi0;

    .line 121
    .line 122
    move-object v1, p0

    .line 123
    move v6, v2

    .line 124
    move-wide v4, v3

    .line 125
    move-object/from16 v2, p3

    .line 126
    .line 127
    move-object/from16 v3, p4

    .line 128
    .line 129
    invoke-direct/range {v0 .. v11}, Ll/izi0;-><init>(Lv/TickerView;Ll/x20;Ll/x20;JFIIIFF)V

    .line 130
    .line 131
    .line 132
    invoke-static {p0, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_6
    const-string v0, "last num duration is too small!"

    .line 137
    .line 138
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    const-string v1, "animator duration is too small for a change from %d to %d !"

    .line 155
    .line 156
    invoke-static {v1, v0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_8
    const-string v0, "start or end is wrong! start should be less than end."

    .line 161
    .line 162
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public n(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lv/TickerView$ActionMode;->still:Lv/TickerView$ActionMode;

    .line 2
    .line 3
    iput-object v0, p0, Lv/TickerView;->w:Lv/TickerView$ActionMode;

    .line 4
    .line 5
    iput-object p1, p0, Lv/TickerView;->f:Ljava/lang/String;

    .line 6
    .line 7
    new-instance p1, Ll/hzi0;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/hzi0;-><init>(Lv/TickerView;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final o()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lv/TickerView;->e:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/TickerView;->w:Lv/TickerView$ActionMode;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    sget-object v1, Lv/TickerView$a;->a:[I

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    aget v0, v1, v0

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-eq v0, v1, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0, p1}, Lv/TickerView;->t(Landroid/graphics/Canvas;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-virtual {p0, p1}, Lv/TickerView;->r(Landroid/graphics/Canvas;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    :goto_0
    return-void
.end method

.method public final p()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lv/TickerView;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    div-int/lit8 v0, v0, 0x2

    .line 9
    .line 10
    iput v0, p0, Lv/TickerView;->m:I

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    div-int/lit8 v0, v0, 0x2

    .line 17
    .line 18
    iput v0, p0, Lv/TickerView;->n:I

    .line 19
    .line 20
    iget-object v0, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget v1, p0, Lv/TickerView;->n:I

    .line 27
    .line 28
    int-to-float v1, v1

    .line 29
    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 30
    .line 31
    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 32
    .line 33
    sub-float v0, v2, v0

    .line 34
    .line 35
    const/high16 v3, 0x40000000    # 2.0f

    .line 36
    .line 37
    div-float/2addr v0, v3

    .line 38
    add-float/2addr v1, v0

    .line 39
    sub-float/2addr v1, v2

    .line 40
    iput v1, p0, Lv/TickerView;->o:F

    .line 41
    .line 42
    return-void
.end method

.method public final q()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lv/TickerView;->p()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lv/TickerView;->l:I

    .line 6
    .line 7
    iget v0, p0, Lv/TickerView;->g:I

    .line 8
    .line 9
    iput v0, p0, Lv/TickerView;->k:I

    .line 10
    .line 11
    iget-object v0, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 12
    .line 13
    const/16 v1, 0xff

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTextScaleX(F)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final r(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    iget v0, p0, Lv/TickerView;->k:I

    .line 2
    .line 3
    iget v1, p0, Lv/TickerView;->g:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, p0, Lv/TickerView;->m:I

    .line 12
    .line 13
    int-to-float v1, v1

    .line 14
    iget v2, p0, Lv/TickerView;->o:F

    .line 15
    .line 16
    iget-object p0, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Lv/TickerView;->s()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 29
    .line 30
    iget v1, p0, Lv/TickerView;->i:I

    .line 31
    .line 32
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v1, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 41
    .line 42
    const-string v2, "+"

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iget-object v3, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextScaleX()F

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    mul-float/2addr v1, v3

    .line 55
    iget v3, p0, Lv/TickerView;->i:I

    .line 56
    .line 57
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget v4, p0, Lv/TickerView;->m:I

    .line 62
    .line 63
    int-to-float v4, v4

    .line 64
    const/high16 v5, 0x40000000    # 2.0f

    .line 65
    .line 66
    div-float/2addr v1, v5

    .line 67
    sub-float/2addr v4, v1

    .line 68
    iget v1, p0, Lv/TickerView;->o:F

    .line 69
    .line 70
    iget-object v6, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 71
    .line 72
    invoke-virtual {p1, v3, v4, v1, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 73
    .line 74
    .line 75
    iget v1, p0, Lv/TickerView;->m:I

    .line 76
    .line 77
    int-to-float v1, v1

    .line 78
    div-float/2addr v0, v5

    .line 79
    add-float/2addr v1, v0

    .line 80
    iget v0, p0, Lv/TickerView;->o:F

    .line 81
    .line 82
    iget-object p0, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 83
    .line 84
    invoke-virtual {p1, v2, v1, v0, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    iget v0, p0, Lv/TickerView;->k:I

    .line 89
    .line 90
    iget v1, p0, Lv/TickerView;->j:I

    .line 91
    .line 92
    if-gt v0, v1, :cond_4

    .line 93
    .line 94
    const/16 v1, 0xa

    .line 95
    .line 96
    if-lt v0, v1, :cond_3

    .line 97
    .line 98
    rem-int/lit8 v2, v0, 0xa

    .line 99
    .line 100
    if-nez v2, :cond_2

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    div-int/2addr v0, v1

    .line 104
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget v2, p0, Lv/TickerView;->k:I

    .line 109
    .line 110
    add-int/lit8 v2, v2, -0x1

    .line 111
    .line 112
    rem-int/2addr v2, v1

    .line 113
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    iget v3, p0, Lv/TickerView;->k:I

    .line 118
    .line 119
    rem-int/2addr v3, v1

    .line 120
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iget-object v3, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 125
    .line 126
    iget v4, p0, Lv/TickerView;->k:I

    .line 127
    .line 128
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    iget v4, p0, Lv/TickerView;->m:I

    .line 137
    .line 138
    int-to-float v4, v4

    .line 139
    const/high16 v5, 0x40800000    # 4.0f

    .line 140
    .line 141
    div-float/2addr v3, v5

    .line 142
    sub-float/2addr v4, v3

    .line 143
    iget v5, p0, Lv/TickerView;->o:F

    .line 144
    .line 145
    iget-object v6, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 146
    .line 147
    invoke-virtual {p1, v0, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 148
    .line 149
    .line 150
    iget v0, p0, Lv/TickerView;->m:I

    .line 151
    .line 152
    int-to-float v0, v0

    .line 153
    add-float/2addr v0, v3

    .line 154
    iget v4, p0, Lv/TickerView;->o:F

    .line 155
    .line 156
    iget v5, p0, Lv/TickerView;->r:F

    .line 157
    .line 158
    sub-float/2addr v4, v5

    .line 159
    iget-object v5, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 160
    .line 161
    invoke-virtual {p1, v2, v0, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 162
    .line 163
    .line 164
    iget v0, p0, Lv/TickerView;->m:I

    .line 165
    .line 166
    int-to-float v0, v0

    .line 167
    add-float/2addr v0, v3

    .line 168
    iget v2, p0, Lv/TickerView;->o:F

    .line 169
    .line 170
    iget v3, p0, Lv/TickerView;->s:F

    .line 171
    .line 172
    add-float/2addr v2, v3

    .line 173
    iget-object p0, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 174
    .line 175
    invoke-virtual {p1, v1, v0, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_3
    :goto_0
    add-int/lit8 v0, v0, -0x1

    .line 180
    .line 181
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    iget v1, p0, Lv/TickerView;->m:I

    .line 186
    .line 187
    int-to-float v1, v1

    .line 188
    iget v2, p0, Lv/TickerView;->o:F

    .line 189
    .line 190
    iget v3, p0, Lv/TickerView;->r:F

    .line 191
    .line 192
    sub-float/2addr v2, v3

    .line 193
    iget-object v3, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 194
    .line 195
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 196
    .line 197
    .line 198
    iget v0, p0, Lv/TickerView;->k:I

    .line 199
    .line 200
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    iget v1, p0, Lv/TickerView;->m:I

    .line 205
    .line 206
    int-to-float v1, v1

    .line 207
    iget v2, p0, Lv/TickerView;->o:F

    .line 208
    .line 209
    iget v3, p0, Lv/TickerView;->s:F

    .line 210
    .line 211
    add-float/2addr v2, v3

    .line 212
    iget-object p0, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 213
    .line 214
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :cond_4
    invoke-direct {p0}, Lv/TickerView;->getAnimEndString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iget v1, p0, Lv/TickerView;->m:I

    .line 223
    .line 224
    int-to-float v1, v1

    .line 225
    iget v2, p0, Lv/TickerView;->o:F

    .line 226
    .line 227
    iget-object p0, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 228
    .line 229
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 230
    .line 231
    .line 232
    return-void
.end method

.method public final s()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lv/TickerView;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lv/TickerView;->k:I

    .line 8
    .line 9
    iget p0, p0, Lv/TickerView;->j:I

    .line 10
    .line 11
    if-ne v0, p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public setAllowSelfAdaptDuration(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/TickerView;->v:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDivision(I)V
    .locals 0

    .line 1
    iput p1, p0, Lv/TickerView;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lv/TickerView;->u:J

    .line 2
    .line 3
    return-void
.end method

.method public setLastNumDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lv/TickerView;->t:J

    .line 2
    .line 3
    return-void
.end method

.method public setTextColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setTextSize(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv/TickerView;->b:Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lv/TickerView;->c:Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lv/TickerView;->d:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final t(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lv/TickerView;->f:Ljava/lang/String;

    .line 2
    .line 3
    iget v1, p0, Lv/TickerView;->m:I

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    iget v2, p0, Lv/TickerView;->o:F

    .line 7
    .line 8
    iget-object p0, p0, Lv/TickerView;->a:Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final u()Z
    .locals 1

    .line 1
    iget v0, p0, Lv/TickerView;->i:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lv/TickerView;->h:I

    .line 6
    .line 7
    if-lt p0, v0, :cond_0

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
