.class public final synthetic Lcom/google/common/collect/Synchronized$SynchronizedTable$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Function;


# instance fields
.field public final synthetic f$0:Lcom/google/common/collect/Synchronized$SynchronizedTable;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/collect/Synchronized$SynchronizedTable;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Synchronized$SynchronizedTable$1;->f$0:Lcom/google/common/collect/Synchronized$SynchronizedTable;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/Synchronized$SynchronizedTable$1;->f$0:Lcom/google/common/collect/Synchronized$SynchronizedTable;

    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/Synchronized$SynchronizedTable;->lambda$columnMap$0$com-google-common-collect-Synchronized$SynchronizedTable(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method
