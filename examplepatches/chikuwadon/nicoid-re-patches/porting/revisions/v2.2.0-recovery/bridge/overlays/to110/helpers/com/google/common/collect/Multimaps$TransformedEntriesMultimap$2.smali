.class public final synthetic Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/collect/Maps$EntryTransformer;


# instance fields
.field public final synthetic f$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;->f$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

    return-void
.end method


# virtual methods
.method public final transformEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap$2;->f$0:Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;

    check-cast p2, Ljava/util/Collection;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;->transform(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method
