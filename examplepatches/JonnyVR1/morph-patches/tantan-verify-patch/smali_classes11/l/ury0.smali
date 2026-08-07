.class public final Ll/ury0;
.super Ll/fuu0;
.source "SourceFile"


# instance fields
.field public i:[I
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:[I
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fuu0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/nio/ByteBuffer;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ury0;->j:[I

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    sub-int v3, v2, v1

    .line 15
    .line 16
    iget-object v4, p0, Ll/fuu0;->b:Ll/mqu0;

    .line 17
    .line 18
    iget v4, v4, Ll/mqu0;->d:I

    .line 19
    .line 20
    div-int/2addr v3, v4

    .line 21
    iget-object v4, p0, Ll/fuu0;->c:Ll/mqu0;

    .line 22
    .line 23
    iget v4, v4, Ll/mqu0;->d:I

    .line 24
    .line 25
    mul-int/2addr v3, v4

    .line 26
    invoke-virtual {p0, v3}, Ll/fuu0;->d(I)Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    :goto_0
    if-ge v1, v2, :cond_1

    .line 31
    .line 32
    array-length v4, v0

    .line 33
    const/4 v5, 0x0

    .line 34
    :goto_1
    if-ge v5, v4, :cond_0

    .line 35
    .line 36
    aget v6, v0, v5

    .line 37
    .line 38
    add-int/2addr v6, v6

    .line 39
    add-int/2addr v6, v1

    .line 40
    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->getShort(I)S

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    add-int/lit8 v5, v5, 0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    iget-object v4, p0, Ll/fuu0;->b:Ll/mqu0;

    .line 51
    .line 52
    iget v4, v4, Ll/mqu0;->d:I

    .line 53
    .line 54
    add-int/2addr v1, v4

    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final c(Ll/mqu0;)Ll/mqu0;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzds;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ury0;->i:[I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/mqu0;->e:Ll/mqu0;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget v0, p1, Ll/mqu0;->c:I

    .line 9
    .line 10
    const-string v1, "Unhandled input format:"

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    if-ne v0, v2, :cond_6

    .line 14
    .line 15
    iget v0, p1, Ll/mqu0;->b:I

    .line 16
    .line 17
    array-length v3, p0

    .line 18
    const/4 v4, 0x0

    .line 19
    const/4 v5, 0x1

    .line 20
    if-eq v0, v3, :cond_1

    .line 21
    .line 22
    move v0, v5

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move v0, v4

    .line 25
    :goto_0
    move v3, v4

    .line 26
    :goto_1
    array-length v6, p0

    .line 27
    if-ge v3, v6, :cond_4

    .line 28
    .line 29
    aget v6, p0, v3

    .line 30
    .line 31
    iget v7, p1, Ll/mqu0;->b:I

    .line 32
    .line 33
    if-ge v6, v7, :cond_3

    .line 34
    .line 35
    if-eq v6, v3, :cond_2

    .line 36
    .line 37
    move v6, v5

    .line 38
    goto :goto_2

    .line 39
    :cond_2
    move v6, v4

    .line 40
    :goto_2
    or-int/2addr v0, v6

    .line 41
    add-int/lit8 v3, v3, 0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_3
    new-instance p0, Lcom/google/android/gms/internal/ads/zzds;

    .line 45
    .line 46
    invoke-direct {p0, v1, p1}, Lcom/google/android/gms/internal/ads/zzds;-><init>(Ljava/lang/String;Ll/mqu0;)V

    .line 47
    .line 48
    .line 49
    throw p0

    .line 50
    :cond_4
    if-eqz v0, :cond_5

    .line 51
    .line 52
    new-instance p0, Ll/mqu0;

    .line 53
    .line 54
    iget p1, p1, Ll/mqu0;->a:I

    .line 55
    .line 56
    invoke-direct {p0, p1, v6, v2}, Ll/mqu0;-><init>(III)V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_5
    sget-object p0, Ll/mqu0;->e:Ll/mqu0;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_6
    new-instance p0, Lcom/google/android/gms/internal/ads/zzds;

    .line 64
    .line 65
    invoke-direct {p0, v1, p1}, Lcom/google/android/gms/internal/ads/zzds;-><init>(Ljava/lang/String;Ll/mqu0;)V

    .line 66
    .line 67
    .line 68
    throw p0
.end method

.method public final e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ury0;->i:[I

    .line 2
    .line 3
    iput-object v0, p0, Ll/ury0;->j:[I

    .line 4
    .line 5
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/ury0;->j:[I

    .line 3
    .line 4
    iput-object v0, p0, Ll/ury0;->i:[I

    .line 5
    .line 6
    return-void
.end method

.method public final i([I)V
    .locals 0
    .param p1    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/ury0;->i:[I

    .line 2
    .line 3
    return-void
.end method
