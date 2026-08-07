.class public final Ll/f7y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wmu0;

.field public final synthetic b:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;Ll/wmu0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/f7y0;->a:Ll/wmu0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/f7y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/f7y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v1v0;->o()Ll/thy0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/ajx0;->G()Lcom/google/android/gms/measurement/internal/zzje;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzje;->z()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/d6x0;->G()Ll/l8x0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "Analytics storage consent denied; will not get session id"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    :goto_0
    move-object v0, v2

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-interface {v3}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 46
    .line 47
    .line 48
    move-result-wide v3

    .line 49
    invoke-virtual {v1, v3, v4}, Ll/ajx0;->t(J)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_0

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object v1, v1, Ll/ajx0;->s:Ll/zjx0;

    .line 60
    .line 61
    invoke-virtual {v1}, Ll/zjx0;->a()J

    .line 62
    .line 63
    .line 64
    move-result-wide v3

    .line 65
    const-wide/16 v5, 0x0

    .line 66
    .line 67
    cmp-long v1, v3, v5

    .line 68
    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v0, v0, Ll/ajx0;->s:Ll/zjx0;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/zjx0;->a()J

    .line 79
    .line 80
    .line 81
    move-result-wide v0

    .line 82
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    :goto_1
    if-eqz v0, :cond_3

    .line 87
    .line 88
    iget-object v1, p0, Ll/f7y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 89
    .line 90
    iget-object v1, v1, Ll/yyx0;->a:Ll/atx0;

    .line 91
    .line 92
    invoke-virtual {v1}, Ll/atx0;->G()Ll/hny0;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iget-object p0, p0, Ll/f7y0;->a:Ll/wmu0;

    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 99
    .line 100
    .line 101
    move-result-wide v2

    .line 102
    invoke-virtual {v1, p0, v2, v3}, Ll/hny0;->L(Ll/wmu0;J)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_3
    :try_start_0
    iget-object v0, p0, Ll/f7y0;->a:Ll/wmu0;

    .line 107
    .line 108
    invoke-interface {v0, v2}, Ll/wmu0;->zza(Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :catch_0
    move-exception v0

    .line 113
    iget-object p0, p0, Ll/f7y0;->b:Lcom/google/android/gms/measurement/internal/g;

    .line 114
    .line 115
    iget-object p0, p0, Ll/yyx0;->a:Ll/atx0;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    const-string v1, "getSessionId failed with exception"

    .line 126
    .line 127
    invoke-virtual {p0, v1, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method
