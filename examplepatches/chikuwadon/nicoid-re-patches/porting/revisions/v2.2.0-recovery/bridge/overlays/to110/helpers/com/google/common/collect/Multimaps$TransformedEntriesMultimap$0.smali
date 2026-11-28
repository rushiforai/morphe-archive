.class public final synthetic Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Function;


# instance fields
.field public final synthetic f$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$0;->f$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$0;->f$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

    check-cast p1, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->lambda$values$0$com-google-common-collect-Multimaps$TransformedEntriesMultimap(Ljava/util/Map$Entry;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
