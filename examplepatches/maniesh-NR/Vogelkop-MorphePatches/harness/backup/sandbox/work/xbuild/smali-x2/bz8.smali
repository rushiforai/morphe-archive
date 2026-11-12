.class public abstract Lbz8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 15

    new-instance v0, Laz8;

    const-string v1, "ssl handshake timed out"

    const-string v2, "timeout"

    const-string v3, "read timed out"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const-string v2, "Timeout"

    invoke-direct {v0, v1, v2}, Laz8;-><init>(Ljava/util/List;Ljava/lang/String;)V

    new-instance v1, Laz8;

    const-string v13, "handshake failed"

    const-string v14, "unable to resolve host"

    const-string v2, "connection reset"

    const-string v3, "connection closed"

    const-string v4, "connection closed by peer"

    const-string v5, "software caused connection abort"

    const-string v6, "failed to connect to"

    const-string v7, "ssl handshake aborted"

    const-string v8, "unexpected end of stream"

    const-string v9, "connection timed out"

    const-string v10, "stream was reset"

    const-string v11, "unable to resolve host"

    const-string v12, "unable to parse tls packet header"

    filled-new-array/range {v2 .. v14}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    const-string v3, "Connection"

    invoke-direct {v1, v2, v3}, Laz8;-><init>(Ljava/util/List;Ljava/lang/String;)V

    new-instance v2, Laz8;

    const-string v7, "write error: ssl="

    const-string v8, "unacceptable certificate"

    const-string v3, "hostname blocklists.operacdn.com not verified"

    const-string v4, "chain validation failed"

    const-string v5, "java.security.cert.certpathvalidatorexception"

    const-string v6, "read error: ssl="

    filled-new-array/range {v3 .. v8}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const-string v4, "Certificate"

    invoke-direct {v2, v3, v4}, Laz8;-><init>(Ljava/util/List;Ljava/lang/String;)V

    filled-new-array {v0, v1, v2}, [Laz8;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lbz8;->a:Ljava/util/List;

    return-void
.end method
