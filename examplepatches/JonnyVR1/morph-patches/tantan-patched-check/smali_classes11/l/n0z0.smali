.class public final Ll/n0z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/n5z0;


# instance fields
.field public final a:Ll/n5z0;

.field public final b:Ll/t2u0;


# direct methods
.method public constructor <init>(Ll/n5z0;Ll/t2u0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n0z0;->a:Ll/n5z0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/n0z0;->b:Ll/t2u0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final e(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n0z0;->a:Ll/n5z0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/r5z0;->e(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ll/n0z0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Ll/n0z0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/n0z0;->a:Ll/n5z0;

    .line 14
    .line 15
    iget-object v3, p1, Ll/n0z0;->a:Ll/n5z0;

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object p0, p0, Ll/n0z0;->b:Ll/t2u0;

    .line 24
    .line 25
    iget-object p1, p1, Ll/n0z0;->b:Ll/t2u0;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/t2u0;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    return v0

    .line 34
    :cond_2
    return v2
.end method

.method public final hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n0z0;->b:Ll/t2u0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/t2u0;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit16 v0, v0, 0x20f

    .line 8
    .line 9
    iget-object p0, p0, Ll/n0z0;->a:Ll/n5z0;

    .line 10
    .line 11
    mul-int/lit8 v0, v0, 0x1f

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    add-int/2addr v0, p0

    .line 18
    return v0
.end method

.method public final zza(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n0z0;->a:Ll/n5z0;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-interface {p0, p1}, Ll/r5z0;->zza(I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public final zzc()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n0z0;->a:Ll/n5z0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/r5z0;->zzc()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final zzd(I)Ll/sqr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n0z0;->a:Ll/n5z0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/r5z0;->zzd(I)Ll/sqr0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final zze()Ll/t2u0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n0z0;->b:Ll/t2u0;

    .line 2
    .line 3
    return-object p0
.end method
