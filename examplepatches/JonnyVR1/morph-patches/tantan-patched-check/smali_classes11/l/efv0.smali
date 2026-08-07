.class public final Ll/efv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wiu0;


# instance fields
.field public final a:Ll/q6w0;

.field public final b:Ll/hzs0;

.field public final c:Lcom/google/android/gms/ads/AdFormat;

.field public d:Ll/h7u0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/q6w0;Ll/hzs0;Lcom/google/android/gms/ads/AdFormat;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/efv0;->d:Ll/h7u0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/efv0;->a:Ll/q6w0;

    .line 8
    .line 9
    iput-object p2, p0, Ll/efv0;->b:Ll/hzs0;

    .line 10
    .line 11
    iput-object p3, p0, Ll/efv0;->c:Lcom/google/android/gms/ads/AdFormat;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(ZLandroid/content/Context;Ll/c7u0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzdkv;
        }
    .end annotation

    .line 1
    :try_start_0
    sget-object p1, Lcom/google/android/gms/ads/AdFormat;->BANNER:Lcom/google/android/gms/ads/AdFormat;

    .line 2
    .line 3
    iget-object p1, p0, Ll/efv0;->c:Lcom/google/android/gms/ads/AdFormat;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 p3, 0x1

    .line 10
    const/4 v0, 0x2

    .line 11
    if-eq p1, p3, :cond_1

    .line 12
    .line 13
    if-eq p1, v0, :cond_0

    .line 14
    .line 15
    const/4 p3, 0x5

    .line 16
    if-ne p1, p3, :cond_4

    .line 17
    .line 18
    iget-object p1, p0, Ll/efv0;->b:Ll/hzs0;

    .line 19
    .line 20
    invoke-static {p2}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-interface {p1, p2}, Ll/hzs0;->H(Ll/p1m;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object p1, p0, Ll/efv0;->b:Ll/hzs0;

    .line 30
    .line 31
    invoke-static {p2}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-interface {p1, p2}, Ll/hzs0;->e6(Ll/p1m;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object p1, p0, Ll/efv0;->b:Ll/hzs0;

    .line 41
    .line 42
    invoke-static {p2}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-interface {p1, p2}, Ll/hzs0;->o0(Ll/p1m;)Z

    .line 47
    .line 48
    .line 49
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    :goto_0
    if-eqz p1, :cond_4

    .line 51
    .line 52
    iget-object p1, p0, Ll/efv0;->d:Ll/h7u0;

    .line 53
    .line 54
    if-nez p1, :cond_2

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    sget-object p1, Ll/sgs0;->w1:Ll/dgs0;

    .line 58
    .line 59
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-nez p1, :cond_3

    .line 74
    .line 75
    iget-object p1, p0, Ll/efv0;->a:Ll/q6w0;

    .line 76
    .line 77
    iget p1, p1, Ll/q6w0;->Z:I

    .line 78
    .line 79
    if-ne p1, v0, :cond_3

    .line 80
    .line 81
    iget-object p0, p0, Ll/efv0;->d:Ll/h7u0;

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/h7u0;->zza()V

    .line 84
    .line 85
    .line 86
    :cond_3
    :goto_1
    return-void

    .line 87
    :cond_4
    new-instance p0, Lcom/google/android/gms/internal/ads/zzdkv;

    .line 88
    .line 89
    const-string p1, "Adapter failed to show."

    .line 90
    .line 91
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ads/zzdkv;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    throw p0

    .line 95
    :catchall_0
    move-exception p0

    .line 96
    new-instance p1, Lcom/google/android/gms/internal/ads/zzdkv;

    .line 97
    .line 98
    invoke-direct {p1, p0}, Lcom/google/android/gms/internal/ads/zzdkv;-><init>(Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    throw p1
.end method

.method public final b(Ll/h7u0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/efv0;->d:Ll/h7u0;

    .line 2
    .line 3
    return-void
.end method
