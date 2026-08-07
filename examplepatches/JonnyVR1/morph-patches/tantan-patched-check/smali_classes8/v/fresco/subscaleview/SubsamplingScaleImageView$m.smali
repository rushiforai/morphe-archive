.class public Lv/fresco/subscaleview/SubsamplingScaleImageView$m;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/fresco/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "m"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "[I>;"
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
            "Ll/akm;",
            ">;>;"
        }
    .end annotation
.end field

.field public final d:Landroid/net/Uri;

.field public e:Ll/akm;

.field public f:Ljava/lang/Exception;


# direct methods
.method public constructor <init>(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Ll/kid;Landroid/net/Uri;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/fresco/subscaleview/SubsamplingScaleImageView;",
            "Landroid/content/Context;",
            "Ll/kid<",
            "+",
            "Ll/akm;",
            ">;",
            "Landroid/net/Uri;",
            ")V"
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
    iput-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->b:Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->c:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    iput-object p4, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->d:Landroid/net/Uri;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Void;)[I
    .locals 5

    .line 1
    :try_start_0
    iget-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->d:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->b:Ljava/lang/ref/WeakReference;

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
    iget-object v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->c:Ljava/lang/ref/WeakReference;

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
    iget-object v2, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->a:Ljava/lang/ref/WeakReference;

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
    if-eqz v0, :cond_1

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    const-string v3, "TilesInitTask.doInBackground"

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
    check-cast v1, Ll/akm;

    .line 50
    .line 51
    iput-object v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->e:Ll/akm;

    .line 52
    .line 53
    iget-object v3, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->d:Landroid/net/Uri;

    .line 54
    .line 55
    invoke-interface {v1, v0, v3}, Ll/akm;->a(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Point;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget v3, v1, Landroid/graphics/Point;->x:I

    .line 60
    .line 61
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 62
    .line 63
    invoke-static {v2, v0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->E(Lv/fresco/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    invoke-static {v2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->j(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/Rect;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    if-eqz v0, :cond_0

    .line 72
    .line 73
    invoke-static {v2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->j(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/Rect;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    invoke-static {v2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->j(Lv/fresco/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/Rect;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    goto :goto_0

    .line 90
    :catch_0
    move-exception p1

    .line 91
    goto :goto_1

    .line 92
    :cond_0
    :goto_0
    filled-new-array {v3, v1, p1}, [I

    .line 93
    .line 94
    .line 95
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    return-object p0

    .line 97
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    iput-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->f:Ljava/lang/Exception;

    .line 101
    .line 102
    :cond_1
    const/4 p0, 0x0

    .line 103
    return-object p0
.end method

.method public b([I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->a:Ljava/lang/ref/WeakReference;

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
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->e:Ll/akm;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    array-length v2, p1

    .line 18
    const/4 v3, 0x3

    .line 19
    if-ne v2, v3, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    aget p0, p1, p0

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    aget v2, p1, v2

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    aget p1, p1, v3

    .line 29
    .line 30
    invoke-static {v0, v1, p0, v2, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->K(Lv/fresco/subscaleview/SubsamplingScaleImageView;Ll/akm;III)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object p1, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->f:Ljava/lang/Exception;

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
    iget-object p0, p0, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->f:Ljava/lang/Exception;

    .line 49
    .line 50
    invoke-interface {p1, p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView$h;->f(Ljava/lang/Exception;)V

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
    invoke-virtual {p0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->a([Ljava/lang/Void;)[I

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
    check-cast p1, [I

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView$m;->b([I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
