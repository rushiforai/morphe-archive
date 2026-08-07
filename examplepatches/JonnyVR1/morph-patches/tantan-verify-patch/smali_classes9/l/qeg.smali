.class public Ll/qeg;
.super Ll/tk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tk2<",
        "Ll/reg;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;",
            "Landroidx/recyclerview/widget/RecyclerView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/tk2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/reg;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/reg;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

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
.method public d4()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/tk2;->d4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/reg;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/reg;->b()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h4(Ll/aeg;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/tk2;->h4(Ll/aeg;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/reg;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/reg;->c(Ll/aeg;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
