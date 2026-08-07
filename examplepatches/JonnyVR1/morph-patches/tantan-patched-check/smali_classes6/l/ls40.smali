.class public Ll/ls40;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/view/View;Ljava/io/File;)Landroid/graphics/Bitmap;
    .locals 10

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/high16 p1, 0x41c80000    # 25.0f

    .line 10
    .line 11
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/high16 v0, 0x41a00000    # 20.0f

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const/high16 v0, 0x41700000    # 15.0f

    .line 22
    .line 23
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    const v8, 0x3efae148    # 0.49f

    .line 32
    .line 33
    .line 34
    const v9, 0x3f028f5c    # 0.51f

    .line 35
    .line 36
    .line 37
    const/4 v6, 0x0

    .line 38
    const/4 v7, 0x0

    .line 39
    move-object v0, p0

    .line 40
    invoke-static/range {v0 .. v9}, Ll/ps40;->i(Landroid/view/View;Landroid/graphics/Bitmap;IIIIFFFF)Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public static b(Landroid/view/View;Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V
    .locals 15

    .line 1
    sget-object v0, Ll/ls40;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    if-eqz p2, :cond_1

    .line 9
    .line 10
    sput-object p2, Ll/ls40;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 11
    .line 12
    move-object/from16 v0, p2

    .line 13
    .line 14
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x4

    .line 21
    const/4 v3, 0x3

    .line 22
    const/4 v4, 0x0

    .line 23
    if-lt v1, v2, :cond_2

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    move v7, v1

    .line 38
    goto :goto_0

    .line 39
    :cond_2
    move v7, v4

    .line 40
    :goto_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v2, 0x1

    .line 47
    if-lt v1, v2, :cond_3

    .line 48
    .line 49
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    goto :goto_1

    .line 62
    :cond_3
    move v1, v4

    .line 63
    :goto_1
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    const/4 v6, 0x2

    .line 70
    if-lt v5, v6, :cond_4

    .line 71
    .line 72
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    check-cast v2, Ljava/lang/Integer;

    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    move v9, v2

    .line 85
    goto :goto_2

    .line 86
    :cond_4
    move v9, v4

    .line 87
    :goto_2
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-lt v2, v3, :cond_5

    .line 94
    .line 95
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    check-cast v2, Ljava/lang/Integer;

    .line 102
    .line 103
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    :cond_5
    move v10, v4

    .line 108
    add-int/lit8 v8, v1, 0x14

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 111
    .line 112
    iget-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->start:J

    .line 113
    .line 114
    long-to-float v11, v1

    .line 115
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->end:J

    .line 116
    .line 117
    long-to-float v12, v0

    .line 118
    const/4 v13, 0x0

    .line 119
    const/4 v14, 0x0

    .line 120
    move-object v5, p0

    .line 121
    move-object/from16 v6, p1

    .line 122
    .line 123
    invoke-static/range {v5 .. v14}, Ll/ps40;->i(Landroid/view/View;Landroid/graphics/Bitmap;IIIIFFFF)Landroid/graphics/Bitmap;

    .line 124
    .line 125
    .line 126
    return-void
.end method
