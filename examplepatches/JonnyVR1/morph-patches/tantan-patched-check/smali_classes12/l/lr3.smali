.class public abstract Ll/lr3;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/kr3;)J
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/xn80;->p(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/ob5;->k()Ll/ob5;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    :try_start_0
    invoke-virtual {p0}, Ll/lr3;->b()Ljava/io/InputStream;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ll/ob5;->m(Ljava/io/Closeable;)Ljava/io/Closeable;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/io/InputStream;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/kr3;->a()Ljava/io/OutputStream;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {v0, p1}, Ll/ob5;->m(Ljava/io/Closeable;)Ljava/io/Closeable;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/io/OutputStream;

    .line 27
    .line 28
    invoke-static {p0, p1}, Ll/mr3;->a(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 29
    .line 30
    .line 31
    move-result-wide p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    invoke-virtual {v0}, Ll/ob5;->close()V

    .line 33
    .line 34
    .line 35
    return-wide p0

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    :try_start_1
    invoke-virtual {v0, p0}, Ll/ob5;->n(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 42
    :catchall_1
    move-exception p0

    .line 43
    invoke-virtual {v0}, Ll/ob5;->close()V

    .line 44
    .line 45
    .line 46
    throw p0
.end method

.method public abstract b()Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
