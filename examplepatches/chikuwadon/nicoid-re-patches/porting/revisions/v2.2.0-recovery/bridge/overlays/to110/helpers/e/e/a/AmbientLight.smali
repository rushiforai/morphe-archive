.class public final Le/e/a/AmbientLight;
.super Ljava/lang/Object;
.source "AmbientLight.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/AmbientLight$Glow;,
        Le/e/a/AmbientLight$Layer;,
        Le/e/a/AmbientLight$Toggle;
    }
.end annotation


# static fields
.field static final ENABLED:Ljava/lang/String; = "nicoid_ambient_enabled"

.field static final FULL:I = 0x1

.field static final ID:Ljava/lang/String; = "ambient"

.field static final KEYS:[Ljava/lang/String;

.field private static final LAYERS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/ref/WeakReference<",
            "Le/e/a/AmbientLight$Layer;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field static final MAX:[I

.field static final MIN:[I

.field static final NORMAL:I = 0x0

.field static final POPUP:I = 0x2

.field static final PREFIX:Ljava/lang/String; = "nicoid_ambient_"

.field static final PRESETS:[[I

.field private static final PREVIOUS_PRESETS:[[I

.field private static final SEGMENTS:I = 0x4


# direct methods
.method static constructor <clinit>()V
    .registers 18

    .line 48
    const-string v8, "rate"

    const-string v9, "resolution"

    const-string v0, "intensity"

    const-string v1, "spread"

    const-string v2, "softness"

    const-string v3, "brightness"

    const-string v4, "contrast"

    const-string v5, "saturation"

    const-string v6, "vibrance"

    const-string v7, "response"

    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    move-result-object v0

    .line 47
    sput-object v0, Le/e/a/AmbientLight;->KEYS:[Ljava/lang/String;

    const/16 v0, 0xa

    .line 49
    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Le/e/a/AmbientLight;->MAX:[I

    .line 50
    new-array v1, v0, [I

    const/4 v2, 0x1

    const/4 v3, 0x4

    aput v3, v1, v2

    const/16 v4, 0x32

    aput v4, v1, v3

    const/4 v4, 0x7

    const/4 v5, 0x5

    aput v5, v1, v4

    const/16 v6, 0x8

    const/4 v7, 0x2

    aput v7, v1, v6

    const/16 v8, 0xc

    const/16 v9, 0x9

    aput v8, v1, v9

    sput-object v1, Le/e/a/AmbientLight;->MIN:[I

    .line 52
    new-array v1, v0, [I

    fill-array-data v1, :array_1

    .line 53
    new-array v8, v0, [I

    fill-array-data v8, :array_2

    .line 54
    new-array v10, v0, [I

    fill-array-data v10, :array_3

    .line 55
    new-array v11, v0, [I

    fill-array-data v11, :array_4

    .line 56
    new-array v12, v0, [I

    fill-array-data v12, :array_5

    filled-new-array {v1, v8, v10, v11, v12}, [[I

    move-result-object v1

    .line 51
    sput-object v1, Le/e/a/AmbientLight;->PRESETS:[[I

    .line 59
    new-array v10, v0, [I

    const/4 v1, 0x0

    const/16 v8, 0x18

    aput v8, v10, v1

    const/16 v1, 0x1a

    aput v1, v10, v2

    const/16 v1, 0x4e

    aput v1, v10, v7

    const/4 v1, 0x3

    const/16 v2, 0x55

    aput v2, v10, v1

    const/16 v1, 0x5f

    aput v1, v10, v3

    const/16 v1, 0x5a

    aput v1, v10, v5

    const/16 v1, 0x1c

    aput v1, v10, v4

    aput v3, v10, v6

    const/16 v1, 0x10

    aput v1, v10, v9

    .line 60
    new-array v11, v0, [I

    fill-array-data v11, :array_6

    .line 61
    new-array v12, v0, [I

    fill-array-data v12, :array_7

    .line 62
    new-array v13, v0, [I

    fill-array-data v13, :array_8

    .line 63
    new-array v14, v0, [I

    fill-array-data v14, :array_9

    .line 64
    new-array v15, v0, [I

    fill-array-data v15, :array_a

    .line 65
    new-array v1, v0, [I

    fill-array-data v1, :array_b

    .line 66
    new-array v0, v0, [I

    fill-array-data v0, :array_c

    move-object/from16 v17, v0

    move-object/from16 v16, v1

    filled-new-array/range {v10 .. v17}, [[I

    move-result-object v0

    .line 58
    sput-object v0, Le/e/a/AmbientLight;->PREVIOUS_PRESETS:[[I

    .line 69
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/AmbientLight;->MAIN:Landroid/os/Handler;

    .line 70
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/AmbientLight;->LAYERS:Ljava/util/WeakHashMap;

    return-void

    nop

    :array_0
    .array-data 4
        0xc8
        0xf0
        0x64
        0xdc
        0xdc
        0xdc
        0x8c
        0x64
        0x18
        0x30
    .end array-data

    :array_1
    .array-data 4
        0x24
        0x28
        0x52
        0x5c
        0x5f
        0x62
        0x4
        0x1c
        0x4
        0x10
    .end array-data

    :array_2
    .array-data 4
        0x2d
        0x36
        0x58
        0x68
        0x64
        0x64
        0x8
        0x1c
        0x8
        0x18
    .end array-data

    :array_3
    .array-data 4
        0x42
        0x4f
        0x4e
        0x73
        0x64
        0x76
        0xe
        0x2a
        0xa
        0x18
    .end array-data

    :array_4
    .array-data 4
        0x63
        0x78
        0x48
        0x8c
        0x6e
        0x91
        0x21
        0x3a
        0x10
        0x20
    .end array-data

    :array_5
    .array-data 4
        0x82
        0xa5
        0x44
        0x9b
        0x76
        0xa5
        0x39
        0x3a
        0x10
        0x20
    .end array-data

    :array_6
    .array-data 4
        0x1b
        0x22
        0x56
        0x5a
        0x64
        0x5a
        0x5
        0x1c
        0x8
        0x18
    .end array-data

    :array_7
    .array-data 4
        0x2b
        0x34
        0x48
        0x64
        0x64
        0x69
        0xa
        0x2a
        0xa
        0x18
    .end array-data

    :array_8
    .array-data 4
        0x3e
        0x4c
        0x3c
        0x6e
        0x6e
        0x7a
        0x19
        0x3a
        0x10
        0x20
    .end array-data

    :array_9
    .array-data 4
        0x22
        0x25
        0x52
        0x5a
        0x5f
        0x5f
        0x4
        0x1c
        0x4
        0x10
    .end array-data

    :array_a
    .array-data 4
        0x29
        0x31
        0x58
        0x64
        0x64
        0x60
        0x8
        0x1c
        0x8
        0x18
    .end array-data

    :array_b
    .array-data 4
        0x3d
        0x48
        0x4e
        0x6e
        0x64
        0x70
        0xe
        0x2a
        0xa
        0x18
    .end array-data

    :array_c
    .array-data 4
        0x5a
        0x6c
        0x48
        0x84
        0x6e
        0x88
        0x21
        0x3a
        0x10
        0x20
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static accent(Landroid/content/Context;)I
    .registers 7

    const/4 v0, 0x1

    .line 126
    :try_start_0
    const-string v1, "e.e.a.UiDialogs"

    const-string v2, "accent"

    new-array v3, v0, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Le/e/a/Dev112;->staticCall(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 128
    :catch_0
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 129
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p0

    const v2, 0x1010435

    invoke-virtual {p0, v2, v1, v0}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    iget p0, v1, Landroid/util/TypedValue;->data:I

    goto :goto_0

    :cond_0
    const/4 p0, -0x1

    :goto_0
    return p0
.end method

.method static synthetic access$0(Landroid/view/View;)Le/e/a/AmbientLight$Layer;
    .registers 1

    .line 247
    invoke-static {p0}, Le/e/a/AmbientLight;->layer(Landroid/view/View;)Le/e/a/AmbientLight$Layer;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1()Landroid/os/Handler;
    .registers 1

    .line 69
    sget-object v0, Le/e/a/AmbientLight;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$2(Ljava/lang/Object;Landroid/view/View;)Landroid/view/View;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 222
    invoke-static {p0, p1}, Le/e/a/AmbientLight;->video(Ljava/lang/Object;Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3(Landroid/view/View;Landroid/view/View;I)Le/e/a/AmbientLight$Layer;
    .registers 3

    .line 252
    invoke-static {p0, p1, p2}, Le/e/a/AmbientLight;->bind(Landroid/view/View;Landroid/view/View;I)Le/e/a/AmbientLight$Layer;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4(Landroid/view/View;F)I
    .registers 2

    .line 262
    invoke-static {p0, p1}, Le/e/a/AmbientLight;->dp(Landroid/view/View;F)I

    move-result p0

    return p0
.end method

.method static synthetic access$5(Landroid/view/View;)Landroid/view/View;
    .registers 1

    .line 266
    invoke-static {p0}, Le/e/a/AmbientLight;->source(Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$6(Landroid/graphics/Bitmap;Landroid/graphics/Rect;II[I)I
    .registers 5

    .line 1183
    invoke-static {p0, p1, p2, p3, p4}, Le/e/a/AmbientLight;->edgeColor(Landroid/graphics/Bitmap;Landroid/graphics/Rect;II[I)I

    move-result p0

    return p0
.end method

.method static synthetic access$7(III)I
    .registers 3

    .line 1223
    invoke-static {p0, p1, p2}, Le/e/a/AmbientLight;->blend(III)I

    move-result p0

    return p0
.end method

.method static adjust(I[I)I
    .registers 9

    .line 1210
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    const v2, 0x3e59b3d0    # 0.2126f

    int-to-float v3, v0

    mul-float/2addr v3, v2

    const v2, 0x3f371759    # 0.7152f

    int-to-float v4, v1

    mul-float/2addr v4, v2

    add-float/2addr v3, v4

    const v2, 0x3d93dd98    # 0.0722f

    int-to-float v4, p0

    mul-float/2addr v4, v2

    add-float/2addr v3, v4

    .line 1212
    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    sub-int/2addr v2, v4

    int-to-float v2, v2

    const/high16 v4, 0x437f0000    # 255.0f

    div-float/2addr v2, v4

    const/4 v4, 0x5

    .line 1213
    aget v4, p1, v4

    int-to-float v4, v4

    const/high16 v5, 0x42c80000    # 100.0f

    div-float/2addr v4, v5

    const/4 v5, 0x6

    aget v5, p1, v5

    int-to-float v5, v5

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float/2addr v6, v2

    mul-float/2addr v5, v6

    const/high16 v2, 0x43200000    # 160.0f

    div-float/2addr v5, v2

    add-float/2addr v4, v5

    .line 1214
    invoke-static {v0, v3, v4, p1}, Le/e/a/AmbientLight;->channel(IFF[I)I

    move-result v0

    .line 1215
    invoke-static {v1, v3, v4, p1}, Le/e/a/AmbientLight;->channel(IFF[I)I

    move-result v1

    invoke-static {p0, v3, v4, p1}, Le/e/a/AmbientLight;->channel(IFF[I)I

    move-result p0

    .line 1214
    invoke-static {v0, v1, p0}, Landroid/graphics/Color;->rgb(III)I

    move-result p0

    return p0
.end method

.method private static append([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 5

    .line 102
    array-length v0, p0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x2

    .line 103
    array-length v2, p0

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x0

    .line 104
    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 105
    aput-object p1, v0, v1

    add-int/lit8 p1, v1, 0x1

    .line 106
    array-length v2, p0

    sub-int/2addr v2, v1

    invoke-static {p0, v1, v0, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method public static appendId([Ljava/lang/String;)[Ljava/lang/String;
    .registers 2

    .line 98
    const-string v0, "ambient"

    invoke-static {p0, v0}, Le/e/a/AmbientLight;->append([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static appendLabel([Ljava/lang/String;)[Ljava/lang/String;
    .registers 2

    .line 99
    const-string v0, "\u30a2\u30f3\u30d3\u30a8\u30f3\u30c8\u30e2\u30fc\u30c9"

    invoke-static {p0, v0}, Le/e/a/AmbientLight;->append([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static appliesTo(Landroid/content/SharedPreferences;I)Z
    .registers 4

    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "nicoid_ambient_mode_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    if-eq p1, v1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private static bind(Landroid/view/View;Landroid/view/View;I)Le/e/a/AmbientLight$Layer;
    .registers 5

    .line 253
    invoke-static {p0}, Le/e/a/AmbientLight;->layer(Landroid/view/View;)Le/e/a/AmbientLight$Layer;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 254
    iget-object v1, v0, Le/e/a/AmbientLight$Layer;->video:Landroid/view/View;

    if-eq v1, p1, :cond_0

    .line 255
    invoke-virtual {v0}, Le/e/a/AmbientLight$Layer;->dispose()V

    goto :goto_0

    :cond_0
    return-object v0

    .line 256
    :cond_1
    :goto_0
    new-instance v0, Le/e/a/AmbientLight$Layer;

    invoke-direct {v0, p0, p1, p2}, Le/e/a/AmbientLight$Layer;-><init>(Landroid/view/View;Landroid/view/View;I)V

    .line 257
    sget-object p1, Le/e/a/AmbientLight;->LAYERS:Ljava/util/WeakHashMap;

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, p0, p2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private static blend(III)I
    .registers 6

    .line 1224
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-static {v0, v1, p2}, Le/e/a/AmbientLight;->mix(III)I

    move-result v0

    .line 1225
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v2

    invoke-static {v1, v2, p2}, Le/e/a/AmbientLight;->mix(III)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    invoke-static {p0, p1, p2}, Le/e/a/AmbientLight;->mix(III)I

    move-result p0

    .line 1224
    invoke-static {v0, v1, p0}, Landroid/graphics/Color;->rgb(III)I

    move-result p0

    return p0
.end method

.method private static channel(IFF[I)I
    .registers 5

    int-to-float p0, p0

    sub-float/2addr p0, p1

    mul-float/2addr p0, p2

    add-float/2addr p1, p0

    const/4 p0, 0x3

    .line 1219
    aget p0, p3, p0

    int-to-float p0, p0

    mul-float/2addr p1, p0

    const/high16 p0, 0x42c80000    # 100.0f

    div-float/2addr p1, p0

    const/high16 p2, 0x43000000    # 128.0f

    sub-float/2addr p1, p2

    const/4 v0, 0x4

    .line 1220
    aget p3, p3, v0

    int-to-float p3, p3

    mul-float/2addr p1, p3

    div-float/2addr p1, p0

    add-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    const/16 p1, 0xff

    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 p1, 0x0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private static darkMargin(Landroid/graphics/Bitmap;I)I
    .registers 8

    .line 1162
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    add-int/lit8 v1, v0, -0x2

    .line 1164
    div-int/lit8 v1, v1, 0xc

    const/4 v2, 0x0

    move v3, v2

    .line 1165
    :goto_0
    div-int/lit8 v4, v0, 0x4

    if-gt v3, v4, :cond_0

    const/16 v5, 0x10

    invoke-static {p0, p1, v3, v5}, Le/e/a/AmbientLight;->litPixels(Landroid/graphics/Bitmap;III)I

    move-result v5

    if-gt v5, v1, :cond_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    if-eqz v3, :cond_1

    if-gt v3, v4, :cond_1

    .line 1167
    div-int/lit8 v0, v0, 0x5

    const/4 v1, 0x2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v1, 0x20

    .line 1168
    invoke-static {p0, p1, v3, v1}, Le/e/a/AmbientLight;->litPixels(Landroid/graphics/Bitmap;III)I

    move-result v4

    if-lt v4, v0, :cond_1

    add-int/lit8 v4, v3, 0x1

    .line 1169
    invoke-static {p0, p1, v4, v1}, Le/e/a/AmbientLight;->litPixels(Landroid/graphics/Bitmap;III)I

    move-result p0

    if-lt p0, v0, :cond_1

    return v3

    :cond_1
    return v2
.end method

.method private static dp(Landroid/view/View;F)I
    .registers 2

    .line 263
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private static edgeColor(Landroid/graphics/Bitmap;Landroid/graphics/Rect;II[I)I
    .registers 22

    move-object/from16 v0, p1

    move/from16 v1, p2

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    .line 1184
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    :goto_0
    if-ge v1, v2, :cond_1

    .line 1185
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v4

    :goto_1
    const/4 v5, 0x0

    move v6, v5

    move v7, v6

    move v8, v7

    move v9, v8

    :goto_2
    const/4 v10, 0x3

    if-lt v5, v10, :cond_3

    if-nez v6, :cond_2

    const/high16 v0, -0x1000000

    return v0

    .line 1203
    :cond_2
    div-int/2addr v7, v6

    .line 1204
    div-int/2addr v8, v6

    .line 1205
    div-int/2addr v9, v6

    .line 1206
    invoke-static {v7, v8, v9}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    move-object/from16 v11, p4

    invoke-static {v0, v11}, Le/e/a/AmbientLight;->adjust(I[I)I

    move-result v0

    return v0

    :cond_3
    if-ge v1, v2, :cond_4

    .line 1188
    iget v12, v0, Landroid/graphics/Rect;->left:I

    goto :goto_3

    :cond_4
    iget v12, v0, Landroid/graphics/Rect;->top:I

    :goto_3
    mul-int/lit8 v13, p3, 0x3

    add-int/2addr v13, v5

    mul-int/2addr v13, v3

    const/16 v14, 0xc

    .line 1189
    div-int/2addr v13, v14

    add-int/2addr v12, v13

    const/4 v13, 0x1

    move v15, v13

    :goto_4
    if-le v15, v10, :cond_5

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_5
    mul-int v16, v15, v4

    .line 1191
    div-int/lit8 v16, v16, 0x10

    if-ne v1, v2, :cond_6

    .line 1192
    iget v2, v0, Landroid/graphics/Rect;->left:I

    add-int v2, v2, v16

    goto :goto_5

    :cond_6
    if-ne v1, v10, :cond_7

    iget v2, v0, Landroid/graphics/Rect;->right:I

    sub-int/2addr v2, v13

    sub-int v2, v2, v16

    goto :goto_5

    :cond_7
    move v2, v12

    :goto_5
    if-nez v1, :cond_8

    .line 1193
    iget v10, v0, Landroid/graphics/Rect;->top:I

    add-int v10, v10, v16

    :goto_6
    move-object/from16 v13, p0

    goto :goto_7

    :cond_8
    if-ne v1, v13, :cond_9

    iget v10, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v10, v13

    sub-int v10, v10, v16

    goto :goto_6

    :cond_9
    move-object/from16 v13, p0

    move v10, v12

    .line 1194
    :goto_7
    invoke-virtual {v13, v2, v10}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v2

    .line 1195
    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v10

    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v14

    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    invoke-static {v14, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v10, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v10, 0xc

    if-lt v0, v10, :cond_a

    .line 1196
    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v0

    add-int/2addr v7, v0

    .line 1197
    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v0

    add-int/2addr v8, v0

    .line 1198
    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    add-int/2addr v9, v0

    add-int/lit8 v6, v6, 0x1

    :cond_a
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p1

    const/4 v2, 0x2

    const/4 v10, 0x3

    const/4 v13, 0x1

    goto :goto_4
.end method

.method static enabled(Landroid/content/SharedPreferences;)Z
    .registers 3

    .line 79
    const-string v0, "nicoid_ambient_enabled"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static foreground(Ljava/lang/Object;Landroid/view/View;Landroid/widget/LinearLayout;)V
    .registers 7

    .line 196
    const-string v0, "player-ambient"

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_0

    .line 197
    new-instance v1, Le/e/a/AmbientLight$Toggle;

    invoke-direct {v1, p1}, Le/e/a/AmbientLight$Toggle;-><init>(Landroid/view/View;)V

    .line 198
    invoke-virtual {v1, v0}, Le/e/a/AmbientLight$Toggle;->setTag(Ljava/lang/Object;)V

    const/16 v0, 0x8

    .line 199
    invoke-virtual {v1, v0}, Le/e/a/AmbientLight$Toggle;->setVisibility(I)V

    .line 200
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x42100000    # 36.0f

    invoke-static {p1, v2}, Le/e/a/AmbientLight;->dp(Landroid/view/View;F)I

    move-result v3

    invoke-static {p1, v2}, Le/e/a/AmbientLight;->dp(Landroid/view/View;F)I

    move-result v2

    invoke-direct {v0, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 203
    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Le/e/a/AmbientLight;->video(Ljava/lang/Object;Landroid/view/View;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_1

    const/4 p2, 0x0

    .line 204
    invoke-static {p1, p0, p2}, Le/e/a/AmbientLight;->bind(Landroid/view/View;Landroid/view/View;I)Le/e/a/AmbientLight$Layer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    return-void
.end method

.method public static fullscreen(Landroid/view/View;Landroid/view/View;)V
    .registers 5

    if-eqz p0, :cond_1

    if-eqz p1, :cond_1

    .line 232
    invoke-static {p0}, Le/e/a/AmbientLight;->layer(Landroid/view/View;)Le/e/a/AmbientLight$Layer;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 235
    :try_start_0
    invoke-static {v1, p0}, Le/e/a/AmbientLight;->video(Ljava/lang/Object;Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v2, 0x0

    .line 236
    invoke-static {p0, v1, v2}, Le/e/a/AmbientLight;->bind(Landroid/view/View;Landroid/view/View;I)Le/e/a/AmbientLight$Layer;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    if-eqz v0, :cond_1

    const/4 p0, 0x1

    .line 239
    invoke-virtual {v0, p0, p1}, Le/e/a/AmbientLight$Layer;->mode(ILandroid/view/View;)V

    :cond_1
    return-void
.end method

.method private static layer(Landroid/view/View;)Le/e/a/AmbientLight$Layer;
    .registers 2

    .line 248
    sget-object v0, Le/e/a/AmbientLight;->LAYERS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/ref/WeakReference;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 249
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/AmbientLight$Layer;

    return-object p0
.end method

.method private static litPixels(Landroid/graphics/Bitmap;III)I
    .registers 11

    .line 1173
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    move v3, v2

    :goto_0
    add-int/lit8 v4, v0, -0x1

    if-lt v3, v4, :cond_0

    return v1

    :cond_0
    const/4 v5, 0x2

    if-ne p1, v5, :cond_1

    move v5, p2

    goto :goto_1

    :cond_1
    const/4 v5, 0x3

    if-ne p1, v5, :cond_2

    sub-int v5, v4, p2

    goto :goto_1

    :cond_2
    move v5, v3

    :goto_1
    if-nez p1, :cond_3

    move v4, p2

    goto :goto_2

    :cond_3
    if-ne p1, v2, :cond_4

    sub-int/2addr v4, p2

    goto :goto_2

    :cond_4
    move v4, v3

    .line 1177
    :goto_2
    invoke-virtual {p0, v5, v4}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v4

    .line 1178
    invoke-static {v4}, Landroid/graphics/Color;->red(I)I

    move-result v5

    invoke-static {v4}, Landroid/graphics/Color;->green(I)I

    move-result v6

    invoke-static {v4}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    if-lt v4, p3, :cond_5

    add-int/lit8 v1, v1, 0x1

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private static mix(III)I
    .registers 4

    int-to-float v0, p0

    sub-int/2addr p1, p0

    mul-int/2addr p1, p2

    int-to-float p0, p1

    const/high16 p1, 0x42c80000    # 100.0f

    div-float/2addr p0, p1

    add-float/2addr v0, p0

    .line 1229
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public static popup(Ljava/lang/Object;)V
    .registers 6

    .line 211
    :try_start_0
    const-string v0, "root"

    invoke-static {p0, v0}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 212
    const-string v1, "video"

    invoke-static {p0, v1}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 213
    const-string v2, "buttons"

    invoke-static {p0, v2}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    .line 214
    new-instance v2, Le/e/a/AmbientLight$Toggle;

    invoke-direct {v2, v0}, Le/e/a/AmbientLight$Toggle;-><init>(Landroid/view/View;)V

    const/high16 v3, 0x42000000    # 32.0f

    .line 215
    invoke-static {v0, v3}, Le/e/a/AmbientLight;->dp(Landroid/view/View;F)I

    move-result v3

    .line 216
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4}, Le/e/a/AmbientLight$Toggle;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 217
    const-string v3, "ambient"

    invoke-interface {p0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v1, :cond_0

    const/4 p0, 0x2

    .line 218
    invoke-static {v0, v1, p0}, Le/e/a/AmbientLight;->bind(Landroid/view/View;Landroid/view/View;I)Le/e/a/AmbientLight$Layer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 1

    .line 75
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static resetHidden(Ljava/util/Set;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 118
    const-string v0, "ambient"

    invoke-interface {p0, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public static restore(Landroid/view/View;)V
    .registers 3

    .line 243
    invoke-static {p0}, Le/e/a/AmbientLight;->layer(Landroid/view/View;)Le/e/a/AmbientLight$Layer;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 244
    invoke-virtual {v0, v1, p0}, Le/e/a/AmbientLight$Layer;->mode(ILandroid/view/View;)V

    :cond_0
    return-void
.end method

.method private static source(Landroid/view/View;)Landroid/view/View;
    .registers 4

    .line 267
    instance-of v0, p0, Landroid/view/TextureView;

    if-nez v0, :cond_2

    instance-of v0, p0, Landroid/view/SurfaceView;

    if-nez v0, :cond_2

    .line 268
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    .line 269
    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    .line 270
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 271
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/AmbientLight;->source(Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 272
    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :cond_2
    return-object p0
.end method

.method static title(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 121
    const-string v0, "Ambient mode"

    const-string/jumbo v1, "\u74b0\u5883\u5149\u6a21\u5f0f"

    const-string v2, "\u30a2\u30f3\u30d3\u30a8\u30f3\u30c8\u30e2\u30fc\u30c9"

    invoke-static {p0, v2, v0, v1}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static values(Landroid/content/SharedPreferences;)[I
    .registers 8

    .line 87
    sget-object v0, Le/e/a/AmbientLight;->PRESETS:[[I

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x0

    move v2, v1

    .line 88
    :goto_0
    array-length v3, v0

    if-lt v2, v3, :cond_2

    .line 92
    :goto_1
    sget-object p0, Le/e/a/AmbientLight;->PREVIOUS_PRESETS:[[I

    array-length v2, p0

    if-lt v1, v2, :cond_0

    return-object v0

    .line 93
    :cond_0
    aget-object p0, p0, v1

    invoke-static {v0, p0}, Ljava/util/Arrays;->equals([I[I)Z

    move-result p0

    if-eqz p0, :cond_1

    sget-object p0, Le/e/a/AmbientLight;->PRESETS:[[I

    rem-int/lit8 v1, v1, 0x4

    aget-object p0, p0, v1

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    return-object p0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 89
    :cond_2
    sget-object v3, Le/e/a/AmbientLight;->MIN:[I

    aget v3, v3, v2

    sget-object v4, Le/e/a/AmbientLight;->MAX:[I

    aget v4, v4, v2

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "nicoid_ambient_"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v6, Le/e/a/AmbientLight;->KEYS:[Ljava/lang/String;

    aget-object v6, v6, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aget v6, v0, v2

    invoke-interface {p0, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    aput v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static video(Ljava/lang/Object;Landroid/view/View;)Landroid/view/View;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 223
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "video"

    const-string v3, "id"

    invoke-virtual {v0, v2, v3, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 224
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    goto :goto_0

    :cond_0
    move-object p1, v1

    :goto_0
    if-eqz p1, :cond_1

    return-object p1

    :cond_1
    if-nez p0, :cond_2

    move-object p0, v1

    goto :goto_1

    .line 226
    :cond_2
    const-string p1, "a0"

    invoke-static {p0, p1}, Le/e/a/Dev112;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 227
    :goto_1
    instance-of p1, p0, Landroid/view/View;

    if-eqz p1, :cond_3

    check-cast p0, Landroid/view/View;

    return-object p0

    :cond_3
    return-object v1
.end method
