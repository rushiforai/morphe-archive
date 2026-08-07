.class public Lv/fresco/subscaleview/SubsamplingScaleImageView$e;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/fresco/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
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
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/kid<",
            "+",
            "Ll/rhm;",
            ">;>;"
        }
    .end annotation
.end field

.field public final d:Landroid/net/Uri;

.field public final e:Z

.field public f:Landroid/graphics/Bitmap;

.field public g:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Ll/kid;Landroid/net/Uri;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/fresco/subscaleview/SubsamplingScaleImageView;",
            "Landroid/content/Context;",
            "Ll/kid<",
            "+",
            "Ll/rhm;",
            ">;",
            "Landroid/net/Uri;",
            "Z)V"
        }
    .end annotation

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
    iput-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->b:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->c:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    iput-object p4, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->d:Landroid/net/Uri;

    .line 26
    .line 27
    iput-boolean p5, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->e:Z

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 5

    .line 1
    :try_start_0
    iget-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->d:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->b:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/content/Context;

    .line 14
    .line 15
    iget-object v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->c:Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/kid;

    .line 22
    .line 23
    iget-object v2, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->a:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    const-string v3, "BitmapLoadTask.doInBackground"

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    new-array v4, v4, [Ljava/lang/Object;

    .line 41
    .line 42
    invoke-static {v2, v3, v4}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->A(Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {v1}, Ll/kid;->a()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Ll/rhm;

    .line 50
    .line 51
    iget-object v3, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->d:Landroid/net/Uri;

    .line 52
    .line 53
    invoke-interface {v1, v0, v3}, Ll/rhm;->a(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Bitmap;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->f:Landroid/graphics/Bitmap;

    .line 58
    .line 59
    invoke-static {v2, v0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->E(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    return-object p0

    .line 68
    :catch_0
    move-exception p1

    .line 69
    goto :goto_0

    .line 70
    :catch_1
    move-exception p1

    .line 71
    goto :goto_1

    .line 72
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ljava/lang/RuntimeException;

    .line 76
    .line 77
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->g:Ljava/lang/Exception;

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->g:Ljava/lang/Exception;

    .line 87
    .line 88
    :cond_0
    :goto_2
    const/4 p0, 0x0

    .line 89
    return-object p0
.end method

.method public b(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->a:Ljava/lang/ref/WeakReference;

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
    if-eqz v0, :cond_3

    .line 10
    .line 11
    iget-object v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->f:Landroid/graphics/Bitmap;

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-boolean p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->e:Z

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-static {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->I(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/graphics/Bitmap;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-static {v0, v1, p0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->H(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/graphics/Bitmap;IZ)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    iget-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->g:Ljava/lang/Exception;

    .line 35
    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->d(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Lv/fresco/subscaleview/SubsamplingScaleImageView$h;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p1, :cond_3

    .line 43
    .line 44
    iget-boolean p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->e:Z

    .line 45
    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->d(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Lv/fresco/subscaleview/SubsamplingScaleImageView$h;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->g:Ljava/lang/Exception;

    .line 53
    .line 54
    invoke-interface {p1, p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView$h;->c(Ljava/lang/Exception;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    invoke-static {v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->d(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Lv/fresco/subscaleview/SubsamplingScaleImageView$h;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->g:Ljava/lang/Exception;

    .line 63
    .line 64
    invoke-interface {p1, p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView$h;->f(Ljava/lang/Exception;)V

    .line 65
    .line 66
    .line 67
    :cond_3
    return-void
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->a([Ljava/lang/Void;)Ljava/lang/Integer;

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
    check-cast p1, Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$e;->b(Ljava/lang/Integer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
