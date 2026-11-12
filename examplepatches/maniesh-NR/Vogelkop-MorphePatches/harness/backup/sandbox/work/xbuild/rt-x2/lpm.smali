.class public final Llpm;
.super Landroid/text/style/ForegroundColorSpan;
.source "SourceFile"

# interfaces
.implements Lnpm;


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lnpm;

    if-nez v1, :cond_9

    return v0

    :cond_9
    invoke-virtual {p0}, Landroid/text/style/ForegroundColorSpan;->getForegroundColor()I

    move-result p0

    check-cast p1, Llpm;

    invoke-virtual {p1}, Landroid/text/style/ForegroundColorSpan;->getForegroundColor()I

    move-result p1

    if-ne p0, p1, :cond_17

    const/4 p0, 0x1

    return p0

    :cond_17
    return v0
.end method

.method public final hashCode()I
    .registers 1

    invoke-virtual {p0}, Landroid/text/style/ForegroundColorSpan;->getForegroundColor()I

    move-result p0

    return p0
.end method
