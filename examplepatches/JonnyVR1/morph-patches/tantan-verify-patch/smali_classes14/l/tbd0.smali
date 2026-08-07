.class public Ll/tbd0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/vbd0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ll/iad0;

.field public g:Ll/cad0;

.field public h:Z

.field public final i:Lcom/p1/mobile/android/app/Act;

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Frag;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Ll/ar2;-><init>(Ll/ner;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/tbd0;->h:Z

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    iput-object v0, p0, Ll/tbd0;->j:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/tbd0;->i:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/tbd0;->y0(Lcom/p1/mobile/android/app/Frag;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic e0(Ll/tbd0;Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tbd0;->J0(Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;)V

    return-void
.end method

.method public static synthetic f0(Ll/a9d0;)V
    .locals 1

    .line 1
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fk3;

    .line 8
    .line 9
    iget-object v0, v0, Ll/fk3;->w:Lrx/subjects/b;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic g0(Ll/tbd0;Ll/ycd0;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tbd0;->L0(Ll/ycd0;Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method

.method public static synthetic h0(Ll/tbd0;Ll/a9d0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tbd0;->I0(Ll/a9d0;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Ll/tbd0;Ll/dbd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tbd0;->C0(Ll/dbd0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ll/tbd0;Ll/dbd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tbd0;->D0(Ll/dbd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic l0(Ll/tbd0;Ll/dbd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tbd0;->G0(Ll/dbd0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m0(Ll/tbd0;Ll/dbd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tbd0;->E0(Ll/dbd0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic n0(Ll/tbd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tbd0;->A0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic o0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v1, 0x9ca3

    .line 10
    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic p0(Ll/tbd0;Ll/dbd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tbd0;->H0(Ll/dbd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic q0(Ll/tbd0;Ll/ycd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tbd0;->N0(Ll/ycd0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic r0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/fk3;

    .line 8
    .line 9
    iget-object p0, p0, Ll/fk3;->w:Lrx/subjects/b;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic s0(Ll/tbd0;Ll/dbd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tbd0;->F0(Ll/dbd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method


# virtual methods
.method public final synthetic A0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->p0:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/tbd0;->S0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic C0(Ll/dbd0;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->r1:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/tbd0;->x0(Ll/dbd0;Ljava/lang/Throwable;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic D0(Ll/dbd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    sget p2, Lcom/p1/mobile/putong/live/base/R$string;->u1:I

    .line 2
    .line 3
    invoke-static {p2}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/tbd0;->U0(Ll/dbd0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic E0(Ll/dbd0;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->t1:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/tbd0;->x0(Ll/dbd0;Ljava/lang/Throwable;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F0(Ll/dbd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    sget p2, Lcom/p1/mobile/putong/live/base/R$string;->T0:I

    .line 2
    .line 3
    invoke-static {p2}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/tbd0;->U0(Ll/dbd0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic G0(Ll/dbd0;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->S0:I

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/tbd0;->x0(Ll/dbd0;Ljava/lang/Throwable;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic H0(Ll/dbd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    sget p2, Lcom/p1/mobile/putong/live/base/R$string;->s1:I

    .line 2
    .line 3
    invoke-static {p2}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/tbd0;->U0(Ll/dbd0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic I0(Ll/a9d0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tbd0;->h:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/tbd0;->f:Ll/iad0;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/iad0;->j(Ll/a9d0;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic J0(Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/vbd0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/tbd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 6
    .line 7
    iget-object p0, p0, Ll/tbd0;->j:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p1, v1, p0}, Ll/vbd0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic L0(Ll/ycd0;Lcom/p1/mobile/putong/data/SettingGroups;)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    sget-object p2, Ll/tbs;->a:Landroid/app/Application;

    .line 12
    .line 13
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->x0:I

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sget-object p2, Ll/tbs;->a:Landroid/app/Application;

    .line 21
    .line 22
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->w0:I

    .line 23
    .line 24
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    :goto_0
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast p0, Ll/vbd0;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/vbd0;->p(Ll/ycd0;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic N0(Ll/ycd0;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v1, p2

    .line 6
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isLevelNotEnoughToOpen()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    sget-object p2, Ll/tbs;->a:Landroid/app/Application;

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->L:I

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p0, Ll/vbd0;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/vbd0;->p(Ll/ycd0;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    if-eqz v0, :cond_1

    .line 34
    .line 35
    move-object v1, p2

    .line 36
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isLevelNotEnoughToClose()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    sget-object p2, Ll/tbs;->a:Landroid/app/Application;

    .line 45
    .line 46
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->K:I

    .line 47
    .line 48
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Ll/vbd0;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ll/vbd0;->p(Ll/ycd0;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    if-eqz v0, :cond_2

    .line 64
    .line 65
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 66
    .line 67
    invoke-virtual {p2}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isLevelNotEnoughToCloseNew()Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_2

    .line 72
    .line 73
    sget-object p2, Ll/tbs;->a:Landroid/app/Application;

    .line 74
    .line 75
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->F0:I

    .line 76
    .line 77
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-static {p2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 85
    .line 86
    check-cast p0, Ll/vbd0;

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ll/vbd0;->p(Ll/ycd0;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 93
    .line 94
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->V:I

    .line 95
    .line 96
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public O0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tbd0;->g:Ll/cad0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/cad0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/tbd0;->i:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/cad0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/tbd0;->g:Ll/cad0;

    .line 13
    .line 14
    :cond_0
    new-instance v0, Ll/zit;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ll/zit;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/zit;->c(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object p1, v0, Ll/hyr;->a:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, "showH5"

    .line 29
    .line 30
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/tbd0;->Y0(Ll/zit;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    iget-object p1, v0, Ll/hyr;->a:Ljava/lang/String;

    .line 41
    .line 42
    const-string v1, "showProfilePage"

    .line 43
    .line 44
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ll/tbd0;->W0(Ll/zit;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_3
    iget-object p1, v0, Ll/hyr;->a:Ljava/lang/String;

    .line 55
    .line 56
    const-string v0, "showTTCoinDialog"

    .line 57
    .line 58
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_4

    .line 63
    .line 64
    iget-object p0, p0, Ll/tbd0;->i:Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    const-string p1, "live"

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    invoke-static {p0, p1, v0}, Ll/mbs;->e0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 70
    .line 71
    .line 72
    :cond_4
    :goto_0
    return-void
.end method

.method public P0(Ll/ycd0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/ycd0;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/tbd0;->X0(Ll/ycd0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Q0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/vbd0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/tbd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/vbd0;->k(Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public R0(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/tbd0;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/tbd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 7
    .line 8
    invoke-static {v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->requestRightBindAnchors(Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance p2, Ll/qbd0;

    .line 13
    .line 14
    invoke-direct {p2}, Ll/qbd0;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance p3, Ll/rbd0;

    .line 18
    .line 19
    invoke-direct {p3}, Ll/rbd0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p2, p3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    iput-boolean p1, p0, Ll/tbd0;->h:Z

    .line 31
    .line 32
    return-void
.end method

.method public S0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/vbd0;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/vbd0;->i(Z)Ll/dbd0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ll/tbd0;->U0(Ll/dbd0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final U0(Ll/dbd0;)V
    .locals 7
    .param p1    # Ll/dbd0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/tbd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    iget-object v1, p0, Ll/tbd0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/tbd0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p0, Ll/tbd0;->e:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v4, p0, Ll/tbd0;->d:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v5, p0, Ll/tbd0;->j:Ljava/lang/String;

    .line 12
    .line 13
    move-object v6, p1

    .line 14
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getUserRightList(Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/dbd0;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Ll/kbd0;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/kbd0;-><init>(Ll/tbd0;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Ll/lbd0;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/lbd0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    if-eqz v6, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Ll/vbd0;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/vbd0;->j()V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public V0(Ll/d9d0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tbd0;->f:Ll/iad0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/iad0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/tbd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v0, v1, v2, p0}, Ll/iad0;-><init>(Lcom/p1/mobile/putong/live/base/bean/UserRightType;Lcom/p1/mobile/android/app/Act;Ll/tbd0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/tbd0;->f:Ll/iad0;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/tbd0;->f:Ll/iad0;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/iad0;->k(Ll/d9d0;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightId:Ljava/lang/String;

    .line 26
    .line 27
    const-string v0, ""

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {p0, p1, v0, v1}, Ll/tbd0;->R0(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p0, Ll/vbd0;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/vbd0;->j()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final W0(Ll/zit;)V
    .locals 2

    .line 1
    const-string v0, "userId"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "from"

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Ll/tbd0;->i:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {p0, v0, p1, v1}, Ll/mbs;->k0(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final X0(Ll/ycd0;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserLiveSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/ycd0;->isChecked()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-static {v0}, Ll/mbs;->N(Lcom/p1/mobile/putong/data/UserLiveSettings;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/mbd0;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Ll/mbd0;-><init>(Ll/tbd0;Ll/ycd0;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/nbd0;

    .line 30
    .line 31
    invoke-direct {v2, p0, p1}, Ll/nbd0;-><init>(Ll/tbd0;Ll/ycd0;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final Y0(Ll/zit;)V
    .locals 2

    .line 1
    const-string v0, "H5Url"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const-string v0, "h5Url"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/tbd0;->g:Ll/cad0;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/cad0;->k(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/tbd0;->U0(Ll/dbd0;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/fk3;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/fk3;->x()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/ebd0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ebd0;-><init>(Ll/tbd0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tbd0;->g:Ll/cad0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cad0;->i()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t0(Ll/d9d0;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/d9d0;->L()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveScrapCraftReq;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveScrapCraftReq;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "rightTab"

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapCraftReq;->source:Ljava/lang/String;

    .line 25
    .line 26
    const-string v1, "live"

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapCraftReq;->scenario:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Ll/tbd0;->c:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapCraftReq;->roomId:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Ll/tbd0;->b:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapCraftReq;->liveId:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Ll/tbd0;->e:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapCraftReq;->anchorId:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightId:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapCraftReq;->targetItemId:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapCraftReq;->originalId:Ljava/lang/String;

    .line 57
    .line 58
    sget-object v1, Ll/tbs;->f:Ll/j6t;

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/j6t;->h()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveScrapCraftReq;->fakeId:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->scrapInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;

    .line 69
    .line 70
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightScrapInfo;->itemId:J

    .line 71
    .line 72
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->craftScrapToItem(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveScrapCraftReq;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance v0, Ll/obd0;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/obd0;-><init>(Ll/tbd0;)V

    .line 87
    .line 88
    .line 89
    new-instance p0, Ll/pbd0;

    .line 90
    .line 91
    invoke-direct {p0}, Ll/pbd0;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    :cond_1
    :goto_0
    return-void
.end method

.method public u0(Ll/d9d0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tbd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->CALL_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/z8d0;

    .line 8
    .line 9
    iget-object v1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->userRightId:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v2, p1, Ll/d9d0;->g:Ljava/lang/String;

    .line 14
    .line 15
    const-string v3, ""

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, v3}, Ll/z8d0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance v0, Ll/z8d0;

    .line 22
    .line 23
    iget-object v1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->userRightId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ll/z8d0;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast v1, Ll/vbd0;

    .line 33
    .line 34
    iget-boolean v2, p1, Ll/d9d0;->h:Z

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ll/vbd0;->i(Z)Ll/dbd0;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v2, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 41
    .line 42
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isEquipped()Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Ll/tbd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 49
    .line 50
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->unEquipUserRight(Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ll/z8d0;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance v0, Ll/sbd0;

    .line 59
    .line 60
    invoke-direct {v0, p0, v1}, Ll/sbd0;-><init>(Ll/tbd0;Ll/dbd0;)V

    .line 61
    .line 62
    .line 63
    new-instance v2, Ll/fbd0;

    .line 64
    .line 65
    invoke-direct {v2, p0, v1}, Ll/fbd0;-><init>(Ll/tbd0;Ll/dbd0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    iget-object v2, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 77
    .line 78
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isActive()Z

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    if-eqz v2, :cond_2

    .line 83
    .line 84
    iget-object p1, p0, Ll/tbd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 85
    .line 86
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->equipUserRight(Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ll/z8d0;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance v0, Ll/gbd0;

    .line 95
    .line 96
    invoke-direct {v0, p0, v1}, Ll/gbd0;-><init>(Ll/tbd0;Ll/dbd0;)V

    .line 97
    .line 98
    .line 99
    new-instance v2, Ll/hbd0;

    .line 100
    .line 101
    invoke-direct {v2, p0, v1}, Ll/hbd0;-><init>(Ll/tbd0;Ll/dbd0;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v0, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_2
    iget-object p1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 113
    .line 114
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->canActive()Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_3

    .line 119
    .line 120
    iget-object p1, p0, Ll/tbd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 121
    .line 122
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->activeUserRight(Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ll/z8d0;)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    new-instance v0, Ll/ibd0;

    .line 131
    .line 132
    invoke-direct {v0, p0, v1}, Ll/ibd0;-><init>(Ll/tbd0;Ll/dbd0;)V

    .line 133
    .line 134
    .line 135
    new-instance v2, Ll/jbd0;

    .line 136
    .line 137
    invoke-direct {v2, p0, v1}, Ll/jbd0;-><init>(Ll/tbd0;Ll/dbd0;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v0, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 145
    .line 146
    .line 147
    :cond_3
    return-void
.end method

.method public final x0(Ll/dbd0;Ljava/lang/Throwable;I)V
    .locals 0

    .line 1
    invoke-static {p3}, Ll/o1j0;->w(I)V

    .line 2
    .line 3
    .line 4
    instance-of p3, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    iget p2, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 11
    .line 12
    const p3, 0xa541

    .line 13
    .line 14
    .line 15
    if-ne p2, p3, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/tbd0;->U0(Ll/dbd0;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final y0(Lcom/p1/mobile/android/app/Frag;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    const-string v0, "right_type"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/tbd0;->a:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 18
    .line 19
    const-string v0, "liveId"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/tbd0;->b:Ljava/lang/String;

    .line 26
    .line 27
    const-string v0, "roomId"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Ll/tbd0;->c:Ljava/lang/String;

    .line 34
    .line 35
    const-string v0, "anchor_name"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/tbd0;->d:Ljava/lang/String;

    .line 42
    .line 43
    const-string v0, "anchor_id"

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Ll/tbd0;->e:Ljava/lang/String;

    .line 50
    .line 51
    const-string v0, "live_type"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v0, "voice-live"

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    sget-object p1, Ll/k9d0;->b:Ljava/lang/String;

    .line 66
    .line 67
    iput-object p1, p0, Ll/tbd0;->j:Ljava/lang/String;

    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    const-string v0, "live"

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_1

    .line 77
    .line 78
    sget-object p1, Ll/k9d0;->a:Ljava/lang/String;

    .line 79
    .line 80
    iput-object p1, p0, Ll/tbd0;->j:Ljava/lang/String;

    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public z0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tbd0;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method
