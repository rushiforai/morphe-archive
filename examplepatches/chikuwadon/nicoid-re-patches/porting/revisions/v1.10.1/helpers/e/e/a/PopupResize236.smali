.class public final Le/e/a/PopupResize236;
.super Ljava/lang/Object;
.source "PopupResize236.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PopupResize236$Drag;
    }
.end annotation


# static fields
.field static final drags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/PopupResize236$Drag;",
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

    sput-object v0, Le/e/a/PopupResize236;->drags:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cancel(Ljava/lang/Object;)V
    .registers 2

    .line 17
    sget-object v0, Le/e/a/PopupResize236;->drags:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static corner(Le/e/a/PopupResize236$Drag;FFIII)[I
    .registers 7

    .line 7
    iget-boolean v0, p0, Le/e/a/PopupResize236$Drag;->top:Z

    if-eqz v0, :cond_5

    neg-float p2, p2

    :cond_5
    iget-boolean v0, p0, Le/e/a/PopupResize236$Drag;->left:Z

    if-eqz v0, :cond_a

    neg-float p1, p1

    :cond_a
    iget v0, p0, Le/e/a/PopupResize236$Drag;->ratio:F

    mul-float/2addr p1, v0

    add-float/2addr p1, p2

    iget p2, p0, Le/e/a/PopupResize236$Drag;->ratio:F

    iget v0, p0, Le/e/a/PopupResize236$Drag;->ratio:F

    mul-float/2addr p2, v0

    const/high16 v0, 0x3f800000    # 1.0f

    add-float/2addr p2, v0

    div-float/2addr p1, p2

    iget p2, p0, Le/e/a/PopupResize236$Drag;->height:I

    int-to-float p2, p2

    add-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p5, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget-boolean p2, p0, Le/e/a/PopupResize236$Drag;->left:Z

    if-eqz p2, :cond_2d

    iget p2, p0, Le/e/a/PopupResize236$Drag;->x:I

    iget p3, p0, Le/e/a/PopupResize236$Drag;->width:I

    add-int/2addr p2, p3

    goto :goto_31

    :cond_2d
    iget p2, p0, Le/e/a/PopupResize236$Drag;->x:I

    sub-int p2, p3, p2

    :goto_31
    iget-boolean p3, p0, Le/e/a/PopupResize236$Drag;->top:Z

    if-eqz p3, :cond_3b

    iget p3, p0, Le/e/a/PopupResize236$Drag;->y:I

    iget p4, p0, Le/e/a/PopupResize236$Drag;->outer:I

    add-int/2addr p3, p4

    goto :goto_3f

    :cond_3b
    iget p3, p0, Le/e/a/PopupResize236$Drag;->y:I

    sub-int p3, p4, p3

    :goto_3f
    iget p4, p0, Le/e/a/PopupResize236$Drag;->outer:I

    iget p5, p0, Le/e/a/PopupResize236$Drag;->height:I

    sub-int/2addr p4, p5

    sub-int/2addr p3, p4

    int-to-float p2, p2

    iget p4, p0, Le/e/a/PopupResize236$Drag;->ratio:F

    div-float/2addr p2, p4

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 p2, 0x1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-float p3, p1

    iget p4, p0, Le/e/a/PopupResize236$Drag;->ratio:F

    mul-float/2addr p3, p4

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    invoke-static {p2, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    const/4 p4, 0x4

    new-array p4, p4, [I

    const/4 p5, 0x0

    aput p3, p4, p5

    aput p1, p4, p2

    iget-boolean p2, p0, Le/e/a/PopupResize236$Drag;->left:Z

    if-eqz p2, :cond_79

    iget p2, p0, Le/e/a/PopupResize236$Drag;->x:I

    iget p5, p0, Le/e/a/PopupResize236$Drag;->width:I

    add-int/2addr p2, p5

    sub-int/2addr p2, p3

    goto :goto_7b

    :cond_79
    iget p2, p0, Le/e/a/PopupResize236$Drag;->x:I

    :goto_7b
    const/4 p3, 0x2

    aput p2, p4, p3

    iget-boolean p2, p0, Le/e/a/PopupResize236$Drag;->top:Z

    if-eqz p2, :cond_89

    iget p2, p0, Le/e/a/PopupResize236$Drag;->y:I

    iget p0, p0, Le/e/a/PopupResize236$Drag;->height:I

    add-int/2addr p2, p0

    sub-int/2addr p2, p1

    goto :goto_8b

    :cond_89
    iget p2, p0, Le/e/a/PopupResize236$Drag;->y:I

    :goto_8b
    const/4 p0, 0x3

    aput p2, p4, p0

    return-object p4
.end method

.method public static save(Ljava/lang/Object;)V
    .registers 6

    .line 18
    const-string v0, "nicoid-popup"

    :try_start_2
    const-string v1, "U"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager$LayoutParams;

    const-string v2, "Q"

    invoke-static {p0, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "pop_ivw"

    iget v4, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "pop_poh"

    iget v4, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    invoke-static {p0, v4}, Le/e/a/PopupAspect214;->height(Ljava/lang/Object;I)I

    move-result p0

    invoke-interface {v2, v3, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v2, "pop_pox"

    iget v3, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v2, "pop_poy"

    iget v3, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v2, "Popup bounds saved "

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v2, "x"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v2, " at "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v2, ","

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_75} :catch_76

    goto :goto_7c

    :catch_76
    move-exception p0

    const-string v1, "Cannot save popup bounds"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_7c
    return-void
.end method

.method public static touch(Ljava/lang/Object;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 14

    .line 8
    invoke-static {p0}, Le/e/a/DirectBackground235;->owns(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_8

    return v0

    :cond_8
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    sget-object v1, Le/e/a/PopupResize236;->drags:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/PopupResize236$Drag;

    .line 9
    const/4 v8, 0x2

    const/4 v9, 0x0

    if-nez p1, :cond_d2

    :try_start_18
    sget-object p1, Le/e/a/PopupResize236;->drags:Ljava/util/Map;

    invoke-interface {p1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "a"

    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    const-string v2, "U"

    invoke-static {p0, v2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager$LayoutParams;

    new-array v3, v8, [I

    invoke-virtual {p1, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    aget v5, v3, v9

    int-to-float v5, v5

    sub-float/2addr v4, v5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    aget v3, v3, v0

    int-to-float v3, v3

    sub-float/2addr v5, v3

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const/16 v6, 0x1e

    invoke-static {v3, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    cmpg-float v6, v4, v3

    if-ltz v6, :cond_5b

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v7

    int-to-float v7, v7

    sub-float/2addr v7, v3

    cmpl-float v4, v4, v7

    if-lez v4, :cond_69

    :cond_5b
    cmpg-float v4, v5, v3

    if-ltz v4, :cond_6a

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v7

    int-to-float v7, v7

    sub-float/2addr v7, v3

    cmpl-float v3, v5, v7

    if-gtz v3, :cond_6a

    :cond_69
    return v9

    .line 10
    :cond_6a
    new-instance v3, Le/e/a/PopupResize236$Drag;

    invoke-direct {v3}, Le/e/a/PopupResize236$Drag;-><init>()V
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_6f} :catch_d0

    :try_start_6f
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v1

    iput v1, v3, Le/e/a/PopupResize236$Drag;->downX:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iput p2, v3, Le/e/a/PopupResize236$Drag;->downY:F

    invoke-static {p0}, Le/e/a/PopupAspect214;->ratio(Ljava/lang/Object;)F

    move-result p2

    iput p2, v3, Le/e/a/PopupResize236$Drag;->ratio:F

    iget p2, v2, Landroid/view/WindowManager$LayoutParams;->x:I

    iput p2, v3, Le/e/a/PopupResize236$Drag;->x:I

    iget p2, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    iput p2, v3, Le/e/a/PopupResize236$Drag;->y:I

    iget p2, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    if-lez p2, :cond_90

    iget p2, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    goto :goto_94

    :cond_90
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p2

    :goto_94
    iput p2, v3, Le/e/a/PopupResize236$Drag;->width:I

    iget p2, v3, Le/e/a/PopupResize236$Drag;->width:I

    invoke-static {p0, p2}, Le/e/a/PopupAspect214;->height(Ljava/lang/Object;I)I

    move-result p2

    iput p2, v3, Le/e/a/PopupResize236$Drag;->height:I

    iget p2, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    if-lez p2, :cond_a5

    iget p1, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    goto :goto_a9

    :cond_a5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    :goto_a9
    iput p1, v3, Le/e/a/PopupResize236$Drag;->outer:I

    if-gez v6, :cond_af

    move p1, v0

    goto :goto_b0

    :cond_af
    move p1, v9

    :goto_b0
    iput-boolean p1, v3, Le/e/a/PopupResize236$Drag;->left:Z

    if-gez v4, :cond_b6

    move p1, v0

    goto :goto_b7

    :cond_b6
    move p1, v9

    :goto_b7
    iput-boolean p1, v3, Le/e/a/PopupResize236$Drag;->top:Z

    sget-object p1, Le/e/a/PopupResize236;->drags:Ljava/util/Map;

    invoke-interface {p1, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string p2, "f0"

    invoke-virtual {p1, p2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V
    :try_end_cc
    .catch Ljava/lang/Exception; {:try_start_6f .. :try_end_cc} :catch_cd

    return v0

    .line 15
    :catch_cd
    move-exception p1

    move-object v1, v3

    goto :goto_12f

    :catch_d0
    move-exception p1

    goto :goto_12f

    .line 11
    :cond_d2
    if-nez v1, :cond_d5

    return v9

    .line 12
    :cond_d5
    const/4 v10, 0x3

    if-ne p1, v8, :cond_122

    :try_start_d8
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    iget v3, v1, Le/e/a/PopupResize236$Drag;->downX:F

    sub-float v3, v2, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    iget v2, v1, Le/e/a/PopupResize236$Drag;->downY:F

    sub-float v4, p2, v2

    const-string p2, "o"

    invoke-static {p0, p2}, Le/e/a/Playback214;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v5

    const-string p2, "p"

    invoke-static {p0, p2}, Le/e/a/Playback214;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result p2

    const-string v2, "l"

    invoke-static {p0, v2}, Le/e/a/Playback214;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v2

    invoke-static {v9, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    sub-int v6, p2, v2

    const-string p2, "T"

    invoke-static {p0, p2}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result v7

    move-object v2, v1

    invoke-static/range {v2 .. v7}, Le/e/a/PopupResize236;->corner(Le/e/a/PopupResize236$Drag;FFIII)[I

    move-result-object p2

    aget v2, p2, v9

    aget v3, p2, v8

    aget p2, p2, v10

    invoke-static {p0, v2, v3, p2}, Le/e/a/PopupLayout236;->request(Ljava/lang/Object;III)V

    .line 13
    :cond_122
    if-eq p1, v0, :cond_126

    if-ne p1, v10, :cond_12e

    :cond_126
    sget-object p1, Le/e/a/PopupResize236;->drags:Ljava/util/Map;

    invoke-interface {p1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/PopupResize236;->save(Ljava/lang/Object;)V
    :try_end_12e
    .catch Ljava/lang/Exception; {:try_start_d8 .. :try_end_12e} :catch_d0

    .line 14
    :cond_12e
    return v0

    .line 15
    :goto_12f
    sget-object p2, Le/e/a/PopupResize236;->drags:Ljava/util/Map;

    invoke-interface {p2, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "nicoid-popup"

    const-string p2, "Corner resize failed"

    invoke-static {p0, p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    if-eqz v1, :cond_13e

    return v0

    :cond_13e
    return v9
.end method
