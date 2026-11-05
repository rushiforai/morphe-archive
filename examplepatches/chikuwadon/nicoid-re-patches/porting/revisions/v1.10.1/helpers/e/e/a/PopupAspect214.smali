.class public final Le/e/a/PopupAspect214;
.super Ljava/lang/Object;
.source "PopupAspect214.java"


# static fields
.field private static final RATIOS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PopupAspect214;->RATIOS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static changed(Ljava/lang/Object;)V
    .registers 5

    .line 8
    invoke-static {p0}, Le/e/a/DirectBackground235;->owns(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    :try_start_7
    const-string v0, "a"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    new-instance v1, Le/e/a/PopupAspect214$1;

    invoke-direct {v1, p0}, Le/e/a/PopupAspect214$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    new-instance v1, Le/e/a/PopupAspect214$2;

    invoke-direct {v1, p0}, Le/e/a/PopupAspect214$2;-><init>(Ljava/lang/Object;)V

    const-wide/16 v2, 0x78

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    new-instance v1, Le/e/a/PopupAspect214$3;

    invoke-direct {v1, p0}, Le/e/a/PopupAspect214$3;-><init>(Ljava/lang/Object;)V

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_2b} :catch_2c

    goto :goto_2d

    :catch_2c
    move-exception p0

    :goto_2d
    return-void
.end method

.method public static height(Ljava/lang/Object;I)I
    .registers 2

    .line 7
    int-to-float p1, p1

    invoke-static {p0}, Le/e/a/PopupAspect214;->ratio(Ljava/lang/Object;)F

    move-result p0

    div-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    const/4 p1, 0x1

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public static ratio(Ljava/lang/Object;)F
    .registers 3

    .line 6
    :try_start_0
    const-string v0, "i"

    invoke-static {p0, v0}, Le/e/a/Playback214;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v0

    const-string v1, "g"

    invoke-static {p0, v1}, Le/e/a/Playback214;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result p0
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_14

    if-lez v0, :cond_15

    if-lez p0, :cond_15

    int-to-float v0, v0

    int-to-float p0, p0

    div-float/2addr v0, p0

    return v0

    :catch_14
    move-exception p0

    :cond_15
    const p0, 0x3fe38e39

    return p0
.end method

.method public static sync(Ljava/lang/Object;)V
    .registers 7

    .line 9
    invoke-static {p0}, Le/e/a/DirectBackground235;->owns(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    :try_start_7
    const-string v0, "U"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager$LayoutParams;

    invoke-static {p0}, Le/e/a/PopupAspect214;->ratio(Ljava/lang/Object;)F

    move-result v1

    sget-object v2, Le/e/a/PopupAspect214;->RATIOS:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v2, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    iget v3, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    if-lez v3, :cond_26

    iget v3, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    goto :goto_32

    :cond_26
    const-string v3, "e"

    invoke-static {p0, v3}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    :goto_32
    if-eqz v2, :cond_4f

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v4

    sub-float/2addr v4, v1

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const v5, 0x3a83126f    # 0.001f

    cmpl-float v4, v4, v5

    if-lez v4, :cond_4f

    int-to-float v3, v3

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    div-float/2addr v3, v2

    mul-float/2addr v3, v1

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    :cond_4f
    const/4 v1, 0x1

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    const-string v2, "o"

    invoke-static {p0, v2}, Le/e/a/Playback214;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    invoke-static {p0, v1, v2, v0}, Le/e/a/PopupLayout236;->request(Ljava/lang/Object;III)V
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_65} :catch_66

    goto :goto_6e

    :catch_66
    move-exception p0

    const-string v0, "nicoid-popup"

    const-string v1, "Aspect update failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_6e
    return-void
.end method
