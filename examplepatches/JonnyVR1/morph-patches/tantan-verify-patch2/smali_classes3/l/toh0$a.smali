.class public Ll/toh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/toh0;->f(Lcom/p1/mobile/putong/data/PushMessage;Landroid/app/PendingIntent;Landroid/content/Intent;Landroidx/core/app/NotificationCompat$Action;Landroidx/core/app/NotificationCompat$Action;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/PushMessage;

.field public final synthetic e:Landroidx/core/app/NotificationCompat$Builder;

.field public final synthetic f:I

.field public final synthetic g:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Landroidx/core/app/NotificationCompat$Builder;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput p1, p0, Ll/toh0$a;->b:I

    .line 2
    .line 3
    iput-object p2, p0, Ll/toh0$a;->c:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/toh0$a;->d:Lcom/p1/mobile/putong/data/PushMessage;

    .line 6
    .line 7
    iput-object p4, p0, Ll/toh0$a;->e:Landroidx/core/app/NotificationCompat$Builder;

    .line 8
    .line 9
    iput p5, p0, Ll/toh0$a;->f:I

    .line 10
    .line 11
    iput-boolean p6, p0, Ll/toh0$a;->g:Z

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Ll/toh0$a;->a:Z

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/toh0$a;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    iget v0, p0, Ll/toh0$a;->b:I

    .line 6
    .line 7
    iget-object v1, p0, Ll/toh0$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    :cond_0
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "Meizu"

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-nez v3, :cond_2

    .line 25
    .line 26
    const-string v3, "Xiaomi"

    .line 27
    .line 28
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-instance v0, Landroidx/core/app/NotificationCompat$BigPictureStyle;

    .line 36
    .line 37
    invoke-direct {v0}, Landroidx/core/app/NotificationCompat$BigPictureStyle;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p1}, Landroidx/core/app/NotificationCompat$BigPictureStyle;->bigPicture(Landroid/graphics/Bitmap;)Landroidx/core/app/NotificationCompat$BigPictureStyle;

    .line 41
    .line 42
    .line 43
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    sget v2, Ll/cbc0;->h0:I

    .line 50
    .line 51
    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$BigPictureStyle;->bigLargeIcon(Landroid/graphics/Bitmap;)Landroidx/core/app/NotificationCompat$BigPictureStyle;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/toh0$a;->e:Landroidx/core/app/NotificationCompat$Builder;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/toh0$a;->d:Lcom/p1/mobile/putong/data/PushMessage;

    .line 64
    .line 65
    iget-object v1, p0, Ll/toh0$a;->e:Landroidx/core/app/NotificationCompat$Builder;

    .line 66
    .line 67
    iget v2, p0, Ll/toh0$a;->f:I

    .line 68
    .line 69
    iget-boolean v3, p0, Ll/toh0$a;->g:Z

    .line 70
    .line 71
    invoke-static {v0, p1, v1, v2, v3}, Ll/toh0;->m(Lcom/p1/mobile/putong/data/PushMessage;Landroid/graphics/Bitmap;Landroidx/core/app/NotificationCompat$Builder;IZ)V

    .line 72
    .line 73
    .line 74
    goto/16 :goto_2

    .line 75
    .line 76
    :cond_2
    :goto_0
    new-instance v3, Landroid/widget/RemoteViews;

    .line 77
    .line 78
    sget-object v4, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 79
    .line 80
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    sget v5, Ll/jec0;->P:I

    .line 85
    .line 86
    invoke-direct {v3, v4, v5}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 87
    .line 88
    .line 89
    sget v4, Ll/ycc0;->i0:I

    .line 90
    .line 91
    iget-object v5, p0, Ll/toh0$a;->d:Lcom/p1/mobile/putong/data/PushMessage;

    .line 92
    .line 93
    iget-object v5, v5, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v3, v4, v5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    sget v4, Ll/ycc0;->g0:I

    .line 99
    .line 100
    invoke-virtual {v3, v4, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    sget v4, Ll/ycc0;->h0:I

    .line 104
    .line 105
    invoke-virtual {v3, v4, p1}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 106
    .line 107
    .line 108
    new-instance v4, Landroid/widget/RemoteViews;

    .line 109
    .line 110
    sget-object v5, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 111
    .line 112
    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    sget v6, Ll/jec0;->O:I

    .line 117
    .line 118
    invoke-direct {v4, v5, v6}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 119
    .line 120
    .line 121
    sget v5, Ll/ycc0;->f0:I

    .line 122
    .line 123
    iget-object v6, p0, Ll/toh0$a;->d:Lcom/p1/mobile/putong/data/PushMessage;

    .line 124
    .line 125
    iget-object v6, v6, Lcom/p1/mobile/putong/data/PushMessage;->title:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v4, v5, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 128
    .line 129
    .line 130
    sget v5, Ll/ycc0;->d0:I

    .line 131
    .line 132
    invoke-virtual {v4, v5, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    sget v1, Ll/ycc0;->e0:I

    .line 136
    .line 137
    invoke-virtual {v4, v1, p1}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    if-eqz p1, :cond_3

    .line 145
    .line 146
    sget p1, Ll/ycc0;->i0:I

    .line 147
    .line 148
    invoke-static {}, Ll/toh0;->c()I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    invoke-virtual {v3, p1, v0}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 153
    .line 154
    .line 155
    sget p1, Ll/ycc0;->g0:I

    .line 156
    .line 157
    invoke-static {}, Ll/toh0;->c()I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    invoke-virtual {v3, p1, v0}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 162
    .line 163
    .line 164
    sget p1, Ll/ycc0;->f0:I

    .line 165
    .line 166
    invoke-static {}, Ll/toh0;->c()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    invoke-virtual {v4, p1, v0}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 171
    .line 172
    .line 173
    sget p1, Ll/ycc0;->d0:I

    .line 174
    .line 175
    invoke-static {}, Ll/toh0;->c()I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    invoke-virtual {v4, p1, v0}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_3
    sget p1, Ll/ycc0;->i0:I

    .line 184
    .line 185
    invoke-static {}, Ll/toh0;->b()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    invoke-virtual {v3, p1, v0}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 190
    .line 191
    .line 192
    sget p1, Ll/ycc0;->g0:I

    .line 193
    .line 194
    invoke-static {}, Ll/toh0;->a()I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    invoke-virtual {v3, p1, v0}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 199
    .line 200
    .line 201
    sget p1, Ll/ycc0;->f0:I

    .line 202
    .line 203
    invoke-static {}, Ll/toh0;->b()I

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    invoke-virtual {v4, p1, v0}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 208
    .line 209
    .line 210
    sget p1, Ll/ycc0;->d0:I

    .line 211
    .line 212
    invoke-static {}, Ll/toh0;->a()I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    invoke-virtual {v4, p1, v0}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 217
    .line 218
    .line 219
    :goto_1
    iget-object p1, p0, Ll/toh0$a;->e:Landroidx/core/app/NotificationCompat$Builder;

    .line 220
    .line 221
    invoke-virtual {p1, v4}, Landroidx/core/app/NotificationCompat$Builder;->setCustomBigContentView(Landroid/widget/RemoteViews;)Landroidx/core/app/NotificationCompat$Builder;

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Ll/toh0$a;->e:Landroidx/core/app/NotificationCompat$Builder;

    .line 225
    .line 226
    invoke-virtual {p1, v3}, Landroidx/core/app/NotificationCompat$Builder;->setCustomContentView(Landroid/widget/RemoteViews;)Landroidx/core/app/NotificationCompat$Builder;

    .line 227
    .line 228
    .line 229
    iget-object p1, p0, Ll/toh0$a;->e:Landroidx/core/app/NotificationCompat$Builder;

    .line 230
    .line 231
    new-instance v0, Landroidx/core/app/NotificationCompat$DecoratedCustomViewStyle;

    .line 232
    .line 233
    invoke-direct {v0}, Landroidx/core/app/NotificationCompat$DecoratedCustomViewStyle;-><init>()V

    .line 234
    .line 235
    .line 236
    invoke-virtual {p1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    .line 237
    .line 238
    .line 239
    iget-object p1, p0, Ll/toh0$a;->d:Lcom/p1/mobile/putong/data/PushMessage;

    .line 240
    .line 241
    iget-object v0, p0, Ll/toh0$a;->e:Landroidx/core/app/NotificationCompat$Builder;

    .line 242
    .line 243
    iget v1, p0, Ll/toh0$a;->f:I

    .line 244
    .line 245
    iget-boolean v2, p0, Ll/toh0$a;->g:Z

    .line 246
    .line 247
    const/4 v3, 0x0

    .line 248
    invoke-static {p1, v3, v0, v1, v2}, Ll/toh0;->m(Lcom/p1/mobile/putong/data/PushMessage;Landroid/graphics/Bitmap;Landroidx/core/app/NotificationCompat$Builder;IZ)V

    .line 249
    .line 250
    .line 251
    :cond_4
    :goto_2
    const/4 p1, 0x1

    .line 252
    iput-boolean p1, p0, Ll/toh0$a;->a:Z

    .line 253
    .line 254
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/toh0$a;->a(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
