.class public final Le/e/a/TabSymbols213;
.super Ljava/lang/Object;
.source "TabSymbols213.java"


# static fields
.field private static final DRAW_PAINT:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroid/graphics/Paint;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 13
    new-instance v0, Le/e/a/TabSymbols213$0;

    invoke-direct {v0}, Le/e/a/TabSymbols213$0;-><init>()V

    invoke-static {v0}, Ljava/lang/ThreadLocal;->withInitial(Ljava/util/function/Supplier;)Ljava/lang/ThreadLocal;

    move-result-object v0

    sput-object v0, Le/e/a/TabSymbols213;->DRAW_PAINT:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static badge(Ljava/lang/Object;)I
    .registers 6

    .line 30
    const-string v0, "mylist"

    const/4 v1, 0x0

    if-nez p0, :cond_0

    return v1

    .line 32
    :cond_0
    :try_start_0
    const-string v2, "screen"

    invoke-static {p0, v2}, Le/e/a/TabSymbols213;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "url"

    invoke-static {p0, v3}, Le/e/a/TabSymbols213;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 33
    const-string v4, "type"

    invoke-static {p0, v4}, Le/e/a/TabSymbols213;->num(Ljava/lang/Object;Ljava/lang/String;)I

    move-result p0

    .line 34
    const-string v4, "mypage"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/16 p0, 0x9

    return p0

    :cond_1
    const-string v4, "nicorepo"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 p0, 0x7

    return p0

    .line 35
    :cond_2
    const-string v4, "playlist"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/16 p0, 0x8

    return p0

    .line 36
    :cond_3
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string v4, "list"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 37
    :cond_4
    const/16 v4, 0x9

    if-eq p0, v4, :cond_7

    const-string v4, "deflist"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    const-string v4, "/deflist"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5

    goto :goto_0

    .line 38
    :cond_5
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x5

    if-nez v0, :cond_6

    if-eq p0, v2, :cond_6

    const-string p0, "/mylist/"

    invoke-virtual {v3, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_8

    :cond_6
    return v2

    .line 37
    :cond_7
    :goto_0
    const/4 p0, 0x6

    return p0

    .line 40
    :catch_0
    move-exception p0

    :cond_8
    nop

    .line 41
    return v1
.end method

.method public static describe(Landroid/view/View;Ljava/lang/Object;)V
    .registers 8

    .line 89
    invoke-static {p1}, Le/e/a/TabSymbols213;->badge(Ljava/lang/Object;)I

    move-result v0

    .line 90
    if-eqz p0, :cond_9

    if-nez v0, :cond_0

    goto/16 :goto_4

    .line 91
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 92
    const/16 v2, 0x9

    if-ne v0, v2, :cond_1

    const-string v2, "\u30de\u30a4\u30da\u30fc\u30b8"

    const-string v3, "My page"

    const-string/jumbo v4, "\u6211\u7684\u9801\u9762"

    invoke-static {v1, v2, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget-object v1, v1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    .line 93
    const/4 v2, 0x7

    const/4 v3, 0x6

    const/4 v4, 0x5

    if-ne v0, v4, :cond_2

    const-string v5, "\u30de\u30a4\u30ea\u30b9\u30c8"

    goto :goto_0

    :cond_2
    if-ne v0, v3, :cond_3

    const-string v5, "\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8"

    goto :goto_0

    .line 94
    :cond_3
    if-ne v0, v2, :cond_4

    const-string v5, "\u30cb\u30b3\u30ec\u30dd"

    goto :goto_0

    :cond_4
    const-string/jumbo v5, "\u672c\u4f53\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8"

    .line 95
    :goto_0
    if-ne v0, v4, :cond_5

    const-string v0, "Mylist"

    goto :goto_1

    :cond_5
    if-ne v0, v3, :cond_6

    const-string v0, "Temporary Mylist"

    goto :goto_1

    .line 96
    :cond_6
    if-ne v0, v2, :cond_7

    const-string v0, "NicoRepo"

    goto :goto_1

    :cond_7
    const-string v0, "Local playlists"

    :goto_1
    nop

    .line 98
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ja"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_2

    :cond_8
    move-object v5, v0

    :goto_2
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "label"

    invoke-static {p1, v1}, Le/e/a/TabSymbols213;->str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 99
    :catch_0
    move-exception p0

    :goto_3
    nop

    .line 100
    return-void

    .line 90
    :cond_9
    :goto_4
    return-void
.end method

.method public static draw(Landroid/graphics/Canvas;ILandroid/graphics/Paint;Landroid/graphics/drawable/Drawable;)V
    .registers 13

    .line 45
    if-eqz p0, :cond_6

    if-nez p3, :cond_0

    goto/16 :goto_1

    .line 46
    :cond_0
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p3

    .line 47
    sget-object v0, Le/e/a/TabSymbols213;->DRAW_PAINT:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/graphics/Paint;

    .line 48
    invoke-virtual {v6, p2}, Landroid/graphics/Paint;->set(Landroid/graphics/Paint;)V

    .line 49
    const/4 p2, 0x1

    invoke-virtual {v6, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 50
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 51
    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v6, p2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 52
    sget-object p2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v6, p2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 53
    const/high16 p2, 0x3fc00000    # 1.5f

    invoke-virtual {v6, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 54
    invoke-virtual {p0}, Landroid/graphics/Canvas;->save()I

    move-result p2

    .line 55
    iget v0, p3, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget v1, p3, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-virtual {p0, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 56
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x41800000    # 16.0f

    div-float/2addr v0, v1

    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result p3

    int-to-float p3, p3

    div-float/2addr p3, v1

    invoke-virtual {p0, v0, p3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 57
    const/4 p3, 0x5

    if-ne p1, p3, :cond_1

    .line 58
    move-object v8, v6

    const v6, 0x3fd9999a    # 1.7f

    const v7, 0x3fd9999a    # 1.7f

    const/high16 v2, 0x3fc00000    # 1.5f

    const v3, 0x40966666    # 4.7f

    const/high16 v4, 0x41680000    # 14.5f

    const/high16 v5, 0x41580000    # 13.5f

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 59
    move-object v6, v8

    const/high16 v4, 0x40400000    # 3.0f

    const/high16 v5, 0x40400000    # 3.0f

    const/high16 v2, 0x40400000    # 3.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 60
    const/high16 v4, 0x40e00000    # 7.0f

    const/high16 v3, 0x40400000    # 3.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 61
    const/high16 v4, 0x41300000    # 11.0f

    const v5, 0x41033333    # 8.2f

    const/high16 v2, 0x40a00000    # 5.0f

    const v3, 0x41033333    # 8.2f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 62
    const v4, 0x411b3333    # 9.7f

    const v5, 0x4129999a    # 10.6f

    const v3, 0x4129999a    # 10.6f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_0

    .line 63
    :cond_1
    move-object v1, p0

    const/4 p0, 0x6

    if-ne p1, p0, :cond_2

    .line 64
    const/high16 v4, 0x41400000    # 12.0f

    const/high16 v5, 0x40000000    # 2.0f

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x40000000    # 2.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 65
    const/high16 v4, 0x40800000    # 4.0f

    const/high16 v5, 0x41600000    # 14.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 66
    const/high16 v4, 0x41400000    # 12.0f

    const/high16 v2, 0x41400000    # 12.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 67
    const/high16 v4, 0x41000000    # 8.0f

    const/high16 v5, 0x41300000    # 11.0f

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 68
    const/high16 v4, 0x41400000    # 12.0f

    const/high16 v5, 0x41600000    # 14.0f

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x41300000    # 11.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 69
    const p0, 0x40d66666    # 6.7f

    const p1, 0x3fa66666    # 1.3f

    const/high16 p3, 0x41000000    # 8.0f

    invoke-virtual {v1, p3, p0, p1, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_0

    .line 70
    :cond_2
    const/4 p0, 0x7

    if-ne p1, p0, :cond_3

    .line 71
    move-object v8, v6

    const v6, 0x3f8ccccd    # 1.1f

    const v7, 0x3f8ccccd    # 1.1f

    const/high16 v2, 0x40000000    # 2.0f

    const/high16 v3, 0x40000000    # 2.0f

    const/high16 v4, 0x41600000    # 14.0f

    const/high16 v5, 0x41600000    # 14.0f

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 72
    move-object v6, v8

    const/high16 v4, 0x41000000    # 8.0f

    const v5, 0x41033333    # 8.2f

    const/high16 v2, 0x40800000    # 4.0f

    const v3, 0x40866666    # 4.2f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 73
    const/high16 v4, 0x41400000    # 12.0f

    const v5, 0x40866666    # 4.2f

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 74
    const v5, 0x40c9999a    # 6.3f

    const v3, 0x40c9999a    # 6.3f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 75
    const v5, 0x4124cccd    # 10.3f

    const/high16 v2, 0x40800000    # 4.0f

    const v3, 0x4124cccd    # 10.3f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 76
    const/high16 v4, 0x41300000    # 11.0f

    const v5, 0x4144cccd    # 12.3f

    const v3, 0x4144cccd    # 12.3f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 77
    :cond_3
    const/16 p0, 0x8

    if-ne p1, p0, :cond_4

    .line 78
    move-object v8, v6

    const/high16 v6, 0x3fc00000    # 1.5f

    const/high16 v7, 0x3fc00000    # 1.5f

    const/high16 v2, 0x3fc00000    # 1.5f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v4, 0x41680000    # 14.5f

    const/high16 v5, 0x41580000    # 13.5f

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 79
    move-object v6, v8

    const/high16 v4, 0x40800000    # 4.0f

    const v5, 0x412ccccd    # 10.8f

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x40b00000    # 5.5f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 80
    const v4, 0x410ccccd    # 8.8f

    const v5, 0x4101999a    # 8.1f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 81
    const v3, 0x412ccccd    # 10.8f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 82
    const v4, 0x41433333    # 12.2f

    const/high16 v5, 0x40c00000    # 6.0f

    const v2, 0x41266666    # 10.4f

    const/high16 v3, 0x40c00000    # 6.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 83
    const v5, 0x411ccccd    # 9.8f

    const v3, 0x411ccccd    # 9.8f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 85
    :cond_4
    const/16 p0, 0x9

    if-ne p1, p0, :cond_5

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x40a00000    # 5.0f

    const v4, 0x40266666    # 2.6f

    invoke-virtual {v1, v2, v3, v4, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41100000    # 9.0f

    const/high16 v4, 0x41000000    # 8.0f

    const/high16 v5, 0x41100000    # 9.0f

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Path;->quadTo(FFFF)V

    const/high16 v2, 0x41500000    # 13.0f

    const/high16 v3, 0x41100000    # 9.0f

    const/high16 v4, 0x41500000    # 13.0f

    const/high16 v5, 0x41600000    # 14.0f

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Path;->quadTo(FFFF)V

    invoke-virtual {v1, v0, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_5
    :goto_0
    invoke-virtual {v1, p2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 86
    return-void

    .line 45
    :cond_6
    :goto_1
    return-void
.end method

.method private static num(Ljava/lang/Object;Ljava/lang/String;)I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    invoke-static {p0, p1}, Le/e/a/TabSymbols213;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method private static str(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 21
    invoke-static {p0, p1}, Le/e/a/TabSymbols213;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 22
    if-nez p0, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    .line 17
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 18
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
