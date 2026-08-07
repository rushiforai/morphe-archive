.class public Ll/rvb;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Ll/qvb;

.field public c:Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaShapeMask;

.field public d:Landroid/net/Uri;

.field public e:Ll/ewb;

.field public f:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/qvb;Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaShapeMask;Landroid/net/Uri;Ll/ewb;Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rvb;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rvb;->b:Ll/qvb;

    .line 7
    .line 8
    iput-object p3, p0, Ll/rvb;->c:Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaShapeMask;

    .line 9
    .line 10
    iput-object p4, p0, Ll/rvb;->d:Landroid/net/Uri;

    .line 11
    .line 12
    iput-object p5, p0, Ll/rvb;->e:Ll/ewb;

    .line 13
    .line 14
    iput-object p6, p0, Ll/rvb;->f:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Void;)Ljava/lang/Throwable;
    .locals 7

    .line 1
    const-string p1, "CropIwaResultReceiver"

    .line 2
    .line 3
    const-string v0, "CropImageTask-doInBackground"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-static {}, Ll/tvb;->h()Ll/tvb;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v2, p0, Ll/rvb;->a:Landroid/content/Context;

    .line 13
    .line 14
    iget-object v3, p0, Ll/rvb;->d:Landroid/net/Uri;

    .line 15
    .line 16
    iget-object p1, p0, Ll/rvb;->e:Ll/ewb;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/ewb;->k()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    iget-object p1, p0, Ll/rvb;->e:Ll/ewb;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/ewb;->i()I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    iget-object p1, p0, Ll/rvb;->f:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->getImageViewRotation()I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    invoke-virtual/range {v1 .. v6}, Ll/tvb;->n(Landroid/content/Context;Landroid/net/Uri;III)Landroid/graphics/Bitmap;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    new-instance p0, Ljava/lang/NullPointerException;

    .line 41
    .line 42
    const-string p1, "Failed to load bitmap"

    .line 43
    .line 44
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_0
    iget-object v0, p0, Ll/rvb;->b:Ll/qvb;

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ll/qvb;->a(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Ll/rvb;->c:Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaShapeMask;

    .line 55
    .line 56
    invoke-interface {v1, v0}, Lcom/p1/mobile/android/ui/cropiwa/shape/CropIwaShapeMask;->applyMaskTo(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Ll/rvb;->e:Ll/ewb;

    .line 61
    .line 62
    invoke-virtual {v1}, Ll/ewb;->h()Landroid/net/Uri;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iget-object v2, p0, Ll/rvb;->a:Landroid/content/Context;

    .line 67
    .line 68
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v2, v1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    iget-object v3, p0, Ll/rvb;->e:Ll/ewb;

    .line 77
    .line 78
    invoke-virtual {v3}, Ll/ewb;->g()Landroid/graphics/Bitmap$CompressFormat;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    iget-object v4, p0, Ll/rvb;->e:Ll/ewb;

    .line 83
    .line 84
    invoke-virtual {v4, v0}, Ll/ewb;->j(Landroid/graphics/Bitmap;)I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    invoke-virtual {v0, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/rvb;->d:Landroid/net/Uri;

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const/4 v3, 0x0

    .line 102
    invoke-static {p0, v1, v3}, Ll/t7f;->b(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 103
    .line 104
    .line 105
    invoke-static {v2}, Ll/gwb;->b(Ljava/io/Closeable;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/p1/mobile/android/ui/cropiwa/TooLargeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .line 113
    .line 114
    const/4 p0, 0x0

    .line 115
    return-object p0

    .line 116
    :catch_0
    move-exception v0

    .line 117
    move-object p0, v0

    .line 118
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    return-object p0

    .line 122
    :catch_1
    move-exception v0

    .line 123
    move-object p0, v0

    .line 124
    return-object p0

    .line 125
    :catch_2
    move-exception v0

    .line 126
    move-object p0, v0

    .line 127
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 128
    .line 129
    .line 130
    return-object p0

    .line 131
    :catch_3
    move-exception v0

    .line 132
    move-object p0, v0

    .line 133
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 134
    .line 135
    .line 136
    return-object p0
.end method

.method public b(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const-string v0, "CropIwaResultReceiver"

    .line 2
    .line 3
    const-string v1, "CropImageTask-onPostExecute"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/rvb;->a:Landroid/content/Context;

    .line 11
    .line 12
    iget-object p0, p0, Ll/rvb;->e:Ll/ewb;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ewb;->h()Landroid/net/Uri;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p1, p0}, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->onCropCompleted(Landroid/content/Context;Landroid/net/Uri;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    instance-of v0, p1, Ljava/lang/IllegalArgumentException;

    .line 23
    .line 24
    iget-object p0, p0, Ll/rvb;->a:Landroid/content/Context;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->onCropInvalid(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    invoke-static {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/image/CropIwaResultReceiver;->onCropFailed(Landroid/content/Context;Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rvb;->a([Ljava/lang/Void;)Ljava/lang/Throwable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Throwable;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rvb;->b(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
