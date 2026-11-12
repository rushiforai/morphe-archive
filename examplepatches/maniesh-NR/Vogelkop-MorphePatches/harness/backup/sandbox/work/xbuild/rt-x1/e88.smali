.class public final Le88;
.super Lny0;
.source "SourceFile"


# virtual methods
.method public final b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;
    .registers 6

    const-string v0, "payment_ref"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_10

    invoke-static {v0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_11

    :cond_10
    const/4 v0, 0x0

    :cond_11
    if-eqz v0, :cond_18

    invoke-super {p0, p1, p2, p3}, Lny0;->b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_18
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0
.end method

.method public final d(Ll1b;)Ls88;
    .registers 2

    const-string p0, "payment_ref"

    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_10

    invoke-static {p0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_11

    :cond_10
    const/4 p0, 0x0

    :cond_11
    if-eqz p0, :cond_19

    new-instance p1, Ll88;

    invoke-direct {p1, p0}, Ll88;-><init>(Ljava/lang/String;)V

    return-object p1

    :cond_19
    new-instance p0, Leva;

    const-string p1, "payment_ref missing"

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p0
.end method
