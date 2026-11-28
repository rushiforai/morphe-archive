.class public final synthetic Lcom/google/common/collect/Streams$7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:[Ljava/util/stream/DoubleStream;


# direct methods
.method public synthetic constructor <init>([Ljava/util/stream/DoubleStream;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/Streams$7;->f$0:[Ljava/util/stream/DoubleStream;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 1

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/Streams$7;->f$0:[Ljava/util/stream/DoubleStream;

    invoke-static {p0}, Lcom/google/common/collect/Streams;->lambda$concat$7([Ljava/util/stream/DoubleStream;)V

    return-void
.end method
