.class public final Lxmj;
.super Lvmj;
.source "SourceFile"


# instance fields
.field public h:Landroid/graphics/drawable/Drawable;

.field public final i:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lb8h;Lumj;IILna5;)V
    .registers 13

    invoke-virtual {p6, p1}, Lna5;->d(Landroid/content/Context;)Loa5;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v4, p3

    move v2, p4

    move v3, p5

    invoke-direct/range {v0 .. v5}, Lvmj;-><init>(Landroid/content/Context;IILumj;Loa5;)V

    invoke-virtual {p2, v1}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    iget-object p1, v0, Lvmj;->c:Loa5;

    iget p1, p1, Loa5;->a:I

    invoke-static {p0, p1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    iput-object p0, v0, Lxmj;->h:Landroid/graphics/drawable/Drawable;

    div-int/lit8 p4, v2, 0x2

    div-int/lit8 p5, v3, 0x2

    sub-int p0, v2, p4

    div-int/lit8 p0, p0, 0x2

    sub-int p1, v3, p5

    div-int/lit8 p1, p1, 0x2

    new-instance p2, Landroid/graphics/Rect;

    add-int/2addr p4, p0

    add-int/2addr p5, p1

    invoke-direct {p2, p0, p1, p4, p5}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p2, v0, Lxmj;->i:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public final b(Landroid/graphics/Canvas;)V
    .registers 4

    iget-object v0, p0, Lxmj;->h:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lxmj;->i:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object p0, p0, Lxmj;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final setAlpha(I)V
    .registers 3

    invoke-super {p0, p1}, Lvmj;->setAlpha(I)V

    iget-object v0, p0, Lxmj;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lxmj;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    return-void
.end method
