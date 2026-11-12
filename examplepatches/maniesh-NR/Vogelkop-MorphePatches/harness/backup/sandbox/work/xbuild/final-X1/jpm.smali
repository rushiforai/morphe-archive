.class public final Ljpm;
.super Landroid/text/style/StyleSpan;
.source "SourceFile"

# interfaces
.implements Lnpm;


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 2

    if-eqz p1, :cond_10

    const-class p0, Ljpm;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    const-class p0, Ljpm;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method
