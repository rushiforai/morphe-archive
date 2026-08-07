.class public Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:I

.field public e:Ljava/lang/Runnable;

.field public f:F

.field public g:I

.field public h:J

.field public i:J

.field public j:I

.field public k:Z

.field public l:Landroid/animation/Animator;

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 29
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->d:I

    .line 6
    .line 7
    const-wide/16 v0, 0xbb8

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->h:J

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->i:J

    .line 12
    .line 13
    const/high16 v0, 0x41a00000    # 20.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->j:I

    .line 20
    .line 21
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->k:Z

    .line 22
    .line 23
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->m:Z

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->f(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->j()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->i()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->n()V

    return-void
.end method


# virtual methods
.method public final e()Landroid/widget/TextView;
    .locals 4

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v2, -0x2

    .line 13
    const/4 v3, -0x1

    .line 14
    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 15
    .line 16
    .line 17
    const/16 v2, 0x11

    .line 18
    .line 19
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    .line 23
    .line 24
    const v1, 0x800013

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 28
    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->g:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->f:F

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 39
    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Ll/czs;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/czs;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    return-object v0
.end method

.method public final f(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 7
    .line 8
    new-instance v0, Ll/azs;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/azs;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->e:Ljava/lang/Runnable;

    .line 14
    .line 15
    sget-object v0, Ll/vhc0;->a:[I

    .line 16
    .line 17
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget p2, Ll/vhc0;->d:I

    .line 22
    .line 23
    const/16 v0, 0xd

    .line 24
    .line 25
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    int-to-float p2, p2

    .line 34
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->f:F

    .line 35
    .line 36
    sget p2, Ll/vhc0;->c:I

    .line 37
    .line 38
    const/4 v0, -0x1

    .line 39
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->g:I

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->g()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->e()Landroid/widget/TextView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->e()Landroid/widget/TextView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 15
    .line 16
    const/16 v1, 0x8

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic i()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 4
    .line 5
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 19
    .line 20
    const/16 v1, 0x8

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->k:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->e:Ljava/lang/Runnable;

    .line 30
    .line 31
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->i:J

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final synthetic j()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    const/high16 v5, 0x40000000    # 2.0f

    .line 18
    .line 19
    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-virtual {v5, v3, v4}, Landroid/view/View;->measure(II)V

    .line 26
    .line 27
    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 29
    .line 30
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 35
    .line 36
    new-array v5, v1, [Landroid/view/View;

    .line 37
    .line 38
    aput-object v4, v5, v2

    .line 39
    .line 40
    invoke-static {v3, v5}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->m:Z

    .line 50
    .line 51
    if-eqz v3, :cond_0

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    sub-int/2addr v0, v3

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    sub-int/2addr v0, v3

    .line 63
    if-gt v2, v0, :cond_0

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 72
    .line 73
    const/16 v1, 0x11

    .line 74
    .line 75
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_0
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->k:Z

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->k()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public final k()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->l:Landroid/animation/Animator;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->d:I

    .line 29
    .line 30
    add-int/lit8 v2, v1, 0x1

    .line 31
    .line 32
    rem-int/2addr v2, v0

    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ljava/lang/String;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ljava/lang/String;

    .line 48
    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    const/high16 v4, 0x40000000    # 2.0f

    .line 64
    .line 65
    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 70
    .line 71
    invoke-virtual {v5, v2, v3}, Landroid/view/View;->measure(II)V

    .line 72
    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 75
    .line 76
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 81
    .line 82
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 89
    .line 90
    const v3, 0x800013

    .line 91
    .line 92
    .line 93
    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 94
    .line 95
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 96
    .line 97
    invoke-virtual {v5, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    .line 99
    .line 100
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 101
    .line 102
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->j:I

    .line 107
    .line 108
    add-int/2addr v2, v5

    .line 109
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 110
    .line 111
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    invoke-static {v5, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 123
    .line 124
    .line 125
    move-result v4

    .line 126
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 127
    .line 128
    invoke-virtual {v5, v1, v4}, Landroid/view/View;->measure(II)V

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 132
    .line 133
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 138
    .line 139
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 140
    .line 141
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 146
    .line 147
    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 148
    .line 149
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 150
    .line 151
    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 155
    .line 156
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 157
    .line 158
    .line 159
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 160
    .line 161
    const/4 v3, 0x0

    .line 162
    invoke-virtual {v1, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 166
    .line 167
    int-to-float v4, v2

    .line 168
    invoke-virtual {v1, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 169
    .line 170
    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 172
    .line 173
    neg-int v2, v2

    .line 174
    int-to-float v2, v2

    .line 175
    const/4 v5, 0x2

    .line 176
    new-array v6, v5, [F

    .line 177
    .line 178
    aput v3, v6, v0

    .line 179
    .line 180
    const/4 v7, 0x1

    .line 181
    aput v2, v6, v7

    .line 182
    .line 183
    const-string v2, "translationX"

    .line 184
    .line 185
    invoke-static {v1, v2, v6}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 190
    .line 191
    new-array v8, v5, [F

    .line 192
    .line 193
    aput v4, v8, v0

    .line 194
    .line 195
    aput v3, v8, v7

    .line 196
    .line 197
    invoke-static {v6, v2, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    new-array v3, v5, [Landroid/animation/Animator;

    .line 202
    .line 203
    aput-object v1, v3, v0

    .line 204
    .line 205
    aput-object v2, v3, v7

    .line 206
    .line 207
    invoke-static {v3}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->h:J

    .line 212
    .line 213
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 214
    .line 215
    .line 216
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 217
    .line 218
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 222
    .line 223
    .line 224
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->l:Landroid/animation/Animator;

    .line 225
    .line 226
    new-instance v1, Ll/dzs;

    .line 227
    .line 228
    invoke-direct {v1, p0}, Ll/dzs;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;)V

    .line 229
    .line 230
    .line 231
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 235
    .line 236
    .line 237
    :cond_3
    :goto_0
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    const/16 v1, 0x11

    .line 10
    .line 11
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->e:Ljava/lang/Runnable;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->l:Landroid/animation/Animator;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->l:Landroid/animation/Animator;

    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    const/4 v2, 0x0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 55
    .line 56
    const/16 v1, 0x8

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    :cond_2
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->d:I

    .line 62
    .line 63
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->k:Z

    .line 64
    .line 65
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->k:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->l()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/bzs;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/bzs;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    const/4 v0, 0x1

    .line 49
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->k:Z

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->k()V

    .line 52
    .line 53
    .line 54
    :cond_2
    :goto_0
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->d:I

    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    rem-int/2addr v1, v0

    .line 15
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->d:I

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->k()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setGap(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->j:I

    .line 2
    .line 3
    return-void
.end method

.method public setOnItemClickListener(Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView$a;)V
    .locals 0

    return-void
.end method

.method public setScrollDuration(J)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-wide/16 v0, 0x64

    .line 7
    .line 8
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->h:J

    .line 13
    .line 14
    return-void
.end method

.method public setSingleText(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->l()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->d:I

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->m:Z

    .line 35
    .line 36
    return-void
.end method

.method public setStillTime(J)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->i:J

    .line 13
    .line 14
    return-void
.end method

.method public setTextColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->g:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public setTextList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->l()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->d:I

    .line 18
    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->m:Z

    .line 20
    .line 21
    return-void
.end method

.method public setTextSize(F)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->f:F

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->a:Landroid/widget/TextView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, v1, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveHorizontalAutoScrollView;->b:Landroid/widget/TextView;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0, v1, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method
