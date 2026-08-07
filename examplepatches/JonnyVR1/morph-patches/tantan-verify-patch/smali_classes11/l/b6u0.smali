.class public final Ll/b6u0;
.super Ll/mku0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/util/List;

.field public final f:J

.field public final g:Ljava/lang/String;

.field public final h:Ll/tcv0;

.field public final i:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Ll/q6w0;Ljava/lang/String;Ll/tcv0;Ll/t6w0;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/mku0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    move-object v1, v0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v1, p1, Ll/q6w0;->c0:Ljava/lang/String;

    .line 10
    .line 11
    :goto_0
    iput-object v1, p0, Ll/b6u0;->b:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p5, p0, Ll/b6u0;->c:Ljava/lang/String;

    .line 14
    .line 15
    if-nez p4, :cond_1

    .line 16
    .line 17
    move-object p5, v0

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    iget-object p5, p4, Ll/t6w0;->b:Ljava/lang/String;

    .line 20
    .line 21
    :goto_1
    iput-object p5, p0, Ll/b6u0;->d:Ljava/lang/String;

    .line 22
    .line 23
    const-string p5, "com.google.android.gms.ads.mediation.customevent.CustomEventAdapter"

    .line 24
    .line 25
    invoke-virtual {p5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p5

    .line 29
    if-nez p5, :cond_2

    .line 30
    .line 31
    const-string p5, "com.google.ads.mediation.customevent.CustomEventAdapter"

    .line 32
    .line 33
    invoke-virtual {p5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p5

    .line 37
    if-eqz p5, :cond_3

    .line 38
    .line 39
    :cond_2
    :try_start_0
    iget-object p1, p1, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 40
    .line 41
    const-string p5, "class_name"

    .line 42
    .line 43
    invoke-virtual {p1, p5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    :catch_0
    :cond_3
    if-eqz v0, :cond_4

    .line 48
    .line 49
    move-object p2, v0

    .line 50
    :cond_4
    iput-object p2, p0, Ll/b6u0;->a:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p3}, Ll/tcv0;->c()Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Ll/b6u0;->e:Ljava/util/List;

    .line 57
    .line 58
    iput-object p3, p0, Ll/b6u0;->h:Ll/tcv0;

    .line 59
    .line 60
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide p1

    .line 68
    const-wide/16 v0, 0x3e8

    .line 69
    .line 70
    div-long/2addr p1, v0

    .line 71
    iput-wide p1, p0, Ll/b6u0;->f:J

    .line 72
    .line 73
    sget-object p1, Ll/sgs0;->Q6:Ll/dgs0;

    .line 74
    .line 75
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    check-cast p1, Ljava/lang/Boolean;

    .line 84
    .line 85
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_5

    .line 90
    .line 91
    if-eqz p4, :cond_5

    .line 92
    .line 93
    iget-object p1, p4, Ll/t6w0;->j:Landroid/os/Bundle;

    .line 94
    .line 95
    iput-object p1, p0, Ll/b6u0;->i:Landroid/os/Bundle;

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_5
    new-instance p1, Landroid/os/Bundle;

    .line 99
    .line 100
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 101
    .line 102
    .line 103
    iput-object p1, p0, Ll/b6u0;->i:Landroid/os/Bundle;

    .line 104
    .line 105
    :goto_2
    sget-object p1, Ll/sgs0;->e9:Ll/dgs0;

    .line 106
    .line 107
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 108
    .line 109
    .line 110
    move-result-object p2

    .line 111
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Ljava/lang/Boolean;

    .line 116
    .line 117
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_7

    .line 122
    .line 123
    if-eqz p4, :cond_7

    .line 124
    .line 125
    iget-object p1, p4, Ll/t6w0;->h:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-eqz p1, :cond_6

    .line 132
    .line 133
    goto :goto_3

    .line 134
    :cond_6
    iget-object p1, p4, Ll/t6w0;->h:Ljava/lang/String;

    .line 135
    .line 136
    goto :goto_4

    .line 137
    :cond_7
    :goto_3
    const-string p1, ""

    .line 138
    .line 139
    :goto_4
    iput-object p1, p0, Ll/b6u0;->g:Ljava/lang/String;

    .line 140
    .line 141
    return-void
.end method


# virtual methods
.method public final zzc()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/b6u0;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final zzd()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b6u0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zze()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b6u0;->i:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzf()Lcom/google/android/gms/ads/internal/client/zzu;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b6u0;->h:Ll/tcv0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tcv0;->a()Lcom/google/android/gms/ads/internal/client/zzu;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public final zzg()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b6u0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzh()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b6u0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzi()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b6u0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzj()Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b6u0;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzk()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b6u0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
