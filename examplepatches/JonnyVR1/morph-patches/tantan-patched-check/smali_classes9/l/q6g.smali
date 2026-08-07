.class public Ll/q6g;
.super Ll/tk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tk2<",
        "Ll/p6g;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lv/VDraweeView;Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VImage;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;",
            "Lv/VDraweeView;",
            "Lv/VDraweeView;",
            "Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;",
            "Lv/VImage;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/tk2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/p6g;

    .line 5
    .line 6
    invoke-direct/range {p1 .. p6}, Ll/p6g;-><init>(Lv/VDraweeView;Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VImage;Z)V

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
    check-cast p0, Ll/p6g;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/p6g;->b()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g4(Ll/aeg;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/p6g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/p6g;->c(Ll/aeg;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
