.class public final Lfsj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final l:[I


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

.field public c:Landroid/view/View;

.field public final d:I

.field public final e:I

.field public final f:I

.field public g:Latj;

.field public h:Lpde;

.field public final i:Lqzg;

.field public final j:Lj21;

.field public final k:Ldsj;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x2

    new-array v0, v0, [I

    sput-object v0, Lfsj;->l:[I

    return-void
.end method

.method public constructor <init>(Lasj;Landroid/view/View;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lfsj;->a:Landroid/view/View;

    iget-object p2, p1, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    iput-object p2, p0, Lfsj;->b:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    invoke-virtual {p1}, Lna3;->c()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lfsj;->c:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v2, 0x0

    if-nez v1, :cond_19

    move-object v0, v2

    :cond_19
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    goto :goto_22

    :cond_21
    move v0, v1

    :goto_22
    iput v0, p0, Lfsj;->d:I

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-nez v3, :cond_2d

    move-object v0, v2

    :cond_2d
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_34

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    goto :goto_35

    :cond_34
    move v0, v1

    :goto_35
    iput v0, p0, Lfsj;->e:I

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-nez v3, :cond_40

    move-object v0, v2

    :cond_40
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_47

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    goto :goto_48

    :cond_47
    move v0, v1

    :goto_48
    iput v0, p0, Lfsj;->f:I

    new-instance v0, Lqzg;

    const/16 v3, 0xb

    invoke-direct {v0, p0, v3}, Lqzg;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lfsj;->i:Lqzg;

    new-instance v0, Lj21;

    const/4 v3, 0x3

    invoke-direct {v0, p0, v3}, Lj21;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lfsj;->j:Lj21;

    new-instance v0, Ldsj;

    const/4 v3, 0x1

    invoke-direct {v0, p0, v3}, Ldsj;-><init>(Lfsj;B)V

    iput-object v0, p0, Lfsj;->k:Ldsj;

    invoke-virtual {p1, v2}, Lna3;->f(Landroid/view/View;)V

    new-instance p1, Ltxi;

    const/4 v0, 0x7

    invoke-direct {p1, p0, v0}, Ltxi;-><init>(Ljava/lang/Object;B)V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p2, p1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    new-instance p1, Ldsj;

    invoke-direct {p1, p0, v1}, Ldsj;-><init>(Lfsj;B)V

    invoke-virtual {p2, p1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public final a(Latj;)V
    .registers 7

    iget-object v0, p0, Lfsj;->g:Latj;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    iget-object v0, p0, Lfsj;->g:Latj;

    iget-object v1, p0, Lfsj;->k:Ldsj;

    iget-object v2, p0, Lfsj;->i:Lqzg;

    const/4 v3, 0x0

    if-eqz v0, :cond_1f

    iget-object v4, p0, Lfsj;->h:Lpde;

    if-eqz v4, :cond_18

    invoke-virtual {v4, v2}, Lekc;->p(Lf7f;)V

    :cond_18
    iput-object v3, p0, Lfsj;->h:Lpde;

    iget-object v0, v0, Latj;->a:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_1f
    iput-object p1, p0, Lfsj;->g:Latj;

    if-eqz p1, :cond_55

    const v0, 0x7f0a0a8f

    iget-object v4, p0, Lfsj;->a:Landroid/view/View;

    invoke-virtual {v4, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_31

    check-cast v0, Latj;

    goto :goto_45

    :cond_31
    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v4, v0, Landroid/view/View;

    if-eqz v4, :cond_3c

    check-cast v0, Landroid/view/View;

    goto :goto_3d

    :cond_3c
    move-object v0, v3

    :goto_3d
    if-eqz v0, :cond_44

    invoke-static {v0}, Lxug;->k(Landroid/view/View;)Latj;

    move-result-object v0

    goto :goto_45

    :cond_44
    move-object v0, v3

    :goto_45
    if-eqz v0, :cond_49

    iget-object v3, v0, Latj;->b:Lpde;

    :cond_49
    iput-object v3, p0, Lfsj;->h:Lpde;

    if-eqz v3, :cond_50

    invoke-virtual {v3, v2}, Lekc;->k(Lf7f;)V

    :cond_50
    iget-object p0, p1, Latj;->a:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_55
    return-void
.end method

.method public final b()V
    .registers 11

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    iget-object v0, p0, Lfsj;->a:Landroid/view/View;

    invoke-static {v0}, Li5n;->a(Landroid/view/View;)Lg3o;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_14

    const/16 v3, 0x8a

    iget-object v1, v1, Lg3o;->a:Ld3o;

    invoke-virtual {v1, v3}, Ld3o;->i(I)Lr9b;

    move-result-object v1

    goto :goto_15

    :cond_14
    move-object v1, v2

    :goto_15
    const/4 v3, 0x0

    if-eqz v1, :cond_1b

    iget v4, v1, Lr9b;->d:I

    goto :goto_1c

    :cond_1b
    move v4, v3

    :goto_1c
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v5

    sget-object v6, Lfsj;->l:[I

    invoke-virtual {v5, v6}, Landroid/view/View;->getLocationInWindow([I)V

    const/4 v7, 0x1

    aget v8, v6, v7

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v5, v8

    sub-int/2addr v5, v4

    iget-object v4, p0, Lfsj;->c:Landroid/view/View;

    if-eqz v4, :cond_47

    invoke-virtual {v4}, Landroid/view/View;->isLaidOut()Z

    move-result v8

    if-eqz v8, :cond_47

    invoke-static {v4}, Lxih;->o(Landroid/view/View;)Z

    move-result v8

    if-eqz v8, :cond_47

    invoke-virtual {v4, v6}, Landroid/view/View;->getLocationInWindow([I)V

    aget v4, v6, v7

    invoke-static {v5, v4}, Ljava/lang/Math;->min(II)I

    move-result v5

    :cond_47
    iget-object v4, p0, Lfsj;->h:Lpde;

    if-eqz v4, :cond_7b

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    if-eqz v4, :cond_7b

    check-cast v4, Ljava/lang/Iterable;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_59
    :goto_59
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->isLaidOut()Z

    move-result v9

    if-eqz v9, :cond_59

    invoke-static {v8}, Lxih;->o(Landroid/view/View;)Z

    move-result v9

    if-eqz v9, :cond_59

    invoke-virtual {v8, v6}, Landroid/view/View;->getLocationInWindow([I)V

    aget v8, v6, v7

    invoke-static {v5, v8}, Ljava/lang/Math;->min(II)I

    move-result v5

    goto :goto_59

    :cond_7b
    iget-object v4, p0, Lfsj;->b:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    instance-of v9, v8, Landroid/view/View;

    if-eqz v9, :cond_88

    check-cast v8, Landroid/view/View;

    goto :goto_89

    :cond_88
    move-object v8, v2

    :goto_89
    if-eqz v8, :cond_fd

    invoke-virtual {v8, v6}, Landroid/view/View;->getLocationInWindow([I)V

    aget v7, v6, v7

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v9

    add-int/2addr v9, v7

    sub-int/2addr v9, v5

    invoke-virtual {v8}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v9, v5

    if-gez v9, :cond_9e

    move v9, v3

    :cond_9e
    iget v5, p0, Lfsj;->f:I

    add-int/2addr v9, v5

    if-eqz v1, :cond_a6

    iget v5, v1, Lr9b;->a:I

    goto :goto_a7

    :cond_a6
    move v5, v3

    :goto_a7
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-eqz v1, :cond_b4

    iget v1, v1, Lr9b;->c:I

    goto :goto_b5

    :cond_b4
    move v1, v3

    :goto_b5
    sub-int/2addr v0, v1

    invoke-virtual {v8, v6}, Landroid/view/View;->getLocationInWindow([I)V

    aget v1, v6, v3

    invoke-static {v5, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v8, v6}, Landroid/view/View;->getLocationInWindow([I)V

    aget v5, v6, v3

    sub-int/2addr v1, v5

    iget v5, p0, Lfsj;->d:I

    add-int/2addr v1, v5

    invoke-virtual {v8, v6}, Landroid/view/View;->getLocationInWindow([I)V

    aget v5, v6, v3

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v7

    add-int/2addr v7, v5

    invoke-virtual {v8, v6}, Landroid/view/View;->getLocationInWindow([I)V

    aget v3, v6, v3

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v5

    add-int/2addr v5, v3

    invoke-static {v0, v5}, Ljava/lang/Math;->min(II)I

    move-result v0

    sub-int/2addr v7, v0

    iget p0, p0, Lfsj;->e:I

    add-int/2addr v7, p0

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    instance-of v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_ef

    move-object v2, p0

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    :cond_ef
    if-eqz v2, :cond_fd

    iget p0, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-ne v1, p0, :cond_fe

    iget p0, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-ne v7, p0, :cond_fe

    iget p0, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-ne v9, p0, :cond_fe

    :cond_fd
    return-void

    :cond_fe
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v7, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v9, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v4, v2}, Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p0, Lesj;

    invoke-direct {p0, v4}, Lesj;-><init>(Landroid/view/View;)V

    return-void
.end method
