.class public Ll/bp00;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/pp00;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ll/v500;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/bp00;->d:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Ll/bp00;->e:Z

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic e0(Ll/bp00;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bp00;->o0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic f0(Ll/bp00;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bp00;->p0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/bp00;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bp00;->r0(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic h0(Ll/bp00;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bp00;->s0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i0(Ll/bp00;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bp00;->q0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private m0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/ln7;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/yo00;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/yo00;-><init>(Ll/bp00;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private synthetic p0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/pp00;

    .line 4
    .line 5
    iget-object v0, p0, Ll/bp00;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/bp00;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0, p0}, Ll/pp00;->A(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic q0(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget-boolean p1, p0, Ll/bp00;->d:Z

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Ll/pp00;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/pp00;->z()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Ll/bp00;->d:Z

    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 21
    .line 22
    if-ne p1, v0, :cond_3

    .line 23
    .line 24
    iget-boolean p1, p0, Ll/bp00;->e:Z

    .line 25
    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object p1, p1, Ll/dkb;->P6:Ljava/util/Map;

    .line 33
    .line 34
    iget-object v0, p0, Ll/bp00;->a:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast v1, Ll/pp00;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/pp00;->x()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    :cond_2
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 52
    .line 53
    .line 54
    :cond_3
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wo00;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/wo00;-><init>(Ll/bp00;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ll/bp00;->m0()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/xo00;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/xo00;-><init>(Ll/bp00;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public j0()Ll/v500;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bp00;->c:Ll/v500;

    .line 2
    .line 3
    return-object p0
.end method

.method public k0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bp00;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bp00;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bp00;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string p2, "from_state"

    .line 6
    .line 7
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    new-instance p2, Ll/y500;

    .line 14
    .line 15
    invoke-direct {p2, p1}, Ll/y500;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Ll/bp00;->c:Ll/v500;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public n0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 16
    .line 17
    const-string p1, "default"

    .line 18
    .line 19
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final synthetic o0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/pp00;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/pp00;->w()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bp00;->j0()Ll/v500;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/bp00;->j0()Ll/v500;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0, p0, p1}, Ll/v500;->i(Ll/bp00;Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Ll/bp00;->x0(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic s0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bp00;->j0()Ll/v500;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/bp00;->j0()Ll/v500;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0, p0}, Ll/v500;->f(Ll/bp00;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Ll/bp00;->u0(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public t0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/bp00;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/bp00;->j0()Ll/v500;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/bp00;->j0()Ll/v500;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Ll/v500;->a()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1, v0}, Ll/o0b0;->i(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const-string v1, "\u79c1\u4fe1\u53d1\u9001\u5931\u8d25"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/o0b0;->i(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public u0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->isIllegalContent(Ljava/lang/Throwable;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/core/R$string;->L7:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/4 p1, 0x1

    .line 28
    invoke-virtual {p0, p1}, Ll/bp00;->y0(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public x0(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/bp00;->e:Z

    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    iget-object p1, p1, Ll/dkb;->P6:Ljava/util/Map;

    .line 9
    .line 10
    iget-object v0, p0, Ll/bp00;->a:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, ""

    .line 13
    .line 14
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Ll/bp00;->y0(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public y0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bp00;->c:Ll/v500;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/bp00;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {v0, p1, v1, p0}, Ll/v500;->e(ILjava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object p0, p0, Ll/dkb;->d7:Lrx/subjects/b;

    .line 20
    .line 21
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public z0(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 33
    .line 34
    .line 35
    const/4 p1, 0x2

    .line 36
    invoke-virtual {p0, p1}, Ll/bp00;->y0(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isNameFake()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 58
    .line 59
    .line 60
    const/4 p1, 0x3

    .line 61
    invoke-virtual {p0, p1}, Ll/bp00;->y0(I)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 70
    .line 71
    iget-object p1, p0, Ll/bp00;->c:Ll/v500;

    .line 72
    .line 73
    if-eqz p1, :cond_2

    .line 74
    .line 75
    invoke-interface {p1, v0}, Ll/v500;->d(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    const-string p1, "moment_comment"

    .line 80
    .line 81
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 86
    .line 87
    iget-object p1, p0, Ll/bp00;->a:Ljava/lang/String;

    .line 88
    .line 89
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageReference;->new_()Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const-string v1, "comment"

    .line 96
    .line 97
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MomentAction;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 102
    .line 103
    iget-object v1, p0, Ll/bp00;->a:Ljava/lang/String;

    .line 104
    .line 105
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 106
    .line 107
    const-string v1, "moment"

    .line 108
    .line 109
    iput-object v1, p1, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 110
    .line 111
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 112
    .line 113
    :goto_0
    invoke-virtual {p0}, Ll/bp00;->j0()Ll/v500;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    if-eqz p1, :cond_3

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/bp00;->j0()Ll/v500;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-interface {p1}, Ll/v500;->b()Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    :cond_3
    iget-object p1, p0, Ll/bp00;->b:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {p0, p1}, Ll/bp00;->n0(Ljava/lang/String;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_5

    .line 134
    .line 135
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 136
    .line 137
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 138
    .line 139
    iget-object v1, p0, Ll/bp00;->b:Ljava/lang/String;

    .line 140
    .line 141
    const/4 v2, 0x0

    .line 142
    invoke-virtual {p1, v1, v0, v2}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    new-instance v0, Ll/zo00;

    .line 151
    .line 152
    invoke-direct {v0, p0}, Ll/zo00;-><init>(Ll/bp00;)V

    .line 153
    .line 154
    .line 155
    new-instance v1, Ll/ap00;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Ll/ap00;-><init>(Ll/bp00;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 165
    .line 166
    .line 167
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-nez p1, :cond_4

    .line 172
    .line 173
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 185
    .line 186
    .line 187
    const/4 p1, 0x1

    .line 188
    invoke-virtual {p0, p1}, Ll/bp00;->y0(I)V

    .line 189
    .line 190
    .line 191
    :cond_4
    return-void

    .line 192
    :cond_5
    invoke-virtual {p0}, Ll/bp00;->t0()V

    .line 193
    .line 194
    .line 195
    return-void
.end method
