.class public abstract Lkotlin/jvm/internal/PrimitiveSpreadBuilder;
.super Ljava/lang/Object;
.source "PrimitiveSpreadBuilders.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\t\n\u0002\u0010\u0011\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0008&\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u00020\u0002B\u0011\u0008F\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0013\u0010\u0007\u001a\u00020\u0004*\u00028\u0000H\u00a4\u0080\u0004\u00a2\u0006\u0002\u0010\u0008J\u0017\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00028\u0000H\u0086\u0080\u0004\u00a2\u0006\u0002\u0010\u0015J\n\u0010\u0003\u001a\u00020\u0004H\u0084\u0080\u0004J\u001f\u0010\u0016\u001a\u00028\u00002\u0006\u0010\u0017\u001a\u00028\u00002\u0006\u0010\u0018\u001a\u00028\u0000H\u0084\u0080\u0004\u00a2\u0006\u0002\u0010\u0019R\u000f\u0010\u0003\u001a\u00020\u0004X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u001b\u0010\t\u001a\u00020\u0004X\u0084\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\u0006R\u001f\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00018\u00000\u000eX\u0082\u0084\u0008\u00a2\u0006\n\n\u0002\u0010\u0011\u0012\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u001a"
    }
    d2 = {
        "Lkotlin/jvm/internal/PrimitiveSpreadBuilder;",
        "T",
        "",
        "size",
        "",
        "<init>",
        "(I)V",
        "getSize",
        "(Ljava/lang/Object;)I",
        "position",
        "getPosition",
        "()I",
        "setPosition",
        "spreads",
        "",
        "getSpreads$annotations",
        "()V",
        "[Ljava/lang/Object;",
        "addSpread",
        "",
        "spreadArgument",
        "(Ljava/lang/Object;)V",
        "toArray",
        "values",
        "result",
        "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
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
.field private position:I

.field private final size:I

.field private final spreads:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .registers 2

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->size:I

    .line 14
    new-array p1, p1, [Ljava/lang/Object;

    iput-object p1, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->spreads:[Ljava/lang/Object;

    return-void
.end method

.method private static synthetic getSpreads$annotations()V
    .registers 0

    return-void
.end method


# virtual methods
.method public final addSpread(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const-string v0, "spreadArgument"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    iget-object v0, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->spreads:[Ljava/lang/Object;

    iget v1, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->position:I

    aput-object p1, v0, v1

    return-void
.end method

.method protected final getPosition()I
    .registers 1

    .line 11
    iget p0, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->position:I

    return p0
.end method

.method protected abstract getSize(Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation
.end method

.method protected final setPosition(I)V
    .registers 2

    .line 11
    iput p1, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->position:I

    return-void
.end method

.method protected final size()I
    .registers 6

    .line 22
    iget v0, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->size:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    if-ltz v0, :cond_1a

    move v3, v2

    .line 23
    :goto_8
    iget-object v4, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->spreads:[Ljava/lang/Object;

    aget-object v4, v4, v3

    if-eqz v4, :cond_13

    invoke-virtual {p0, v4}, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->getSize(Ljava/lang/Object;)I

    move-result v4

    goto :goto_14

    :cond_13
    move v4, v1

    :goto_14
    add-int/2addr v2, v4

    if-eq v3, v0, :cond_1a

    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    :cond_1a
    return v2
.end method

.method protected final toArray(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)TT;"
        }
    .end annotation

    const-string v0, "values"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "result"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    iget v0, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->size:I

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    if-ltz v0, :cond_33

    move v2, v1

    move v3, v2

    move v4, v3

    .line 32
    :goto_14
    iget-object v5, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->spreads:[Ljava/lang/Object;

    aget-object v5, v5, v2

    if-eqz v5, :cond_2c

    if-ge v3, v2, :cond_22

    sub-int v6, v2, v3

    .line 35
    invoke-static {p1, v3, p2, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v4, v6

    .line 38
    :cond_22
    invoke-virtual {p0, v5}, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->getSize(Ljava/lang/Object;)I

    move-result v3

    .line 39
    invoke-static {v5, v1, p2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v4, v3

    add-int/lit8 v3, v2, 0x1

    :cond_2c
    if-eq v2, v0, :cond_31

    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    :cond_31
    move v1, v3

    goto :goto_34

    :cond_33
    move v4, v1

    .line 44
    :goto_34
    iget p0, p0, Lkotlin/jvm/internal/PrimitiveSpreadBuilder;->size:I

    if-ge v1, p0, :cond_3c

    sub-int/2addr p0, v1

    .line 45
    invoke-static {p1, v1, p2, v4, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_3c
    return-object p2
.end method
