.class final Lnicoid/network238/kotlin/text/LinesIterator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/text/LinesIterator$State;
    }
.end annotation


# static fields
.field private static final State:Lnicoid/network238/kotlin/text/LinesIterator$State;


# instance fields
.field private delimiterLength:I

.field private delimiterStartIndex:I

.field private state:I

.field private final string:Ljava/lang/CharSequence;

.field private tokenStartIndex:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/text/LinesIterator$State;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/text/LinesIterator$State;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/text/LinesIterator;->State:Lnicoid/network238/kotlin/text/LinesIterator$State;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1264
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 9

    .line 1277
    iget v0, p0, Lnicoid/network238/kotlin/text/LinesIterator;->state:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    if-ne v0, v2, :cond_0

    return v2

    :cond_0
    return v1

    .line 1281
    :cond_1
    iget v0, p0, Lnicoid/network238/kotlin/text/LinesIterator;->delimiterLength:I

    const/4 v3, 0x2

    if-gez v0, :cond_2

    .line 1282
    iput v3, p0, Lnicoid/network238/kotlin/text/LinesIterator;->state:I

    return v1

    :cond_2
    nop

    .line 1287
    iget-object v0, p0, Lnicoid/network238/kotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 1289
    iget v1, p0, Lnicoid/network238/kotlin/text/LinesIterator;->tokenStartIndex:I

    iget-object v4, p0, Lnicoid/network238/kotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    :goto_0
    if-ge v1, v4, :cond_5

    .line 1290
    iget-object v5, p0, Lnicoid/network238/kotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {v5, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    const/16 v6, 0xd

    const/16 v7, 0xa

    if-eq v5, v7, :cond_3

    if-eq v5, v6, :cond_3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    if-ne v5, v6, :cond_4

    add-int/lit8 v0, v1, 0x1

    .line 1294
    iget-object v4, p0, Lnicoid/network238/kotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-ge v0, v4, :cond_4

    iget-object v4, p0, Lnicoid/network238/kotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {v4, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    if-ne v0, v7, :cond_4

    goto :goto_1

    :cond_4
    move v3, v2

    :goto_1
    move v0, v1

    goto :goto_2

    .line 1289
    :cond_5
    const/4 v3, -0x1

    .line 1294
    :goto_2
    nop

    .line 1301
    iput v2, p0, Lnicoid/network238/kotlin/text/LinesIterator;->state:I

    .line 1302
    iput v3, p0, Lnicoid/network238/kotlin/text/LinesIterator;->delimiterLength:I

    .line 1303
    iput v0, p0, Lnicoid/network238/kotlin/text/LinesIterator;->delimiterStartIndex:I

    return v2
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .line 1264
    invoke-virtual {p0}, Lnicoid/network238/kotlin/text/LinesIterator;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/String;
    .registers 4

    .line 1309
    invoke-virtual {p0}, Lnicoid/network238/kotlin/text/LinesIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1313
    const/4 v0, 0x0

    iput v0, p0, Lnicoid/network238/kotlin/text/LinesIterator;->state:I

    .line 1314
    iget v0, p0, Lnicoid/network238/kotlin/text/LinesIterator;->delimiterStartIndex:I

    .line 1315
    iget v1, p0, Lnicoid/network238/kotlin/text/LinesIterator;->tokenStartIndex:I

    .line 1316
    iget v2, p0, Lnicoid/network238/kotlin/text/LinesIterator;->delimiterLength:I

    add-int/2addr v2, v0

    iput v2, p0, Lnicoid/network238/kotlin/text/LinesIterator;->tokenStartIndex:I

    .line 1317
    iget-object v2, p0, Lnicoid/network238/kotlin/text/LinesIterator;->string:Ljava/lang/CharSequence;

    invoke-interface {v2, v1, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1310
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation is not supported for read-only collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
