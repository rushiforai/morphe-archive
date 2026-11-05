.class public final Le/e/a/ShortLike119;
.super Ljava/lang/Object;
.source "ShortLike119.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bridge(Landroid/widget/Button;)Z
    .registers 5

    .line 3
    const/4 v0, 0x0

    if-eqz p0, :cond_34

    const-string v1, "nicoid_like"

    invoke-virtual {p0}, Landroid/widget/Button;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    goto :goto_34

    :cond_10
    invoke-virtual {p0}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    :goto_14
    instance-of v2, v1, Landroid/view/View;

    if-nez v2, :cond_19

    return v0

    :cond_19
    move-object v2, v1

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    const-string v3, "nicoid_short_metadata"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2f

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setVisibility(I)V

    const/4 p0, 0x1

    return p0

    :cond_2f
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    goto :goto_14

    :cond_34
    :goto_34
    return v0
.end method
