.class public Ll/gje;
.super Ll/yj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/yj2<",
        "TD;",
        "Ll/lje;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Landroid/widget/FrameLayout;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Landroid/widget/FrameLayout;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/yj2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lje;

    .line 5
    .line 6
    invoke-direct {v0, p2}, Ll/lje;-><init>(Landroid/widget/FrameLayout;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    new-instance v0, Ll/o8e;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/o8e;-><init>(Ll/dum;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 27
    .line 28
    .line 29
    :cond_0
    new-instance v0, Ll/xge;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ll/xge;-><init>(Ll/dum;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/k9n;

    .line 38
    .line 39
    invoke-direct {v0, p1, p2}, Ll/k9n;-><init>(Ll/dum;Landroid/widget/FrameLayout;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 43
    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public T3()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/lje;

    .line 4
    .line 5
    iget-object p0, p0, Ll/lje;->b:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    return-object p0
.end method
