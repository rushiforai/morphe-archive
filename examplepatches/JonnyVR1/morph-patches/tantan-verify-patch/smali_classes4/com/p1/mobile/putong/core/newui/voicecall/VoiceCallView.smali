.class public Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static m:I = 0x12c

.field public static n:I

.field public static o:I

.field public static p:I

.field public static q:I

.field public static r:Ljava/util/List;
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

.field public i:Landroid/widget/ImageView;

.field public j:Ll/kcg0;

.field public k:Ll/x20;

.field public l:Landroid/view/GestureDetector;


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
    sput-object v0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->r:Ljava/util/List;

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
    new-instance p1, Ll/x1n0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/x1n0;-><init>(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->k:Ll/x20;

    .line 10
    .line 11
    new-instance p1, Landroid/view/GestureDetector;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView$a;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView$a;-><init>(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {p1, v0, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->l:Landroid/view/GestureDetector;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->j()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 31
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    new-instance p1, Ll/x1n0;

    invoke-direct {p1, p0}, Ll/x1n0;-><init>(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->k:Ll/x20;

    .line 33
    new-instance p1, Landroid/view/GestureDetector;

    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    new-instance v0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView$a;

    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView$a;-><init>(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V

    invoke-direct {p1, p2, v0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->l:Landroid/view/GestureDetector;

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->j()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    new-instance p1, Ll/x1n0;

    invoke-direct {p1, p0}, Ll/x1n0;-><init>(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->k:Ll/x20;

    .line 38
    new-instance p1, Landroid/view/GestureDetector;

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    new-instance p3, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView$a;

    invoke-direct {p3, p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView$a;-><init>(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V

    invoke-direct {p1, p2, p3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->l:Landroid/view/GestureDetector;

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->j()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->m(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->l(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->k()V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-lez p0, :cond_0

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

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->o(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->n()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->a:Z

    return p0
.end method


# virtual methods
.method public final h()V
    .locals 2

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xzm0;->i()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/y1n0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/y1n0;-><init>(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->g:Ll/kcg0;

    .line 31
    .line 32
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Ll/uqx;->l:Lrx/subjects/a;

    .line 37
    .line 38
    new-instance v1, Ll/z1n0;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/z1n0;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/a2n0;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/a2n0;-><init>(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->j:Ll/kcg0;

    .line 69
    .line 70
    return-void
.end method

.method public i()V
    .locals 5

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->p:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->q:I

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
    sget v1, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->p:I

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
    sget v1, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->q:I

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
    sget v1, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->p:I

    .line 53
    .line 54
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 55
    .line 56
    sget v1, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->q:I

    .line 57
    .line 58
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 59
    .line 60
    :cond_3
    sget v0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->p:I

    .line 61
    .line 62
    sget v1, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->q:I

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
    sget v3, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->q:I

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->p()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/qec0;->B4:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    sget v0, Ll/edc0;->O4:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->h:Landroid/widget/TextView;

    .line 19
    .line 20
    sget v0, Ll/edc0;->k1:I

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Landroid/widget/ImageView;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->i:Landroid/widget/ImageView;

    .line 29
    .line 30
    return-void
.end method

.method public final synthetic k()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/view/ViewGroup;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic l(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->h:Landroid/widget/TextView;

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->L6:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->i:Landroid/widget/ImageView;

    .line 22
    .line 23
    sget p1, Ll/ibc0;->J0:I

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->h:Landroid/widget/TextView;

    .line 30
    .line 31
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->K6:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->h:Landroid/widget/TextView;

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->i:Landroid/widget/ImageView;

    .line 43
    .line 44
    sget v0, Ll/ibc0;->K0:I

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    new-instance p1, Ll/c2n0;

    .line 50
    .line 51
    invoke-direct {p1, p0}, Ll/c2n0;-><init>(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V

    .line 52
    .line 53
    .line 54
    const-wide/16 v0, 0x3e8

    .line 55
    .line 56
    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic m(Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xzm0;->l()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x3

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->h:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    invoke-static {v0, v1}, Ll/w1n0;->b(J)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final synthetic n()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o(Landroid/animation/ValueAnimator;)V
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
    sput p1, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->p:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->b:I

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

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->r:Ljava/util/List;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->k:Ll/x20;

    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->h()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->r:Ljava/util/List;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->k:Ll/x20;

    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->g:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->j:Ll/kcg0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->f:Landroid/animation/ValueAnimator;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->f:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 32
    .line 33
    .line 34
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->i()V

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
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->b:I

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->c:I

    .line 7
    .line 8
    invoke-static {}, Ll/bnl0;->y0()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->d:I

    .line 13
    .line 14
    invoke-static {}, Ll/bnl0;->w0()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->e:I

    .line 19
    .line 20
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->l:Landroid/view/GestureDetector;

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
    sget v3, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->n:I

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
    sget v3, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->o:I

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
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->a:Z

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
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->b:I

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
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->c:I

    .line 84
    .line 85
    add-int v5, p1, v4

    .line 86
    .line 87
    if-gez v0, :cond_2

    .line 88
    .line 89
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->b:I

    .line 90
    .line 91
    move v0, v1

    .line 92
    goto :goto_0

    .line 93
    :cond_2
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->d:I

    .line 94
    .line 95
    if-le v3, v6, :cond_3

    .line 96
    .line 97
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->b:I

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
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->e:I

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
    sput v0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->p:I

    .line 117
    .line 118
    sput v1, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->q:I

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->q()V

    .line 128
    .line 129
    .line 130
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->a:Z

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_7
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->a:Z

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
    sput p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->n:I

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
    sput p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->o:I

    .line 148
    .line 149
    :cond_8
    :goto_2
    return v2

    .line 150
    :cond_9
    return v1
.end method

.method public final p()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->r:Ljava/util/List;

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
    sget-object p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->r:Ljava/util/List;

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

.method public final q()V
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
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->d:I

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
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->d:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->f:Landroid/animation/ValueAnimator;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->d:I

    .line 59
    .line 60
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->b:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->f:Landroid/animation/ValueAnimator;

    .line 72
    .line 73
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->f:Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    sget v1, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->m:I

    .line 76
    .line 77
    int-to-long v1, v1

    .line 78
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->f:Landroid/animation/ValueAnimator;

    .line 82
    .line 83
    new-instance v1, Ll/b2n0;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/b2n0;-><init>(Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;->f:Landroid/animation/ValueAnimator;

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
