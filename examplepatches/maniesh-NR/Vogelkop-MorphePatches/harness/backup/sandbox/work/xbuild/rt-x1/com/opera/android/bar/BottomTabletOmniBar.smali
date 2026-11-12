.class public Lcom/opera/android/bar/BottomTabletOmniBar;
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
    .registers 3

    iget-object v0, p0, Lcom/opera/android/bar/BottomTabletOmniBar;->u:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_16

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f070080

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0

    :cond_16
    iget-object v0, p0, Lcom/opera/android/bar/BottomTabletOmniBar;->v:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eq v0, v1, :cond_2a

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f070081

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0

    :cond_2a
    const/4 p0, 0x0

    return p0
.end method

.method public final h()V
    .registers 2

    const v0, 0x7f0a0b2c

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/BottomTabletOmniBar;->u:Landroid/view/View;

    const v0, 0x7f0a0109

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/BottomTabletOmniBar;->v:Landroid/view/View;

    invoke-super {p0}, Lcom/opera/android/bar/BottomBar;->h()V

    return-void
.end method

.method public final i(Lno3;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/bar/BottomTabletOmniBar;->v:Landroid/view/View;

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

    iget-object v0, p0, Lcom/opera/android/bar/BottomTabletOmniBar;->u:Landroid/view/View;

    iget-boolean p1, p1, Lno3;->c:Z

    if-eqz p1, :cond_16

    move v2, v3

    :cond_16
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->k()V

    return-void
.end method

.method public final l(I)V
    .registers 2

    invoke-super {p0, p1}, Llp3;->l(I)V

    iget-object p1, p0, Lcom/opera/android/bar/BottomTabletOmniBar;->u:Landroid/view/View;

    if-eqz p1, :cond_10

    iget-object p0, p0, Llp3;->s:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationY(F)V

    :cond_10
    return-void
.end method

.method public final n()I
    .registers 1

    const p0, 0x7f0a0109

    return p0
.end method
