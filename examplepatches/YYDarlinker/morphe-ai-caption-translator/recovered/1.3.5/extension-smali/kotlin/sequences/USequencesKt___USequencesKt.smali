.class Lkotlin/sequences/USequencesKt___USequencesKt;
.super Ljava/lang/Object;
.source "_USequences.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a7\u0010\u0000\u001a\u00020\u0001*\u0008\u0012\u0004\u0012\u00020\u00010\u0002H\u0087\u0080\u0004b\u000c\u0008\u0005\u0012\u0008\u0008\u0006\u0012\u0004\u0008\u0008(\u0003b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u001a7\u0010\u0000\u001a\u00020\n*\u0008\u0012\u0004\u0012\u00020\n0\u0002H\u0087\u0080\u0004b\u000c\u0008\u0005\u0012\u0008\u0008\u0006\u0012\u0004\u0008\u0008(\u000bb\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u001a7\u0010\u0000\u001a\u00020\u0001*\u0008\u0012\u0004\u0012\u00020\r0\u0002H\u0087\u0080\u0004b\u000c\u0008\u0005\u0012\u0008\u0008\u0006\u0012\u0004\u0008\u0008(\u000eb\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0004\u0008\u000e\u0010\u0004\u001a7\u0010\u0000\u001a\u00020\u0001*\u0008\u0012\u0004\u0012\u00020\u000f0\u0002H\u0087\u0080\u0004b\u000c\u0008\u0005\u0012\u0008\u0008\u0006\u0012\u0004\u0008\u0008(\u0010b\u000c\u0008\u0007\u0012\u0008\u0008\u0008\u0012\u0004\u0008\u0008(\t\u00a2\u0006\u0004\u0008\u0010\u0010\u0004\u00a8\u0006\u0011"
    }
    d2 = {
        "sum",
        "Lkotlin/UInt;",
        "Lkotlin/sequences/Sequence;",
        "sumOfUInt",
        "(Lkotlin/sequences/Sequence;)I",
        "Lkotlin/jvm/JvmName;",
        "name",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.5",
        "Lkotlin/ULong;",
        "sumOfULong",
        "(Lkotlin/sequences/Sequence;)J",
        "Lkotlin/UByte;",
        "sumOfUByte",
        "Lkotlin/UShort;",
        "sumOfUShort",
        "kotlin-stdlib"
    }
    k = 0x5
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x31
    xs = "kotlin/sequences/USequencesKt"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final sumOfUByte(Lkotlin/sequences/Sequence;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/sequences/Sequence<",
            "Lkotlin/UByte;",
            ">;)I"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    invoke-interface {p0}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :goto_a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/UByte;

    invoke-virtual {v1}, Lkotlin/UByte;->unbox-impl()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    .line 60
    invoke-static {v1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result v0

    goto :goto_a

    :cond_26
    return v0
.end method

.method public static final sumOfUInt(Lkotlin/sequences/Sequence;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/sequences/Sequence<",
            "Lkotlin/UInt;",
            ">;)I"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    invoke-interface {p0}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :goto_a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/UInt;

    invoke-virtual {v1}, Lkotlin/UInt;->unbox-impl()I

    move-result v1

    add-int/2addr v0, v1

    .line 30
    invoke-static {v0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result v0

    goto :goto_a

    :cond_20
    return v0
.end method

.method public static final sumOfULong(Lkotlin/sequences/Sequence;)J
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/sequences/Sequence<",
            "Lkotlin/ULong;",
            ">;)J"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    invoke-interface {p0}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const-wide/16 v0, 0x0

    :goto_b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlin/ULong;

    invoke-virtual {v2}, Lkotlin/ULong;->unbox-impl()J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 45
    invoke-static {v0, v1}, Lkotlin/ULong;->constructor-impl(J)J

    move-result-wide v0

    goto :goto_b

    :cond_21
    return-wide v0
.end method

.method public static final sumOfUShort(Lkotlin/sequences/Sequence;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/sequences/Sequence<",
            "Lkotlin/UShort;",
            ">;)I"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    invoke-interface {p0}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :goto_a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlin/UShort;

    invoke-virtual {v1}, Lkotlin/UShort;->unbox-impl()S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    .line 75
    invoke-static {v1}, Lkotlin/UInt;->constructor-impl(I)I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0}, Lkotlin/UInt;->constructor-impl(I)I

    move-result v0

    goto :goto_a

    :cond_28
    return v0
.end method
