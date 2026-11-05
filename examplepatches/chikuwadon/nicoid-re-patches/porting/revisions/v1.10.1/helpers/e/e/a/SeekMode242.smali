.class public final Le/e/a/SeekMode242;
.super Ljava/lang/Object;
.source "SeekMode242.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static delta(Ljava/lang/Object;)F
    .registers 2

    .line 5
    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p0, v0, :cond_12

    const/high16 p0, 0x41c00000    # 24.0f

    goto :goto_14

    :cond_12
    const/high16 p0, 0x41a00000    # 20.0f

    :goto_14
    return p0
.end method

.method public static main(Ljava/lang/Object;)F
    .registers 2

    .line 4
    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p0, v0, :cond_12

    const/high16 p0, 0x42000000    # 32.0f

    goto :goto_14

    :cond_12
    const/high16 p0, 0x41e00000    # 28.0f

    :goto_14
    return p0
.end method

.method public static normal(Landroid/view/View;)Z
    .registers 5

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_6
    if-eqz p0, :cond_32

    const/16 v2, 0x10

    if-lt v1, v2, :cond_d

    goto :goto_32

    .line 8
    :cond_d
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.sauzask.nicoid.NicoidVideoActivity"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    const/4 p0, 0x1

    return p0

    .line 9
    :cond_1f
    instance-of v2, p0, Landroid/content/ContextWrapper;

    if-nez v2, :cond_24

    :goto_23
    goto :goto_32

    :cond_24
    move-object v2, p0

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    if-ne v2, p0, :cond_2e

    goto :goto_23

    .line 7
    :cond_2e
    add-int/lit8 v1, v1, 0x1

    move-object p0, v2

    goto :goto_6

    .line 10
    :cond_32
    :goto_32
    return v0
.end method
