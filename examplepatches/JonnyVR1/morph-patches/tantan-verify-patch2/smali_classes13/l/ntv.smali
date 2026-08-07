.class public Ll/ntv;
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

.field public b:Landroid/net/Uri;

.field public c:I

.field public d:I

.field public e:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ntv;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ntv;->b:Landroid/net/Uri;

    .line 7
    .line 8
    iput p3, p0, Ll/ntv;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/ntv;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public varargs a([Ljava/lang/Void;)Ljava/lang/Throwable;
    .locals 6

    .line 1
    :try_start_0
    invoke-static {}, Ll/tvb;->h()Ll/tvb;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/ntv;->a:Landroid/content/Context;

    .line 6
    .line 7
    iget-object v2, p0, Ll/ntv;->b:Landroid/net/Uri;

    .line 8
    .line 9
    iget v3, p0, Ll/ntv;->c:I

    .line 10
    .line 11
    iget v4, p0, Ll/ntv;->d:I

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    invoke-virtual/range {v0 .. v5}, Ll/tvb;->n(Landroid/content/Context;Landroid/net/Uri;III)Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/ntv;->e:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    new-instance p0, Ljava/lang/NullPointerException;

    .line 23
    .line 24
    const-string p1, "Failed to load bitmap"

    .line 25
    .line 26
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/p1/mobile/android/ui/cropiwa/TooLargeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return-object p0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    move-object p0, v0

    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return-object p0

    .line 38
    :catch_1
    move-exception v0

    .line 39
    move-object p0, v0

    .line 40
    return-object p0

    .line 41
    :catch_2
    move-exception v0

    .line 42
    move-object p0, v0

    .line 43
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    return-object p0
.end method

.method public b(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/tvb;->h()Ll/tvb;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/ntv;->b:Landroid/net/Uri;

    .line 6
    .line 7
    iget-object p0, p0, Ll/ntv;->e:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p0, p1}, Ll/tvb;->o(Landroid/net/Uri;Landroid/graphics/Bitmap;Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ntv;->a([Ljava/lang/Void;)Ljava/lang/Throwable;

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
    invoke-virtual {p0, p1}, Ll/ntv;->b(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
