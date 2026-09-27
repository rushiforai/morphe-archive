.class final Lkotlin/collections/DetachedMapEntry;
.super Ljava/lang/Object;
.source "Maps.kt"

# interfaces
.implements Ljava/util/Map$Entry;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010&\n\u0002\u0008\t\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0002\u0018\u0000*\u0006\u0008\u0000\u0010\u0001 \u0001*\u0006\u0008\u0001\u0010\u0002 \u00012\u000e\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u0002H\u00020\u0003B\u0019\u0008F\u0012\u0006\u0010\u0004\u001a\u00028\u0000\u0012\u0006\u0010\u0005\u001a\u00028\u0001\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0014\u0010\u000c\u001a\u00020\r2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0096\u0082\u0004J\n\u0010\u0010\u001a\u00020\u0011H\u0096\u0080\u0004J\n\u0010\u0012\u001a\u00020\u0013H\u0096\u0080\u0004R\u0017\u0010\u0004\u001a\u00028\u0000X\u0096\u0084\u0008\u00a2\u0006\n\n\u0002\u0010\n\u001a\u0004\u0008\u0008\u0010\tR\u0017\u0010\u0005\u001a\u00028\u0001X\u0096\u0084\u0008\u00a2\u0006\n\n\u0002\u0010\n\u001a\u0004\u0008\u000b\u0010\t\u00a8\u0006\u0014"
    }
    d2 = {
        "Lkotlin/collections/DetachedMapEntry;",
        "K",
        "V",
        "",
        "key",
        "value",
        "<init>",
        "(Ljava/lang/Object;Ljava/lang/Object;)V",
        "getKey",
        "()Ljava/lang/Object;",
        "Ljava/lang/Object;",
        "getValue",
        "equals",
        "",
        "other",
        "",
        "hashCode",
        "",
        "toString",
        "",
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


# instance fields
.field private final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field private final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 354
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/collections/DetachedMapEntry;->key:Ljava/lang/Object;

    iput-object p2, p0, Lkotlin/collections/DetachedMapEntry;->value:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3

    .line 355
    sget-object v0, Lkotlin/collections/AbstractMap;->Companion:Lkotlin/collections/AbstractMap$Companion;

    check-cast p0, Ljava/util/Map$Entry;

    invoke-virtual {v0, p0, p1}, Lkotlin/collections/AbstractMap$Companion;->entryEquals$kotlin_stdlib(Ljava/util/Map$Entry;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public getKey()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 354
    iget-object p0, p0, Lkotlin/collections/DetachedMapEntry;->key:Ljava/lang/Object;

    return-object p0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 354
    iget-object p0, p0, Lkotlin/collections/DetachedMapEntry;->value:Ljava/lang/Object;

    return-object p0
.end method

.method public hashCode()I
    .registers 2

    .line 356
    sget-object v0, Lkotlin/collections/AbstractMap;->Companion:Lkotlin/collections/AbstractMap$Companion;

    check-cast p0, Ljava/util/Map$Entry;

    invoke-virtual {v0, p0}, Lkotlin/collections/AbstractMap$Companion;->entryHashCode$kotlin_stdlib(Ljava/util/Map$Entry;)I

    move-result p0

    return p0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Operation is not supported for read-only collection"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 357
    sget-object v0, Lkotlin/collections/AbstractMap;->Companion:Lkotlin/collections/AbstractMap$Companion;

    check-cast p0, Ljava/util/Map$Entry;

    invoke-virtual {v0, p0}, Lkotlin/collections/AbstractMap$Companion;->entryToString$kotlin_stdlib(Ljava/util/Map$Entry;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
