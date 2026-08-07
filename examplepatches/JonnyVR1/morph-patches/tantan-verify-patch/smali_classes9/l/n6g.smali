.class public Ll/n6g;
.super Ll/tk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tk2<",
        "Ll/m6g;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Ll/tk2;Lv/VImage;Lv/VImage;Lv/VImage;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;",
            "Ll/tk2;",
            "Lv/VImage;",
            "Lv/VImage;",
            "Lv/VImage;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/tk2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/m6g;

    .line 5
    .line 6
    invoke-direct {p1, p3, p4, p5}, Ll/m6g;-><init>(Lv/VImage;Lv/VImage;Lv/VImage;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/m6g;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/m6g;->i()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/m6g;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/m6g;->f()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
