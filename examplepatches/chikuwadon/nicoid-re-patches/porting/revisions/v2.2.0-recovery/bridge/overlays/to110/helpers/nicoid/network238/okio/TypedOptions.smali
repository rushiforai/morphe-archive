.class public final Lnicoid/network238/okio/TypedOptions;
.super Lnicoid/network238/kotlin/collections/AbstractList;
.source "SourceFile"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/TypedOptions$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lnicoid/network238/kotlin/collections/AbstractList;",
        "Ljava/util/RandomAccess;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0008\n\u0002\u0008\u0007\u0018\u0000 \u0017*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u00032\u00060\u0004j\u0002`\u0005:\u0001\u0017B\u001d\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0016\u0010\u0014\u001a\u00028\u00002\u0006\u0010\u0015\u001a\u00020\u0011H\u0096\u0002\u00a2\u0006\u0002\u0010\u0016R\u0014\u0010\u0008\u001a\u00020\tX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u001a\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0007X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0014\u0010\u0010\u001a\u00020\u00118VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0018"
    }
    d2 = {
        "Lnicoid/network238/okio/TypedOptions;",
        "T",
        "",
        "Lnicoid/network238/kotlin/collections/AbstractList;",
        "Ljava/util/RandomAccess;",
        "Lnicoid/network238/kotlin/collections/RandomAccess;",
        "list",
        "",
        "options",
        "Lnicoid/network238/okio/Options;",
        "<init>",
        "(Ljava/util/List;Lnicoid/network238/okio/Options;)V",
        "getOptions$okio",
        "()Lnicoid/network238/okio/Options;",
        "getList$okio",
        "()Ljava/util/List;",
        "size",
        "",
        "getSize",
        "()I",
        "get",
        "index",
        "(I)Ljava/lang/Object;",
        "Companion",
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


# static fields
.field public static final Companion:Lnicoid/network238/okio/TypedOptions$Companion;


# instance fields
.field private final list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final options:Lnicoid/network238/okio/Options;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okio/TypedOptions$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okio/TypedOptions$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okio/TypedOptions;->Companion:Lnicoid/network238/okio/TypedOptions$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lnicoid/network238/okio/Options;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+TT;>;",
            "Lnicoid/network238/okio/Options;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/AbstractList;-><init>()V

    .line 27
    iput-object p2, p0, Lnicoid/network238/okio/TypedOptions;->options:Lnicoid/network238/okio/Options;

    .line 29
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okio/TypedOptions;->list:Ljava/util/List;

    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-virtual {p2}, Lnicoid/network238/kotlin/collections/AbstractCollection;->size()I

    move-result p2

    if-ne p1, p2, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Failed requirement."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final of(Ljava/lang/Iterable;Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okio/TypedOptions;
    .registers 3
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

    sget-object v0, Lnicoid/network238/okio/TypedOptions;->Companion:Lnicoid/network238/okio/TypedOptions$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/TypedOptions$Companion;->of(Ljava/lang/Iterable;Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okio/TypedOptions;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 38
    iget-object v0, p0, Lnicoid/network238/okio/TypedOptions;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final getList$okio()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 29
    iget-object v0, p0, Lnicoid/network238/okio/TypedOptions;->list:Ljava/util/List;

    return-object v0
.end method

.method public final getOptions$okio()Lnicoid/network238/okio/Options;
    .registers 2

    .line 27
    iget-object v0, p0, Lnicoid/network238/okio/TypedOptions;->options:Lnicoid/network238/okio/Options;

    return-object v0
.end method

.method public getSize()I
    .registers 2

    .line 36
    iget-object v0, p0, Lnicoid/network238/okio/TypedOptions;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
