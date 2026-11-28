.class final Lcom/google/common/collect/TreeMultiset$Reference;
.super Ljava/lang/Object;
.source "TreeMultiset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/TreeMultiset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Reference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 562
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/TreeMultiset$1;)V
    .registers 2

    .line 562
    invoke-direct {p0}, Lcom/google/common/collect/TreeMultiset$Reference;-><init>()V

    return-void
.end method


# virtual methods
.method checkAndSet(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "expected",
            "newValue"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 570
    iget-object v0, p0, Lcom/google/common/collect/TreeMultiset$Reference;->value:Ljava/lang/Object;

    if-ne v0, p1, :cond_0

    .line 573
    iput-object p2, p0, Lcom/google/common/collect/TreeMultiset$Reference;->value:Ljava/lang/Object;

    return-void

    .line 571
    :cond_0
    new-instance p0, Ljava/util/ConcurrentModificationException;

    invoke-direct {p0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw p0
.end method

.method clear()V
    .registers 2

    const/4 v0, 0x0

    .line 577
    iput-object v0, p0, Lcom/google/common/collect/TreeMultiset$Reference;->value:Ljava/lang/Object;

    return-void
.end method

.method get()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 566
    iget-object p0, p0, Lcom/google/common/collect/TreeMultiset$Reference;->value:Ljava/lang/Object;

    return-object p0
.end method
