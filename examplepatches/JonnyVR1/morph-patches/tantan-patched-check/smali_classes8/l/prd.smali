.class public Ll/prd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zs80;


# instance fields
.field public a:Lv/VFrame;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lv/VImage;

.field public final h:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

.field public i:Z

.field public j:F

.field public k:F


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/prd;->i:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/prd;->h:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic j(Ll/prd;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/prd;->v(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic k(Ll/prd;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/prd;->u(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic l(Ll/prd;)F
    .locals 0

    .line 1
    iget p0, p0, Ll/prd;->k:F

    return p0
.end method

.method public static bridge synthetic m(Ll/prd;)F
    .locals 0

    .line 1
    iget p0, p0, Ll/prd;->j:F

    return p0
.end method

.method public static bridge synthetic n(Ll/prd;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/prd;->w()V

    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Ll/cf60;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/dl5;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/dl5;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/prd;->r()Ll/rae;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, p0}, Ll/dl5;->x(Ll/rae;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic c(Landroid/view/View;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/prd;->p(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()Ll/ie80$c;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public f(Landroidx/viewpager/widget/ViewPager;II)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/prd;->e:Lv/VText;

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    add-int/lit8 p3, p3, 0x1

    .line 8
    .line 9
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    iget-object p0, p0, Ll/prd;->h:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->g:Ll/il5;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/il5;->m0()Ll/z5y;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ll/z5y;->source()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    filled-new-array {p3, p0}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p3, "%d/%d"

    .line 38
    .line 39
    invoke-static {p2, p3, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/prd;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h(ILcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i(ILcom/p1/mobile/putong/core/ui/PlayerView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public o(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qrd;->b(Ll/prd;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public p(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/prd;->t()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p1, Landroid/view/ViewGroup;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p0, p2}, Ll/prd;->q(Lcom/p1/mobile/putong/data/Media;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/prd;->d:Lv/VImage;

    .line 2
    .line 3
    new-instance v0, Ll/nrd;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/nrd;-><init>(Ll/prd;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/prd;->g:Lv/VImage;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final r()Ll/rae;
    .locals 1

    .line 1
    new-instance v0, Ll/prd$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/prd$b;-><init>(Ll/prd;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public s()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/prd;->i:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/prd;->b:Landroid/view/View;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    const/4 v4, 0x2

    .line 8
    const/4 v5, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    new-array v1, v4, [F

    .line 17
    .line 18
    aput v5, v1, v3

    .line 19
    .line 20
    aput v0, v1, v2

    .line 21
    .line 22
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    int-to-float v0, v0

    .line 32
    new-array v1, v4, [F

    .line 33
    .line 34
    aput v0, v1, v3

    .line 35
    .line 36
    aput v5, v1, v2

    .line 37
    .line 38
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    :goto_0
    new-instance v1, Ll/prd$a;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/prd$a;-><init>(Ll/prd;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/ord;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/ord;-><init>(Ll/prd;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 56
    .line 57
    .line 58
    const-wide/16 v1, 0x12c

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final t()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/prd;->h:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/prd;->o(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/prd;->h:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/prd;->c:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    neg-float p1, p1

    .line 14
    invoke-virtual {v0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/prd;->b:Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final w()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/prd;->i:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput-boolean v0, p0, Ll/prd;->i:Z

    .line 6
    .line 7
    iget-object v0, p0, Ll/prd;->c:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Ll/prd;->j:F

    .line 14
    .line 15
    iget-object v0, p0, Ll/prd;->b:Landroid/view/View;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p0, Ll/prd;->k:F

    .line 22
    .line 23
    return-void
.end method
