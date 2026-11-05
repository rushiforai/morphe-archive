.class public Le/e/a/y0$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/y0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Ljava/lang/Integer;

.field public b:Ljava/lang/String;

.field public final synthetic c:Le/e/a/y0;


# virtual methods
.method public run()V
    .registers 10

    sget-object v0, Le/e/a/y0;->f:Le/e/a/y0$a;

    iget-object v1, p0, Le/e/a/y0$c;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ld/e/f;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    if-eqz v0, :cond_12

    :try_start_c
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_4b

    :cond_12
    new-instance v1, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Le/e/a/y0$c;->c:Le/e/a/y0;

    .line 1
    iget-object v3, v3, Le/e/a/y0;->e:Landroid/content/Context;

    .line 2
    invoke-static {v3}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/nicoid/nicoid_cache/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Le/e/a/y0$c;->b:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".thm"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_4b

    new-instance v2, Le/e/a/CacheInputStream;

    invoke-direct {v2, v1}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_49} :catch_4a

    goto :goto_4b

    :catch_4a
    nop

    :cond_4b
    :goto_4b
    if-eqz v0, :cond_66

    iget-object v7, p0, Le/e/a/y0$c;->c:Le/e/a/y0;

    new-instance v8, Le/e/a/y0$e;

    iget-object v3, p0, Le/e/a/y0$c;->b:Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p0, Le/e/a/y0$c;->a:Ljava/lang/Integer;

    move-object v1, v8

    move-object v2, v7

    move-object v6, v0

    invoke-direct/range {v1 .. v6}, Le/e/a/y0$e;-><init>(Le/e/a/y0;Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/Integer;Landroid/graphics/Bitmap;)V

    invoke-virtual {v7, v8}, Le/e/a/y0;->b(Ljava/lang/Runnable;)V

    sget-object v1, Le/e/a/y0;->f:Le/e/a/y0$a;

    iget-object v2, p0, Le/e/a/y0$c;->b:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ld/e/f;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_66
    sget-object v0, Le/e/a/y0;->g:Ljava/util/HashMap;

    iget-object v1, p0, Le/e/a/y0$c;->b:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
