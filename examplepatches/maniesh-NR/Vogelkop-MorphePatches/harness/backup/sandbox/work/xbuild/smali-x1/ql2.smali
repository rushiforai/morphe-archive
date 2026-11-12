.class public final Lql2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# static fields
.field public static final i:J

.field public static final j:Landroid/view/animation/DecelerateInterpolator;


# instance fields
.field public final a:Lcom/opera/android/widget/UrlFieldEditText;

.field public final b:Lpl2;

.field public c:Z

.field public final d:Lml2;

.field public e:Landroid/animation/ValueAnimator;

.field public f:I

.field public g:Z

.field public final h:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x78

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lql2;->i:J

    sget-object v0, Llf1;->c:Landroid/view/animation/DecelerateInterpolator;

    sput-object v0, Lql2;->j:Landroid/view/animation/DecelerateInterpolator;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/widget/UrlFieldEditText;Lpl2;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lql2;->a:Lcom/opera/android/widget/UrlFieldEditText;

    iput-object p2, p0, Lql2;->b:Lpl2;

    new-instance p2, Lml2;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lml2;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lql2;->d:Lml2;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lql2;->g:Z

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-eqz v1, :cond_1b

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_1c

    :cond_1b
    move v1, v0

    :goto_1c
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    if-eqz v2, :cond_25

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    goto :goto_26

    :cond_25
    move v2, v0

    :goto_26
    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {p1, v2, v1}, Landroid/view/View;->measure(II)V

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v2

    if-eqz v2, :cond_41

    invoke-virtual {v2}, Landroid/text/Layout;->getHeight()I

    move-result v0

    :cond_41
    sub-int/2addr v1, v0

    iput v1, p0, Lql2;->h:I

    invoke-virtual {p0}, Lql2;->a()V

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    new-instance v0, Lz22;

    invoke-direct {v0, p0, p2}, Lz22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    new-instance v0, Lz61;

    invoke-direct {v0, p0, p2}, Lz61;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-boolean v0, p0, Lql2;->c:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lql2;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v1

    if-eqz v1, :cond_11

    invoke-virtual {p0}, Lql2;->b()V

    return-void

    :cond_11
    const/4 v1, 0x1

    iput-boolean v1, p0, Lql2;->c:Z

    new-instance v1, Lll2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lll2;-><init>(Ljava/lang/Object;B)V

    iget-object v2, p0, Lql2;->d:Lml2;

    invoke-static {v0, p0, v1, v2}, Lp37;->C(Landroid/view/View;Ljava/lang/Object;Ldh4;Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    return-void
.end method

.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    invoke-virtual {p0}, Lql2;->a()V

    return-void
.end method

.method public final b()V
    .registers 8

    iget-object v0, p0, Lql2;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v1

    if-eqz v1, :cond_9f

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_14

    invoke-virtual {v1}, Landroid/text/Layout;->getHeight()I

    move-result v1

    goto :goto_15

    :cond_14
    move v1, v2

    :goto_15
    iget v3, p0, Lql2;->h:I

    add-int/2addr v1, v3

    iget-object v3, p0, Lql2;->b:Lpl2;

    iget v4, v3, Lpl2;->a:I

    iget v3, v3, Lpl2;->b:I

    invoke-static {v1, v4, v3}, Ldjh;->c(III)I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_89

    iget-boolean v3, p0, Lql2;->g:Z

    if-nez v3, :cond_89

    iget-object v3, p0, Lql2;->e:Landroid/animation/ValueAnimator;

    const/4 v4, 0x1

    if-eqz v3, :cond_3b

    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v3

    if-ne v3, v4, :cond_3b

    iget v3, p0, Lql2;->f:I

    if-eq v1, v3, :cond_9f

    :cond_3b
    iget-object v3, p0, Lql2;->e:Landroid/animation/ValueAnimator;

    if-eqz v3, :cond_42

    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_42
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    if-eqz v3, :cond_4b

    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_4c

    :cond_4b
    move v3, v2

    :goto_4c
    if-eq v1, v3, :cond_9f

    invoke-virtual {v0, v4}, Lcom/opera/android/widget/UrlFieldEditText;->y(Z)V

    iput v1, p0, Lql2;->f:I

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_5c

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_5d

    :cond_5c
    move v0, v2

    :goto_5d
    filled-new-array {v0, v1}, [I

    move-result-object v0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    sget-wide v5, Lql2;->i:J

    invoke-static {v5, v6}, Lpn7;->f(J)J

    move-result-wide v5

    invoke-virtual {v0, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    sget-object v1, Lql2;->j:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v1, Lnl2;

    invoke-direct {v1, p0, v2}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v1, Ldf1;

    invoke-direct {v1, p0, v4}, Ldf1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    iput-object v0, p0, Lql2;->e:Landroid/animation/ValueAnimator;

    return-void

    :cond_89
    iget-object p0, p0, Lql2;->e:Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_90

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_90
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    if-eqz p0, :cond_9f

    iget v2, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v2, v1, :cond_9f

    iput v1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_9f
    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method
