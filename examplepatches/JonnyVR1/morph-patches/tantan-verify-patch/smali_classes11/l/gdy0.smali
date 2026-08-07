.class public final Ll/gdy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/util/concurrent/atomic/AtomicReference;

.field public final synthetic b:Lcom/google/android/gms/measurement/internal/zzo;

.field public final synthetic c:Ll/hcy0;


# direct methods
.method public constructor <init>(Ll/hcy0;Ljava/util/concurrent/atomic/AtomicReference;Lcom/google/android/gms/measurement/internal/zzo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/gdy0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    iput-object p3, p0, Ll/gdy0;->b:Lcom/google/android/gms/measurement/internal/zzo;

    .line 4
    .line 5
    iput-object p1, p0, Ll/gdy0;->c:Ll/hcy0;

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
    iget-object v0, p0, Ll/gdy0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/gdy0;->c:Ll/hcy0;

    .line 5
    .line 6
    invoke-virtual {v1}, Ll/yyx0;->d()Ll/ajx0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/ajx0;->G()Lcom/google/android/gms/measurement/internal/zzje;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzje;->z()Z

    .line 15
    .line 16
    .line 17
    move-result v1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 18
    iget-object v2, p0, Ll/gdy0;->c:Ll/hcy0;

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    :try_start_1
    invoke-virtual {v2}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/d6x0;->G()Ll/l8x0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "Analytics storage consent denied; will not get app instance id"

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/gdy0;->c:Ll/hcy0;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/g;->U0(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/gdy0;->c:Ll/hcy0;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/yyx0;->d()Ll/ajx0;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget-object v1, v1, Ll/ajx0;->i:Ll/bmx0;

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ll/bmx0;->b(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/gdy0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 59
    .line 60
    .line 61
    :try_start_2
    iget-object p0, p0, Ll/gdy0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 64
    .line 65
    .line 66
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 67
    return-void

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    goto/16 :goto_3

    .line 70
    .line 71
    :catchall_1
    move-exception v1

    .line 72
    goto :goto_2

    .line 73
    :catch_0
    move-exception v1

    .line 74
    goto :goto_0

    .line 75
    :cond_0
    :try_start_3
    invoke-static {v2}, Ll/hcy0;->v(Ll/hcy0;)Ll/isw0;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    if-nez v1, :cond_1

    .line 80
    .line 81
    iget-object v1, p0, Ll/gdy0;->c:Ll/hcy0;

    .line 82
    .line 83
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v1}, Ll/d6x0;->A()Ll/l8x0;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v2, "Failed to get app instance id"

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ll/l8x0;->a(Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 94
    .line 95
    .line 96
    :try_start_4
    iget-object p0, p0, Ll/gdy0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 99
    .line 100
    .line 101
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 102
    return-void

    .line 103
    :cond_1
    :try_start_5
    iget-object v2, p0, Ll/gdy0;->b:Lcom/google/android/gms/measurement/internal/zzo;

    .line 104
    .line 105
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    iget-object v2, p0, Ll/gdy0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 109
    .line 110
    iget-object v3, p0, Ll/gdy0;->b:Lcom/google/android/gms/measurement/internal/zzo;

    .line 111
    .line 112
    invoke-interface {v1, v3}, Ll/isw0;->U6(Lcom/google/android/gms/measurement/internal/zzo;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    iget-object v1, p0, Ll/gdy0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    check-cast v1, Ljava/lang/String;

    .line 126
    .line 127
    if-eqz v1, :cond_2

    .line 128
    .line 129
    iget-object v2, p0, Ll/gdy0;->c:Ll/hcy0;

    .line 130
    .line 131
    invoke-virtual {v2}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v2, v1}, Lcom/google/android/gms/measurement/internal/g;->U0(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Ll/gdy0;->c:Ll/hcy0;

    .line 139
    .line 140
    invoke-virtual {v2}, Ll/yyx0;->d()Ll/ajx0;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    iget-object v2, v2, Ll/ajx0;->i:Ll/bmx0;

    .line 145
    .line 146
    invoke-virtual {v2, v1}, Ll/bmx0;->b(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    :cond_2
    iget-object v1, p0, Ll/gdy0;->c:Ll/hcy0;

    .line 150
    .line 151
    invoke-static {v1}, Ll/hcy0;->m0(Ll/hcy0;)V
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 152
    .line 153
    .line 154
    :try_start_6
    iget-object p0, p0, Ll/gdy0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 155
    .line 156
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :goto_0
    :try_start_7
    iget-object v2, p0, Ll/gdy0;->c:Ll/hcy0;

    .line 161
    .line 162
    invoke-virtual {v2}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-virtual {v2}, Ll/d6x0;->A()Ll/l8x0;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    const-string v3, "Failed to get app instance id"

    .line 171
    .line 172
    invoke-virtual {v2, v3, v1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 173
    .line 174
    .line 175
    :try_start_8
    iget-object p0, p0, Ll/gdy0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 176
    .line 177
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 178
    .line 179
    .line 180
    :goto_1
    monitor-exit v0

    .line 181
    return-void

    .line 182
    :goto_2
    iget-object p0, p0, Ll/gdy0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 183
    .line 184
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 185
    .line 186
    .line 187
    throw v1

    .line 188
    :goto_3
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 189
    throw p0
.end method
