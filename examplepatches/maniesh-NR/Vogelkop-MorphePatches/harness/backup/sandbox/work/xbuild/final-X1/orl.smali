.class public final synthetic Lorl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lykj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/mainmenu/ToggleAnimationView;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/mainmenu/ToggleAnimationView;B)V
    .registers 3

    iput-byte p2, p0, Lorl;->a:B

    iput-object p1, p0, Lorl;->b:Lcom/opera/android/mainmenu/ToggleAnimationView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final k(Lg3d;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lorl;->a:B

    const/4 v1, 0x0

    const/16 v2, 0x64

    iget-object p0, p0, Lorl;->b:Lcom/opera/android/mainmenu/ToggleAnimationView;

    packed-switch v0, :pswitch_data_94

    iget-boolean p1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->y:Z

    if-eqz p1, :cond_13

    iget-boolean p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->z:Z

    if-nez p0, :cond_13

    move v1, v2

    :cond_13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_18
    iget-boolean p1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->y:Z

    if-eqz p1, :cond_21

    iget-boolean p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->z:Z

    if-eqz p0, :cond_21

    move v1, v2

    :cond_21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_26
    iget-boolean p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->y:Z

    if-nez p0, :cond_2b

    move v1, v2

    :cond_2b
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_30
    iget-boolean p1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->y:Z

    if-eqz p1, :cond_37

    iget p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->E:I

    goto :goto_39

    :cond_37
    iget p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->D:I

    :goto_39
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_3e
    iget-boolean p1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->J:Z

    if-eqz p1, :cond_45

    iget p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->H:I

    goto :goto_47

    :cond_45
    iget p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->F:I

    :goto_47
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_4c
    iget-boolean p1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->J:Z

    if-eqz p1, :cond_53

    iget p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->I:I

    goto :goto_55

    :cond_53
    iget p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->G:I

    :goto_55
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_5a
    sget-object v0, Lcom/opera/android/mainmenu/ToggleAnimationView;->L:Ljava/util/List;

    iget-object v0, p1, Lg3d;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Lcom/opera/android/mainmenu/ToggleAnimationView;->B(Ljava/lang/Integer;)I

    move-result v0

    iget-object v1, p1, Lg3d;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {p0, v1}, Lcom/opera/android/mainmenu/ToggleAnimationView;->B(Ljava/lang/Integer;)I

    move-result p0

    iget p1, p1, Lg3d;->f:F

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {p1, v1, v2}, Ldjh;->b(FFF)F

    move-result p1

    invoke-static {p1, v0, p0}, Lp37;->R(FII)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_7e
    sget-object p1, Lcom/opera/android/mainmenu/ToggleAnimationView;->L:Ljava/util/List;

    new-instance p1, Landroid/graphics/PointF;

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    int-to-float p0, p0

    div-float/2addr p0, v1

    invoke-direct {p1, v0, p0}, Landroid/graphics/PointF;-><init>(FF)V

    return-object p1

    :pswitch_data_94
    .packed-switch 0x0
        :pswitch_7e
        :pswitch_5a
        :pswitch_4c
        :pswitch_3e
        :pswitch_30
        :pswitch_26
        :pswitch_18
    .end packed-switch
.end method
