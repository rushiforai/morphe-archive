.class public final Ll/yqu0;
.super Ll/ams0;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/ulu0;

.field public c:Ll/anu0;

.field public d:Ll/ilu0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/ulu0;Ll/anu0;Ll/ilu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ams0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yqu0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/yqu0;->c:Ll/anu0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/yqu0;->d:Ll/ilu0;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic p8(Ll/yqu0;)Ll/ilu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqu0;->d:Ll/ilu0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final B(Ljava/lang/String;)Ll/als0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ulu0;->U()Ll/oof0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/als0;

    .line 12
    .line 13
    return-object p0
.end method

.method public final H(Ll/p1m;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/yqu0;->c:Ll/anu0;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    check-cast p1, Landroid/view/ViewGroup;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/anu0;->f(Landroid/view/ViewGroup;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/ulu0;->d0()Ll/wit0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "_videoMediaView"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/yqu0;->q8(Ljava/lang/String;)Ll/pks0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p1, p0}, Ll/wit0;->F(Ll/pks0;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public final a()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqu0;->d:Ll/ilu0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ilu0;->D()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return v1

    .line 14
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/ulu0;->e0()Ll/wit0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    return v1

    .line 23
    :cond_2
    iget-object p0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ulu0;->f0()Ll/wit0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    return v1

    .line 32
    :cond_3
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public final c5(Ll/p1m;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    instance-of v0, p1, Landroid/view/View;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/ulu0;->h0()Ll/hfw0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/yqu0;->d:Ll/ilu0;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    check-cast p1, Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/ilu0;->q(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public final d4(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ulu0;->V()Ll/oof0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/oof0;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public final o0(Ll/p1m;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    instance-of v0, p1, Landroid/view/ViewGroup;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/yqu0;->c:Ll/anu0;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    check-cast p1, Landroid/view/ViewGroup;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/anu0;->g(Landroid/view/ViewGroup;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/ulu0;->f0()Ll/wit0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "_videoMediaView"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/yqu0;->q8(Ljava/lang/String;)Ll/pks0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p1, p0}, Ll/wit0;->F(Ll/pks0;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public final q8(Ljava/lang/String;)Ll/pks0;
    .locals 1

    .line 1
    new-instance p1, Ll/xqu0;

    .line 2
    .line 3
    const-string v0, "_videoMediaView"

    .line 4
    .line 5
    invoke-direct {p1, p0, v0}, Ll/xqu0;-><init>(Ll/yqu0;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public final v(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqu0;->d:Ll/ilu0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ilu0;->m(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final zze()Ll/lpu0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ulu0;->W()Ll/lpu0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final zzf()Ll/xks0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/yqu0;->d:Ll/ilu0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ilu0;->O()Ll/klu0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/klu0;->a()Ll/xks0;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return-object p0

    .line 12
    :catch_0
    move-exception p0

    .line 13
    const-string v0, "InternalNativeCustomTemplateAdShim.getMediaContent"

    .line 14
    .line 15
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1, p0, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final zzh()Ll/p1m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqu0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final zzi()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ulu0;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final zzk()Ljava/util/List;
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ulu0;->U()Ll/oof0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ulu0;->V()Ll/oof0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0}, Ll/oof0;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0}, Ll/oof0;->size()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    add-int/2addr v1, v2

    .line 22
    new-array v1, v1, [Ljava/lang/String;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    move v3, v2

    .line 26
    move v4, v3

    .line 27
    :goto_0
    invoke-virtual {v0}, Ll/oof0;->size()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    if-ge v3, v5, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Ll/oof0;->i(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    check-cast v5, Ljava/lang/String;

    .line 38
    .line 39
    aput-object v5, v1, v4

    .line 40
    .line 41
    add-int/lit8 v4, v4, 0x1

    .line 42
    .line 43
    add-int/lit8 v3, v3, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    :goto_1
    invoke-virtual {p0}, Ll/oof0;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-ge v2, v0, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0, v2}, Ll/oof0;->i(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ljava/lang/String;

    .line 57
    .line 58
    aput-object v0, v1, v4

    .line 59
    .line 60
    add-int/lit8 v4, v4, 0x1

    .line 61
    .line 62
    add-int/lit8 v2, v2, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    return-object p0

    .line 70
    :catch_0
    move-exception p0

    .line 71
    const-string v0, "InternalNativeCustomTemplateAdShim.getAvailableAssetNames"

    .line 72
    .line 73
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1, p0, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    new-instance p0, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    return-object p0
.end method

.method public final zzl()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yqu0;->d:Ll/ilu0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/kzt0;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/yqu0;->d:Ll/ilu0;

    .line 10
    .line 11
    iput-object v0, p0, Ll/yqu0;->c:Ll/anu0;

    .line 12
    .line 13
    return-void
.end method

.method public final zzm()V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ulu0;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "Google"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string p0, "Illegal argument specified for omid partner name."

    .line 16
    .line 17
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    const-string p0, "Not starting OMID session. OM partner name has not been configured."

    .line 28
    .line 29
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    iget-object p0, p0, Ll/yqu0;->d:Ll/ilu0;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p0, v0, v1}, Ll/ilu0;->R(Ljava/lang/String;Z)Ll/hfw0;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    :cond_2
    return-void

    .line 42
    :catch_0
    move-exception p0

    .line 43
    const-string v0, "InternalNativeCustomTemplateAdShim.initializeDisplayOpenMeasurement"

    .line 44
    .line 45
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1, p0, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final zzo()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqu0;->d:Ll/ilu0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ilu0;->p()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final zzt()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ulu0;->h0()Ll/hfw0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/bxy0;->a()Ll/kcv0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1, v0}, Ll/kcv0;->h(Ll/hfw0;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/ulu0;->e0()Ll/wit0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Ll/yqu0;->b:Ll/ulu0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ulu0;->e0()Ll/wit0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ll/l01;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/l01;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v1, "onSdkLoaded"

    .line 36
    .line 37
    invoke-interface {p0, v1, v0}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_1
    const-string p0, "Trying to start OMID session before creation."

    .line 43
    .line 44
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    return p0
.end method
