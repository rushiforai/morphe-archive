.class public final Ll/tfy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/google/android/gms/measurement/internal/zzo;

.field public final synthetic d:Ll/wmu0;

.field public final synthetic e:Ll/hcy0;


# direct methods
.method public constructor <init>(Ll/hcy0;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzo;Ll/wmu0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/tfy0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/tfy0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/tfy0;->c:Lcom/google/android/gms/measurement/internal/zzo;

    .line 6
    .line 7
    iput-object p5, p0, Ll/tfy0;->d:Ll/wmu0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/tfy0;->e:Ll/hcy0;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v1, p0, Ll/tfy0;->e:Ll/hcy0;

    .line 7
    .line 8
    invoke-static {v1}, Ll/hcy0;->v(Ll/hcy0;)Ll/isw0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/tfy0;->e:Ll/hcy0;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/d6x0;->A()Ll/l8x0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "Failed to get conditional properties; not connected to service"

    .line 25
    .line 26
    iget-object v3, p0, Ll/tfy0;->a:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v4, p0, Ll/tfy0;->b:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, v2, v3, v4}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/tfy0;->e:Ll/hcy0;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-object p0, p0, Ll/tfy0;->d:Ll/wmu0;

    .line 40
    .line 41
    invoke-virtual {v1, p0, v0}, Ll/hny0;->O(Ll/wmu0;Ljava/util/ArrayList;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception v1

    .line 46
    goto :goto_1

    .line 47
    :catch_0
    move-exception v1

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    :try_start_1
    iget-object v2, p0, Ll/tfy0;->c:Lcom/google/android/gms/measurement/internal/zzo;

    .line 50
    .line 51
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Ll/tfy0;->a:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v3, p0, Ll/tfy0;->b:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v4, p0, Ll/tfy0;->c:Lcom/google/android/gms/measurement/internal/zzo;

    .line 59
    .line 60
    invoke-interface {v1, v2, v3, v4}, Ll/isw0;->z0(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzo;)Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {v1}, Ll/hny0;->n0(Ljava/util/List;)Ljava/util/ArrayList;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v1, p0, Ll/tfy0;->e:Ll/hcy0;

    .line 69
    .line 70
    invoke-static {v1}, Ll/hcy0;->m0(Ll/hcy0;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Ll/tfy0;->e:Ll/hcy0;

    .line 74
    .line 75
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object p0, p0, Ll/tfy0;->d:Ll/wmu0;

    .line 80
    .line 81
    invoke-virtual {v1, p0, v0}, Ll/hny0;->O(Ll/wmu0;Ljava/util/ArrayList;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :goto_0
    :try_start_2
    iget-object v2, p0, Ll/tfy0;->e:Ll/hcy0;

    .line 86
    .line 87
    invoke-virtual {v2}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v2}, Ll/d6x0;->A()Ll/l8x0;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    const-string v3, "Failed to get conditional properties; remote exception"

    .line 96
    .line 97
    iget-object v4, p0, Ll/tfy0;->a:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v5, p0, Ll/tfy0;->b:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v2, v3, v4, v5, v1}, Ll/l8x0;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Ll/tfy0;->e:Ll/hcy0;

    .line 105
    .line 106
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iget-object p0, p0, Ll/tfy0;->d:Ll/wmu0;

    .line 111
    .line 112
    invoke-virtual {v1, p0, v0}, Ll/hny0;->O(Ll/wmu0;Ljava/util/ArrayList;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :goto_1
    iget-object v2, p0, Ll/tfy0;->e:Ll/hcy0;

    .line 117
    .line 118
    invoke-virtual {v2}, Ll/yyx0;->e()Ll/hny0;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    iget-object p0, p0, Ll/tfy0;->d:Ll/wmu0;

    .line 123
    .line 124
    invoke-virtual {v2, p0, v0}, Ll/hny0;->O(Ll/wmu0;Ljava/util/ArrayList;)V

    .line 125
    .line 126
    .line 127
    throw v1
.end method
