.class public Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# static fields
.field public static l:I = 0x12c

.field public static m:I

.field public static n:I

.field public static o:I

.field public static p:I

.field public static q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/x20;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Z

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Landroid/animation/ValueAnimator;

.field public g:Ll/kcg0;

.field public h:Landroid/widget/TextView;

.field public final i:Ljava/lang/String;

.field public j:Ll/x20;

.field public k:Landroid/view/GestureDetector;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->q:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "countdown_voice_buzz_zoom_key"

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->i:Ljava/lang/String;

    .line 23
    .line 24
    new-instance p1, Ll/rq3;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/rq3;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->j:Ll/x20;

    .line 30
    .line 31
    new-instance p1, Landroid/view/GestureDetector;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView$a;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView$a;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p1, v0, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->k:Landroid/view/GestureDetector;

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->f()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "countdown_voice_buzz_zoom_key"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->i:Ljava/lang/String;

    .line 54
    new-instance p1, Ll/rq3;

    invoke-direct {p1, p0}, Ll/rq3;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->j:Ll/x20;

    .line 55
    new-instance p1, Landroid/view/GestureDetector;

    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    new-instance v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView$a;

    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView$a;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;)V

    invoke-direct {p1, p2, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->k:Landroid/view/GestureDetector;

    .line 57
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->f()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 58
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 59
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "countdown_voice_buzz_zoom_key"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->i:Ljava/lang/String;

    .line 61
    new-instance p1, Ll/rq3;

    invoke-direct {p1, p0}, Ll/rq3;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->j:Ll/x20;

    .line 62
    new-instance p1, Landroid/view/GestureDetector;

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    new-instance p3, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView$a;

    invoke-direct {p3, p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView$a;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;)V

    invoke-direct {p1, p2, p3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->k:Landroid/view/GestureDetector;

    .line 64
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->f()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->j()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->i(Ll/pf60;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->k(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->a:Z

    return p0
.end method

.method private f()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/mec0;->n:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    sget v0, Ll/bdc0;->k:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Landroid/widget/TextView;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->h:Landroid/widget/TextView;

    .line 19
    .line 20
    return-void
.end method

.method private synthetic j()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private m()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->q:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/x20;

    .line 27
    .line 28
    invoke-interface {v0}, Ll/x20;->call()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    :goto_1
    return-void
.end method

.method private n()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->d:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    sub-int/2addr v1, v2

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    div-int/lit8 v1, v1, 0x2

    .line 30
    .line 31
    add-int/2addr v0, v1

    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->d:I

    .line 33
    .line 34
    div-int/lit8 v1, v1, 0x2

    .line 35
    .line 36
    if-ge v0, v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/4 v1, 0x0

    .line 43
    filled-new-array {v0, v1}, [I

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->f:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->d:I

    .line 59
    .line 60
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->b:I

    .line 61
    .line 62
    sub-int/2addr v1, v2

    .line 63
    filled-new-array {v0, v1}, [I

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->f:Landroid/animation/ValueAnimator;

    .line 72
    .line 73
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->f:Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    sget v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->l:I

    .line 76
    .line 77
    int-to-long v1, v1

    .line 78
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->f:Landroid/animation/ValueAnimator;

    .line 82
    .line 83
    new-instance v1, Ll/sq3;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/sq3;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->f:Landroid/animation/ValueAnimator;

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 94
    .line 95
    .line 96
    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public e()V
    .locals 5

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->o:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->p:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    sget v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->o:I

    .line 15
    .line 16
    if-ne v0, v1, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    sget v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->p:I

    .line 23
    .line 24
    if-eq v0, v1, :cond_1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    return-void

    .line 28
    :cond_2
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 51
    .line 52
    sget v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->o:I

    .line 53
    .line 54
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 55
    .line 56
    sget v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->p:I

    .line 57
    .line 58
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 59
    .line 60
    :cond_3
    sget v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->o:I

    .line 61
    .line 62
    sget v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->p:I

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    add-int/2addr v2, v0

    .line 69
    sget v3, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->p:I

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    add-int/2addr v3, v4

    .line 76
    invoke-virtual {p0, v0, v1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->m()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final g()V
    .locals 6

    .line 1
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/haw;->B0()Ll/eqx;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/eqx;->f()Lcom/p1/mobile/putong/core/ui/lovebuzz/manager/LoveBuzzConstants$MATCH;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/manager/LoveBuzzConstants$MATCH;->MATCHED:Lcom/p1/mobile/putong/core/ui/lovebuzz/manager/LoveBuzzConstants$MATCH;

    .line 16
    .line 17
    if-ne v1, v2, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->h:Landroid/widget/TextView;

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/core/buzz/R$string;->F0:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->i:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ll/eqx;->c()J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->h:Landroid/widget/TextView;

    .line 41
    .line 42
    sget-object v3, Ll/k8w;->INSTANCE:Ll/k8w;

    .line 43
    .line 44
    invoke-virtual {v3, v0, v1}, Ll/k8w;->c(J)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    new-instance v2, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 52
    .line 53
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->i:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-static {}, Ll/pzi0;->o()J

    .line 63
    .line 64
    .line 65
    move-result-wide v4

    .line 66
    add-long/2addr v0, v4

    .line 67
    invoke-virtual {v3, v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 72
    .line 73
    .line 74
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 77
    .line 78
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final h()V
    .locals 2

    .line 1
    sget-object v0, Ll/haw;->Companion:Ll/haw$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/haw$a;->a()Ll/haw;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/haw;->D0()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/qq3;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/qq3;-><init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->g:Ll/kcg0;

    .line 25
    .line 26
    return-void
.end method

.method public final synthetic i(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "voiceBuzz_like_relation"

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    sget-object p1, Ll/haw;->Companion:Ll/haw$a;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/haw$a;->a()Ll/haw;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/haw;->B0()Ll/eqx;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/eqx;->f()Lcom/p1/mobile/putong/core/ui/lovebuzz/manager/LoveBuzzConstants$MATCH;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/manager/LoveBuzzConstants$MATCH;->MATCHED:Lcom/p1/mobile/putong/core/ui/lovebuzz/manager/LoveBuzzConstants$MATCH;

    .line 28
    .line 29
    if-ne p1, v0, :cond_0

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->i:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->h:Landroid/widget/TextView;

    .line 41
    .line 42
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->F0:I

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void

    .line 48
    :cond_1
    const-string v0, "voiceBuzz_peer_report"

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const/4 v1, -0x1

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->l(I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    const-string v0, "voiceBuzz_prolong_time"

    .line 62
    .line 63
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->g()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    const-string v0, "voiceBuzz_warn"

    .line 74
    .line 75
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_4

    .line 80
    .line 81
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->l(I)V

    .line 82
    .line 83
    .line 84
    :cond_4
    return-void
.end method

.method public final synthetic k(Landroid/animation/ValueAnimator;)V
    .locals 3

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
    sput p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->o:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->b:I

    .line 18
    .line 19
    add-int/2addr v1, p1

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {p0, p1, v0, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public l(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 5
    .line 6
    .line 7
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->i:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->INSTANCE:Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/media/BuzzMediaCallManager;->W()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    instance-of p1, p1, Landroid/view/ViewGroup;

    .line 26
    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Landroid/view/ViewGroup;

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->q:Ljava/util/List;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->j:Ll/x20;

    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->g()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->h()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->i:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->q:Ljava/util/List;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->j:Ll/x20;

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->g:Ll/kcg0;

    .line 21
    .line 22
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->f:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->f:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->e()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->b:I

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->c:I

    .line 7
    .line 8
    invoke-static {}, Ll/bnl0;->y0()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->d:I

    .line 13
    .line 14
    invoke-static {}, Ll/bnl0;->w0()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->e:I

    .line 19
    .line 20
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->k:Landroid/view/GestureDetector;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_9

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v2, 0x1

    .line 18
    if-eqz v0, :cond_7

    .line 19
    .line 20
    if-eq v0, v2, :cond_6

    .line 21
    .line 22
    const/4 v3, 0x2

    .line 23
    if-eq v0, v3, :cond_0

    .line 24
    .line 25
    const/4 p1, 0x3

    .line 26
    if-eq v0, p1, :cond_6

    .line 27
    .line 28
    goto/16 :goto_2

    .line 29
    .line 30
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    sget v3, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->m:I

    .line 35
    .line 36
    int-to-float v3, v3

    .line 37
    sub-float/2addr v0, v3

    .line 38
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    sget v3, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->n:I

    .line 43
    .line 44
    int-to-float v3, v3

    .line 45
    sub-float/2addr p1, v3

    .line 46
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    const/high16 v4, 0x41200000    # 10.0f

    .line 51
    .line 52
    cmpl-float v3, v3, v4

    .line 53
    .line 54
    if-gtz v3, :cond_1

    .line 55
    .line 56
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    cmpl-float v3, v3, v4

    .line 61
    .line 62
    if-lez v3, :cond_8

    .line 63
    .line 64
    :cond_1
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->a:Z

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    int-to-float v3, v3

    .line 71
    add-float/2addr v3, v0

    .line 72
    float-to-int v0, v3

    .line 73
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->b:I

    .line 74
    .line 75
    add-int/2addr v3, v0

    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    int-to-float v4, v4

    .line 81
    add-float/2addr v4, p1

    .line 82
    float-to-int p1, v4

    .line 83
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->c:I

    .line 84
    .line 85
    add-int v5, p1, v4

    .line 86
    .line 87
    if-gez v0, :cond_2

    .line 88
    .line 89
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->b:I

    .line 90
    .line 91
    move v0, v1

    .line 92
    goto :goto_0

    .line 93
    :cond_2
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->d:I

    .line 94
    .line 95
    if-le v3, v6, :cond_3

    .line 96
    .line 97
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->b:I

    .line 98
    .line 99
    sub-int v0, v6, v0

    .line 100
    .line 101
    move v3, v6

    .line 102
    :cond_3
    :goto_0
    if-gez p1, :cond_4

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->e:I

    .line 106
    .line 107
    if-le v5, v1, :cond_5

    .line 108
    .line 109
    sub-int p1, v1, v4

    .line 110
    .line 111
    move v4, v1

    .line 112
    move v1, p1

    .line 113
    goto :goto_1

    .line 114
    :cond_5
    move v1, p1

    .line 115
    move v4, v5

    .line 116
    :goto_1
    sput v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->o:I

    .line 117
    .line 118
    sput v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->p:I

    .line 119
    .line 120
    invoke-virtual {p0, v0, v1, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 121
    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_6
    invoke-virtual {p0, v1}, Landroid/view/View;->setPressed(Z)V

    .line 125
    .line 126
    .line 127
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->n()V

    .line 128
    .line 129
    .line 130
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->a:Z

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_7
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->a:Z

    .line 134
    .line 135
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    float-to-int p0, p0

    .line 140
    sput p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->m:I

    .line 141
    .line 142
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    float-to-int p0, p0

    .line 147
    sput p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->n:I

    .line 148
    .line 149
    :cond_8
    :goto_2
    return v2

    .line 150
    :cond_9
    return v1
.end method

.method public u(Ljava/lang/String;JJJJ)V
    .locals 0

    .line 1
    sub-long/2addr p6, p2

    .line 2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->i:Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->h:Landroid/widget/TextView;

    .line 11
    .line 12
    sget-object p2, Ll/k8w;->INSTANCE:Ll/k8w;

    .line 13
    .line 14
    invoke-virtual {p2, p6, p7}, Ll/k8w;->c(J)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    const-wide/16 p1, 0x0

    .line 22
    .line 23
    cmp-long p1, p6, p1

    .line 24
    .line 25
    if-gtz p1, :cond_1

    .line 26
    .line 27
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->z0:I

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/BuzzVoiceView;->l(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method
