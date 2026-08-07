.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/wvl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;,
        Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;
    }
.end annotation


# static fields
.field public static u:Z


# instance fields
.field public a:Lcom/tantan/library/svga/SVGAnimationView;

.field public b:Lv/VImage;

.field public c:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public d:Lv/VLinear;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public f:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealNumContentLayout;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public j:Landroid/graphics/Paint;

.field public k:F

.field public l:F

.field public m:I

.field public n:I

.field public o:Landroid/animation/ValueAnimator;

.field public p:Landroid/animation/ValueAnimator;

.field public q:F

.field public r:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;",
            ">;"
        }
    .end annotation
.end field

.field public t:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

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
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->n:I

    .line 6
    .line 7
    const/high16 p1, 0x41200000    # 10.0f

    .line 8
    .line 9
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    int-to-float p1, p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->q:F

    .line 15
    .line 16
    new-instance p1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->m()V

    .line 24
    .line 25
    .line 26
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

    .line 27
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->n:I

    const/high16 p1, 0x41200000    # 10.0f

    .line 29
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->q:F

    .line 30
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->m()V

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

    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->n:I

    const/high16 p1, 0x41200000    # 10.0f

    .line 34
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->q:F

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->m()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->o(Ll/pf60;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->n(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->l:F

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->p(F)V

    return-void
.end method

.method public static bridge synthetic f()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->u:Z

    return v0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->k3()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->h:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 10
    .line 11
    iget-object v2, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->g:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 21
    .line 22
    iget-object v2, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 32
    .line 33
    move-object v2, v1

    .line 34
    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 35
    .line 36
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 37
    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    const-string v2, "https://auto.tancdn.com/v1/raw/e1682a2a-bb89-4167-8d38-b0a02f577b9114.svga"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-string v2, "https://auto.tancdn.com/v1/raw/07117dd5-5a08-410c-af53-77044233802414.svga"

    .line 44
    .line 45
    :goto_0
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 46
    .line 47
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    sget v1, Ll/dbc0;->gd:I

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    sget v1, Ll/dbc0;->ed:I

    .line 55
    .line 56
    :goto_1
    const/4 v3, 0x0

    .line 57
    invoke-virtual {p0, v2, v1, v3}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->q(Ljava/lang/String;IZ)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->r(Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->m3()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const/4 v1, 0x1

    .line 76
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance v0, Ll/suq;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/suq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wuq;->a(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->p:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->p:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p1, 0x2

    .line 17
    new-array p1, p1, [F

    .line 18
    .line 19
    fill-array-data p1, :array_0

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->p:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    const-wide/16 v0, 0x12c

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->p:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$c;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$c;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->p:Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final i(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->o:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->o:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->l:F

    .line 17
    .line 18
    int-to-float p1, p1

    .line 19
    sub-float/2addr p1, v0

    .line 20
    const/4 v1, 0x2

    .line 21
    new-array v1, v1, [F

    .line 22
    .line 23
    fill-array-data v1, :array_0

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->o:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    const-wide/16 v2, 0x12c

    .line 33
    .line 34
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->o:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;

    .line 40
    .line 41
    const v3, 0x3df5c28f    # 0.12f

    .line 42
    .line 43
    .line 44
    invoke-direct {v2, p0, v3, v0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$d;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;FFF)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->o:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    nop

    .line 57
    :array_0
    .array-data 4
        0x0
        0x3f8f5c29    # 1.12f
    .end array-data
.end method

.method public final j(I)V
    .locals 2

    .line 1
    if-lez p1, :cond_1

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->l:F

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    cmpl-float v0, v0, v1

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    int-to-float p1, p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->l:F

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->i(I)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public final k(Ll/pf60;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->t:Ljava/util/HashMap;

    .line 7
    .line 8
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a()Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-object v0
.end method

.method public final l()V
    .locals 7

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->t:Ljava/util/HashMap;

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 14
    .line 15
    const/high16 v2, 0x3f800000    # 1.0f

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x1

    .line 19
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 26
    .line 27
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 34
    .line 35
    const/4 v5, 0x0

    .line 36
    invoke-direct {v1, v3, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 43
    .line 44
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 45
    .line 46
    .line 47
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 51
    .line 52
    invoke-direct {v1, v3, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 53
    .line 54
    .line 55
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 59
    .line 60
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->t:Ljava/util/HashMap;

    .line 67
    .line 68
    sget-object v6, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 69
    .line 70
    invoke-virtual {v1, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    new-instance v0, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 79
    .line 80
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 81
    .line 82
    .line 83
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 87
    .line 88
    invoke-direct {v1, v3, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 89
    .line 90
    .line 91
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 95
    .line 96
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 97
    .line 98
    .line 99
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 103
    .line 104
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 105
    .line 106
    .line 107
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 111
    .line 112
    invoke-direct {v1, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 113
    .line 114
    .line 115
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 119
    .line 120
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 121
    .line 122
    .line 123
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->t:Ljava/util/HashMap;

    .line 127
    .line 128
    sget-object v6, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->PRE_START:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 129
    .line 130
    invoke-virtual {v1, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    new-instance v0, Ljava/util/ArrayList;

    .line 134
    .line 135
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .line 137
    .line 138
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 139
    .line 140
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 141
    .line 142
    .line 143
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 147
    .line 148
    invoke-direct {v1, v3, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 149
    .line 150
    .line 151
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 155
    .line 156
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 157
    .line 158
    .line 159
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 163
    .line 164
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 165
    .line 166
    .line 167
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 171
    .line 172
    invoke-direct {v1, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 173
    .line 174
    .line 175
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 179
    .line 180
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 181
    .line 182
    .line 183
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->t:Ljava/util/HashMap;

    .line 187
    .line 188
    sget-object v6, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->TRIALING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 189
    .line 190
    invoke-virtual {v1, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    new-instance v0, Ljava/util/ArrayList;

    .line 194
    .line 195
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .line 197
    .line 198
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 199
    .line 200
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 201
    .line 202
    .line 203
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 207
    .line 208
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 209
    .line 210
    .line 211
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 215
    .line 216
    invoke-direct {v1, v3, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 217
    .line 218
    .line 219
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 223
    .line 224
    invoke-direct {v1, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 225
    .line 226
    .line 227
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 231
    .line 232
    invoke-direct {v1, v2, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 233
    .line 234
    .line 235
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 239
    .line 240
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 241
    .line 242
    .line 243
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->t:Ljava/util/HashMap;

    .line 247
    .line 248
    sget-object v6, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 249
    .line 250
    invoke-virtual {v1, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->t:Ljava/util/HashMap;

    .line 254
    .line 255
    sget-object v6, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 256
    .line 257
    invoke-virtual {v1, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    new-instance v0, Ljava/util/ArrayList;

    .line 261
    .line 262
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 263
    .line 264
    .line 265
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 266
    .line 267
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 268
    .line 269
    .line 270
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 274
    .line 275
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 276
    .line 277
    .line 278
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 282
    .line 283
    invoke-direct {v1, v3, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 284
    .line 285
    .line 286
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 290
    .line 291
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 292
    .line 293
    .line 294
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 298
    .line 299
    invoke-direct {v1, v3, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 300
    .line 301
    .line 302
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 306
    .line 307
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;-><init>(FFZ)V

    .line 308
    .line 309
    .line 310
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    .line 312
    .line 313
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->t:Ljava/util/HashMap;

    .line 314
    .line 315
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->FINISH:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 316
    .line 317
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    return-void
.end method

.method public final m()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->j:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->j:Landroid/graphics/Paint;

    .line 13
    .line 14
    const v1, -0xd0d0e

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->l:F

    .line 22
    .line 23
    const/high16 v0, 0x42100000    # 36.0f

    .line 24
    .line 25
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->m:I

    .line 30
    .line 31
    const/high16 v0, 0x41200000    # 10.0f

    .line 32
    .line 33
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    int-to-float v0, v0

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->k:F

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-static {p0, p1}, Ll/quq;->P(Lcom/p1/mobile/android/app/Act;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic o(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->r:Ll/pf60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    move-object v2, v1

    .line 10
    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 11
    .line 12
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 13
    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 15
    .line 16
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 17
    .line 18
    if-eq v2, v0, :cond_2

    .line 19
    .line 20
    move-object v0, v1

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 22
    .line 23
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string v0, "https://auto.tancdn.com/v1/raw/971473e6-caf8-4972-8380-2f58273555e414.svga"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v0, "https://auto.tancdn.com/v1/raw/a0d1dac8-559c-4258-a092-6129b31427eb14.svga"

    .line 31
    .line 32
    :goto_0
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 33
    .line 34
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    sget v1, Ll/dbc0;->gd:I

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    sget v1, Ll/dbc0;->ed:I

    .line 42
    .line 43
    :goto_1
    const/4 v2, 0x1

    .line 44
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->q(Ljava/lang/String;IZ)V

    .line 45
    .line 46
    .line 47
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->r(Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->l:F

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    cmpl-float v0, v3, v0

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->m:I

    .line 12
    .line 13
    int-to-float v4, v0

    .line 14
    iget v5, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->k:F

    .line 15
    .line 16
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->j:Landroid/graphics/Paint;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    move v6, v5

    .line 21
    move-object v0, p1

    .line 22
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Landroid/animation/LayoutTransition;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 10
    .line 11
    .line 12
    const-wide/16 v1, 0x12c

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->d:Lv/VLinear;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 23
    .line 24
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 27
    .line 28
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;-><init>(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 35
    .line 36
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->c:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 39
    .line 40
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;-><init>(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 47
    .line 48
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->d:Lv/VLinear;

    .line 51
    .line 52
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;-><init>(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 59
    .line 60
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;

    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->g:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 63
    .line 64
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;-><init>(Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 71
    .line 72
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;

    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->h:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 75
    .line 76
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;-><init>(Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 83
    .line 84
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;

    .line 85
    .line 86
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->i:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 87
    .line 88
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;-><init>(Landroid/view/View;)V

    .line 89
    .line 90
    .line 91
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->l()V

    .line 95
    .line 96
    .line 97
    new-instance v0, Ll/ruq;

    .line 98
    .line 99
    invoke-direct {v0, p0}, Ll/ruq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;)V

    .line 100
    .line 101
    .line 102
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 14
    .line 15
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->c:Z

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const/4 p1, 0x2

    .line 29
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    goto :goto_0

    .line 34
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->a:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/high16 p2, 0x42280000    # 42.0f

    .line 41
    .line 42
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    add-int/2addr p1, p2

    .line 47
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->n:I

    .line 48
    .line 49
    if-eq p1, p2, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->j(I)V

    .line 52
    .line 53
    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->n:I

    .line 55
    .line 56
    :cond_1
    const/high16 p2, 0x42100000    # 36.0f

    .line 57
    .line 58
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final p(F)V
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 20
    .line 21
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 22
    .line 23
    iget v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a:F

    .line 24
    .line 25
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 26
    .line 27
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a:F

    .line 28
    .line 29
    sub-float/2addr v5, v3

    .line 30
    mul-float/2addr v5, p1

    .line 31
    add-float/2addr v3, v5

    .line 32
    iput v3, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a:F

    .line 33
    .line 34
    iget v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 35
    .line 36
    iget v5, v4, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 37
    .line 38
    sub-float/2addr v5, v3

    .line 39
    mul-float/2addr v5, p1

    .line 40
    add-float/2addr v3, v5

    .line 41
    iput v3, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 42
    .line 43
    iget v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->d:F

    .line 44
    .line 45
    iget v3, v4, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->d:F

    .line 46
    .line 47
    sub-float/2addr v3, v2

    .line 48
    mul-float/2addr v3, p1

    .line 49
    add-float/2addr v2, v3

    .line 50
    iput v2, v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->d:F

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->a()V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    return-void
.end method

.method public final q(Ljava/lang/String;IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->b:Lv/VImage;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->b:Lv/VImage;

    .line 13
    .line 14
    invoke-virtual {v0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p2}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$b;

    .line 30
    .line 31
    invoke-direct {v0, p0, p3, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;ZLjava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$a;

    .line 39
    .line 40
    invoke-direct {v0, p0, p3, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;ZLjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/4 p2, 0x1

    .line 48
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 57
    .line 58
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final r(Ll/pf60;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->h:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->g:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->g:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 13
    .line 14
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->h:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 24
    .line 25
    invoke-static {}, Ll/bnl0;->y0()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const/high16 v2, -0x80000000

    .line 30
    .line 31
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/high16 v3, 0x42000000    # 32.0f

    .line 36
    .line 37
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    invoke-static {v4, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-virtual {v0, v1, v4}, Landroid/view/View;->measure(II)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->g:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 49
    .line 50
    invoke-static {}, Ll/bnl0;->y0()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->k(Ll/pf60;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const/4 v1, 0x0

    .line 74
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-ge v1, v2, :cond_8

    .line 81
    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->s:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    check-cast v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;

    .line 89
    .line 90
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    check-cast v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 95
    .line 96
    iget-object v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 97
    .line 98
    invoke-virtual {v4, v3}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;)V

    .line 99
    .line 100
    .line 101
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->r:Ll/pf60;

    .line 102
    .line 103
    if-nez v3, :cond_0

    .line 104
    .line 105
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 106
    .line 107
    iget-object v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 108
    .line 109
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->a()V

    .line 113
    .line 114
    .line 115
    goto/16 :goto_2

    .line 116
    .line 117
    :cond_0
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 118
    .line 119
    iget-object v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 120
    .line 121
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;)V

    .line 122
    .line 123
    .line 124
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 125
    .line 126
    iget-object v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 127
    .line 128
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;)V

    .line 129
    .line 130
    .line 131
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 132
    .line 133
    const/4 v4, 0x0

    .line 134
    iput v4, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->d:F

    .line 135
    .line 136
    iget-object v5, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 137
    .line 138
    iget-boolean v6, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->c:Z

    .line 139
    .line 140
    iget-object v7, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 141
    .line 142
    iget-boolean v8, v7, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->c:Z

    .line 143
    .line 144
    if-eq v6, v8, :cond_2

    .line 145
    .line 146
    iget-object v6, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 147
    .line 148
    iget-boolean v6, v6, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->c:Z

    .line 149
    .line 150
    iput-boolean v6, v3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->c:Z

    .line 151
    .line 152
    iget-boolean v3, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->c:Z

    .line 153
    .line 154
    if-eqz v3, :cond_1

    .line 155
    .line 156
    iput v4, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 157
    .line 158
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->q:F

    .line 159
    .line 160
    neg-float v3, v3

    .line 161
    iput v3, v7, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_1
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->q:F

    .line 165
    .line 166
    iput v3, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 167
    .line 168
    iput v4, v7, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 169
    .line 170
    :cond_2
    :goto_1
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->a:Landroid/view/View;

    .line 171
    .line 172
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->g:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 173
    .line 174
    const/high16 v7, 0x3f800000    # 1.0f

    .line 175
    .line 176
    if-ne v3, v6, :cond_4

    .line 177
    .line 178
    invoke-virtual {v6}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->h:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 183
    .line 184
    invoke-virtual {v5}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    iget-object v5, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 193
    .line 194
    if-eqz v3, :cond_3

    .line 195
    .line 196
    iput v4, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 197
    .line 198
    iput v7, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a:F

    .line 199
    .line 200
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 201
    .line 202
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 203
    .line 204
    iput v7, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a:F

    .line 205
    .line 206
    goto :goto_2

    .line 207
    :cond_3
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->q:F

    .line 208
    .line 209
    iput v3, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 210
    .line 211
    iput v4, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a:F

    .line 212
    .line 213
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 214
    .line 215
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 216
    .line 217
    iput v7, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a:F

    .line 218
    .line 219
    goto :goto_2

    .line 220
    :cond_4
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->h:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 221
    .line 222
    if-ne v3, v8, :cond_6

    .line 223
    .line 224
    invoke-virtual {v6}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->h:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 229
    .line 230
    invoke-virtual {v5}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 231
    .line 232
    .line 233
    move-result-object v5

    .line 234
    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    iget-object v5, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 239
    .line 240
    if-eqz v3, :cond_5

    .line 241
    .line 242
    iput v4, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 243
    .line 244
    iput v4, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a:F

    .line 245
    .line 246
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 247
    .line 248
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 249
    .line 250
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a:F

    .line 251
    .line 252
    goto :goto_2

    .line 253
    :cond_5
    iput v4, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 254
    .line 255
    iput v7, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a:F

    .line 256
    .line 257
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 258
    .line 259
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->q:F

    .line 260
    .line 261
    neg-float v3, v3

    .line 262
    iput v3, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->b:F

    .line 263
    .line 264
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->a:F

    .line 265
    .line 266
    goto :goto_2

    .line 267
    :cond_6
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->i:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 268
    .line 269
    if-ne v3, v6, :cond_7

    .line 270
    .line 271
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredWidth()I

    .line 272
    .line 273
    .line 274
    move-result v3

    .line 275
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->g:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 276
    .line 277
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    .line 278
    .line 279
    .line 280
    move-result v6

    .line 281
    sub-int/2addr v3, v6

    .line 282
    int-to-float v3, v3

    .line 283
    iput v3, v5, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->d:F

    .line 284
    .line 285
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$f;->e:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;

    .line 286
    .line 287
    iput v4, v2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$e;->d:F

    .line 288
    .line 289
    :cond_7
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 290
    .line 291
    goto/16 :goto_0

    .line 292
    .line 293
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->r:Ll/pf60;

    .line 294
    .line 295
    if-eqz v0, :cond_9

    .line 296
    .line 297
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 298
    .line 299
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 300
    .line 301
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->h(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 302
    .line 303
    .line 304
    :cond_9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->r:Ll/pf60;

    .line 305
    .line 306
    return-void
.end method
