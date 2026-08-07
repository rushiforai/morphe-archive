.class public final Ll/aeh0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003JQ\u0010\u0012\u001a\u00020\u00112\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\u000b2\u0010\u0008\u0002\u0010\u0010\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u000e\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J+\u0010\u0016\u001a\u0004\u0018\u00010\u00142\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u00142\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u0018"
    }
    d2 = {
        "Ll/aeh0;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/tantan/library/svga/compose/SVGADynamicEntity;",
        "entity",
        "",
        "url",
        "key",
        "",
        "newWidth",
        "newHeight",
        "Ll/y20;",
        "",
        "imageLoadCallback",
        "",
        "f",
        "(Lcom/p1/mobile/android/app/Act;Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Ljava/lang/String;IILl/y20;)V",
        "Landroid/graphics/Bitmap;",
        "bm",
        "e",
        "(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;",
        "b_core_base"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final INSTANCE:Ll/aeh0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/aeh0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/aeh0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/aeh0;->INSTANCE:Ll/aeh0;

    .line 7
    .line 8
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

.method public static a(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static b(Ljava/lang/String;IILl/gcg0;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 5
    .line 6
    new-instance v1, Ll/zdh0;

    .line 7
    .line 8
    invoke-direct {v1, p3, p1, p2}, Ll/zdh0;-><init>(Ll/gcg0;II)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->I(Ljava/lang/String;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static c(Ll/y20;Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-eqz p3, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1, p3, p2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    :goto_0
    if-nez p1, :cond_2

    .line 18
    .line 19
    :cond_1
    if-eqz p0, :cond_2

    .line 20
    .line 21
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 27
    .line 28
    :cond_2
    return-void
.end method

.method public static synthetic d(Ll/gcg0;IILandroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/aeh0;->h(Ll/gcg0;IILandroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic g(Ll/aeh0;Lcom/p1/mobile/android/app/Act;Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Ljava/lang/String;IILl/y20;ILjava/lang/Object;)V
    .locals 9

    .line 1
    and-int/lit8 v0, p8, 0x40

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    move-object v8, v0

    .line 7
    :goto_0
    move-object v1, p0

    .line 8
    move-object v2, p1

    .line 9
    move-object v3, p2

    .line 10
    move-object v4, p3

    .line 11
    move-object v5, p4

    .line 12
    move v6, p5

    .line 13
    move v7, p6

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    move-object/from16 v8, p7

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :goto_1
    invoke-virtual/range {v1 .. v8}, Ll/aeh0;->f(Lcom/p1/mobile/android/app/Act;Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Ljava/lang/String;IILl/y20;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static final h(Ll/gcg0;IILandroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    sget-object v0, Ll/aeh0;->INSTANCE:Ll/aeh0;

    .line 2
    .line 3
    invoke-virtual {v0, p3, p1, p2}, Ll/aeh0;->e(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final e(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez p0, :cond_1

    .line 14
    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    if-lez p2, :cond_1

    .line 18
    .line 19
    if-gtz p3, :cond_2

    .line 20
    .line 21
    :cond_1
    move-object v1, p1

    .line 22
    goto :goto_2

    .line 23
    :cond_2
    int-to-float v1, p0

    .line 24
    int-to-float v2, v0

    .line 25
    div-float/2addr v1, v2

    .line 26
    int-to-float v2, p2

    .line 27
    int-to-float v3, p3

    .line 28
    div-float/2addr v2, v3

    .line 29
    cmpl-float v1, v1, v2

    .line 30
    .line 31
    if-lez v1, :cond_3

    .line 32
    .line 33
    mul-int/2addr p2, v0

    .line 34
    div-int/2addr p2, p3

    .line 35
    move v4, p2

    .line 36
    move v5, v0

    .line 37
    goto :goto_0

    .line 38
    :cond_3
    mul-int/2addr p3, p0

    .line 39
    div-int/2addr p3, p2

    .line 40
    move v4, p0

    .line 41
    move v5, p3

    .line 42
    :goto_0
    const/4 p2, 0x0

    .line 43
    if-le p0, v4, :cond_4

    .line 44
    .line 45
    sub-int/2addr p0, v4

    .line 46
    div-int/lit8 p0, p0, 0x2

    .line 47
    .line 48
    move v2, p0

    .line 49
    goto :goto_1

    .line 50
    :cond_4
    move v2, p2

    .line 51
    :goto_1
    if-le v0, v5, :cond_5

    .line 52
    .line 53
    sub-int/2addr v0, v5

    .line 54
    div-int/lit8 p2, v0, 0x2

    .line 55
    .line 56
    :cond_5
    move v3, p2

    .line 57
    const/4 v6, 0x0

    .line 58
    const/4 v7, 0x0

    .line 59
    move-object v1, p1

    .line 60
    invoke-static/range {v1 .. v7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :goto_2
    return-object v1
.end method

.method public final f(Lcom/p1/mobile/android/app/Act;Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Ljava/lang/String;IILl/y20;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/compose/SVGADynamicEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/tantan/library/svga/compose/SVGADynamicEntity;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "II",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    new-instance p0, Ll/wdh0;

    .line 13
    .line 14
    invoke-direct {p0, p3, p5, p6}, Ll/wdh0;-><init>(Ljava/lang/String;II)V

    .line 15
    .line 16
    .line 17
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    new-instance p1, Ll/xdh0;

    .line 38
    .line 39
    invoke-direct {p1, p7, p2, p4}, Ll/xdh0;-><init>(Ll/y20;Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance p2, Ll/ydh0;

    .line 43
    .line 44
    invoke-direct {p2, p7}, Ll/ydh0;-><init>(Ll/y20;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method
