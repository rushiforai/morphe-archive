# Same class, but the anchored method is gone — the patcher must refuse, not guess.
.class public final Lcom/example/quota/QuotaPolicy;
.super Ljava/lang/Object;

.field public static final SOFT_LIMIT:I = 0x3e8

.method public final otherMethod(ZIJ)Lcom/example/quota/QuotaState;
    .locals 0

    sget-object p0, Lcom/example/quota/QuotaState$None;->INSTANCE:Lcom/example/quota/QuotaState$None;

    return-object p0
.end method
