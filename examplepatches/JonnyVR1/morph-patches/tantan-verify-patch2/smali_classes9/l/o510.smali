.class public abstract Ll/o510;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/r510$a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/view/SurfaceView;)Landroid/widget/FrameLayout$LayoutParams;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 17
    .line 18
    sget v0, Ll/bnl0;->e:I

    .line 19
    .line 20
    invoke-direct {p0, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method


# virtual methods
.method public abstract b()V
.end method

.method public abstract c()V
.end method

.method public d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, v0, Ll/r510$a;->b:Landroid/view/ViewGroup;

    .line 7
    .line 8
    iput-object v1, v0, Ll/r510$a;->d:Landroid/view/SurfaceView;

    .line 9
    .line 10
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/o510;->a:Ll/r510$a;

    .line 18
    .line 19
    iget-object v0, v0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Ll/o510;->a:Ll/r510$a;

    .line 26
    .line 27
    iput-object v1, p0, Ll/r510$a;->c:Landroid/view/ViewGroup;

    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public e(Ll/r510$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o510;->a:Ll/r510$a;

    .line 2
    .line 3
    return-void
.end method
