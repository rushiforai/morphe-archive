.class public Ll/am2$a;
.super Ll/aj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/am2;->i(Ljava/lang/String;Ll/y20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/aj2<",
        "Ll/fb5<",
        "Lcom/facebook/common/memory/PooledByteBuffer;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ll/am2;


# direct methods
.method public constructor <init>(Ll/am2;Ll/y20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/am2$a;->b:Ll/am2;

    .line 2
    .line 3
    iput-object p2, p0, Ll/am2$a;->a:Ll/y20;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/aj2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public e(Ll/i6c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "Ll/fb5<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/am2$a;->a:Ll/y20;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public f(Ll/i6c;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "Ll/fb5<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/i6c;->getResult()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/fb5;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/facebook/common/memory/PooledByteBuffer;

    .line 12
    .line 13
    new-instance v1, Ll/gj80;

    .line 14
    .line 15
    invoke-direct {v1, v0}, Ll/gj80;-><init>(Lcom/facebook/common/memory/PooledByteBuffer;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    :try_start_0
    const-string v2, "facebook"

    .line 20
    .line 21
    invoke-static {v2}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    new-instance v3, Ljava/io/FileOutputStream;

    .line 26
    .line 27
    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v3}, Ll/oki;->f(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Ll/am2$a;->a:Ll/y20;

    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {v3, v2}, Ll/y20;->call(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    .line 42
    :try_start_1
    invoke-static {v1}, Ll/lb5;->b(Ljava/io/InputStream;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V
    :try_end_1
    .catch Ljava/lang/AssertionError; {:try_start_1 .. :try_end_1} :catch_0

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catch_0
    move-exception p1

    .line 50
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/am2$a;->a:Ll/y20;

    .line 54
    .line 55
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catchall_0
    move-exception v2

    .line 60
    goto :goto_1

    .line 61
    :catch_1
    move-exception v2

    .line 62
    :try_start_2
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    iget-object v2, p0, Ll/am2$a;->a:Ll/y20;

    .line 66
    .line 67
    invoke-interface {v2, v0}, Ll/y20;->call(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 68
    .line 69
    .line 70
    :try_start_3
    invoke-static {v1}, Ll/lb5;->b(Ljava/io/InputStream;)V

    .line 71
    .line 72
    .line 73
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V
    :try_end_3
    .catch Ljava/lang/AssertionError; {:try_start_3 .. :try_end_3} :catch_0

    .line 74
    .line 75
    .line 76
    :goto_0
    return-void

    .line 77
    :goto_1
    :try_start_4
    invoke-static {v1}, Ll/lb5;->b(Ljava/io/InputStream;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V
    :try_end_4
    .catch Ljava/lang/AssertionError; {:try_start_4 .. :try_end_4} :catch_2

    .line 81
    .line 82
    .line 83
    goto :goto_2

    .line 84
    :catch_2
    move-exception p1

    .line 85
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/am2$a;->a:Ll/y20;

    .line 89
    .line 90
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    :goto_2
    throw v2
.end method
