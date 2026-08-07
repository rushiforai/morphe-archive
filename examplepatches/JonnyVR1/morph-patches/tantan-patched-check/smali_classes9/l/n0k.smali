.class public Ll/n0k;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Landroid/graphics/drawable/GradientDrawable;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    const/high16 v0, 0x40800000    # 4.0f

    .line 18
    .line 19
    :try_start_0
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-float v0, v0

    .line 24
    const/16 v1, 0x8

    .line 25
    .line 26
    new-array v1, v1, [F

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    aput v0, v1, v2

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    aput v0, v1, v3

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    aput v0, v1, v3

    .line 36
    .line 37
    const/4 v3, 0x3

    .line 38
    aput v0, v1, v3

    .line 39
    .line 40
    const/4 v3, 0x4

    .line 41
    aput v0, v1, v3

    .line 42
    .line 43
    const/4 v3, 0x5

    .line 44
    aput v0, v1, v3

    .line 45
    .line 46
    const/4 v3, 0x6

    .line 47
    aput v0, v1, v3

    .line 48
    .line 49
    const/4 v3, 0x7

    .line 50
    aput v0, v1, v3

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    .line 55
    .line 56
    .line 57
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    const/16 v3, 0x23

    .line 59
    .line 60
    const-string v4, "#"

    .line 61
    .line 62
    if-ne v0, v3, :cond_0

    .line 63
    .line 64
    :try_start_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    :goto_0
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-ne v2, v3, :cond_1

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    :goto_1
    invoke-static {v0, p0, v1}, Ll/n0k;->b(Ljava/lang/String;Ljava/lang/String;[F)Landroid/graphics/drawable/GradientDrawable;

    .line 107
    .line 108
    .line 109
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 110
    return-object p0

    .line 111
    :catch_0
    move-exception p0

    .line 112
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    :cond_2
    const/4 p0, 0x0

    .line 116
    return-object p0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;[F)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    filled-new-array {p0, p1}, [I

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 26
    .line 27
    .line 28
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Landroid/graphics/drawable/GradientDrawable;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    const/high16 v0, 0x40800000    # 4.0f

    .line 18
    .line 19
    :try_start_0
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-float v0, v0

    .line 24
    const/16 v1, 0x8

    .line 25
    .line 26
    new-array v1, v1, [F

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    aput v0, v1, v2

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    aput v0, v1, v3

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    aput v0, v1, v3

    .line 36
    .line 37
    const/4 v3, 0x3

    .line 38
    aput v0, v1, v3

    .line 39
    .line 40
    const/4 v3, 0x4

    .line 41
    aput v0, v1, v3

    .line 42
    .line 43
    const/4 v3, 0x5

    .line 44
    aput v0, v1, v3

    .line 45
    .line 46
    const/4 v3, 0x6

    .line 47
    aput v0, v1, v3

    .line 48
    .line 49
    const/4 v3, 0x7

    .line 50
    aput v0, v1, v3

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    .line 55
    .line 56
    .line 57
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    const/16 v3, 0x23

    .line 59
    .line 60
    const-string v4, "#"

    .line 61
    .line 62
    if-ne v0, v3, :cond_0

    .line 63
    .line 64
    :try_start_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    :goto_0
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-ne v2, v3, :cond_1

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    :goto_1
    invoke-static {v0, p0, v1}, Ll/n0k;->b(Ljava/lang/String;Ljava/lang/String;[F)Landroid/graphics/drawable/GradientDrawable;

    .line 107
    .line 108
    .line 109
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 110
    return-object p0

    .line 111
    :catch_0
    move-exception p0

    .line 112
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    :cond_2
    const/4 p0, 0x0

    .line 116
    return-object p0
.end method

.method public static d(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    const-string v0, "975MaruSC-Medium.ttf"

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/n0k;->f(Landroid/widget/TextView;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static e(Landroid/widget/TextView;Landroid/graphics/Typeface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f(Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, p1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static g(Landroid/content/Context;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-string v0, "vibrator"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Landroid/os/Vibrator;

    .line 11
    .line 12
    if-eqz p0, :cond_2

    .line 13
    .line 14
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 15
    .line 16
    const/16 v1, 0x1a

    .line 17
    .line 18
    const-wide/16 v2, 0x32

    .line 19
    .line 20
    if-lt v0, v1, :cond_1

    .line 21
    .line 22
    const/16 v0, 0x64

    .line 23
    .line 24
    invoke-static {v2, v3, v0}, Ll/cm3;->a(JI)Landroid/os/VibrationEffect;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p0, v0}, Ll/dm3;->a(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-virtual {p0, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 33
    .line 34
    .line 35
    :cond_2
    :goto_0
    return-void
.end method
