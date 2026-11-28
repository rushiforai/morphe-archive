.class public final Lnicoid/network238/okio/TypedOptions$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/TypedOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u001c\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J>\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u0002H\u00060\u0005\"\u0008\u0008\u0001\u0010\u0006*\u00020\u00012\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u0002H\u00060\u00082\u0012\u0010\t\u001a\u000e\u0012\u0004\u0012\u0002H\u0006\u0012\u0004\u0012\u00020\u000b0\nH\u0087\u0008\u00f8\u0001\u0000\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u000c"
    }
    d2 = {
        "Lnicoid/network238/okio/TypedOptions$Companion;",
        "",
        "<init>",
        "()V",
        "of",
        "Lnicoid/network238/okio/TypedOptions;",
        "T",
        "values",
        "",
        "encode",
        "Lnicoid/network238/kotlin/Function1;",
        "Lnicoid/network238/okio/ByteString;",
        "okio"
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

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okio/TypedOptions$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final of(Ljava/lang/Iterable;Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okio/TypedOptions;
    .registers 10
    .param p1, "values"    # Ljava/lang/Iterable;
    .param p2, "encode"    # Lnicoid/network238/kotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TT;>;",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")",
            "Lnicoid/network238/okio/TypedOptions<",
            "TT;>;"
        }
    .end annotation

    const-string v0, "values"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "encode"

    invoke-static {p2, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 46
    .local v0, "$i$f$of":I
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    .line 47
    .local v1, "list":Ljava/util/List;
    sget-object v2, Lnicoid/network238/okio/Options;->Companion:Lnicoid/network238/okio/Options$Companion;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    new-array v4, v3, [Lnicoid/network238/okio/ByteString;

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_0

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {p2, v6}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v4, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v2, v4}, Lnicoid/network238/okio/Options$Companion;->of([Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Options;

    move-result-object v2

    .line 48
    .local v2, "options":Lnicoid/network238/okio/Options;
    new-instance v3, Lnicoid/network238/okio/TypedOptions;

    invoke-direct {v3, v1, v2}, Lnicoid/network238/okio/TypedOptions;-><init>(Ljava/util/List;Lnicoid/network238/okio/Options;)V

    return-object v3
.end method
