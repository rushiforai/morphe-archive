.class public final synthetic Lcom/google/common/collect/Streams$22;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/util/stream/LongStream;


# direct methods
.method public synthetic constructor <init>(Ljava/util/stream/LongStream;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Streams$22;->f$0:Ljava/util/stream/LongStream;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 1

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/Streams$22;->f$0:Ljava/util/stream/LongStream;

    invoke-interface {p0}, Ljava/util/stream/BaseStream;->close()V

    return-void
.end method
