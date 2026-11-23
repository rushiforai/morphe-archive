.class public LX/iЭکثрجأт业юцجЗأ丹丩么ωظΣЙ久Ю丆;
.super Ljava/lang/Object;

.method public static a(Landroid/content/Context;)Z
    .locals 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v0
    const-wide v2, 0x3bb2cc3d7ffL
    cmp-long v0, v0, v2
    if-gtz v0, :expired
    const/4 v0, 0x1
    return v0
    :expired
    const/4 v0, 0x0
    return v0
.end method
