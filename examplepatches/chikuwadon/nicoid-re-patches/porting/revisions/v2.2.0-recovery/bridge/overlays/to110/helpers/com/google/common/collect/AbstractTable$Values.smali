.class final Lcom/google/common/collect/AbstractTable$Values;
.super Ljava/util/AbstractCollection;
.source "AbstractTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/AbstractTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Values"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractCollection<",
        "TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/AbstractTable;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/AbstractTable;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 178
    iput-object p1, p0, Lcom/google/common/collect/AbstractTable$Values;->this$0:Lcom/google/common/collect/AbstractTable;

    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/AbstractTable;Lcom/google/common/collect/AbstractTable$1;)V
    .registers 3

    .line 178
    invoke-direct {p0, p1}, Lcom/google/common/collect/AbstractTable$Values;-><init>(Lcom/google/common/collect/AbstractTable;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 1

    .line 191
    iget-object p0, p0, Lcom/google/common/collect/AbstractTable$Values;->this$0:Lcom/google/common/collect/AbstractTable;

    invoke-virtual {p0}, Lcom/google/common/collect/AbstractTable;->clear()V

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

    .line 186
    iget-object p0, p0, Lcom/google/common/collect/AbstractTable$Values;->this$0:Lcom/google/common/collect/AbstractTable;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/AbstractTable;->containsValue(Ljava/lang/Object;)Z

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

    .line 181
    iget-object p0, p0, Lcom/google/common/collect/AbstractTable$Values;->this$0:Lcom/google/common/collect/AbstractTable;

    invoke-virtual {p0}, Lcom/google/common/collect/AbstractTable;->valuesIterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 196
    iget-object p0, p0, Lcom/google/common/collect/AbstractTable$Values;->this$0:Lcom/google/common/collect/AbstractTable;

    invoke-virtual {p0}, Lcom/google/common/collect/AbstractTable;->size()I

    move-result p0

    return p0
.end method
