.class public final Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;
.super Lkotlin/collections/AbstractList;
.source "_UArraysJvm.kt"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt;->asList-rL5Bavg([S)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/collections/AbstractList<",
        "Lkotlin/UShort;",
        ">;",
        "Ljava/util/RandomAccess;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u000e*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00060\u0003j\u0002`\u0004J\n\u0010\t\u001a\u00020\nH\u0096\u0080\u0004J\u0019\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\u0002H\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0019\u0010\u000f\u001a\u00020\u00022\u0006\u0010\u0010\u001a\u00020\u0006H\u0096\u0082\u0004\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0019\u0010\u0013\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0002H\u0096\u0080\u0004\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0019\u0010\u0016\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0002H\u0096\u0080\u0004\u00a2\u0006\u0004\u0008\u0017\u0010\u0015R\u0015\u0010\u0005\u001a\u00020\u00068VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u0018"
    }
    d2 = {
        "kotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4",
        "Lkotlin/collections/AbstractList;",
        "Lkotlin/UShort;",
        "Ljava/util/RandomAccess;",
        "Lkotlin/collections/RandomAccess;",
        "size",
        "",
        "getSize",
        "()I",
        "isEmpty",
        "",
        "contains",
        "element",
        "contains-xj2QHRw",
        "(S)Z",
        "get",
        "index",
        "get-Mh2AYeg",
        "(I)S",
        "indexOf",
        "indexOf-xj2QHRw",
        "(S)I",
        "lastIndexOf",
        "lastIndexOf-xj2QHRw",
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
.field final synthetic $this_asList:[S


# direct methods
.method constructor <init>([S)V
    .registers 2

    iput-object p1, p0, Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;->$this_asList:[S

    .line 125
    invoke-direct {p0}, Lkotlin/collections/AbstractList;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge contains(Ljava/lang/Object;)Z
    .registers 3

    .line 125
    instance-of v0, p1, Lkotlin/UShort;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    check-cast p1, Lkotlin/UShort;

    invoke-virtual {p1}, Lkotlin/UShort;->unbox-impl()S

    move-result p1

    invoke-virtual {p0, p1}, Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;->contains-xj2QHRw(S)Z

    move-result p0

    return p0
.end method

.method public contains-xj2QHRw(S)Z
    .registers 2

    .line 128
    iget-object p0, p0, Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;->$this_asList:[S

    invoke-static {p0, p1}, Lkotlin/UShortArray;->contains-xj2QHRw([SS)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2

    .line 125
    invoke-virtual {p0, p1}, Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;->get-Mh2AYeg(I)S

    move-result p0

    invoke-static {p0}, Lkotlin/UShort;->box-impl(S)Lkotlin/UShort;

    move-result-object p0

    return-object p0
.end method

.method public get-Mh2AYeg(I)S
    .registers 2

    .line 129
    iget-object p0, p0, Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;->$this_asList:[S

    invoke-static {p0, p1}, Lkotlin/UShortArray;->get-Mh2AYeg([SI)S

    move-result p0

    return p0
.end method

.method public getSize()I
    .registers 1

    .line 126
    iget-object p0, p0, Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;->$this_asList:[S

    invoke-static {p0}, Lkotlin/UShortArray;->getSize-impl([S)I

    move-result p0

    return p0
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .registers 3

    .line 125
    instance-of v0, p1, Lkotlin/UShort;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Lkotlin/UShort;

    invoke-virtual {p1}, Lkotlin/UShort;->unbox-impl()S

    move-result p1

    invoke-virtual {p0, p1}, Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;->indexOf-xj2QHRw(S)I

    move-result p0

    return p0
.end method

.method public indexOf-xj2QHRw(S)I
    .registers 2

    .line 130
    iget-object p0, p0, Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;->$this_asList:[S

    invoke-static {p0, p1}, Lkotlin/collections/ArraysKt;->indexOf([SS)I

    move-result p0

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    .line 127
    iget-object p0, p0, Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;->$this_asList:[S

    invoke-static {p0}, Lkotlin/UShortArray;->isEmpty-impl([S)Z

    move-result p0

    return p0
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .registers 3

    .line 125
    instance-of v0, p1, Lkotlin/UShort;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Lkotlin/UShort;

    invoke-virtual {p1}, Lkotlin/UShort;->unbox-impl()S

    move-result p1

    invoke-virtual {p0, p1}, Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;->lastIndexOf-xj2QHRw(S)I

    move-result p0

    return p0
.end method

.method public lastIndexOf-xj2QHRw(S)I
    .registers 2

    .line 131
    iget-object p0, p0, Lkotlin/collections/unsigned/UArraysKt___UArraysJvmKt$asList$4;->$this_asList:[S

    invoke-static {p0, p1}, Lkotlin/collections/ArraysKt;->lastIndexOf([SS)I

    move-result p0

    return p0
.end method
