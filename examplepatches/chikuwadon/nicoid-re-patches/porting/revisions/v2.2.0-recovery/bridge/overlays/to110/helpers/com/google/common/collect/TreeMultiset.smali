.class public final Lcom/google/common/collect/TreeMultiset;
.super Lcom/google/common/collect/AbstractSortedMultiset;
.source "TreeMultiset.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/TreeMultiset$AvlNode;,
        Lcom/google/common/collect/TreeMultiset$Reference;,
        Lcom/google/common/collect/TreeMultiset$Aggregate;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractSortedMultiset<",
        "TE;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private transient deserializationReplacement:Lcom/google/common/collect/TreeMultiset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/TreeMultiset<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final transient header:Lcom/google/common/collect/TreeMultiset$AvlNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final transient range:Lcom/google/common/collect/GeneralRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/GeneralRange<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final transient rootReference:Lcom/google/common/collect/TreeMultiset$Reference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/TreeMultiset$Reference<",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/common/collect/TreeMultiset$Reference;Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/TreeMultiset$AvlNode;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "rootReference",
            "range",
            "endLink"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/TreeMultiset$Reference<",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;>;",
            "Lcom/google/common/collect/GeneralRange<",
            "TE;>;",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;)V"
        }
    .end annotation

    .line 129
    invoke-virtual {p2}, Lcom/google/common/collect/GeneralRange;->comparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/common/collect/AbstractSortedMultiset;-><init>(Ljava/util/Comparator;)V

    .line 130
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    .line 131
    iput-object p2, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    .line 132
    iput-object p3, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-void
.end method

.method private constructor <init>(Ljava/util/Comparator;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "comparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;)V"
        }
    .end annotation

    .line 136
    invoke-direct {p0, p1}, Lcom/google/common/collect/AbstractSortedMultiset;-><init>(Ljava/util/Comparator;)V

    .line 137
    invoke-static {p1}, Lcom/google/common/collect/GeneralRange;->all(Ljava/util/Comparator;)Lcom/google/common/collect/GeneralRange;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    .line 138
    new-instance p1, Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {p1}, Lcom/google/common/collect/TreeMultiset$AvlNode;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 139
    invoke-static {p1, p1}, Lcom/google/common/collect/TreeMultiset;->successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    .line 140
    new-instance p1, Lcom/google/common/collect/TreeMultiset$Reference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lcom/google/common/collect/TreeMultiset$Reference;-><init>(Lcom/google/common/collect/TreeMultiset$1;)V

    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    return-void
.end method

.method static synthetic access$1300(Lcom/google/common/collect/TreeMultiset;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 1

    .line 60
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset;->firstNode()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1400(Lcom/google/common/collect/TreeMultiset;)Lcom/google/common/collect/GeneralRange;
    .registers 1

    .line 60
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/google/common/collect/TreeMultiset;Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/Multiset$Entry;
    .registers 2

    .line 60
    invoke-direct {p0, p1}, Lcom/google/common/collect/TreeMultiset;->wrapEntry(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/Multiset$Entry;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1600(Lcom/google/common/collect/TreeMultiset;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 1

    .line 60
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/google/common/collect/TreeMultiset;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 1

    .line 60
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset;->lastNode()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1800(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V
    .registers 3

    .line 60
    invoke-static {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset;->successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V
    .registers 2

    .line 60
    invoke-static {p0, p1}, Lcom/google/common/collect/TreeMultiset;->successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/google/common/collect/TreeMultiset$AvlNode;)I
    .registers 1

    .line 60
    invoke-static {p0}, Lcom/google/common/collect/TreeMultiset;->distinctElements(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result p0

    return p0
.end method

.method private aggregateAboveRange(Lcom/google/common/collect/TreeMultiset$Aggregate;Lcom/google/common/collect/TreeMultiset$AvlNode;)J
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "aggr",
            "node"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/TreeMultiset$Aggregate;",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;)J"
        }
    .end annotation

    if-nez p2, :cond_0

    const-wide/16 p0, 0x0

    return-wide p0

    .line 216
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v0

    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    .line 217
    invoke-virtual {v1}, Lcom/google/common/collect/GeneralRange;->getUpperEndpoint()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-lez v0, :cond_1

    .line 219
    # getter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$600(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset;->aggregateAboveRange(Lcom/google/common/collect/TreeMultiset$Aggregate;Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide p0

    return-wide p0

    :cond_1
    if-nez v0, :cond_4

    .line 221
    sget-object v0, Lcom/google/common/collect/TreeMultiset$4;->$SwitchMap$com$google$common$collect$BoundType:[I

    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {p0}, Lcom/google/common/collect/GeneralRange;->getUpperBoundType()Lcom/google/common/collect/BoundType;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/collect/BoundType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3

    const/4 v0, 0x2

    if-ne p0, v0, :cond_2

    .line 225
    # getter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$600(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/common/collect/TreeMultiset$Aggregate;->treeAggregate(Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide p0

    return-wide p0

    .line 227
    :cond_2
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0

    .line 223
    :cond_3
    invoke-virtual {p1, p2}, Lcom/google/common/collect/TreeMultiset$Aggregate;->nodeAggregate(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result p0

    int-to-long v0, p0

    # getter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$600(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/common/collect/TreeMultiset$Aggregate;->treeAggregate(Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide p0

    :goto_0
    add-long/2addr v0, p0

    return-wide v0

    .line 229
    :cond_4
    # getter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$600(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/common/collect/TreeMultiset$Aggregate;->treeAggregate(Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide v0

    .line 230
    invoke-virtual {p1, p2}, Lcom/google/common/collect/TreeMultiset$Aggregate;->nodeAggregate(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 231
    # getter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$500(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset;->aggregateAboveRange(Lcom/google/common/collect/TreeMultiset$Aggregate;Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide p0

    goto :goto_0
.end method

.method private aggregateBelowRange(Lcom/google/common/collect/TreeMultiset$Aggregate;Lcom/google/common/collect/TreeMultiset$AvlNode;)J
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "aggr",
            "node"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/TreeMultiset$Aggregate;",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;)J"
        }
    .end annotation

    if-nez p2, :cond_0

    const-wide/16 p0, 0x0

    return-wide p0

    .line 191
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v0

    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    .line 192
    invoke-virtual {v1}, Lcom/google/common/collect/GeneralRange;->getLowerEndpoint()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_1

    .line 194
    # getter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$500(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset;->aggregateBelowRange(Lcom/google/common/collect/TreeMultiset$Aggregate;Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide p0

    return-wide p0

    :cond_1
    if-nez v0, :cond_4

    .line 196
    sget-object v0, Lcom/google/common/collect/TreeMultiset$4;->$SwitchMap$com$google$common$collect$BoundType:[I

    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {p0}, Lcom/google/common/collect/GeneralRange;->getLowerBoundType()Lcom/google/common/collect/BoundType;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/collect/BoundType;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_3

    const/4 v0, 0x2

    if-ne p0, v0, :cond_2

    .line 200
    # getter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$500(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/common/collect/TreeMultiset$Aggregate;->treeAggregate(Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide p0

    return-wide p0

    .line 202
    :cond_2
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0

    .line 198
    :cond_3
    invoke-virtual {p1, p2}, Lcom/google/common/collect/TreeMultiset$Aggregate;->nodeAggregate(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result p0

    int-to-long v0, p0

    # getter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$500(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/common/collect/TreeMultiset$Aggregate;->treeAggregate(Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide p0

    :goto_0
    add-long/2addr v0, p0

    return-wide v0

    .line 204
    :cond_4
    # getter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$500(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/common/collect/TreeMultiset$Aggregate;->treeAggregate(Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide v0

    .line 205
    invoke-virtual {p1, p2}, Lcom/google/common/collect/TreeMultiset$Aggregate;->nodeAggregate(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 206
    # getter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$600(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset;->aggregateBelowRange(Lcom/google/common/collect/TreeMultiset$Aggregate;Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide p0

    goto :goto_0
.end method

.method private aggregateForEntries(Lcom/google/common/collect/TreeMultiset$Aggregate;)J
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "aggr"
        }
    .end annotation

    .line 174
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset$Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 175
    invoke-virtual {p1, v0}, Lcom/google/common/collect/TreeMultiset$Aggregate;->treeAggregate(Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide v1

    .line 176
    iget-object v3, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v3}, Lcom/google/common/collect/GeneralRange;->hasLowerBound()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 177
    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/TreeMultiset;->aggregateBelowRange(Lcom/google/common/collect/TreeMultiset$Aggregate;Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide v3

    sub-long/2addr v1, v3

    .line 179
    :cond_0
    iget-object v3, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v3}, Lcom/google/common/collect/GeneralRange;->hasUpperBound()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 180
    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/TreeMultiset;->aggregateAboveRange(Lcom/google/common/collect/TreeMultiset$Aggregate;Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide p0

    sub-long/2addr v1, p0

    :cond_1
    return-wide v1
.end method

.method public static create()Lcom/google/common/collect/TreeMultiset;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Ljava/lang/Comparable;",
            ">()",
            "Lcom/google/common/collect/TreeMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 77
    new-instance v0, Lcom/google/common/collect/TreeMultiset;

    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/common/collect/TreeMultiset;-><init>(Ljava/util/Comparator;)V

    return-object v0
.end method

.method public static create(Ljava/lang/Iterable;)Lcom/google/common/collect/TreeMultiset;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "elements"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Ljava/lang/Comparable;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TE;>;)",
            "Lcom/google/common/collect/TreeMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 110
    invoke-static {}, Lcom/google/common/collect/TreeMultiset;->create()Lcom/google/common/collect/TreeMultiset;

    move-result-object v0

    .line 111
    invoke-static {v0, p0}, Lcom/google/common/collect/Iterables;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    return-object v0
.end method

.method public static create(Ljava/util/Comparator;)Lcom/google/common/collect/TreeMultiset;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "comparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator<",
            "-TE;>;)",
            "Lcom/google/common/collect/TreeMultiset<",
            "TE;>;"
        }
    .end annotation

    if-nez p0, :cond_0

    .line 95
    new-instance p0, Lcom/google/common/collect/TreeMultiset;

    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/common/collect/TreeMultiset;-><init>(Ljava/util/Comparator;)V

    return-object p0

    .line 96
    :cond_0
    new-instance v0, Lcom/google/common/collect/TreeMultiset;

    invoke-direct {v0, p0}, Lcom/google/common/collect/TreeMultiset;-><init>(Ljava/util/Comparator;)V

    return-object v0
.end method

.method private static distinctElements(Lcom/google/common/collect/TreeMultiset$AvlNode;)I
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "node"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "*>;)I"
        }
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 246
    :cond_0
    # getter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I
    invoke-static {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$400(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result p0

    return p0
.end method

.method private firstNode()Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 404
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset$Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 409
    :cond_0
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v2}, Lcom/google/common/collect/GeneralRange;->hasLowerBound()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 411
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v2}, Lcom/google/common/collect/GeneralRange;->getLowerEndpoint()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 412
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    # invokes: Lcom/google/common/collect/TreeMultiset$AvlNode;->ceiling(Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0, v3, v2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$1000(Lcom/google/common/collect/TreeMultiset$AvlNode;Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    if-nez v0, :cond_1

    return-object v1

    .line 416
    :cond_1
    iget-object v3, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v3}, Lcom/google/common/collect/GeneralRange;->getLowerBoundType()Lcom/google/common/collect/BoundType;

    move-result-object v3

    sget-object v4, Lcom/google/common/collect/BoundType;->OPEN:Lcom/google/common/collect/BoundType;

    if-ne v3, v4, :cond_3

    .line 417
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-nez v2, :cond_3

    .line 418
    # invokes: Lcom/google/common/collect/TreeMultiset$AvlNode;->succ()Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$700(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    goto :goto_0

    .line 421
    :cond_2
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    # invokes: Lcom/google/common/collect/TreeMultiset$AvlNode;->succ()Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$700(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    .line 423
    :cond_3
    :goto_0
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-eq v0, v2, :cond_4

    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/common/collect/GeneralRange;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    return-object v0

    :cond_4
    return-object v1
.end method

.method private lastNode()Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 427
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset$Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 432
    :cond_0
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v2}, Lcom/google/common/collect/GeneralRange;->hasUpperBound()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 434
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v2}, Lcom/google/common/collect/GeneralRange;->getUpperEndpoint()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 435
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    # invokes: Lcom/google/common/collect/TreeMultiset$AvlNode;->floor(Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0, v3, v2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$1100(Lcom/google/common/collect/TreeMultiset$AvlNode;Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    if-nez v0, :cond_1

    return-object v1

    .line 439
    :cond_1
    iget-object v3, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v3}, Lcom/google/common/collect/GeneralRange;->getUpperBoundType()Lcom/google/common/collect/BoundType;

    move-result-object v3

    sget-object v4, Lcom/google/common/collect/BoundType;->OPEN:Lcom/google/common/collect/BoundType;

    if-ne v3, v4, :cond_3

    .line 440
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-nez v2, :cond_3

    .line 441
    # invokes: Lcom/google/common/collect/TreeMultiset$AvlNode;->pred()Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$1200(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    goto :goto_0

    .line 444
    :cond_2
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    # invokes: Lcom/google/common/collect/TreeMultiset$AvlNode;->pred()Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$1200(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    .line 446
    :cond_3
    :goto_0
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-eq v0, v2, :cond_4

    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/common/collect/GeneralRange;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    return-object v0

    :cond_4
    return-object v1
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1077
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 1080
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Comparator;

    .line 1081
    new-instance v1, Lcom/google/common/collect/TreeMultiset;

    invoke-direct {v1, v0}, Lcom/google/common/collect/TreeMultiset;-><init>(Ljava/util/Comparator;)V

    iput-object v1, p0, Lcom/google/common/collect/TreeMultiset;->deserializationReplacement:Lcom/google/common/collect/TreeMultiset;

    .line 1082
    invoke-static {v1, p1}, Lcom/google/common/collect/Serialization;->populateMultiset(Lcom/google/common/collect/Multiset;Ljava/io/ObjectInputStream;)V

    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 1

    .line 1088
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->deserializationReplacement:Lcom/google/common/collect/TreeMultiset;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "a",
            "b"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TT;>;",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TT;>;)V"
        }
    .end annotation

    .line 1046
    # setter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->succ:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p0, p1}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$902(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 1047
    # setter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->pred:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {p1, p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$802(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-void
.end method

.method private static successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "a",
            "b",
            "c"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TT;>;",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TT;>;",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TT;>;)V"
        }
    .end annotation

    .line 1052
    invoke-static {p0, p1}, Lcom/google/common/collect/TreeMultiset;->successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    .line 1053
    invoke-static {p1, p2}, Lcom/google/common/collect/TreeMultiset;->successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    return-void
.end method

.method private wrapEntry(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/Multiset$Entry;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "baseEntry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;)",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;"
        }
    .end annotation

    .line 383
    new-instance v0, Lcom/google/common/collect/TreeMultiset$1;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/TreeMultiset$1;-><init>(Lcom/google/common/collect/TreeMultiset;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    return-object v0
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1069
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 1070
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->elementSet()Ljava/util/NavigableSet;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/NavigableSet;->comparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 1071
    invoke-static {p0, p1}, Lcom/google/common/collect/Serialization;->writeMultiset(Lcom/google/common/collect/Multiset;Ljava/io/ObjectOutputStream;)V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;I)I
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "element",
            "occurrences"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I)I"
        }
    .end annotation

    .line 267
    const-string v0, "occurrences"

    invoke-static {p2, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    if-nez p2, :cond_0

    .line 269
    invoke-virtual {p0, p1}, Lcom/google/common/collect/TreeMultiset;->count(Ljava/lang/Object;)I

    move-result p0

    return p0

    .line 271
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/GeneralRange;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 272
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset$Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 274
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v2

    invoke-interface {v2, p1, p1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 275
    new-instance v2, Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {v2, p1, p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;-><init>(Ljava/lang/Object;I)V

    .line 276
    iget-object p1, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-static {p1, v2, p1}, Lcom/google/common/collect/TreeMultiset;->successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    .line 277
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {p0, v0, v2}, Lcom/google/common/collect/TreeMultiset$Reference;->checkAndSet(Ljava/lang/Object;Ljava/lang/Object;)V

    return v1

    :cond_1
    const/4 v2, 0x1

    .line 280
    new-array v2, v2, [I

    .line 281
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    invoke-virtual {v0, v3, p1, p2, v2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->add(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    .line 282
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {p0, v0, p1}, Lcom/google/common/collect/TreeMultiset$Reference;->checkAndSet(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 283
    aget p0, v2, v1

    return p0
.end method

.method public clear()V
    .registers 4

    .line 360
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v0}, Lcom/google/common/collect/GeneralRange;->hasLowerBound()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v0}, Lcom/google/common/collect/GeneralRange;->hasUpperBound()Z

    move-result v0

    if-nez v0, :cond_1

    .line 362
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    # invokes: Lcom/google/common/collect/TreeMultiset$AvlNode;->succ()Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$700(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-eq v0, v1, :cond_0

    .line 363
    # invokes: Lcom/google/common/collect/TreeMultiset$AvlNode;->succ()Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$700(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v1

    const/4 v2, 0x0

    .line 365
    # setter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I
    invoke-static {v0, v2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$202(Lcom/google/common/collect/TreeMultiset$AvlNode;I)I

    const/4 v2, 0x0

    .line 367
    # setter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0, v2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$502(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 368
    # setter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0, v2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$602(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 369
    # setter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->pred:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0, v2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$802(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 370
    # setter for: Lcom/google/common/collect/TreeMultiset$AvlNode;->succ:Lcom/google/common/collect/TreeMultiset$AvlNode;
    invoke-static {v0, v2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->access$902(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-object v0, v1

    goto :goto_0

    .line 374
    :cond_0
    invoke-static {v1, v1}, Lcom/google/common/collect/TreeMultiset;->successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    .line 375
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset$Reference;->clear()V

    return-void

    .line 378
    :cond_1
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->internalEntryIterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Iterators;->clear(Ljava/util/Iterator;)V

    return-void
.end method

.method public bridge synthetic contains(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "element"
        }
    .end annotation

    .line 59
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractSortedMultiset;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public count(Ljava/lang/Object;)I
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    const/4 v0, 0x0

    .line 254
    :try_start_0
    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {v1}, Lcom/google/common/collect/TreeMultiset$Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 255
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v2, p1}, Lcom/google/common/collect/GeneralRange;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    .line 258
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object p0

    invoke-virtual {v1, p0, p1}, Lcom/google/common/collect/TreeMultiset$AvlNode;->count(Ljava/util/Comparator;Ljava/lang/Object;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    :cond_0
    return v0
.end method

.method descendingEntryIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;>;"
        }
    .end annotation

    .line 499
    new-instance v0, Lcom/google/common/collect/TreeMultiset$3;

    invoke-direct {v0, p0}, Lcom/google/common/collect/TreeMultiset$3;-><init>(Lcom/google/common/collect/TreeMultiset;)V

    return-object v0
.end method

.method elementIterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 451
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->internalEntryIterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Multisets;->elementIterator(Ljava/util/Iterator;)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic entrySet()Ljava/util/Set;
    .registers 1

    .line 59
    invoke-super {p0}, Lcom/google/common/collect/AbstractSortedMultiset;->entrySet()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "upperBound",
            "boundType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/SortedMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 548
    new-instance v0, Lcom/google/common/collect/TreeMultiset;

    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    .line 550
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    invoke-static {v3, p1, p2}, Lcom/google/common/collect/GeneralRange;->upTo(Ljava/util/Comparator;Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/GeneralRange;

    move-result-object p1

    invoke-virtual {v2, p1}, Lcom/google/common/collect/GeneralRange;->intersect(Lcom/google/common/collect/GeneralRange;)Lcom/google/common/collect/GeneralRange;

    move-result-object p1

    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {v0, v1, p1, p0}, Lcom/google/common/collect/TreeMultiset;-><init>(Lcom/google/common/collect/TreeMultiset$Reference;Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    return-object v0
.end method

.method internalDistinctElements()I
    .registers 3

    .line 242
    sget-object v0, Lcom/google/common/collect/TreeMultiset$Aggregate;->DISTINCT:Lcom/google/common/collect/TreeMultiset$Aggregate;

    invoke-direct {p0, v0}, Lcom/google/common/collect/TreeMultiset;->aggregateForEntries(Lcom/google/common/collect/TreeMultiset$Aggregate;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/common/primitives/Ints;->saturatedCast(J)I

    move-result p0

    return p0
.end method

.method internalEntryIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;>;"
        }
    .end annotation

    .line 456
    new-instance v0, Lcom/google/common/collect/TreeMultiset$2;

    invoke-direct {v0, p0}, Lcom/google/common/collect/TreeMultiset$2;-><init>(Lcom/google/common/collect/TreeMultiset;)V

    return-object v0
.end method

.method public bridge synthetic isEmpty()Z
    .registers 1

    .line 59
    invoke-super {p0}, Lcom/google/common/collect/AbstractSortedMultiset;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 543
    invoke-static {p0}, Lcom/google/common/collect/Multisets;->iteratorImpl(Lcom/google/common/collect/Multiset;)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public remove(Ljava/lang/Object;I)I
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "element",
            "occurrences"
        }
    .end annotation

    .line 289
    const-string v0, "occurrences"

    invoke-static {p2, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    if-nez p2, :cond_0

    .line 291
    invoke-virtual {p0, p1}, Lcom/google/common/collect/TreeMultiset;->count(Ljava/lang/Object;)I

    move-result p0

    return p0

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset$Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    const/4 v1, 0x1

    .line 294
    new-array v1, v1, [I

    const/4 v2, 0x0

    .line 299
    :try_start_0
    iget-object v3, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v3, p1}, Lcom/google/common/collect/GeneralRange;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    if-eqz v0, :cond_1

    .line 302
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    invoke-virtual {v0, v3, p1, p2, v1}, Lcom/google/common/collect/TreeMultiset$AvlNode;->remove(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 306
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {p0, v0, p1}, Lcom/google/common/collect/TreeMultiset$Reference;->checkAndSet(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 307
    aget p0, v1, v2

    return p0

    :catch_0
    :cond_1
    return v2
.end method

.method public setCount(Ljava/lang/Object;I)I
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "element",
            "count"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I)I"
        }
    .end annotation

    .line 313
    const-string v0, "count"

    invoke-static {p2, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    .line 314
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/GeneralRange;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    move v1, v2

    .line 315
    :cond_0
    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    return v2

    .line 319
    :cond_1
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset$Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v0, :cond_3

    if-lez p2, :cond_2

    .line 322
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset;->add(Ljava/lang/Object;I)I

    :cond_2
    return v2

    .line 326
    :cond_3
    new-array v1, v1, [I

    .line 327
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    invoke-virtual {v0, v3, p1, p2, v1}, Lcom/google/common/collect/TreeMultiset$AvlNode;->setCount(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    .line 328
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {p0, v0, p1}, Lcom/google/common/collect/TreeMultiset$Reference;->checkAndSet(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 329
    aget p0, v1, v2

    return p0
.end method

.method public setCount(Ljava/lang/Object;II)Z
    .registers 12
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "element",
            "oldCount",
            "newCount"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;II)Z"
        }
    .end annotation

    .line 335
    const-string v0, "newCount"

    invoke-static {p3, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    .line 336
    const-string v0, "oldCount"

    invoke-static {p2, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    .line 337
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/GeneralRange;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 339
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {v0}, Lcom/google/common/collect/TreeMultiset$Reference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/google/common/collect/TreeMultiset$AvlNode;

    const/4 v0, 0x0

    const/4 v7, 0x1

    if-nez v1, :cond_2

    if-nez p2, :cond_1

    if-lez p3, :cond_0

    .line 343
    invoke-virtual {p0, p1, p3}, Lcom/google/common/collect/TreeMultiset;->add(Ljava/lang/Object;I)I

    :cond_0
    return v7

    .line 348
    :cond_1
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object p0

    invoke-interface {p0, p1, p1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    return v0

    .line 352
    :cond_2
    new-array v6, v7, [I

    .line 353
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v2

    move-object v3, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v1 .. v6}, Lcom/google/common/collect/TreeMultiset$AvlNode;->setCount(Ljava/util/Comparator;Ljava/lang/Object;II[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    .line 354
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    invoke-virtual {p0, v1, p1}, Lcom/google/common/collect/TreeMultiset$Reference;->checkAndSet(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 355
    aget p0, v6, v0

    if-ne p0, v4, :cond_3

    return v7

    :cond_3
    return v0
.end method

.method public size()I
    .registers 3

    .line 237
    sget-object v0, Lcom/google/common/collect/TreeMultiset$Aggregate;->SIZE:Lcom/google/common/collect/TreeMultiset$Aggregate;

    invoke-direct {p0, v0}, Lcom/google/common/collect/TreeMultiset;->aggregateForEntries(Lcom/google/common/collect/TreeMultiset$Aggregate;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/common/primitives/Ints;->saturatedCast(J)I

    move-result p0

    return p0
.end method

.method public tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "lowerBound",
            "boundType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/SortedMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 556
    new-instance v0, Lcom/google/common/collect/TreeMultiset;

    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset;->rootReference:Lcom/google/common/collect/TreeMultiset$Reference;

    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset;->range:Lcom/google/common/collect/GeneralRange;

    .line 558
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset;->comparator()Ljava/util/Comparator;

    move-result-object v3

    invoke-static {v3, p1, p2}, Lcom/google/common/collect/GeneralRange;->downTo(Ljava/util/Comparator;Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/GeneralRange;

    move-result-object p1

    invoke-virtual {v2, p1}, Lcom/google/common/collect/GeneralRange;->intersect(Lcom/google/common/collect/GeneralRange;)Lcom/google/common/collect/GeneralRange;

    move-result-object p1

    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset;->header:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {v0, v1, p1, p0}, Lcom/google/common/collect/TreeMultiset;-><init>(Lcom/google/common/collect/TreeMultiset$Reference;Lcom/google/common/collect/GeneralRange;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    return-object v0
.end method
