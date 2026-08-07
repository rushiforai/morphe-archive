.class public Lcom/p1/mobile/putong/ui/splash/FakeSplashView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static A:Ll/jxd0;

.field public static B:Z


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lv/VFrame_FixRatio;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public f:Lcom/tantan/library/svga/SVGAnimationView;

.field public g:Lcom/tantan/library/svga/SVGAnimationView;

.field public h:Landroid/view/View;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lv/VDelegateLayout;

.field public k:Lv/VPager;

.field public l:Lv/VPagerWormIndicator;

.field public m:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public n:Lv/VImage;

.field public o:Lv/VText;

.field public p:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public q:Lv/VImage;

.field public r:Lv/VText;

.field public s:Lv/VLinear;

.field public t:Lv/VCheckBox;

.field public u:Lv/VText;

.field public v:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/jl80;",
            ">;"
        }
    .end annotation
.end field

.field public w:Landroid/text/SpannableStringBuilder;

.field public x:Ll/jor;

.field public y:Landroid/text/style/RelativeSizeSpan;

.field public z:Landroid/text/style/StyleSpan;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "has_click_visitor"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->A:Ll/jxd0;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    sput-boolean v0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->B:Z

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
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
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->v:Ll/y20;

    .line 6
    .line 7
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 8
    .line 9
    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w:Landroid/text/SpannableStringBuilder;

    .line 13
    .line 14
    new-instance p1, Ll/jor;

    .line 15
    .line 16
    const v0, -0xbcb7

    .line 17
    .line 18
    .line 19
    const v1, -0x17ac1

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-direct {p1, v0, v1, v2}, Ll/jor;-><init>(IIZ)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->x:Ll/jor;

    .line 27
    .line 28
    new-instance p1, Landroid/text/style/RelativeSizeSpan;

    .line 29
    .line 30
    const v0, 0x3f99999a    # 1.2f

    .line 31
    .line 32
    .line 33
    invoke-direct {p1, v0}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->y:Landroid/text/style/RelativeSizeSpan;

    .line 37
    .line 38
    new-instance p1, Landroid/text/style/StyleSpan;

    .line 39
    .line 40
    invoke-direct {p1, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->z:Landroid/text/style/StyleSpan;

    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 46
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->v:Ll/y20;

    .line 48
    new-instance p1, Landroid/text/SpannableStringBuilder;

    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w:Landroid/text/SpannableStringBuilder;

    .line 49
    new-instance p1, Ll/jor;

    const p2, -0xbcb7

    const v0, -0x17ac1

    const/4 v1, 0x1

    invoke-direct {p1, p2, v0, v1}, Ll/jor;-><init>(IIZ)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->x:Ll/jor;

    .line 50
    new-instance p1, Landroid/text/style/RelativeSizeSpan;

    const p2, 0x3f99999a    # 1.2f

    invoke-direct {p1, p2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->y:Landroid/text/style/RelativeSizeSpan;

    .line 51
    new-instance p1, Landroid/text/style/StyleSpan;

    invoke-direct {p1, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->z:Landroid/text/style/StyleSpan;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 52
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->v:Ll/y20;

    .line 54
    new-instance p1, Landroid/text/SpannableStringBuilder;

    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w:Landroid/text/SpannableStringBuilder;

    .line 55
    new-instance p1, Ll/jor;

    const p2, -0xbcb7

    const p3, -0x17ac1

    const/4 v0, 0x1

    invoke-direct {p1, p2, p3, v0}, Ll/jor;-><init>(IIZ)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->x:Ll/jor;

    .line 56
    new-instance p1, Landroid/text/style/RelativeSizeSpan;

    const p2, 0x3f99999a    # 1.2f

    invoke-direct {p1, p2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->y:Landroid/text/style/RelativeSizeSpan;

    .line 57
    new-instance p1, Landroid/text/style/StyleSpan;

    invoke-direct {p1, v0}, Landroid/text/style/StyleSpan;-><init>(I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->z:Landroid/text/style/StyleSpan;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->r(Ll/jl80;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->o(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(IIII)[I
    .locals 2

    .line 1
    const/4 p3, 0x2

    .line 2
    new-array p3, p3, [I

    .line 3
    .line 4
    const/high16 v0, 0x42200000    # 40.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    sub-int/2addr p2, v0

    .line 11
    int-to-float p2, p2

    .line 12
    const v0, 0x3f533333    # 0.825f

    .line 13
    .line 14
    .line 15
    mul-float/2addr p2, v0

    .line 16
    invoke-static {}, Ll/ive0;->e()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    sget v0, Ll/qa00;->x:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/high16 v0, 0x41b80000    # 23.0f

    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    :goto_0
    int-to-float v0, v0

    .line 32
    add-float/2addr p2, v0

    .line 33
    float-to-int p2, p2

    .line 34
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    const/4 v1, 0x0

    .line 39
    aput p0, p3, v1

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    if-gt p2, v0, :cond_1

    .line 43
    .line 44
    invoke-static {p2}, Ll/dox;->b(I)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    aput p1, p3, p0

    .line 49
    .line 50
    return-object p3

    .line 51
    :cond_1
    aput p1, p3, p0

    .line 52
    .line 53
    return-object p3
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->q(Ll/jl80;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->t(Ll/jl80;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->m(I)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->n(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static setVisitorHasClick(Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->A:Ll/jxd0;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/j4g;->a(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/k4g;->b(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final m(I)I
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    if-eq p1, p0, :cond_0

    .line 5
    .line 6
    sget p0, Ll/cbc0;->e:I

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    sget p0, Ll/cbc0;->d:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_1
    sget p0, Ll/cbc0;->c:I

    .line 13
    .line 14
    return p0
.end method

.method public final n(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w:Landroid/text/SpannableStringBuilder;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w:Landroid/text/SpannableStringBuilder;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clearSpans()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w:Landroid/text/SpannableStringBuilder;

    .line 29
    .line 30
    invoke-virtual {v0, p2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    add-int/2addr p3, v0

    .line 42
    if-ltz v0, :cond_3

    .line 43
    .line 44
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-le p3, p2, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w:Landroid/text/SpannableStringBuilder;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->y:Landroid/text/style/RelativeSizeSpan;

    .line 54
    .line 55
    const/16 v2, 0x21

    .line 56
    .line 57
    invoke-virtual {p2, v1, v0, p3, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w:Landroid/text/SpannableStringBuilder;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->z:Landroid/text/style/StyleSpan;

    .line 63
    .line 64
    invoke-virtual {p2, v1, v0, p3, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w:Landroid/text/SpannableStringBuilder;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->x:Ll/jor;

    .line 70
    .line 71
    invoke-virtual {p2, v1, v0, p3, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 72
    .line 73
    .line 74
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w:Landroid/text/SpannableStringBuilder;

    .line 75
    .line 76
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic o(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->x()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 9

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->k(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->p:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    invoke-static {}, Ll/bnl0;->w0()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    const v2, 0x3e19999a    # 0.15f

    .line 15
    .line 16
    .line 17
    mul-float/2addr v1, v2

    .line 18
    float-to-int v1, v1

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->j:Lv/VDelegateLayout;

    .line 23
    .line 24
    new-instance v1, Ll/l3g;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/l3g;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lv/VDelegateLayout;->setOnMeasureDelegate(Lv/VDelegateLayout$a;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->v()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "zh"

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Landroid/app/Activity;

    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->t:Lv/VCheckBox;

    .line 62
    .line 63
    new-instance v3, Ll/m3g;

    .line 64
    .line 65
    invoke-direct {v3, p0}, Ll/m3g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->u:Lv/VText;

    .line 72
    .line 73
    new-instance v3, Ll/n3g;

    .line 74
    .line 75
    invoke-direct {v3, p0}, Ll/n3g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->u:Lv/VText;

    .line 82
    .line 83
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 84
    .line 85
    const-string v4, "\u300b"

    .line 86
    .line 87
    const-string v5, "\u300a"

    .line 88
    .line 89
    if-eqz v0, :cond_0

    .line 90
    .line 91
    sget v0, Lcom/p1/mobile/putong/common/R$string;->u2:I

    .line 92
    .line 93
    new-instance v6, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sget v7, Lcom/p1/mobile/putong/common/R$string;->a0:I

    .line 99
    .line 100
    invoke-virtual {p0, v7}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    const-string v7, " %s "

    .line 119
    .line 120
    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    new-instance v7, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v7, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    sget v8, Lcom/p1/mobile/putong/common/R$string;->w1:I

    .line 130
    .line 131
    invoke-virtual {p0, v8}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v8

    .line 135
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v7

    .line 145
    filled-new-array {v7}, [Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v7

    .line 149
    const-string v8, " %s"

    .line 150
    .line 151
    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v7

    .line 155
    filled-new-array {v6, v7}, [Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v6

    .line 159
    invoke-virtual {v1, v0, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    goto :goto_0

    .line 164
    :cond_0
    sget v0, Lcom/p1/mobile/putong/common/R$string;->u2:I

    .line 165
    .line 166
    new-instance v6, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    sget v7, Lcom/p1/mobile/putong/common/R$string;->a0:I

    .line 172
    .line 173
    invoke-virtual {p0, v7}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w(I)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v7

    .line 177
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    new-instance v7, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v7, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    sget v8, Lcom/p1/mobile/putong/common/R$string;->w1:I

    .line 193
    .line 194
    invoke-virtual {p0, v8}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v8

    .line 198
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v7

    .line 208
    filled-new-array {v6, v7}, [Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v6

    .line 212
    invoke-virtual {v1, v0, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    .line 217
    .line 218
    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    sget v7, Lcom/p1/mobile/putong/common/R$string;->a0:I

    .line 222
    .line 223
    invoke-virtual {p0, v7}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w(I)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v7

    .line 227
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v6

    .line 237
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v7

    .line 241
    new-instance v8, Ljava/lang/StringBuilder;

    .line 242
    .line 243
    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    sget v5, Lcom/p1/mobile/putong/common/R$string;->w1:I

    .line 247
    .line 248
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->w(I)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v5

    .line 252
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v5

    .line 266
    filled-new-array {v6, v7, v4, v5}, [Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    invoke-static {v1, v3, v0, v4}, Ll/q8g0;->A(Landroid/app/Activity;Landroid/graphics/Typeface;Ljava/lang/String;[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 275
    .line 276
    .line 277
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->u:Lv/VText;

    .line 278
    .line 279
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 284
    .line 285
    .line 286
    sget-object v0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->A:Ll/jxd0;

    .line 287
    .line 288
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    check-cast v0, Ljava/lang/Boolean;

    .line 293
    .line 294
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-eqz v0, :cond_2

    .line 299
    .line 300
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    check-cast v1, Landroid/app/Activity;

    .line 309
    .line 310
    invoke-static {}, Ll/zwk;->e()Z

    .line 311
    .line 312
    .line 313
    move-result v2

    .line 314
    if-eqz v2, :cond_1

    .line 315
    .line 316
    const-string v2, "http://m.staging2.p1staff.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/growth/visitor-mode/index.html?speed=true#/"

    .line 317
    .line 318
    goto :goto_1

    .line 319
    :cond_1
    const-string v2, "https://m.tantanapp.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/growth/visitor-mode/index.html?speed=true#/"

    .line 320
    .line 321
    :goto_1
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/ui/WebViewPreAct;->L0(Landroid/app/Activity;Ljava/lang/String;)Landroid/content/Intent;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 326
    .line 327
    .line 328
    goto :goto_2

    .line 329
    :cond_2
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    new-instance v1, Ll/o3g;

    .line 334
    .line 335
    invoke-direct {v1, p0}, Ll/o3g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;)V

    .line 336
    .line 337
    .line 338
    invoke-static {v0, v1}, Ll/kx80;->k(Landroid/app/Activity;Ll/y20;)V

    .line 339
    .line 340
    .line 341
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->p:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 342
    .line 343
    new-instance v1, Ll/p3g;

    .line 344
    .line 345
    invoke-direct {v1, p0}, Ll/p3g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;)V

    .line 346
    .line 347
    .line 348
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 349
    .line 350
    .line 351
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->m:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 352
    .line 353
    new-instance v1, Ll/q3g;

    .line 354
    .line 355
    invoke-direct {v1, p0}, Ll/q3g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;)V

    .line 356
    .line 357
    .line 358
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 362
    .line 363
    .line 364
    move-result-object v0

    .line 365
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    const-string v1, "https://auto.tancdn.com/v1/raw/ea993b91-602c-476d-8727-17ec9436139f14.svga"

    .line 370
    .line 371
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    const/4 v1, 0x1

    .line 376
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 381
    .line 382
    .line 383
    move-result-object v0

    .line 384
    iget-object v2, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 385
    .line 386
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 387
    .line 388
    .line 389
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    const-string v2, "https://auto.tancdn.com/v1/raw/3b3b6a62-29e1-489f-ac59-bf4a287378a714.svga"

    .line 398
    .line 399
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 400
    .line 401
    .line 402
    move-result-object v0

    .line 403
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 408
    .line 409
    .line 410
    move-result-object v0

    .line 411
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 412
    .line 413
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 414
    .line 415
    .line 416
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 417
    .line 418
    sget v0, Ll/qa00;->m:I

    .line 419
    .line 420
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 421
    .line 422
    .line 423
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->u:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/TextView;->getSelectionStart()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, -0x1

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->u:Lv/VText;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/widget/TextView;->getSelectionEnd()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-ne p1, v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->x()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic q(Ll/jl80;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->v:Ll/y20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->v:Ll/y20;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic r(Ll/jl80;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->v:Ll/y20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->v:Ll/y20;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/s3g;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/s3g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/kx80;->k(Landroid/app/Activity;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic t(Ll/jl80;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->v:Ll/y20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->v:Ll/y20;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/r3g;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/r3g;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/kx80;->k(Landroid/app/Activity;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final v()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashView$a;-><init>(Lcom/p1/mobile/putong/ui/splash/FakeSplashView;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->k:Lv/VPager;

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->l:Lv/VPagerWormIndicator;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->k:Lv/VPager;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lv/VPagerWormIndicator;->setViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public w(I)Ljava/lang/String;
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
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final x()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->B:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    sput-boolean v0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->B:Z

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/splash/FakeSplashView;->t:Lv/VCheckBox;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
