.class public final synthetic Ll/pvv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# static fields
.field public static final synthetic a:Ll/pvv0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/pvv0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/pvv0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/pvv0;->a:Ll/pvv0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 4

    .line 1
    check-cast p1, Ll/xmj;

    .line 2
    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/ads/a6;->L()Ll/lmx0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Ll/xmj;->a()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/b7j0;

    .line 26
    .line 27
    invoke-static {}, Lcom/google/android/gms/internal/ads/z5;->L()Ll/kmx0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0}, Ll/b7j0;->c()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {v1, v2}, Ll/kmx0;->s(I)Ll/kmx0;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ll/b7j0;->a()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    invoke-virtual {v1, v2, v3}, Ll/kmx0;->q(J)Ll/kmx0;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ll/b7j0;->b()J

    .line 46
    .line 47
    .line 48
    move-result-wide v2

    .line 49
    invoke-virtual {v1, v2, v3}, Ll/kmx0;->r(J)Ll/kmx0;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/google/android/gms/internal/ads/z5;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/lmx0;->q(Lcom/google/android/gms/internal/ads/z5;)Ll/lmx0;

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    invoke-virtual {p0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Lcom/google/android/gms/internal/ads/a6;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h5;->h()[B

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const/4 p1, 0x1

    .line 73
    invoke-static {p0, p1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance v0, Ll/tvv0;

    .line 78
    .line 79
    const/4 v1, 0x0

    .line 80
    invoke-direct {v0, p0, p1, v1}, Ll/tvv0;-><init>(Ljava/lang/String;ILl/svv0;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    return-object p0
.end method
