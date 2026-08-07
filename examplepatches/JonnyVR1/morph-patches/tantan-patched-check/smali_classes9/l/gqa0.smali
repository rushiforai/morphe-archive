.class public Ll/gqa0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/iqa0;",
        ">;"
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

.method public static synthetic e0(Ll/gqa0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gqa0;->i0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic f0(Ll/gqa0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gqa0;->h0(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/data/User;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->mbti:Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method private synthetic i0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/iqa0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/iqa0;->i()V

    .line 6
    .line 7
    .line 8
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
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/iqa0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/iqa0;->d()Landroid/os/Bundle;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "loop_input_type"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 19
    .line 20
    new-instance v1, Ll/dqa0;

    .line 21
    .line 22
    invoke-direct {v1, p0, v0}, Ll/dqa0;-><init>(Ll/gqa0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ll/ar2;->creates(Ll/y20;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/eqa0;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/eqa0;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/fqa0;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/fqa0;-><init>(Ll/gqa0;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic h0(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/iqa0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/iqa0;->e(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
