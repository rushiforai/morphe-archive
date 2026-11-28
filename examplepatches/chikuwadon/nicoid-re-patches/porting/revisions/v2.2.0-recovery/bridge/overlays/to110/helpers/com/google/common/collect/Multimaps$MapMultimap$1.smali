.class Lcom/google/common/collect/Multimaps$MapMultimap$1;
.super Lcom/google/common/collect/Sets$ImprovedAbstractSet;
.source "Multimaps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Multimaps$MapMultimap;->get(Ljava/lang/Object;)Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Sets$ImprovedAbstractSet<",
        "TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Multimaps$MapMultimap;

.field final synthetic val$key:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multimaps$MapMultimap;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$key"
        }
    .end annotation

    .line 1149
    iput-object p2, p0, Lcom/google/common/collect/Multimaps$MapMultimap$1;->val$key:Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/common/collect/Multimaps$MapMultimap$1;->this$0:Lcom/google/common/collect/Multimaps$MapMultimap;

    invoke-direct {p0}, Lcom/google/common/collect/Sets$ImprovedAbstractSet;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TV;>;"
        }
    .end annotation

    .line 1152
    new-instance v0, Lcom/google/common/collect/Multimaps$MapMultimap$1$1;

    iget-object v1, p0, Lcom/google/common/collect/Multimaps$MapMultimap$1;->val$key:Ljava/lang/Object;

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/Multimaps$MapMultimap$1$1;-><init>(Lcom/google/common/collect/Multimaps$MapMultimap$1;Ljava/lang/Object;)V

    return-object v0
.end method

.method public size()I
    .registers 2

    .line 1185
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$MapMultimap$1;->this$0:Lcom/google/common/collect/Multimaps$MapMultimap;

    iget-object v0, v0, Lcom/google/common/collect/Multimaps$MapMultimap;->map:Ljava/util/Map;

    iget-object p0, p0, Lcom/google/common/collect/Multimaps$MapMultimap$1;->val$key:Ljava/lang/Object;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
