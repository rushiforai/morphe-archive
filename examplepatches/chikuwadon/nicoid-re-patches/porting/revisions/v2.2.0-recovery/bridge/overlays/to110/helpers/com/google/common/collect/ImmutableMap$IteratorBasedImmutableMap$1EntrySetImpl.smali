.class final Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap$1EntrySetImpl;
.super Lcom/google/common/collect/ImmutableMapEntrySet;
.source "ImmutableMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap;->createEntrySet()Lcom/google/common/collect/ImmutableSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "EntrySetImpl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ImmutableMapEntrySet<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 780
    iput-object p1, p0, Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap$1EntrySetImpl;->this$0:Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap;

    invoke-direct {p0}, Lcom/google/common/collect/ImmutableMapEntrySet;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Lcom/google/common/collect/UnmodifiableIterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 788
    iget-object p0, p0, Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap$1EntrySetImpl;->this$0:Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap;->entryIterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 780
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap$1EntrySetImpl;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method map()Lcom/google/common/collect/ImmutableMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 783
    iget-object p0, p0, Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap$1EntrySetImpl;->this$0:Lcom/google/common/collect/ImmutableMap$IteratorBasedImmutableMap;

    return-object p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 1

    .line 797
    invoke-super {p0}, Lcom/google/common/collect/ImmutableMapEntrySet;->writeReplace()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
