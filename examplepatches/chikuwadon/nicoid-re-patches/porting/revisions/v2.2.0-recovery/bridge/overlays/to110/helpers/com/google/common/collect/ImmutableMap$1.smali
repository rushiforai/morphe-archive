.class Lcom/google/common/collect/ImmutableMap$1;
.super Lcom/google/common/collect/UnmodifiableIterator;
.source "ImmutableMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/ImmutableMap;->keyIterator()Lcom/google/common/collect/UnmodifiableIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/UnmodifiableIterator<",
        "TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/ImmutableMap;

.field final synthetic val$entryIterator:Lcom/google/common/collect/UnmodifiableIterator;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableMap;Lcom/google/common/collect/UnmodifiableIterator;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$entryIterator"
        }
    .end annotation

    .line 985
    iput-object p2, p0, Lcom/google/common/collect/ImmutableMap$1;->val$entryIterator:Lcom/google/common/collect/UnmodifiableIterator;

    iput-object p1, p0, Lcom/google/common/collect/ImmutableMap$1;->this$0:Lcom/google/common/collect/ImmutableMap;

    invoke-direct {p0}, Lcom/google/common/collect/UnmodifiableIterator;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 1

    .line 988
    iget-object p0, p0, Lcom/google/common/collect/ImmutableMap$1;->val$entryIterator:Lcom/google/common/collect/UnmodifiableIterator;

    invoke-virtual {p0}, Lcom/google/common/collect/UnmodifiableIterator;->hasNext()Z

    move-result p0

    return p0
.end method

.method public next()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 993
    iget-object p0, p0, Lcom/google/common/collect/ImmutableMap$1;->val$entryIterator:Lcom/google/common/collect/UnmodifiableIterator;

    invoke-virtual {p0}, Lcom/google/common/collect/UnmodifiableIterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map$Entry;

    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
