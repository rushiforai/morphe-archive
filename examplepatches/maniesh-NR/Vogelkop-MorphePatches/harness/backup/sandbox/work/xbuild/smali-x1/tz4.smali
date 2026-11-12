.class public final Ltz4;
.super Ljw9;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ltz4;->a:B

    iput-object p1, p0, Ltz4;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-byte v0, p0, Ltz4;->a:B

    packed-switch v0, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Ltz4;->b:Ljava/lang/Object;

    check-cast p0, Lkdo;

    const/4 v0, 0x0

    iput-object v0, p0, Lkdo;->l:Lorg/chromium/content/browser/GestureListenerManagerImpl;

    return-void

    :pswitch_data_e
    .packed-switch 0x4
        :pswitch_6
    .end packed-switch
.end method

.method public final b(II)V
    .registers 9

    iget-byte v0, p0, Ltz4;->a:B

    iget-object v1, p0, Ltz4;->b:Ljava/lang/Object;

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_7a

    :pswitch_8
    return-void

    :pswitch_9
    invoke-virtual {p0}, Ltz4;->h()V

    return-void

    :pswitch_d
    check-cast v1, Lg7b;

    iget-byte v0, v1, Lg7b;->e:B

    const/4 v3, 0x2

    if-ne v0, v3, :cond_74

    iput-byte v2, v1, Lg7b;->e:B

    add-int v0, p1, p2

    iget v3, v1, Lg7b;->i:I

    sub-int/2addr v0, v3

    invoke-virtual {p0, p1, p2}, Ltz4;->i(II)V

    const/4 p0, 0x1

    if-lez v0, :cond_23

    move p1, p0

    goto :goto_24

    :cond_23
    move p1, v2

    :goto_24
    iget p2, v1, Lg7b;->h:F

    iget v3, v1, Lg7b;->j:I

    int-to-float v3, v3

    cmpg-float p2, p2, v3

    if-gez p2, :cond_2f

    move p2, p0

    goto :goto_30

    :cond_2f
    move p2, v2

    :goto_30
    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v3

    iget v4, v1, Lg7b;->j:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float/2addr v5, v3

    if-eqz p2, :cond_41

    const v3, 0x3f666666    # 0.9f

    goto :goto_44

    :cond_41
    const v3, 0x3e4ccccd    # 0.2f

    :goto_44
    cmpl-float v3, v5, v3

    if-lez v3, :cond_4a

    move v3, p0

    goto :goto_4b

    :cond_4a
    move v3, v2

    :goto_4b
    xor-int/2addr p1, p0

    if-eqz p2, :cond_60

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result p2

    iget v0, v1, Lg7b;->h:F

    cmpl-float p2, p2, v0

    if-lez p2, :cond_5a

    move p2, p0

    goto :goto_5b

    :cond_5a
    move p2, v2

    :goto_5b
    if-nez v3, :cond_6f

    if-nez p2, :cond_70

    goto :goto_6f

    :cond_60
    int-to-float p2, v0

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float/2addr v4, v0

    cmpg-float p2, p2, v4

    if-gez p2, :cond_6a

    move p2, p0

    goto :goto_6b

    :cond_6a
    move p2, v2

    :goto_6b
    if-nez v3, :cond_6f

    if-eqz p2, :cond_70

    :cond_6f
    :goto_6f
    move v2, p0

    :cond_70
    and-int/2addr p1, v2

    invoke-virtual {v1, p1}, Lg7b;->a(Z)V

    :cond_74
    return-void

    :pswitch_75
    check-cast v1, Luz4;

    iput v2, v1, Luz4;->f:I

    return-void

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_75
        :pswitch_8
        :pswitch_d
        :pswitch_9
    .end packed-switch
.end method

.method public final c(FFII)V
    .registers 8

    iget-byte v0, p0, Ltz4;->a:B

    const/4 v1, 0x2

    iget-object v2, p0, Ltz4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_6e

    :pswitch_8
    return-void

    :pswitch_9
    invoke-virtual {p0}, Ltz4;->h()V

    return-void

    :pswitch_d
    check-cast v2, Lg7b;

    iget-boolean p0, v2, Lg7b;->l:Z

    if-nez p0, :cond_30

    iget-object p0, v2, Lg7b;->f:Landroid/animation/AnimatorSet;

    if-eqz p0, :cond_1a

    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    :cond_1a
    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result p0

    iput p0, v2, Lg7b;->h:F

    iget p1, v2, Lg7b;->j:I

    int-to-float p2, p1

    cmpg-float p0, p0, p2

    if-ltz p0, :cond_2b

    invoke-static {p3, p1}, Ljava/lang/Math;->min(II)I

    move-result p3

    :cond_2b
    add-int/2addr p3, p4

    iput p3, v2, Lg7b;->i:I

    iput-byte v1, v2, Lg7b;->e:B

    :cond_30
    return-void

    :pswitch_31
    check-cast v2, Luz4;

    invoke-virtual {v2}, Luz4;->a()Lhuh;

    move-result-object p0

    invoke-virtual {p0}, Lhuh;->c()I

    move-result p0

    invoke-virtual {v2}, Luz4;->a()Lhuh;

    move-result-object p3

    invoke-virtual {p3}, Lhuh;->b()I

    move-result p3

    const/4 p4, 0x1

    shl-int/2addr p3, p4

    if-le p0, p3, :cond_6c

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpl-float p0, p0, p1

    if-lez p0, :cond_6c

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p0

    iget p1, v2, Luz4;->k:I

    int-to-float p1, p1

    cmpl-float p0, p0, p1

    if-gtz p0, :cond_64

    iget-object p0, v2, Luz4;->a:Lcom/opera/android/widget/ThumbScroller;

    iget p0, p0, Lcom/opera/android/widget/ThumbScroller;->g:I

    if-ne p0, p4, :cond_6c

    :cond_64
    const/4 p0, 0x0

    cmpl-float p0, p2, p0

    if-lez p0, :cond_6a

    move v1, p4

    :cond_6a
    iput v1, v2, Luz4;->f:I

    :cond_6c
    return-void

    nop

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_31
        :pswitch_8
        :pswitch_d
        :pswitch_9
    .end packed-switch
.end method

.method public final d()V
    .registers 6

    iget-byte v0, p0, Ltz4;->a:B

    packed-switch v0, :pswitch_data_82

    return-void

    :pswitch_6
    iget-object p0, p0, Ltz4;->b:Ljava/lang/Object;

    check-cast p0, Lkdo;

    iget-object v0, p0, Lkdo;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lkdo;->c:Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    if-eqz v1, :cond_80

    iget-object v2, p0, Lkdo;->d:Ldu3;

    invoke-virtual {v2}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_80

    iget-object v2, p0, Lkdo;->a:Lru9;

    iget-object v2, v2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "default_zoom.page_menu_hint.shown"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_80

    iget-boolean v2, v0, Lcom/opera/android/settings/SettingsManager;->h:Z

    if-eqz v2, :cond_33

    const/4 v2, 0x1

    goto :goto_37

    :cond_33
    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result v2

    :goto_37
    if-nez v2, :cond_80

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_80

    iget-object v1, p0, Lkdo;->f:Lkwf;

    sget-object v2, Lqwf;->z:Lqwf;

    invoke-virtual {v1, v2}, Lkwf;->t(Lqwf;)Z

    move-result v1

    if-eqz v1, :cond_80

    iget-object v1, p0, Lkdo;->g:Lswf;

    iget-object v1, v1, Lswf;->f:Ljava/util/HashSet;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_80

    invoke-virtual {p0}, Lkdo;->X()V

    const-string v1, "feature_tips_notification"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_80

    iget-object v0, p0, Lkdo;->h:Ldu3;

    invoke-virtual {v0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_80

    iget-object v1, p0, Lkdo;->e:Loz3;

    new-instance v2, Lioc;

    const/4 v3, 0x4

    invoke-direct {v2, v3, v0, p0}, Lioc;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v1, v2, p0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_80
    return-void

    nop

    :pswitch_data_82
    .packed-switch 0x4
        :pswitch_6
    .end packed-switch
.end method

.method public final e(II)V
    .registers 8

    iget-byte v0, p0, Ltz4;->a:B

    packed-switch v0, :pswitch_data_44

    return-void

    :pswitch_6
    invoke-virtual {p0}, Ltz4;->h()V

    return-void

    :pswitch_a
    iget-object v0, p0, Ltz4;->b:Ljava/lang/Object;

    check-cast v0, Lg7b;

    iget-byte v1, v0, Lg7b;->e:B

    const/4 v2, 0x1

    if-ne v1, v2, :cond_43

    const/4 v1, 0x0

    iput-byte v1, v0, Lg7b;->e:B

    add-int v3, p1, p2

    iget v4, v0, Lg7b;->i:I

    sub-int/2addr v3, v4

    invoke-virtual {p0, p1, p2}, Ltz4;->i(II)V

    int-to-float p0, v3

    iget p1, v0, Lg7b;->j:I

    int-to-float p1, p1

    const/high16 p2, 0x3f000000    # 0.5f

    mul-float/2addr p1, p2

    cmpg-float p0, p0, p1

    if-gez p0, :cond_2b

    move p0, v2

    goto :goto_2c

    :cond_2b
    move p0, v1

    :goto_2c
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result p1

    iget v3, v0, Lg7b;->j:I

    int-to-float v3, v3

    mul-float/2addr v3, p2

    cmpg-float p1, p1, v3

    if-gez p1, :cond_3a

    move p1, v2

    goto :goto_3b

    :cond_3a
    move p1, v1

    :goto_3b
    if-nez p0, :cond_40

    if-nez p1, :cond_40

    move v2, v1

    :cond_40
    invoke-virtual {v0, v2}, Lg7b;->a(Z)V

    :cond_43
    return-void

    :pswitch_data_44
    .packed-switch 0x2
        :pswitch_a
        :pswitch_6
    .end packed-switch
.end method

.method public final f(II)V
    .registers 7

    iget-byte v0, p0, Ltz4;->a:B

    iget-object v1, p0, Ltz4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_a2

    :pswitch_7
    return-void

    :pswitch_8
    check-cast v1, Lg7b;

    iget-byte v0, v1, Lg7b;->e:B

    if-eqz v0, :cond_1c

    iget-boolean v0, v1, Lg7b;->l:Z

    if-nez v0, :cond_1c

    iget-object v0, v1, Lg7b;->f:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_19

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    :cond_19
    invoke-virtual {p0, p1, p2}, Ltz4;->i(II)V

    :cond_1c
    return-void

    :pswitch_1d
    check-cast v1, Luz4;

    invoke-virtual {v1}, Luz4;->a()Lhuh;

    move-result-object p0

    invoke-virtual {p0}, Lhuh;->c()I

    move-result p0

    invoke-virtual {v1}, Luz4;->a()Lhuh;

    move-result-object p1

    invoke-virtual {p1}, Lhuh;->b()I

    move-result p1

    shl-int/lit8 p1, p1, 0x1

    if-le p0, p1, :cond_a1

    iget p0, v1, Luz4;->f:I

    if-eqz p0, :cond_a1

    if-eqz p0, :cond_a1

    iget-object p1, v1, Luz4;->a:Lcom/opera/android/widget/ThumbScroller;

    iget p2, p1, Lcom/opera/android/widget/ThumbScroller;->g:I

    const/4 v0, 0x3

    if-eq p2, v0, :cond_a1

    const/4 p2, 0x0

    iput-boolean p2, p1, Lcom/opera/android/widget/ThumbScroller;->o:Z

    iget p2, p1, Lcom/opera/android/widget/ThumbScroller;->h:I

    if-eq p2, p0, :cond_63

    iput p0, p1, Lcom/opera/android/widget/ThumbScroller;->h:I

    iget-object p2, p1, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    const/4 v0, 0x2

    if-ne p0, v0, :cond_52

    const p0, 0x7f080703

    goto :goto_55

    :cond_52
    const p0, 0x7f080704

    :goto_55
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object p0, p1, Lcom/opera/android/widget/ThumbScroller;->f:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    check-cast p0, Landroid/graphics/drawable/Animatable;

    invoke-interface {p0}, Landroid/graphics/drawable/Animatable;->start()V

    :cond_63
    iget-object p0, p1, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Lcom/opera/android/widget/ThumbScroller;->b()I

    move-result p2

    iget-object v0, p1, Lcom/opera/android/widget/ThumbScroller;->i:Lzy9;

    iget-object v0, v0, Lzy9;->a:Ljava/lang/Object;

    check-cast v0, Luz4;

    iget v1, v0, Luz4;->h:I

    iget v2, v0, Luz4;->i:I

    iget v0, v0, Luz4;->j:I

    int-to-float v2, v2

    int-to-float v0, v0

    div-float/2addr v2, v0

    const/4 v0, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v2, v0, v3}, Lcs5;->s(FFF)F

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    sub-int/2addr v2, p2

    sub-int/2addr v2, v1

    iget-object v1, p1, Lcom/opera/android/widget/ThumbScroller;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    sub-int/2addr v2, v1

    int-to-float v1, v2

    mul-float/2addr v0, v1

    float-to-int v0, v0

    add-int/2addr p2, v0

    int-to-float p2, p2

    invoke-virtual {p0, p2}, Landroid/view/View;->setTranslationY(F)V

    invoke-virtual {p1}, Lcom/opera/android/widget/ThumbScroller;->e()V

    :cond_a1
    return-void

    :pswitch_data_a2
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public final g(II)V
    .registers 7

    iget-byte v0, p0, Ltz4;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Ltz4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_38

    return-void

    :pswitch_9
    invoke-virtual {p0}, Ltz4;->h()V

    return-void

    :pswitch_d
    check-cast v2, Lg7b;

    iget-boolean p0, v2, Lg7b;->l:Z

    if-nez p0, :cond_30

    iget-object p0, v2, Lg7b;->f:Landroid/animation/AnimatorSet;

    if-eqz p0, :cond_1a

    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    :cond_1a
    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result p0

    iput p0, v2, Lg7b;->h:F

    iget v0, v2, Lg7b;->j:I

    int-to-float v3, v0

    cmpg-float p0, p0, v3

    if-ltz p0, :cond_2b

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    :cond_2b
    add-int/2addr p1, p2

    iput p1, v2, Lg7b;->i:I

    iput-byte v1, v2, Lg7b;->e:B

    :cond_30
    return-void

    :pswitch_31
    check-cast v2, Leyi;

    invoke-virtual {v2, v1}, Leyi;->a(Z)V

    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x1
        :pswitch_31
        :pswitch_d
        :pswitch_9
    .end packed-switch
.end method

.method public final h()V
    .registers 3

    iget-object p0, p0, Ltz4;->b:Ljava/lang/Object;

    check-cast p0, Lqt6;

    invoke-virtual {p0}, Lqt6;->k()Z

    move-result v0

    iget-object v1, p0, Lqt6;->c:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    iget-boolean v1, v1, Lorg/chromium/content/browser/GestureListenerManagerImpl;->k:Z

    iput-boolean v1, p0, Lqt6;->a:Z

    invoke-virtual {p0}, Lqt6;->k()Z

    move-result v1

    if-eq v0, v1, :cond_23

    iget-object v0, p0, Lqt6;->e:Ljava/lang/Object;

    check-cast v0, Lzy4;

    invoke-virtual {p0}, Lqt6;->k()Z

    move-result p0

    iput-boolean p0, v0, Lzy4;->k:Z

    invoke-virtual {v0}, Lzy4;->T()V

    :cond_23
    return-void
.end method

.method public final i(II)V
    .registers 4

    iget-object p0, p0, Ltz4;->b:Ljava/lang/Object;

    check-cast p0, Lg7b;

    iget v0, p0, Lg7b;->h:F

    add-int/2addr p1, p2

    iget p2, p0, Lg7b;->i:I

    sub-int/2addr p1, p2

    int-to-float p1, p1

    add-float/2addr v0, p1

    iget p1, p0, Lg7b;->j:I

    int-to-float p1, p1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    const/4 p2, 0x0

    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    return-void
.end method
