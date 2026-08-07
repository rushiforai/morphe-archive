.class public final Ll/wjw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[B

.field public b:I

.field public c:I

.field public final synthetic d:Ll/xjw0;


# direct methods
.method public synthetic constructor <init>(Ll/xjw0;[BLl/vjw0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wjw0;->d:Ll/xjw0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/wjw0;->a:[B

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(I)Ll/wjw0;
    .locals 0

    .line 1
    iput p1, p0, Ll/wjw0;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(I)Ll/wjw0;
    .locals 0

    .line 1
    iput p1, p0, Ll/wjw0;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final declared-synchronized c()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/wjw0;->d:Ll/xjw0;

    .line 3
    .line 4
    iget-boolean v1, v0, Ll/xjw0;->b:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v0, v0, Ll/xjw0;->a:Ll/akw0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/wjw0;->a:[B

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ll/akw0;->r0([B)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/wjw0;->d:Ll/xjw0;

    .line 16
    .line 17
    iget-object v0, v0, Ll/xjw0;->a:Ll/akw0;

    .line 18
    .line 19
    iget v1, p0, Ll/wjw0;->b:I

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ll/akw0;->n(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/wjw0;->d:Ll/xjw0;

    .line 25
    .line 26
    iget-object v0, v0, Ll/xjw0;->a:Ll/akw0;

    .line 27
    .line 28
    iget v1, p0, Ll/wjw0;->c:I

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ll/akw0;->zzg(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/wjw0;->d:Ll/xjw0;

    .line 34
    .line 35
    iget-object v0, v0, Ll/xjw0;->a:Ll/akw0;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-interface {v0, v1}, Ll/akw0;->k0([I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/wjw0;->d:Ll/xjw0;

    .line 42
    .line 43
    iget-object v0, v0, Ll/xjw0;->a:Ll/akw0;

    .line 44
    .line 45
    invoke-interface {v0}, Ll/akw0;->zzf()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .line 47
    .line 48
    monitor-exit p0

    .line 49
    return-void

    .line 50
    :catchall_0
    move-exception v0

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    monitor-exit p0

    .line 53
    return-void

    .line 54
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    throw v0

    .line 56
    :catch_0
    monitor-exit p0

    .line 57
    return-void
.end method
