.class final Lcom/google/common/collect/TreeMultiset$AvlNode;
.super Ljava/lang/Object;
.source "TreeMultiset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/TreeMultiset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AvlNode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private distinctElements:I

.field private final elem:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TE;"
        }
    .end annotation
.end field

.field private elemCount:I

.field private height:I

.field private left:Lcom/google/common/collect/TreeMultiset$AvlNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation
.end field

.field private pred:Lcom/google/common/collect/TreeMultiset$AvlNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation
.end field

.field private right:Lcom/google/common/collect/TreeMultiset$AvlNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation
.end field

.field private succ:Lcom/google/common/collect/TreeMultiset$AvlNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation
.end field

.field private totalCount:J


# direct methods
.method constructor <init>()V
    .registers 2

    .line 628
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 629
    iput-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elem:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 630
    iput v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;I)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "elem",
            "elemCount"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I)V"
        }
    .end annotation

    .line 616
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-lez p2, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 617
    :goto_0
    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 618
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elem:Ljava/lang/Object;

    .line 619
    iput p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    int-to-long p1, p2

    .line 620
    iput-wide p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 621
    iput v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 622
    iput v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    const/4 p1, 0x0

    .line 623
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 624
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-void
.end method

.method static synthetic access$1000(Lcom/google/common/collect/TreeMultiset$AvlNode;Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 3

    .line 581
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->ceiling(Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1100(Lcom/google/common/collect/TreeMultiset$AvlNode;Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 3

    .line 581
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->floor(Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1200(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 1

    .line 581
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->pred()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/google/common/collect/TreeMultiset$AvlNode;)I
    .registers 1

    .line 581
    iget p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    return p0
.end method

.method static synthetic access$202(Lcom/google/common/collect/TreeMultiset$AvlNode;I)I
    .registers 2

    .line 581
    iput p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    return p1
.end method

.method static synthetic access$300(Lcom/google/common/collect/TreeMultiset$AvlNode;)J
    .registers 3

    .line 581
    iget-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/google/common/collect/TreeMultiset$AvlNode;)I
    .registers 1

    .line 581
    iget p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    return p0
.end method

.method static synthetic access$500(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 1

    .line 581
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p0
.end method

.method static synthetic access$502(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 2

    .line 581
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p1
.end method

.method static synthetic access$600(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 1

    .line 581
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p0
.end method

.method static synthetic access$602(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 2

    .line 581
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p1
.end method

.method static synthetic access$700(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 1

    .line 581
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->succ()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$802(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 2

    .line 581
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->pred:Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p1
.end method

.method static synthetic access$902(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 2

    .line 581
    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->succ:Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p1
.end method

.method private addLeftChild(Ljava/lang/Object;I)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "e",
            "count"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I)",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 666
    new-instance v0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {v0, p1, p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;-><init>(Ljava/lang/Object;I)V

    iput-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 667
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->pred()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    # invokes: Lcom/google/common/collect/TreeMultiset;->successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V
    invoke-static {p1, v0, p0}, Lcom/google/common/collect/TreeMultiset;->access$1800(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    const/4 p1, 0x2

    .line 668
    iget v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    .line 669
    iget p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 670
    iget-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    int-to-long p1, p2

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    return-object p0
.end method

.method private addRightChild(Ljava/lang/Object;I)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "e",
            "count"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I)",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 656
    new-instance v0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {v0, p1, p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;-><init>(Ljava/lang/Object;I)V

    iput-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 657
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->succ()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    # invokes: Lcom/google/common/collect/TreeMultiset;->successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V
    invoke-static {p0, v0, p1}, Lcom/google/common/collect/TreeMultiset;->access$1800(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    const/4 p1, 0x2

    .line 658
    iget v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    .line 659
    iget p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 660
    iget-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    int-to-long p1, p2

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    return-object p0
.end method

.method private balanceFactor()I
    .registers 2

    .line 971
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-static {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->height(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result v0

    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-static {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->height(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result p0

    sub-int/2addr v0, p0

    return v0
.end method

.method private ceiling(Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "comparator",
            "e"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;TE;)",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 1008
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_0

    .line 1010
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-eqz v0, :cond_1

    invoke-direct {v0, p1, p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->ceiling(Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p0

    :cond_0
    if-nez v0, :cond_2

    :cond_1
    return-object p0

    .line 1014
    :cond_2
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez p0, :cond_3

    const/4 p0, 0x0

    return-object p0

    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->ceiling(Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method private deleteMe()Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 885
    iget v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    const/4 v1, 0x0

    .line 886
    iput v1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    .line 887
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->pred()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v1

    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->succ()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v2

    # invokes: Lcom/google/common/collect/TreeMultiset;->successor(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V
    invoke-static {v1, v2}, Lcom/google/common/collect/TreeMultiset;->access$1900(Lcom/google/common/collect/TreeMultiset$AvlNode;Lcom/google/common/collect/TreeMultiset$AvlNode;)V

    .line 888
    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 890
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v1, :cond_0

    return-object v2

    :cond_0
    if-nez v2, :cond_1

    return-object v1

    .line 892
    :cond_1
    iget v1, v1, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    iget v2, v2, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    if-lt v1, v2, :cond_2

    .line 893
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->pred()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v1

    .line 895
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {v2, v1}, Lcom/google/common/collect/TreeMultiset$AvlNode;->removeMax(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v2

    iput-object v2, v1, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 896
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    iput-object v2, v1, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 897
    iget v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v1, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 898
    iget-wide v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    int-to-long v4, v0

    sub-long/2addr v2, v4

    iput-wide v2, v1, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 899
    invoke-direct {v1}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 901
    :cond_2
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->succ()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v1

    .line 902
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {v2, v1}, Lcom/google/common/collect/TreeMultiset$AvlNode;->removeMin(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v2

    iput-object v2, v1, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 903
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    iput-object v2, v1, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 904
    iget v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v1, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 905
    iget-wide v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    int-to-long v4, v0

    sub-long/2addr v2, v4

    iput-wide v2, v1, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 906
    invoke-direct {v1}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method private floor(Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "comparator",
            "e"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;TE;)",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 1019
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-lez v0, :cond_0

    .line 1021
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-eqz v0, :cond_1

    invoke-direct {v0, p1, p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->floor(Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p0

    :cond_0
    if-nez v0, :cond_2

    :cond_1
    return-object p0

    .line 1025
    :cond_2
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez p0, :cond_3

    const/4 p0, 0x0

    return-object p0

    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->floor(Ljava/util/Comparator;Ljava/lang/Object;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method private static height(Lcom/google/common/collect/TreeMultiset$AvlNode;)I
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

    .line 1003
    :cond_0
    iget p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    return p0
.end method

.method private pred()Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 636
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->pred:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p0
.end method

.method private rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 949
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->balanceFactor()I

    move-result v0

    const/4 v1, -0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 965
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->recomputeHeight()V

    return-object p0

    .line 959
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 960
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->balanceFactor()I

    move-result v0

    if-gez v0, :cond_1

    .line 961
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rotateLeft()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 963
    :cond_1
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rotateRight()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 952
    :cond_2
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 953
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->balanceFactor()I

    move-result v0

    if-lez v0, :cond_3

    .line 954
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-direct {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rotateRight()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 956
    :cond_3
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rotateLeft()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method private recompute()V
    .registers 1

    .line 944
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->recomputeMultiset()V

    .line 945
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->recomputeHeight()V

    return-void
.end method

.method private recomputeHeight()V
    .registers 3

    .line 940
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-static {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->height(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result v0

    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-static {v1}, Lcom/google/common/collect/TreeMultiset$AvlNode;->height(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    return-void
.end method

.method private recomputeMultiset()V
    .registers 5

    .line 935
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    # invokes: Lcom/google/common/collect/TreeMultiset;->distinctElements(Lcom/google/common/collect/TreeMultiset$AvlNode;)I
    invoke-static {v0}, Lcom/google/common/collect/TreeMultiset;->access$2000(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    # invokes: Lcom/google/common/collect/TreeMultiset;->distinctElements(Lcom/google/common/collect/TreeMultiset$AvlNode;)I
    invoke-static {v1}, Lcom/google/common/collect/TreeMultiset;->access$2000(Lcom/google/common/collect/TreeMultiset$AvlNode;)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 936
    iget v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    int-to-long v0, v0

    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-static {v2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount(Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide v2

    add-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-static {v2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount(Lcom/google/common/collect/TreeMultiset$AvlNode;)J

    move-result-wide v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    return-void
.end method

.method private removeMax(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 6
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
            "TE;>;)",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 924
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v0, :cond_0

    .line 925
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p0

    .line 927
    :cond_0
    invoke-direct {v0, p1}, Lcom/google/common/collect/TreeMultiset$AvlNode;->removeMax(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 928
    iget v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 929
    iget-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    iget p1, p1, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    int-to-long v2, p1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 930
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method private removeMin(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 6
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
            "TE;>;)",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 912
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v0, :cond_0

    .line 913
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p0

    .line 915
    :cond_0
    invoke-direct {v0, p1}, Lcom/google/common/collect/TreeMultiset$AvlNode;->removeMin(Lcom/google/common/collect/TreeMultiset$AvlNode;)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 916
    iget v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 917
    iget-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    iget p1, p1, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    int-to-long v2, p1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 918
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0
.end method

.method private rotateLeft()Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 975
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 976
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 977
    iget-object v1, v0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    iput-object v1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 978
    iput-object p0, v0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 979
    iget-wide v1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    iput-wide v1, v0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 980
    iget v1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    iput v1, v0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 981
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->recompute()V

    .line 982
    invoke-direct {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->recomputeHeight()V

    return-object v0
.end method

.method private rotateRight()Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 987
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 988
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 989
    iget-object v1, v0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    iput-object v1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 990
    iput-object p0, v0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 991
    iget-wide v1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    iput-wide v1, v0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 992
    iget v1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    iput v1, v0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 993
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->recompute()V

    .line 994
    invoke-direct {v0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->recomputeHeight()V

    return-object v0
.end method

.method private succ()Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 640
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->succ:Lcom/google/common/collect/TreeMultiset$AvlNode;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/TreeMultiset$AvlNode;

    return-object p0
.end method

.method private static totalCount(Lcom/google/common/collect/TreeMultiset$AvlNode;)J
    .registers 3
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
            "*>;)J"
        }
    .end annotation

    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 999
    :cond_0
    iget-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    return-wide v0
.end method


# virtual methods
.method add(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 12
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "comparator",
            "e",
            "count",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;TE;I[I)",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 680
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-gez v0, :cond_2

    .line 682
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v0, :cond_0

    .line 684
    aput v2, p4, v2

    .line 685
    invoke-direct {p0, p2, p3}, Lcom/google/common/collect/TreeMultiset$AvlNode;->addLeftChild(Ljava/lang/Object;I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 687
    :cond_0
    iget v3, v0, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    .line 689
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/common/collect/TreeMultiset$AvlNode;->add(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 690
    aget p2, p4, v2

    if-nez p2, :cond_1

    .line 691
    iget p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/2addr p2, v1

    iput p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 693
    :cond_1
    iget-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    int-to-long p2, p3

    add-long/2addr v0, p2

    iput-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 694
    iget p1, p1, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    if-eq p1, v3, :cond_5

    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    :cond_2
    if-lez v0, :cond_7

    .line 696
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v0, :cond_3

    .line 698
    aput v2, p4, v2

    .line 699
    invoke-direct {p0, p2, p3}, Lcom/google/common/collect/TreeMultiset$AvlNode;->addRightChild(Ljava/lang/Object;I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 701
    :cond_3
    iget v3, v0, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    .line 703
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/common/collect/TreeMultiset$AvlNode;->add(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 704
    aget p2, p4, v2

    if-nez p2, :cond_4

    .line 705
    iget p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/2addr p2, v1

    iput p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 707
    :cond_4
    iget-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    int-to-long p2, p3

    add-long/2addr v0, p2

    iput-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 708
    iget p1, p1, Lcom/google/common/collect/TreeMultiset$AvlNode;->height:I

    if-ne p1, v3, :cond_6

    :cond_5
    return-object p0

    :cond_6
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 712
    :cond_7
    iget p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    aput p1, p4, v2

    int-to-long p1, p1

    int-to-long v3, p3

    add-long/2addr p1, v3

    const-wide/32 v5, 0x7fffffff

    cmp-long p1, p1, v5

    if-lez p1, :cond_8

    move v1, v2

    .line 714
    :cond_8
    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 715
    iget p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    .line 716
    iget-wide p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    add-long/2addr p1, v3

    iput-wide p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    return-object p0
.end method

.method count(Ljava/util/Comparator;Ljava/lang/Object;)I
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "comparator",
            "e"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;TE;)I"
        }
    .end annotation

    .line 644
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_1

    .line 646
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez p0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->count(Ljava/util/Comparator;Ljava/lang/Object;)I

    move-result p0

    return p0

    :cond_1
    if-lez v0, :cond_3

    .line 648
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez p0, :cond_2

    return v1

    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/TreeMultiset$AvlNode;->count(Ljava/util/Comparator;Ljava/lang/Object;)I

    move-result p0

    return p0

    .line 650
    :cond_3
    iget p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    return p0
.end method

.method getCount()I
    .registers 1

    .line 1036
    iget p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    return p0
.end method

.method getElement()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 1032
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elem:Ljava/lang/Object;

    invoke-static {p0}, Lcom/google/common/collect/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method remove(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "comparator",
            "e",
            "count",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;TE;I[I)",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 722
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_4

    .line 724
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v0, :cond_0

    .line 726
    aput v1, p4, v1

    return-object p0

    .line 730
    :cond_0
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/common/collect/TreeMultiset$AvlNode;->remove(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 732
    aget p1, p4, v1

    if-lez p1, :cond_2

    if-lt p3, p1, :cond_1

    .line 734
    iget p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 735
    iget-wide p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    int-to-long v0, p1

    sub-long/2addr p2, v0

    iput-wide p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    goto :goto_0

    .line 737
    :cond_1
    iget-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    int-to-long p2, p3

    sub-long/2addr v0, p2

    iput-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    :cond_2
    :goto_0
    if-nez p1, :cond_3

    return-object p0

    .line 740
    :cond_3
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    :cond_4
    if-lez v0, :cond_8

    .line 742
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v0, :cond_5

    .line 744
    aput v1, p4, v1

    return-object p0

    .line 748
    :cond_5
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/common/collect/TreeMultiset$AvlNode;->remove(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 750
    aget p1, p4, v1

    if-lez p1, :cond_7

    if-lt p3, p1, :cond_6

    .line 752
    iget p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 753
    iget-wide p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    int-to-long v0, p1

    sub-long/2addr p2, v0

    iput-wide p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    goto :goto_1

    .line 755
    :cond_6
    iget-wide p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    int-to-long p3, p3

    sub-long/2addr p1, p3

    iput-wide p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 758
    :cond_7
    :goto_1
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 762
    :cond_8
    iget p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    aput p1, p4, v1

    if-lt p3, p1, :cond_9

    .line 764
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->deleteMe()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    :cond_9
    sub-int/2addr p1, p3

    .line 766
    iput p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    .line 767
    iget-wide p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    int-to-long p3, p3

    sub-long/2addr p1, p3

    iput-wide p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    return-object p0
.end method

.method setCount(Ljava/util/Comparator;Ljava/lang/Object;II[I)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 14
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "comparator",
            "e",
            "expectedCount",
            "newCount",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;TE;II[I)",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 827
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_4

    .line 829
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v2, :cond_0

    .line 831
    aput v1, p5, v1

    if-nez p3, :cond_b

    if-lez p4, :cond_b

    .line 833
    invoke-direct {p0, p2, p4}, Lcom/google/common/collect/TreeMultiset$AvlNode;->addLeftChild(Ljava/lang/Object;I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    :cond_0
    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    move-object v7, p5

    .line 838
    invoke-virtual/range {v2 .. v7}, Lcom/google/common/collect/TreeMultiset$AvlNode;->setCount(Ljava/util/Comparator;Ljava/lang/Object;II[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 840
    aget p1, v7, v1

    if-ne p1, v5, :cond_3

    if-nez v6, :cond_1

    if-eqz p1, :cond_1

    .line 842
    iget p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    goto :goto_0

    :cond_1
    if-lez v6, :cond_2

    if-nez p1, :cond_2

    .line 844
    iget p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p2, p2, 0x1

    iput p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 846
    :cond_2
    :goto_0
    iget-wide p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    sub-int p4, v6, p1

    int-to-long p4, p4

    add-long/2addr p2, p4

    iput-wide p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 848
    :cond_3
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    :cond_4
    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    move-object v7, p5

    if-lez v0, :cond_9

    .line 850
    iget-object v2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v2, :cond_5

    .line 852
    aput v1, v7, v1

    if-nez v5, :cond_b

    if-lez v6, :cond_b

    .line 854
    invoke-direct {p0, v4, v6}, Lcom/google/common/collect/TreeMultiset$AvlNode;->addRightChild(Ljava/lang/Object;I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 859
    :cond_5
    invoke-virtual/range {v2 .. v7}, Lcom/google/common/collect/TreeMultiset$AvlNode;->setCount(Ljava/util/Comparator;Ljava/lang/Object;II[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    .line 861
    aget p1, v7, v1

    if-ne p1, v5, :cond_8

    if-nez v6, :cond_6

    if-eqz p1, :cond_6

    .line 863
    iget p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    goto :goto_1

    :cond_6
    if-lez v6, :cond_7

    if-nez p1, :cond_7

    .line 865
    iget p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p2, p2, 0x1

    iput p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 867
    :cond_7
    :goto_1
    iget-wide p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    sub-int p4, v6, p1

    int-to-long p4, p4

    add-long/2addr p2, p4

    iput-wide p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 869
    :cond_8
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 873
    :cond_9
    iget p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    aput p1, v7, v1

    if-ne v5, p1, :cond_b

    if-nez v6, :cond_a

    .line 876
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->deleteMe()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 878
    :cond_a
    iget-wide p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    sub-int p4, v6, p1

    int-to-long p4, p4

    add-long/2addr p2, p4

    iput-wide p2, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 879
    iput v6, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    :cond_b
    return-object p0
.end method

.method setCount(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "comparator",
            "e",
            "count",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TE;>;TE;I[I)",
            "Lcom/google/common/collect/TreeMultiset$AvlNode<",
            "TE;>;"
        }
    .end annotation

    .line 774
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_3

    .line 776
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v0, :cond_0

    .line 778
    aput v1, p4, v1

    if-lez p3, :cond_4

    .line 779
    invoke-direct {p0, p2, p3}, Lcom/google/common/collect/TreeMultiset$AvlNode;->addLeftChild(Ljava/lang/Object;I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 782
    :cond_0
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/common/collect/TreeMultiset$AvlNode;->setCount(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->left:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez p3, :cond_1

    .line 784
    aget p1, p4, v1

    if-eqz p1, :cond_1

    .line 785
    iget p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    goto :goto_0

    :cond_1
    if-lez p3, :cond_2

    .line 786
    aget p1, p4, v1

    if-nez p1, :cond_2

    .line 787
    iget p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 790
    :cond_2
    :goto_0
    iget-wide p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    aget p4, p4, v1

    sub-int/2addr p3, p4

    int-to-long p3, p3

    add-long/2addr p1, p3

    iput-wide p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 791
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    :cond_3
    if-lez v0, :cond_8

    .line 793
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez v0, :cond_5

    .line 795
    aput v1, p4, v1

    if-lez p3, :cond_4

    .line 796
    invoke-direct {p0, p2, p3}, Lcom/google/common/collect/TreeMultiset$AvlNode;->addRightChild(Ljava/lang/Object;I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    :cond_4
    return-object p0

    .line 799
    :cond_5
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/common/collect/TreeMultiset$AvlNode;->setCount(Ljava/util/Comparator;Ljava/lang/Object;I[I)Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->right:Lcom/google/common/collect/TreeMultiset$AvlNode;

    if-nez p3, :cond_6

    .line 801
    aget p1, p4, v1

    if-eqz p1, :cond_6

    .line 802
    iget p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    goto :goto_1

    :cond_6
    if-lez p3, :cond_7

    .line 803
    aget p1, p4, v1

    if-nez p1, :cond_7

    .line 804
    iget p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->distinctElements:I

    .line 807
    :cond_7
    :goto_1
    iget-wide p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    aget p4, p4, v1

    sub-int/2addr p3, p4

    int-to-long p3, p3

    add-long/2addr p1, p3

    iput-wide p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 808
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->rebalance()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 812
    :cond_8
    iget p1, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    aput p1, p4, v1

    if-nez p3, :cond_9

    .line 814
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->deleteMe()Lcom/google/common/collect/TreeMultiset$AvlNode;

    move-result-object p0

    return-object p0

    .line 816
    :cond_9
    iget-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    sub-int p1, p3, p1

    int-to-long p1, p1

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->totalCount:J

    .line 817
    iput p3, p0, Lcom/google/common/collect/TreeMultiset$AvlNode;->elemCount:I

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 1041
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getElement()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultiset$AvlNode;->getCount()I

    move-result p0

    invoke-static {v0, p0}, Lcom/google/common/collect/Multisets;->immutableEntry(Ljava/lang/Object;I)Lcom/google/common/collect/Multiset$Entry;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/Multiset$Entry;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
