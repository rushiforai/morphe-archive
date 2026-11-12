.class public final Liu4;
.super Ll6e;
.source "SourceFile"


# virtual methods
.method public final a(ILp6l;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    invoke-super {p0, p1, p2, p3}, Ll6e;->a(ILp6l;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_b

    return-object p0

    :cond_b
    sget-object p1, Lcom/opera/android/browser/AutosubmitExtension;->a:Ljava/util/HashMap;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p1

    sget-object p3, Lcom/opera/android/browser/AutosubmitExtension;->a:Ljava/util/HashMap;

    invoke-virtual {p3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1b
    :goto_1b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    cmp-long v1, p1, v1

    if-ltz v1, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_1b

    :cond_39
    const-wide/32 v0, 0x493e0

    add-long/2addr v0, p1

    const/16 p1, 0xc

    new-array p2, p1, [B

    sget-object v2, Lcom/opera/android/browser/AutosubmitExtension;->b:Ljava/util/Random;

    invoke-virtual {v2, p2}, Ljava/util/Random;->nextBytes([B)V

    invoke-static {p1, p2}, Ljaa;->b(I[B)[B

    move-result-object p1

    invoke-static {p1}, Lhik;->a([B)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p3, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "&s="

    invoke-static {p2, p0, p1}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final e()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
