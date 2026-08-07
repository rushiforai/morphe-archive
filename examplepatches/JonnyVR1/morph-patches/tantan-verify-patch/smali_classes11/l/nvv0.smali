.class public final Ll/nvv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ll/xvw0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nvv0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/nvv0;->b:Landroid/content/Context;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/fvv0;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nvv0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "phone"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/nvv0;->b:Landroid/content/Context;

    .line 23
    .line 24
    const-string v1, "android.permission.ACCESS_NETWORK_STATE"

    .line 25
    .line 26
    invoke-static {v0, v1}, Lcom/google/android/gms/ads/internal/util/b;->b0(Landroid/content/Context;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, -0x1

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/nvv0;->b:Landroid/content/Context;

    .line 34
    .line 35
    const-string v3, "connectivity"

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    if-eqz v3, :cond_0

    .line 48
    .line 49
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    move v8, v3

    .line 62
    move v3, v1

    .line 63
    move v1, v8

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    move v3, v1

    .line 66
    :goto_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->isActiveNetworkMetered()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    :goto_1
    move v6, v0

    .line 71
    move v7, v1

    .line 72
    goto :goto_2

    .line 73
    :cond_1
    const/4 v0, 0x0

    .line 74
    const/4 v3, -0x2

    .line 75
    goto :goto_1

    .line 76
    :goto_2
    iget-object p0, p0, Ll/nvv0;->b:Landroid/content/Context;

    .line 77
    .line 78
    new-instance v1, Ll/fvv0;

    .line 79
    .line 80
    invoke-static {}, Ll/bxy0;->s()Ll/ccr0;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0, p0}, Ll/ccr0;->k(Landroid/content/Context;)I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    invoke-direct/range {v1 .. v7}, Ll/fvv0;-><init>(Ljava/lang/String;IIIZI)V

    .line 89
    .line 90
    .line 91
    return-object v1
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x27

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/mvv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mvv0;-><init>(Ll/nvv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/nvv0;->a:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
