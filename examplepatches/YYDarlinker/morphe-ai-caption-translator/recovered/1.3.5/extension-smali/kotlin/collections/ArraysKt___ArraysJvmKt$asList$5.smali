.class public final Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;
.super Lkotlin/collections/AbstractList;
.source "_ArraysJvm.kt"

# interfaces
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/collections/ArraysKt___ArraysJvmKt;->asList([F)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/collections/AbstractList<",
        "Ljava/lang/Float;",
        ">;",
        "Ljava/util/RandomAccess;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\n_ArraysJvm.kt\nKotlin\n*S Kotlin\n*F\n+ 1 _ArraysJvm.kt\nkotlin/collections/ArraysKt___ArraysJvmKt$asList$5\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,3069:1\n14316#2,2:3070\n1851#2,6:3072\n1959#2,6:3078\n*S KotlinDebug\n*F\n+ 1 _ArraysJvm.kt\nkotlin/collections/ArraysKt___ArraysJvmKt$asList$5\n*L\n204#1:3070,2\n206#1:3072,6\n207#1:3078,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0008*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00060\u0003j\u0002`\u0004J\n\u0010\t\u001a\u00020\nH\u0096\u0080\u0004J\u0012\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\u0002H\u0096\u0082\u0004J\u0017\u0010\r\u001a\u00020\u00022\u0006\u0010\u000e\u001a\u00020\u0006H\u0096\u0082\u0004\u00a2\u0006\u0002\u0010\u000fJ\u0012\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0002H\u0096\u0080\u0004J\u0012\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\u0002H\u0096\u0080\u0004R\u0015\u0010\u0005\u001a\u00020\u00068VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u0012"
    }
    d2 = {
        "kotlin/collections/ArraysKt___ArraysJvmKt$asList$5",
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
        "(I)Ljava/lang/Float;",
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
.field final synthetic $this_asList:[F


# direct methods
.method constructor <init>([F)V
    .registers 2

    iput-object p1, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;->$this_asList:[F

    .line 201
    invoke-direct {p0}, Lkotlin/collections/AbstractList;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(F)Z
    .registers 7

    .line 204
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;->$this_asList:[F

    .line 3070
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_5
    if-ge v2, v0, :cond_18

    aget v3, p0, v2

    .line 204
    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v4

    if-ne v3, v4, :cond_15

    const/4 p0, 0x1

    return p0

    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_18
    return v1
.end method

.method public final bridge contains(Ljava/lang/Object;)Z
    .registers 3

    .line 201
    instance-of v0, p1, Ljava/lang/Float;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    invoke-virtual {p0, p1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;->contains(F)Z

    move-result p0

    return p0
.end method

.method public get(I)Ljava/lang/Float;
    .registers 2

    .line 205
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;->$this_asList:[F

    aget p0, p0, p1

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2

    .line 201
    invoke-virtual {p0, p1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;->get(I)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public getSize()I
    .registers 1

    .line 202
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;->$this_asList:[F

    array-length p0, p0

    return p0
.end method

.method public indexOf(F)I
    .registers 6

    .line 206
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;->$this_asList:[F

    .line 3072
    array-length v0, p0

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v0, :cond_16

    .line 3073
    aget v2, p0, v1

    .line 206
    invoke-static {v2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v2

    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    if-ne v2, v3, :cond_13

    return v1

    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_16
    const/4 p0, -0x1

    return p0
.end method

.method public final bridge indexOf(Ljava/lang/Object;)I
    .registers 3

    .line 201
    instance-of v0, p1, Ljava/lang/Float;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    invoke-virtual {p0, p1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;->indexOf(F)I

    move-result p0

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    .line 203
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;->$this_asList:[F

    array-length p0, p0

    if-nez p0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method

.method public lastIndexOf(F)I
    .registers 7

    .line 207
    iget-object p0, p0, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;->$this_asList:[F

    .line 3078
    array-length v0, p0

    const/4 v1, -0x1

    add-int/2addr v0, v1

    if-ltz v0, :cond_1b

    :goto_7
    add-int/lit8 v2, v0, -0x1

    .line 3079
    aget v3, p0, v0

    .line 207
    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v4

    if-ne v3, v4, :cond_16

    return v0

    :cond_16
    if-gez v2, :cond_19

    goto :goto_1b

    :cond_19
    move v0, v2

    goto :goto_7

    :cond_1b
    :goto_1b
    return v1
.end method

.method public final bridge lastIndexOf(Ljava/lang/Object;)I
    .registers 3

    .line 201
    instance-of v0, p1, Ljava/lang/Float;

    if-nez v0, :cond_6

    const/4 p0, -0x1

    return p0

    :cond_6
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    invoke-virtual {p0, p1}, Lkotlin/collections/ArraysKt___ArraysJvmKt$asList$5;->lastIndexOf(F)I

    move-result p0

    return p0
.end method
