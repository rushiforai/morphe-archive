.class public Ll/uzq0;
.super Ll/xzq0;
.source "SourceFile"


# instance fields
.field private m:Landroid/graphics/Bitmap;

.field private n:Landroid/graphics/Bitmap;

.field private o:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/xzq0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x1000000

    .line 5
    .line 6
    iput p1, p0, Ll/uzq0;->o:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public G(Landroid/graphics/Bitmap;)Ll/uzq0;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzq0;->y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x3d8

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    const/16 v0, 0xb8

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-gt v0, v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/16 v1, 0x68e

    .line 30
    .line 31
    if-gt v0, v1, :cond_0

    .line 32
    .line 33
    iput-object p1, p0, Ll/uzq0;->m:Landroid/graphics/Bitmap;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_0
    const-string p1, "colorful notification banner image resolution error, must belong to [984*184, 984*1678]"

    .line 37
    .line 38
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-object p0
.end method

.method public H(Ljava/lang/String;)Ll/uzq0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzq0;->y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    :try_start_0
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Ll/uzq0;->o:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    return-object p0

    .line 20
    :catch_0
    const-string p1, "parse banner notification image text color error"

    .line 21
    .line 22
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-object p0
.end method

.method public I(Landroid/graphics/Bitmap;)Ll/uzq0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzq0;->y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Ll/uzq0;->n:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public h()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/xzq0;->y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    iget-object v0, p0, Ll/uzq0;->m:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    invoke-super {p0}, Ll/xzq0;->h()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/vzq0;->c()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Ll/vzq0;->c()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "bg"

    .line 31
    .line 32
    const-string v3, "id"

    .line 33
    .line 34
    invoke-virtual {p0, v0, v2, v3, v1}, Ll/vzq0;->a(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {p0}, Ll/vzq0;->c()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-static {v4}, Ll/l4r0;->b(Landroid/content/Context;)I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    const/16 v5, 0xa

    .line 47
    .line 48
    if-lt v4, v5, :cond_0

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzq0;->l()Landroid/widget/RemoteViews;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    iget-object v5, p0, Ll/uzq0;->m:Landroid/graphics/Bitmap;

    .line 55
    .line 56
    const/high16 v6, 0x41f00000    # 30.0f

    .line 57
    .line 58
    invoke-virtual {p0, v5, v6}, Ll/xzq0;->k(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    invoke-virtual {v4, v2, v5}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    invoke-virtual {p0}, Ll/xzq0;->l()Landroid/widget/RemoteViews;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    iget-object v5, p0, Ll/uzq0;->m:Landroid/graphics/Bitmap;

    .line 71
    .line 72
    invoke-virtual {v4, v2, v5}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 73
    .line 74
    .line 75
    :goto_0
    const-string v2, "icon"

    .line 76
    .line 77
    invoke-virtual {p0, v0, v2, v3, v1}, Ll/vzq0;->a(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    iget-object v4, p0, Ll/uzq0;->n:Landroid/graphics/Bitmap;

    .line 82
    .line 83
    if-eqz v4, :cond_1

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/xzq0;->l()Landroid/widget/RemoteViews;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    iget-object v5, p0, Ll/uzq0;->n:Landroid/graphics/Bitmap;

    .line 90
    .line 91
    invoke-virtual {v4, v2, v5}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_1
    invoke-virtual {p0, v2}, Ll/xzq0;->r(I)V

    .line 96
    .line 97
    .line 98
    :goto_1
    const-string v2, "title"

    .line 99
    .line 100
    invoke-virtual {p0, v0, v2, v3, v1}, Ll/vzq0;->a(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-virtual {p0}, Ll/xzq0;->l()Landroid/widget/RemoteViews;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iget-object v2, p0, Ll/xzq0;->e:Ljava/lang/CharSequence;

    .line 109
    .line 110
    invoke-virtual {v1, v0, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    iget-object v1, p0, Ll/xzq0;->g:Ljava/util/Map;

    .line 114
    .line 115
    const/high16 v2, 0x1000000

    .line 116
    .line 117
    if-eqz v1, :cond_2

    .line 118
    .line 119
    iget v3, p0, Ll/uzq0;->o:I

    .line 120
    .line 121
    if-ne v3, v2, :cond_2

    .line 122
    .line 123
    const-string v3, "notification_image_text_color"

    .line 124
    .line 125
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    check-cast v1, Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p0, v1}, Ll/uzq0;->H(Ljava/lang/String;)Ll/uzq0;

    .line 132
    .line 133
    .line 134
    :cond_2
    invoke-virtual {p0}, Ll/xzq0;->l()Landroid/widget/RemoteViews;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    iget v3, p0, Ll/uzq0;->o:I

    .line 139
    .line 140
    if-eq v3, v2, :cond_3

    .line 141
    .line 142
    invoke-virtual {p0, v3}, Ll/xzq0;->u(I)Z

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    if-eqz v2, :cond_3

    .line 147
    .line 148
    const/high16 v2, -0x1000000

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_3
    const/4 v2, -0x1

    .line 152
    :goto_2
    invoke-virtual {v1, v0, v2}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Ll/xzq0;->l()Landroid/widget/RemoteViews;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p0, v0}, Ll/vzq0;->e(Landroid/widget/RemoteViews;)Ll/vzq0;

    .line 160
    .line 161
    .line 162
    new-instance v0, Landroid/os/Bundle;

    .line 163
    .line 164
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 165
    .line 166
    .line 167
    const-string v1, "miui.customHeight"

    .line 168
    .line 169
    const/4 v2, 0x1

    .line 170
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0, v0}, Ll/vzq0;->d(Landroid/os/Bundle;)Ll/vzq0;

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :cond_4
    invoke-virtual {p0}, Ll/xzq0;->x()V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "notification_banner"

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Landroid/graphics/Bitmap;)Ll/xzq0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public synthetic setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uzq0;->p(Landroid/graphics/Bitmap;)Ll/xzq0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public t()Z
    .locals 7

    .line 1
    invoke-static {}, Ll/l4r0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/vzq0;->c()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/vzq0;->c()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {p0}, Ll/vzq0;->c()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {p0}, Ll/vzq0;->c()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    const-string v5, "bg"

    .line 42
    .line 43
    const-string v6, "id"

    .line 44
    .line 45
    invoke-virtual {p0, v3, v5, v6, v4}, Ll/vzq0;->a(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const-string v4, "icon"

    .line 50
    .line 51
    invoke-virtual {p0, v0, v4, v6, v2}, Ll/vzq0;->a(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    const-string v5, "title"

    .line 56
    .line 57
    invoke-virtual {p0, v0, v5, v6, v2}, Ll/vzq0;->a(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v3, :cond_1

    .line 62
    .line 63
    if-eqz v4, :cond_1

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/vzq0;->c()Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Ll/l4r0;->b(Landroid/content/Context;)I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    const/16 v0, 0x9

    .line 76
    .line 77
    if-lt p0, v0, :cond_1

    .line 78
    .line 79
    const/4 p0, 0x1

    .line 80
    return p0

    .line 81
    :cond_1
    return v1
.end method

.method public v()Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
