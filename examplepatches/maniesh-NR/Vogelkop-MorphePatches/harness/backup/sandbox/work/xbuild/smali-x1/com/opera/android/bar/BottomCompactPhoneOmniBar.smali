.class public Lcom/opera/android/bar/BottomCompactPhoneOmniBar;
.super Llp3;
.source "SourceFile"


# instance fields
.field public u:Landroid/view/View;

.field public v:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lcom/opera/android/bar/BottomBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final c()I
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bar/BottomCompactPhoneOmniBar;->v:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_16

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f07009c

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_17

    :cond_16
    const/4 v0, 0x0

    :goto_17
    iget-object v2, p0, Lcom/opera/android/bar/BottomCompactPhoneOmniBar;->u:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eq v2, v1, :cond_2c

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v1, 0x7f0700a0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0

    :cond_2c
    return v0
.end method

.method public final e(Lnje;)Landroid/view/View;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_23

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1b

    const/4 v1, 0x2

    if-ne p1, v1, :cond_15

    const p1, 0x7f0a018c

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    goto :goto_2a

    :cond_15
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0, v0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_1b
    const p1, 0x7f0a018a

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    goto :goto_2a

    :cond_23
    const p1, 0x7f0a0187

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    :goto_2a
    if-eqz p0, :cond_33

    invoke-static {p0}, Lq9n;->x(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_33

    return-object p0

    :cond_33
    return-object v0
.end method

.method public final g()V
    .registers 1

    invoke-super {p0}, Llp3;->g()V

    iget-object p0, p0, Lcom/opera/android/bar/BottomCompactPhoneOmniBar;->u:Landroid/view/View;

    invoke-static {p0}, Latj;->a(Landroid/view/View;)V

    return-void
.end method

.method public final i(Lno3;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/bar/BottomCompactPhoneOmniBar;->v:Landroid/view/View;

    iget-boolean v1, p1, Lno3;->a:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_b

    move v1, v3

    goto :goto_c

    :cond_b
    move v1, v2

    :goto_c
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/bar/BottomCompactPhoneOmniBar;->u:Landroid/view/View;

    iget-boolean p1, p1, Lno3;->b:Z

    if-eqz p1, :cond_16

    move v2, v3

    :cond_16
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->k()V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 2

    invoke-super {p0}, Llp3;->onFinishInflate()V

    const v0, 0x7f0a073e

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/BottomCompactPhoneOmniBar;->u:Landroid/view/View;

    const v0, 0x7f0a0109

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/BottomCompactPhoneOmniBar;->v:Landroid/view/View;

    return-void
.end method
