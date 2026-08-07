.class public final Ll/az80;
.super Ll/yi2;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\t\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\u0008J\u000f\u0010\n\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u0008J\u000f\u0010\u000b\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u0008J\u0019\u0010\u000e\u001a\u00020\u00062\u0008\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Ll/az80;",
        "Ll/yi2;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "s0",
        "()V",
        "destroy",
        "a0",
        "k0",
        "",
        "showPurchaseDialog",
        "e0",
        "(Ljava/lang/Boolean;)V",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/yi2;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static l0(Lcom/p1/mobile/putong/data/Envelope;)Lrx/c;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yna;->P3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static n0(Ll/az80;Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/yi2;->j0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static p0(Ll/az80;Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;->hasIdealTypesSelected()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    invoke-virtual {p0, v0}, Ll/yi2;->i0(Z)V

    .line 10
    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/m8h0;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;->clone()Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/m8h0;->h0(Lcom/p1/mobile/putong/core/data/PrivateCustomSetting;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public static q0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static r0(Ll/az80;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/m8h0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/m8h0;->r()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/az80;->s0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private final s0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/m8h0;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Ll/m8h0;->i0(I)V

    .line 7
    .line 8
    .line 9
    const-string p0, "e_custom_set_start"

    .line 10
    .line 11
    const-string v0, "p_custom_set_pop"

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
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
    new-instance v0, Ll/ty80;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ty80;-><init>(Ll/az80;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/yna;->P3()Lrx/c;

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
    new-instance v1, Ll/uy80;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/uy80;-><init>(Ll/az80;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/vy80;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/vy80;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e0(Ljava/lang/Boolean;)V
    .locals 1
    .param p1    # Ljava/lang/Boolean;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/joa;->J3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yi2;->h0()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/yi2;->g0()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const-string p1, "\u60a8\u7684\u5b9a\u5236\u5df2\u66f4\u65b0\uff0c\u5c06\u4e8e\u660e\u5929\u751f\u6548"

    .line 20
    .line 21
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_3

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 41
    .line 42
    .line 43
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 44
    .line 45
    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/yna;->U3()V

    .line 56
    .line 57
    .line 58
    :cond_3
    return-void
.end method

.method public k0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/joa;->J3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v1, Ll/m8h0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/m8h0;->p()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Ll/m8h0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/m8h0;->n()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, v1, p0}, Ll/yna;->p3(Ljava/util/List;Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 34
    .line 35
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast v1, Ll/m8h0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/m8h0;->s()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 44
    .line 45
    check-cast v2, Ll/m8h0;

    .line 46
    .line 47
    invoke-virtual {v2}, Ll/m8h0;->n()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v0, v1, v2}, Ll/yna;->V3(Ljava/util/List;Ljava/util/List;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/wy80;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/wy80;-><init>()V

    .line 62
    .line 63
    .line 64
    new-instance v2, Ll/xy80;

    .line 65
    .line 66
    invoke-direct {v2, v1}, Ll/xy80;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/yy80;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/yy80;-><init>(Ll/az80;)V

    .line 76
    .line 77
    .line 78
    new-instance p0, Ll/zy80;

    .line 79
    .line 80
    invoke-direct {p0}, Ll/zy80;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    return-void
.end method
