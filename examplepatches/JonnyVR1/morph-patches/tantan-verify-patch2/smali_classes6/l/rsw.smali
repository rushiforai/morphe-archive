.class public Ll/rsw;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/net/Uri;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/rsw;->f:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    iput-object p2, p0, Ll/rsw;->a:Landroid/net/Uri;

    .line 12
    .line 13
    iput p3, p0, Ll/rsw;->b:I

    .line 14
    .line 15
    iput p4, p0, Ll/rsw;->c:I

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Void;)Landroid/graphics/drawable/Drawable;
    .locals 8

    .line 1
    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput v0, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 8
    .line 9
    iput-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, -0x1

    .line 13
    :try_start_0
    iget-object v2, p0, Ll/rsw;->f:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroid/content/Context;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p0, Ll/rsw;->a:Landroid/net/Uri;

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v2, v0, p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 32
    .line 33
    .line 34
    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 35
    .line 36
    iput v2, p0, Ll/rsw;->d:I

    .line 37
    .line 38
    iget v3, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 39
    .line 40
    iput v3, p0, Ll/rsw;->e:I

    .line 41
    .line 42
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v4}, Ljava/lang/Runtime;->gc()V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v4}, Ljava/lang/Runtime;->maxMemory()J

    .line 54
    .line 55
    .line 56
    move-result-wide v4

    .line 57
    const-wide/16 v6, 0x8

    .line 58
    .line 59
    div-long/2addr v4, v6

    .line 60
    const-wide/16 v6, 0x4

    .line 61
    .line 62
    div-long/2addr v4, v6

    .line 63
    long-to-int v4, v4

    .line 64
    iget v5, p0, Ll/rsw;->b:I

    .line 65
    .line 66
    iget v6, p0, Ll/rsw;->c:I

    .line 67
    .line 68
    mul-int/2addr v5, v6

    .line 69
    mul-int/lit8 v5, v5, 0x4

    .line 70
    .line 71
    invoke-static {v5, v4}, Ljava/lang/Math;->min(II)I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    mul-int/2addr v2, v3

    .line 76
    :goto_0
    if-le v2, v4, :cond_0

    .line 77
    .line 78
    iget v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 79
    .line 80
    mul-int/lit8 v2, v2, 0x2

    .line 81
    .line 82
    iput v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 83
    .line 84
    iget v3, p0, Ll/rsw;->d:I

    .line 85
    .line 86
    div-int/2addr v3, v2

    .line 87
    iget v5, p0, Ll/rsw;->e:I

    .line 88
    .line 89
    div-int/2addr v5, v2

    .line 90
    mul-int v2, v3, v5

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :catch_0
    move-exception p1

    .line 94
    goto :goto_1

    .line 95
    :cond_0
    const/4 v2, 0x0

    .line 96
    iput-boolean v2, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 97
    .line 98
    iget-object v2, p0, Ll/rsw;->f:Ljava/lang/ref/WeakReference;

    .line 99
    .line 100
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    check-cast v2, Landroid/content/Context;

    .line 105
    .line 106
    iget-object v3, p0, Ll/rsw;->a:Landroid/net/Uri;

    .line 107
    .line 108
    invoke-static {v2, v3, p1}, Ll/yb5;->H(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    if-nez p1, :cond_1

    .line 113
    .line 114
    iput v1, p0, Ll/rsw;->d:I

    .line 115
    .line 116
    iput v1, p0, Ll/rsw;->e:I

    .line 117
    .line 118
    return-object v0

    .line 119
    :cond_1
    iget-object v2, p0, Ll/rsw;->f:Ljava/lang/ref/WeakReference;

    .line 120
    .line 121
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    check-cast v2, Landroid/content/Context;

    .line 126
    .line 127
    iget-object v3, p0, Ll/rsw;->a:Landroid/net/Uri;

    .line 128
    .line 129
    invoke-static {v2, v3, p1}, Ll/tvb;->c(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iget v2, p0, Ll/rsw;->d:I

    .line 134
    .line 135
    int-to-float v2, v2

    .line 136
    iget v3, p0, Ll/rsw;->e:I

    .line 137
    .line 138
    int-to-float v3, v3

    .line 139
    div-float/2addr v2, v3

    .line 140
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    int-to-float v3, v3

    .line 145
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    int-to-float v4, v4

    .line 150
    div-float/2addr v3, v4

    .line 151
    const/high16 v4, 0x3f800000    # 1.0f

    .line 152
    .line 153
    cmpg-float v5, v2, v4

    .line 154
    .line 155
    if-gez v5, :cond_2

    .line 156
    .line 157
    cmpl-float v5, v3, v4

    .line 158
    .line 159
    if-gtz v5, :cond_3

    .line 160
    .line 161
    :cond_2
    cmpl-float v2, v2, v4

    .line 162
    .line 163
    if-lez v2, :cond_4

    .line 164
    .line 165
    cmpg-float v2, v3, v4

    .line 166
    .line 167
    if-gez v2, :cond_4

    .line 168
    .line 169
    :cond_3
    iget v2, p0, Ll/rsw;->d:I

    .line 170
    .line 171
    iget v3, p0, Ll/rsw;->e:I

    .line 172
    .line 173
    iput v3, p0, Ll/rsw;->d:I

    .line 174
    .line 175
    iput v2, p0, Ll/rsw;->e:I

    .line 176
    .line 177
    :cond_4
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    .line 178
    .line 179
    iget-object v3, p0, Ll/rsw;->f:Ljava/lang/ref/WeakReference;

    .line 180
    .line 181
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    check-cast v3, Landroid/content/Context;

    .line 186
    .line 187
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    invoke-direct {v2, v3, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 192
    .line 193
    .line 194
    return-object v2

    .line 195
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 196
    .line 197
    .line 198
    iput v1, p0, Ll/rsw;->d:I

    .line 199
    .line 200
    iput v1, p0, Ll/rsw;->e:I

    .line 201
    .line 202
    return-object v0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rsw;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rsw;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rsw;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rsw;->a([Ljava/lang/Void;)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/rsw;->b:I

    .line 2
    .line 3
    return p0
.end method
