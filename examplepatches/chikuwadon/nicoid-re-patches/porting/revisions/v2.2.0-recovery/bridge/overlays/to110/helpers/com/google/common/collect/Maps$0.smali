.class public final synthetic Lcom/google/common/collect/Maps$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Function;


# instance fields
.field public final synthetic f$0:Lcom/google/common/collect/Maps$EntryTransformer;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/collect/Maps$EntryTransformer;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Maps$0;->f$0:Lcom/google/common/collect/Maps$EntryTransformer;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/Maps$0;->f$0:Lcom/google/common/collect/Maps$EntryTransformer;

    check-cast p1, Ljava/util/Map$Entry;

    invoke-static {p0, p1}, Lcom/google/common/collect/Maps;->lambda$asEntryToEntryFunction$0(Lcom/google/common/collect/Maps$EntryTransformer;Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method
