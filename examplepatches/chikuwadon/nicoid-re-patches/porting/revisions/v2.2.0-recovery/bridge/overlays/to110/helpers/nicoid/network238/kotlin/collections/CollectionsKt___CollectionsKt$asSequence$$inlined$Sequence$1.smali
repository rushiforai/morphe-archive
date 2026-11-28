.class public final Lnicoid/network238/kotlin/collections/CollectionsKt___CollectionsKt$asSequence$$inlined$Sequence$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/sequences/Sequence;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/kotlin/collections/CollectionsKt___CollectionsKt;->asSequence(Ljava/lang/Iterable;)Lnicoid/network238/kotlin/sequences/Sequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $this_asSequence$inlined:Ljava/lang/Iterable;


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/kotlin/collections/CollectionsKt___CollectionsKt$asSequence$$inlined$Sequence$1;->$this_asSequence$inlined:Ljava/lang/Iterable;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 2

    .line 23
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/CollectionsKt___CollectionsKt$asSequence$$inlined$Sequence$1;->$this_asSequence$inlined:Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method
