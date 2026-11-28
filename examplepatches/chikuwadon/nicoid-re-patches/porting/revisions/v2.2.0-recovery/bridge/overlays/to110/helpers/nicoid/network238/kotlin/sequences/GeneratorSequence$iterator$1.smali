.class public final Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/kotlin/sequences/GeneratorSequence;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field private nextItem:Ljava/lang/Object;

.field private nextState:I

.field final synthetic this$0:Lnicoid/network238/kotlin/sequences/GeneratorSequence;


# direct methods
.method constructor <init>(Lnicoid/network238/kotlin/sequences/GeneratorSequence;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/sequences/GeneratorSequence;

    .line 604
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 606
    const/4 p1, -0x2

    iput p1, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->nextState:I

    return-void
.end method

.method private final calcNext()V
    .registers 4

    .line 609
    iget v0, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->nextState:I

    iget-object v1, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/sequences/GeneratorSequence;

    const/4 v2, -0x2

    if-ne v0, v2, :cond_0

    # getter for: Lnicoid/network238/kotlin/sequences/GeneratorSequence;->getInitialValue:Lnicoid/network238/kotlin/jvm/functions/Function0;
    invoke-static {v1}, Lnicoid/network238/kotlin/sequences/GeneratorSequence;->access$getGetInitialValue$p(Lnicoid/network238/kotlin/sequences/GeneratorSequence;)Lnicoid/network238/kotlin/jvm/functions/Function0;

    move-result-object v0

    invoke-interface {v0}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_0
    # getter for: Lnicoid/network238/kotlin/sequences/GeneratorSequence;->getNextValue:Lnicoid/network238/kotlin/jvm/functions/Function1;
    invoke-static {v1}, Lnicoid/network238/kotlin/sequences/GeneratorSequence;->access$getGetNextValue$p(Lnicoid/network238/kotlin/sequences/GeneratorSequence;)Lnicoid/network238/kotlin/jvm/functions/Function1;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->nextItem:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0, v1}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->nextItem:Ljava/lang/Object;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    const/4 v0, 0x1

    .line 610
    :goto_1
    iput v0, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->nextState:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .line 626
    iget v0, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->nextState:I

    if-gez v0, :cond_0

    .line 627
    invoke-direct {p0}, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->calcNext()V

    .line 628
    :cond_0
    iget v0, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->nextState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 3

    .line 614
    iget v0, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->nextState:I

    if-gez v0, :cond_0

    .line 615
    invoke-direct {p0}, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->calcNext()V

    .line 617
    :cond_0
    iget v0, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->nextState:I

    if-eqz v0, :cond_1

    .line 619
    iget-object v0, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->nextItem:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 621
    const/4 v1, -0x1

    iput v1, p0, Lnicoid/network238/kotlin/sequences/GeneratorSequence$iterator$1;->nextState:I

    return-object v0

    .line 618
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
