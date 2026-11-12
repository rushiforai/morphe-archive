.class public Lcom/opera/android/bar/BottomNavigationBar;
.super Llp3;
.source "SourceFile"


# instance fields
.field public u:Lcom/opera/android/custom_views/DropShadowFrameLayout;

.field public v:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/opera/android/bar/BottomBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final b(Z)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/bar/BottomNavigationBar;->u:Lcom/opera/android/custom_views/DropShadowFrameLayout;

    if-nez p1, :cond_6

    const/4 p0, 0x0

    goto :goto_10

    :cond_6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lmaj;->b:Lmaj;

    invoke-static {p0, p1}, Lu0h;->g(Landroid/content/Context;Lmaj;)Llaj;

    move-result-object p0

    :goto_10
    invoke-virtual {v0, p0}, Lcom/opera/android/custom_views/DropShadowFrameLayout;->b(Llaj;)V

    return-void
.end method

.method public final c()I
    .registers 3

    iget-object v0, p0, Lcom/opera/android/bar/BottomNavigationBar;->v:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_16

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f0700a0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method public final e(Lnje;)Landroid/view/View;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_23

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1b

    const/4 v0, 0x2

    if-ne p1, v0, :cond_14

    const p1, 0x7f0a018c

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_14
    new-instance p0, Ljava/lang/RuntimeException;

    const/4 p1, 0x0

    invoke-direct {p0, p1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_1b
    const p1, 0x7f0a018a

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_23
    const p1, 0x7f0a0187

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public final i(Lno3;)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/bar/BottomNavigationBar;->v:Landroid/view/View;

    iget-boolean p1, p1, Lno3;->b:Z

    if-eqz p1, :cond_8

    const/4 p1, 0x0

    goto :goto_a

    :cond_8
    const/16 p1, 0x8

    :goto_a
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->k()V

    return-void
.end method

.method public final n()I
    .registers 1

    const p0, 0x7f0a073e

    return p0
.end method

.method public final onFinishInflate()V
    .registers 2

    invoke-super {p0}, Llp3;->onFinishInflate()V

    const v0, 0x7f0a0348

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    iput-object v0, p0, Lcom/opera/android/bar/BottomNavigationBar;->u:Lcom/opera/android/custom_views/DropShadowFrameLayout;

    const v0, 0x7f0a073e

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/BottomNavigationBar;->v:Landroid/view/View;

    return-void
.end method
