.class public final Lcom/google/android/libraries/places/internal/zzatp;
.super Lcom/google/android/libraries/places/internal/zzarv;
.source "SourceFile"


# instance fields
.field private final zza:Lcom/google/android/libraries/places/internal/zzatu;


# direct methods
.method public constructor <init>(Lcom/google/android/libraries/places/internal/zzatu;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzarv;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzatp;->zza:Lcom/google/android/libraries/places/internal/zzatu;

    return-void
.end method


# virtual methods
.method public final synthetic zzb(Lcom/google/android/libraries/places/internal/zzasq;Lcom/google/android/libraries/places/internal/zzatf;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/libraries/places/internal/zzauf;
        }
    .end annotation

    .line 1
    sget v0, Lcom/google/android/libraries/places/internal/zzatu;->zzd:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzatp;->zza:Lcom/google/android/libraries/places/internal/zzatu;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzatu;->zzat()Lcom/google/android/libraries/places/internal/zzatu;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :try_start_0
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzavp;->zza()Lcom/google/android/libraries/places/internal/zzavp;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/google/android/libraries/places/internal/zzavp;->zzb(Ljava/lang/Class;)Lcom/google/android/libraries/places/internal/zzavt;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1}, Lcom/google/android/libraries/places/internal/zzasr;->zzq(Lcom/google/android/libraries/places/internal/zzasq;)Lcom/google/android/libraries/places/internal/zzasr;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {v0, p0, p1, p2}, Lcom/google/android/libraries/places/internal/zzavt;->zzf(Ljava/lang/Object;Lcom/google/android/libraries/places/internal/zzavs;Lcom/google/android/libraries/places/internal/zzatf;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0, p0}, Lcom/google/android/libraries/places/internal/zzavt;->zzd(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/android/libraries/places/internal/zzauf; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/google/android/libraries/places/internal/zzawm; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_3

    .line 29
    .line 30
    .line 31
    return-object p0

    .line 32
    :catch_0
    move-exception p1

    .line 33
    goto :goto_0

    .line 34
    :catch_1
    move-exception p1

    .line 35
    goto :goto_1

    .line 36
    :catch_2
    move-exception p1

    .line 37
    goto :goto_2

    .line 38
    :catch_3
    move-exception p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    instance-of p1, p1, Lcom/google/android/libraries/places/internal/zzauf;

    .line 44
    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Lcom/google/android/libraries/places/internal/zzauf;

    .line 52
    .line 53
    throw p0

    .line 54
    :cond_0
    throw p0

    .line 55
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    instance-of p2, p2, Lcom/google/android/libraries/places/internal/zzauf;

    .line 60
    .line 61
    if-eqz p2, :cond_1

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Lcom/google/android/libraries/places/internal/zzauf;

    .line 68
    .line 69
    throw p0

    .line 70
    :cond_1
    new-instance p2, Lcom/google/android/libraries/places/internal/zzauf;

    .line 71
    .line 72
    invoke-direct {p2, p1}, Lcom/google/android/libraries/places/internal/zzauf;-><init>(Ljava/io/IOException;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2, p0}, Lcom/google/android/libraries/places/internal/zzauf;->zzh(Lcom/google/android/libraries/places/internal/zzavf;)Lcom/google/android/libraries/places/internal/zzauf;

    .line 76
    .line 77
    .line 78
    throw p2

    .line 79
    :goto_1
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzawm;->zza()Lcom/google/android/libraries/places/internal/zzauf;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzauf;->zzh(Lcom/google/android/libraries/places/internal/zzavf;)Lcom/google/android/libraries/places/internal/zzauf;

    .line 84
    .line 85
    .line 86
    throw p1

    .line 87
    :goto_2
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzauf;->zzl()Z

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-eqz p2, :cond_2

    .line 92
    .line 93
    new-instance p2, Lcom/google/android/libraries/places/internal/zzauf;

    .line 94
    .line 95
    invoke-direct {p2, p1}, Lcom/google/android/libraries/places/internal/zzauf;-><init>(Ljava/io/IOException;)V

    .line 96
    .line 97
    .line 98
    move-object p1, p2

    .line 99
    :cond_2
    invoke-virtual {p1, p0}, Lcom/google/android/libraries/places/internal/zzauf;->zzh(Lcom/google/android/libraries/places/internal/zzavf;)Lcom/google/android/libraries/places/internal/zzauf;

    .line 100
    .line 101
    .line 102
    throw p1
.end method
