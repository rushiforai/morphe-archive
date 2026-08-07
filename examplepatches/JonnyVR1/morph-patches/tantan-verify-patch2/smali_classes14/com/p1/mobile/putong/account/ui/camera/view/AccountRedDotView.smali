.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;
.super Lv/VImage;
.source "SourceFile"


# instance fields
.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->d:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->h(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->d:I

    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->h(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2, p3}, Lv/VImage;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, -0x1

    .line 16
    iput p3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->d:I

    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->h(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final h(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->e:I

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/ihc0;->n:[I

    .line 14
    .line 15
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget p2, Ll/ihc0;->s:I

    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->d:I

    .line 27
    .line 28
    sget p2, Ll/ihc0;->r:I

    .line 29
    .line 30
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->f:I

    .line 35
    .line 36
    sget p2, Ll/ihc0;->q:I

    .line 37
    .line 38
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->g:I

    .line 43
    .line 44
    sget p2, Ll/ihc0;->o:I

    .line 45
    .line 46
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->h:I

    .line 51
    .line 52
    sget p2, Ll/ihc0;->p:I

    .line 53
    .line 54
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iput p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->i:I

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 61
    .line 62
    .line 63
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->o()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final i(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x4

    if-eq p1, p0, :cond_1

    const/16 p0, 0x8

    if-ne p1, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public final j(I)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public k()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->d:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/fo;->d()Ll/fo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->d:I

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/fo;->k(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final l()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->d:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/fo;->d()Ll/fo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->d:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Ll/fo;->n(Ljava/lang/Integer;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final m()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->d:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/fo;->d()Ll/fo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->d:I

    .line 10
    .line 11
    invoke-virtual {v0, p0, v1}, Ll/fo;->l(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public o()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->f:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    new-instance v0, Ll/ao;

    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->f:I

    .line 9
    .line 10
    iget v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->g:I

    .line 11
    .line 12
    iget v3, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->h:I

    .line 13
    .line 14
    iget v4, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->i:I

    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3, v4}, Ll/ao;-><init>(IIII)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public setOvalColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public setRedPointType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public setRingColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->i:I

    .line 2
    .line 3
    return-void
.end method

.method public setRingWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->e:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->i(I)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->j(I)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->m()V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->e:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->j(I)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->i(I)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->l()V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->e:I

    .line 40
    .line 41
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountRedDotView;->f:I

    .line 2
    .line 3
    return-void
.end method
