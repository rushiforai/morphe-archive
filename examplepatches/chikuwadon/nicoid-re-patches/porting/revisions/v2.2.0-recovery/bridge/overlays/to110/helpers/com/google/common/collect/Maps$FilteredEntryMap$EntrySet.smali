.class final Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet;
.super Lcom/google/common/collect/ForwardingSet;
.source "Maps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Maps$FilteredEntryMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "EntrySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ForwardingSet<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Maps$FilteredEntryMap;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/Maps$FilteredEntryMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 2884
    iput-object p1, p0, Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet;->this$0:Lcom/google/common/collect/Maps$FilteredEntryMap;

    invoke-direct {p0}, Lcom/google/common/collect/ForwardingSet;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/Maps$FilteredEntryMap;Lcom/google/common/collect/Maps$1;)V
    .registers 3

    .line 2884
    invoke-direct {p0, p1}, Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet;-><init>(Lcom/google/common/collect/Maps$FilteredEntryMap;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 2884
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet;->delegate()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/util/Collection;
    .registers 1

    .line 2884
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet;->delegate()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method protected delegate()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 2887
    iget-object p0, p0, Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet;->this$0:Lcom/google/common/collect/Maps$FilteredEntryMap;

    iget-object p0, p0, Lcom/google/common/collect/Maps$FilteredEntryMap;->filteredEntrySet:Ljava/util/Set;

    return-object p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 2892
    new-instance v0, Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet$1;

    iget-object v1, p0, Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet;->this$0:Lcom/google/common/collect/Maps$FilteredEntryMap;

    iget-object v1, v1, Lcom/google/common/collect/Maps$FilteredEntryMap;->filteredEntrySet:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet$1;-><init>(Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet;Ljava/util/Iterator;)V

    return-object v0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 1

    .line 2917
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/util/Iterator;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "array"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .line 2923
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$FilteredEntryMap$EntrySet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/util/Iterator;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
