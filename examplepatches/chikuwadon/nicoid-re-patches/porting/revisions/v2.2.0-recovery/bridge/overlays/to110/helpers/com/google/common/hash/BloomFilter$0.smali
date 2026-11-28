.class public final synthetic Lcom/google/common/hash/BloomFilter$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic f$0:Lcom/google/common/hash/Funnel;

.field public final synthetic f$1:J

.field public final synthetic f$2:D


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/hash/Funnel;JD)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/hash/BloomFilter$0;->f$0:Lcom/google/common/hash/Funnel;

    iput-wide p2, p0, Lcom/google/common/hash/BloomFilter$0;->f$1:J

    iput-wide p4, p0, Lcom/google/common/hash/BloomFilter$0;->f$2:D

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 6

    .line 0
    iget-object v0, p0, Lcom/google/common/hash/BloomFilter$0;->f$0:Lcom/google/common/hash/Funnel;

    iget-wide v1, p0, Lcom/google/common/hash/BloomFilter$0;->f$1:J

    iget-wide v3, p0, Lcom/google/common/hash/BloomFilter$0;->f$2:D

    invoke-static {v0, v1, v2, v3, v4}, Lcom/google/common/hash/BloomFilter;->lambda$toBloomFilter$0(Lcom/google/common/hash/Funnel;JD)Lcom/google/common/hash/BloomFilter;

    move-result-object p0

    return-object p0
.end method
