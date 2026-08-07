.class public Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "SourceFile"


# instance fields
.field public final c:Ll/umd0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, -0x1

    .line 19
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ll/vmd0;

    .line 5
    .line 6
    invoke-direct {p3}, Ll/vmd0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 10
    .line 11
    invoke-interface {p3, p1, p2, p0}, Ll/umd0;->o(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    invoke-interface {p3, p0}, Ll/umd0;->a(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/umd0;->m(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/umd0;->f(Landroid/graphics/Canvas;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Ll/umd0;->onSizeChanged(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRadius(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/umd0;->b(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRadiusBottom(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/umd0;->l(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRadiusBottomLeft(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/umd0;->k(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRadiusBottomRight(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/umd0;->i(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRadiusLeft(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/umd0;->h(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRadiusRight(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/umd0;->g(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRadiusTop(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/umd0;->d(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRadiusTopLeft(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/umd0;->c(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRadiusTopRight(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/umd0;->n(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setStrokeColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/umd0;->e(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setStrokeWidth(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/CircleImageView;->c:Ll/umd0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/umd0;->j(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
