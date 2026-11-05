.class public final Le/e/a/PopupCenter242;
.super Ljava/lang/Object;
.source "PopupCenter242.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 4

    .line 23
    nop

    .line 24
    :goto_1
    const/4 v0, 0x0

    if-nez p0, :cond_5

    .line 25
    return-object v0

    .line 24
    :cond_5
    invoke-static {p0, p1}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_c

    return-object v1

    :cond_c
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_1b

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_1

    :cond_1b
    move-object p0, v0

    goto :goto_1
.end method

.method public static inherit(Landroid/view/View;Landroid/view/View;)V
    .registers 9

    .line 6
    if-eqz p0, :cond_a0

    if-nez p1, :cond_6

    goto/16 :goto_a0

    .line 7
    :cond_6
    nop

    .line 8
    move-object v0, p0

    :goto_8
    const/4 v1, 0x0

    if-nez v0, :cond_c

    :goto_b
    goto :goto_26

    :cond_c
    move-object v2, p1

    :goto_d
    if-eqz v2, :cond_23

    if-ne v2, v0, :cond_12

    goto :goto_23

    :cond_12
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/View;

    if-eqz v3, :cond_21

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    goto :goto_d

    :cond_21
    move-object v2, v1

    goto :goto_d

    :cond_23
    :goto_23
    if-eqz v2, :cond_8d

    goto :goto_b

    .line 9
    :goto_26
    if-nez v0, :cond_29

    return-void

    .line 10
    :cond_29
    nop

    .line 11
    nop

    .line 12
    const/high16 v2, 0x3f800000    # 1.0f

    move-object v3, v1

    :goto_2e
    if-eqz p0, :cond_6e

    if-ne p0, v0, :cond_33

    goto :goto_6e

    .line 13
    :cond_33
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-eqz v4, :cond_3c

    const/4 p0, 0x4

    const/4 v2, 0x0

    goto :goto_6f

    .line 14
    :cond_3c
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v4

    mul-float/2addr v2, v4

    invoke-virtual {p0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v4

    .line 15
    if-eqz v4, :cond_5d

    if-nez v3, :cond_4e

    new-instance v3, Landroid/view/animation/Transformation;

    invoke-direct {v3}, Landroid/view/animation/Transformation;-><init>()V

    :cond_4e
    invoke-virtual {v3}, Landroid/view/animation/Transformation;->clear()V

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6, v3}, Landroid/view/animation/Animation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    invoke-virtual {v3}, Landroid/view/animation/Transformation;->getAlpha()F

    move-result v4

    mul-float/2addr v2, v4

    .line 16
    :cond_5d
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/view/View;

    if-eqz v4, :cond_6c

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    goto :goto_2e

    :cond_6c
    move-object p0, v1

    goto :goto_2e

    .line 18
    :cond_6e
    :goto_6e
    const/4 p0, 0x0

    :goto_6f
    invoke-virtual {p1}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    if-eqz v0, :cond_78

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 19
    :cond_78
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eq v0, p0, :cond_81

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 20
    :cond_81
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result p0

    cmpl-float p0, p0, v2

    if-eqz p0, :cond_8c

    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 21
    :cond_8c
    return-void

    .line 8
    :cond_8d
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/View;

    if-eqz v2, :cond_9d

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto/16 :goto_8

    :cond_9d
    move-object v0, v1

    goto/16 :goto_8

    .line 6
    :cond_a0
    :goto_a0
    return-void
.end method
