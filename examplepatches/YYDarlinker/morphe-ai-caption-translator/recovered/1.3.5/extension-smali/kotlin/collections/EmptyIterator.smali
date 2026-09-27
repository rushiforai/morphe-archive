.class public final Lkotlin/collections/EmptyIterator;
.super Ljava/lang/Object;
.source "Collections.kt"

# interfaces
.implements Ljava/util/ListIterator;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010*\n\u0002\u0010\u0001\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\u0008\u00c0\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\n\u0010\u0005\u001a\u00020\u0006H\u0096\u0082\u0004J\n\u0010\u0007\u001a\u00020\u0006H\u0096\u0080\u0004J\n\u0010\u0008\u001a\u00020\tH\u0096\u0080\u0004J\n\u0010\n\u001a\u00020\tH\u0096\u0080\u0004J\n\u0010\u000b\u001a\u00020\u0002H\u0096\u0082\u0004J\n\u0010\u000c\u001a\u00020\u0002H\u0096\u0080\u0004\u00a8\u0006\r"
    }
    d2 = {
        "Lkotlin/collections/EmptyIterator;",
        "",
        "",
        "<init>",
        "()V",
        "hasNext",
        "",
        "hasPrevious",
        "nextIndex",
        "",
        "previousIndex",
        "next",
        "previous",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lkotlin/collections/EmptyIterator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lkotlin/collections/EmptyIterator;

    invoke-direct {v0}, Lkotlin/collections/EmptyIterator;-><init>()V

    sput-object v0, Lkotlin/collections/EmptyIterator;->INSTANCE:Lkotlin/collections/EmptyIterator;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public add(Ljava/lang/Void;)V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public hasNext()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public hasPrevious()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 1

    .line 16
    invoke-virtual {p0}, Lkotlin/collections/EmptyIterator;->next()Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public next()Ljava/lang/Void;
    .registers 1

    .line 21
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public nextIndex()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic previous()Ljava/lang/Object;
    .registers 1

    .line 16
    invoke-virtual {p0}, Lkotlin/collections/EmptyIterator;->previous()Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method

.method public previous()Ljava/lang/Void;
    .registers 1

    .line 22
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public previousIndex()I
    .registers 1

    const/4 p0, -0x1

    return p0
.end method

.method public remove()V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic set(Ljava/lang/Object;)V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public set(Ljava/lang/Void;)V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
