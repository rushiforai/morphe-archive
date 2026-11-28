.class public final Lnicoid/network238/okhttp3/Headers$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Headers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010!\n\u0002\u0010\u000e\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\t\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u0006H\u0000\u00a2\u0006\u0002\u0008\u000bJ\u000e\u0010\u000c\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u0006J\u0016\u0010\u000c\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0006J\u0016\u0010\u000f\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0006J\u000e\u0010\u0010\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\u0012J\u0016\u0010\u000c\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0013J\u0018\u0010\u000c\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0014H\u0007J\u0019\u0010\u0015\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0013H\u0086\u0002J\u0019\u0010\u0015\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0014H\u0087\u0002J\u001d\u0010\t\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0006H\u0000\u00a2\u0006\u0002\u0008\u000bJ\u000e\u0010\u0016\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u0006J\u0019\u0010\u0015\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0006H\u0086\u0002J\u0013\u0010\u0017\u001a\u0004\u0018\u00010\u00062\u0006\u0010\r\u001a\u00020\u0006H\u0086\u0002J\u0006\u0010\u0018\u001a\u00020\u0012R\u001a\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u0019"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Headers$Builder;",
        "",
        "<init>",
        "()V",
        "namesAndValues",
        "",
        "",
        "getNamesAndValues$okhttp",
        "()Ljava/util/List;",
        "addLenient",
        "line",
        "addLenient$okhttp",
        "add",
        "name",
        "value",
        "addUnsafeNonAscii",
        "addAll",
        "headers",
        "Lnicoid/network238/okhttp3/Headers;",
        "Ljava/util/Date;",
        "Ljava/time/Instant;",
        "set",
        "removeAll",
        "get",
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
.field private final namesAndValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 206
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final add(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 236
    const/16 v1, 0x3a

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x6

    const/4 v5, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    .line 238
    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/kotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Lnicoid/network238/okhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0

    .line 237
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Unexpected header: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final add(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 247
    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/_HeadersCommonKt;->commonAdd(Lnicoid/network238/okhttp3/Headers$Builder;Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final add(Ljava/lang/String;Ljava/time/Instant;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 284
    invoke-static {p2}, Ljava/util/Date;->from(Ljava/time/Instant;)Ljava/util/Date;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/util/Date;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final add(Ljava/lang/String;Ljava/util/Date;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 273
    invoke-static {p2}, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->toHttpDateString(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final addAll(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 264
    invoke-static {p0, p1}, Lnicoid/network238/okhttp3/internal/_HeadersCommonKt;->commonAddAll(Lnicoid/network238/okhttp3/Headers$Builder;Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final addLenient$okhttp(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 214
    const/16 v1, 0x3a

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result p1

    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    .line 217
    invoke-virtual {v0, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    add-int/2addr p1, v2

    invoke-virtual {v0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0

    :cond_0
    nop

    .line 220
    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result p1

    const/16 v1, 0x3a

    const-string v3, ""

    if-ne p1, v1, :cond_1

    .line 223
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v3, p1}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0

    .line 228
    :cond_1
    invoke-virtual {p0, v3, v0}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0
.end method

.method public final addLenient$okhttp(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 310
    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/_HeadersCommonKt;->commonAddLenient(Lnicoid/network238/okhttp3/Headers$Builder;Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final addUnsafeNonAscii(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 257
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_HeadersCommonKt;->headersCheckName(Ljava/lang/String;)V

    .line 258
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0
.end method

.method public final build()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 326
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_HeadersCommonKt;->commonBuild(Lnicoid/network238/okhttp3/Headers$Builder;)Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    return-object v0
.end method

.method public final get(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 324
    invoke-static {p0, p1}, Lnicoid/network238/okhttp3/internal/_HeadersCommonKt;->commonGet(Lnicoid/network238/okhttp3/Headers$Builder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final getNamesAndValues$okhttp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 206
    iget-object v0, p0, Lnicoid/network238/okhttp3/Headers$Builder;->namesAndValues:Ljava/util/List;

    return-object v0
.end method

.method public final removeAll(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 312
    invoke-static {p0, p1}, Lnicoid/network238/okhttp3/internal/_HeadersCommonKt;->commonRemoveAll(Lnicoid/network238/okhttp3/Headers$Builder;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final set(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 321
    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/_HeadersCommonKt;->commonSet(Lnicoid/network238/okhttp3/Headers$Builder;Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final set(Ljava/lang/String;Ljava/time/Instant;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 301
    invoke-static {p2}, Ljava/util/Date;->from(Ljava/time/Instant;)Ljava/util/Date;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/util/Date;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final set(Ljava/lang/String;Ljava/util/Date;)Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 293
    invoke-static {p2}, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->toHttpDateString(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    return-object p1
.end method
