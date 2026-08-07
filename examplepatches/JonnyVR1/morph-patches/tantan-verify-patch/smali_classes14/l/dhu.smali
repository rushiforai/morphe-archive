.class public Ll/dhu;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Ll/l4g0;

.field public g:Ll/icl0;


# direct methods
.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/icl0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/icl0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/dhu;->g:Ll/icl0;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic R2(Ll/dhu;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dhu;->U2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic S2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private synthetic U2(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->q()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dhu;->g:Ll/icl0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/icl0;->b()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/cyr;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/bhu;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/bhu;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/chu;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/chu;-><init>(Ll/dhu;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public T2()V
    .locals 0

    .line 1
    return-void
.end method

.method public V2()V
    .locals 0

    .line 1
    return-void
.end method

.method public W2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dhu;->f:Ll/l4g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/dhu;->f:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/dhu;->f:Ll/l4g0;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dhu;->W2()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/dhu;->g:Ll/icl0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/icl0;->e()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
