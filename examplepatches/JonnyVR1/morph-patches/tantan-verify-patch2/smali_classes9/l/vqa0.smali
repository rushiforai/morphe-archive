.class public Ll/vqa0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/bra0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 5
    .line 6
    iput-object p1, p0, Ll/vqa0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
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

.method public static synthetic f0(Ll/vqa0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vqa0;->n0()V

    return-void
.end method

.method public static synthetic g0(Ll/vqa0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vqa0;->m0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/vqa0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vqa0;->l0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i0(Ll/vqa0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vqa0;->o0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic l0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bra0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bra0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic m0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/vqa0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/vqa0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/ProfileEditLoopBaseFrag;->E:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "from_complete_equity_guide_card"

    .line 12
    .line 13
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const-string p0, "invisible_photo_card"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p0, "invisible_photo_profile"

    .line 23
    .line 24
    :goto_0
    const-string v0, "edit_specific_profile_show_from"

    .line 25
    .line 26
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    rsub-int/lit8 v0, v0, 0x3

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "need_photo_count"

    .line 51
    .line 52
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method private synthetic n0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bra0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bra0;->i()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic o0(Lcom/p1/mobile/android/app/c;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/bra0;

    .line 4
    .line 5
    iget-object p1, p1, Ll/bra0;->g:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 6
    .line 7
    new-instance v0, Ll/uqa0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/uqa0;-><init>(Ll/vqa0;)V

    .line 10
    .line 11
    .line 12
    const-wide/16 v1, 0x3e8

    .line 13
    .line 14
    invoke-static {p1, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 15
    .line 16
    .line 17
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
    new-instance v0, Ll/pqa0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/pqa0;-><init>(Ll/vqa0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/xra;->k()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ll/xra;->m()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/vqa0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopMyLifeFrag;->i5()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    new-instance v0, Ll/qqa0;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/qqa0;-><init>(Ll/vqa0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/rqa0;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/rqa0;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/sqa0;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/sqa0;-><init>(Ll/vqa0;)V

    .line 62
    .line 63
    .line 64
    new-instance p0, Ll/tqa0;

    .line 65
    .line 66
    invoke-direct {p0}, Ll/tqa0;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public k0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bra0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bra0;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
