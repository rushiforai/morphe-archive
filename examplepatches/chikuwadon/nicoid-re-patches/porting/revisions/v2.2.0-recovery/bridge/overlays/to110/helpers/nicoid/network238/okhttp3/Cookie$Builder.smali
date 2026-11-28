.class public final Lnicoid/network238/okhttp3/Cookie$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Cookie;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003B\u0011\u0008\u0010\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0002\u0010\u0006J\u000e\u0010\u0007\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0008J\u000e\u0010\t\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0008J\u000e\u0010\n\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u000bJ\u000e\u0010\u000c\u001a\u00020\u00002\u0006\u0010\u000c\u001a\u00020\u0008J\u000e\u0010\u0014\u001a\u00020\u00002\u0006\u0010\u000c\u001a\u00020\u0008J\u0018\u0010\u000c\u001a\u00020\u00002\u0006\u0010\u000c\u001a\u00020\u00082\u0006\u0010\u0012\u001a\u00020\u000fH\u0002J\u000e\u0010\r\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u0008J\u0006\u0010\u000e\u001a\u00020\u0000J\u0006\u0010\u0010\u001a\u00020\u0000J\u000e\u0010\u0013\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020\u0008J\u0006\u0010\u0015\u001a\u00020\u0005R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Cookie$Builder;",
        "",
        "<init>",
        "()V",
        "cookie",
        "Lnicoid/network238/okhttp3/Cookie;",
        "(Lnicoid/network238/okhttp3/Cookie;)V",
        "name",
        "",
        "value",
        "expiresAt",
        "",
        "domain",
        "path",
        "secure",
        "",
        "httpOnly",
        "persistent",
        "hostOnly",
        "sameSite",
        "hostOnlyDomain",
        "build",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private domain:Ljava/lang/String;

.field private expiresAt:J

.field private hostOnly:Z

.field private httpOnly:Z

.field private name:Ljava/lang/String;

.field private path:Ljava/lang/String;

.field private persistent:Z

.field private sameSite:Ljava/lang/String;

.field private secure:Z

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 295
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 298
    const-wide v0, 0xe677d21fdbffL

    iput-wide v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->expiresAt:J

    .line 300
    const-string v0, "/"

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->path:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/Cookie;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 307
    invoke-direct {p0}, Lnicoid/network238/okhttp3/Cookie$Builder;-><init>()V

    .line 308
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie;->name()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->name:Ljava/lang/String;

    .line 309
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie;->value()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->value:Ljava/lang/String;

    .line 310
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie;->expiresAt()J

    move-result-wide v0

    iput-wide v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->expiresAt:J

    .line 311
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie;->domain()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->domain:Ljava/lang/String;

    .line 312
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie;->path()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->path:Ljava/lang/String;

    .line 313
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie;->secure()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->secure:Z

    .line 314
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie;->httpOnly()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->httpOnly:Z

    .line 315
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie;->persistent()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->persistent:Z

    .line 316
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie;->hostOnly()Z

    move-result v0

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->hostOnly:Z

    .line 317
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Cookie;->sameSite()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->sameSite:Ljava/lang/String;

    return-void
.end method

.method private final domain(Ljava/lang/String;Z)Lnicoid/network238/okhttp3/Cookie$Builder;
    .registers 5

    .line 358
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 360
    iput-object v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->domain:Ljava/lang/String;

    .line 361
    iput-boolean p2, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->hostOnly:Z

    return-object p0

    .line 359
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unexpected domain: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method


# virtual methods
.method public final build()Lnicoid/network238/okhttp3/Cookie;
    .registers 14

    .line 387
    new-instance v0, Lnicoid/network238/okhttp3/Cookie;

    .line 388
    iget-object v1, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->name:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 389
    iget-object v2, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->value:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 390
    iget-wide v3, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->expiresAt:J

    .line 391
    iget-object v5, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->domain:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 392
    iget-object v6, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->path:Ljava/lang/String;

    .line 393
    iget-boolean v7, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->secure:Z

    .line 394
    iget-boolean v8, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->httpOnly:Z

    .line 395
    iget-boolean v9, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->persistent:Z

    .line 396
    iget-boolean v10, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->hostOnly:Z

    .line 397
    iget-object v11, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->sameSite:Ljava/lang/String;

    .line 387
    const/4 v12, 0x0

    invoke-direct/range {v0 .. v12}, Lnicoid/network238/okhttp3/Cookie;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;ZZZZLjava/lang/String;Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 391
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "builder.domain == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 389
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "builder.value == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 388
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "builder.name == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final domain(Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 345
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/Cookie$Builder;->domain(Ljava/lang/String;Z)Lnicoid/network238/okhttp3/Cookie$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final expiresAt(J)Lnicoid/network238/okhttp3/Cookie$Builder;
    .registers 6

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const-wide/high16 p1, -0x8000000000000000L

    :cond_0
    const-wide v0, 0xe677d21fdbffL

    cmp-long v2, p1, v0

    if-lez v2, :cond_1

    move-wide p1, v0

    .line 337
    :cond_1
    iput-wide p1, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->expiresAt:J

    .line 338
    const/4 p1, 0x1

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->persistent:Z

    return-object p0
.end method

.method public final hostOnlyDomain(Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 351
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/Cookie$Builder;->domain(Ljava/lang/String;Z)Lnicoid/network238/okhttp3/Cookie$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final httpOnly()Lnicoid/network238/okhttp3/Cookie$Builder;
    .registers 2

    .line 377
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->httpOnly:Z

    return-object p0
.end method

.method public final name(Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 322
    invoke-static {p1}, Lnicoid/network238/kotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 323
    iput-object p1, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->name:Ljava/lang/String;

    return-object p0

    .line 322
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "name is not trimmed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final path(Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie$Builder;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 366
    const/4 v0, 0x2

    const/4 v1, 0x0

    const-string v2, "/"

    const/4 v3, 0x0

    invoke-static {p1, v2, v3, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 367
    iput-object p1, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->path:Ljava/lang/String;

    return-object p0

    .line 366
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "path must start with \'/\'"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final sameSite(Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 382
    invoke-static {p1}, Lnicoid/network238/kotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 383
    iput-object p1, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->sameSite:Ljava/lang/String;

    return-object p0

    .line 382
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "sameSite is not trimmed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final secure()Lnicoid/network238/okhttp3/Cookie$Builder;
    .registers 2

    .line 372
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->secure:Z

    return-object p0
.end method

.method public final value(Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 328
    invoke-static {p1}, Lnicoid/network238/kotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 329
    iput-object p1, p0, Lnicoid/network238/okhttp3/Cookie$Builder;->value:Ljava/lang/String;

    return-object p0

    .line 328
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "value is not trimmed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
