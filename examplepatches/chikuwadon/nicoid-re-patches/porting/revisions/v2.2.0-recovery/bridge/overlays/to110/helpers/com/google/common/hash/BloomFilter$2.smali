.class public final synthetic Lcom/google/common/hash/BloomFilter$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 0
    check-cast p1, Lcom/google/common/hash/BloomFilter;

    invoke-virtual {p1, p2}, Lcom/google/common/hash/BloomFilter;->put(Ljava/lang/Object;)Z

    return-void
.end method
