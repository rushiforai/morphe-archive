.class Lcom/clevertap/android/sdk/gif/GifImageView$a;
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
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView$a;->a:Lcom/clevertap/android/sdk/gif/GifImageView;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView$a;->a:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/clevertap/android/sdk/gif/GifImageView;->f(Lcom/clevertap/android/sdk/gif/GifImageView;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView$a;->a:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/clevertap/android/sdk/gif/GifImageView;->g(Lcom/clevertap/android/sdk/gif/GifImageView;Lcom/clevertap/android/sdk/gif/a;)Lcom/clevertap/android/sdk/gif/a;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView$a;->a:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/clevertap/android/sdk/gif/GifImageView;->h(Lcom/clevertap/android/sdk/gif/GifImageView;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/GifImageView$a;->a:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p0, v0}, Lcom/clevertap/android/sdk/gif/GifImageView;->i(Lcom/clevertap/android/sdk/gif/GifImageView;Z)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method
