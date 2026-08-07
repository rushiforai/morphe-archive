.class public Ll/l35;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:I

.field public static final b:I

.field public static final c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/l35;->a:I

    .line 8
    .line 9
    sget v0, Ll/qa00;->c:I

    .line 10
    .line 11
    sput v0, Ll/l35;->b:I

    .line 12
    .line 13
    sput v0, Ll/l35;->c:I

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Landroid/view/View;I)Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->getBackgroundColorConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->getBorderColorConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/l35;->k(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-static {v0, p2}, Ll/l35;->c(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;I)Landroid/graphics/drawable/GradientDrawable;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {p0}, Ll/l35;->k(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {p0, p1, p2}, Ll/l35;->f(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;Landroid/view/View;I)Landroid/graphics/drawable/ShapeDrawable;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    new-array p0, p0, [Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    invoke-interface {v1, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, [Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    new-instance p1, Landroid/graphics/drawable/LayerDrawable;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    return-object p1
.end method

.method public static b(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)I
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getTransparency()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-gez p0, :cond_0

    .line 10
    .line 11
    move-wide v0, v2

    .line 12
    :cond_0
    const-wide/16 v2, 0x64

    .line 13
    .line 14
    cmp-long p0, v0, v2

    .line 15
    .line 16
    if-lez p0, :cond_1

    .line 17
    .line 18
    move-wide v0, v2

    .line 19
    :cond_1
    long-to-float p0, v0

    .line 20
    const/high16 v0, 0x42c80000    # 100.0f

    .line 21
    .line 22
    div-float/2addr p0, v0

    .line 23
    const/high16 v0, 0x437f0000    # 255.0f

    .line 24
    .line 25
    mul-float/2addr p0, v0

    .line 26
    float-to-int p0, p0

    .line 27
    rsub-int p0, p0, 0xff

    .line 28
    .line 29
    return p0
.end method

.method public static c(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;I)Landroid/graphics/drawable/GradientDrawable;
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getGradientDirection()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v1, v2}, Ll/l35;->d(J)Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p0}, Ll/l35;->g(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)[I

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 16
    .line 17
    .line 18
    int-to-float p1, p1

    .line 19
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0}, Ll/l35;->b(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public static d(J)Landroid/graphics/drawable/GradientDrawable$Orientation;
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-wide/16 v0, 0x3

    .line 11
    .line 12
    cmp-long v0, p0, v0

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const-wide/16 v0, 0x2

    .line 20
    .line 21
    cmp-long p0, p0, v0

    .line 22
    .line 23
    if-nez p0, :cond_2

    .line 24
    .line 25
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 29
    .line 30
    return-object p0
.end method

.method public static e(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;Landroid/view/View;)Landroid/graphics/LinearGradient;
    .locals 11

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getGradientDirection()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    cmp-long v2, v0, v2

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    move v0, p1

    .line 17
    move p1, v3

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-wide/16 v4, 0x2

    .line 20
    .line 21
    cmp-long v2, v0, v4

    .line 22
    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    move v0, v3

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const-wide/16 v4, 0x3

    .line 32
    .line 33
    cmp-long v0, v0, v4

    .line 34
    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    move v10, v0

    .line 46
    move v0, p1

    .line 47
    move p1, v10

    .line 48
    goto :goto_0

    .line 49
    :cond_2
    move p1, v3

    .line 50
    move v0, p1

    .line 51
    :goto_0
    sget v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->i:I

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getColorsList()Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-nez v2, :cond_3

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getColorsList()Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    const/4 v4, 0x2

    .line 72
    if-ne v2, v4, :cond_3

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getColorsList()Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v1}, Ll/l35;->l(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getColorsList()Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const/4 v2, 0x1

    .line 93
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    check-cast p0, Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {p0}, Ll/l35;->l(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    move v8, p0

    .line 104
    move v7, v1

    .line 105
    goto :goto_1

    .line 106
    :cond_3
    move v7, v1

    .line 107
    move v8, v7

    .line 108
    :goto_1
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 109
    .line 110
    int-to-float v5, p1

    .line 111
    int-to-float v6, v0

    .line 112
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 113
    .line 114
    const/4 v3, 0x0

    .line 115
    const/4 v4, 0x0

    .line 116
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 117
    .line 118
    .line 119
    return-object v2
.end method

.method public static f(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;Landroid/view/View;I)Landroid/graphics/drawable/ShapeDrawable;
    .locals 16

    .line 1
    new-instance v0, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    const/16 v2, 0x8

    .line 7
    .line 8
    new-array v3, v2, [F

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    aput v1, v3, v4

    .line 12
    .line 13
    const/4 v5, 0x1

    .line 14
    aput v1, v3, v5

    .line 15
    .line 16
    const/4 v6, 0x2

    .line 17
    aput v1, v3, v6

    .line 18
    .line 19
    const/4 v7, 0x3

    .line 20
    aput v1, v3, v7

    .line 21
    .line 22
    const/4 v8, 0x4

    .line 23
    aput v1, v3, v8

    .line 24
    .line 25
    const/4 v9, 0x5

    .line 26
    aput v1, v3, v9

    .line 27
    .line 28
    const/4 v10, 0x6

    .line 29
    aput v1, v3, v10

    .line 30
    .line 31
    const/4 v11, 0x7

    .line 32
    aput v1, v3, v11

    .line 33
    .line 34
    new-instance v12, Landroid/graphics/RectF;

    .line 35
    .line 36
    sget v13, Ll/l35;->a:I

    .line 37
    .line 38
    int-to-float v14, v13

    .line 39
    int-to-float v15, v13

    .line 40
    move/from16 p2, v4

    .line 41
    .line 42
    int-to-float v4, v13

    .line 43
    int-to-float v13, v13

    .line 44
    invoke-direct {v12, v14, v15, v4, v13}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 45
    .line 46
    .line 47
    new-array v2, v2, [F

    .line 48
    .line 49
    aput v1, v2, p2

    .line 50
    .line 51
    aput v1, v2, v5

    .line 52
    .line 53
    aput v1, v2, v6

    .line 54
    .line 55
    aput v1, v2, v7

    .line 56
    .line 57
    aput v1, v2, v8

    .line 58
    .line 59
    aput v1, v2, v9

    .line 60
    .line 61
    aput v1, v2, v10

    .line 62
    .line 63
    aput v1, v2, v11

    .line 64
    .line 65
    invoke-direct {v0, v3, v12, v2}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    .line 66
    .line 67
    .line 68
    new-instance v1, Landroid/graphics/drawable/ShapeDrawable;

    .line 69
    .line 70
    invoke-direct {v1, v0}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static/range {p0 .. p1}, Ll/l35;->e(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;Landroid/view/View;)Landroid/graphics/LinearGradient;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 91
    .line 92
    .line 93
    invoke-static/range {p0 .. p0}, Ll/l35;->b(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/ShapeDrawable;->setAlpha(I)V

    .line 98
    .line 99
    .line 100
    return-object v1
.end method

.method public static g(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)[I
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getColorsList()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getColorsList()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-ne v2, v0, :cond_0

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v2}, Ll/l35;->l(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    aput v2, v1, v0

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p0}, Ll/l35;->l(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    aput p0, v1, v0

    .line 51
    .line 52
    :cond_0
    return-object v1
.end method

.method public static h(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Landroid/view/View;I)Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->getBackgroundColorConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->getBorderColorConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/l35;->k(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-static {v0, p2}, Ll/l35;->i(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;I)Landroid/graphics/drawable/GradientDrawable;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {p0}, Ll/l35;->k(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {p0, p1, p2}, Ll/l35;->j(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;Landroid/view/View;I)Landroid/graphics/drawable/ShapeDrawable;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    new-array p0, p0, [Landroid/graphics/drawable/Drawable;

    .line 45
    .line 46
    invoke-interface {v1, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, [Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    new-instance p1, Landroid/graphics/drawable/LayerDrawable;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    return-object p1
.end method

.method public static i(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;I)Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getGradientDirection()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v1, v2}, Ll/l35;->d(J)Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p0}, Ll/l35;->g(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)[I

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 16
    .line 17
    .line 18
    int-to-float p1, p1

    .line 19
    const/16 v1, 0x8

    .line 20
    .line 21
    new-array v1, v1, [F

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    aput p1, v1, v2

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    aput p1, v1, v3

    .line 28
    .line 29
    const/4 v3, 0x2

    .line 30
    aput p1, v1, v3

    .line 31
    .line 32
    const/4 v3, 0x3

    .line 33
    aput p1, v1, v3

    .line 34
    .line 35
    const/4 v3, 0x4

    .line 36
    aput p1, v1, v3

    .line 37
    .line 38
    const/4 v3, 0x5

    .line 39
    aput p1, v1, v3

    .line 40
    .line 41
    const/4 v3, 0x6

    .line 42
    aput p1, v1, v3

    .line 43
    .line 44
    const/4 v3, 0x7

    .line 45
    aput p1, v1, v3

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 51
    .line 52
    .line 53
    invoke-static {p0}, Ll/l35;->b(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 58
    .line 59
    .line 60
    return-object v0
.end method

.method public static j(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;Landroid/view/View;I)Landroid/graphics/drawable/ShapeDrawable;
    .locals 21

    .line 1
    move/from16 v0, p2

    .line 2
    .line 3
    new-instance v1, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 4
    .line 5
    int-to-float v2, v0

    .line 6
    const/16 v3, 0x8

    .line 7
    .line 8
    new-array v4, v3, [F

    .line 9
    .line 10
    const/4 v5, 0x0

    .line 11
    aput v2, v4, v5

    .line 12
    .line 13
    const/4 v6, 0x1

    .line 14
    aput v2, v4, v6

    .line 15
    .line 16
    const/4 v7, 0x2

    .line 17
    aput v2, v4, v7

    .line 18
    .line 19
    const/4 v8, 0x3

    .line 20
    aput v2, v4, v8

    .line 21
    .line 22
    const/4 v9, 0x4

    .line 23
    aput v2, v4, v9

    .line 24
    .line 25
    const/4 v10, 0x5

    .line 26
    aput v2, v4, v10

    .line 27
    .line 28
    const/4 v11, 0x6

    .line 29
    aput v2, v4, v11

    .line 30
    .line 31
    const/4 v12, 0x7

    .line 32
    aput v2, v4, v12

    .line 33
    .line 34
    new-instance v2, Landroid/graphics/RectF;

    .line 35
    .line 36
    sget v13, Ll/l35;->b:I

    .line 37
    .line 38
    int-to-float v14, v13

    .line 39
    int-to-float v15, v13

    .line 40
    move/from16 v16, v5

    .line 41
    .line 42
    int-to-float v5, v13

    .line 43
    int-to-float v13, v13

    .line 44
    invoke-direct {v2, v14, v15, v5, v13}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 45
    .line 46
    .line 47
    sget v5, Ll/l35;->c:I

    .line 48
    .line 49
    sub-int v13, v0, v5

    .line 50
    .line 51
    int-to-float v13, v13

    .line 52
    sub-int v14, v0, v5

    .line 53
    .line 54
    int-to-float v14, v14

    .line 55
    sub-int v15, v0, v5

    .line 56
    .line 57
    int-to-float v15, v15

    .line 58
    move/from16 v17, v6

    .line 59
    .line 60
    sub-int v6, v0, v5

    .line 61
    .line 62
    int-to-float v6, v6

    .line 63
    move/from16 v18, v7

    .line 64
    .line 65
    sub-int v7, v0, v5

    .line 66
    .line 67
    int-to-float v7, v7

    .line 68
    move/from16 v19, v8

    .line 69
    .line 70
    sub-int v8, v0, v5

    .line 71
    .line 72
    int-to-float v8, v8

    .line 73
    move/from16 v20, v9

    .line 74
    .line 75
    sub-int v9, v0, v5

    .line 76
    .line 77
    int-to-float v9, v9

    .line 78
    sub-int/2addr v0, v5

    .line 79
    int-to-float v0, v0

    .line 80
    new-array v3, v3, [F

    .line 81
    .line 82
    aput v13, v3, v16

    .line 83
    .line 84
    aput v14, v3, v17

    .line 85
    .line 86
    aput v15, v3, v18

    .line 87
    .line 88
    aput v6, v3, v19

    .line 89
    .line 90
    aput v7, v3, v20

    .line 91
    .line 92
    aput v8, v3, v10

    .line 93
    .line 94
    aput v9, v3, v11

    .line 95
    .line 96
    aput v0, v3, v12

    .line 97
    .line 98
    invoke-direct {v1, v4, v2, v3}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    .line 99
    .line 100
    .line 101
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    .line 102
    .line 103
    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-static/range {p0 .. p1}, Ll/l35;->e(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;Landroid/view/View;)Landroid/graphics/LinearGradient;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 122
    .line 123
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 124
    .line 125
    .line 126
    invoke-static/range {p0 .. p0}, Ll/l35;->b(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;->setAlpha(I)V

    .line 131
    .line 132
    .line 133
    return-object v0
.end method

.method public static k(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getColorsList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->getColorsCount()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v0, 0x2

    .line 18
    if-ne p0, v0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public static l(Ljava/lang/String;)I
    .locals 5

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->i:I

    .line 2
    .line 3
    :try_start_0
    invoke-static {p0}, Ll/ynp0;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return p0

    .line 12
    :catch_0
    move-exception v1

    .line 13
    new-instance v2, Ljava/lang/Throwable;

    .line 14
    .line 15
    new-instance v3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v4, "parse color is :"

    .line 18
    .line 19
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-direct {v2, p0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    return v0
.end method
