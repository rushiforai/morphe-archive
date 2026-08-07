.class public Ll/ln4;
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

.method public static a(Ll/vak0;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->enableNewPrivilege:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static b(Ll/vak0;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->enableNewPrivilege:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static c(Ll/vak0;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;ZZJJ)V
    .locals 3

    .line 1
    invoke-static {}, Ll/i9n;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    if-eqz p0, :cond_5

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_5

    .line 16
    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    invoke-static {p0}, Ll/ln4;->b(Ll/vak0;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-static {p0}, Ll/ln4;->a(Ll/vak0;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    :goto_0
    const/4 v1, 0x0

    .line 29
    if-eqz p3, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->turnEffect:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-nez v2, :cond_3

    .line 42
    .line 43
    :goto_1
    move v1, v0

    .line 44
    goto :goto_2

    .line 45
    :cond_2
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->openEffect:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_3

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    :goto_2
    if-eqz p2, :cond_5

    .line 59
    .line 60
    if-eqz v1, :cond_5

    .line 61
    .line 62
    if-eqz p3, :cond_4

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->turnEffect:Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_3

    .line 71
    :cond_4
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->openEffect:Ljava/lang/String;

    .line 76
    .line 77
    :goto_3
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_5
    const-wide/16 v1, 0x0

    .line 82
    .line 83
    cmp-long p0, p4, v1

    .line 84
    .line 85
    if-nez p0, :cond_7

    .line 86
    .line 87
    if-eqz p3, :cond_6

    .line 88
    .line 89
    const-string p0, "https://auto.tancdn.com/v1/raw/81a73e1a-7d60-4bc0-891d-48bf7e68419610.pdf"

    .line 90
    .line 91
    goto :goto_4

    .line 92
    :cond_6
    const-string p0, "https://auto.tancdn.com/v1/raw/24311607-0c58-49d2-858b-96a481f33c6911.pdf"

    .line 93
    .line 94
    goto :goto_4

    .line 95
    :cond_7
    cmp-long p0, p6, v1

    .line 96
    .line 97
    if-ltz p0, :cond_9

    .line 98
    .line 99
    if-eqz p3, :cond_8

    .line 100
    .line 101
    const-string p0, "https://auto.tancdn.com/v1/raw/7320cd6c-1be3-4f9f-b153-c63ac5ec91e111.pdf"

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_8
    const-string p0, "https://auto.tancdn.com/v1/raw/140f3c16-81ea-4681-ba27-d3bf722a291c11.pdf"

    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_9
    if-eqz p3, :cond_a

    .line 108
    .line 109
    const-string p0, "https://auto.tancdn.com/v1/raw/abac945c-3e7f-4b82-b505-baa370fdd5f211.pdf"

    .line 110
    .line 111
    goto :goto_4

    .line 112
    :cond_a
    const-string p0, "https://auto.tancdn.com/v1/raw/09f6502c-a77f-485f-bc1f-282d39a43cab11.pdf"

    .line 113
    .line 114
    :goto_4
    if-eqz p3, :cond_b

    .line 115
    .line 116
    goto :goto_5

    .line 117
    :cond_b
    const/4 v0, 0x2

    .line 118
    :goto_5
    const/4 p2, 0x0

    .line 119
    invoke-virtual {p1, p0, v0, p2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static d(IZLandroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v0, 0x41300000    # 11.0f

    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static e(Ljava/lang/String;ZLandroid/view/View;)V
    .locals 0

    .line 1
    const/16 p1, 0xb

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/gc2;->b(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static f(Ll/vak0;ZJLandroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Ll/ln4;->b(Ll/vak0;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p0}, Ll/ln4;->a(Ll/vak0;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    :goto_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->progressColor:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->progressColor:Ljava/lang/String;

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-static {p0, p1, p4}, Ll/ln4;->e(Ljava/lang/String;ZLandroid/view/View;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    const-wide/16 p0, 0x0

    .line 38
    .line 39
    cmp-long p0, p2, p0

    .line 40
    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    sget p0, Ll/n9c0;->s:I

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    const-wide/16 p0, 0x5

    .line 47
    .line 48
    cmp-long p0, p2, p0

    .line 49
    .line 50
    if-gez p0, :cond_3

    .line 51
    .line 52
    sget p0, Ll/n9c0;->G:I

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_3
    const-wide/16 p0, 0xa

    .line 56
    .line 57
    cmp-long p0, p2, p0

    .line 58
    .line 59
    if-gez p0, :cond_4

    .line 60
    .line 61
    sget p0, Ll/n9c0;->Z:I

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_4
    const-wide/16 p0, 0x14

    .line 65
    .line 66
    cmp-long p0, p2, p0

    .line 67
    .line 68
    if-gez p0, :cond_5

    .line 69
    .line 70
    sget p0, Ll/n9c0;->j0:I

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_5
    const-wide/16 p0, 0x19

    .line 74
    .line 75
    cmp-long p0, p2, p0

    .line 76
    .line 77
    if-gez p0, :cond_6

    .line 78
    .line 79
    sget p0, Ll/n9c0;->E0:I

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_6
    const-wide/16 p0, 0x1e

    .line 83
    .line 84
    cmp-long p0, p2, p0

    .line 85
    .line 86
    if-gez p0, :cond_7

    .line 87
    .line 88
    sget p0, Ll/n9c0;->B0:I

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_7
    const-wide/16 p0, 0x23

    .line 92
    .line 93
    cmp-long p0, p2, p0

    .line 94
    .line 95
    if-gez p0, :cond_8

    .line 96
    .line 97
    sget p0, Ll/n9c0;->x0:I

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_8
    sget p0, Ll/n9c0;->t0:I

    .line 101
    .line 102
    :goto_1
    const/4 p1, 0x0

    .line 103
    invoke-static {p0, p1, p4}, Ll/ln4;->d(IZLandroid/view/View;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public static g(Ll/vak0;ZJLandroid/widget/TextView;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Ll/ln4;->b(Ll/vak0;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p0}, Ll/ln4;->a(Ll/vak0;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    :goto_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->gradeColor:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->gradeColor:Ljava/lang/String;

    .line 31
    .line 32
    sget p1, Ll/n9c0;->e:I

    .line 33
    .line 34
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-static {p0, p1}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p4, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    const-wide/16 p0, 0x0

    .line 47
    .line 48
    cmp-long p0, p2, p0

    .line 49
    .line 50
    if-nez p0, :cond_2

    .line 51
    .line 52
    sget p0, Ll/n9c0;->e1:I

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    const-wide/16 p0, 0x5

    .line 56
    .line 57
    cmp-long p0, p2, p0

    .line 58
    .line 59
    if-gez p0, :cond_3

    .line 60
    .line 61
    sget p0, Ll/n9c0;->T:I

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    const-wide/16 p0, 0xa

    .line 65
    .line 66
    cmp-long p0, p2, p0

    .line 67
    .line 68
    if-gez p0, :cond_4

    .line 69
    .line 70
    sget p0, Ll/n9c0;->k0:I

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_4
    const-wide/16 p0, 0x14

    .line 74
    .line 75
    cmp-long p0, p2, p0

    .line 76
    .line 77
    if-gez p0, :cond_5

    .line 78
    .line 79
    sget p0, Ll/n9c0;->V:I

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_5
    const-wide/16 p0, 0x1e

    .line 83
    .line 84
    cmp-long p0, p2, p0

    .line 85
    .line 86
    if-gez p0, :cond_6

    .line 87
    .line 88
    sget p0, Ll/n9c0;->I0:I

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_6
    sget p0, Ll/n9c0;->Q0:I

    .line 92
    .line 93
    :goto_1
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    invoke-virtual {p4, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public static h(Ll/vak0;ZLandroid/widget/TextView;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Ll/ln4;->b(Ll/vak0;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p0}, Ll/ln4;->a(Ll/vak0;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    :goto_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->gradeColor:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->gradeColor:Ljava/lang/String;

    .line 31
    .line 32
    sget p1, Ll/n9c0;->Q0:I

    .line 33
    .line 34
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    invoke-static {p0, p1}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    sget p0, Ll/n9c0;->Q0:I

    .line 47
    .line 48
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
