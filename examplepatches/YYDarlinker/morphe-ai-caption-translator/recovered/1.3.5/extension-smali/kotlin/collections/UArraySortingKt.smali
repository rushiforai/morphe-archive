.class public final Lkotlin/collections/UArraySortingKt;
.super Ljava/lang/Object;
.source "UArraySorting.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u001a-\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0083\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u001a-\u0010\t\u001a\u00020\n2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0083\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u001a-\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\r2\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0083\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008\u000e\u0010\u000f\u001a-\u0010\t\u001a\u00020\n2\u0006\u0010\u0002\u001a\u00020\r2\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0083\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008\u0010\u0010\u0011\u001a-\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00122\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0083\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008\u0013\u0010\u0014\u001a-\u0010\t\u001a\u00020\n2\u0006\u0010\u0002\u001a\u00020\u00122\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0083\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008\u0015\u0010\u0016\u001a-\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00172\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0083\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008\u0018\u0010\u0019\u001a-\u0010\t\u001a\u00020\n2\u0006\u0010\u0002\u001a\u00020\u00172\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0083\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008\u001a\u0010\u001b\u001a-\u0010\u001c\u001a\u00020\n2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u001d\u001a\u00020\u00012\u0006\u0010\u001e\u001a\u00020\u0001H\u0081\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008\u001f\u0010\u000c\u001a-\u0010\u001c\u001a\u00020\n2\u0006\u0010\u0002\u001a\u00020\r2\u0006\u0010\u001d\u001a\u00020\u00012\u0006\u0010\u001e\u001a\u00020\u0001H\u0081\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008 \u0010\u0011\u001a-\u0010\u001c\u001a\u00020\n2\u0006\u0010\u0002\u001a\u00020\u00122\u0006\u0010\u001d\u001a\u00020\u00012\u0006\u0010\u001e\u001a\u00020\u0001H\u0081\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008!\u0010\u0016\u001a-\u0010\u001c\u001a\u00020\n2\u0006\u0010\u0002\u001a\u00020\u00172\u0006\u0010\u001d\u001a\u00020\u00012\u0006\u0010\u001e\u001a\u00020\u0001H\u0081\u0080\u0004b\u0002\u0008\u0008\u00a2\u0006\u0004\u0008\"\u0010\u001b\u00a8\u0006#"
    }
    d2 = {
        "partition",
        "",
        "array",
        "Lkotlin/UByteArray;",
        "left",
        "right",
        "partition-4UcCI2c",
        "([BII)I",
        "Lkotlin/ExperimentalUnsignedTypes;",
        "quickSort",
        "",
        "quickSort-4UcCI2c",
        "([BII)V",
        "Lkotlin/UShortArray;",
        "partition-Aa5vz7o",
        "([SII)I",
        "quickSort-Aa5vz7o",
        "([SII)V",
        "Lkotlin/UIntArray;",
        "partition-oBK06Vg",
        "([III)I",
        "quickSort-oBK06Vg",
        "([III)V",
        "Lkotlin/ULongArray;",
        "partition--nroSd4",
        "([JII)I",
        "quickSort--nroSd4",
        "([JII)V",
        "sortArray",
        "fromIndex",
        "toIndex",
        "sortArray-4UcCI2c",
        "sortArray-Aa5vz7o",
        "sortArray-oBK06Vg",
        "sortArray--nroSd4",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private static final partition--nroSd4([JII)I
    .registers 9

    add-int v0, p1, p2

    .line 113
    div-int/lit8 v0, v0, 0x2

    invoke-static {p0, v0}, Lkotlin/ULongArray;->get-s-VKNKU([JI)J

    move-result-wide v0

    :cond_8
    :goto_8
    if-gt p1, p2, :cond_39

    .line 115
    :goto_a
    invoke-static {p0, p1}, Lkotlin/ULongArray;->get-s-VKNKU([JI)J

    move-result-wide v2

    invoke-static {v2, v3, v0, v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result v2

    if-gez v2, :cond_17

    add-int/lit8 p1, p1, 0x1

    goto :goto_a

    .line 117
    :cond_17
    :goto_17
    invoke-static {p0, p2}, Lkotlin/ULongArray;->get-s-VKNKU([JI)J

    move-result-wide v2

    invoke-static {v2, v3, v0, v1}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m(JJ)I

    move-result v2

    if-lez v2, :cond_24

    add-int/lit8 p2, p2, -0x1

    goto :goto_17

    :cond_24
    if-gt p1, p2, :cond_8

    .line 120
    invoke-static {p0, p1}, Lkotlin/ULongArray;->get-s-VKNKU([JI)J

    move-result-wide v2

    .line 121
    invoke-static {p0, p2}, Lkotlin/ULongArray;->get-s-VKNKU([JI)J

    move-result-wide v4

    invoke-static {p0, p1, v4, v5}, Lkotlin/ULongArray;->set-k8EXiF4([JIJ)V

    .line 122
    invoke-static {p0, p2, v2, v3}, Lkotlin/ULongArray;->set-k8EXiF4([JIJ)V

    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p2, p2, -0x1

    goto :goto_8

    :cond_39
    return p1
.end method

.method private static final partition-4UcCI2c([BII)I
    .registers 6

    add-int v0, p1, p2

    .line 14
    div-int/lit8 v0, v0, 0x2

    invoke-static {p0, v0}, Lkotlin/UByteArray;->get-w2LRezQ([BI)B

    move-result v0

    :cond_8
    :goto_8
    if-gt p1, p2, :cond_3f

    .line 16
    :goto_a
    invoke-static {p0, p1}, Lkotlin/UByteArray;->get-w2LRezQ([BI)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    and-int/lit16 v2, v0, 0xff

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v1

    if-gez v1, :cond_1b

    add-int/lit8 p1, p1, 0x1

    goto :goto_a

    .line 18
    :cond_1b
    :goto_1b
    invoke-static {p0, p2}, Lkotlin/UByteArray;->get-w2LRezQ([BI)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v1

    if-lez v1, :cond_2a

    add-int/lit8 p2, p2, -0x1

    goto :goto_1b

    :cond_2a
    if-gt p1, p2, :cond_8

    .line 21
    invoke-static {p0, p1}, Lkotlin/UByteArray;->get-w2LRezQ([BI)B

    move-result v1

    .line 22
    invoke-static {p0, p2}, Lkotlin/UByteArray;->get-w2LRezQ([BI)B

    move-result v2

    invoke-static {p0, p1, v2}, Lkotlin/UByteArray;->set-VurrAj0([BIB)V

    .line 23
    invoke-static {p0, p2, v1}, Lkotlin/UByteArray;->set-VurrAj0([BIB)V

    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p2, p2, -0x1

    goto :goto_8

    :cond_3f
    return p1
.end method

.method private static final partition-Aa5vz7o([SII)I
    .registers 7

    add-int v0, p1, p2

    .line 47
    div-int/lit8 v0, v0, 0x2

    invoke-static {p0, v0}, Lkotlin/UShortArray;->get-Mh2AYeg([SI)S

    move-result v0

    :cond_8
    :goto_8
    if-gt p1, p2, :cond_40

    .line 49
    :goto_a
    invoke-static {p0, p1}, Lkotlin/UShortArray;->get-Mh2AYeg([SI)S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    and-int v3, v0, v2

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v1

    if-gez v1, :cond_1d

    add-int/lit8 p1, p1, 0x1

    goto :goto_a

    .line 51
    :cond_1d
    :goto_1d
    invoke-static {p0, p2}, Lkotlin/UShortArray;->get-Mh2AYeg([SI)S

    move-result v1

    and-int/2addr v1, v2

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v1

    if-lez v1, :cond_2b

    add-int/lit8 p2, p2, -0x1

    goto :goto_1d

    :cond_2b
    if-gt p1, p2, :cond_8

    .line 54
    invoke-static {p0, p1}, Lkotlin/UShortArray;->get-Mh2AYeg([SI)S

    move-result v1

    .line 55
    invoke-static {p0, p2}, Lkotlin/UShortArray;->get-Mh2AYeg([SI)S

    move-result v2

    invoke-static {p0, p1, v2}, Lkotlin/UShortArray;->set-01HTLdE([SIS)V

    .line 56
    invoke-static {p0, p2, v1}, Lkotlin/UShortArray;->set-01HTLdE([SIS)V

    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p2, p2, -0x1

    goto :goto_8

    :cond_40
    return p1
.end method

.method private static final partition-oBK06Vg([III)I
    .registers 6

    add-int v0, p1, p2

    .line 80
    div-int/lit8 v0, v0, 0x2

    invoke-static {p0, v0}, Lkotlin/UIntArray;->get-pVg5ArA([II)I

    move-result v0

    :cond_8
    :goto_8
    if-gt p1, p2, :cond_39

    .line 82
    :goto_a
    invoke-static {p0, p1}, Lkotlin/UIntArray;->get-pVg5ArA([II)I

    move-result v1

    invoke-static {v1, v0}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$2(II)I

    move-result v1

    if-gez v1, :cond_17

    add-int/lit8 p1, p1, 0x1

    goto :goto_a

    .line 84
    :cond_17
    :goto_17
    invoke-static {p0, p2}, Lkotlin/UIntArray;->get-pVg5ArA([II)I

    move-result v1

    invoke-static {v1, v0}, Lkotlin/UByte$$ExternalSyntheticBackport0;->m$2(II)I

    move-result v1

    if-lez v1, :cond_24

    add-int/lit8 p2, p2, -0x1

    goto :goto_17

    :cond_24
    if-gt p1, p2, :cond_8

    .line 87
    invoke-static {p0, p1}, Lkotlin/UIntArray;->get-pVg5ArA([II)I

    move-result v1

    .line 88
    invoke-static {p0, p2}, Lkotlin/UIntArray;->get-pVg5ArA([II)I

    move-result v2

    invoke-static {p0, p1, v2}, Lkotlin/UIntArray;->set-VXSXFK8([III)V

    .line 89
    invoke-static {p0, p2, v1}, Lkotlin/UIntArray;->set-VXSXFK8([III)V

    add-int/lit8 p1, p1, 0x1

    add-int/lit8 p2, p2, -0x1

    goto :goto_8

    :cond_39
    return p1
.end method

.method private static final quickSort--nroSd4([JII)V
    .registers 5

    .line 133
    invoke-static {p0, p1, p2}, Lkotlin/collections/UArraySortingKt;->partition--nroSd4([JII)I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    if-ge p1, v1, :cond_b

    .line 135
    invoke-static {p0, p1, v1}, Lkotlin/collections/UArraySortingKt;->quickSort--nroSd4([JII)V

    :cond_b
    if-ge v0, p2, :cond_10

    .line 137
    invoke-static {p0, v0, p2}, Lkotlin/collections/UArraySortingKt;->quickSort--nroSd4([JII)V

    :cond_10
    return-void
.end method

.method private static final quickSort-4UcCI2c([BII)V
    .registers 5

    .line 34
    invoke-static {p0, p1, p2}, Lkotlin/collections/UArraySortingKt;->partition-4UcCI2c([BII)I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    if-ge p1, v1, :cond_b

    .line 36
    invoke-static {p0, p1, v1}, Lkotlin/collections/UArraySortingKt;->quickSort-4UcCI2c([BII)V

    :cond_b
    if-ge v0, p2, :cond_10

    .line 38
    invoke-static {p0, v0, p2}, Lkotlin/collections/UArraySortingKt;->quickSort-4UcCI2c([BII)V

    :cond_10
    return-void
.end method

.method private static final quickSort-Aa5vz7o([SII)V
    .registers 5

    .line 67
    invoke-static {p0, p1, p2}, Lkotlin/collections/UArraySortingKt;->partition-Aa5vz7o([SII)I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    if-ge p1, v1, :cond_b

    .line 69
    invoke-static {p0, p1, v1}, Lkotlin/collections/UArraySortingKt;->quickSort-Aa5vz7o([SII)V

    :cond_b
    if-ge v0, p2, :cond_10

    .line 71
    invoke-static {p0, v0, p2}, Lkotlin/collections/UArraySortingKt;->quickSort-Aa5vz7o([SII)V

    :cond_10
    return-void
.end method

.method private static final quickSort-oBK06Vg([III)V
    .registers 5

    .line 100
    invoke-static {p0, p1, p2}, Lkotlin/collections/UArraySortingKt;->partition-oBK06Vg([III)I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    if-ge p1, v1, :cond_b

    .line 102
    invoke-static {p0, p1, v1}, Lkotlin/collections/UArraySortingKt;->quickSort-oBK06Vg([III)V

    :cond_b
    if-ge v0, p2, :cond_10

    .line 104
    invoke-static {p0, v0, p2}, Lkotlin/collections/UArraySortingKt;->quickSort-oBK06Vg([III)V

    :cond_10
    return-void
.end method

.method public static final sortArray--nroSd4([JII)V
    .registers 4

    const-string v0, "array"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    add-int/lit8 p2, p2, -0x1

    .line 152
    invoke-static {p0, p1, p2}, Lkotlin/collections/UArraySortingKt;->quickSort--nroSd4([JII)V

    return-void
.end method

.method public static final sortArray-4UcCI2c([BII)V
    .registers 4

    const-string v0, "array"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    add-int/lit8 p2, p2, -0x1

    .line 146
    invoke-static {p0, p1, p2}, Lkotlin/collections/UArraySortingKt;->quickSort-4UcCI2c([BII)V

    return-void
.end method

.method public static final sortArray-Aa5vz7o([SII)V
    .registers 4

    const-string v0, "array"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    add-int/lit8 p2, p2, -0x1

    .line 148
    invoke-static {p0, p1, p2}, Lkotlin/collections/UArraySortingKt;->quickSort-Aa5vz7o([SII)V

    return-void
.end method

.method public static final sortArray-oBK06Vg([III)V
    .registers 4

    const-string v0, "array"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    add-int/lit8 p2, p2, -0x1

    .line 150
    invoke-static {p0, p1, p2}, Lkotlin/collections/UArraySortingKt;->quickSort-oBK06Vg([III)V

    return-void
.end method
