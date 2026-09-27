.class final Lkotlin/text/LinesIterator;
.super Ljava/lang/Object;
.source "Strings.kt"

# interfaces
.implements Ljava/util/Iterator;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/text/LinesIterator$State;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/lang/String;",
        ">;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010(\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\r\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u0002\u0018\u0000 \u000f2\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u000fB\u0011\u0008F\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\n\u0010\u000c\u001a\u00020\rH\u0096\u0082\u0004J\n\u0010\u000e\u001a\u00020\u0002H\u0096\u0082\u0004R\u000f\u0010\u0003\u001a\u00020\u0004X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0007\u001a\u00020\u0008X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\t\u001a\u00020\u0008X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\n\u001a\u00020\u0008X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000b\u001a\u00020\u0008X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Lkotlin/text/LinesIterator;",
        "",
        "",
        "string",
        "",
        "<init>",
        "(Ljava/lang/CharSequence;)V",
        "state",
        "",
        "tokenStartIndex",
        "delimiterStartIndex",
        "delimiterLength",
        "hasNext",
        "",
        "next",
        "State",
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


# static fields
.field public static final EXHAUSTED:I = 0x2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final HAS_NEXT:I = 0x1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final State:Lkotlin/text/LinesIterator$State;

.field public static final UNKNOWN:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field private delimiterLength:I

.field private delimiterStartIndex:I

.field private state:I

.field private final string:Ljava/lang/CharSequence;

.field private tokenStartIndex:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/text/LinesIterator$State;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/text/LinesIterator$State;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/text/LinesIterator;->State:Lkotlin/text/LinesIterator$State;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;)V
    .registers 3

    const-string v0, "string"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1280
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 9

    .line 1293
    iget v0, p0, Lkotlin/text/LinesIterator;->state:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_a

    if-ne v0, v2, :cond_9

    return v2

    :cond_9
    return v1

    .line 1297
    :cond_a
    iget v0, p0, Lkotlin/text/LinesIterator;->delimiterLength:I

    const/4 v3, 0x2

    if-gez v0, :cond_12

    .line 1298
    iput v3, p0, Lkotlin/text/LinesIterator;->state:I

    return v1

    .line 1303
    :cond_12
    iget-object v0, p0, Lkotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 1305
    iget v1, p0, Lkotlin/text/LinesIterator;->tokenStartIndex:I

    iget-object v4, p0, Lkotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    :goto_20
    if-ge v1, v4, :cond_4b

    .line 1306
    iget-object v5, p0, Lkotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {v5, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    const/16 v6, 0xd

    const/16 v7, 0xa

    if-eq v5, v7, :cond_33

    if-eq v5, v6, :cond_33

    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    :cond_33
    if-ne v5, v6, :cond_48

    add-int/lit8 v0, v1, 0x1

    .line 1310
    iget-object v4, p0, Lkotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-ge v0, v4, :cond_48

    iget-object v4, p0, Lkotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {v4, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    if-ne v0, v7, :cond_48

    goto :goto_49

    :cond_48
    move v3, v2

    :goto_49
    move v0, v1

    goto :goto_4c

    :cond_4b
    const/4 v3, -0x1

    .line 1317
    :goto_4c
    iput v2, p0, Lkotlin/text/LinesIterator;->state:I

    .line 1318
    iput v3, p0, Lkotlin/text/LinesIterator;->delimiterLength:I

    .line 1319
    iput v0, p0, Lkotlin/text/LinesIterator;->delimiterStartIndex:I

    return v2
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 1

    .line 1280
    invoke-virtual {p0}, Lkotlin/text/LinesIterator;->next()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public next()Ljava/lang/String;
    .registers 4

    .line 1325
    invoke-virtual {p0}, Lkotlin/text/LinesIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    const/4 v0, 0x0

    .line 1329
    iput v0, p0, Lkotlin/text/LinesIterator;->state:I

    .line 1330
    iget v0, p0, Lkotlin/text/LinesIterator;->delimiterStartIndex:I

    .line 1331
    iget v1, p0, Lkotlin/text/LinesIterator;->tokenStartIndex:I

    .line 1332
    iget v2, p0, Lkotlin/text/LinesIterator;->delimiterLength:I

    add-int/2addr v2, v0

    iput v2, p0, Lkotlin/text/LinesIterator;->tokenStartIndex:I

    .line 1333
    iget-object p0, p0, Lkotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {p0, v1, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1326
    :cond_1d
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public remove()V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
