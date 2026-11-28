.class Lcom/google/common/collect/FilteredEntryMultimap$Entries$1;
.super Lcom/google/common/collect/TransformedIterator;
.source "FilteredEntryMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/FilteredEntryMultimap$Entries;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/TransformedIterator<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/FilteredEntryMultimap$Entries;


# direct methods
.method constructor <init>(Lcom/google/common/collect/FilteredEntryMultimap$Entries;Ljava/util/Iterator;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            "this$1",
            "backingIterator"
        }
    .end annotation

    .line 146
    iput-object p1, p0, Lcom/google/common/collect/FilteredEntryMultimap$Entries$1;->this$1:Lcom/google/common/collect/FilteredEntryMultimap$Entries;

    invoke-direct {p0, p2}, Lcom/google/common/collect/TransformedIterator;-><init>(Ljava/util/Iterator;)V

    return-void
.end method


# virtual methods
.method bridge synthetic transform(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "entry"
        }
    .end annotation

    .line 146
    check-cast p1, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/FilteredEntryMultimap$Entries$1;->transform(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method transform(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 149
    new-instance v0, Lcom/google/common/collect/FilteredEntryMultimap$Entries$1$1;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/FilteredEntryMultimap$Entries$1$1;-><init>(Lcom/google/common/collect/FilteredEntryMultimap$Entries$1;Ljava/util/Map$Entry;)V

    return-object v0
.end method
