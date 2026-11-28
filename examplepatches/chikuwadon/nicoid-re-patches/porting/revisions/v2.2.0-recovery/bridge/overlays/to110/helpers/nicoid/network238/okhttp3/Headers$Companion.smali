.class public final Lnicoid/network238/okhttp3/Headers$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Headers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010$\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J#\u0010\u0006\u001a\u00020\u00052\u0012\u0010\u0007\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\t0\u0008\"\u00020\tH\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000bJ#\u0010\n\u001a\u00020\u00052\u0012\u0010\u0007\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\t0\u0008\"\u00020\tH\u0007\u00a2\u0006\u0004\u0008\u000c\u0010\u000bJ\u001d\u0010\r\u001a\u00020\u0005*\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t0\u000eH\u0007\u00a2\u0006\u0002\u0008\nJ!\u0010\n\u001a\u00020\u00052\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t0\u000eH\u0007\u00a2\u0006\u0002\u0008\u000cR\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Headers$Companion;",
        "",
        "<init>",
        "()V",
        "EMPTY",
        "Lnicoid/network238/okhttp3/Headers;",
        "headersOf",
        "namesAndValues",
        "",
        "",
        "of",
        "([Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers;",
        "-deprecated_of",
        "toHeaders",
        "",
        "headers",
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


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 329
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/Headers$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final -deprecated_of(Ljava/util/Map;)Lnicoid/network238/okhttp3/Headers;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lnicoid/network238/okhttp3/Headers;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 361
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Headers$Companion;->of(Ljava/util/Map;)Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    return-object p1
.end method

.method public final varargs -deprecated_of([Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 348
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Headers$Companion;->of([Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    return-object p1
.end method

.method public final of(Ljava/util/Map;)Lnicoid/network238/okhttp3/Headers;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lnicoid/network238/okhttp3/Headers;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 353
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_HeadersCommonKt;->commonToHeaders(Ljava/util/Map;)Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    return-object p1
.end method

.method public final varargs of([Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 340
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_HeadersCommonKt;->commonHeadersOf([Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    return-object p1
.end method
