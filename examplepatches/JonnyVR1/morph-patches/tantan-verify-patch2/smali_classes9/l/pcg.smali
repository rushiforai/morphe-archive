.class public Ll/pcg;
.super Ll/acg;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/acg;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/peg;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/peg;-><init>(Ll/dum;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public C4()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/acg;->C4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/mbg;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    invoke-direct {v0, v1, p0}, Ll/mbg;-><init>(Ll/dum;Ll/tk2;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/ldg;

    .line 15
    .line 16
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 17
    .line 18
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v2, Ll/f8g;

    .line 21
    .line 22
    iget-object v2, v2, Ll/f8g;->x:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;

    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Ll/ldg;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/qeg;

    .line 31
    .line 32
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 33
    .line 34
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 35
    .line 36
    check-cast v2, Ll/f8g;

    .line 37
    .line 38
    iget-object v2, v2, Ll/f8g;->w:Landroidx/recyclerview/widget/RecyclerView;

    .line 39
    .line 40
    invoke-direct {v0, v1, v2}, Ll/qeg;-><init>(Ll/dum;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 44
    .line 45
    .line 46
    return-void
.end method
