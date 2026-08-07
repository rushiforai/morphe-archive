.class public final Ll/cfy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/zzbf;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/wmu0;

.field public final synthetic d:Ll/hcy0;


# direct methods
.method public constructor <init>(Ll/hcy0;Lcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;Ll/wmu0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/cfy0;->a:Lcom/google/android/gms/measurement/internal/zzbf;

    .line 2
    .line 3
    iput-object p3, p0, Ll/cfy0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/cfy0;->c:Ll/wmu0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/cfy0;->d:Ll/hcy0;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/cfy0;->d:Ll/hcy0;

    .line 3
    .line 4
    invoke-static {v1}, Ll/hcy0;->v(Ll/hcy0;)Ll/isw0;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ll/cfy0;->d:Ll/hcy0;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/d6x0;->A()Ll/l8x0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "Discarding data. Failed to send event to service to bundle"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ll/l8x0;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/cfy0;->d:Ll/hcy0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object p0, p0, Ll/cfy0;->c:Ll/wmu0;

    .line 32
    .line 33
    invoke-virtual {v1, p0, v0}, Ll/hny0;->Q(Ll/wmu0;[B)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception v1

    .line 38
    goto :goto_1

    .line 39
    :catch_0
    move-exception v1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    :try_start_1
    iget-object v2, p0, Ll/cfy0;->a:Lcom/google/android/gms/measurement/internal/zzbf;

    .line 42
    .line 43
    iget-object v3, p0, Ll/cfy0;->b:Ljava/lang/String;

    .line 44
    .line 45
    invoke-interface {v1, v2, v3}, Ll/isw0;->V7(Lcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;)[B

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p0, Ll/cfy0;->d:Ll/hcy0;

    .line 50
    .line 51
    invoke-static {v1}, Ll/hcy0;->m0(Ll/hcy0;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Ll/cfy0;->d:Ll/hcy0;

    .line 55
    .line 56
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object p0, p0, Ll/cfy0;->c:Ll/wmu0;

    .line 61
    .line 62
    invoke-virtual {v1, p0, v0}, Ll/hny0;->Q(Ll/wmu0;[B)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :goto_0
    :try_start_2
    iget-object v2, p0, Ll/cfy0;->d:Ll/hcy0;

    .line 67
    .line 68
    invoke-virtual {v2}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v2}, Ll/d6x0;->A()Ll/l8x0;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const-string v3, "Failed to send event to the service to bundle"

    .line 77
    .line 78
    invoke-virtual {v2, v3, v1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Ll/cfy0;->d:Ll/hcy0;

    .line 82
    .line 83
    invoke-virtual {v1}, Ll/yyx0;->e()Ll/hny0;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iget-object p0, p0, Ll/cfy0;->c:Ll/wmu0;

    .line 88
    .line 89
    invoke-virtual {v1, p0, v0}, Ll/hny0;->Q(Ll/wmu0;[B)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :goto_1
    iget-object v2, p0, Ll/cfy0;->d:Ll/hcy0;

    .line 94
    .line 95
    invoke-virtual {v2}, Ll/yyx0;->e()Ll/hny0;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget-object p0, p0, Ll/cfy0;->c:Ll/wmu0;

    .line 100
    .line 101
    invoke-virtual {v2, p0, v0}, Ll/hny0;->Q(Ll/wmu0;[B)V

    .line 102
    .line 103
    .line 104
    throw v1
.end method
