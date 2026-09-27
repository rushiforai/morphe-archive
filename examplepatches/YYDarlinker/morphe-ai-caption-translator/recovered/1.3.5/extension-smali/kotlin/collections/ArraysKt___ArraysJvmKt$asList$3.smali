.class public final Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;
.super Lkotlin/collections/AbstractList;
.source "_ArraysJvm.kt"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/collections/ArraysKt___ArraysJvmKt;->asList([I)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/collections/AbstractList<",
        "Ljava/lang/Integer;",
        ">;",
        "Ljava/util/RandomAccess;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000!\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0008*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00060\u0003j\u0002`\u0004J\n\u0010\u0008\u001a\u00020\tH\u0096\u0080\u0004J\u0012\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u0002H\u0096\u0082\u0004J\u0017\u0010\u000c\u001a\u00020\u00022\u0006\u0010\r\u001a\u00020\u0002H\u0096\u0082\u0004\u00a2\u0006\u0002\u0010\u000eJ\u0012\u0010\u000f\u001a\u00020\u00022\u0006\u0010\u000b\u001a\u00020\u0002H\u0096\u0080\u0004J\u0012\u0010\u0010\u001a\u00020\u00022\u0006\u0010\u000b\u001a\u00020\u0002H\u0096\u0080\u0004R\u0015\u0010\u0005\u001a\u00020\u00028VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0011"
    }
    d2 = {
        "kotlin/collections/ArraysKt___ArraysJvmKt$asList$3",
        "Lkotlin/collections/AbstractList;",
        "",
        "Ljava/util/RandomAccess;",
        "Lkotlin/collections/RandomAccess;",
        "size",
        "getSize",
        "()I",
        "isEmpty",
        "",
        "contains",
        "element",
        "get",
        "index",
        "(I)Ljava/lang/Integer;",
        "indexOf",
        "lastIndexOf",
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
.field final synthetic $this_asList:[I


# direct methods
.method constructor <init>([I)V
    .registers 2

    iput-object p1, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;->$this_asList:[I

    .line 171
    invoke-direct {p0}, Lkotlin/collections/AbstractList;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(I)Z
    .registers 2

    .line 174
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;->$this_asList:[I

    invoke-static {p0, p1}, Lkotlin/collections/ArraysKt;->contains([II)Z

    move-result p0

    return p0
.end method

.method public final bridge contains(Ljava/lang/Object;)Z
    .registers 3

    .line 171
    instance-of v0, p1, Ljava/lang/Integer;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;->contains(I)Z

    move-result p0

    return p0
.end method

.method public get(I)Ljava/lang/Integer;
    .registers 2

    .line 175
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;->$this_asList:[I

    aget p0, p0, p1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2

    .line 171
    invoke-virtual {p0, p1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;->get(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public getSize()I
    .registers 1

    .line 172
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;->$this_asList:[I

    array-length p0, p0

    return p0
.end method

.method public indexOf(I)I
    .registers 2

    .line 176
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;->$this_asList:[I

    invoke-static {p0, p1}, Lkotlin/collections/ArraysKt;->indexOf([II)I

    move-result p0

    return p0
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .registers 3

    .line 171
    instance-of v0, p1, Ljava/lang/Integer;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;->indexOf(I)I

    move-result p0

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    .line 173
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;->$this_asList:[I

    array-length p0, p0

    if-nez p0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method

.method public lastIndexOf(I)I
    .registers 2

    .line 177
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;->$this_asList:[I

    invoke-static {p0, p1}, Lkotlin/collections/ArraysKt;->lastIndexOf([II)I

    move-result p0

    return p0
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .registers 3

    .line 171
    instance-of v0, p1, Ljava/lang/Integer;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$3;->lastIndexOf(I)I

    move-result p0

    return p0
.end method
