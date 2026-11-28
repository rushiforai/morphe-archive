.class final Lcom/google/common/cache/LocalCache$Values;
.super Ljava/util/AbstractCollection;
.source "LocalCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
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
.field final synthetic this$0:Lcom/google/common/cache/LocalCache;


# direct methods
.method constructor <init>(Lcom/google/common/cache/LocalCache;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 4424
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$Values;->this$0:Lcom/google/common/cache/LocalCache;

    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 1

    .line 4437
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$Values;->this$0:Lcom/google/common/cache/LocalCache;

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache;->clear()V

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

    .line 4447
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$Values;->this$0:Lcom/google/common/cache/LocalCache;

    invoke-virtual {p0, p1}, Lcom/google/common/cache/LocalCache;->containsValue(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public isEmpty()Z
    .registers 1

    .line 4432
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$Values;->this$0:Lcom/google/common/cache/LocalCache;

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TV;>;"
        }
    .end annotation

    .line 4442
    new-instance v0, Lcom/google/common/cache/LocalCache$ValueIterator;

    iget-object p0, p0, Lcom/google/common/cache/LocalCache$Values;->this$0:Lcom/google/common/cache/LocalCache;

    invoke-direct {v0, p0}, Lcom/google/common/cache/LocalCache$ValueIterator;-><init>(Lcom/google/common/cache/LocalCache;)V

    return-object v0
.end method

.method public size()I
    .registers 1

    .line 4427
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$Values;->this$0:Lcom/google/common/cache/LocalCache;

    invoke-virtual {p0}, Lcom/google/common/cache/LocalCache;->size()I

    move-result p0

    return p0
.end method
