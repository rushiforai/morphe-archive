.class final Lcom/google/common/collect/ObjectCountHashMap$MapEntry;
.super Lcom/google/common/collect/Multisets$AbstractEntry;
.source "ObjectCountHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ObjectCountHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MapEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Multisets$AbstractEntry<",
        "TK;>;"
    }
.end annotation


# instance fields
.field final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field lastKnownIndex:I

.field final synthetic this$0:Lcom/google/common/collect/ObjectCountHashMap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ObjectCountHashMap;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "index"
        }
    .end annotation

    .line 217
    iput-object p1, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->this$0:Lcom/google/common/collect/ObjectCountHashMap;

    invoke-direct {p0}, Lcom/google/common/collect/Multisets$AbstractEntry;-><init>()V

    .line 218
    iget-object p1, p1, Lcom/google/common/collect/ObjectCountHashMap;->keys:[Ljava/lang/Object;

    aget-object p1, p1, p2

    iput-object p1, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->key:Ljava/lang/Object;

    .line 219
    iput p2, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->lastKnownIndex:I

    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 3

    .line 238
    invoke-virtual {p0}, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->updateLastKnownIndex()V

    .line 239
    iget v0, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->lastKnownIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->this$0:Lcom/google/common/collect/ObjectCountHashMap;

    iget-object v0, v0, Lcom/google/common/collect/ObjectCountHashMap;->values:[I

    iget p0, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->lastKnownIndex:I

    aget p0, v0, p0

    return p0
.end method

.method public getElement()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 225
    iget-object p0, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->key:Ljava/lang/Object;

    return-object p0
.end method

.method updateLastKnownIndex()V
    .registers 4

    .line 229
    iget v0, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->lastKnownIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->this$0:Lcom/google/common/collect/ObjectCountHashMap;

    .line 230
    invoke-virtual {v1}, Lcom/google/common/collect/ObjectCountHashMap;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->key:Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->this$0:Lcom/google/common/collect/ObjectCountHashMap;

    iget-object v1, v1, Lcom/google/common/collect/ObjectCountHashMap;->keys:[Ljava/lang/Object;

    iget v2, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->lastKnownIndex:I

    aget-object v1, v1, v2

    .line 231
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 232
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->this$0:Lcom/google/common/collect/ObjectCountHashMap;

    iget-object v1, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->key:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ObjectCountHashMap;->indexOf(Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lcom/google/common/collect/ObjectCountHashMap$MapEntry;->lastKnownIndex:I

    return-void
.end method
