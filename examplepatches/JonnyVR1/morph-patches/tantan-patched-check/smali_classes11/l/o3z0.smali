.class public Ll/o3z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/n5z0;


# instance fields
.field public final a:Ll/t2u0;

.field public final b:I

.field public final c:[I

.field public final d:[Ll/sqr0;

.field public e:I


# direct methods
.method public constructor <init>(Ll/t2u0;[II)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    array-length p3, p2

    .line 5
    const/4 v0, 0x0

    .line 6
    if-lez p3, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v1, v0

    .line 11
    :goto_0
    invoke-static {v1}, Ll/lev0;->f(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/o3z0;->a:Ll/t2u0;

    .line 18
    .line 19
    iput p3, p0, Ll/o3z0;->b:I

    .line 20
    .line 21
    new-array p3, p3, [Ll/sqr0;

    .line 22
    .line 23
    iput-object p3, p0, Ll/o3z0;->d:[Ll/sqr0;

    .line 24
    .line 25
    move p3, v0

    .line 26
    :goto_1
    array-length v1, p2

    .line 27
    iget-object v2, p0, Ll/o3z0;->d:[Ll/sqr0;

    .line 28
    .line 29
    if-ge p3, v1, :cond_1

    .line 30
    .line 31
    aget v1, p2, p3

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    aput-object v1, v2, p3

    .line 38
    .line 39
    add-int/lit8 p3, p3, 0x1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    sget-object p2, Ll/n3z0;->a:Ll/n3z0;

    .line 43
    .line 44
    invoke-static {v2, p2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 45
    .line 46
    .line 47
    iget p2, p0, Ll/o3z0;->b:I

    .line 48
    .line 49
    new-array p2, p2, [I

    .line 50
    .line 51
    iput-object p2, p0, Ll/o3z0;->c:[I

    .line 52
    .line 53
    :goto_2
    iget p2, p0, Ll/o3z0;->b:I

    .line 54
    .line 55
    if-ge v0, p2, :cond_2

    .line 56
    .line 57
    iget-object p2, p0, Ll/o3z0;->c:[I

    .line 58
    .line 59
    iget-object p3, p0, Ll/o3z0;->d:[Ll/sqr0;

    .line 60
    .line 61
    aget-object p3, p3, v0

    .line 62
    .line 63
    invoke-virtual {p1, p3}, Ll/t2u0;->a(Ll/sqr0;)I

    .line 64
    .line 65
    .line 66
    move-result p3

    .line 67
    aput p3, p2, v0

    .line 68
    .line 69
    add-int/lit8 v0, v0, 0x1

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    return-void
.end method


# virtual methods
.method public final e(I)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Ll/o3z0;->b:I

    .line 3
    .line 4
    if-ge v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v1, p0, Ll/o3z0;->c:[I

    .line 7
    .line 8
    aget v1, v1, v0

    .line 9
    .line 10
    if-ne v1, p1, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 p0, -0x1

    .line 17
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
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Ll/o3z0;

    .line 20
    .line 21
    iget-object v2, p0, Ll/o3z0;->a:Ll/t2u0;

    .line 22
    .line 23
    iget-object v3, p1, Ll/o3z0;->a:Ll/t2u0;

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ll/t2u0;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Ll/o3z0;->c:[I

    .line 32
    .line 33
    iget-object p1, p1, Ll/o3z0;->c:[I

    .line 34
    .line 35
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([I[I)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    return v0

    .line 42
    :cond_2
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Ll/o3z0;->e:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/o3z0;->a:Ll/t2u0;

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    mul-int/lit8 v0, v0, 0x1f

    .line 12
    .line 13
    iget-object v1, p0, Ll/o3z0;->c:[I

    .line 14
    .line 15
    invoke-static {v1}, Ljava/util/Arrays;->hashCode([I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    add-int/2addr v0, v1

    .line 20
    iput v0, p0, Ll/o3z0;->e:I

    .line 21
    .line 22
    :cond_0
    return v0
.end method

.method public final zza(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o3z0;->c:[I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    aget p0, p0, p1

    .line 5
    .line 6
    return p0
.end method

.method public final zzc()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o3z0;->c:[I

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public final zzd(I)Ll/sqr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o3z0;->d:[Ll/sqr0;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public final zze()Ll/t2u0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o3z0;->a:Ll/t2u0;

    .line 2
    .line 3
    return-object p0
.end method
