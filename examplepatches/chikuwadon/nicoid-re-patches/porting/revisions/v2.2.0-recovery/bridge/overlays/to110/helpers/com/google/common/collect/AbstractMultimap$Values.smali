.class final Lcom/google/common/collect/AbstractMultimap$Values;
.super Ljava/util/AbstractCollection;
.source "AbstractMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/AbstractMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "Values"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractCollection<",
        "TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/AbstractMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/AbstractMultimap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 136
    iput-object p1, p0, Lcom/google/common/collect/AbstractMultimap$Values;->this$0:Lcom/google/common/collect/AbstractMultimap;

    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 1

    .line 154
    iget-object p0, p0, Lcom/google/common/collect/AbstractMultimap$Values;->this$0:Lcom/google/common/collect/AbstractMultimap;

    invoke-virtual {p0}, Lcom/google/common/collect/AbstractMultimap;->clear()V

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 149
    iget-object p0, p0, Lcom/google/common/collect/AbstractMultimap$Values;->this$0:Lcom/google/common/collect/AbstractMultimap;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/AbstractMultimap;->containsValue(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TV;>;"
        }
    .end annotation

    .line 139
    iget-object p0, p0, Lcom/google/common/collect/AbstractMultimap$Values;->this$0:Lcom/google/common/collect/AbstractMultimap;

    invoke-virtual {p0}, Lcom/google/common/collect/AbstractMultimap;->valueIterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 144
    iget-object p0, p0, Lcom/google/common/collect/AbstractMultimap$Values;->this$0:Lcom/google/common/collect/AbstractMultimap;

    invoke-virtual {p0}, Lcom/google/common/collect/AbstractMultimap;->size()I

    move-result p0

    return p0
.end method
