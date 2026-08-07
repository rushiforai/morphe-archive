.class public final Lcom/tencent/cloud/ai/network/okio/n;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/logging/Logger;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lcom/tencent/cloud/ai/network/okio/n;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lcom/tencent/cloud/ai/network/okio/n;->a:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okio/v;)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 1

    .line 50
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/q;

    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/q;-><init>(Lcom/tencent/cloud/ai/network/okio/v;)V

    return-object v0
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okio/w;)Lcom/tencent/cloud/ai/network/okio/g;
    .locals 1

    .line 51
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/r;

    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/r;-><init>(Lcom/tencent/cloud/ai/network/okio/w;)V

    return-object v0
.end method

.method public static a(Ljava/net/Socket;)Lcom/tencent/cloud/ai/network/okio/v;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    new-instance v1, Lcom/tencent/cloud/ai/network/okio/o;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/tencent/cloud/ai/network/okio/o;-><init>(Ljava/net/Socket;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/m;

    .line 22
    .line 23
    invoke-direct {v0, v1, p0}, Lcom/tencent/cloud/ai/network/okio/m;-><init>(Lcom/tencent/cloud/ai/network/okio/x;Ljava/io/OutputStream;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Lcom/tencent/cloud/ai/network/okio/a;

    .line 27
    .line 28
    invoke-direct {p0, v1, v0}, Lcom/tencent/cloud/ai/network/okio/a;-><init>(Lcom/tencent/cloud/ai/network/okio/c;Lcom/tencent/cloud/ai/network/okio/v;)V

    .line 29
    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    const-string p0, "out == null"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_1
    const-string p0, "socket\'s output stream == null"

    .line 39
    .line 40
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_2
    const-string p0, "socket == null"

    .line 45
    .line 46
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public static a(Ljava/io/File;)Lcom/tencent/cloud/ai/network/okio/w;
    .locals 1

    if-eqz p0, :cond_0

    .line 54
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 55
    new-instance p0, Lcom/tencent/cloud/ai/network/okio/x;

    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okio/x;-><init>()V

    invoke-static {v0, p0}, Lcom/tencent/cloud/ai/network/okio/n;->a(Ljava/io/InputStream;Lcom/tencent/cloud/ai/network/okio/x;)Lcom/tencent/cloud/ai/network/okio/w;

    move-result-object p0

    return-object p0

    .line 56
    :cond_0
    const-string p0, "file == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Ljava/io/InputStream;Lcom/tencent/cloud/ai/network/okio/x;)Lcom/tencent/cloud/ai/network/okio/w;
    .locals 1

    if-eqz p0, :cond_0

    .line 52
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/n$a;

    invoke-direct {v0, p1, p0}, Lcom/tencent/cloud/ai/network/okio/n$a;-><init>(Lcom/tencent/cloud/ai/network/okio/x;Ljava/io/InputStream;)V

    return-object v0

    .line 53
    :cond_0
    const-string p0, "in == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Ljava/lang/AssertionError;)Z
    .locals 1

    .line 57
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    const-string v0, "getsockname failed"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static b(Ljava/net/Socket;)Lcom/tencent/cloud/ai/network/okio/w;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/o;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/o;-><init>(Ljava/net/Socket;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0, v0}, Lcom/tencent/cloud/ai/network/okio/n;->a(Ljava/io/InputStream;Lcom/tencent/cloud/ai/network/okio/x;)Lcom/tencent/cloud/ai/network/okio/w;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v1, Lcom/tencent/cloud/ai/network/okio/b;

    .line 24
    .line 25
    invoke-direct {v1, v0, p0}, Lcom/tencent/cloud/ai/network/okio/b;-><init>(Lcom/tencent/cloud/ai/network/okio/c;Lcom/tencent/cloud/ai/network/okio/w;)V

    .line 26
    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_0
    const-string p0, "socket\'s input stream == null"

    .line 30
    .line 31
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_1
    const-string p0, "socket == null"

    .line 36
    .line 37
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-object v0
.end method
