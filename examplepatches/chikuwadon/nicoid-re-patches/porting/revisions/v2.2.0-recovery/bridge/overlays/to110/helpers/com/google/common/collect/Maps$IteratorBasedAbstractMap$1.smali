.class Lcom/google/common/collect/Maps$IteratorBasedAbstractMap$1;
.super Lcom/google/common/collect/Maps$EntrySet;
.source "Maps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Maps$IteratorBasedAbstractMap;->entrySet()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Maps$EntrySet<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Maps$IteratorBasedAbstractMap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Maps$IteratorBasedAbstractMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 3584
    iput-object p1, p0, Lcom/google/common/collect/Maps$IteratorBasedAbstractMap$1;->this$0:Lcom/google/common/collect/Maps$IteratorBasedAbstractMap;

    invoke-direct {p0}, Lcom/google/common/collect/Maps$EntrySet;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 3592
    iget-object p0, p0, Lcom/google/common/collect/Maps$IteratorBasedAbstractMap$1;->this$0:Lcom/google/common/collect/Maps$IteratorBasedAbstractMap;

    invoke-virtual {p0}, Lcom/google/common/collect/Maps$IteratorBasedAbstractMap;->entryIterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method map()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 3587
    iget-object p0, p0, Lcom/google/common/collect/Maps$IteratorBasedAbstractMap$1;->this$0:Lcom/google/common/collect/Maps$IteratorBasedAbstractMap;

    return-object p0
.end method
