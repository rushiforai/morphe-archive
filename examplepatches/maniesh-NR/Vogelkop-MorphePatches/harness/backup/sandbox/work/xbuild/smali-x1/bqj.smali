.class public final Lbqj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:J

.field public static final h:J

.field public static final i:Lixh;


# instance fields
.field public final a:Lrf2;

.field public final b:Landroid/view/View;

.field public final c:Lpde;

.field public final d:Landroid/util/Size;

.field public e:Landroid/animation/ValueAnimator;

.field public f:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->d:Lun7;

    const/16 v1, 0x96

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    sput-wide v2, Lbqj;->g:J

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lbqj;->h:J

    new-instance v0, Lixh;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lbqj;->i:Lixh;

    return-void
.end method

.method public constructor <init>(Lrf2;Landroid/view/View;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbqj;->a:Lrf2;

    iput-object p2, p0, Lbqj;->b:Landroid/view/View;

    new-instance p2, Lpde;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lbqj;->c:Lpde;

    iget-object p2, p1, Lrf2;->e:Landroid/view/View;

    check-cast p2, Landroid/widget/FrameLayout;

    const/4 v0, 0x0

    invoke-virtual {p2, v0, v0}, Landroid/view/View;->measure(II)V

    new-instance v1, Landroid/util/Size;

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    iput-object v1, p0, Lbqj;->d:Landroid/util/Size;

    iget-object p1, p1, Lrf2;->d:Landroid/view/View;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-static {v1, p1}, Lp37;->t0(ILandroid/view/View;)V

    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Landroid/view/View;->setClipToOutline(Z)V

    invoke-static {v0, p2}, Lp37;->t0(ILandroid/view/View;)V

    invoke-virtual {p0}, Lbqj;->b()V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-object p0, p0, Lbqj;->c:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final b()V
    .registers 7

    iget-object v0, p0, Lbqj;->a:Lrf2;

    iget-object v1, v0, Lrf2;->e:Landroid/view/View;

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget-object v3, p0, Lbqj;->b:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v4

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v5, v4

    iget-boolean v4, p0, Lbqj;->f:Z

    if-nez v4, :cond_1e

    iget v4, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    sub-int/2addr v5, v4

    :cond_1e
    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    instance-of v4, v2, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v4, :cond_2d

    move-object v4, v2

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    iput v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v3, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    :cond_2d
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-boolean v1, p0, Lbqj;->f:Z

    iget-object v0, v0, Lrf2;->d:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_47

    iget-object p0, p0, Lbqj;->d:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result p0

    iget v1, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    sub-int/2addr p0, v1

    int-to-float p0, p0

    neg-float p0, p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setTranslationX(F)V

    return-void

    :cond_47
    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/view/View;->setTranslationX(F)V

    return-void
.end method
