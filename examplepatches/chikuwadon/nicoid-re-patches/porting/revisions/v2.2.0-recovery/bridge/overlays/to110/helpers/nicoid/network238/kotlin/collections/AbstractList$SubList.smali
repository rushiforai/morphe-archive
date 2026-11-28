.class final Lnicoid/network238/kotlin/collections/AbstractList$SubList;
.super Lnicoid/network238/kotlin/collections/AbstractList;
.source "SourceFile"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/collections/AbstractList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SubList"
.end annotation


# instance fields
.field private _size:I

.field private final fromIndex:I

.field private final list:Lnicoid/network238/kotlin/collections/AbstractList;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/collections/AbstractList;II)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/AbstractList;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/collections/AbstractList$SubList;->list:Lnicoid/network238/kotlin/collections/AbstractList;

    iput p2, p0, Lnicoid/network238/kotlin/collections/AbstractList$SubList;->fromIndex:I

    .line 41
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    invoke-virtual {p1}, Lnicoid/network238/kotlin/collections/AbstractCollection;->size()I

    move-result p1

    invoke-virtual {v0, p2, p3, p1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkRangeIndexes$kotlin_stdlib(III)V

    sub-int/2addr p3, p2

    .line 42
    iput p3, p0, Lnicoid/network238/kotlin/collections/AbstractList$SubList;->_size:I

    return-void
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .registers 4

    .line 46
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/AbstractList$SubList;->_size:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 48
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/AbstractList$SubList;->list:Lnicoid/network238/kotlin/collections/AbstractList;

    iget v1, p0, Lnicoid/network238/kotlin/collections/AbstractList$SubList;->fromIndex:I

    add-int/2addr v1, p1

    invoke-virtual {v0, v1}, Lnicoid/network238/kotlin/collections/AbstractList;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getSize()I
    .registers 2

    .line 51
    iget v0, p0, Lnicoid/network238/kotlin/collections/AbstractList$SubList;->_size:I

    return v0
.end method
