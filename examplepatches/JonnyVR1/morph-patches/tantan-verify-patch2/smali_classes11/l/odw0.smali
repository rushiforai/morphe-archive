.class public final Ll/odw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/efu0;
.implements Ll/f7u0;
.implements Ll/pfu0;


# instance fields
.field public final a:Ll/cew0;

.field public final b:Ll/rdw0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/cew0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/odw0;->a:Ll/cew0;

    .line 5
    .line 6
    const/16 p2, 0xd

    .line 7
    .line 8
    invoke-static {p1, p2}, Ll/qdw0;->a(Landroid/content/Context;I)Ll/rdw0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/odw0;->b:Ll/rdw0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final k(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 1

    .line 1
    sget-object v0, Ll/ris0;->d:Ll/kis0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/odw0;->a:Ll/cew0;

    .line 16
    .line 17
    iget-object p0, p0, Ll/odw0;->b:Ll/rdw0;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/google/android/gms/ads/internal/client/zze;->F()Ll/b70;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/b70;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p0, p1}, Ll/rdw0;->zzc(Ljava/lang/String;)Ll/rdw0;

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-interface {p0, p1}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final zza()V
    .locals 0

    .line 1
    return-void
.end method

.method public final zzb()V
    .locals 2

    .line 1
    sget-object v0, Ll/ris0;->d:Ll/kis0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/odw0;->a:Ll/cew0;

    .line 16
    .line 17
    iget-object p0, p0, Ll/odw0;->b:Ll/rdw0;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-interface {p0, v1}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final zzk()V
    .locals 0

    .line 1
    return-void
.end method

.method public final zzl()V
    .locals 1

    .line 1
    sget-object v0, Ll/ris0;->d:Ll/kis0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/odw0;->b:Ll/rdw0;

    .line 16
    .line 17
    invoke-interface {p0}, Ll/rdw0;->zzh()Ll/rdw0;

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
