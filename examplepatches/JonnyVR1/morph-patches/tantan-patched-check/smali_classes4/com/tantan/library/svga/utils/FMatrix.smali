.class public final Lcom/tantan/library/svga/utils/FMatrix;
.super Landroid/graphics/Matrix;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0019\u0010\u0003\u001a\u00020\u00042\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0000\u00a2\u0006\u0002\u0008\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/tantan/library/svga/utils/FMatrix;",
        "Landroid/graphics/Matrix;",
        "()V",
        "transform",
        "",
        "it",
        "Lcom/tantan/library/svga/compose/proto/Transform;",
        "transform$svga_lib_release",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic transform$svga_lib_release$default(Lcom/tantan/library/svga/utils/FMatrix;Lcom/tantan/library/svga/compose/proto/Transform;ILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/utils/FMatrix;->transform$svga_lib_release(Lcom/tantan/library/svga/compose/proto/Transform;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final transform$svga_lib_release(Lcom/tantan/library/svga/compose/proto/Transform;)V
    .locals 9
    .param p1    # Lcom/tantan/library/svga/compose/proto/Transform;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object v1, p1, Lcom/tantan/library/svga/compose/proto/Transform;->a:Ljava/lang/Float;

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move-object v1, v0

    .line 8
    :goto_0
    const/high16 v2, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    move v1, v2

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    :goto_1
    if-eqz p1, :cond_2

    .line 19
    .line 20
    iget-object v3, p1, Lcom/tantan/library/svga/compose/proto/Transform;->c:Ljava/lang/Float;

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_2
    move-object v3, v0

    .line 24
    :goto_2
    const/4 v4, 0x0

    .line 25
    if-nez v3, :cond_3

    .line 26
    .line 27
    move v3, v4

    .line 28
    goto :goto_3

    .line 29
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    :goto_3
    if-eqz p1, :cond_4

    .line 34
    .line 35
    iget-object v5, p1, Lcom/tantan/library/svga/compose/proto/Transform;->tx:Ljava/lang/Float;

    .line 36
    .line 37
    goto :goto_4

    .line 38
    :cond_4
    move-object v5, v0

    .line 39
    :goto_4
    if-nez v5, :cond_5

    .line 40
    .line 41
    move v5, v4

    .line 42
    goto :goto_5

    .line 43
    :cond_5
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    :goto_5
    if-eqz p1, :cond_6

    .line 48
    .line 49
    iget-object v6, p1, Lcom/tantan/library/svga/compose/proto/Transform;->b:Ljava/lang/Float;

    .line 50
    .line 51
    goto :goto_6

    .line 52
    :cond_6
    move-object v6, v0

    .line 53
    :goto_6
    if-nez v6, :cond_7

    .line 54
    .line 55
    move v6, v4

    .line 56
    goto :goto_7

    .line 57
    :cond_7
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    :goto_7
    if-eqz p1, :cond_8

    .line 62
    .line 63
    iget-object v7, p1, Lcom/tantan/library/svga/compose/proto/Transform;->d:Ljava/lang/Float;

    .line 64
    .line 65
    goto :goto_8

    .line 66
    :cond_8
    move-object v7, v0

    .line 67
    :goto_8
    if-nez v7, :cond_9

    .line 68
    .line 69
    move v7, v2

    .line 70
    goto :goto_9

    .line 71
    :cond_9
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    .line 72
    .line 73
    .line 74
    move-result v7

    .line 75
    :goto_9
    if-eqz p1, :cond_a

    .line 76
    .line 77
    iget-object v0, p1, Lcom/tantan/library/svga/compose/proto/Transform;->ty:Ljava/lang/Float;

    .line 78
    .line 79
    :cond_a
    if-nez v0, :cond_b

    .line 80
    .line 81
    move p1, v4

    .line 82
    goto :goto_a

    .line 83
    :cond_b
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    :goto_a
    const/16 v0, 0x9

    .line 88
    .line 89
    new-array v0, v0, [F

    .line 90
    .line 91
    const/4 v8, 0x0

    .line 92
    aput v1, v0, v8

    .line 93
    .line 94
    const/4 v1, 0x1

    .line 95
    aput v3, v0, v1

    .line 96
    .line 97
    const/4 v1, 0x2

    .line 98
    aput v5, v0, v1

    .line 99
    .line 100
    const/4 v1, 0x3

    .line 101
    aput v6, v0, v1

    .line 102
    .line 103
    const/4 v1, 0x4

    .line 104
    aput v7, v0, v1

    .line 105
    .line 106
    const/4 v1, 0x5

    .line 107
    aput p1, v0, v1

    .line 108
    .line 109
    const/4 p1, 0x6

    .line 110
    aput v4, v0, p1

    .line 111
    .line 112
    const/4 p1, 0x7

    .line 113
    aput v4, v0, p1

    .line 114
    .line 115
    const/16 p1, 0x8

    .line 116
    .line 117
    aput v2, v0, p1

    .line 118
    .line 119
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->setValues([F)V

    .line 120
    .line 121
    .line 122
    return-void
.end method
