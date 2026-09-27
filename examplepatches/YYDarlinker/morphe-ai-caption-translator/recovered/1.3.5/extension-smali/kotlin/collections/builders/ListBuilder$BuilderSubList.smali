.class public final Lkotlin/collections/builders/ListBuilder$BuilderSubList;
.super Lkotlin/collections/AbstractMutableList;
.source "ListBuilder.kt"

# interfaces
.implements Ljava/util/List;
.implements Ljava/util/RandomAccess;
.implements Ljava/io/Serializable;
.implements Lkotlin/jvm/internal/markers/KMutableList;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/collections/builders/ListBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BuilderSubList"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lkotlin/collections/AbstractMutableList<",
        "TE;>;",
        "Ljava/util/List<",
        "TE;>;",
        "Ljava/util/RandomAccess;",
        "Ljava/io/Serializable;",
        "Lkotlin/jvm/internal/markers/KMutableList;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0080\u0001\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\n\n\u0002\u0010)\n\u0000\n\u0002\u0010+\n\u0002\u0008\u0005\n\u0002\u0010\u001e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0010 \n\u0002\u0008\u000c\u0018\u0000*\u0004\u0008\u0001\u0010\u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u00022\u00060\u0003j\u0002`\u00042\u0008\u0012\u0004\u0012\u0002H\u00010\u00052\u00060\u0006j\u0002`\u0007:\u0001UBE\u0008F\u0012\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00028\u00010\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\u000c\u001a\u00020\u000b\u0012\u000e\u0010\r\u001a\n\u0012\u0004\u0012\u00028\u0001\u0018\u00010\u0000\u0012\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u000f\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\n\u0010\u0013\u001a\u00020\u0014H\u0082\u0080\u0004J\u0012\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0082\u0080\u0004J\n\u0010\u001c\u001a\u00020\u001dH\u0096\u0080\u0004J\u0017\u0010\u001e\u001a\u00028\u00012\u0006\u0010\u001f\u001a\u00020\u000bH\u0096\u0082\u0004\u00a2\u0006\u0002\u0010 J\u001f\u0010!\u001a\u00028\u00012\u0006\u0010\u001f\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00028\u0001H\u0096\u0082\u0008\u00a2\u0006\u0002\u0010#J\u0017\u0010$\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00028\u0001H\u0096\u0080\u0004\u00a2\u0006\u0002\u0010%J\u0017\u0010&\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00028\u0001H\u0096\u0080\u0004\u00a2\u0006\u0002\u0010%J\u0010\u0010\'\u001a\u0008\u0012\u0004\u0012\u00028\u00010(H\u0096\u0082\u0004J\u0010\u0010)\u001a\u0008\u0012\u0004\u0012\u00028\u00010*H\u0096\u0080\u0004J\u0018\u0010)\u001a\u0008\u0012\u0004\u0012\u00028\u00010*2\u0006\u0010\u001f\u001a\u00020\u000bH\u0096\u0080\u0004J\u0017\u0010+\u001a\u00020\u001d2\u0006\u0010\"\u001a\u00028\u0001H\u0096\u0080\u0008\u00a2\u0006\u0002\u0010,J\u001f\u0010+\u001a\u00020\u00162\u0006\u0010\u001f\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00028\u0001H\u0096\u0080\u0004\u00a2\u0006\u0002\u0010-J\u0018\u0010.\u001a\u00020\u001d2\u000c\u0010/\u001a\u0008\u0012\u0004\u0012\u00028\u000100H\u0096\u0080\u0008J \u0010.\u001a\u00020\u001d2\u0006\u0010\u001f\u001a\u00020\u000b2\u000c\u0010/\u001a\u0008\u0012\u0004\u0012\u00028\u000100H\u0096\u0080\u0008J\n\u00101\u001a\u00020\u0016H\u0096\u0080\u0004J\u001b\u00102\u001a\u00028\u00012\u0006\u0010\u001f\u001a\u00020\u000bH\u0097\u0080\u0008b\u0002\u00083\u00a2\u0006\u0002\u0010 J\u0017\u00104\u001a\u00020\u001d2\u0006\u0010\"\u001a\u00028\u0001H\u0096\u0080\u0008\u00a2\u0006\u0002\u0010,J\u0018\u00105\u001a\u00020\u001d2\u000c\u0010/\u001a\u0008\u0012\u0004\u0012\u00028\u000100H\u0096\u0080\u0008J\u0018\u00106\u001a\u00020\u001d2\u000c\u0010/\u001a\u0008\u0012\u0004\u0012\u00028\u000100H\u0096\u0080\u0008J \u00107\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u00022\u0006\u00108\u001a\u00020\u000b2\u0006\u00109\u001a\u00020\u000bH\u0096\u0080\u0004J\'\u0010:\u001a\u0008\u0012\u0004\u0012\u0002H;0\t\"\u0004\u0008\u0002\u0010;2\u000c\u0010<\u001a\u0008\u0012\u0004\u0012\u0002H;0\tH\u0016\u00a2\u0006\u0002\u0010=J\u0015\u0010:\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00140\tH\u0016\u00a2\u0006\u0002\u0010>J\u0014\u0010?\u001a\u00020\u001d2\u0008\u0010@\u001a\u0004\u0018\u00010\u0014H\u0096\u0082\u0004J\n\u0010A\u001a\u00020\u000bH\u0096\u0080\u0004J\n\u0010B\u001a\u00020CH\u0096\u0080\u0004J\n\u0010D\u001a\u00020\u0016H\u0082\u0080\u0004J\n\u0010E\u001a\u00020\u0016H\u0082\u0080\u0004J\n\u0010F\u001a\u00020\u0016H\u0082\u0080\u0004J\u0016\u0010I\u001a\u00020\u001d2\n\u0010@\u001a\u0006\u0012\u0002\u0008\u00030JH\u0082\u0080\u0004J\u001f\u0010K\u001a\u00020\u00162\u0006\u0010L\u001a\u00020\u000b2\u0006\u0010\"\u001a\u00028\u0001H\u0082\u0080\u0004\u00a2\u0006\u0002\u0010-J(\u0010M\u001a\u00020\u00162\u0006\u0010L\u001a\u00020\u000b2\u000c\u0010/\u001a\u0008\u0012\u0004\u0012\u00028\u0001002\u0006\u0010N\u001a\u00020\u000bH\u0082\u0080\u0004J\u0017\u0010O\u001a\u00028\u00012\u0006\u0010L\u001a\u00020\u000bH\u0082\u0080\u0004\u00a2\u0006\u0002\u0010 J\u001a\u0010P\u001a\u00020\u00162\u0006\u0010Q\u001a\u00020\u000b2\u0006\u0010R\u001a\u00020\u000bH\u0082\u0080\u0004J0\u0010S\u001a\u00020\u000b2\u0006\u0010Q\u001a\u00020\u000b2\u0006\u0010R\u001a\u00020\u000b2\u000c\u0010/\u001a\u0008\u0012\u0004\u0012\u00028\u0001002\u0006\u0010T\u001a\u00020\u001dH\u0082\u0080\u0004R\u0017\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00028\u00010\tX\u0082\u008e\u0008\u00a2\u0006\u0004\n\u0002\u0010\u0012R\u000f\u0010\n\u001a\u00020\u000bX\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000c\u001a\u00020\u000bX\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u0017\u0010\r\u001a\n\u0012\u0004\u0012\u00028\u0001\u0018\u00010\u0000X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00028\u00010\u000fX\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u0019\u001a\u00020\u000b8VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u001a\u0010\u001bR\u0015\u0010G\u001a\u00020\u001d8BX\u0082\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008G\u0010H\u00a8\u0006V"
    }
    d2 = {
        "Lkotlin/collections/builders/ListBuilder$BuilderSubList;",
        "E",
        "",
        "Ljava/util/RandomAccess;",
        "Lkotlin/collections/RandomAccess;",
        "Lkotlin/collections/AbstractMutableList;",
        "Ljava/io/Serializable;",
        "Lkotlin/io/Serializable;",
        "backing",
        "",
        "offset",
        "",
        "length",
        "parent",
        "root",
        "Lkotlin/collections/builders/ListBuilder;",
        "<init>",
        "([Ljava/lang/Object;IILkotlin/collections/builders/ListBuilder$BuilderSubList;Lkotlin/collections/builders/ListBuilder;)V",
        "[Ljava/lang/Object;",
        "writeReplace",
        "",
        "readObject",
        "",
        "input",
        "Ljava/io/ObjectInputStream;",
        "size",
        "getSize",
        "()I",
        "isEmpty",
        "",
        "get",
        "index",
        "(I)Ljava/lang/Object;",
        "set",
        "element",
        "(ILjava/lang/Object;)Ljava/lang/Object;",
        "indexOf",
        "(Ljava/lang/Object;)I",
        "lastIndexOf",
        "iterator",
        "",
        "listIterator",
        "",
        "add",
        "(Ljava/lang/Object;)Z",
        "(ILjava/lang/Object;)V",
        "addAll",
        "elements",
        "",
        "clear",
        "removeAt",
        "Lkotlin/IgnorableReturnValue;",
        "remove",
        "removeAll",
        "retainAll",
        "subList",
        "fromIndex",
        "toIndex",
        "toArray",
        "T",
        "array",
        "([Ljava/lang/Object;)[Ljava/lang/Object;",
        "()[Ljava/lang/Object;",
        "equals",
        "other",
        "hashCode",
        "toString",
        "",
        "registerModification",
        "checkForComodification",
        "checkIsMutable",
        "isReadOnly",
        "()Z",
        "contentEquals",
        "",
        "addAtInternal",
        "i",
        "addAllInternal",
        "n",
        "removeAtInternal",
        "removeRangeInternal",
        "rangeOffset",
        "rangeLength",
        "retainOrRemoveAllInternal",
        "retain",
        "Itr",
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
.field private backing:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TE;"
        }
    .end annotation
.end field

.field private length:I

.field private final offset:I

.field private final parent:Lkotlin/collections/builders/ListBuilder$BuilderSubList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/collections/builders/ListBuilder$BuilderSubList<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final root:Lkotlin/collections/builders/ListBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/collections/builders/ListBuilder<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Ljava/lang/Object;IILkotlin/collections/builders/ListBuilder$BuilderSubList;Lkotlin/collections/builders/ListBuilder;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;II",
            "Lkotlin/collections/builders/ListBuilder$BuilderSubList<",
            "TE;>;",
            "Lkotlin/collections/builders/ListBuilder<",
            "TE;>;)V"
        }
    .end annotation

    const-string v0, "backing"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "root"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 308
    invoke-direct {p0}, Lkotlin/collections/AbstractMutableList;-><init>()V

    .line 309
    iput-object p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    .line 310
    iput p2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    .line 311
    iput p3, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    .line 312
    iput-object p4, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    .line 313
    iput-object p5, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    .line 316
    # getter for: Lkotlin/collections/builders/ListBuilder;->modCount:I
    invoke-static {p5}, Lkotlin/collections/builders/ListBuilder;->access$getModCount$p$s-2084097795(Lkotlin/collections/builders/ListBuilder;)I

    move-result p1

    iput p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->modCount:I

    return-void
.end method

.method public static final synthetic access$getBacking$p(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)[Ljava/lang/Object;
    .registers 1

    .line 308
    iget-object p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    return-object p0
.end method

.method public static final synthetic access$getLength$p(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)I
    .registers 1

    .line 308
    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return p0
.end method

.method public static final synthetic access$getModCount$p$s1462993667(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)I
    .registers 1

    .line 308
    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->modCount:I

    return p0
.end method

.method public static final synthetic access$getOffset$p(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)I
    .registers 1

    .line 308
    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    return p0
.end method

.method public static final synthetic access$getRoot$p(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)Lkotlin/collections/builders/ListBuilder;
    .registers 1

    .line 308
    iget-object p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    return-object p0
.end method

.method private final addAllInternal(ILjava/util/Collection;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection<",
            "+TE;>;I)V"
        }
    .end annotation

    .line 520
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->registerModification()V

    .line 521
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    if-eqz v0, :cond_b

    .line 522
    invoke-direct {v0, p1, p2, p3}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->addAllInternal(ILjava/util/Collection;I)V

    goto :goto_10

    .line 524
    :cond_b
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    # invokes: Lkotlin/collections/builders/ListBuilder;->addAllInternal(ILjava/util/Collection;I)V
    invoke-static {v0, p1, p2, p3}, Lkotlin/collections/builders/ListBuilder;->access$addAllInternal(Lkotlin/collections/builders/ListBuilder;ILjava/util/Collection;I)V

    .line 526
    :goto_10
    iget-object p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    # getter for: Lkotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;
    invoke-static {p1}, Lkotlin/collections/builders/ListBuilder;->access$getBacking$p(Lkotlin/collections/builders/ListBuilder;)[Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    .line 527
    iget p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/2addr p1, p3

    iput p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return-void
.end method

.method private final addAtInternal(ILjava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .line 509
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->registerModification()V

    .line 510
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    if-eqz v0, :cond_b

    .line 511
    invoke-direct {v0, p1, p2}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->addAtInternal(ILjava/lang/Object;)V

    goto :goto_10

    .line 513
    :cond_b
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    # invokes: Lkotlin/collections/builders/ListBuilder;->addAtInternal(ILjava/lang/Object;)V
    invoke-static {v0, p1, p2}, Lkotlin/collections/builders/ListBuilder;->access$addAtInternal(Lkotlin/collections/builders/ListBuilder;ILjava/lang/Object;)V

    .line 515
    :goto_10
    iget-object p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    # getter for: Lkotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;
    invoke-static {p1}, Lkotlin/collections/builders/ListBuilder;->access$getBacking$p(Lkotlin/collections/builders/ListBuilder;)[Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    .line 516
    iget p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return-void
.end method

.method private final checkForComodification()V
    .registers 2

    .line 493
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    # getter for: Lkotlin/collections/builders/ListBuilder;->modCount:I
    invoke-static {v0}, Lkotlin/collections/builders/ListBuilder;->access$getModCount$p$s-2084097795(Lkotlin/collections/builders/ListBuilder;)I

    move-result v0

    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->modCount:I

    if-ne v0, p0, :cond_b

    return-void

    .line 494
    :cond_b
    new-instance p0, Ljava/util/ConcurrentModificationException;

    invoke-direct {p0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw p0
.end method

.method private final checkIsMutable()V
    .registers 1

    .line 498
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->isReadOnly()Z

    move-result p0

    if-nez p0, :cond_7

    return-void

    :cond_7
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method private final contentEquals(Ljava/util/List;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;)Z"
        }
    .end annotation

    .line 505
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    # invokes: Lkotlin/collections/builders/ListBuilderKt;->subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z
    invoke-static {v0, v1, p0, p1}, Lkotlin/collections/builders/ListBuilderKt;->access$subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z

    move-result p0

    return p0
.end method

.method private final isReadOnly()Z
    .registers 1

    .line 502
    iget-object p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    # getter for: Lkotlin/collections/builders/ListBuilder;->isReadOnly:Z
    invoke-static {p0}, Lkotlin/collections/builders/ListBuilder;->access$isReadOnly$p(Lkotlin/collections/builders/ListBuilder;)Z

    move-result p0

    return p0
.end method

.method private final readObject(Ljava/io/ObjectInputStream;)V
    .registers 2

    .line 325
    new-instance p0, Ljava/io/InvalidObjectException;

    const-string p1, "Deserialization is supported via proxy only"

    invoke-direct {p0, p1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final registerModification()V
    .registers 2

    .line 489
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->modCount:I

    return-void
.end method

.method private final removeAtInternal(I)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 531
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->registerModification()V

    .line 532
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    if-eqz v0, :cond_c

    .line 533
    invoke-direct {v0, p1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->removeAtInternal(I)Ljava/lang/Object;

    move-result-object p1

    goto :goto_12

    .line 535
    :cond_c
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    # invokes: Lkotlin/collections/builders/ListBuilder;->removeAtInternal(I)Ljava/lang/Object;
    invoke-static {v0, p1}, Lkotlin/collections/builders/ListBuilder;->access$removeAtInternal(Lkotlin/collections/builders/ListBuilder;I)Ljava/lang/Object;

    move-result-object p1

    .line 537
    :goto_12
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return-object p1
.end method

.method private final removeRangeInternal(II)V
    .registers 4

    if-lez p2, :cond_5

    .line 542
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->registerModification()V

    .line 543
    :cond_5
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    if-eqz v0, :cond_d

    .line 544
    invoke-direct {v0, p1, p2}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->removeRangeInternal(II)V

    goto :goto_12

    .line 546
    :cond_d
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    # invokes: Lkotlin/collections/builders/ListBuilder;->removeRangeInternal(II)V
    invoke-static {v0, p1, p2}, Lkotlin/collections/builders/ListBuilder;->access$removeRangeInternal(Lkotlin/collections/builders/ListBuilder;II)V

    .line 548
    :goto_12
    iget p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    sub-int/2addr p1, p2

    iput p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return-void
.end method

.method private final retainOrRemoveAllInternal(IILjava/util/Collection;Z)I
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/Collection<",
            "+TE;>;Z)I"
        }
    .end annotation

    .line 554
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    if-eqz v0, :cond_9

    .line 555
    invoke-direct {v0, p1, p2, p3, p4}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->retainOrRemoveAllInternal(IILjava/util/Collection;Z)I

    move-result p1

    goto :goto_f

    .line 557
    :cond_9
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    # invokes: Lkotlin/collections/builders/ListBuilder;->retainOrRemoveAllInternal(IILjava/util/Collection;Z)I
    invoke-static {v0, p1, p2, p3, p4}, Lkotlin/collections/builders/ListBuilder;->access$retainOrRemoveAllInternal(Lkotlin/collections/builders/ListBuilder;IILjava/util/Collection;Z)I

    move-result p1

    :goto_f
    if-lez p1, :cond_14

    .line 559
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->registerModification()V

    .line 560
    :cond_14
    iget p2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    sub-int/2addr p2, p1

    iput p2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return p1
.end method

.method private final writeReplace()Ljava/lang/Object;
    .registers 3

    .line 320
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->isReadOnly()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 321
    new-instance v0, Lkotlin/collections/builders/SerializedCollection;

    check-cast p0, Ljava/util/Collection;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lkotlin/collections/builders/SerializedCollection;-><init>(Ljava/util/Collection;I)V

    return-object v0

    .line 323
    :cond_f
    new-instance p0, Ljava/io/NotSerializableException;

    const-string v0, "The list cannot be serialized while it is being built."

    invoke-direct {p0, v0}, Ljava/io/NotSerializableException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .line 390
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 391
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 392
    sget-object v0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lkotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 393
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v0, p1

    invoke-direct {p0, v0, p2}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->addAtInternal(ILjava/lang/Object;)V

    return-void
.end method

.method public add(Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 383
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 384
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 385
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/2addr v0, v1

    invoke-direct {p0, v0, p1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->addAtInternal(ILjava/lang/Object;)V

    const/4 p0, 0x1

    return p0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection<",
            "+TE;>;)Z"
        }
    .end annotation

    const-string v0, "elements"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 405
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 406
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 407
    sget-object v0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lkotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 408
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v0

    .line 409
    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v1, p1

    invoke-direct {p0, v1, p2, v0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->addAllInternal(ILjava/util/Collection;I)V

    if-lez v0, :cond_20

    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+TE;>;)Z"
        }
    .end annotation

    const-string v0, "elements"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 397
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 398
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 399
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    .line 400
    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/2addr v1, v2

    invoke-direct {p0, v1, p1, v0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->addAllInternal(ILjava/util/Collection;I)V

    if-lez v0, :cond_1b

    const/4 p0, 0x1

    return p0

    :cond_1b
    const/4 p0, 0x0

    return p0
.end method

.method public clear()V
    .registers 3

    .line 414
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 415
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 416
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-direct {p0, v0, v1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->removeRangeInternal(II)V

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3

    .line 471
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    if-eq p1, p0, :cond_14

    .line 473
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_12

    check-cast p1, Ljava/util/List;

    invoke-direct {p0, p1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->contentEquals(Ljava/util/List;)Z

    move-result p0

    if-eqz p0, :cond_12

    goto :goto_14

    :cond_12
    const/4 p0, 0x0

    return p0

    :cond_14
    :goto_14
    const/4 p0, 0x1

    return p0
.end method

.method public get(I)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 339
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 340
    sget-object v0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lkotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 341
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr p0, p1

    aget-object p0, v0, p0

    return-object p0
.end method

.method public getSize()I
    .registers 1

    .line 329
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 330
    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return p0
.end method

.method public hashCode()I
    .registers 3

    .line 477
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 478
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    # invokes: Lkotlin/collections/builders/ListBuilderKt;->subarrayContentHashCode([Ljava/lang/Object;II)I
    invoke-static {v0, v1, p0}, Lkotlin/collections/builders/ListBuilderKt;->access$subarrayContentHashCode([Ljava/lang/Object;II)I

    move-result p0

    return p0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 5

    .line 354
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    const/4 v0, 0x0

    .line 356
    :goto_4
    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    if-ge v0, v1, :cond_19

    .line 357
    iget-object v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v2, v0

    aget-object v1, v1, v2

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    return v0

    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_19
    const/4 p0, -0x1

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    .line 334
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 335
    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    if-nez p0, :cond_9

    const/4 p0, 0x1

    return p0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 373
    invoke-virtual {p0, v0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p0

    check-cast p0, Ljava/util/Iterator;

    return-object p0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 5

    .line 364
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 365
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/lit8 v0, v0, -0x1

    :goto_7
    if-ltz v0, :cond_1a

    .line 367
    iget-object v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v2, v0

    aget-object v1, v1, v2

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    return v0

    :cond_17
    add-int/lit8 v0, v0, -0x1

    goto :goto_7

    :cond_1a
    const/4 p0, -0x1

    return p0
.end method

.method public listIterator()Ljava/util/ListIterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator<",
            "TE;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 374
    invoke-virtual {p0, v0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p0

    return-object p0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ListIterator<",
            "TE;>;"
        }
    .end annotation

    .line 377
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 378
    sget-object v0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lkotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 379
    new-instance v0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;

    invoke-direct {v0, p0, p1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;-><init>(Lkotlin/collections/builders/ListBuilder$BuilderSubList;I)V

    check-cast v0, Ljava/util/ListIterator;

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 2

    .line 428
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 429
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 430
    invoke-virtual {p0, p1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_f

    .line 431
    invoke-virtual {p0, p1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->removeAt(I)Ljava/lang/Object;

    :cond_f
    if-ltz p1, :cond_13

    const/4 p0, 0x1

    return p0

    :cond_13
    const/4 p0, 0x0

    return p0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    const-string v0, "elements"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 436
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 437
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 438
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, p1, v2}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->retainOrRemoveAllInternal(IILjava/util/Collection;Z)I

    move-result p0

    if-lez p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    return v2
.end method

.method public removeAt(I)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .annotation runtime Lkotlin/IgnorableReturnValue;
    .end annotation

    .line 421
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 422
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 423
    sget-object v0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lkotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 424
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v0, p1

    invoke-direct {p0, v0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->removeAtInternal(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    const-string v0, "elements"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 442
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 443
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 444
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, p1, v2}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->retainOrRemoveAllInternal(IILjava/util/Collection;Z)I

    move-result p0

    if-lez p0, :cond_17

    return v2

    :cond_17
    const/4 p0, 0x0

    return p0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)TE;"
        }
    .end annotation

    .line 345
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 346
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 347
    sget-object v0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lkotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 348
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int v1, p0, p1

    aget-object v1, v0, v1

    add-int/2addr p0, p1

    .line 349
    aput-object p2, v0, p0

    return-object v1
.end method

.method public subList(II)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "TE;>;"
        }
    .end annotation

    .line 448
    sget-object v0, Lkotlin/collections/AbstractList;->Companion:Lkotlin/collections/AbstractList$Companion;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, p2, v1}, Lkotlin/collections/AbstractList$Companion;->checkRangeIndexes$kotlin_stdlib(III)V

    .line 449
    new-instance v2, Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    iget-object v3, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int v4, v0, p1

    sub-int v5, p2, p1

    iget-object v7, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;

    move-object v6, p0

    invoke-direct/range {v2 .. v7}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;-><init>([Ljava/lang/Object;IILkotlin/collections/builders/ListBuilder$BuilderSubList;Lkotlin/collections/builders/ListBuilder;)V

    check-cast v2, Ljava/util/List;

    return-object v2
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 3

    .line 465
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 467
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/2addr p0, v1

    invoke-static {v0, v1, p0}, Lkotlin/collections/ArraysKt;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    const-string v0, "array"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 454
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 455
    array-length v0, p1

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    .line 459
    iget-object v2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    if-ge v0, v1, :cond_20

    .line 456
    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v1, p0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-static {v2, p0, v1, p1}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p0

    const-string p1, "copyOfRange(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0

    .line 459
    :cond_20
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v1, v0

    const/4 v3, 0x0

    invoke-static {v2, p1, v3, v0, v1}, Lkotlin/collections/ArraysKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 461
    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-static {p0, p1}, Lkotlin/collections/CollectionsKt;->terminateCollectionToArray(I[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 482
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 483
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    check-cast p0, Ljava/util/Collection;

    # invokes: Lkotlin/collections/builders/ListBuilderKt;->subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;
    invoke-static {v0, v1, v2, p0}, Lkotlin/collections/builders/ListBuilderKt;->access$subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
