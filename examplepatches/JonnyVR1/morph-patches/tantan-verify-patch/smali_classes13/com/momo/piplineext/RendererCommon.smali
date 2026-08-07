.class public Lcom/momo/piplineext/RendererCommon;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/piplineext/RendererCommon$ScalingType;
    }
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 0

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

.method public static a([F)Landroid/graphics/Matrix;
    .locals 15

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    const/4 v2, 0x4

    .line 5
    aget v3, p0, v2

    .line 6
    .line 7
    const/16 v4, 0xc

    .line 8
    .line 9
    aget v4, p0, v4

    .line 10
    .line 11
    const/4 v5, 0x1

    .line 12
    aget v6, p0, v5

    .line 13
    .line 14
    const/4 v7, 0x5

    .line 15
    aget v8, p0, v7

    .line 16
    .line 17
    const/16 v9, 0xd

    .line 18
    .line 19
    aget v9, p0, v9

    .line 20
    .line 21
    const/4 v10, 0x3

    .line 22
    aget v11, p0, v10

    .line 23
    .line 24
    const/4 v12, 0x7

    .line 25
    aget v13, p0, v12

    .line 26
    .line 27
    const/16 v14, 0xf

    .line 28
    .line 29
    aget p0, p0, v14

    .line 30
    .line 31
    const/16 v14, 0x9

    .line 32
    .line 33
    new-array v14, v14, [F

    .line 34
    .line 35
    aput v1, v14, v0

    .line 36
    .line 37
    aput v3, v14, v5

    .line 38
    .line 39
    const/4 v0, 0x2

    .line 40
    aput v4, v14, v0

    .line 41
    .line 42
    aput v6, v14, v10

    .line 43
    .line 44
    aput v8, v14, v2

    .line 45
    .line 46
    aput v9, v14, v7

    .line 47
    .line 48
    const/4 v0, 0x6

    .line 49
    aput v11, v14, v0

    .line 50
    .line 51
    aput v13, v14, v12

    .line 52
    .line 53
    const/16 v0, 0x8

    .line 54
    .line 55
    aput p0, v14, v0

    .line 56
    .line 57
    new-instance p0, Landroid/graphics/Matrix;

    .line 58
    .line 59
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v14}, Landroid/graphics/Matrix;->setValues([F)V

    .line 63
    .line 64
    .line 65
    return-object p0
.end method
