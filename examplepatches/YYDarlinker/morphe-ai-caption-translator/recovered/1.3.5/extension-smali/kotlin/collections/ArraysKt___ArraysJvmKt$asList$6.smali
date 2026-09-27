.class public final Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;
.super Lkotlin/collections/AbstractList;
.source "_ArraysJvm.kt"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/collections/ArraysKt___ArraysJvmKt;->asList([D)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/collections/AbstractList<",
        "Ljava/lang/Double;",
        ">;",
        "Ljava/util/RandomAccess;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\n_ArraysJvm.kt\nKotlin\n*S Kotlin\n*F\n+ 1 _ArraysJvm.kt\nkotlin/collections/ArraysKt___ArraysJvmKt$asList$6\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,3069:1\n14326#2,2:3070\n1863#2,6:3072\n1971#2,6:3078\n*S KotlinDebug\n*F\n+ 1 _ArraysJvm.kt\nkotlin/collections/ArraysKt___ArraysJvmKt$asList$6\n*L\n219#1:3070,2\n221#1:3072,6\n222#1:3078,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0008*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00060\u0003j\u0002`\u0004J\n\u0010\t\u001a\u00020\nH\u0096\u0080\u0004J\u0012\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\u0002H\u0096\u0082\u0004J\u0017\u0010\r\u001a\u00020\u00022\u0006\u0010\u000e\u001a\u00020\u0006H\u0096\u0082\u0004\u00a2\u0006\u0002\u0010\u000fJ\u0012\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0002H\u0096\u0080\u0004J\u0012\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0002H\u0096\u0080\u0004R\u0015\u0010\u0005\u001a\u00020\u00068VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u0012"
    }
    d2 = {
        "kotlin/collections/ArraysKt___ArraysJvmKt$asList$6",
        "Lkotlin/collections/AbstractList;",
        "",
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
        "get",
        "index",
        "(I)Ljava/lang/Double;",
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
.field final synthetic $this_asList:[D


# direct methods
.method constructor <init>([D)V
    .registers 2

    iput-object p1, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;->$this_asList:[D

    .line 216
    invoke-direct {p0}, Lkotlin/collections/AbstractList;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(D)Z
    .registers 10

    .line 219
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;->$this_asList:[D

    .line 3070
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_5
    if-ge v2, v0, :cond_1a

    aget-wide v3, p0, v2

    .line 219
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_17

    const/4 p0, 0x1

    return p0

    :cond_17
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_1a
    return v1
.end method

.method public final bridge contains(Ljava/lang/Object;)Z
    .registers 4

    .line 216
    instance-of v0, p1, Ljava/lang/Double;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;->contains(D)Z

    move-result p0

    return p0
.end method

.method public get(I)Ljava/lang/Double;
    .registers 4

    .line 220
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;->$this_asList:[D

    aget-wide v0, p0, p1

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2

    .line 216
    invoke-virtual {p0, p1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;->get(I)Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method

.method public getSize()I
    .registers 1

    .line 217
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;->$this_asList:[D

    array-length p0, p0

    return p0
.end method

.method public indexOf(D)I
    .registers 9

    .line 221
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;->$this_asList:[D

    .line 3072
    array-length v0, p0

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v0, :cond_18

    .line 3073
    aget-wide v2, p0, v1

    .line 221
    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_15

    return v1

    :cond_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_18
    const/4 p0, -0x1

    return p0
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .registers 4

    .line 216
    instance-of v0, p1, Ljava/lang/Double;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;->indexOf(D)I

    move-result p0

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    .line 218
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;->$this_asList:[D

    array-length p0, p0

    if-nez p0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method

.method public lastIndexOf(D)I
    .registers 10

    .line 222
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;->$this_asList:[D

    .line 3078
    array-length v0, p0

    const/4 v1, -0x1

    add-int/2addr v0, v1

    if-ltz v0, :cond_1d

    :goto_7
    add-int/lit8 v2, v0, -0x1

    .line 3079
    aget-wide v3, p0, v0

    .line 222
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v3

    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_18

    return v0

    :cond_18
    if-gez v2, :cond_1b

    goto :goto_1d

    :cond_1b
    move v0, v2

    goto :goto_7

    :cond_1d
    :goto_1d
    return v1
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .registers 4

    .line 216
    instance-of v0, p1, Ljava/lang/Double;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$6;->lastIndexOf(D)I

    move-result p0

    return p0
.end method
