.class public final synthetic Lcom/google/common/collect/Multimaps$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/collect/Maps$EntryTransformer;


# instance fields
.field public final synthetic f$0:Lcom/google/common/base/Function;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/base/Function;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Multimaps$0;->f$0:Lcom/google/common/base/Function;

    return-void
.end method


# virtual methods
.method public final transformEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/Multimaps$0;->f$0:Lcom/google/common/base/Function;

    invoke-static {p0, p1, p2}, Lcom/google/common/collect/Multimaps;->lambda$transformValues$1(Lcom/google/common/base/Function;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
