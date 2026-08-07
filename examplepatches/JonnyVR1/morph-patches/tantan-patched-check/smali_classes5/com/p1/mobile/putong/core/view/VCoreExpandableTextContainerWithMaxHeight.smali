.class public Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$c;
    }
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Z

.field public e:I

.field public f:J

.field public g:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public h:Z

.field public i:I

.field public j:Ljava/lang/CharSequence;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/CharSequence;

.field public n:Ljava/lang/CharSequence;

.field public o:Ll/a5l;

.field public p:I

.field public q:Z

.field public r:Landroid/text/method/MovementMethod;

.field public s:Ljava/lang/CharSequence;

.field public t:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->e:I

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->f:J

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->i:I

    .line 13
    .line 14
    const-string v0, ""

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->m:Ljava/lang/CharSequence;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->n:Ljava/lang/CharSequence;

    .line 19
    .line 20
    const-string v0, "#80ffffff"

    .line 21
    .line 22
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->t:I

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->v(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    .line 31
    .line 32
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

    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x3

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->e:I

    const-wide/16 v0, 0x0

    .line 35
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->f:J

    const/4 v0, 0x0

    .line 36
    iput v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->i:I

    .line 37
    const-string v0, ""

    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->m:Ljava/lang/CharSequence;

    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->n:Ljava/lang/CharSequence;

    .line 39
    const-string v0, "#80ffffff"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->t:I

    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->v(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 41
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x3

    .line 42
    iput p3, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->e:I

    const-wide/16 v0, 0x0

    .line 43
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->f:J

    const/4 p3, 0x0

    .line 44
    iput p3, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->i:I

    .line 45
    const-string p3, ""

    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->m:Ljava/lang/CharSequence;

    .line 46
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->n:Ljava/lang/CharSequence;

    .line 47
    const-string p3, "#80ffffff"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->t:I

    .line 48
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->v(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->C(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->A()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->d:Z

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->t:I

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->q:Z

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->p:I

    return p0
.end method

.method private getAnimMoveValue()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/kxk0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/kxk0;-><init>(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)Ll/pf60;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->g:Ll/pf60;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->d:Z

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->h:Z

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;Ll/pf60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->g:Ll/pf60;

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->r(Z)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->D(Z)V

    return-void
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;FZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->E(FZ)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->F(II)V

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->G()V

    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->d:Z

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->r(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/high16 v2, -0x80000000

    .line 19
    .line 20
    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {v3, v1, v2}, Landroid/view/View;->measure(II)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->d:Z

    .line 41
    .line 42
    xor-int/lit8 v2, v2, 0x1

    .line 43
    .line 44
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->r(Z)V

    .line 45
    .line 46
    .line 47
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->d:Z

    .line 48
    .line 49
    if-nez v2, :cond_0

    .line 50
    .line 51
    new-instance v2, Ll/pf60;

    .line 52
    .line 53
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/lit8 v0, v0, 0x5

    .line 66
    .line 67
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-direct {v2, v3, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iput-object v2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->g:Ll/pf60;

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    new-instance v2, Ll/pf60;

    .line 78
    .line 79
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-direct {v2, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    iput-object v2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->g:Ll/pf60;

    .line 91
    .line 92
    :goto_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->d:Z

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->D(Z)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->m:Ljava/lang/CharSequence;

    .line 98
    .line 99
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_1

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->x()V

    .line 106
    .line 107
    .line 108
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->G()V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final synthetic C(Landroid/animation/ValueAnimator;)V
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
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->E(FZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final D(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->c:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->l:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->c:Lv/VText;

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->k:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->c:Lv/VText;

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final E(FZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    float-to-int v1, p1

    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->r:Landroid/text/method/MovementMethod;

    .line 11
    .line 12
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->r:Landroid/text/method/MovementMethod;

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget v2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->p:I

    .line 26
    .line 27
    if-lez v2, :cond_2

    .line 28
    .line 29
    int-to-float v3, v2

    .line 30
    cmpl-float v3, p1, v3

    .line 31
    .line 32
    if-gtz v3, :cond_1

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    cmpg-float p1, p1, v3

    .line 36
    .line 37
    if-gez p1, :cond_2

    .line 38
    .line 39
    :cond_1
    if-eqz p2, :cond_2

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->q:Z

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 45
    .line 46
    invoke-static {}, Landroid/text/method/ScrollingMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 51
    .line 52
    .line 53
    move v1, v2

    .line 54
    goto :goto_0

    .line 55
    :cond_2
    const/4 p1, 0x0

    .line 56
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->q:Z

    .line 57
    .line 58
    :goto_0
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final F(II)V
    .locals 4

    .line 1
    int-to-float v0, p1

    .line 2
    int-to-float v1, p2

    .line 3
    const/4 v2, 0x2

    .line 4
    new-array v2, v2, [F

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    aput v0, v2, v3

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aput v1, v2, v0

    .line 11
    .line 12
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/lxk0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/lxk0;-><init>(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$b;

    .line 25
    .line 26
    invoke-direct {v1, p0, p2, p1}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$b;-><init>(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 30
    .line 31
    .line 32
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->f:J

    .line 33
    .line 34
    invoke-virtual {v0, p0, p1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final G()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->d:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->o:Ll/a5l;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->n:Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-virtual {v1, v0, p0}, Ll/a5l;->a(Lv/VText;Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->m:Ljava/lang/CharSequence;

    .line 18
    .line 19
    invoke-virtual {v1, v0, p0}, Ll/a5l;->a(Lv/VText;Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public getTextView()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->g:Ll/pf60;

    .line 10
    .line 11
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->g:Ll/pf60;

    .line 20
    .line 21
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->F(II)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->y()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iget p2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->i:I

    .line 11
    .line 12
    if-eq p2, p1, :cond_0

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->i:I

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final r(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->e:I

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const p0, 0x7fffffff

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public s()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-le v0, v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v0, v0, Lv/VText;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    instance-of p0, p0, Lv/VText;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    return v2

    .line 26
    :cond_0
    return v1
.end method

.method public final t(Ljava/lang/CharSequence;)Landroid/text/Layout;
    .locals 10

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->i:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sub-int/2addr v0, v1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sub-int v5, v0, v1

    .line 13
    .line 14
    new-instance v2, Landroid/text/StaticLayout;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    sget-object v6, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineSpacingMultiplier()F

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/widget/TextView;->getLineSpacingExtra()F

    .line 33
    .line 34
    .line 35
    move-result v8

    .line 36
    const/4 v9, 0x0

    .line 37
    move-object v3, p1

    .line 38
    invoke-direct/range {v2 .. v9}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 39
    .line 40
    .line 41
    return-object v2
.end method

.method public final u(Ljava/lang/String;Landroid/text/TextPaint;F)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "..."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->k:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "\r|\n"

    .line 18
    .line 19
    const-string v2, ""

    .line 20
    .line 21
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/4 v2, 0x0

    .line 37
    :goto_0
    if-lez v1, :cond_3

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    cmpg-float v3, v3, p3

    .line 53
    .line 54
    if-gtz v3, :cond_1

    .line 55
    .line 56
    return-object v2

    .line 57
    :cond_1
    add-int/lit8 v3, v1, -0x1

    .line 58
    .line 59
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->z(Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_2

    .line 68
    .line 69
    add-int/lit8 v1, v1, -0x1

    .line 70
    .line 71
    const/4 v3, 0x1

    .line 72
    if-ne v1, v3, :cond_2

    .line 73
    .line 74
    move-object v2, v0

    .line 75
    :cond_2
    add-int/lit8 v1, v1, -0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    return-object v2
.end method

.method public final v(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->a:Landroid/content/Context;

    .line 2
    .line 3
    new-instance p1, Ll/pf60;

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {p1, v1, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->g:Ll/pf60;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 17
    .line 18
    .line 19
    const/16 p1, 0x8

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget-object v1, Ll/khc0;->Q1:[I

    .line 35
    .line 36
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget p2, Ll/khc0;->V1:I

    .line 41
    .line 42
    const/4 v1, 0x3

    .line 43
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    iput p2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->e:I

    .line 48
    .line 49
    sget p2, Ll/khc0;->R1:I

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    int-to-long v1, p2

    .line 57
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->f:J

    .line 58
    .line 59
    sget p2, Ll/khc0;->T1:I

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    iput-object p2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->k:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_0

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    sget v1, Lcom/p1/mobile/putong/core/R$string;->l:I

    .line 82
    .line 83
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    iput-object p2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->k:Ljava/lang/String;

    .line 88
    .line 89
    :cond_0
    sget p2, Ll/khc0;->S1:I

    .line 90
    .line 91
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    iput-object p2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->l:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    if-eqz p2, :cond_1

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    sget v1, Lcom/p1/mobile/putong/core/R$string;->g:I

    .line 112
    .line 113
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p2

    .line 117
    iput-object p2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->l:Ljava/lang/String;

    .line 118
    .line 119
    :cond_1
    sget p2, Ll/khc0;->U1:I

    .line 120
    .line 121
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 122
    .line 123
    .line 124
    move-result p2

    .line 125
    iput p2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->p:I

    .line 126
    .line 127
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 128
    .line 129
    .line 130
    :cond_2
    return-void
.end method

.method public final w(ILandroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->k:Ljava/lang/String;

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    invoke-virtual {p0, p4, p2, p1}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->u(Ljava/lang/String;Landroid/text/TextPaint;F)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance p2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    add-int/lit8 p2, p2, -0x3

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    sub-int/2addr p2, p3

    .line 34
    const/4 p3, 0x0

    .line 35
    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    add-int/lit8 p3, p3, 0x3

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result p4

    .line 53
    add-int/2addr p3, p4

    .line 54
    new-instance p4, Landroid/text/SpannableStringBuilder;

    .line 55
    .line 56
    invoke-direct {p4}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p4, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 60
    .line 61
    .line 62
    const-string p1, "..."

    .line 63
    .line 64
    invoke-virtual {p4, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p4, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 68
    .line 69
    .line 70
    new-instance p1, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$a;

    .line 71
    .line 72
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight$a;-><init>(Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;)V

    .line 73
    .line 74
    .line 75
    sub-int p2, p3, p2

    .line 76
    .line 77
    const/16 v0, 0x11

    .line 78
    .line 79
    invoke-virtual {p4, p1, p2, p3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 80
    .line 81
    .line 82
    iput-object p4, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->s:Ljava/lang/CharSequence;

    .line 83
    .line 84
    return-object p4
.end method

.method public final x()V
    .locals 8

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->i:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->j:Ljava/lang/CharSequence;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->t(Ljava/lang/CharSequence;)Landroid/text/Layout;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->j:Ljava/lang/CharSequence;

    .line 17
    .line 18
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget v3, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->e:I

    .line 23
    .line 24
    if-gt v1, v3, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->j:Ljava/lang/CharSequence;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->m:Ljava/lang/CharSequence;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->n:Ljava/lang/CharSequence;

    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->c:Lv/VText;

    .line 34
    .line 35
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->d:Z

    .line 36
    .line 37
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    const/4 v3, 0x0

    .line 42
    const-string v4, ""

    .line 43
    .line 44
    move-object v5, v4

    .line 45
    move-object v4, v3

    .line 46
    move v3, v1

    .line 47
    :goto_0
    iget v6, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->e:I

    .line 48
    .line 49
    if-ge v1, v6, :cond_3

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineEnd(I)I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    invoke-virtual {v2, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iget v7, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->e:I

    .line 60
    .line 61
    add-int/lit8 v7, v7, -0x1

    .line 62
    .line 63
    if-ne v1, v7, :cond_2

    .line 64
    .line 65
    move-object v4, v3

    .line 66
    goto :goto_1

    .line 67
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    move-object v5, v3

    .line 83
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 84
    .line 85
    move v3, v6

    .line 86
    goto :goto_0

    .line 87
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->j:Ljava/lang/CharSequence;

    .line 88
    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->n:Ljava/lang/CharSequence;

    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 98
    .line 99
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {p0, v0, v1, v5, v4}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->w(ILandroid/text/TextPaint;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->m:Ljava/lang/CharSequence;

    .line 108
    .line 109
    return-void
.end method

.method public final y()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lv/VText;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->b:Lv/VText;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VText;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/VCoreExpandableTextContainerWithMaxHeight;->c:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const-string p0, "ExpandableTextContainerWithMaxHeight\u6587\u672c\u4f38\u7f29\u63a7\u4ef6\u7684\u5b50view\u4e0d\u5408\u6cd5\u3002\u9700\u8981\u5b50View\u6570\u91cf\u5927\u4e8e\u4e24\u4e2a\uff0c\u5e76\u4e14\u90fd\u662fTextView\u3002"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final z(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    move p1, v0

    .line 14
    :goto_0
    array-length v1, p0

    .line 15
    if-ge p1, v1, :cond_2

    .line 16
    .line 17
    aget-char v1, p0, p1

    .line 18
    .line 19
    invoke-static {v1}, Ll/a9g0;->i(C)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    return v0
.end method
