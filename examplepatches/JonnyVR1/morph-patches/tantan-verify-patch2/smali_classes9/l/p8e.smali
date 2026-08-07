.class public Ll/p8e;
.super Ll/ck2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/ck2<",
        "TD;",
        "Ll/u8e;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

.field public final k:Ll/u8e;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ck2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/u8e;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/u8e;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/p8e;->k:Ll/u8e;

    .line 10
    .line 11
    return-void
.end method

.method public static T3(Ll/dum;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)Ll/mtl;
    .locals 2

    .line 1
    new-instance v0, Ll/y7e;

    .line 2
    .line 3
    const-string v1, "DOWN_BOX_TYPE"

    .line 4
    .line 5
    invoke-direct {v0, p0, p1, v1}, Ll/y7e;-><init>(Ll/dum;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public M3()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "DOWN_BOX_TYPE"

    .line 2
    .line 3
    return-object p0
.end method

.method public U3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p8e;->j:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 2
    .line 3
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/u8e;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/u8e;->u()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/u8e;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/u8e;->q()V

    .line 13
    .line 14
    .line 15
    invoke-super {p0}, Ll/i6t;->n()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/a8e;->c(Ll/ck2;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/p8e;->k:Ll/u8e;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/u8e;

    .line 12
    .line 13
    iget-object v1, p0, Ll/p8e;->j:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;

    .line 14
    .line 15
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Ll/u8e;->s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
