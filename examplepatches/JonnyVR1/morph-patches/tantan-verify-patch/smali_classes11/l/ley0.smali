.class public final Ll/ley0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/zzo;

.field public final synthetic b:Ll/wmu0;

.field public final synthetic c:Ll/hcy0;


# direct methods
.method public constructor <init>(Ll/hcy0;Lcom/google/android/gms/measurement/internal/zzo;Ll/wmu0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/ley0;->a:Lcom/google/android/gms/measurement/internal/zzo;

    .line 2
    .line 3
    iput-object p3, p0, Ll/ley0;->b:Ll/wmu0;

    .line 4
    .line 5
    iput-object p1, p0, Ll/ley0;->c:Ll/hcy0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    const-string v0, "Failed to get app instance id"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Ll/ley0;->c:Ll/hcy0;

    .line 5
    .line 6
    invoke-virtual {v2}, Ll/yyx0;->d()Ll/ajx0;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-virtual {v2}, Ll/ajx0;->G()Lcom/google/android/gms/measurement/internal/zzje;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzje;->z()Z

    .line 15
    .line 16
    .line 17
    move-result v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    iget-object v3, p0, Ll/ley0;->c:Ll/hcy0;

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    :try_start_1
    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Ll/d6x0;->G()Ll/l8x0;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "Analytics storage consent denied; will not get app instance id"

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/ley0;->c:Ll/hcy0;

    .line 36
    .line 37
    invoke-virtual {v2}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2, v1}, Lcom/google/android/gms/measurement/internal/g;->U0(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Ll/ley0;->c:Ll/hcy0;

    .line 45
    .line 46
    invoke-virtual {v2}, Ll/yyx0;->d()Ll/ajx0;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iget-object v2, v2, Ll/ajx0;->i:Ll/bmx0;

    .line 51
    .line 52
    invoke-virtual {v2, v1}, Ll/bmx0;->b(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/ley0;->c:Ll/hcy0;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/yyx0;->e()Ll/hny0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object p0, p0, Ll/ley0;->b:Ll/wmu0;

    .line 62
    .line 63
    invoke-virtual {v0, p0, v1}, Ll/hny0;->N(Ll/wmu0;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :catchall_0
    move-exception v0

    .line 68
    goto :goto_1

    .line 69
    :catch_0
    move-exception v2

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    :try_start_2
    invoke-static {v3}, Ll/hcy0;->v(Ll/hcy0;)Ll/isw0;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    if-nez v2, :cond_1

    .line 76
    .line 77
    iget-object v2, p0, Ll/ley0;->c:Ll/hcy0;

    .line 78
    .line 79
    invoke-virtual {v2}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v2}, Ll/d6x0;->A()Ll/l8x0;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v2, v0}, Ll/l8x0;->a(Ljava/lang/String;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Ll/ley0;->c:Ll/hcy0;

    .line 91
    .line 92
    invoke-virtual {v0}, Ll/yyx0;->e()Ll/hny0;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object p0, p0, Ll/ley0;->b:Ll/wmu0;

    .line 97
    .line 98
    invoke-virtual {v0, p0, v1}, Ll/hny0;->N(Ll/wmu0;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_1
    :try_start_3
    iget-object v3, p0, Ll/ley0;->a:Lcom/google/android/gms/measurement/internal/zzo;

    .line 103
    .line 104
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    iget-object v3, p0, Ll/ley0;->a:Lcom/google/android/gms/measurement/internal/zzo;

    .line 108
    .line 109
    invoke-interface {v2, v3}, Ll/isw0;->U6(Lcom/google/android/gms/measurement/internal/zzo;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    iget-object v2, p0, Ll/ley0;->c:Ll/hcy0;

    .line 116
    .line 117
    invoke-virtual {v2}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v2, v1}, Lcom/google/android/gms/measurement/internal/g;->U0(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    iget-object v2, p0, Ll/ley0;->c:Ll/hcy0;

    .line 125
    .line 126
    invoke-virtual {v2}, Ll/yyx0;->d()Ll/ajx0;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    iget-object v2, v2, Ll/ajx0;->i:Ll/bmx0;

    .line 131
    .line 132
    invoke-virtual {v2, v1}, Ll/bmx0;->b(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    :cond_2
    iget-object v2, p0, Ll/ley0;->c:Ll/hcy0;

    .line 136
    .line 137
    invoke-static {v2}, Ll/hcy0;->m0(Ll/hcy0;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Ll/ley0;->c:Ll/hcy0;

    .line 141
    .line 142
    invoke-virtual {v0}, Ll/yyx0;->e()Ll/hny0;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object p0, p0, Ll/ley0;->b:Ll/wmu0;

    .line 147
    .line 148
    invoke-virtual {v0, p0, v1}, Ll/hny0;->N(Ll/wmu0;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :goto_0
    :try_start_4
    iget-object v3, p0, Ll/ley0;->c:Ll/hcy0;

    .line 153
    .line 154
    invoke-virtual {v3}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {v3}, Ll/d6x0;->A()Ll/l8x0;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    invoke-virtual {v3, v0, v2}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Ll/ley0;->c:Ll/hcy0;

    .line 166
    .line 167
    invoke-virtual {v0}, Ll/yyx0;->e()Ll/hny0;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iget-object p0, p0, Ll/ley0;->b:Ll/wmu0;

    .line 172
    .line 173
    invoke-virtual {v0, p0, v1}, Ll/hny0;->N(Ll/wmu0;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :goto_1
    iget-object v2, p0, Ll/ley0;->c:Ll/hcy0;

    .line 178
    .line 179
    invoke-virtual {v2}, Ll/yyx0;->e()Ll/hny0;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    iget-object p0, p0, Ll/ley0;->b:Ll/wmu0;

    .line 184
    .line 185
    invoke-virtual {v2, p0, v1}, Ll/hny0;->N(Ll/wmu0;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    throw v0
.end method
