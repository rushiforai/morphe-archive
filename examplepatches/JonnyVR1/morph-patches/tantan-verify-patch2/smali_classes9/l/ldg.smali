.class public Ll/ldg;
.super Ll/tk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tk2<",
        "Ll/jdg;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ll/q6g;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/tk2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/jdg;

    .line 5
    .line 6
    invoke-direct {v0, p2}, Ll/jdg;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/q6g;

    .line 13
    .line 14
    iget-object v3, p2, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->g:Lv/VDraweeView;

    .line 15
    .line 16
    iget-object v4, p2, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->i:Lv/VDraweeView;

    .line 17
    .line 18
    iget-object v5, p2, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 19
    .line 20
    iget-object v6, p2, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->k:Lv/VImage;

    .line 21
    .line 22
    const/4 v7, 0x0

    .line 23
    move-object v2, p1

    .line 24
    invoke-direct/range {v1 .. v7}, Ll/q6g;-><init>(Ll/dum;Lv/VDraweeView;Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VImage;Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ll/q6g;

    .line 32
    .line 33
    iput-object p1, p0, Ll/ldg;->j:Ll/q6g;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic i4(Ll/ldg;Ll/aeg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ldg;->j4(Ll/aeg;)V

    return-void
.end method


# virtual methods
.method public O3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ldg;->j:Ll/q6g;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/q6g;->O3()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/jdg;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/jdg;->b()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ldg;->j:Ll/q6g;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/y8s;->P3()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/tk2;->Z3()Ll/x7g;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/x7g;->T()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/kdg;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/kdg;-><init>(Ll/ldg;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic j4(Ll/aeg;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jdg;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/jdg;->c(Ll/aeg;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ldg;->j:Ll/q6g;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/q6g;->g4(Ll/aeg;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
