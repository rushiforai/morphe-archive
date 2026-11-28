.class final Lcom/google/common/collect/Range$RangeLexOrdering;
.super Lcom/google/common/collect/Ordering;
.source "Range.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Range;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RangeLexOrdering"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Ordering<",
        "Lcom/google/common/collect/Range<",
        "*>;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field static final INSTANCE:Lcom/google/common/collect/Ordering;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Ordering<",
            "*>;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 707
    new-instance v0, Lcom/google/common/collect/Range$RangeLexOrdering;

    invoke-direct {v0}, Lcom/google/common/collect/Range$RangeLexOrdering;-><init>()V

    sput-object v0, Lcom/google/common/collect/Range$RangeLexOrdering;->INSTANCE:Lcom/google/common/collect/Ordering;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 706
    invoke-direct {p0}, Lcom/google/common/collect/Ordering;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/google/common/collect/Range;Lcom/google/common/collect/Range;)I
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "left",
            "right"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Range<",
            "*>;",
            "Lcom/google/common/collect/Range<",
            "*>;)I"
        }
    .end annotation

    .line 711
    invoke-static {}, Lcom/google/common/collect/ComparisonChain;->start()Lcom/google/common/collect/ComparisonChain;

    move-result-object p0

    iget-object v0, p1, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    iget-object v1, p2, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    .line 712
    invoke-virtual {p0, v0, v1}, Lcom/google/common/collect/ComparisonChain;->compare(Ljava/lang/Comparable;Ljava/lang/Comparable;)Lcom/google/common/collect/ComparisonChain;

    move-result-object p0

    iget-object p1, p1, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    iget-object p2, p2, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    .line 713
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ComparisonChain;->compare(Ljava/lang/Comparable;Ljava/lang/Comparable;)Lcom/google/common/collect/ComparisonChain;

    move-result-object p0

    .line 714
    invoke-virtual {p0}, Lcom/google/common/collect/ComparisonChain;->result()I

    move-result p0

    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "left",
            "right"
        }
    .end annotation

    .line 706
    check-cast p1, Lcom/google/common/collect/Range;

    check-cast p2, Lcom/google/common/collect/Range;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/Range$RangeLexOrdering;->compare(Lcom/google/common/collect/Range;Lcom/google/common/collect/Range;)I

    move-result p0

    return p0
.end method
