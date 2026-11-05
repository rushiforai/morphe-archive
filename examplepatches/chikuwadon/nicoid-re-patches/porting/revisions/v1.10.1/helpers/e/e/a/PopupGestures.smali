.class public final Le/e/a/PopupGestures;
.super Ljava/lang/Object;
.source "PopupGestures.java"


# static fields
.field public static final KEY:Ljava/lang/String; = "popup_double_tap_seek"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Ljava/lang/Object;Landroid/view/View;)V
    .registers 8

    .line 7
    check-cast p0, Landroid/app/Service;

    invoke-static {p0}, Le/e/a/PopupGestures;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_9d

    const-string v0, "popup-close"

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_12

    goto/16 :goto_9d

    :cond_12
    invoke-virtual {p0}, Landroid/app/Service;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "topmenulay"

    invoke-virtual {p0}, Landroid/app/Service;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "id"

    invoke-virtual {v1, v2, v4, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/RelativeLayout;

    if-nez v2, :cond_2b

    return-void

    :cond_2b
    new-instance v2, Landroid/view/View;

    invoke-direct {v2, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const-string v3, "close"

    invoke-static {v2, v3}, Le/e/a/PlayerIcons;->symbol(Landroid/view/View;Ljava/lang/String;)V

    const-string v3, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f\u3092\u7d42\u4e86"

    invoke-virtual {v2, v3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/view/View;->setId(I)V

    new-instance v0, Le/e/a/PopupGestures$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Le/e/a/PopupGestures$$ExternalSyntheticLambda0;-><init>(Landroid/app/Service;)V

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v3, 0x2c

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v0, v5, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v3, 0xb

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v5, 0xa

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    check-cast v1, Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Landroid/app/Service;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "fullscbutton"

    invoke-virtual {p0}, Landroid/app/Service;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, v4, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_9a

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v0, :cond_9a

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    const/4 v1, 0x0

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_9a
    invoke-static {p1}, Le/e/a/PopupOverlay;->attach(Landroid/view/View;)V

    :cond_9d
    :goto_9d
    return-void
.end method

.method public static doubleTap(Ljava/lang/Object;Landroid/view/MotionEvent;)Z
    .registers 14

    .line 6
    move-object v0, p0

    check-cast v0, Landroid/app/Service;

    invoke-static {v0}, Le/e/a/PopupGestures;->enabled(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_b

    return v2

    :cond_b
    const/4 v1, 0x1

    :try_start_c
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-eq v3, v1, :cond_13

    return v1

    :cond_13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "e"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of v3, p0, Landroid/view/View;

    if-nez v3, :cond_26

    return v1

    :cond_26
    move-object v3, p0

    check-cast v3, Landroid/view/View;

    const/4 v4, 0x2

    new-array v4, v4, [I

    invoke-virtual {v3, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    aget v6, v4, v1

    int-to-float v6, v6

    cmpg-float v5, v5, v6

    if-ltz v5, :cond_f3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    aget v6, v4, v1

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v7

    add-int/2addr v6, v7

    int-to-float v6, v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_4c

    goto/16 :goto_f3

    :cond_4c
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    aget v4, v4, v2

    int-to-float v4, v4

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    add-float/2addr v4, v3

    cmpg-float p1, p1, v4

    if-gez p1, :cond_62

    const/4 p1, -0x1

    goto :goto_63

    :cond_62
    const/4 p1, 0x1

    :goto_63
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "double_tap_seek_seconds"

    const-string v5, "10"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    if-gtz v9, :cond_76

    return v1

    :cond_76
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getCurrentPosition"

    new-array v5, v2, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "getDuration"

    new-array v7, v2, [Ljava/lang/Class;

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v6, v2, [Ljava/lang/Object;

    invoke-virtual {v5, p0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v10, v5, v7

    if-lez v10, :cond_fc

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "seekTo"

    new-array v10, v1, [Ljava/lang/Class;

    sget-object v11, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v11, v10, v2

    invoke-virtual {v7, v8, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    new-array v11, v1, [Ljava/lang/Object;

    move v7, p1

    move v8, v9

    invoke-static/range {v3 .. v8}, Le/e/a/SeekFeedback219;->target(JJII)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v11, v2

    invoke-virtual {v10, p0, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Ljava/lang/StringBuilder;

    if-lez p1, :cond_d4

    const-string p1, "+"

    goto :goto_d6

    :cond_d4
    const-string p1, "\u2212"

    :goto_d6
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " s"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0, v2}, Le/e/a/SeekFeedback219;->toast(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_f2
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_f2} :catch_f4

    goto :goto_fc

    :cond_f3
    :goto_f3
    return v1

    :catch_f4
    move-exception p0

    const-string p1, "nicoid-popup"

    const-string v0, "Cannot seek popup"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_fc
    :goto_fc
    return v1
.end method

.method static enabled(Landroid/content/Context;)Z
    .registers 3

    .line 5
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "popup_double_tap_seek"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$0(Landroid/app/Service;Landroid/view/View;)V
    .registers 2

    .line 7
    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return-void
.end method
