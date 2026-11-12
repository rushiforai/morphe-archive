.class public final Lh3o;
.super Lw1h;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/Window;

.field public final b:Loji;


# direct methods
.method public constructor <init>(Landroid/view/Window;Loji;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh3o;->a:Landroid/view/Window;

    iput-object p2, p0, Lh3o;->b:Loji;

    return-void
.end method


# virtual methods
.method public final C(I)V
    .registers 3

    iget-object p0, p0, Lh3o;->a:Landroid/view/Window;

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    or-int/2addr v0, p1

    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method public final D(I)V
    .registers 3

    iget-object p0, p0, Lh3o;->a:Landroid/view/Window;

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    not-int p1, p1

    and-int/2addr v0, p1

    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    return-void
.end method

.method public final p(I)V
    .registers 5

    const/4 v0, 0x1

    move v1, v0

    :goto_2
    const/16 v2, 0x200

    if-gt v1, v2, :cond_28

    and-int v2, p1, v1

    if-eqz v2, :cond_25

    if-eq v1, v0, :cond_21

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1d

    const/16 v2, 0x8

    if-ne v1, v2, :cond_25

    iget-object v2, p0, Lh3o;->b:Loji;

    iget-object v2, v2, Loji;->a:Ljava/lang/Object;

    check-cast v2, Lrii;

    invoke-virtual {v2}, Lrii;->i()V

    goto :goto_25

    :cond_1d
    invoke-virtual {p0, v2}, Lh3o;->C(I)V

    goto :goto_25

    :cond_21
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lh3o;->C(I)V

    :cond_25
    :goto_25
    shl-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_28
    return-void
.end method

.method public final q()Z
    .registers 1

    iget-object p0, p0, Lh3o;->a:Landroid/view/Window;

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result p0

    and-int/lit16 p0, p0, 0x2000

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final v(Z)V
    .registers 4

    const/16 v0, 0x10

    if-eqz p1, :cond_14

    const/high16 p1, 0x8000000

    iget-object v1, p0, Lh3o;->a:Landroid/view/Window;

    invoke-virtual {v1, p1}, Landroid/view/Window;->clearFlags(I)V

    const/high16 p1, -0x80000000

    invoke-virtual {v1, p1}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {p0, v0}, Lh3o;->C(I)V

    return-void

    :cond_14
    invoke-virtual {p0, v0}, Lh3o;->D(I)V

    return-void
.end method

.method public final w(Z)V
    .registers 4

    const/16 v0, 0x2000

    if-eqz p1, :cond_14

    const/high16 p1, 0x4000000

    iget-object v1, p0, Lh3o;->a:Landroid/view/Window;

    invoke-virtual {v1, p1}, Landroid/view/Window;->clearFlags(I)V

    const/high16 p1, -0x80000000

    invoke-virtual {v1, p1}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {p0, v0}, Lh3o;->C(I)V

    return-void

    :cond_14
    invoke-virtual {p0, v0}, Lh3o;->D(I)V

    return-void
.end method

.method public final x()V
    .registers 4

    iget-object v0, p0, Lh3o;->a:Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const v1, 0x1538b9a6

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    const/16 v0, 0x800

    invoke-virtual {p0, v0}, Lh3o;->D(I)V

    const/16 v0, 0x1000

    invoke-virtual {p0, v0}, Lh3o;->C(I)V

    return-void
.end method
