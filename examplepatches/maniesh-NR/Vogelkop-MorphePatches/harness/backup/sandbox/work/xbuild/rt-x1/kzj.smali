.class public final synthetic Lkzj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:Lcom/opera/android/favorites/SpeedDialDataFetcher;

.field public final synthetic b:Landroid/graphics/Bitmap;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/favorites/SpeedDialDataFetcher;Landroid/graphics/Bitmap;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkzj;->a:Lcom/opera/android/favorites/SpeedDialDataFetcher;

    iput-object p2, p0, Lkzj;->b:Landroid/graphics/Bitmap;

    iput-boolean p3, p0, Lkzj;->c:Z

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 9

    iget-object v0, p0, Lkzj;->a:Lcom/opera/android/favorites/SpeedDialDataFetcher;

    iget-object v1, v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->a:Landroid/content/Context;

    iget v2, v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->e:I

    iget v3, v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->f:I

    iget-object v4, p0, Lkzj;->b:Landroid/graphics/Bitmap;

    invoke-static {v2, v3, v1, v4}, Lcom/opera/android/webapps/ShortcutHelper;->c(IILandroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_11

    return-object v1

    :cond_11
    iget-byte v1, v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->d:B

    if-eqz v1, :cond_4f

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1c

    iget-boolean p0, p0, Lkzj;->c:Z

    if-nez p0, :cond_4f

    :cond_1c
    iget-object v1, v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->a:Landroid/content/Context;

    iget-object v2, v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->c:Ljava/lang/String;

    iget v4, v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->e:I

    sget p0, Lvmj;->g:I

    sget-object v6, Lna5;->b:Lna5;

    const/4 v7, 0x0

    sget-object v3, Lumj;->a:Lumj;

    move v5, v4

    invoke-static/range {v1 .. v7}, Ltmj;->l(Landroid/content/Context;Ljava/lang/String;Lumj;IILna5;Z)Lvmj;

    move-result-object p0

    iget-object v0, p0, Lvmj;->f:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_3c

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_3c

    return-object v0

    :cond_3c
    iget v0, p0, Lvmj;->a:I

    iget v1, p0, Lvmj;->b:I

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v1}, Lvmj;->a(Landroid/graphics/Canvas;)V

    return-object v0

    :cond_4f
    const/4 p0, 0x0

    return-object p0
.end method
