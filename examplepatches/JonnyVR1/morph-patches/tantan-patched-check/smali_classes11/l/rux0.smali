.class public final Ll/rux0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zxx0;


# static fields
.field public static final b:Ll/pvx0;


# instance fields
.field public final a:Ll/pvx0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/hux0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hux0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/rux0;->b:Ll/pvx0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    new-instance v0, Ll/mux0;

    .line 2
    .line 3
    invoke-static {}, Ll/snx0;->a()Ll/snx0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget-object v2, Ll/gxx0;->c:Ll/gxx0;

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    new-array v2, v2, [Ll/pvx0;

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    aput-object v1, v2, v3

    .line 14
    .line 15
    sget-object v1, Ll/rux0;->b:Ll/pvx0;

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    aput-object v1, v2, v3

    .line 19
    .line 20
    invoke-direct {v0, v2}, Ll/mux0;-><init>([Ll/pvx0;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    .line 25
    .line 26
    sget-object v1, Ll/srx0;->a:Ljava/nio/charset/Charset;

    .line 27
    .line 28
    iput-object v0, p0, Ll/rux0;->a:Ll/pvx0;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Class;)Ll/uxx0;
    .locals 7

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/play_billing/j0;->a:Ll/k0y0;

    .line 2
    .line 3
    const-class v0, Lcom/google/android/gms/internal/play_billing/d0;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/gxx0;->c:Ll/gxx0;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/rux0;->a:Ll/pvx0;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/pvx0;->zzb(Ljava/lang/Class;)Ll/lvx0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ll/lvx0;->zzb()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_2

    .line 24
    .line 25
    sget-object p0, Ll/gxx0;->c:Ll/gxx0;

    .line 26
    .line 27
    invoke-static {}, Ll/xwx0;->a()Ll/twx0;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {}, Ll/ztx0;->a()Ll/dtx0;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/j0;->r()Ll/k0y0;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-interface {v1}, Ll/lvx0;->zzc()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    add-int/lit8 p0, p0, -0x1

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    if-eq p0, v0, :cond_1

    .line 47
    .line 48
    invoke-static {}, Ll/chx0;->a()Ll/efx0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    :goto_0
    move-object v5, p0

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    const/4 p0, 0x0

    .line 55
    goto :goto_0

    .line 56
    :goto_1
    invoke-static {}, Ll/hvx0;->a()Ll/cvx0;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    move-object v0, p1

    .line 61
    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/play_billing/h0;->w(Ljava/lang/Class;Ll/lvx0;Ll/twx0;Ll/dtx0;Ll/k0y0;Ll/efx0;Ll/cvx0;)Lcom/google/android/gms/internal/play_billing/h0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_2
    sget-object p0, Ll/gxx0;->c:Ll/gxx0;

    .line 67
    .line 68
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/j0;->r()Ll/k0y0;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {}, Ll/chx0;->a()Ll/efx0;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-interface {v1}, Ll/lvx0;->zza()Ll/yvx0;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {p0, p1, v0}, Lcom/google/android/gms/internal/play_billing/i0;->f(Ll/k0y0;Ll/efx0;Ll/yvx0;)Lcom/google/android/gms/internal/play_billing/i0;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0
.end method
