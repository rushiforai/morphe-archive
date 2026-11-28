.class public final Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field private counter:I

.field private currentStartIndex:I

.field private nextItem:Lnicoid/network238/kotlin/ranges/IntRange;

.field private nextSearchIndex:I

.field private nextState:I

.field final synthetic this$0:Lnicoid/network238/kotlin/text/DelimitedRangesSequence;


# direct methods
.method constructor <init>(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)V
    .registers 4

    iput-object p1, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/text/DelimitedRangesSequence;

    .line 1209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1210
    const/4 v0, -0x1

    iput v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextState:I

    .line 1211
    # getter for: Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->startIndex:I
    invoke-static {p1}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->access$getStartIndex$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)I

    move-result v0

    # getter for: Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->input:Ljava/lang/CharSequence;
    invoke-static {p1}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->access$getInput$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    const/4 v1, 0x0

    invoke-static {v0, v1, p1}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceIn(III)I

    move-result p1

    iput p1, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->currentStartIndex:I

    .line 1212
    iput p1, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextSearchIndex:I

    return-void
.end method

.method private final calcNext()V
    .registers 7

    .line 1217
    iget v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextSearchIndex:I

    const/4 v1, 0x0

    if-gez v0, :cond_0

    .line 1218
    iput v1, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextState:I

    .line 1219
    const/4 v0, 0x0

    iput-object v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextItem:Lnicoid/network238/kotlin/ranges/IntRange;

    return-void

    .line 1221
    :cond_0
    iget-object v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/text/DelimitedRangesSequence;

    # getter for: Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->limit:I
    invoke-static {v0}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->access$getLimit$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)I

    move-result v0

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-lez v0, :cond_1

    iget v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->counter:I

    add-int/2addr v0, v3

    iput v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->counter:I

    iget-object v4, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/text/DelimitedRangesSequence;

    # getter for: Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->limit:I
    invoke-static {v4}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->access$getLimit$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)I

    move-result v4

    if-ge v0, v4, :cond_2

    :cond_1
    iget v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextSearchIndex:I

    iget-object v4, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/text/DelimitedRangesSequence;

    # getter for: Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->input:Ljava/lang/CharSequence;
    invoke-static {v4}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->access$getInput$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-le v0, v4, :cond_3

    .line 1222
    :cond_2
    new-instance v0, Lnicoid/network238/kotlin/ranges/IntRange;

    iget v1, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->currentStartIndex:I

    iget-object v4, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/text/DelimitedRangesSequence;

    # getter for: Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->input:Ljava/lang/CharSequence;
    invoke-static {v4}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->access$getInput$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v4}, Lnicoid/network238/kotlin/text/StringsKt__StringsKt;->getLastIndex(Ljava/lang/CharSequence;)I

    move-result v4

    invoke-direct {v0, v1, v4}, Lnicoid/network238/kotlin/ranges/IntRange;-><init>(II)V

    iput-object v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextItem:Lnicoid/network238/kotlin/ranges/IntRange;

    .line 1223
    iput v2, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextSearchIndex:I

    goto :goto_0

    .line 1225
    :cond_3
    iget-object v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/text/DelimitedRangesSequence;

    # getter for: Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->getNextMatch:Lnicoid/network238/kotlin/jvm/functions/Function2;
    invoke-static {v0}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->access$getGetNextMatch$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)Lnicoid/network238/kotlin/jvm/functions/Function2;

    move-result-object v0

    iget-object v4, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/text/DelimitedRangesSequence;

    # getter for: Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->input:Ljava/lang/CharSequence;
    invoke-static {v4}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->access$getInput$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    iget v5, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextSearchIndex:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Lnicoid/network238/kotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/kotlin/Pair;

    if-nez v0, :cond_4

    .line 1227
    new-instance v0, Lnicoid/network238/kotlin/ranges/IntRange;

    iget v1, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->currentStartIndex:I

    iget-object v4, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/text/DelimitedRangesSequence;

    # getter for: Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->input:Ljava/lang/CharSequence;
    invoke-static {v4}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence;->access$getInput$p(Lnicoid/network238/kotlin/text/DelimitedRangesSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v4}, Lnicoid/network238/kotlin/text/StringsKt__StringsKt;->getLastIndex(Ljava/lang/CharSequence;)I

    move-result v4

    invoke-direct {v0, v1, v4}, Lnicoid/network238/kotlin/ranges/IntRange;-><init>(II)V

    iput-object v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextItem:Lnicoid/network238/kotlin/ranges/IntRange;

    .line 1228
    iput v2, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextSearchIndex:I

    goto :goto_0

    .line 1230
    :cond_4
    invoke-virtual {v0}, Lnicoid/network238/kotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    invoke-virtual {v0}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 1231
    iget v4, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->currentStartIndex:I

    invoke-static {v4, v2}, Lnicoid/network238/kotlin/ranges/RangesKt;->until(II)Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v4

    iput-object v4, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextItem:Lnicoid/network238/kotlin/ranges/IntRange;

    add-int/2addr v2, v0

    .line 1232
    iput v2, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->currentStartIndex:I

    if-nez v0, :cond_5

    move v1, v3

    :cond_5
    add-int/2addr v2, v1

    .line 1233
    iput v2, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextSearchIndex:I

    :goto_0
    nop

    .line 1236
    iput v3, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextState:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .line 1253
    iget v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1254
    invoke-direct {p0}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->calcNext()V

    .line 1255
    :cond_0
    iget v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .line 1209
    invoke-virtual {p0}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->next()Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object v0

    return-object v0
.end method

.method public next()Lnicoid/network238/kotlin/ranges/IntRange;
    .registers 4

    .line 1241
    iget v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1242
    invoke-direct {p0}, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->calcNext()V

    .line 1243
    :cond_0
    iget v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextState:I

    if-eqz v0, :cond_1

    .line 1245
    iget-object v0, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextItem:Lnicoid/network238/kotlin/ranges/IntRange;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1247
    const/4 v2, 0x0

    iput-object v2, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextItem:Lnicoid/network238/kotlin/ranges/IntRange;

    .line 1248
    iput v1, p0, Lnicoid/network238/kotlin/text/DelimitedRangesSequence$iterator$1;->nextState:I

    return-object v0

    .line 1244
    :cond_1
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
