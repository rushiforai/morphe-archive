.class public final Lnicoid/network238/kotlin/sequences/TransformingSequence$iterator$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/kotlin/sequences/TransformingSequence;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field private final iterator:Ljava/util/Iterator;

.field final synthetic this$0:Lnicoid/network238/kotlin/sequences/TransformingSequence;


# direct methods
.method constructor <init>(Lnicoid/network238/kotlin/sequences/TransformingSequence;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/kotlin/sequences/TransformingSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/sequences/TransformingSequence;

    .line 207
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 208
    # getter for: Lnicoid/network238/kotlin/sequences/TransformingSequence;->sequence:Lnicoid/network238/kotlin/sequences/Sequence;
    invoke-static {p1}, Lnicoid/network238/kotlin/sequences/TransformingSequence;->access$getSequence$p(Lnicoid/network238/kotlin/sequences/TransformingSequence;)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object p1

    invoke-interface {p1}, Lnicoid/network238/kotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/kotlin/sequences/TransformingSequence$iterator$1;->iterator:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .line 214
    iget-object v0, p0, Lnicoid/network238/kotlin/sequences/TransformingSequence$iterator$1;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 3

    .line 210
    iget-object v0, p0, Lnicoid/network238/kotlin/sequences/TransformingSequence$iterator$1;->this$0:Lnicoid/network238/kotlin/sequences/TransformingSequence;

    # getter for: Lnicoid/network238/kotlin/sequences/TransformingSequence;->transformer:Lnicoid/network238/kotlin/jvm/functions/Function1;
    invoke-static {v0}, Lnicoid/network238/kotlin/sequences/TransformingSequence;->access$getTransformer$p(Lnicoid/network238/kotlin/sequences/TransformingSequence;)Lnicoid/network238/kotlin/jvm/functions/Function1;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/kotlin/sequences/TransformingSequence$iterator$1;->iterator:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation is not supported for read-only collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
