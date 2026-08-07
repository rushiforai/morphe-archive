.class public final Ll/tx3$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gy3;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tx3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/x4e$b;

.field public b:Lokio/Sink;

.field public c:Lokio/Sink;

.field public d:Z

.field public final synthetic e:Ll/tx3;


# direct methods
.method public constructor <init>(Ll/tx3;Ll/x4e$b;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/tx3$a;->e:Ll/tx3;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/tx3$a;->a:Ll/x4e$b;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p2, v0}, Ll/x4e$b;->d(I)Lokio/Sink;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/tx3$a;->b:Lokio/Sink;

    .line 14
    .line 15
    new-instance v1, Ll/tx3$a$a;

    .line 16
    .line 17
    invoke-direct {v1, p0, v0, p1, p2}, Ll/tx3$a$a;-><init>(Ll/tx3$a;Lokio/Sink;Ll/tx3;Ll/x4e$b;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/tx3$a;->c:Lokio/Sink;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tx3$a;->e:Ll/tx3;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/tx3$a;->d:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, p0, Ll/tx3$a;->d:Z

    .line 14
    .line 15
    iget-object v2, p0, Ll/tx3$a;->e:Ll/tx3;

    .line 16
    .line 17
    iget v3, v2, Ll/tx3;->d:I

    .line 18
    .line 19
    add-int/2addr v3, v1

    .line 20
    iput v3, v2, Ll/tx3;->d:I

    .line 21
    .line 22
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    iget-object v0, p0, Ll/tx3$a;->b:Lokio/Sink;

    .line 24
    .line 25
    invoke-static {v0}, Ll/zlk0;->g(Ljava/io/Closeable;)V

    .line 26
    .line 27
    .line 28
    :try_start_1
    iget-object p0, p0, Ll/tx3$a;->a:Ll/x4e$b;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/x4e$b;->a()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 31
    .line 32
    .line 33
    :catch_0
    return-void

    .line 34
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    throw p0
.end method

.method public b()Lokio/Sink;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tx3$a;->c:Lokio/Sink;

    .line 2
    .line 3
    return-object p0
.end method
