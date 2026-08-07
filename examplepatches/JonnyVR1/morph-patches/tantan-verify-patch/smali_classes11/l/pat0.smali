.class public final Ll/pat0;
.super Ll/skt0;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/google/android/gms/internal/measurement/zzco;

.field public c:Lcom/google/android/gms/internal/measurement/zzcn;

.field public d:B


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/skt0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/internal/measurement/zzcn;)Ll/skt0;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/pat0;->c:Lcom/google/android/gms/internal/measurement/zzcn;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null filePurpose"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final b(Lcom/google/android/gms/internal/measurement/zzco;)Ll/skt0;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/pat0;->b:Lcom/google/android/gms/internal/measurement/zzco;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "Null fileChecks"

    .line 7
    .line 8
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final c(Z)Ll/skt0;
    .locals 0

    .line 1
    iget-byte p1, p0, Ll/pat0;->d:B

    .line 2
    .line 3
    or-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    int-to-byte p1, p1

    .line 6
    iput-byte p1, p0, Ll/pat0;->d:B

    .line 7
    .line 8
    return-object p0
.end method

.method public final d()Ll/bmt0;
    .locals 10

    .line 1
    iget-byte v0, p0, Ll/pat0;->d:B

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Ll/pat0;->a:Ljava/lang/String;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/pat0;->b:Lcom/google/android/gms/internal/measurement/zzco;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/pat0;->c:Lcom/google/android/gms/internal/measurement/zzcn;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance v2, Ll/xbt0;

    .line 20
    .line 21
    iget-object v3, p0, Ll/pat0;->a:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v5, p0, Ll/pat0;->b:Lcom/google/android/gms/internal/measurement/zzco;

    .line 24
    .line 25
    iget-object v8, p0, Ll/pat0;->c:Lcom/google/android/gms/internal/measurement/zzcn;

    .line 26
    .line 27
    const/4 v9, 0x0

    .line 28
    const/4 v4, 0x0

    .line 29
    const/4 v6, 0x0

    .line 30
    const/4 v7, 0x0

    .line 31
    invoke-direct/range {v2 .. v9}, Ll/xbt0;-><init>(Ljava/lang/String;ZLcom/google/android/gms/internal/measurement/zzco;Ll/h9t0;Ll/d8t0;Lcom/google/android/gms/internal/measurement/zzcn;Ll/let0;)V

    .line 32
    .line 33
    .line 34
    return-object v2

    .line 35
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Ll/pat0;->a:Ljava/lang/String;

    .line 41
    .line 42
    if-nez v2, :cond_2

    .line 43
    .line 44
    const-string v2, " fileOwner"

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-byte v2, p0, Ll/pat0;->d:B

    .line 50
    .line 51
    and-int/2addr v1, v2

    .line 52
    if-nez v1, :cond_3

    .line 53
    .line 54
    const-string v1, " hasDifferentDmaOwner"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object v1, p0, Ll/pat0;->b:Lcom/google/android/gms/internal/measurement/zzco;

    .line 60
    .line 61
    if-nez v1, :cond_4

    .line 62
    .line 63
    const-string v1, " fileChecks"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    :cond_4
    iget-object p0, p0, Ll/pat0;->c:Lcom/google/android/gms/internal/measurement/zzcn;

    .line 69
    .line 70
    if-nez p0, :cond_5

    .line 71
    .line 72
    const-string p0, " filePurpose"

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    :cond_5
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string v0, "Missing required properties:"

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    const/4 p0, 0x0

    .line 91
    return-object p0
.end method

.method public final e(Ljava/lang/String;)Ll/skt0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pat0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
