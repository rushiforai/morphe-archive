.class final Lkotlin/collections/AbstractList$SubList;
.super Lkotlin/collections/AbstractList;
.source "AbstractList.kt"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/collections/AbstractList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SubList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lkotlin/collections/AbstractList<",
        "TE;>;",
        "Ljava/util/RandomAccess;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u000b\n\u0002\u0010 \n\u0000\u0008\u0002\u0018\u0000*\u0006\u0008\u0001\u0010\u0001 \u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u00022\u00060\u0003j\u0002`\u0004B\'\u0008F\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\u000c\u001a\u00028\u00012\u0006\u0010\r\u001a\u00020\u0007H\u0096\u0082\u0004\u00a2\u0006\u0002\u0010\u000eJ \u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u00132\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0007H\u0096\u0080\u0004R\u0015\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u0002X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0006\u001a\u00020\u0007X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000b\u001a\u00020\u0007X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u000f\u001a\u00020\u00078VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0014"
    }
    d2 = {
        "Lkotlin/collections/AbstractList$SubList;",
        "E",
        "Lkotlin/collections/AbstractList;",
        "Ljava/util/RandomAccess;",
        "Lkotlin/collections/RandomAccess;",
        "list",
        "fromIndex",
        "",
        "toIndex",
        "<init>",
        "(Lkotlin/collections/AbstractList;II)V",
        "_size",
        "get",
        "index",
        "(I)Ljava/lang/Object;",
        "size",
        "getSize",
        "()I",
        "subList",
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
.field private _size:I

.field private final fromIndex:I

.field private final list:Lkotlin/collections/AbstractList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/collections/AbstractList<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lkotlin/collections/AbstractList;II)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/collections/AbstractList<",
            "+TE;>;II)V"
        }
    .end annotation

    const-string v0, "list"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 37
    invoke-direct {p0}, Lkotlin/collections/AbstractList;-><init>()V

    iput-object p1, p0, Lkotlin/collections/AbstractList$SubList;->list:Lkotlin/collections/AbstractList;

    iput p2, p0, Lkotlin/collections/AbstractList$SubList;->fromIndex:I

    .line 41
    sget-object v0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    invoke-virtual {p1}, Lkotlin/collections/AbstractList;->size()I

    move-result p1

    invoke-virtual {v0, p2, p3, p1}, Lkotlin/collections/AbstractList$Companion;->checkRangeIndexes$kotlin_stdlib(III)V

    sub-int/2addr p3, p2

    .line 42
    iput p3, p0, Lkotlin/collections/AbstractList$SubList;->_size:I

    return-void
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 46
    sget-object v0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    iget v1, p0, Lkotlin/collections/AbstractList$SubList;->_size:I

    invoke-virtual {v0, p1, v1}, Lkotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 48
    iget-object v0, p0, Lkotlin/collections/AbstractList$SubList;->list:Lkotlin/collections/AbstractList;

    iget p0, p0, Lkotlin/collections/AbstractList$SubList;->fromIndex:I

    add-int/2addr p0, p1

    invoke-virtual {v0, p0}, Lkotlin/collections/AbstractList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getSize()I
    .registers 1

    .line 51
    iget p0, p0, Lkotlin/collections/AbstractList$SubList;->_size:I

    return p0
.end method

.method public subList(II)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "TE;>;"
        }
    .end annotation

    .line 54
    sget-object v0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    iget v1, p0, Lkotlin/collections/AbstractList$SubList;->_size:I

    invoke-virtual {v0, p1, p2, v1}, Lkotlin/collections/AbstractList$Companion;->checkRangeIndexes$kotlin_stdlib(III)V

    .line 55
    new-instance v0, Lkotlin/collections/AbstractList$SubList;

    iget-object v1, p0, Lkotlin/collections/AbstractList$SubList;->list:Lkotlin/collections/AbstractList;

    iget p0, p0, Lkotlin/collections/AbstractList$SubList;->fromIndex:I

    add-int/2addr p1, p0

    add-int/2addr p0, p2

    invoke-direct {v0, v1, p1, p0}, Lkotlin/collections/AbstractList$SubList;-><init>(Lkotlin/collections/AbstractList;II)V

    check-cast v0, Ljava/util/List;

    return-object v0
.end method
