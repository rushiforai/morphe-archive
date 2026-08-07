.class public Ll/y3s;
.super Ll/qf4;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/dum;Ll/tf4;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;",
            "Ll/tf4;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/qf4;-><init>(Ll/dum;Ll/tf4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public U3()Landroid/view/ViewGroup$LayoutParams;
    .locals 2

    .line 1
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    const/4 v1, -0x2

    .line 5
    invoke-direct {p0, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 6
    .line 7
    .line 8
    const/16 v0, 0x50

    .line 9
    .line 10
    iput v0, p0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 11
    .line 12
    const/high16 v0, 0x42400000    # 48.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {p0, v1, v1, v1, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/qf4;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
