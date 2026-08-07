.class public Ll/ij80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ll/wq3;


# direct methods
.method public constructor <init>(Ll/wq3;)V
    .locals 1

    const/16 v0, 0x4000

    .line 21
    invoke-direct {p0, p1, v0}, Ll/ij80;-><init>(Ll/wq3;I)V

    return-void
.end method

.method public constructor <init>(Ll/wq3;I)V
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-lez p2, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/wn80;->b(Ljava/lang/Boolean;)V

    .line 14
    .line 15
    .line 16
    iput p2, p0, Ll/ij80;->a:I

    .line 17
    .line 18
    iput-object p1, p0, Ll/ij80;->b:Ll/wq3;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ij80;->b:Ll/wq3;

    .line 2
    .line 3
    iget v1, p0, Ll/ij80;->a:I

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ll/vi80;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, [B

    .line 10
    .line 11
    const-wide/16 v1, 0x0

    .line 12
    .line 13
    :goto_0
    :try_start_0
    iget v3, p0, Ll/ij80;->a:I

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-virtual {p1, v0, v4, v3}, Ljava/io/InputStream;->read([BII)I

    .line 17
    .line 18
    .line 19
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    const/4 v5, -0x1

    .line 21
    if-ne v3, v5, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/ij80;->b:Ll/wq3;

    .line 24
    .line 25
    invoke-interface {p0, v0}, Ll/vi80;->release(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-wide v1

    .line 29
    :cond_0
    :try_start_1
    invoke-virtual {p2, v0, v4, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    int-to-long v3, v3

    .line 33
    add-long/2addr v1, v3

    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    iget-object p0, p0, Ll/ij80;->b:Ll/wq3;

    .line 37
    .line 38
    invoke-interface {p0, v0}, Ll/vi80;->release(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    throw p1
.end method
