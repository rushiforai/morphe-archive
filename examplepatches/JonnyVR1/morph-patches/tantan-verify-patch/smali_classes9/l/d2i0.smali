.class public Ll/d2i0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/l2i0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 5
    .line 6
    iput-object p1, p0, Ll/d2i0;->a:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/d2i0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d2i0;->h0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/d2i0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d2i0;->g0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic g0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/l2i0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l2i0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic h0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/l2i0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l2i0;->A()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/a2i0;->c()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/a2i0;->e(Lcom/p1/mobile/putong/data/User;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    new-instance v0, Ll/b2i0;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/b2i0;-><init>(Ll/d2i0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/gra;->x2()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    invoke-static {}, Ll/gra;->y2()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Ll/d2i0;->a:Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/TagGuidePicAct;->e2()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 57
    .line 58
    iget-object v0, v0, Ll/dkb;->G1:Lrx/subjects/a;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/c2i0;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/c2i0;-><init>(Ll/d2i0;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    :cond_2
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
