.class public final Lkotlin/jvm/internal/LongSpreadBuilder;
.super Lkotlin/jvm/internal/PrimitiveSpreadBuilder;
.source "PrimitiveSpreadBuilders.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/PrimitiveSpreadBuilder<",
        "[J>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0016\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0011\u0008F\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000e\u0010\u0008\u001a\u00020\u0004*\u00020\u0002H\u0094\u0080\u0004J\u0012\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000cH\u0086\u0080\u0004J\n\u0010\r\u001a\u00020\u0002H\u0086\u0080\u0004R\u000f\u0010\u0007\u001a\u00020\u0002X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Lkotlin/jvm/internal/LongSpreadBuilder;",
        "Lkotlin/jvm/internal/PrimitiveSpreadBuilder;",
        "",
        "size",
        "",
        "<init>",
        "(I)V",
        "values",
        "getSize",
        "add",
        "",
        "value",
        "",
        "toArray",
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
.field private final values:[J


# direct methods
.method public constructor <init>(I)V
    .registers 2

    .line 107
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;-><init>(I)V

    .line 108
    new-array p1, p1, [J

    iput-object p1, p0, Lkotlin/jvm/internal/LongSpreadBuilder;->values:[J

    return-void
.end method


# virtual methods
.method public final add(J)V
    .registers 6

    .line 112
    iget-object v0, p0, Lkotlin/jvm/internal/LongSpreadBuilder;->values:[J

    invoke-virtual {p0}, Lkotlin/jvm/internal/LongSpreadBuilder;->getPosition()I

    move-result v1

    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v2}, Lkotlin/jvm/internal/LongSpreadBuilder;->setPosition(I)V

    aput-wide p1, v0, v1

    return-void
.end method

.method public bridge synthetic getSize(Ljava/lang/Object;)I
    .registers 2

    .line 107
    check-cast p1, [J

    invoke-virtual {p0, p1}, Lkotlin/jvm/internal/LongSpreadBuilder;->getSize([J)I

    move-result p0

    return p0
.end method

.method protected getSize([J)I
    .registers 2

    const-string p0, "<this>"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 109
    array-length p0, p1

    return p0
.end method

.method public final toArray()[J
    .registers 3

    .line 115
    iget-object v0, p0, Lkotlin/jvm/internal/LongSpreadBuilder;->values:[J

    invoke-virtual {p0}, Lkotlin/jvm/internal/LongSpreadBuilder;->size()I

    move-result v1

    new-array v1, v1, [J

    invoke-virtual {p0, v0, v1}, Lkotlin/jvm/internal/LongSpreadBuilder;->toArray(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [J

    return-object p0
.end method
