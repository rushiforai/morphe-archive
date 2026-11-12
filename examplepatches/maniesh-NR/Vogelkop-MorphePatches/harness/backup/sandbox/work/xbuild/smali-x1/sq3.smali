.class public final Lsq3;
.super Lmq3;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Boolean;

.field public final b:Lg3o;

.field public c:Landroid/view/Window;

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Lg3o;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lsq3;->b:Lg3o;

    invoke-static {p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->D(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object p2

    iget-object p2, p2, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->j:Lzdd;

    if-eqz p2, :cond_12

    iget-object p2, p2, Lzdd;->b:Lxdd;

    iget-object p2, p2, Lxdd;->c:Landroid/content/res/ColorStateList;

    goto :goto_16

    :cond_12
    invoke-virtual {p1}, Landroid/view/View;->getBackgroundTintList()Landroid/content/res/ColorStateList;

    move-result-object p2

    :goto_16
    if-eqz p2, :cond_27

    invoke-virtual {p2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    invoke-static {p1}, Lfr3;->O(I)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lsq3;->a:Ljava/lang/Boolean;

    return-void

    :cond_27
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-static {p1}, Lfr3;->N(Landroid/graphics/drawable/Drawable;)Landroid/content/res/ColorStateList;

    move-result-object p1

    const/4 p2, 0x0

    if-eqz p1, :cond_3b

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_3c

    :cond_3b
    move-object p1, p2

    :goto_3c
    if-eqz p1, :cond_4d

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p1}, Lfr3;->O(I)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lsq3;->a:Ljava/lang/Boolean;

    return-void

    :cond_4d
    iput-object p2, p0, Lsq3;->a:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 2

    invoke-virtual {p0, p1}, Lsq3;->d(Landroid/view/View;)V

    return-void
.end method

.method public final b(Landroid/view/View;)V
    .registers 2

    invoke-virtual {p0, p1}, Lsq3;->d(Landroid/view/View;)V

    return-void
.end method

.method public final c(ILandroid/view/View;)V
    .registers 3

    invoke-virtual {p0, p2}, Lsq3;->d(Landroid/view/View;)V

    return-void
.end method

.method public final d(Landroid/view/View;)V
    .registers 8

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    iget-object v1, p0, Lsq3;->b:Lg3o;

    invoke-virtual {v1}, Lg3o;->d()I

    move-result v2

    const/16 v3, 0x1e

    const/16 v4, 0x23

    if-ge v0, v2, :cond_5b

    iget-object v0, p0, Lsq3;->c:Landroid/view/Window;

    if-eqz v0, :cond_42

    iget-object v2, p0, Lsq3;->a:Ljava/lang/Boolean;

    if-nez v2, :cond_1b

    iget-boolean p0, p0, Lsq3;->d:Z

    goto :goto_1f

    :cond_1b
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    :goto_1f
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    new-instance v5, Loji;

    invoke-direct {v5, v2}, Loji;-><init>(Landroid/view/View;)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v4, :cond_32

    new-instance v2, Lj3o;

    invoke-direct {v2, v0, v5}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_3f

    :cond_32
    if-lt v2, v3, :cond_3a

    new-instance v2, Li3o;

    invoke-direct {v2, v0, v5}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_3f

    :cond_3a
    new-instance v2, Lh3o;

    invoke-direct {v2, v0, v5}, Lh3o;-><init>(Landroid/view/Window;Loji;)V

    :goto_3f
    invoke-virtual {v2, p0}, Lw1h;->w(Z)V

    :cond_42
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p0

    invoke-virtual {v1}, Lg3o;->d()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    invoke-virtual {p1, p0, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    return-void

    :cond_5b
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    if-eqz v0, :cond_9a

    iget-object v0, p0, Lsq3;->c:Landroid/view/Window;

    if-eqz v0, :cond_8a

    iget-boolean p0, p0, Lsq3;->d:Z

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    new-instance v2, Loji;

    invoke-direct {v2, v1}, Loji;-><init>(Landroid/view/View;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v4, :cond_7a

    new-instance v1, Lj3o;

    invoke-direct {v1, v0, v2}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_87

    :cond_7a
    if-lt v1, v3, :cond_82

    new-instance v1, Li3o;

    invoke-direct {v1, v0, v2}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_87

    :cond_82
    new-instance v1, Lh3o;

    invoke-direct {v1, v0, v2}, Lh3o;-><init>(Landroid/view/Window;Loji;)V

    :goto_87
    invoke-virtual {v1, p0}, Lw1h;->w(Z)V

    :cond_8a
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, p0, v2, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    :cond_9a
    return-void
.end method

.method public final e(Landroid/view/Window;)V
    .registers 5

    iget-object v0, p0, Lsq3;->c:Landroid/view/Window;

    if-eq v0, p1, :cond_32

    iput-object p1, p0, Lsq3;->c:Landroid/view/Window;

    if-eqz p1, :cond_32

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Loji;

    invoke-direct {v1, v0}, Loji;-><init>(Landroid/view/View;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x23

    if-lt v0, v2, :cond_1d

    new-instance v0, Lj3o;

    invoke-direct {v0, p1, v1}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_2c

    :cond_1d
    const/16 v2, 0x1e

    if-lt v0, v2, :cond_27

    new-instance v0, Li3o;

    invoke-direct {v0, p1, v1}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_2c

    :cond_27
    new-instance v0, Lh3o;

    invoke-direct {v0, p1, v1}, Lh3o;-><init>(Landroid/view/Window;Loji;)V

    :goto_2c
    invoke-virtual {v0}, Lw1h;->q()Z

    move-result p1

    iput-boolean p1, p0, Lsq3;->d:Z

    :cond_32
    return-void
.end method
