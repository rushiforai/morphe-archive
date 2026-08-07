.class public Ll/upd;
.super Ll/qn2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qn2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qn2;->a:Ll/ox2;

    .line 2
    .line 3
    const/high16 v0, 0x40a00000    # 5.0f

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/ox2;->n(F)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public g(IILandroid/view/View;ILl/txl0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0}, Ll/upd;->s()I

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    mul-int/lit8 p4, p4, 0x2

    .line 14
    .line 15
    sub-int/2addr p1, p4

    .line 16
    invoke-virtual {p0}, Ll/qn2;->b()Z

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    if-eqz p4, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/upd;->m()I

    .line 23
    .line 24
    .line 25
    move-result p4

    .line 26
    add-int/lit8 p4, p4, -0x1

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/upd;->d()I

    .line 29
    .line 30
    .line 31
    move-result p5

    .line 32
    mul-int/2addr p4, p5

    .line 33
    sub-int/2addr p2, p4

    .line 34
    invoke-virtual {p0}, Ll/upd;->r()I

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    sub-int/2addr p2, p4

    .line 39
    invoke-virtual {p0}, Ll/upd;->t()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    :goto_0
    sub-int/2addr p2, p0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/upd;->r()I

    .line 46
    .line 47
    .line 48
    move-result p4

    .line 49
    sub-int/2addr p2, p4

    .line 50
    invoke-virtual {p0}, Ll/upd;->t()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    goto :goto_0

    .line 55
    :goto_1
    const/high16 p0, 0x40000000    # 2.0f

    .line 56
    .line 57
    invoke-static {p1, p0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    invoke-static {p2, p0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    invoke-virtual {p3, p1, p0}, Landroid/view/View;->measure(II)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public l(Landroid/view/View;IIIIIZLl/txl0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    invoke-virtual {p0}, Ll/upd;->s()I

    .line 10
    .line 11
    .line 12
    move-result p5

    .line 13
    invoke-virtual {p0}, Ll/qn2;->q()Z

    .line 14
    .line 15
    .line 16
    move-result p7

    .line 17
    if-eqz p7, :cond_0

    .line 18
    .line 19
    sub-int/2addr p6, p4

    .line 20
    invoke-virtual {p0}, Ll/upd;->r()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    sub-int/2addr p6, p0

    .line 25
    sub-int p0, p6, p3

    .line 26
    .line 27
    add-int/2addr p2, p5

    .line 28
    invoke-virtual {p1, p5, p0, p2, p6}, Landroid/view/View;->layout(IIII)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/upd;->t()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    add-int/2addr p2, p5

    .line 37
    add-int/2addr p3, p0

    .line 38
    invoke-virtual {p1, p5, p0, p2, p3}, Landroid/view/View;->layout(IIII)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public m()I
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    return p0
.end method

.method public r()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qn2;->a:Ll/ox2;

    .line 2
    .line 3
    const/high16 v0, 0x40a00000    # 5.0f

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/ox2;->n(F)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public s()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qn2;->a:Ll/ox2;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/ox2;->n(F)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public t()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qn2;->a:Ll/ox2;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/ox2;->n(F)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method
