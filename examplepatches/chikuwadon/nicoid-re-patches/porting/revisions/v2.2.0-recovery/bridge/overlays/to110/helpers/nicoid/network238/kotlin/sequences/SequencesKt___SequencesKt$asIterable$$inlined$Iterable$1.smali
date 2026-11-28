.class public final Lnicoid/network238/kotlin/sequences/SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/kotlin/sequences/SequencesKt___SequencesKt;->asIterable(Lnicoid/network238/kotlin/sequences/Sequence;)Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $this_asIterable$inlined:Lnicoid/network238/kotlin/sequences/Sequence;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/sequences/Sequence;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/kotlin/sequences/SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1;->$this_asIterable$inlined:Lnicoid/network238/kotlin/sequences/Sequence;

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 2

    .line 18
    iget-object v0, p0, Lnicoid/network238/kotlin/sequences/SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1;->$this_asIterable$inlined:Lnicoid/network238/kotlin/sequences/Sequence;

    invoke-interface {v0}, Lnicoid/network238/kotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method
