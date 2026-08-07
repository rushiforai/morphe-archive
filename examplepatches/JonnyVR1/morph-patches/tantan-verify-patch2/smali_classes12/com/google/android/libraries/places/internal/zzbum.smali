.class final Lcom/google/android/libraries/places/internal/zzbum;
.super Ljava/io/InputStream;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzazr;
.implements Lcom/google/android/libraries/places/internal/zzbav;


# instance fields
.field private zza:Lcom/google/android/libraries/places/internal/zzavf;

.field private final zzb:Lcom/google/android/libraries/places/internal/zzavn;

.field private zzc:Ljava/io/ByteArrayInputStream;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzavf;Lcom/google/android/libraries/places/internal/zzavn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/libraries/places/internal/zzbum;->zzb:Lcom/google/android/libraries/places/internal/zzavn;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final available()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavf;->zzaq()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zzc:Ljava/io/ByteArrayInputStream;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->available()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final read()I
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    if-eqz v0, :cond_0

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavf;->zzao()[B

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbum;->zzc:Ljava/io/ByteArrayInputStream;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    :cond_0
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zzc:Ljava/io/ByteArrayInputStream;

    if-eqz p0, :cond_1

    .line 63
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->read()I

    move-result p0

    return p0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public final read([BII)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavf;->zzaq()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 14
    .line 15
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbum;->zzc:Ljava/io/ByteArrayInputStream;

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    if-lt p3, v0, :cond_1

    .line 19
    .line 20
    invoke-static {p1, p2, v0}, Lcom/google/android/libraries/places/internal/zzasx;->zzD([BII)Lcom/google/android/libraries/places/internal/zzasx;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p2, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 25
    .line 26
    invoke-interface {p2, p1}, Lcom/google/android/libraries/places/internal/zzavf;->zzaK(Lcom/google/android/libraries/places/internal/zzasx;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzasx;->zzE()V

    .line 30
    .line 31
    .line 32
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 33
    .line 34
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbum;->zzc:Ljava/io/ByteArrayInputStream;

    .line 35
    .line 36
    return v0

    .line 37
    :cond_1
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 40
    .line 41
    invoke-interface {v3}, Lcom/google/android/libraries/places/internal/zzavf;->zzao()[B

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-direct {v0, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zzc:Ljava/io/ByteArrayInputStream;

    .line 49
    .line 50
    iput-object v2, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 51
    .line 52
    :cond_2
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zzc:Ljava/io/ByteArrayInputStream;

    .line 53
    .line 54
    if-eqz p0, :cond_3

    .line 55
    .line 56
    invoke-virtual {p0, p1, p2, p3}, Ljava/io/ByteArrayInputStream;->read([BII)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0

    .line 61
    :cond_3
    return v1
.end method

.method public final zza(Ljava/io/OutputStream;)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Lcom/google/android/libraries/places/internal/zzavf;->zzaq()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v2, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 11
    .line 12
    invoke-interface {v2, p1}, Lcom/google/android/libraries/places/internal/zzavf;->zzan(Ljava/io/OutputStream;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zzc:Ljava/io/ByteArrayInputStream;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    const-string v3, "outputStream cannot be null!"

    .line 24
    .line 25
    invoke-static {p1, v3}, Lcom/google/android/libraries/places/internal/zzmt;->zzc(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    const/16 v3, 0x2000

    .line 29
    .line 30
    new-array v3, v3, [B

    .line 31
    .line 32
    const-wide/16 v4, 0x0

    .line 33
    .line 34
    :goto_0
    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    const/4 v7, -0x1

    .line 39
    if-ne v6, v7, :cond_1

    .line 40
    .line 41
    long-to-int p1, v4

    .line 42
    iput-object v1, p0, Lcom/google/android/libraries/places/internal/zzbum;->zzc:Ljava/io/ByteArrayInputStream;

    .line 43
    .line 44
    return p1

    .line 45
    :cond_1
    invoke-virtual {p1, v3, v2, v6}, Ljava/io/OutputStream;->write([BII)V

    .line 46
    .line 47
    .line 48
    int-to-long v6, v6

    .line 49
    add-long/2addr v4, v6

    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return v2
.end method

.method public final zzb()Lcom/google/android/libraries/places/internal/zzavf;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zza:Lcom/google/android/libraries/places/internal/zzavf;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "message not available"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final zzc()Lcom/google/android/libraries/places/internal/zzavn;
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbum;->zzb:Lcom/google/android/libraries/places/internal/zzavn;

    return-object p0
.end method
