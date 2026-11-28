.class public final synthetic Lcom/google/common/collect/Multisets$FilteredMultiset$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Predicate;


# instance fields
.field public final synthetic f$0:Lcom/google/common/collect/Multisets$FilteredMultiset;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/collect/Multisets$FilteredMultiset;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Multisets$FilteredMultiset$0;->f$0:Lcom/google/common/collect/Multisets$FilteredMultiset;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset$0;->f$0:Lcom/google/common/collect/Multisets$FilteredMultiset;

    check-cast p1, Lcom/google/common/collect/Multiset$Entry;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multisets$FilteredMultiset;->lambda$entrySet$0$com-google-common-collect-Multisets$FilteredMultiset(Lcom/google/common/collect/Multiset$Entry;)Z

    move-result p0

    return p0
.end method
