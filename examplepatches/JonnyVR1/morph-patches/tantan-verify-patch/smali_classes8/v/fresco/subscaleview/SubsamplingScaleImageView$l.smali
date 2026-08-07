.class public Lv/fresco/subscaleview/SubsamplingScaleImageView$l;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/fresco/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "l"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lv/fresco/subscaleview/SubsamplingScaleImageView;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/akm;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lv/fresco/subscaleview/SubsamplingScaleImageView$k;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Lv/fresco/subscaleview/SubsamplingScaleImageView;Ll/akm;Lv/fresco/subscaleview/SubsamplingScaleImageView$k;)V
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
    iput-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->b:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->c:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    invoke-static {p3, p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->j(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .locals 5

    .line 1
    :try_start_0
    iget-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 8
    .line 9
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->b:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/akm;

    .line 16
    .line 17
    iget-object v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->c:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ll/akm;->b()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-static {v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->g(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    const-string v2, "TileLoadTask.doInBackground, tile.sRect=%s, tile.sampleSize=%d"

    .line 44
    .line 45
    invoke-static {v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->d(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;)Landroid/graphics/Rect;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->e(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;)I

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-static {p1, v2, v3}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->A(Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->b(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    :try_start_1
    invoke-static {v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->d(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;)Landroid/graphics/Rect;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-static {v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->b(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;)Landroid/graphics/Rect;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-static {p1, v3, v4}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->C(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->j(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/Rect;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    if-eqz v3, :cond_0

    .line 85
    .line 86
    invoke-static {v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->b(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;)Landroid/graphics/Rect;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-static {p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->j(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/Rect;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    iget v4, v4, Landroid/graphics/Rect;->left:I

    .line 95
    .line 96
    invoke-static {p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->j(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/Rect;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 101
    .line 102
    invoke-virtual {v3, v4, p1}, Landroid/graphics/Rect;->offset(II)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :catchall_0
    move-exception p1

    .line 107
    goto :goto_1

    .line 108
    :cond_0
    :goto_0
    invoke-static {v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->b(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;)Landroid/graphics/Rect;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-static {v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->e(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;)I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    invoke-interface {v0, p1, v1}, Ll/akm;->c(Landroid/graphics/Rect;I)Landroid/graphics/Bitmap;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    monitor-exit v2

    .line 121
    return-object p1

    .line 122
    :goto_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 123
    :try_start_2
    throw p1

    .line 124
    :catch_0
    move-exception p1

    .line 125
    goto :goto_2

    .line 126
    :catch_1
    move-exception p1

    .line 127
    goto :goto_3

    .line 128
    :cond_1
    if-eqz v1, :cond_2

    .line 129
    .line 130
    const/4 p1, 0x0

    .line 131
    invoke-static {v1, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->j(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_0

    .line 132
    .line 133
    .line 134
    goto :goto_4

    .line 135
    :goto_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 136
    .line 137
    .line 138
    new-instance v0, Ljava/lang/RuntimeException;

    .line 139
    .line 140
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 141
    .line 142
    .line 143
    iput-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->d:Ljava/lang/Exception;

    .line 144
    .line 145
    goto :goto_4

    .line 146
    :goto_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 147
    .line 148
    .line 149
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->d:Ljava/lang/Exception;

    .line 150
    .line 151
    :cond_2
    :goto_4
    const/4 p0, 0x0

    .line 152
    return-object p0
.end method

.method public b(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 8
    .line 9
    iget-object v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->c:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-static {v1, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->h(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;Landroid/graphics/Bitmap;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    invoke-static {v1, p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView$k;->j(Lv/fresco/subscaleview/SubsamplingScaleImageView$k;Z)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->J(Lv/fresco/subscaleview/SubsamplingScaleImageView;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->d:Ljava/lang/Exception;

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->d(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Lv/fresco/subscaleview/SubsamplingScaleImageView$h;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->d(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Lv/fresco/subscaleview/SubsamplingScaleImageView$h;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->d:Ljava/lang/Exception;

    .line 49
    .line 50
    invoke-interface {p1, p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView$h;->d(Ljava/lang/Exception;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->a([Ljava/lang/Void;)Landroid/graphics/Bitmap;

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
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$l;->b(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
