.class abstract Lcom/google/common/collect/ForwardingCollection$SimpleForwardingCollection;
.super Lcom/google/common/collect/ForwardingCollection;
.source "ForwardingCollection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ForwardingCollection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "SimpleForwardingCollection"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingCollection<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private final delegate:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Collection;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "delegate"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "TE;>;)V"
        }
    .end annotation

    .line 275
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingCollection;-><init>()V

    .line 276
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Collection;

    iput-object p1, p0, Lcom/google/common/collect/ForwardingCollection$SimpleForwardingCollection;->delegate:Ljava/util/Collection;

    return-void
.end method


# virtual methods
.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 270
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingCollection$SimpleForwardingCollection;->delegate()Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method

.method protected final delegate()Ljava/util/Collection;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TE;>;"
        }
    .end annotation

    .line 281
    iget-object p0, p0, Lcom/google/common/collect/ForwardingCollection$SimpleForwardingCollection;->delegate:Ljava/util/Collection;

    return-object p0
.end method
