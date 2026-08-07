.class Lcom/clevertap/android/sdk/gif/GifImageView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/clevertap/android/sdk/gif/GifImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/clevertap/android/sdk/gif/GifImageView;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/gif/GifImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView$b;->a:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView$b;->a:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/clevertap/android/sdk/gif/GifImageView;->d(Lcom/clevertap/android/sdk/gif/GifImageView;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView$b;->a:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/clevertap/android/sdk/gif/GifImageView;->d(Lcom/clevertap/android/sdk/gif/GifImageView;)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/GifImageView$b;->a:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/clevertap/android/sdk/gif/GifImageView;->d(Lcom/clevertap/android/sdk/gif/GifImageView;)Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
