.class public final Le/e/a/CastDiagnostics;
.super Ljava/lang/Object;
.source "CastDiagnostics.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static connected()V
    .registers 1

    .line 11
    const-string v0, "Cast: Google API connection established; launching legacy receiver"

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void
.end method

.method public static discovery()V
    .registers 1

    .line 10
    const-string v0, "Cast: discovery started for legacy receiver FAB5A9D8"

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void
.end method

.method public static receiverResult(Ljava/lang/Object;)V
    .registers 3
    .param p0, "status"    # Ljava/lang/Object;

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Cast: receiver launch result: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void
.end method

.method static record(Ljava/lang/String;)V
    .registers 7
    .param p0, "message"    # Ljava/lang/String;

    .line 7
    :try_start_0
    const-string v0, "e.e.a.ModernDebug"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "record"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_1c} :catch_1d

    goto :goto_1e

    .line 8
    :catch_1d
    move-exception v0

    :goto_1e
    nop

    .line 9
    return-void
.end method

.method public static stream(Ljava/lang/String;)V
    .registers 3
    .param p0, "url"    # Ljava/lang/String;

    .line 14
    if-nez p0, :cond_8

    const-string v0, "Cast: stream acquisition failed"

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void

    .line 16
    :cond_8
    :try_start_8
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v0
    :try_end_11
    .catch Ljava/net/MalformedURLException; {:try_start_8 .. :try_end_11} :catch_12

    .line 17
    .local v0, "path":Ljava/lang/String;
    goto :goto_15

    .end local v0    # "path":Ljava/lang/String;
    :catch_12
    move-exception v0

    .local v0, "ignored":Ljava/net/MalformedURLException;
    move-object v1, p0

    move-object v0, v1

    .line 18
    .local v0, "path":Ljava/lang/String;
    :goto_15
    const-string v1, ".m3u8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_20

    const-string v1, "Cast: HLS stream acquired; preparing authenticated relay"

    goto :goto_22

    :cond_20
    const-string v1, "Cast: stream reached legacy relay"

    :goto_22
    invoke-static {v1}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 19
    return-void
.end method
