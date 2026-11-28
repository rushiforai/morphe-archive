.class public final synthetic Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Function;


# instance fields
.field public final synthetic f$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;Ljava/lang/Object;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$1;->f$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

    iput-object p2, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$1;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$1;->f$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

    iget-object p0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$1;->f$1:Ljava/lang/Object;

    invoke-virtual {v0, p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->lambda$transform$0$com-google-common-collect-Multimaps$TransformedEntriesMultimap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
