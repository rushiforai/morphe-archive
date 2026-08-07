.class public Ll/zq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yq0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/yq0;",
        ">",
        "Ljava/lang/Object;",
        "Ll/yq0;"
    }
.end annotation


# instance fields
.field public a:Ll/yq0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public b:I
    .annotation build Landroidx/annotation/IntRange;
        from = -0x1L
        to = 0xffL
    .end annotation
.end field

.field public c:Landroid/graphics/ColorFilter;

.field public d:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Ll/yq0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/zq0;->b:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/zq0;->a:Ll/yq0;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/yq0;->a()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/yq0;->b()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public c(Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/yq0;->c(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Ll/zq0;->d:Landroid/graphics/Rect;

    .line 9
    .line 10
    return-void
.end method

.method public clear()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/yq0;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/yq0;->d(Landroid/graphics/ColorFilter;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput-object p1, p0, Ll/zq0;->c:Landroid/graphics/ColorFilter;

    .line 9
    .line 10
    return-void
.end method

.method public e(Ll/yq0$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/yq0;->e(Ll/yq0$a;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/kr0;->f()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public g(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0, p1}, Ll/kr0;->g(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getFrameCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/kr0;->getFrameCount()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getLoopCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/kr0;->getLoopCount()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public h(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
            to = 0xffL
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ll/yq0;->h(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iput p1, p0, Ll/zq0;->b:I

    .line 9
    .line 10
    return-void
.end method

.method public height()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/kr0;->height()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public i(Landroid/graphics/drawable/Drawable;Landroid/graphics/Canvas;I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/yq0;->i(Landroid/graphics/drawable/Drawable;Landroid/graphics/Canvas;I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public width()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zq0;->a:Ll/yq0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ll/kr0;->width()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
