.class public final Le8g;
.super Lyrf;
.source "SourceFile"


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 7

    invoke-super {p0, p1}, Lyrf;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/4 v1, 0x5

    invoke-static {p1, v1}, Lc8g;->a(Landroid/content/res/Resources;I)Lc8g;

    move-result-object v1

    invoke-virtual {p0, v1}, Lyrf;->d(Llrf;)V

    const/16 v1, 0x1e

    invoke-static {p1, v1}, Lc8g;->a(Landroid/content/res/Resources;I)Lc8g;

    move-result-object v1

    invoke-virtual {p0, v1}, Lyrf;->d(Llrf;)V

    new-instance v1, Lc8g;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const v4, 0x7f120030

    invoke-virtual {p1, v4, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f1413a8

    invoke-virtual {p1, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-wide/32 v2, 0x36ee80

    invoke-direct {v1, v2, v3, p1}, Lc8g;-><init>(JLjava/lang/String;)V

    invoke-virtual {p0, v1}, Lyrf;->d(Llrf;)V

    return-object v0
.end method

.method public final e(Llrf;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method
