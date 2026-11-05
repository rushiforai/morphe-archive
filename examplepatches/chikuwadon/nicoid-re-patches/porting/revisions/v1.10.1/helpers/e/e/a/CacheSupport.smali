.class public final Le/e/a/CacheSupport;
.super Ljava/lang/Object;
.source "CacheSupport.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static beforeRequest(Ljava/net/HttpURLConnection;)V
    .registers 3

    .line 26
    const-string v0, "Origin"

    const-string v1, "https://www.nicovideo.jp"

    invoke-virtual {p0, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    return-void
.end method

.method public static cookieFor(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 13
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "e.e.a.ModernPlayback"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 14
    const-string v2, "domandCookie"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/String;

    .line 15
    invoke-static {p0, p1, v1}, Le/e/a/CacheSupport;->mergeCookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_17
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1 .. :try_end_17} :catch_18

    return-object p0

    .line 16
    :catch_18
    move-exception v1

    .line 17
    invoke-static {p0, p1, v0}, Le/e/a/SecurityPolicy240;->cookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static failed(Ljava/lang/Throwable;)V
    .registers 3

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Cache failed: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CacheSupport;->record(Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method public static http(Ljava/net/HttpURLConnection;I)V
    .registers 4

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Cache HTTP "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p0

    const-string v0, ".m3u8"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1e

    .line 32
    const-string p0, " playlist"

    goto :goto_20

    :cond_1e
    const-string p0, " segment"

    :goto_20
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CacheSupport;->record(Ljava/lang/String;)V

    .line 33
    return-void
.end method

.method static mergeCookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 22
    invoke-static {p0, p1, p2}, Le/e/a/SecurityPolicy240;->cookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static needsMigration(Ljava/io/File;)Z
    .registers 3

    .line 48
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/Android/data/com.sauzask.nicoid.hls/files/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 49
    const/4 p0, 0x0

    return p0

    .line 50
    :cond_e
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    return p0
.end method

.method private static record(Ljava/lang/String;)V
    .registers 6

    .line 41
    :try_start_0
    const-string v0, "e.e.a.ModernDebug"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "record"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_1c} :catch_1d

    goto :goto_1e

    .line 42
    :catch_1d
    move-exception p0

    :goto_1e
    nop

    .line 43
    return-void
.end method
