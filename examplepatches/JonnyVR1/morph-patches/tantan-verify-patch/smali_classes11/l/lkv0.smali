.class public final Ll/lkv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dsx;


# instance fields
.field public final a:Ll/xks0;

.field public final b:Ll/vcl0;

.field public final c:Ll/bms0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/xks0;Ll/bms0;)V
    .locals 1
    .param p2    # Ll/bms0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vcl0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/vcl0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/lkv0;->b:Ll/vcl0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/lkv0;->a:Ll/xks0;

    .line 12
    .line 13
    iput-object p2, p0, Ll/lkv0;->c:Ll/bms0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/lkv0;->a:Ll/xks0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xks0;->zzl()Z

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public final b()Landroid/graphics/drawable/Drawable;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/lkv0;->a:Ll/xks0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xks0;->zzi()Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    return-object p0

    .line 16
    :catch_0
    move-exception p0

    .line 17
    const-string v0, ""

    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final c()F
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/lkv0;->a:Ll/xks0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xks0;->zze()F

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public final d()Ll/xks0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lkv0;->a:Ll/xks0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zza()Ll/bms0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/lkv0;->c:Ll/bms0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzb()Z
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/lkv0;->a:Ll/xks0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/xks0;->zzk()Z

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0
.end method
