.class public Ll/x4e$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/x4e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x4e;


# direct methods
.method public constructor <init>(Ll/x4e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x4e$c;->a:Ll/x4e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/x4e$c;->a:Ll/x4e;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/x4e$c;->a:Ll/x4e;

    .line 5
    .line 6
    iget-boolean v2, v1, Ll/x4e;->n:Z

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    xor-int/2addr v2, v3

    .line 10
    iget-boolean v4, v1, Ll/x4e;->o:Z

    .line 11
    .line 12
    or-int/2addr v2, v4

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_2

    .line 19
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Ll/x4e;->U()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catch_0
    :try_start_2
    iget-object v1, p0, Ll/x4e$c;->a:Ll/x4e;

    .line 24
    .line 25
    iput-boolean v3, v1, Ll/x4e;->p:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 26
    .line 27
    :goto_0
    :try_start_3
    iget-object v1, p0, Ll/x4e$c;->a:Ll/x4e;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/x4e;->F()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    iget-object v1, p0, Ll/x4e$c;->a:Ll/x4e;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/x4e;->N()V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/x4e$c;->a:Ll/x4e;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    iput v2, v1, Ll/x4e;->l:I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :catch_1
    :try_start_4
    iget-object p0, p0, Ll/x4e$c;->a:Ll/x4e;

    .line 47
    .line 48
    iput-boolean v3, p0, Ll/x4e;->q:Z

    .line 49
    .line 50
    invoke-static {}, Lokio/Okio;->blackhole()Lokio/Sink;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v1}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, p0, Ll/x4e;->j:Lokio/BufferedSink;

    .line 59
    .line 60
    :cond_1
    :goto_1
    monitor-exit v0

    .line 61
    return-void

    .line 62
    :goto_2
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 63
    throw p0
.end method
