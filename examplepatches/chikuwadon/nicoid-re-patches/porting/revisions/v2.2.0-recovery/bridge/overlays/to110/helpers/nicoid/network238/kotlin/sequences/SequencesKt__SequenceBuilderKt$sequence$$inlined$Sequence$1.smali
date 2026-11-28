.class public final Lnicoid/network238/kotlin/sequences/SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/sequences/Sequence;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/kotlin/sequences/SequencesKt__SequenceBuilderKt;->sequence(Lnicoid/network238/kotlin/jvm/functions/Function2;)Lnicoid/network238/kotlin/sequences/Sequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $block$inlined:Lnicoid/network238/kotlin/jvm/functions/Function2;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/jvm/functions/Function2;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/kotlin/sequences/SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;->$block$inlined:Lnicoid/network238/kotlin/jvm/functions/Function2;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 2

    .line 23
    iget-object v0, p0, Lnicoid/network238/kotlin/sequences/SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;->$block$inlined:Lnicoid/network238/kotlin/jvm/functions/Function2;

    invoke-static {v0}, Lnicoid/network238/kotlin/sequences/SequencesKt__SequenceBuilderKt;->iterator(Lnicoid/network238/kotlin/jvm/functions/Function2;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method
