.class public Ll/jd00;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/pd00;",
        ">",
        "Ll/ar2<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/jd00;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jd00;->h0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/jd00;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jd00;->i0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic h0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jd00;->g0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic i0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/pd00;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/pd00;->T()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/pd00;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/pd00;->S()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/hd00;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/hd00;-><init>(Ll/jd00;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/id00;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/id00;-><init>(Ll/jd00;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public g0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/pd00;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/pd00;->E()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/pd00;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/pd00;->F()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/pd00;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/pd00;->X()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Ll/pd00;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/pd00;->J()V

    .line 27
    .line 28
    .line 29
    return-void
.end method
