.class public final Lnicoid/network238/kotlin/sequences/TransformingSequence;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/sequences/Sequence;


# instance fields
.field private final sequence:Lnicoid/network238/kotlin/sequences/Sequence;

.field private final transformer:Lnicoid/network238/kotlin/jvm/functions/Function1;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/sequences/Sequence;Lnicoid/network238/kotlin/jvm/functions/Function1;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/sequences/TransformingSequence;->sequence:Lnicoid/network238/kotlin/sequences/Sequence;

    iput-object p2, p0, Lnicoid/network238/kotlin/sequences/TransformingSequence;->transformer:Lnicoid/network238/kotlin/jvm/functions/Function1;

    return-void
.end method

.method public static final synthetic access$getSequence$p(Lnicoid/network238/kotlin/sequences/TransformingSequence;)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 1

    .line 205
    iget-object p0, p0, Lnicoid/network238/kotlin/sequences/TransformingSequence;->sequence:Lnicoid/network238/kotlin/sequences/Sequence;

    return-object p0
.end method

.method public static final synthetic access$getTransformer$p(Lnicoid/network238/kotlin/sequences/TransformingSequence;)Lnicoid/network238/kotlin/jvm/functions/Function1;
    .registers 1

    .line 205
    iget-object p0, p0, Lnicoid/network238/kotlin/sequences/TransformingSequence;->transformer:Lnicoid/network238/kotlin/jvm/functions/Function1;

    return-object p0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 2

    .line 207
    new-instance v0, Lnicoid/network238/kotlin/sequences/TransformingSequence$iterator$1;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/sequences/TransformingSequence$iterator$1;-><init>(Lnicoid/network238/kotlin/sequences/TransformingSequence;)V

    return-object v0
.end method
