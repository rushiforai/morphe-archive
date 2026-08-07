.class public final Ll/kb60;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\u0006\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J]\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u00100\u000e2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u00042\u0008\u0008\u0002\u0010\u000c\u001a\u00020\u000b2\u0008\u0008\u0002\u0010\r\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0011\u0010\u0012JA\u0010\u0017\u001a\u00020\u000f2\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u00132\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u00100\u000e2\u0006\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Ll/kb60;",
        "",
        "<init>",
        "()V",
        "",
        "containerWidth",
        "containerHeight",
        "pipWidth",
        "pipHeight",
        "horizontalMarginPx",
        "verticalMarginPx",
        "Ll/svm;",
        "safeInsets",
        "bottomOffsetPx",
        "",
        "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
        "Landroid/graphics/PointF;",
        "b",
        "(IIIIIILl/svm;I)Ljava/util/Map;",
        "",
        "pipCenterX",
        "pipCenterY",
        "anchors",
        "a",
        "(FFLjava/util/Map;II)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final INSTANCE:Ll/kb60;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/kb60;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/kb60;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/kb60;->INSTANCE:Ll/kb60;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(FFLjava/util/Map;II)Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;
    .locals 4
    .param p3    # Ljava/util/Map;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF",
            "Ljava/util/Map<",
            "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
            "+",
            "Landroid/graphics/PointF;",
            ">;II)",
            "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ljava/lang/Iterable;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    if-nez p3, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    :goto_0
    move-object p0, p3

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move-object v0, p3

    .line 35
    check-cast v0, Ljava/util/Map$Entry;

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/graphics/PointF;

    .line 42
    .line 43
    iget v1, v0, Landroid/graphics/PointF;->x:F

    .line 44
    .line 45
    int-to-float p4, p4

    .line 46
    const/high16 v2, 0x40000000    # 2.0f

    .line 47
    .line 48
    div-float/2addr p4, v2

    .line 49
    add-float/2addr v1, p4

    .line 50
    sub-float v1, p1, v1

    .line 51
    .line 52
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 53
    .line 54
    int-to-float p5, p5

    .line 55
    div-float/2addr p5, v2

    .line 56
    add-float/2addr v0, p5

    .line 57
    sub-float v0, p2, v0

    .line 58
    .line 59
    mul-float/2addr v1, v1

    .line 60
    mul-float/2addr v0, v0

    .line 61
    add-float/2addr v1, v0

    .line 62
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    move-object v2, v0

    .line 67
    check-cast v2, Ljava/util/Map$Entry;

    .line 68
    .line 69
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Landroid/graphics/PointF;

    .line 74
    .line 75
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 76
    .line 77
    add-float/2addr v3, p4

    .line 78
    sub-float v3, p1, v3

    .line 79
    .line 80
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 81
    .line 82
    add-float/2addr v2, p5

    .line 83
    sub-float v2, p2, v2

    .line 84
    .line 85
    mul-float/2addr v3, v3

    .line 86
    mul-float/2addr v2, v2

    .line 87
    add-float/2addr v3, v2

    .line 88
    invoke-static {v1, v3}, Ljava/lang/Float;->compare(FF)I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-lez v2, :cond_3

    .line 93
    .line 94
    move-object p3, v0

    .line 95
    move v1, v3

    .line 96
    :cond_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_2

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :goto_1
    check-cast p0, Ljava/util/Map$Entry;

    .line 104
    .line 105
    if-eqz p0, :cond_4

    .line 106
    .line 107
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    check-cast p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 112
    .line 113
    if-eqz p0, :cond_4

    .line 114
    .line 115
    return-object p0

    .line 116
    :cond_4
    sget-object p0, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->BOTTOM_RIGHT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 117
    .line 118
    return-object p0
.end method

.method public final b(IIIIIILl/svm;I)Ljava/util/Map;
    .locals 2
    .param p7    # Ll/svm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIIII",
            "Ll/svm;",
            "I)",
            "Ljava/util/Map<",
            "Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lkotlin/collections/MapsKt;->createMapBuilder()Ljava/util/Map;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget v0, p7, Ll/svm;->a:I

    .line 9
    .line 10
    add-int/2addr v0, p5

    .line 11
    int-to-float v0, v0

    .line 12
    iget v1, p7, Ll/svm;->b:I

    .line 13
    .line 14
    add-int/2addr v1, p6

    .line 15
    int-to-float v1, v1

    .line 16
    sub-int/2addr p1, p3

    .line 17
    sub-int/2addr p1, p5

    .line 18
    iget p3, p7, Ll/svm;->c:I

    .line 19
    .line 20
    sub-int/2addr p1, p3

    .line 21
    int-to-float p1, p1

    .line 22
    invoke-static {p1, v0}, Lkotlin/ranges/a;->a(FF)F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    sub-int/2addr p2, p4

    .line 27
    sub-int/2addr p2, p6

    .line 28
    sub-int/2addr p2, p8

    .line 29
    iget p3, p7, Ll/svm;->d:I

    .line 30
    .line 31
    sub-int/2addr p2, p3

    .line 32
    int-to-float p2, p2

    .line 33
    invoke-static {p2, v1}, Lkotlin/ranges/a;->a(FF)F

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    add-float p3, v0, p1

    .line 38
    .line 39
    const/high16 p4, 0x40000000    # 2.0f

    .line 40
    .line 41
    div-float/2addr p3, p4

    .line 42
    add-float p5, v1, p2

    .line 43
    .line 44
    div-float/2addr p5, p4

    .line 45
    sget-object p4, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->TOP_LEFT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 46
    .line 47
    new-instance p6, Landroid/graphics/PointF;

    .line 48
    .line 49
    invoke-direct {p6, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 50
    .line 51
    .line 52
    invoke-interface {p0, p4, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    sget-object p4, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->TOP_CENTER:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 56
    .line 57
    new-instance p6, Landroid/graphics/PointF;

    .line 58
    .line 59
    invoke-direct {p6, p3, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 60
    .line 61
    .line 62
    invoke-interface {p0, p4, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    sget-object p4, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->TOP_RIGHT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 66
    .line 67
    new-instance p6, Landroid/graphics/PointF;

    .line 68
    .line 69
    invoke-direct {p6, p1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 70
    .line 71
    .line 72
    invoke-interface {p0, p4, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    sget-object p4, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->LEFT_CENTER:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 76
    .line 77
    new-instance p6, Landroid/graphics/PointF;

    .line 78
    .line 79
    invoke-direct {p6, v0, p5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 80
    .line 81
    .line 82
    invoke-interface {p0, p4, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    sget-object p4, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->CENTER:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 86
    .line 87
    new-instance p6, Landroid/graphics/PointF;

    .line 88
    .line 89
    invoke-direct {p6, p3, p5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 90
    .line 91
    .line 92
    invoke-interface {p0, p4, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    sget-object p4, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->RIGHT_CENTER:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 96
    .line 97
    new-instance p6, Landroid/graphics/PointF;

    .line 98
    .line 99
    invoke-direct {p6, p1, p5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 100
    .line 101
    .line 102
    invoke-interface {p0, p4, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    sget-object p4, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->BOTTOM_LEFT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 106
    .line 107
    new-instance p5, Landroid/graphics/PointF;

    .line 108
    .line 109
    invoke-direct {p5, v0, p2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 110
    .line 111
    .line 112
    invoke-interface {p0, p4, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    sget-object p4, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->BOTTOM_CENTER:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 116
    .line 117
    new-instance p5, Landroid/graphics/PointF;

    .line 118
    .line 119
    invoke-direct {p5, p3, p2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 120
    .line 121
    .line 122
    invoke-interface {p0, p4, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    sget-object p3, Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;->BOTTOM_RIGHT:Lcom/clevertap/android/sdk/inapp/pipsdk/PIPPosition;

    .line 126
    .line 127
    new-instance p4, Landroid/graphics/PointF;

    .line 128
    .line 129
    invoke-direct {p4, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 130
    .line 131
    .line 132
    invoke-interface {p0, p3, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    invoke-static {p0}, Lkotlin/collections/MapsKt;->build(Ljava/util/Map;)Ljava/util/Map;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    return-object p0
.end method
