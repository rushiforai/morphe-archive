.class public Ll/mwd0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mwd0$b;
    }
.end annotation


# instance fields
.field private final a:Ll/wgw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wgw<",
            "Ll/kzq;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Ll/nj80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nj80<",
            "Ll/mwd0$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wgw;

    .line 5
    .line 6
    const-wide/16 v1, 0x3e8

    .line 7
    .line 8
    invoke-direct {v0, v1, v2}, Ll/wgw;-><init>(J)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/mwd0;->a:Ll/wgw;

    .line 12
    .line 13
    new-instance v0, Ll/mwd0$a;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/mwd0$a;-><init>(Ll/mwd0;)V

    .line 16
    .line 17
    .line 18
    const/16 v1, 0xa

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/mxf;->d(ILl/mxf$d;)Ll/nj80;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/mwd0;->b:Ll/nj80;

    .line 25
    .line 26
    return-void
.end method

.method private a(Ll/kzq;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mwd0;->b:Ll/nj80;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/nj80;->acquire()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/mwd0$b;

    .line 12
    .line 13
    :try_start_0
    iget-object v1, v0, Ll/mwd0$b;->a:Ljava/security/MessageDigest;

    .line 14
    .line 15
    invoke-interface {p1, v1}, Ll/kzq;->a(Ljava/security/MessageDigest;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, v0, Ll/mwd0$b;->a:Ljava/security/MessageDigest;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p1}, Ll/ylk0;->x([B)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    iget-object p0, p0, Ll/mwd0;->b:Ll/nj80;

    .line 29
    .line 30
    invoke-interface {p0, v0}, Ll/nj80;->release(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    return-object p1

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    iget-object p0, p0, Ll/mwd0;->b:Ll/nj80;

    .line 36
    .line 37
    invoke-interface {p0, v0}, Ll/nj80;->release(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    throw p1
.end method


# virtual methods
.method public b(Ll/kzq;)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mwd0;->a:Ll/wgw;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/mwd0;->a:Ll/wgw;

    .line 5
    .line 6
    invoke-virtual {v1, p1}, Ll/wgw;->g(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ljava/lang/String;

    .line 11
    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/mwd0;->a(Ll/kzq;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :cond_0
    iget-object v2, p0, Ll/mwd0;->a:Ll/wgw;

    .line 20
    .line 21
    monitor-enter v2

    .line 22
    :try_start_1
    iget-object p0, p0, Ll/mwd0;->a:Ll/wgw;

    .line 23
    .line 24
    invoke-virtual {p0, p1, v1}, Ll/wgw;->k(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    monitor-exit v2

    .line 28
    return-object v1

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    throw p0

    .line 32
    :catchall_1
    move-exception p0

    .line 33
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 34
    throw p0
.end method
