.class public Ll/ax40;
.super Ll/o510;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o510;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 12
    .line 13
    iget-object v2, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 14
    .line 15
    if-eqz v2, :cond_2

    .line 16
    .line 17
    iget-object v0, v0, Ll/r510$a;->b:Landroid/view/ViewGroup;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v2, p0, Ll/o510;->a:Ll/r510$a;

    .line 27
    .line 28
    iget-object v2, v2, Ll/r510$a;->b:Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iget-object v3, p0, Ll/o510;->a:Ll/r510$a;

    .line 35
    .line 36
    iget-object v3, v3, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 37
    .line 38
    invoke-static {v3}, Ll/o510;->a(Landroid/view/SurfaceView;)Landroid/widget/FrameLayout$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 43
    .line 44
    iput v0, v3, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 45
    .line 46
    iput v2, v3, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 47
    .line 48
    iput v1, v3, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 49
    .line 50
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 51
    .line 52
    iget-object v0, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 58
    .line 59
    iget-object v0, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 60
    .line 61
    const/4 v1, 0x1

    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/o510;->a:Ll/r510$a;

    .line 66
    .line 67
    iget-object p0, p0, Ll/r510$a;->b:Landroid/view/ViewGroup;

    .line 68
    .line 69
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    :cond_2
    :goto_0
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/r510$a;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/o510;->e(Ll/r510$a;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ax40;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
