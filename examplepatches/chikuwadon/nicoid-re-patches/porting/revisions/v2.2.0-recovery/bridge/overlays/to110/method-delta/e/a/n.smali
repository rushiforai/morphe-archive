.class public final Le/a/n;
.super Landroid/widget/ImageView;
.source ""


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/a/n$b;
    }
.end annotation


# static fields
.field public static o:Landroid/graphics/Bitmap;

.field public static p:Landroid/graphics/Bitmap;

.field public static q:Le/a/n$b;


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Z

.field public i:F

.field public j:Z

.field public k:Landroid/os/Handler;

.field public final l:Landroid/graphics/drawable/ColorDrawable;

.field public m:Z

.field public n:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;F)V
    .registers 5

    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Le/a/n;->l:Landroid/graphics/drawable/ColorDrawable;

    new-instance v0, Le/a/n$a;

    invoke-direct {v0, p0}, Le/a/n$a;-><init>(Le/a/n;)V

    iput-object v0, p0, Le/a/n;->n:Landroid/view/View$OnClickListener;

    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Le/a/n;->k:Landroid/os/Handler;

    iput p2, p0, Le/a/n;->i:F

    .line 1
    iget p1, p0, Le/a/n;->i:F

    const/high16 p2, 0x41600000    # 14.0f

    mul-float p2, p2, p1

    float-to-int p2, p2

    iput p2, p0, Le/a/n;->a:I

    iput p2, p0, Le/a/n;->b:I

    const/high16 v0, 0x428c0000    # 70.0f

    mul-float v0, v0, p1

    float-to-int v0, v0

    iput v0, p0, Le/a/n;->c:I

    iput p2, p0, Le/a/n;->d:I

    const/high16 p2, 0x41b00000    # 22.0f

    mul-float p1, p1, p2

    float-to-int p1, p1

    iput p1, p0, Le/a/n;->e:I

    iput p1, p0, Le/a/n;->f:I

    sget-object p1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lnicoid/network238/ReadOnlyConnection239;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/16 v1, 0x1388

    :try_start_1
    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_0

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    if-eqz v1, :cond_5

    :goto_0
    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7

    goto :goto_5

    :catchall_0
    move-exception v0

    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    goto :goto_1

    :catch_0
    nop

    goto :goto_2

    :catch_1
    nop

    goto :goto_3

    :cond_0
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_5

    :catchall_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-object v1, v0

    goto :goto_2

    :catch_3
    move-object v1, v0

    goto :goto_3

    :catchall_2
    move-exception p0

    move-object v1, p0

    move-object p0, v0

    :goto_1
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_1
    if-eqz v0, :cond_2

    :try_start_4
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    :catch_4
    :cond_2
    throw v1

    :catch_5
    move-object p0, v0

    move-object v1, p0

    :goto_2
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_3
    if-eqz v1, :cond_5

    goto :goto_4

    :catch_6
    move-object p0, v0

    move-object v1, p0

    :goto_3
    if-eqz p0, :cond_4

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_4
    if-eqz v1, :cond_5

    :goto_4
    goto :goto_0

    :catch_7
    :cond_5
    :goto_5
    return-object v0
.end method


# virtual methods
.method public a()V
    .registers 10

    invoke-virtual {p0}, Le/a/n;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Le/a/n;->e:I

    iget v7, p0, Le/a/n;->f:I

    new-instance v8, Landroid/graphics/drawable/InsetDrawable;

    iget-object v2, p0, Le/a/n;->l:Landroid/graphics/drawable/ColorDrawable;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, v8

    move v3, v0

    move v6, v7

    invoke-direct/range {v1 .. v6}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    invoke-virtual {p0, v8}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v2, p0, Le/a/n;->a:I

    add-int/2addr v2, v0

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget v0, p0, Le/a/n;->b:I

    add-int/2addr v0, v7

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    sget-object v0, Le/a/n;->p:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/a/n;->g:Z

    return-void
.end method

.method public final b()Z
    .registers 2

    sget-object v0, Le/a/n;->o:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    sget-object v0, Le/a/n;->p:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public final declared-synchronized c()V
    .registers 3

    monitor-enter p0

    :try_start_0
    sget-object v0, Le/a/n;->q:Le/a/n$b;

    if-nez v0, :cond_0

    new-instance v0, Le/a/n$b;

    invoke-direct {v0, p0, p0}, Le/a/n$b;-><init>(Le/a/n;Le/a/n;)V

    sput-object v0, Le/a/n;->q:Le/a/n$b;

    sget-object v0, Le/a/n;->q:Le/a/n$b;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_0
    sget-object v0, Le/a/n;->q:Le/a/n$b;

    .line 1
    iget-object v0, v0, Le/a/n$b;->a:Ljava/util/HashSet;

    invoke-virtual {v0, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final d()V
    .registers 4

    :try_start_0
    const-string v0, "http://www.amoad.com/sp/guideline/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v0, 0x10000000

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/a/n;->m:Z

    iget-object v0, p0, Le/a/n;->n:Landroid/view/View$OnClickListener;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Le/a/n;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Le/a/n;->c()V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Le/a/n;->a()V

    :goto_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 4

    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/a/n;->m:Z

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageView;->clearAnimation()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v2, v1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    :cond_0
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method
