.class public final Lmwj;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final a:Lpde;

.field public b:Lq2l;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lpde;Lpde;)V
    .registers 5

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Lmwj;->a:Lpde;

    sget-object p1, Lq2l;->a:Lq2l;

    iput-object p1, p0, Lmwj;->b:Lq2l;

    new-instance p1, Lqzg;

    const/16 v0, 0xc

    invoke-direct {p1, p0, v0}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p2, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v1, p0, Lmwj;->a:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leyj;

    iget-object p0, p0, Lmwj;->b:Lq2l;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_33

    const/4 v2, 0x1

    if-ne p0, v2, :cond_2f

    iget-object p0, v1, Leyj;->j:Loxj;

    iget-object p0, p0, Loxj;->g:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result p0

    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object p0, v1, Leyj;->j:Loxj;

    iget-object p0, p0, Loxj;->g:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    return-void

    :cond_2f
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_33
    iget-object p0, v1, Leyj;->j:Loxj;

    iget-object p0, p0, Loxj;->f:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result p0

    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object p0, v1, Leyj;->j:Loxj;

    iget-object p0, p0, Loxj;->f:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    return-void
.end method

.method public final setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Lmwj;->a()V

    return-void
.end method
