.class public Ll/ll1;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/rl1;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/p0k0;

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/p0k0$b;",
            ">;"
        }
    .end annotation
.end field

.field public d:I


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/ll1;->a:Lrx/subjects/a;

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    iput p1, p0, Ll/ll1;->d:I

    .line 12
    .line 13
    return-void
.end method

.method private synthetic A0()Lrx/c;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ll1;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private synthetic D0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rl1;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/rl1;->x(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic e0(Ll/ll1;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ll1;->D0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic f0(Ll/ll1;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ll1;->E0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic g0(Ll/ll1;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ll1;->A0()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Ll/ll1;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ll1;->x0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i0()Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Ll/x5l0;->b:Lrx/subjects/b;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic j0(Ll/ll1;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ll1;->y0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ll/ll1;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ll1;->C0(Ll/p0k0$b;)V

    return-void
.end method

.method public static synthetic l0(Ll/ll1;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ll1;->z0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic m0(Ll/ll1;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ll1;->u0(Ll/p0k0$b;)V

    return-void
.end method

.method private synthetic z0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rl1;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rl1;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic C0(Ll/p0k0$b;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rl1;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/rl1;->w(Ll/p0k0$b;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FAIL:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 11
    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    sget-object v2, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->FINISH:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 15
    .line 16
    if-ne v0, v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    :goto_0
    if-eq v0, v1, :cond_3

    .line 21
    .line 22
    iget-object v0, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    const-string v1, "LOW_FACE_MARK"

    .line 27
    .line 28
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    iget-object p1, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 39
    .line 40
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->isVerificationCheckFail()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    iget-object p0, p0, Ll/ll1;->a:Lrx/subjects/a;

    .line 50
    .line 51
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/ll1;->a:Lrx/subjects/a;

    .line 58
    .line 59
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic E0(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Z()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "verification_type"

    .line 13
    .line 14
    const/4 v2, -0x1

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/ll1;->d:I

    .line 20
    .line 21
    new-instance v0, Ll/p0k0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/p0k0;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/ll1;->b:Ll/p0k0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/p0k0;->c0()Lrx/subjects/a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/ll1;->c:Lrx/subjects/a;

    .line 33
    .line 34
    new-instance v0, Ll/p0k0$b;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/p0k0$b;-><init>()V

    .line 37
    .line 38
    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 54
    .line 55
    new-instance v3, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v4, "fake_risk_audit_default_"

    .line 58
    .line 59
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v2, v3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iput-object v1, v0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 84
    .line 85
    const/4 v1, 0x1

    .line 86
    iput-boolean v1, v0, Ll/p0k0$b;->f:Z

    .line 87
    .line 88
    iget-object v1, p0, Ll/ll1;->c:Lrx/subjects/a;

    .line 89
    .line 90
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    new-instance v0, Ll/cl1;

    .line 94
    .line 95
    invoke-direct {v0, p0}, Ll/cl1;-><init>(Ll/ll1;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dl1;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/dl1;-><init>(Ll/ll1;)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v2, Ll/el1;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/el1;-><init>(Ll/ll1;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/ll1;->a:Lrx/subjects/a;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v2, Ll/fl1;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/fl1;-><init>(Ll/ll1;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    new-instance v0, Ll/gl1;

    .line 45
    .line 46
    invoke-direct {v0}, Ll/gl1;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0, v1}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/hl1;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/hl1;-><init>(Ll/ll1;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public n0()V
    .locals 3

    .line 1
    new-instance v0, Ll/p0k0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/p0k0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->LOCAL_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/p0k0$a;->h(Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;)Ll/p0k0$a;

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->REMOTE_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/p0k0$a;->h(Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;)Ll/p0k0$a;

    .line 14
    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->AVATAR:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/p0k0$a;->n(Lcom/p1/mobile/putong/core/view/AvatarUpdateType;)Ll/p0k0$a;

    .line 19
    .line 20
    .line 21
    const-string v1, "verification"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/p0k0$a;->m(Ljava/lang/String;)Ll/p0k0$a;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/ll1;->b:Ll/p0k0;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget-object p0, p0, Ll/ll1;->c:Lrx/subjects/a;

    .line 33
    .line 34
    invoke-virtual {v1, v2, v0, p0}, Ll/p0k0;->J0(Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public o0()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Ll/ll1;->d:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    const-string p0, ""

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "\u56fd\u5bb6\u7f51\u7edc\u8eab\u4efd\u8ba4\u8bc1"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    const-string p0, "\u5b9e\u540d\u00b7\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_2
    const-string p0, "\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1"

    .line 22
    .line 23
    return-object p0
.end method

.method public p0()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ll1;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public q0()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/ll1;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/p0k0$b;

    .line 8
    .line 9
    iget-object v1, v0, Ll/p0k0$b;->a:Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/view/AvatarUpdateProgress;->isLoading()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v2, "original"

    .line 16
    .line 17
    const-string v3, "album"

    .line 18
    .line 19
    const-string v4, "avatar_photo_source"

    .line 20
    .line 21
    const-string v5, "photo_status"

    .line 22
    .line 23
    const-string v6, "p_photo_confirmation_verification"

    .line 24
    .line 25
    const-string v7, "e_confirm_start_verification"

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    const-string p0, "\u7167\u7247\u4e0a\u4f20\u4e2d..."

    .line 30
    .line 31
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string p0, "uploading"

    .line 35
    .line 36
    invoke-static {v5, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-boolean v0, v0, Ll/p0k0$b;->e:Z

    .line 41
    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    move-object v2, v3

    .line 45
    :cond_0
    invoke-static {v4, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {v7, v6, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    iget-boolean v1, v0, Ll/p0k0$b;->f:Z

    .line 58
    .line 59
    if-nez v1, :cond_3

    .line 60
    .line 61
    iget-boolean v1, v0, Ll/p0k0$b;->e:Z

    .line 62
    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    const-string p0, "\u7167\u7247\u4e0a\u4f20\u5931\u8d25\uff0c\u8bf7\u66f4\u6362\u5934\u50cf\u540e\u5c1d\u8bd5"

    .line 66
    .line 67
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const-string p0, "upload_failed"

    .line 71
    .line 72
    invoke-static {v5, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    iget-boolean v0, v0, Ll/p0k0$b;->e:Z

    .line 77
    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    move-object v2, v3

    .line 81
    :cond_2
    invoke-static {v4, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {v7, v6, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    iget-object v1, v0, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 94
    .line 95
    invoke-virtual {p0, v1}, Ll/ll1;->t0(Lcom/p1/mobile/putong/data/Media;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_5

    .line 100
    .line 101
    const-string p0, "\u7167\u7247\u672a\u8bc6\u522b\u5230\u5355\u4eba\u6e05\u6670\u6b63\u8138\uff0c\u8bf7\u66f4\u6362\u5934\u50cf\u540e\u5c1d\u8bd5"

    .line 102
    .line 103
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    const-string p0, "image_quality"

    .line 107
    .line 108
    invoke-static {v5, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    iget-boolean v0, v0, Ll/p0k0$b;->e:Z

    .line 113
    .line 114
    if-eqz v0, :cond_4

    .line 115
    .line 116
    move-object v2, v3

    .line 117
    :cond_4
    invoke-static {v4, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-static {v7, v6, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_5
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 130
    .line 131
    check-cast v1, Ll/rl1;

    .line 132
    .line 133
    invoke-virtual {v1}, Ll/rl1;->n()Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-nez v1, :cond_7

    .line 138
    .line 139
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    new-instance v8, Ll/il1;

    .line 144
    .line 145
    invoke-direct {v8, p0, v0}, Ll/il1;-><init>(Ll/ll1;Ll/p0k0$b;)V

    .line 146
    .line 147
    .line 148
    const/4 p0, 0x1

    .line 149
    invoke-static {v1, p0, v8}, Ll/pq4;->j(Lcom/p1/mobile/android/app/Act;ZLjava/lang/Runnable;)V

    .line 150
    .line 151
    .line 152
    const-string p0, "privacy_agreement"

    .line 153
    .line 154
    invoke-static {v5, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    iget-boolean v0, v0, Ll/p0k0$b;->e:Z

    .line 159
    .line 160
    if-eqz v0, :cond_6

    .line 161
    .line 162
    move-object v2, v3

    .line 163
    :cond_6
    invoke-static {v4, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-static {v7, v6, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_7
    const-string v1, "default"

    .line 176
    .line 177
    invoke-static {v5, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    iget-boolean v5, v0, Ll/p0k0$b;->e:Z

    .line 182
    .line 183
    if-eqz v5, :cond_8

    .line 184
    .line 185
    move-object v2, v3

    .line 186
    :cond_8
    invoke-static {v4, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-static {v7, v6, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0, v0}, Ll/ll1;->r0(Ll/p0k0$b;)V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public final r0(Ll/p0k0$b;)V
    .locals 4

    .line 1
    iget-boolean v0, p1, Ll/p0k0$b;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ll1;->s0()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 39
    .line 40
    iget-object v2, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 41
    .line 42
    invoke-interface {v0, v1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 62
    .line 63
    iget-object p1, p1, Ll/p0k0$b;->b:Lcom/p1/mobile/putong/data/Media;

    .line 64
    .line 65
    invoke-interface {v3, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 81
    .line 82
    .line 83
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 86
    .line 87
    invoke-virtual {v0, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    new-instance v0, Ll/jl1;

    .line 96
    .line 97
    invoke-direct {v0, p0}, Ll/jl1;-><init>(Ll/ll1;)V

    .line 98
    .line 99
    .line 100
    new-instance v1, Ll/kl1;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/kl1;-><init>(Ll/ll1;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_2
    invoke-virtual {p0}, Ll/ll1;->s0()V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public final s0()V
    .locals 3

    .line 1
    iget v0, p0, Ll/ll1;->d:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v0, "verification_center"

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-static {p0, v0, v2, v1}, Ll/hxf;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZ)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/4 v2, 0x2

    .line 18
    if-ne v0, v2, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0, v1}, Ll/zki0;->F(Landroid/content/Context;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final t0(Lcom/p1/mobile/putong/data/Media;)Z
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_2

    .line 5
    .line 6
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    const-string p0, "LOW_FACE_MARK"

    .line 9
    .line 10
    invoke-static {p0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/Picture;->isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->isVerificationCheckFail()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return v0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_2
    return v0
.end method

.method public final synthetic u0(Ll/p0k0$b;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rl1;

    .line 4
    .line 5
    iget-object v0, v0, Ll/rl1;->j:Lv/VCheckBox;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/ll1;->r0(Ll/p0k0$b;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic x0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ll1;->s0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic y0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p1, "\u7f51\u7edc\u65e0\u6cd5\u8fde\u63a5"

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
